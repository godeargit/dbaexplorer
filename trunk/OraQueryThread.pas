unit OraQueryThread;

interface

uses
   Windows, Messages, Db, Classes,  SysUtils, Ora, OraClasses, OraBarConn, forms, OraError;

const
  WM_ORA_THREAD_NOTIFY = WM_USER+100;

  // Thread notification events
  MQE_INITED = 0;       // initialized
  MQE_STARTED = 1;      // query started
  MQE_SUCCESS = 2;      // query finished
  MQE_FAIL = 3;         // query finished

type
   TOraQueryThread = class(TThread)
    private
      FDataSource : TDataSource;
      FOraSession : TOraSession;
      FDataSet: TOraQuery;
      FSql : String;
      FQuery: TOraQuery;
      FStatus: Integer;
      FCancelled : boolean;
      FQueryException : string;
      FException : Exception;
    protected
      procedure Execute; override;
      procedure SetDataSet;
      procedure ShowQryError;
    public
      constructor Create (ADataSource: TDataSource; AOraSession: TOraSession; ASql : String);  overload;
      constructor Create (AOraSession: TOraSession; ASql : String; var Error: string);  overload;
      procedure CancelQuery;
      destructor Destroy; override;
      property Status : Integer read FStatus write FStatus;
      property QueryException : string read FQueryException;
      property Session : TOraSession read FOraSession write FOraSession;
      property Query: TOraQuery read FQuery;
      property DataSource: TDataSource read FDataSource;
  end;


  implementation

uses
 Dialogs, Util;


constructor TOraQueryThread.Create(ADataSource: TDataSource; AOraSession: TOraSession; ASql : String);
begin
  Inherited Create(True);
  FDataSource := ADataSource;
  FSql := ASql;
  FOraSession := AOraSession;
  FCancelled := false;
  FStatus := MQE_INITED;
  FQueryException := '';
  FreeOnTerminate := True;
  Resume;
end;

constructor TOraQueryThread.Create (AOraSession: TOraSession; ASql : String; var Error: string);
begin
  Inherited Create(True);
  FDataSet := TOraQuery.Create(nil);
  FSql := ASql;
  FOraSession := AOraSession;
  FCancelled := false;
  FStatus := MQE_INITED;
  FQueryException := Error;
  FreeOnTerminate := True;
  Resume;
end;

destructor TOraQueryThread.Destroy;
begin
 // FreeAndNil (FQuery);
  inherited Destroy;
end;

procedure TOraQueryThread.CancelQuery;
begin
  FCancelled := true;
  try
    FOraSession.Disconnect;
  finally
    Application.ProcessMessages;
    if not FOraSession.Connected then FOraSession.Connect;
    FQuery := nil;
  end;
  Application.ProcessMessages; 
end;


procedure TOraQueryThread.Execute;
begin
  try
    if not FOraSession.Connected then
      FOraSession.Connect();
  except
     on E: Exception do
      begin
        FException := ExceptObject as Exception;
        Synchronize(ShowQryError);
        exit;
      end;
  end;

  if FOraSession.Connected then
  begin
    try
      FStatus := MQE_STARTED;
      FQuery := TOraQuery.Create(nil);
      FQuery.Session := FOraSession;
      FQuery.SQL.Text := FSql;
      FQuery.FetchRows := 500;
      FQueryException := '';
      
      if ExpectResultSet(FSql) then
      begin
         FQuery.Open;
         Synchronize(SetDataSet);
      end
      else
         FQuery.ExecSQL();
         
      FStatus := MQE_SUCCESS;
    except
      on E: Exception do
        begin
          FException := ExceptObject as Exception;
          Synchronize(ShowQryError);
          abort;
        end;
      on E: EOraError do
      begin
          FException := ExceptObject as Exception;
          Synchronize(ShowQryError);
          abort;
      end;
    end;
  end;
end;

procedure TOraQueryThread.SetDataSet;
begin
  if assigned(FDataSource) then
     FDataSource.Dataset := FQuery
  else
     FDataSet.Assign(FQuery);
end;

procedure TOraQueryThread.ShowQryError;
begin
  FDataSet := nil;
  FQueryException := FException.Message;
  FStatus := MQE_FAIL;
  //Application.ShowException(FException);

//  raise Exception.Create(FException.Message);

  {
 try
    inherited;
  except
    on E: EOraError do begin
      raise EOraError.Create(E.ErrorCode, E.Message);
    end
    else
      raise;
  end;
  }

end;


end.



