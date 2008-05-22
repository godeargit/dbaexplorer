unit DBQueryThread;

interface

uses
  Windows, Messages, Forms, Db, Classes, Ora, StdCtrls, SysUtils, OraStorage, OraScript, OraError;

const
  WM_MYSQL_THREAD_NOTIFY = WM_USER+100;

type


  TThreadResult = record
    ThreadID : Integer;
    SessionID : Cardinal;
    Action : Integer;
    Sql : String;
    Result : Integer;
    Comment : String;
  end;


  TDBQueryThread = class(TThread)
    private
      FDBSession : TOraSession;
      FOwner : TObject;                //->> TDBQuery object
      FSql : String;
      FResult : Integer;
      FComment : String;
      FSyncMode : Integer;
      FNotifyWndHandle : THandle;
      procedure ReportInit;
      procedure ReportStart;
      procedure ReportFinished;
      procedure ReportFreed;
      function  GetExceptionData(AException : Exception) : TExceptionData;
    protected
      procedure Execute; override;
      procedure SetState (AResult : Integer; AComment : String);
      procedure SetNotifyWndHandle (Value : THandle);
      procedure NotifyStatus (AEvent : Integer);
      procedure NotifyStatusViaEventProc (AEvent : Integer);
      procedure NotifyStatusViaWinMessage (AEvent : Integer);
      function AssembleResult () : TThreadResult;
      function RunDataQuery (ASql : String; var ADataset : TDataset; out AExceptionData : TExceptionData) : Boolean;
      function RunUpdateQuery (ASql : String; out AExceptionData : TExceptionData) : Boolean;
      function RunExecQuery(ASql: String; out AExceptionData : TExceptionData): Boolean;
      function QuerySingleCellAsInteger (ASql : String) : Integer;
      procedure osError(Sender: TObject; E: Exception; SQL: String; var Action: TErrorAction);

    public
      constructor Create (AOwner : TObject; ADBSession : TOraSession; ASql : String; ASyncMode : Integer);
      destructor Destroy; override;
      property NotifyWndHandle : THandle read FNotifyWndHandle write SetNotifyWndHandle;
  end;

implementation

uses
  DBQuery, Dialogs, util ;

function TDBQueryThread.AssembleResult: TThreadResult;
begin
  ZeroMemory (@Result,SizeOf(Result));

  Result.ThreadID := ThreadID;
  Result.SessionID := 1;
  Result.Action := 1;
  Result.Sql := FSql;
  Result.Result := FResult;
  Result.Comment := FComment;
end;

constructor TDBQueryThread.Create(AOwner : TObject; ADBSession : TOraSession; ASql : String; ASyncMode : Integer);
begin
  Inherited Create(True);

  FOwner := AOwner;
  FDBSession := ADBSession;
  FSyncMode := ASyncMode;
  FResult := 0;
  FSql := ASql;

  FreeOnTerminate := True;
end;

destructor TDBQueryThread.Destroy;
begin
  inherited;
end;

procedure TDBQueryThread.NotifyStatus(AEvent: Integer);
var
  h : THandle;
begin
  if Terminated then exit;
  if (FSyncMode=MQM_SYNC) and (AEvent=MQE_FREED) then
    begin
      h := OpenEvent (EVENT_ALL_ACCESS,False,PChar(TDBQuery(FOwner).EventName));

      if h<>0 then
        SetEvent (h);
    end;

  case TDBQuery(FOwner).NotificationMode of
    MQN_EVENTPROC:  NotifyStatusViaEventProc(AEvent);
    MQN_WINMESSAGE: NotifyStatusViaWinMessage(AEvent);
  end;
end;

procedure TDBQueryThread.NotifyStatusViaEventProc(AEvent: Integer);
begin
  if FSyncMode=MQM_ASYNC then
    begin
      case AEvent of
        MQE_INITED:     Synchronize(ReportInit);
        MQE_STARTED:    Synchronize(ReportStart);
        MQE_FINISHED:   Synchronize(ReportFinished);
        MQE_FREED:      Synchronize(ReportFreed);
      end;
    end;
end;

procedure TDBQueryThread.NotifyStatusViaWinMessage(AEvent: Integer);
var
  qr : TThreadResult;
begin
  qr := AssembleResult();
  //debug(Format('thr: Setting result and posting status %d via WM_MYSQL_THREAD_NOTIFY message', [AEvent]));
  TDBQuery(FOwner).SetThreadResult(qr);
  PostMessage(FNotifyWndHandle,WM_MYSQL_THREAD_NOTIFY,Integer(FOwner),AEvent);
end;

procedure TDBQueryThread.Execute;
var
  q : TOraQuery;
  r : Boolean;
  e : TExceptionData;
begin
  //debug(Format('thr: Thread %d running...', [ThreadID]));
  NotifyStatus(MQE_INITED);

  try
    if not FDBSession.Connected then
      FDBSession.Connect();
  except
    on E: Exception do
      begin
        SetState (MQR_CONNECT_FAIL,Format('%s',[E.Message]));
      end;
  end;

  if FDBSession.Connected then
    begin
      NotifyStatus (MQE_STARTED);

      if ExpectResultSet(FSql) then
        begin
          q := nil;
          r := RunDataQuery (FSql,TDataSet(q),e);

          if r then
            begin
              if q.State=dsBrowse then
                begin
                  // WTF?
                end;
            end;

          TDBQuery(FOwner).SetDBDataset(q);
        end
      else
      begin
        if ExpectScriptSet(FSql) then
          r := RunExecQuery (FSql,e)
        else
          r := RunUpdateQuery (FSql,e);
      end;

      if r then
        SetState (MQR_SUCCESS, 'SUCCESS')
      else
        SetState (MQR_QUERY_FAIL, e.Msg);
    end;

  if Terminated then SetState (MQR_CANCEL, 'CANCELLED');

  NotifyStatus (MQE_FINISHED);
  NotifyStatus (MQE_FREED);
  debug(Format('thr: Thread %d suspending.', [ThreadID]));
end;


function TDBQueryThread.GetExceptionData(
  AException: Exception): TExceptionData;
begin
  ZeroMemory (@Result,SizeOf(Result));
  Result.Msg := AException.Message;
  Result.HelpContext := AException.HelpContext;
end;

function TDBQueryThread.QuerySingleCellAsInteger(ASql: String): Integer;
var
  ds : TDataSet;
  e : TExceptionData;
begin
  Result := 0;

  if RunDataQuery(ASql,ds,e) then
    begin
      if ds.Fields.Count > 0 then
        Result := ds.Fields[0].AsInteger;
      FreeAndNil (ds);
    end;
end;

procedure TDBQueryThread.ReportStart();
var
  qr : TThreadResult;
begin
  qr := AssembleResult();

  if FOwner <> nil then
    TDBQuery (FOwner).PostNotification(qr,MQE_STARTED);
end;

procedure TDBQueryThread.ReportFinished();
var
  qr : TThreadResult;
begin
  qr := AssembleResult();

  if FOwner <> nil then
    TDBQuery (FOwner).PostNotification(qr,MQE_FINISHED);
end;

procedure TDBQueryThread.ReportInit();
var
  qr : TThreadResult;
begin
  qr := AssembleResult();

  if FOwner <> nil then
    TDBQuery(FOwner).PostNotification(qr,MQE_INITED);
end;

procedure TDBQueryThread.ReportFreed;
var
  qr : TThreadResult;
begin
  qr := AssembleResult();

  if FOwner <> nil then
    TDBQuery(FOwner).PostNotification(qr,MQE_FREED);
end;

function TDBQueryThread.RunDataQuery(ASql: String;
  var ADataset: TDataset; out AExceptionData : TExceptionData): Boolean;
var
  q : TOraQuery;
begin
  Result := False;
  q := TOraQuery.Create(nil);
  q.Session := FDBSession;
  q.SQL.Text := ASql;
  q.FetchRows := 500;
  try
    q.Active := True;
    ADataset := q;
    Result := True;
  except
    on E: Exception do
      begin
        AExceptionData := GetExceptionData(E);
      end;
  end;
end;

function TDBQueryThread.RunUpdateQuery(ASql: String; out AExceptionData : TExceptionData): Boolean;
var
  q : TOraQuery;
begin
  Result := False;
  q := TOraQuery.Create(nil);
  q.Session := FDBSession;
  q.AutoCommit := false;
  q.CachedUpdates := true;
  q.SQL.Text := ASql;
  try
    q.ExecSQL();
    Result := True;
    TDBQuery(FOwner).SetRowsAffected(q.rowsaffected);
  except
    On E: Exception do
      AExceptionData := GetExceptionData(E);
  end;
  FreeAndNil (q);
end;


function TDBQueryThread.RunExecQuery(ASql: String; out AExceptionData : TExceptionData): Boolean;
var
  q : TOraScript;
begin
  Result := False;
  q := TOraScript.Create(nil);
  q.Session := FDBSession;
  q.OnError := osError;
  q.SQL.Text := ASql;
  try
    q.Execute;
    Result := True;
    TDBQuery(FOwner).SetRowsAffected(0);
  except
    On E: EOraError do
      AExceptionData := GetExceptionData(E);
  end;
  FreeAndNil (q);
end;

procedure TDBQueryThread.osError(Sender: TObject; E: Exception;
  SQL: String; var Action: TErrorAction);
begin
  Action := eaFail; //hatanýn RunExecQuery düþmesi için
end;

procedure TDBQueryThread.SetNotifyWndHandle(Value: THandle);
begin
  FNotifyWndHandle := Value;
end;

procedure TDBQueryThread.SetState(AResult: Integer; AComment: String);
begin
  FResult := AResult;
  FComment := AComment;
end;

end.
