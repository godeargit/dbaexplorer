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
unit frmSessionBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, GenelDM, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxPC, cxSplitter, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, dxStatusBar, cxBlobEdit, cxMaskEdit, cxCalendar, DB,
  DBAccess, Ora, MemDS, VirtualTable, OraBarConn, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, StdCtrls, ComCtrls, cxLabel, cxDBLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxGroupBox,
  ExtCtrls, cxGridCardView, cxGridDBCardView, cxMCListBox, cxListView,
  cxEditRepositoryItems, cxTextEdit, cxMemo, cxRichEdit, cxDBRichEdit;

type
  TSessionBrowserFrm = class(TForm)
    dxBarManager1: TdxBarManager;
    btnRefresh: TdxBarButton;
    btnListFields: TdxBarButton;
    lblRefresh: TdxBarStatic;
    sbtnRefresh: TdxBarSpinEdit;
    btnAutoRefresh: TdxBarButton;
    cxSplitter1: TcxSplitter;
    pc: TcxPageControl;
    tsGeneral: TcxTabSheet;
    tsCurrentStatement: TcxTabSheet;
    tsStatistics: TcxTabSheet;
    tsLocks: TcxTabSheet;
    tsProcess: TcxTabSheet;
    tsIO: TcxTabSheet;
    tsWaits: TcxTabSheet;
    tsOpenCursor: TcxTabSheet;
    statusBar: TdxStatusBar;
    dsUsers: TDataSource;
    tsEvents: TcxTabSheet;
    gridDBUser: TcxGridDBTableView;
    gridUserLevel1: TcxGridLevel;
    gridUser: TcxGrid;
    gridDBUserSADDR: TcxGridDBColumn;
    gridDBUserSID: TcxGridDBColumn;
    gridDBUserSERIAL: TcxGridDBColumn;
    gridDBUserAUDSID: TcxGridDBColumn;
    gridDBUserPADDR: TcxGridDBColumn;
    gridDBUserUSER: TcxGridDBColumn;
    gridDBUserUSERNAME: TcxGridDBColumn;
    gridDBUserCOMMAND: TcxGridDBColumn;
    gridDBUserOWNERID: TcxGridDBColumn;
    gridDBUserTADDR: TcxGridDBColumn;
    gridDBUserLOCKWAIT: TcxGridDBColumn;
    gridDBUserSTATUS: TcxGridDBColumn;
    gridDBUserSERVER: TcxGridDBColumn;
    gridDBUserSCHEMA: TcxGridDBColumn;
    gridDBUserSCHEMANAME: TcxGridDBColumn;
    gridDBUserOSUSER: TcxGridDBColumn;
    gridDBUserPROCESS: TcxGridDBColumn;
    gridDBUserMACHINE: TcxGridDBColumn;
    gridDBUserTERMINAL: TcxGridDBColumn;
    gridDBUserPROGRAM: TcxGridDBColumn;
    gridDBUserTYPE: TcxGridDBColumn;
    gridDBUserSQL_ADDRESS: TcxGridDBColumn;
    gridDBUserSQL_HASH_VALUE: TcxGridDBColumn;
    gridDBUserPREV_SQL_ADDR: TcxGridDBColumn;
    gridDBUserPREV_HASH_VALUE: TcxGridDBColumn;
    gridDBUserMODULE: TcxGridDBColumn;
    gridDBUserMODULE_HASH: TcxGridDBColumn;
    gridDBUserACTION: TcxGridDBColumn;
    gridDBUserACTION_HASH: TcxGridDBColumn;
    gridDBUserCLIENT_INFO: TcxGridDBColumn;
    gridDBUserFIXED_TABLE_SEQUENCE: TcxGridDBColumn;
    gridDBUserROW_WAIT_OBJ: TcxGridDBColumn;
    gridDBUserROW_WAIT_FILE: TcxGridDBColumn;
    gridDBUserROW_WAIT_BLOCK: TcxGridDBColumn;
    gridDBUserROW_WAIT_ROW: TcxGridDBColumn;
    gridDBUserLOGON_TIME: TcxGridDBColumn;
    gridDBUserLAST_CALL_ET: TcxGridDBColumn;
    gridDBUserPDML_ENABLED: TcxGridDBColumn;
    gridDBUserFAILOVER_TYPE: TcxGridDBColumn;
    gridDBUserFAILOVER_METHOD: TcxGridDBColumn;
    gridDBUserFAILED_OVER: TcxGridDBColumn;
    gridDBUserRESOURCE_CONSUMER_GROUP: TcxGridDBColumn;
    gridDBUserPDML_STATUS: TcxGridDBColumn;
    gridDBUserPDDL_STATUS: TcxGridDBColumn;
    gridDBUserPQ_STATUS: TcxGridDBColumn;
    gridDBUserCURRENT_QUEUE_DURATION: TcxGridDBColumn;
    gridDBUserCLIENT_IDENTIFIER: TcxGridDBColumn;
    Timer: TTimer;
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
    dsPlanTable: TDataSource;
    gridDBStatistics: TcxGridDBTableView;
    gridStatisticsLevel1: TcxGridLevel;
    gridStatistics: TcxGrid;
    gridDBStatisticsColumn1: TcxGridDBColumn;
    gridDBStatisticsColumn2: TcxGridDBColumn;
    gridDBStatisticsColumn3: TcxGridDBColumn;
    gridWaits: TcxGrid;
    gridDBWaits: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    gridDBWaitsColumn1: TcxGridDBColumn;
    gridDBWaitsColumn2: TcxGridDBColumn;
    gridDBWaitsColumn3: TcxGridDBColumn;
    gridDBWaitsColumn4: TcxGridDBColumn;
    gridDBWaitsColumn5: TcxGridDBColumn;
    gridDBWaitsColumn6: TcxGridDBColumn;
    gridEvents: TcxGrid;
    gridDBEvents: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    gridDBEventsColumn1: TcxGridDBColumn;
    gridDBEventsColumn2: TcxGridDBColumn;
    gridDBEventsColumn3: TcxGridDBColumn;
    gridDBEventsColumn4: TcxGridDBColumn;
    gridDBEventsColumn5: TcxGridDBColumn;
    gridDBEventsColumn6: TcxGridDBColumn;
    gridDBEventsColumn7: TcxGridDBColumn;
    gridIO: TcxGrid;
    gridDBIO: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    gridDBIOColumn1: TcxGridDBColumn;
    gridDBIOColumn2: TcxGridDBColumn;
    gridDBIOColumn3: TcxGridDBColumn;
    gridDBIOColumn4: TcxGridDBColumn;
    gridDBIOColumn5: TcxGridDBColumn;
    gridProcess: TcxGrid;
    gridDBProcess: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    gridDBProcessColumn1: TcxGridDBColumn;
    gridDBProcessColumn2: TcxGridDBColumn;
    gridDBProcessColumn3: TcxGridDBColumn;
    gridDBProcessColumn4: TcxGridDBColumn;
    gridDBProcessColumn5: TcxGridDBColumn;
    gridDBProcessColumn6: TcxGridDBColumn;
    gridDBProcessColumn7: TcxGridDBColumn;
    gridDBProcessColumn8: TcxGridDBColumn;
    gridDBProcessColumn9: TcxGridDBColumn;
    gridDBProcessColumn10: TcxGridDBColumn;
    gridDBProcessColumn11: TcxGridDBColumn;
    gridDBProcessColumn12: TcxGridDBColumn;
    gridDBProcessColumn13: TcxGridDBColumn;
    gridDBProcessColumn14: TcxGridDBColumn;
    gridDBProcessColumn15: TcxGridDBColumn;
    gridLocks: TcxGrid;
    gridDBLocks: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    gridDBLocksColumn1: TcxGridDBColumn;
    gridDBLocksColumn2: TcxGridDBColumn;
    gridDBLocksColumn3: TcxGridDBColumn;
    gridDBLocksColumn4: TcxGridDBColumn;
    gridDBLocksColumn5: TcxGridDBColumn;
    gridDBLocksColumn6: TcxGridDBColumn;
    gridDBLocksColumn7: TcxGridDBColumn;
    gridDBLocksColumn8: TcxGridDBColumn;
    gridDBLocksColumn9: TcxGridDBColumn;
    gridDBLocksColumn10: TcxGridDBColumn;
    gridDBLocksColumn11: TcxGridDBColumn;
    gridDBLocksColumn12: TcxGridDBColumn;
    gridDBLocksColumn13: TcxGridDBColumn;
    pcCurrentStatement: TcxPageControl;
    tsCurrentSQL: TcxTabSheet;
    tsCurrentExplain: TcxTabSheet;
    SQLEditor: TRichEdit;
    treeListExplain: TcxDBTreeList;
    cxDBTreeList1STEP_NAME: TcxDBTreeListColumn;
    cxDBTreeList1POSITION: TcxDBTreeListColumn;
    cxDBTreeList1COST: TcxDBTreeListColumn;
    cxDBTreeList1CARDINALITY: TcxDBTreeListColumn;
    cxDBTreeList1BYTES: TcxDBTreeListColumn;
    tsCurrentInformation: TcxTabSheet;
    lviewCurrentInformation: TcxListView;
    pcOpenCursor: TcxPageControl;
    tsCursorExplain: TcxTabSheet;
    treeListCursorExplain: TcxDBTreeList;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeListColumn5: TcxDBTreeListColumn;
    tsCursorInformation: TcxTabSheet;
    lviewCursorInformation: TcxListView;
    cxSplitter2: TcxSplitter;
    cxEditRepository: TcxEditRepository;
    cxEditRepositoryBlobItem1: TcxEditRepositoryBlobItem;
    cxEditRepositoryMemoItem1: TcxEditRepositoryMemoItem;
    StyleRepository: TcxStyleRepository;
    styleSelection: TcxStyle;
    styleCardHeader: TcxStyle;
    styleCardBorder: TcxStyle;
    styleBackground: TcxStyle;
    styleCategoryRow: TcxStyle;
    stylePrice: TcxStyle;
    CardsStyleSheet: TcxGridCardViewStyleSheet;
    qUsers: TOraQuery;
    qCurrentSQL: TOraQuery;
    qStatistics: TOraQuery;
    qWaits: TOraQuery;
    qEvents: TOraQuery;
    qIO: TOraQuery;
    qProcess: TOraQuery;
    qLocks: TOraQuery;
    dsCurrentSQL: TDataSource;
    dsStatistics: TDataSource;
    dsWaits: TDataSource;
    dsEvents: TDataSource;
    dsIO: TDataSource;
    dsProcess: TDataSource;
    dsLocks: TDataSource;
    qOpenCursor: TOraQuery;
    dsOpenCursor: TDataSource;
    qTemp: TOraQuery;
    tsAccess: TcxTabSheet;
    gridAccess: TcxGrid;
    gridDBAccess: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    qAccess: TOraQuery;
    dsAccess: TDataSource;
    gridDBAccessColumn1: TcxGridDBColumn;
    gridDBAccessColumn2: TcxGridDBColumn;
    gridDBAccessColumn3: TcxGridDBColumn;
    gridDBAccessColumn4: TcxGridDBColumn;
    dxBarPopupMenu1: TdxBarPopupMenu;
    btnKillSession: TdxBarButton;
    btnSessionImmediate: TdxBarButton;
    btnSessionPost: TdxBarButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    gridOpenCursor: TcxGrid;
    gridDBOpenCursor: TcxGridDBCardView;
    gridDBOpenCursorSQL: TcxGridDBCardViewRow;
    gridOpenCursorLevel2: TcxGridLevel;
    redtOpenCursorDetail: TcxDBRichEdit;
    statusBarCursor: TdxStatusBar;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxGroupBox2: TcxGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cxDBLabel10: TcxDBLabel;
    cxDBLabel11: TcxDBLabel;
    cxDBLabel12: TcxDBLabel;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    cxDBLabel5: TcxDBLabel;
    cxDBLabel6: TcxDBLabel;
    cxDBLabel7: TcxDBLabel;
    cxDBLabel8: TcxDBLabel;
    cxDBLabel9: TcxDBLabel;
    lviewUserDetail: TcxListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRefreshClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure btnAutoRefreshClick(Sender: TObject);
    procedure btnListFieldsClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure dsUsersDataChange(Sender: TObject; Field: TField);
    procedure dsUsersStateChange(Sender: TObject);
    procedure pcCurrentStatementPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure pcOpenCursorPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure qOpenCursorAfterScroll(DataSet: TDataSet);
    procedure btnSessionImmediateClick(Sender: TObject);
    procedure btnSessionPostClick(Sender: TObject);
  private
    { Private declarations }
    FOraSession: TOraSession;
    FBarConnection : TBarConnection;
    FWait: Boolean;
    FBarConnName   : string;
    
    procedure GetUsers;
    procedure ShowUserDetail;
    procedure ShowCurrentSQL;
    procedure ExplainPlan(SQL: string);
    procedure ShowStatistics;
    procedure ShowWaits;
    procedure ShowEvents;
    procedure ShowIO;
    procedure ShowProcess;
    procedure ShowLocks;
    procedure ShowOpenCursors;
    procedure ShowAccess;
    procedure CloseAllDataset;    
  public
    { Public declarations }
    procedure Init(ABarConnection : TBarConnection);
    property BarConnName: String read FBarConnName write FBarConnName;
  end;

var
  SessionBrowserFrm: TSessionBrowserFrm;

implementation

uses frmMain, DBQuery, OraSessions, util, VisualOptions;

{$R *.dfm}


procedure TSessionBrowserFrm.Init(ABarConnection : TBarConnection);
begin
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FBarConnection := ABarConnection;
  FOraSession := ABarConnection.Session;
  FBarConnName := ABarConnection.Name;
  
  FWait := false;
  Caption := FBarConnection.Session.Server+'/'+FBarConnection.Session.UserName+' - '+'Session Browser';
  statusBar.Panels[0].Text := FBarConnection.Session.Server+'/'+FBarConnection.Session.UserName;
  MainFrm.dxBarListWindows.Items.AddObject(Caption, Self);
  pc.ActivePage := tsGeneral;
  qTemp.Session := FOraSession;
  qUsers.Session := FOraSession;
  qCurrentSQL.Session := FOraSession;
  qOpenCursor.Session := FOraSession;
  qStatistics.Session := FOraSession;
  qWaits.Session := FOraSession;
  qEvents.Session := FOraSession;
  qIO.Session := FOraSession;
  qProcess.Session := FOraSession;
  qLocks.Session := FOraSession;
  qAccess.Session := FOraSession;
  GetUsers;
end;

procedure TSessionBrowserFrm.GetUsers;
var
  bm: TBookmark;
begin
  statusBar.Panels[1].Text := 'Last Updated : '+DateTimeToStr(Now);
  bm := qUsers.GetBookmark;
  try
    qUsers.SQL.Text := GetSessions;
    qUsers.Open;
    qUsers.GotoBookmark(bm);
  finally
    qUsers.FreeBookmark(bm);
  end;
end;

procedure TSessionBrowserFrm.dsUsersStateChange(Sender: TObject);
var a: boolean;
begin
  if FWait then exit;
  pcPageChanging(self, pc.ActivePage ,a);
end;

procedure TSessionBrowserFrm.dsUsersDataChange(Sender: TObject;
  Field: TField);
begin
  if FWait then exit;
  dsUsersStateChange(nil);
end;

procedure TSessionBrowserFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseAllDataset;
  with MainFrm.dxBarListWindows.Items do
       Delete(IndexOfObject(Self));
  action := caFree;
end;

procedure TSessionBrowserFrm.btnRefreshClick(Sender: TObject);
begin
  GetUsers;
end;

procedure TSessionBrowserFrm.TimerTimer(Sender: TObject);
begin
  GetUsers;
end;

procedure TSessionBrowserFrm.btnAutoRefreshClick(Sender: TObject);
begin
  Timer.Interval := sbtnRefresh.IntValue * 1000;
  Timer.Enabled := btnAutoRefresh.Down;   
end;

procedure TSessionBrowserFrm.btnListFieldsClick(Sender: TObject);
begin
  gridDBUser.Controller.Customization := True;
end;

procedure TSessionBrowserFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
var
  a: boolean;  
begin
  if not qUsers.Active then exit;
  qTemp.close;
  qCurrentSQL.close;
  qOpenCursor.Close;
  qStatistics.close;
  qWaits.close;
  qEvents.close;
  qIO.close;
  qProcess.close;
  qLocks.close;
  qAccess.close;

  if NewPage = tsGeneral then
     ShowUserDetail;

  if NewPage = tsCurrentStatement then
  begin
     pcCurrentStatement.ActivePage := tsCurrentSQL;
     ShowCurrentSQL;
  end;

  if NewPage = tsStatistics then
     ShowStatistics;

  if NewPage = tsWaits then
     ShowWaits;

  if NewPage = tsEvents then
     ShowEvents;

  if NewPage = tsIO then
     ShowIO;

  if NewPage = tsProcess then
     ShowProcess;

  if NewPage = tsLocks then
     ShowLocks;

  if NewPage = tsOpenCursor then
  begin
     ShowOpenCursors;
     pcOpenCursorPageChanging(self, pcOpenCursor.ActivePage ,a);
  end;

  if NewPage = tsAccess then
     ShowAccess;
end;


procedure TSessionBrowserFrm.pcCurrentStatementPageChanging(
  Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
var
  i: integer;
begin
  if NewPage = tsCurrentExplain then
     ExplainPlan(SQLEditor.Text);
  if NewPage = tsCurrentInformation then
  begin
    qTemp.close;
    qTemp.SQL.Text:= GetSQLInformation(dsUsers.DataSet.FieldByName('SID').AsString);
    qTemp.Open;
    lviewCurrentInformation.Items.Clear;
    for i := 0 to qTemp.FieldCount -1 do
    begin
      with lviewCurrentInformation.Items.Add do
      begin
        Caption := qTemp.Fields[i].FieldName;
        ImageIndex := -1;
      end;
      lviewCurrentInformation.Items[lviewCurrentInformation.Items.count-1].SubItems.Add(qTemp.Fields[i].Text);
    end;
  end;
end;


procedure TSessionBrowserFrm.ShowUserDetail;
var
  i: integer;
begin
  lviewUserDetail.Items.Clear;
  for i := 0 to dsUsers.DataSet.FieldCount -1 do
  begin
    with lviewUserDetail.Items.Add do
    begin
      Caption := dsUsers.DataSet.Fields[i].FieldName;
      ImageIndex := -1;
    end;
    lviewUserDetail.Items[lviewUserDetail.Items.count-1].SubItems.Add(dsUsers.DataSet.Fields[i].Text);
  end;
end;

procedure TSessionBrowserFrm.ShowCurrentSQL;
begin
  SQLEditor.Text := '';
  if dsUsers.DataSet.FieldByName('SQL_HASH_VALUE').AsString <> '0' then
     qTemp.SQL.Text := GetCurrentStatement(dsUsers.DataSet.FieldByName('SQL_HASH_VALUE').AsString)
  else
     qTemp.SQL.Text := GetCurrentStatement(dsUsers.DataSet.FieldByName('SID').AsString, dsUsers.DataSet.FieldByName('USERNAME').AsString);
  qTemp.Open;
  while not qTemp.Eof do
  begin
    SQLEditor.Text := SQLEditor.Text + qTemp.FieldByName('SQL_TEXT').Text;
    qTemp.Next;
  end;
end;

procedure TSessionBrowserFrm.ExplainPlan(SQL: string);
var
  step: string;
  id: string;
  FLastError: string;
begin
  if vtPlanTable.RecordCount > 0 then
      while not vtPlanTable.Eof do  vtPlanTable.Delete;

  if trim(SQL) = '' then exit;
  Randomize;
  id := FOraSession.Username + FloatToStr(random(10000000));

  qTemp.Close;
  qTemp.SQL.Text := 'EXPLAIN PLAN SET STATEMENT_ID = '+Str(id)+' into PLAN_TABLE FOR '+SQL;
  try
    qTemp.ExecSQL;
  except
    on E: Exception do FLastError := E.Message;
  end;

  vtPlanTable.Open;
  if FLastError <> '' then
  begin
    vtPlanTable.Append;
    vtPlanTable.FieldByName('STEP_NAME').AsString := FLastError;
    vtPlanTable.post;
    exit;
  end;

  qTemp.Close;
  qTemp.SQL.Text := GetExplainTable(Str(id));
  qTemp.Open;

  with qTemp do
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
  qTemp.close;
  qTemp.SQL.Text := 'ROLLBACK';
  qTemp.ExecSQL;
end;


procedure TSessionBrowserFrm.ShowStatistics;
begin
  qStatistics.SQL.Text := GetSesstat(dsUsers.DataSet.FieldByName('SID').AsString);
  qStatistics.Open;
end;

procedure TSessionBrowserFrm.ShowWaits;
begin
  qWaits.SQL.Text := GetWaits(dsUsers.DataSet.FieldByName('SID').AsString);
  qWaits.Open;
end;

procedure TSessionBrowserFrm.ShowEvents;
begin
  qEvents.SQL.Text := GetEvents(dsUsers.DataSet.FieldByName('SID').AsString);
  qEvents.Open;
end;

procedure TSessionBrowserFrm.ShowIO;
begin
  qIO.SQL.Text := GetIO(dsUsers.DataSet.FieldByName('SID').AsString);
  qIO.Open;
end;

procedure TSessionBrowserFrm.ShowProcess;
begin
  qProcess.SQL.Text := GetProcess(dsUsers.DataSet.FieldByName('SID').AsString);
  qProcess.Open;
end;

procedure TSessionBrowserFrm.ShowLocks;
begin
  qLocks.SQL.Text := GetLocks(dsUsers.DataSet.FieldByName('SID').AsString);
  qLocks.Open;
end;

procedure TSessionBrowserFrm.ShowOpenCursors;
begin
  qOpenCursor.Tag := 99;
  qOpenCursor.SQL.Text := GetOpenCursors(dsUsers.DataSet.FieldByName('SID').AsString);
  qOpenCursor.Open;
  statusBarCursor.Panels[0].Text := 'Open Cursors Count = '+IntToStr(qOpenCursor.RecordCount);
  qOpenCursor.Tag := 0;
end;

procedure TSessionBrowserFrm.qOpenCursorAfterScroll(DataSet: TDataSet);
var
  a: boolean;
begin
  pcOpenCursorPageChanging(self, pcOpenCursor.ActivePage ,a);
end;

procedure TSessionBrowserFrm.pcOpenCursorPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
var
  i: integer;
  SQL: string;
begin
  if qOpenCursor.Tag = 99 then exit;
  if qOpenCursor.FieldByName('SID').AsString = '' then exit;
  qTemp.Close;

  SQL := '';
  if qOpenCursor.FieldByName('HASH_VALUE').AsString <> '0' then
     qTemp.SQL.Text := GetCurrentStatement(qOpenCursor.FieldByName('HASH_VALUE').AsString)
  else
     qTemp.SQL.Text := GetCurrentStatement(qOpenCursor.FieldByName('SID').AsString, qOpenCursor.FieldByName('USER_NAME').AsString);
  qTemp.Open;
  while not qTemp.Eof do
  begin
    SQL := SQL + qTemp.FieldByName('SQL_TEXT').Text;
    qTemp.Next;
  end;

  redtOpenCursorDetail.Text := SQL;
  
  if NewPage = tsCursorExplain then
  begin
    ExplainPlan(SQL);
  end;
  if NewPage = tsCursorInformation then
  begin
    qTemp.close;
    qTemp.SQL.Text:= GetSQLInformation(qOpenCursor.FieldByName('SID').AsString);
    qTemp.Open;
    lviewCursorInformation.Items.Clear;
    for i := 0 to qTemp.FieldCount -1 do
    begin
      with lviewCursorInformation.Items.Add do
      begin
        Caption := qTemp.Fields[i].FieldName;
        ImageIndex := -1;
      end;
      lviewCursorInformation.Items[lviewCursorInformation.Items.count-1].SubItems.Add(qTemp.Fields[i].Text);
    end;
  end;
end;

procedure TSessionBrowserFrm.ShowAccess;
begin
  qAccess.SQL.Text := GetAccess(dsUsers.DataSet.FieldByName('SID').AsString);
  qAccess.Open;
end;

procedure TSessionBrowserFrm.btnSessionImmediateClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you wish to kill selected session ? ', mtConfirmation, [mbYes, mbNo], 0) =  mrNo then exit;
  qTemp.close;
  qTemp.SQL.Text :='ALTER SYSTEM KILL SESSION '+Str(qUsers.FieldByName('SID').AsString+','+ qUsers.FieldByName('SERIAL#').AsString)+' IMMEDIATE';
  qTemp.Execute;
end;

procedure TSessionBrowserFrm.btnSessionPostClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you wish to kill selected session ? ', mtConfirmation, [mbYes, mbNo], 0) =  mrNo then exit;
  qTemp.close;
  qTemp.SQL.Text :='ALTER SYSTEM DISCONNECT SESSION '+Str(qUsers.FieldByName('SID').AsString+','+ qUsers.FieldByName('SERIAL#').AsString)+' POST_TRANSACTION';
  qTemp.Execute;
end;

procedure TSessionBrowserFrm.CloseAllDataset;
var
  I: Integer;
  Temp: TComponent;
begin
  for I := ComponentCount - 1 downto 0 do
  begin
    Temp := Components[I];
    if (Temp is TOraQuery) then
      TOraQuery(Temp).Close;
    if (Temp is TVirtualTable) then
      TVirtualTable(Temp).Close;
  end;
end;

end.
