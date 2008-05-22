unit frmSQLEditorFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,QDialogs,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxTextEdit, cxMemo,
  cxRichEdit, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  cxContainer, cxGroupBox, dxStatusBar, DBAccess, Ora, OraBarConn, Contnrs,
  StdCtrls, ComCtrls, RichEdit, MemDS, VirtualTable, Grids, DBGrids,
  ExtCtrls, DBCtrls, OraErrHand, OraError, DBQuery, OraScript, cxTreeView,
  cxTL, cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCalendar, dxBar,
  GenelDM, dxBarExtItems;

type
  TSQLEditorFrameFrm = class(TForm)
    sqlSession: TOraSession;
    pc: TcxPageControl;
    tsResult: TcxTabSheet;
    tsExplainPlan: TcxTabSheet;
    tsDBMSOutput: TcxTabSheet;
    cxSplitter1: TcxSplitter;
    SQLEditor: TRichEdit;
    cxTabSheet2: TcxTabSheet;
    GridIndex: TcxGrid;
    GridIndexDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    tHistory: TVirtualTable;
    dsHistory: TDataSource;
    tHistoryCONNECTION: TStringField;
    tHistoryStatus: TIntegerField;
    tHistoryHISTORY_ID: TIntegerField;
    tHistoryROWS_PROCESSED: TFloatField;
    tHistorySQL: TMemoField;
    GridIndexDBTableView1HISTORY_ID: TcxGridDBColumn;
    GridIndexDBTableView1CONNECTION: TcxGridDBColumn;
    GridIndexDBTableView1STATUS: TcxGridDBColumn;
    GridIndexDBTableView1START_TIME: TcxGridDBColumn;
    GridIndexDBTableView1STOP_TIME: TcxGridDBColumn;
    GridIndexDBTableView1EXECUTION_TIME: TcxGridDBColumn;
    GridIndexDBTableView1ROWS_PROCESSED: TcxGridDBColumn;
    GridIndexDBTableView1SQL: TcxGridDBColumn;
    tHistorySTART_TIME: TTimeField;
    tHistorySTOP_TIME: TTimeField;
    tHistoryEXECUTION_TIME: TStringField;
    DBGrid1: TDBGrid;
    dsSQL: TDataSource;
    tHistorySQL_RESULT: TMemoField;
    GridIndexDBTableView1SQL_RESULT: TcxGridDBColumn;
    redtSQLResult: TRichEdit;
    cxSplitter2: TcxSplitter;
    treeListExplain: TcxDBTreeList;
    dsPlanTable: TDataSource;
    cxDBTreeList1POSITION: TcxDBTreeListColumn;
    cxDBTreeList1COST: TcxDBTreeListColumn;
    cxDBTreeList1CARDINALITY: TcxDBTreeListColumn;
    cxDBTreeList1BYTES: TcxDBTreeListColumn;
    cxDBTreeList1STEP_NAME: TcxDBTreeListColumn;
    spDbms_output: TOraStoredProc;
    redtDBMS_output: TcxRichEdit;
    tDbMS_output: TTimer;
    dxBarDockControl1: TdxBarDockControl;
    dxBarManager1: TdxBarManager;
    btnTurnOutputOn: TdxBarButton;
    btnClearWindows: TdxBarButton;
    btnSetBufferSize: TdxBarButton;
    btnSaveToFile: TdxBarButton;
    lblSeconds: TdxBarStatic;
    btnFrequency: TdxBarSpinEdit;
    sdDBMS: TSaveDialog;
    vtPlanTable: TVirtualTable;
    vtPlanTableID: TIntegerField;
    vtPlanTablePARENT_ID: TIntegerField;
    vtPlanTablePOSITION: TIntegerField;
    vtPlanTableOPERATION: TStringField;
    vtPlanTableOPTIONS: TStringField;
    vtPlanTableOPTIMIZER: TStringField;
    vtPlanTableOBJECT_NAME: TStringField;
    vtPlanTableCARDINALITY: TFloatField;
    vtPlanTableBYTES: TFloatField;
    vtPlanTableCOST: TFloatField;
    vtPlanTableOBJECT_NODE: TStringField;
    vtPlanTableOTHER_TAG: TStringField;
    vtPlanTableDISTRIBUTION: TStringField;
    vtPlanTablePARTITION_START: TStringField;
    vtPlanTablePARTITION_STOP: TStringField;
    vtPlanTableSTEP_NAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SQLEditorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure GridIndexDBTableView1DblClick(Sender: TObject);
    procedure dsSQLStateChange(Sender: TObject);
    procedure dsSQLDataChange(Sender: TObject; Field: TField);
    procedure dsHistoryStateChange(Sender: TObject);
    procedure dsHistoryDataChange(Sender: TObject; Field: TField);
    procedure tDbMS_outputTimer(Sender: TObject);
    procedure btnTurnOutputOnClick(Sender: TObject);
    procedure btnClearWindowsClick(Sender: TObject);
    procedure btnSetBufferSizeClick(Sender: TObject);
    procedure btnSaveToFileClick(Sender: TObject);
  private
    { Private declarations }
    FParentForm : TForm;
    FFileName: string;
    LastExecutionTime: string;
    qSQL : TDBQuery;
    DBMS_OUTPUT_BufferSize: integer;
    procedure SetFileName(Value: string);
  public
    { Public declarations }
    procedure Init(ABarConnection : TBarConnection);
    procedure setEditorAttributes;

    procedure NextHistory;
    procedure PriorHistory;
    procedure ExecSQL(ds: TDataSource; Log: Boolean = true; ASQL: string = ''); overload;
    procedure ExecSQL; overload;
    procedure StopSQL;
    procedure Commit;
    procedure Rollback;
    procedure ExplainPlan;

    property FileName: string read FFileName write SetFileName;
    property LocalHistory: TVirtualTable read tHistory;
    property ParentForm: TForm read FParentForm write FParentForm;

  end;

var
  SQLEditorFrameFrm: TSQLEditorFrameFrm;


implementation

{$R *.dfm}

uses frmSQLEditor, DateUtils, Util, VisualOptions;

procedure TSQLEditorFrameFrm.Init(ABarConnection : TBarConnection);
begin
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  pc.ActivePage := tsResult;
  Caption := '<No name>';
  SQLEditor.Modified;
  LastExecutionTime := '';
  DBMS_OUTPUT_BufferSize := 20000;
  try
    sqlSession.Username := ABarConnection.Session.Username;
    sqlSession.Password := ABarConnection.Session.Password;
    sqlSession.Server := ABarConnection.Session.Server;
    sqlSession.ConnectString := ABarConnection.Session.ConnectString;
    sqlSession.HomeName := ABarConnection.Session.HomeName;
    sqlSession.ConnectMode := ABarConnection.Session.ConnectMode;
    sqlSession.LoginPrompt := false;
    sqlSession.Connect;

    spDbms_output.Session := sqlSession;
  except
    on E : Exception do
    begin
      ShowMessage(E.Message);
      Close;
    end;
  end;
  tHistory.Open;
  vtPlanTable.Open;  
end;

procedure TSQLEditorFrameFrm.ExecSQL;
begin
  pc.ActivePage := tsResult;
  ExecSQL(dsSQL,true,'');
end;

procedure TSQLEditorFrameFrm.ExecSQL(ds: TDataSource; Log: Boolean = true; ASQL: string = '');
var
  recCount: integer;
  stopTime: TDateTime;
  FSQL: string;
begin
  if ds <> nil then
     ds.DataSet := nil;

  if ASQL <> '' then FSQL := ASQL
  else
  begin
    if length(SQLEditor.SelText) > 0 then
       FSQL := SQLEditor.SelText
        else FSQL := SQLEditor.Text;
  end;

  if FSQL = '' then exit;
  TSQLEditorFrm(FParentForm).QueryRunning(True);
  TSQLEditorFrm(FParentForm).SetRecToStatusBar(0, 0, '', '',true);

  //TSQLEditorFrm(Application.MainForm.ActiveMDIChild).QueryRunning(True);
  //TSQLEditorFrm(Application.MainForm.ActiveMDIChild).SetRecToStatusBar(0, 0, '', '',true);

  if Log then
  begin
    tHistory.Append;
    tHistory.FieldByName('HISTORY_ID').AsInteger := tHistory.RecordCount + 1;
    tHistory.FieldByName('CONNECTION').AsString := sqlSession.Server+'/'+sqlSession.Username;
    tHistory.FieldByName('STATUS').AsInteger := 0; //running
    tHistory.FieldByName('START_TIME').AsDateTime :=  Now;
    tHistory.FieldByName('SQL').AsString := FSQL;
    tHistory.FieldByName('SQL_RESULT').AsString := 'RUNNING';
    tHistory.Post;
  end;

  qSQL := ExecQueryAsync(FSQL, sqlSession, nil, self.Handle);//FProgressForm.Handle);
  while not (qSQL.Result >= 1) do Application.ProcessMessages;

  TSQLEditorFrm(FParentForm).QueryRunning(False);
  //TSQLEditorFrm(Application.MainForm.ActiveMDIChild).QueryRunning(False);
  stopTime := now;

  if qSQL = nil then
  begin
    if Log then
    begin
      tHistory.Edit;
      tHistory.FieldByName('STATUS').AsInteger := 4;
      tHistory.FieldByName('STOP_TIME').AsDateTime := stopTime;
      tHistory.FieldByName('EXECUTION_TIME').AsString := FloatToStr(MilliSecondsBetween(tHistory.FieldByName('STOP_TIME').AsDateTime, tHistory.FieldByName('START_TIME').AsDateTime))+' msecs';
      tHistory.FieldByName('ROWS_PROCESSED').AsFloat := 0;
      tHistory.FieldByName('SQL_RESULT').AsString := 'CANCELLED';
      tHistory.Post;
      tHistory.Last;
      TSQLEditorFrm(FParentForm).AddHistory(FSQL);
      //TSQLEditorFrm(Application.MainForm.ActiveMDIChild).AddHistory(FSQL);
    end;
    exit;
  end;

  if qSQL.Result in [MQR_CONNECT_FAIL,MQR_QUERY_FAIL] then
  begin
    if ds <> nil then
       ds.DataSet := nil;
    recCount := 0;
    MessageDlg(qSQL.Comment, mtError, [mbOK], 0 );
    TSQLEditorFrm(FParentForm).LogSQL(qSQL.Comment);
    //TSQLEditorFrm(Application.MainForm.ActiveMDIChild).LogSQL(qSQL.Comment);
  end else
  begin
     Show;
     if qSQL.HasResultset then
     begin
       ds.DataSet := qSQL.DBDataset;
       recCount := qSQL.DBDataset.RecordCount;
     end else
     begin
       recCount := qSQL.RowsAffected;
       TSQLEditorFrm(FParentForm).SetRecToStatusBar(recCount, 0, '', '',false);
       //TSQLEditorFrm(Application.MainForm.ActiveMDIChild).SetRecToStatusBar(recCount, 0, '', '',false);
     end;
  end;

  if Log then
  begin
    tHistory.Edit;
    tHistory.FieldByName('STATUS').AsInteger := qSQL.Result;
    tHistory.FieldByName('STOP_TIME').AsDateTime := stopTime;
    tHistory.FieldByName('EXECUTION_TIME').AsString := FloatToStr(MilliSecondsBetween(tHistory.FieldByName('STOP_TIME').AsDateTime, tHistory.FieldByName('START_TIME').AsDateTime))+' msecs';
    tHistory.FieldByName('ROWS_PROCESSED').AsFloat := recCount;
    tHistory.FieldByName('SQL_RESULT').AsString := qSQL.Comment;
    tHistory.Post;
    tHistory.Last;

    TSQLEditorFrm(FParentForm).AddHistory(FSQL);
    //TSQLEditorFrm(Application.MainForm.ActiveMDIChild).AddHistory(FSQL);
  end;

  LastExecutionTime := tHistory.FieldByName('EXECUTION_TIME').AsString;

  FreeAndNil(qSQL);
end;


procedure TSQLEditorFrameFrm.StopSQL;
begin
  if qSQL = nil then exit;
  if qSQL.Result >= 1 then exit; 
  qSQL.Stop;
  dsSQL.DataSet := nil;
  FreeAndNil(qSQL);  
end;

procedure TSQLEditorFrameFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    StopSQL;
    Application.ProcessMessages;
  finally
    qSQL.Free;
  end;
end;

procedure TSQLEditorFrameFrm.Commit;
begin
  ExecSQL(nil, false, 'COMMIT');
  TSQLEditorFrm(FParentForm).SetRecToStatusBar(0, 0, '', 'Commit executed at '+DateTimeToStr(now),false);
  //TSQLEditorFrm(Application.MainForm.ActiveMDIChild).SetRecToStatusBar(0, 0, '', 'Commit executed at '+DateTimeToStr(now),false);
end;

procedure TSQLEditorFrameFrm.Rollback;
begin
  ExecSQL(nil, false, 'ROLLBACK');
  TSQLEditorFrm(FParentForm).SetRecToStatusBar(0, 0, '', 'Rollback executed at '+DateTimeToStr(now),false);
  //TSQLEditorFrm(Application.MainForm.ActiveMDIChild).SetRecToStatusBar(0, 0, '', 'Rollback executed at '+DateTimeToStr(now),false);
end;

{****************************  EXPLAIN PLAN *********************************}

procedure TSQLEditorFrameFrm.ExplainPlan;
var
  step: string;
  id: string;
  d: TDataSource;
  FSQL: string;
begin
  pc.ActivePage := tsExplainPlan;

  if vtPlanTable.RecordCount > 0 then
      while not vtPlanTable.Eof do  vtPlanTable.Delete;

  if trim(SQLEditor.Text) = '' then exit;
  id := sqlSession.Username+FloatToStr(random(10000000));

  if length(SQLEditor.SelText) > 0 then
     FSQL := SQLEditor.SelText
  else FSQL := SQLEditor.Text;


  ExecSQL(nil, false, 'EXPLAIN PLAN SET STATEMENT_ID = '+Str(id)+' into PLAN_TABLE FOR '+FSQL);

  d := TDataSource.Create(nil);
  ExecSQL(d, false, 'SELECT * from PLAN_TABLE WHERE STATEMENT_ID = '+Str(id)+' ORDER BY ID,POSITION ');

  with d.DataSet do
  begin
    while not Eof do
    begin
      vtPlanTable.Append;
      step := '';

      vtPlanTable.FieldByName('ID').AsInteger := FieldByName('ID').AsInteger;
      vtPlanTable.FieldByName('PARENT_ID').AsInteger := FieldByName('PARENT_ID').AsInteger;
      vtPlanTable.FieldByName('POSITION').AsInteger := FieldByName('POSITION').AsInteger;
      step := FieldByName('OPERATION').AsString;
      if FieldByName('OPTIONS').AsString <> '' then
         step := step +' '+FieldByName('OPTIONS').AsString;
      if (FieldByName('ID').AsInteger = 0) and (FieldByName('OPTIMIZER').AsString <> '') then
         step := step +' '+' Optinizer Mode='+FieldByName('OPTIMIZER').AsString;
      vtPlanTable.FieldByName('STEP_NAME').AsString :=  step;
      if FieldByName('OBJECT_NAME').AsString <> '' then
         vtPlanTable.FieldByName('OBJECT_NAME').AsString := FieldByName('OBJECT_OWNER').AsString+'.'+FieldByName('OBJECT_NAME').AsString;
      vtPlanTable.FieldByName('cardinality').AsFloat := FieldByName('cardinality').AsFloat / 1000; //Kilobyte
      vtPlanTable.FieldByName('BYTES').AsFloat := FieldByName('BYTES').AsFloat / 1000; //Kilobyte
      vtPlanTable.FieldByName('COST').AsFloat := FieldByName('COST').AsFloat / 1000; //Kilobyte
      vtPlanTable.FieldByName('OBJECT_NODE').AsString := FieldByName('OBJECT_NODE').AsString;
      vtPlanTable.FieldByName('OTHER_tag').AsString := FieldByName('OTHER_tag').AsString;
      vtPlanTable.FieldByName('distribution').AsString := FieldByName('distribution').AsString;
      vtPlanTable.FieldByName('partition_start').AsString := FieldByName('partition_start').AsString;
      vtPlanTable.FieldByName('partition_stop').AsString := FieldByName('partition_stop').AsString;
      vtPlanTable.post;
      next;
    end;
  end;
  ExecSQL(nil, false, 'ROLLBACK');
end;


{****************************  EDITOR OPTIONS *********************************}

procedure TSQLEditorFrameFrm.SetFileName(Value: string);
begin
  FFileName := Value;
  Caption := FFileName;
end;

procedure TSQLEditorFrameFrm.SQLEditorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
     SQLEditorFrm.SQLEditorPopupMenu.PopupFromCursorPos;
end;

procedure TSQLEditorFrameFrm.FormCreate(Sender: TObject);
begin
  sqlSession.Connected := false;
  {SQLEditor.OnChange := TSQLEditorFrm(Application.MainForm.ActiveMDIChild).EditorChange;
  SQLEditor.OnSelectionChange := TSQLEditorFrm(Application.MainForm.ActiveMDIChild).EditorSelectionChange;
  SQLEditor.OnDragDrop := TSQLEditorFrm(Application.MainForm.ActiveMDIChild).EditorDragDrop;
  SQLEditor.OnDragOver := TSQLEditorFrm(Application.MainForm.ActiveMDIChild).EditorDragOver;
  SQLEditor.OnStartDrag := TSQLEditorFrm(Application.MainForm.ActiveMDIChild).EditorStartDrag;
  SQLEditor.OnEndDrag := TSQLEditorFrm(Application.MainForm.ActiveMDIChild).EditorEndDrag;}
  SQLEditor.Modified;
end;

procedure TSQLEditorFrameFrm.setEditorAttributes;
begin
  SQLEditor.OnChange := TSQLEditorFrm(FParentForm).EditorChange;
  SQLEditor.OnSelectionChange := TSQLEditorFrm(FParentForm).EditorSelectionChange;
  SQLEditor.OnDragDrop := TSQLEditorFrm(FParentForm).EditorDragDrop;
  SQLEditor.OnDragOver := TSQLEditorFrm(FParentForm).EditorDragOver;
  SQLEditor.OnStartDrag := TSQLEditorFrm(FParentForm).EditorStartDrag;
  SQLEditor.OnEndDrag := TSQLEditorFrm(FParentForm).EditorEndDrag;
end;

procedure TSQLEditorFrameFrm.FormActivate(Sender: TObject);
begin
  SQLEditor.OnChange(SQLEditor);
  //b uraya aktýf query calýsýyorsa maýne býldýrmesý saðlanacak
end;

procedure TSQLEditorFrameFrm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  Res: Integer;
begin
  if SQLEditor.Modified then
  begin
    Res := Application.MessageBox(
      PChar(Format('Do you want to save the changes you made to "%s"?', [Caption])),
      PChar(Application.Title), MB_ICONQUESTION or MB_YESNOCANCEL);
    case Res of
      ID_YES: CanClose := TSQLEditorFrm(FParentForm).SaveFile(False);
      //ID_YES: CanClose := TSQLEditorFrm(Application.MainForm.ActiveMDIChild).SaveFile(False);
      ID_NO: CanClose := True;
      ID_CANCEL: CanClose := False;
    end;
  end;
end;


procedure TSQLEditorFrameFrm.NextHistory;
begin
  if THistory.Eof then exit;
  THistory.Next;
  SQLEditor.Lines.Text := THistory.FieldByName('SQL').AsString;
end;

procedure TSQLEditorFrameFrm.PriorHistory;
begin
  if THistory.RecNo = 1 then exit;
  THistory.Prior;
  SQLEditor.Lines.Text := THistory.FieldByName('SQL').AsString;
end;


procedure TSQLEditorFrameFrm.GridIndexDBTableView1DblClick(
  Sender: TObject);
begin
  SQLEditor.Lines.Text := THistory.FieldByName('SQL').AsString;
end;

procedure TSQLEditorFrameFrm.dsSQLStateChange(Sender: TObject);
begin
  TSQLEditorFrm(FParentForm).SetRecToStatusBar(0, 0, '', '',true);
  //TSQLEditorFrm(Application.MainForm.ActiveMDIChild).SetRecToStatusBar(0, 0, '', '',true);
  if dsSQL = nil then exit;
  if dsSQL.DataSet = nil then exit;
  TSQLEditorFrm(FParentForm).SetRecToStatusBar(dsSQL.DataSet.RecordCount, dsSQL.DataSet.RecNo, '', LastExecutionTime, true);
  //TSQLEditorFrm(Application.MainForm.ActiveMDIChild).SetRecToStatusBar(dsSQL.DataSet.RecordCount, dsSQL.DataSet.RecNo, '', LastExecutionTime, true);
end;

procedure TSQLEditorFrameFrm.dsSQLDataChange(Sender: TObject; Field: TField);
begin
  dsSQLStateChange(nil);
end;

procedure TSQLEditorFrameFrm.dsHistoryStateChange(Sender: TObject);
begin
  redtSQLResult.Text := tHistorySQL_RESULT.AsString + ln
                        +tHistorySQL.AsString;
end;

procedure TSQLEditorFrameFrm.dsHistoryDataChange(Sender: TObject;
  Field: TField);
begin
  dsHistoryStateChange(nil);
end;

{****************************  DBMS OUTPUT *********************************}

procedure TSQLEditorFrameFrm.tDbMS_outputTimer(Sender: TObject);
begin
  pc.ActivePage := tsDBMSOutput;
  spDbms_output.ExecProc;
  if spDbms_output.Params[1].AsString = '0' then
     redtDBMS_output.Lines.Add(spDbms_output.Params[0].AsString);
end;

procedure TSQLEditorFrameFrm.btnTurnOutputOnClick(Sender: TObject);
begin
  if btnTurnOutputOn.Down then
  begin
    ExecSQL(nil, false,
            'Begin '
           +'  DBMS_OUTPUT.enable('+IntToStr(DBMS_OUTPUT_BufferSize)+'); '
           +'end; ');

    tDbMS_output.Interval := (btnFrequency.IntValue * 1000);
    tDbMS_output.Enabled := true;
  end else
  begin
    ExecSQL(nil, false,
            'Begin '
           +'  DBMS_OUTPUT.disable; '
           +'end; ');

    tDbMS_output.Enabled := false;
  end;
end;

procedure TSQLEditorFrameFrm.btnClearWindowsClick(Sender: TObject);
begin
  redtDBMS_output.Clear;
end;

procedure TSQLEditorFrameFrm.btnSetBufferSizeClick(Sender: TObject);
begin
  DBMS_OUTPUT_BufferSize := InputBox('Set DBMS Output Buffer', 'Size', DBMS_OUTPUT_BufferSize, 1, 1000000);
end;

procedure TSQLEditorFrameFrm.btnSaveToFileClick(Sender: TObject);
begin
  if sdDBMS.Execute then
     redtDBMS_output.Lines.SaveToFile(sdDBMS.FileName);
end;

end.
