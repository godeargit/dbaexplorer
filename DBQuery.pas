{
	DBAExplorer - Oracle Admin Management Tool
    Copyright (C) 2008  Alpaslan KILICKAYA

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit DBQuery;

interface

uses Windows, Messages, Classes, Db, Ora, DBQueryThread, OraClasses, OraBarConn, OraError, Forms;

const

  // Query execution mode
  MQM_SYNC = 0;
  MQM_ASYNC = 1;

  // Query status notification mode
  MQN_EVENTPROC = 0;  // via event procedure with Synchronize
  MQN_WINMESSAGE = 1; // via window message WM_MYSQL_THREAD_NOTIFY

  // Thread notification events
  MQE_INITED = 0;       // initialized
  MQE_STARTED = 1;      // query started
  MQE_FINISHED = 2;     // query finished
  MQE_FREED = 3;        // object removed from memory

  // Query result codes
  MQR_NOTHING = 0;      // no result yet
  MQR_SUCCESS = 1;      // success
  MQR_CONNECT_FAIL = 2; // done with error
  MQR_QUERY_FAIL = 3;   // done with error
  MQR_CANCEL = 4;



type
  TDBQuery = class;

  TDBQueryNotificationEvent = procedure (ASender : TDBQuery; AEvent : Integer) of object;

  TDBQuery = class
    private
      FQueryResult  : TThreadResult;
      FDBSession : TOraSession;
      FDBDataset : TDataset;
      FThreadID  : Integer;
      FSyncMode  : Integer;
      FQueryThread : TDBQueryThread;
      FEventName : String;
      FSql : String;
      FOnNotify : TDBQueryNotificationEvent;
      FRowsAffected: integer;
      function GetNotificationMode: Integer;
      function GetSessionID: Integer;
      function GetComment: String;
      function GetResult: Integer;
      function GetHasresultSet: Boolean;
    protected

    public
      constructor Create (AOwner : TComponent; ADBSession : TOraSession);
      destructor Destroy (); override;
      procedure Query (ASql : String; AMode : Integer = MQM_SYNC; ANotifyWndHandle : THandle = 0);
      procedure SetDBDataset(ADataset : TDataset);
      procedure PostNotification (AQueryResult : TThreadResult; AEvent : Integer);
      procedure SetThreadResult(AResult : TThreadResult);
      procedure Stop;
      procedure SetRowsAffected(rows: integer);

      property Result : Integer read GetResult;                 // Query result code
      property Comment : String read GetComment;                // Textual information about the query result, includes error description
      property SessionID : Integer read GetSessionID;     // Mysql Session ID
      property DBSession : TOraSession read FDBSession;
      property DBDataset : TDataset read FDBDataset;            // Resultset
      property HasResultset : Boolean read GetHasresultSet;     // Indicator of resultset availability
      property ThreadID : Integer read FThreadID;               // Mysql query thread ID (on the clients os)
      property Sql : String read FSql;                          // Query string
      property EventName : String read FEventName;              // Operating system event name used for blocking mode
      property NotificationMode : Integer read GetNotificationMode;
      property OnNotify : TDBQueryNotificationEvent read FOnNotify write FOnNotify; // Event procedure used in MQN_EVENTPROC notification mode
      property RowsAffected: integer read FRowsAffected write FRowsAffected;
  end;

  function ExecQueryAsync(ASql : String; ADBSession : TOraSession; ANotifyProc : TDBQueryNotificationEvent = nil; AWndHandle : THandle = 0) : TDBQuery;
  function ExecDBStatementBlocking(ASql : String; ADBSession : TOraSession; AWndHandle : THandle) : TDBQuery;

  function ExecSQL(SQL, Msg: string; FOraSession: TOraSession; AWndHandle : THandle; var FRecCount: integer): boolean; overload;
  function ExecSQL(SQL, Msg: string; FOraSession: TOraSession; AWndHandle : THandle): boolean; overload;
  function ExecSQL(SQL, Msg: string; FOraSession: TOraSession): boolean; overload;
  function ExecSQL(SQL, Msg: string; FOraSession: TOraSession; var FRecCount: integer): boolean; overload;

  function ExecQuery(SQL, Msg: string; ResultDataSet: TDataSource; FOraSession: TOraSession): boolean;  overload;
  function ExecQuery(SQL, Msg: string; ResultDataSet: TDataSource; FOraSession: TOraSession; AWndHandle : THandle): boolean; overload;
  
implementation

uses
  SysUtils,
  Dialogs,
  frmSchemaBrowser;

{******************************************************************************}
{                          ExecSQL                                             }
{******************************************************************************}
function ExecSQL(SQL, Msg: string; FOraSession: TOraSession; var FRecCount: integer): boolean;
begin
  result := ExecSQL(SQL, Msg, FOraSession, TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).Handle, FRecCount);
end;

function ExecSQL(SQL, Msg: string; FOraSession: TOraSession): boolean;
begin
  if TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild) <> nil then
     result := ExecSQL(SQL, Msg, FOraSession, TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).Handle)
  else
     result := ExecSQL(SQL, Msg, FOraSession, Application.Handle);
end;

function ExecSQL(SQL, Msg: string; FOraSession: TOraSession; AWndHandle : THandle): boolean;
var
  FRecCount: integer;
begin
  result := ExecSQL(SQL, Msg, FOraSession , AWndHandle, FRecCount);
end;

function ExecSQL(SQL, Msg: string; FOraSession: TOraSession; AWndHandle : THandle; var FRecCount: integer): boolean;
var
  qSQL : TDBQuery;
begin
  qSQL := ExecQueryAsync(SQL, FOraSession, nil, AWndHandle); //TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).Handle);
  while not (qSQL.Result >= 1) do Application.ProcessMessages;

  if qSQL.Result in [MQR_CONNECT_FAIL,MQR_QUERY_FAIL] then
  begin
    MessageDlg(qSQL.Comment, mtError, [mbOK], 0 );
    if Application.MainForm.ActiveMDIChild is TSchemaBrowserFrm then
       TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).LogSQL(qSQL.Comment);
    result := false;
  end else
  begin
    if Msg <> '' then
    begin
      MessageDlg(Msg, mtInformation, [mbOK], 0 );
      if Application.MainForm.ActiveMDIChild is TSchemaBrowserFrm then
         TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).LogSQL(Msg);
    end;
    result := true;
    if (qSQL.HasResultset) and (pos('count(*)',SQL)>0) then
        FRecCount := qSQL.DBDataset.Fields[0].AsInteger;
  end;
end;

{******************************************************************************}
{                          ExecSQL                                             }
{******************************************************************************}

function ExecQuery(SQL, Msg: string; ResultDataSet: TDataSource; FOraSession: TOraSession): boolean;
begin
  if TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild) <> nil then
     result := ExecQuery(SQL, Msg, ResultDataSet, FOraSession, TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).Handle)
  else
     result := ExecQuery(SQL, Msg, ResultDataSet, FOraSession, Application.Handle);
end;

function ExecQuery(SQL, Msg: string; ResultDataSet: TDataSource; FOraSession: TOraSession; AWndHandle : THandle): boolean;
var
  qSQL : TDBQuery;
begin
  qSQL := ExecQueryAsync(SQL, FOraSession, nil, AWndHandle);
  while not (qSQL.Result >= 1) do Application.ProcessMessages;

  if qSQL.Result in [MQR_CONNECT_FAIL,MQR_QUERY_FAIL] then
  begin
    MessageDlg(qSQL.Comment, mtError, [mbOK], 0 );
    if Application.MainForm.ActiveMDIChild is TSchemaBrowserFrm then
         TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).LogSQL(Msg);
    result := false;
  end else
  begin
    if Msg <> '' then
    begin
      MessageDlg(Msg, mtInformation, [mbOK], 0 );
      if Application.MainForm.ActiveMDIChild is TSchemaBrowserFrm then
         TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).LogSQL(Msg);
    end;
    result := true;
    if (qSQL.HasResultset) then
       ResultDataSet.DataSet := qSQL.DBDataset;
  end;
end;




function ExecQueryAsync(ASql : String; ADBSession : TOraSession; ANotifyProc : TDBQueryNotificationEvent; AWndHandle : THandle) : TDBQuery;
begin
  Result := TDBQuery.Create(nil, ADBSession);
  Result.OnNotify := ANotifyProc;
  Result.Query(ASql,MQM_ASYNC,AWndHandle);
end;

function ExecDBStatementBlocking(ASql : String; ADBSession : TOraSession; AWndHandle : THandle) : TDBQuery;
begin
  Result := TDBQuery.Create(nil, ADBSession);
  Result.Query(ASql,MQM_SYNC,AWndHandle);
end;

constructor TDBQuery.Create(AOwner: TComponent; ADBSession : TOraSession);
begin
  FDBSession := ADBSession;
  ZeroMemory (@FQueryResult,SizeOf(FQueryResult));
  FSql := '';
  FDBDataset := nil;
end;

destructor TDBQuery.Destroy;
begin
  //FreeAndNil (FDBDataset);
  // Only free the Session object if we first created it
  inherited;
end;

function TDBQuery.GetComment: String;
begin
  Result := FQueryResult.Comment;  
end;

function TDBQuery.GetSessionID: Integer;
begin
  Result := FQueryResult.SessionID;
end;

function TDBQuery.GetHasresultSet: Boolean;
begin
  Result := FDBDataset <> nil;
end;

function TDBQuery.GetNotificationMode: Integer;
begin
  if Assigned(FOnNotify) then
    Result := MQN_EVENTPROC
  else
    Result := MQN_WINMESSAGE;
end;

function TDBQuery.GetResult: Integer;
begin
  Result := 0;
  try
    if self = nil then exit;
    Result := FQueryResult.Result;
  except
  end;
end;

procedure TDBQuery.PostNotification(AQueryResult: TThreadResult; AEvent : Integer);
begin
  SetThreadResult(AQueryResult);

  if
    (FSyncMode = MQM_ASYNC) and
    (AEvent in [MQE_INITED,MQE_STARTED,MQE_FINISHED,MQE_FREED]) and
    Assigned(FOnNotify) then begin
      //debug(Format('thr: Calling notify function, event type %d occurred.', [AEvent]));
      FOnNotify(Self, AEvent);
    end else begin
      //debug(Format('thr: Not calling notify function, event type %d occurred.', [AEvent]));
    end;
end;

procedure TDBQuery.Query(ASql: String; AMode: Integer; ANotifyWndHandle : THandle);
var
  EventHandle : THandle;
begin
  // create thread object
  FQueryThread := TDBQueryThread.Create(Self, FDBSession, ASql, AMode);
  FQueryThread.NotifyWndHandle := ANotifyWndHandle;
  FThreadID := FQueryThread.ThreadID;
  FEventName := 'DBManager'+'_'+IntToStr(FThreadID);
  FSyncMode := AMode;
  FSql := ASql;

  case AMode of
    MQM_SYNC:
      begin
        // create mutex
        EventHandle := CreateEvent (nil,False,False,PChar(FEventName));
        // exec query
        //debug(Format('thr: Starting query thread %d', [FQueryThread.ThreadID]));
        FQueryThread.Resume();
        //debug(Format('thr: Waiting for query thread %d', [FQueryThread.ThreadID]));
        WaitForSingleObject (EventHandle, INFINITE);
        //debug(Format('thr: Done waiting for query thread %d', [FQueryThread.ThreadID]));
        CloseHandle (EventHandle);
        // read status
        // free thread
      end;
    MQM_ASYNC:
      begin
        // exec query
        //debug(Format('thr: Starting query thread %d', [FQueryThread.ThreadID]));
        FQueryThread.Resume();
      end;
  end;
end;

procedure TDBQuery.Stop;
begin
  if FQueryThread = nil then exit;
  FQueryThread.Terminate;
  try
    FreeAndNil(FQueryThread);//ak
  except
     //on E: Exception do ShowMessage(E.Message);
  end;
end;

procedure TDBQuery.SetDBDataset(ADataset: TDataset);
begin
  FDBDataset := ADataset;
end;

procedure TDBQuery.SetThreadResult(AResult: TThreadResult);
begin
  FQueryResult := AResult;
end;

procedure TDBQuery.SetRowsAffected(rows: integer);
begin
  FRowsAffected := rows;
end;

end.
