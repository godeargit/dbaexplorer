unit frmViewProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  ComCtrls, ToolWin, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, cxPC,
  //
  frmBaseForm, ExtCtrls, cxContainer, cxMemo, cxRichEdit, cxSplitter,
  cxDBEdit, cxLabel, dxBar, MemDS, DBAccess, Ora, jpeg, GenelDM,
  dxStatusBar, dxBarDBNav, Menus, cxGridExportLink, OraView, VirtualTable,
  cxGroupBox;

type
  TViewPropertiesFrm = class(TBaseform)
    pcViewProperties: TcxPageControl;
    tsViewTrigers: TcxTabSheet;
    tsViewData: TcxTabSheet;
    tsViewScripts: TcxTabSheet;
    tsViewGrants: TcxTabSheet;
    tsViewSynonyms: TcxTabSheet;
    tsViewUsedBy: TcxTabSheet;
    tsViewUses: TcxTabSheet;
    cxSplitter2: TcxSplitter;
    editTriggers: TcxRichEdit;
    GridUses: TcxGrid;
    GridUsesDBTableView1: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    GridUsesDBTableView1Column1: TcxGridDBColumn;
    GridUsesDBTableView1Column2: TcxGridDBColumn;
    GridUsesDBTableView1Column3: TcxGridDBColumn;
    GridUsesDBTableView1Column4: TcxGridDBColumn;
    GridUsesDBTableView1Column5: TcxGridDBColumn;
    Panel1: TPanel;
    imgToolBar: TImage;
    lblDescription: TLabel;
    dxBarManager1: TdxBarManager;
    dsViewColumns: TDataSource;
    tsViewDetails: TcxTabSheet;
    dxBarDockControl1: TdxBarDockControl;
    Image2: TImage;
    btnCreateView: TdxBarButton;
    btnAlterView: TdxBarButton;
    btnDropView: TdxBarButton;
    btnCompileView: TdxBarButton;
    btnRefreshView: TdxBarButton;
    btnPrivilegesView: TdxBarButton;
    dxBarDockControl3: TdxBarDockControl;
    dxBarDBNavigator1: TdxBarDBNavigator;
    dxBarDBNavFirst1: TdxBarDBNavButton;
    dxBarDBNavPrev1: TdxBarDBNavButton;
    dxBarDBNavNext1: TdxBarDBNavButton;
    dxBarDBNavLast1: TdxBarDBNavButton;
    dxBarDBNavRefresh1: TdxBarDBNavButton;
    qViewData: TOraQuery;
    dsViewData: TDataSource;
    sbData: TdxStatusBar;
    GridData: TcxGrid;
    gridDataView: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    edtDataFilter: TdxBarEdit;
    popData: TPopupMenu;
    popDataMultiSelect: TMenuItem;
    popDataSaveAs: TMenuItem;
    popDataFindData: TMenuItem;
    popDataRecordCount: TMenuItem;
    DataSaveDialog: TSaveDialog;
    dxBarDockControl4: TdxBarDockControl;
    bbtnGrantPrivileges: TdxBarButton;
    btnRefreshGrants: TdxBarButton;
    dsGrants: TDataSource;
    GridGrants: TcxGrid;
    GridGrantsDBTableView1: TcxGridDBTableView;
    GridGrantsDBTableView1Column1: TcxGridDBColumn;
    GridGrantsDBTableView1Column2: TcxGridDBColumn;
    GridGrantsDBTableView1Column3: TcxGridDBColumn;
    GridGrantsDBTableView1Column4: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    qTrigger: TOraQuery;
    dsTrigger: TDataSource;
    GridTrigers: TcxGrid;
    GridTrigersDBTableView1: TcxGridDBTableView;
    GridTrigersDBTableView1Column1: TcxGridDBColumn;
    GridTrigersDBTableView1Column2: TcxGridDBColumn;
    GridTrigersDBTableView1Column3: TcxGridDBColumn;
    GridTrigersDBTableView1Column4: TcxGridDBColumn;
    GridTrigersDBTableView1Column5: TcxGridDBColumn;
    GridTrigersDBTableView1Column6: TcxGridDBColumn;
    GridTrigersDBTableView1Column7: TcxGridDBColumn;
    GridTrigersDBTableView1Column8: TcxGridDBColumn;
    GridTrigersDBTableView1Column9: TcxGridDBColumn;
    GridTrigersDBTableView1Column10: TcxGridDBColumn;
    GridTrigersDBTableView1Column11: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    dxBarDockControl5: TdxBarDockControl;
    bbtnCreateTrigger: TdxBarButton;
    bbtnAlterTrigger: TdxBarButton;
    bbtnDropTrigger: TdxBarButton;
    bbtnEnableTrigger: TdxBarButton;
    bbtnDisableTrigger: TdxBarButton;
    bbtnCompileTrigger: TdxBarButton;
    bbtnRefreshTrigger: TdxBarButton;
    dsSynonyms: TDataSource;
    dxBarDockControl6: TdxBarDockControl;
    bbtnCreateSynonym: TdxBarButton;
    bbtnDropSynonym: TdxBarButton;
    bbtnRefreshSynonym: TdxBarButton;
    GridSynonyms: TcxGrid;
    GridSynonymsDBTableView1: TcxGridDBTableView;
    GridSynonymsDBTableView1Column1: TcxGridDBColumn;
    GridSynonymsDBTableView1Column2: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    dsUsed: TDataSource;
    GridUsed: TcxGrid;
    GridUsedDBTableView1: TcxGridDBTableView;
    GridUsedDBTableView1Column1: TcxGridDBColumn;
    GridUsedDBTableView1Column2: TcxGridDBColumn;
    GridUsedDBTableView1Column3: TcxGridDBColumn;
    GridUsedDBTableView1Column4: TcxGridDBColumn;
    GridUsedDBTableView1Column5: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    dsUses: TDataSource;
    redtDDL: TcxRichEdit;
    vtViewColumns: TVirtualTable;
    vtGrants: TVirtualTable;
    vtSynonyms: TVirtualTable;
    vtUsed: TVirtualTable;
    vtUses: TVirtualTable;
    gridColumn: TcxGrid;
    gridColumnDB: TcxGridDBTableView;
    gridColumnDBCOLUMN_ID: TcxGridDBColumn;
    gridColumnDBCOLUMN_NAME: TcxGridDBColumn;
    gridColumnDBDATA_TYPE: TcxGridDBColumn;
    gridColumnDBDATA_LENGTH: TcxGridDBColumn;
    gridColumnDBDATA_PRECISION: TcxGridDBColumn;
    gridColumnDBDATA_SCALE: TcxGridDBColumn;
    gridColumnDBNULLABLE: TcxGridDBColumn;
    gridColumnLevel1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edtViewName: TcxTextEdit;
    cxLabel2: TcxLabel;
    edtOwner: TcxTextEdit;
    bbtnEnableAllTriggers: TdxBarButton;
    bbtnDisableAllTriggers: TdxBarButton;
    procedure pcViewPropertiesPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure GridTrigersDBTableView1CanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure btnCreateViewClick(Sender: TObject);
    procedure btnAlterViewClick(Sender: TObject);
    procedure btnDropViewClick(Sender: TObject);
    procedure btnCompileViewClick(Sender: TObject);
    procedure edtDataFilterEnter(Sender: TObject);
    procedure edtDataFilterExit(Sender: TObject);
    procedure edtDataFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsViewDataStateChange(Sender: TObject);
    procedure dsViewDataDataChange(Sender: TObject; Field: TField);
    procedure gridDataViewColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure popDataMultiSelectClick(Sender: TObject);
    procedure popDataSaveAsClick(Sender: TObject);
    procedure popDataFindDataClick(Sender: TObject);
    procedure popDataRecordCountClick(Sender: TObject);
    procedure bbtnGrantPrivilegesClick(Sender: TObject);
    procedure btnRefreshGrantsClick(Sender: TObject);
    procedure bbtnCreateTriggerClick(Sender: TObject);
    procedure bbtnAlterTriggerClick(Sender: TObject);
    procedure bbtnDropTriggerClick(Sender: TObject);
    procedure bbtnEnableTriggerClick(Sender: TObject);
    procedure bbtnDisableTriggerClick(Sender: TObject);
    procedure bbtnCompileTriggerClick(Sender: TObject);
    procedure bbtnRefreshTriggerClick(Sender: TObject);
    procedure bbtnCreateSynonymClick(Sender: TObject);
    procedure bbtnDropSynonymClick(Sender: TObject);
    procedure bbtnRefreshSynonymClick(Sender: TObject);
    procedure btnRefreshViewClick(Sender: TObject);
    procedure bbtnEnableAllTriggersClick(Sender: TObject);
    procedure bbtnDisableAllTriggersClick(Sender: TObject);
  private
    { Private declarations }
    FViewName,
    FOwner : string;
    View: TView;
    procedure GetView;
    procedure GetData;
    procedure GetDataWithWhereCont;
    procedure GetTriggers;
    procedure GetTriggerDetail;
    procedure GetUses;
    procedure GetUsed;
  public
    { Public declarations }
    procedure Init(ObjName, OwnerName: string); override;

  end;

var
  ViewPropertiesFrm: TViewPropertiesFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, Util, frmViewDetail, frmTableEvents, OraStorage,
     frmTableSort, frmTableFind, OraGrants, frmGrants, OraTriger,
     frmTrigerDetail, frmSynonyms, OraSynonym, frmSchemaPublicEvent,
     VisualOptions;

procedure TViewPropertiesFrm.Init(ObjName, OwnerName: string);
var
  a: boolean;
begin
  inherited Show;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  
  top := 0;
  left := 0;
  FViewName := ObjName;
  FOwner := OwnerName;
  edtDataFilter.Text := 'Enter where clause';
  GetView;
  pcViewPropertiesPageChanging(self, pcViewProperties.ActivePage ,a);
end;

procedure TViewPropertiesFrm.pcViewPropertiesPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  inherited;
  qViewData.close;
  qTrigger.close;

  if NewPage = tsViewData then GetData;
  if NewPage = tsViewTrigers then GetTriggers;
  if NewPage = tsViewUses then GetUses;
  if NewPage = tsViewUsedBy then GetUsed;
end;

{*******************************************************************************}
{                         V I E W                                               }
{*******************************************************************************}
procedure TViewPropertiesFrm.GetView;
begin
  if View <> nil then
     FreeAndNil(View);

  View := TView.Create;
  View.OraSession := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;
  View.VIEW_NAME := FViewName;
  View.OWNER := FOwner;
  View.SetDDL;

  redtDDL.Text := View.GetDDL;
  CodeColors(self, 'Default', redtDDL, false);

  edtViewName.Text := View.VIEW_NAME;
  edtOwner.Text := View.OWNER;
  lblDescription.Caption := View.ViewStatus;

  vtViewColumns.close;
  vtViewColumns.Assign(View.ColumnLists.ColumnList);
  vtViewColumns.Open;

  vtGrants.close;
  vtGrants.Assign(View.GrantList.DSGrantList);
  vtGrants.Open;

  vtSynonyms.close;
  vtSynonyms.Assign(View.SynonymList.DSSynonymList);
  vtSynonyms.Open;      
end;

procedure TViewPropertiesFrm.btnRefreshViewClick(Sender: TObject);
begin
  inherited;
  GetView;
end;

procedure TViewPropertiesFrm.btnCreateViewClick(Sender: TObject);
var
  v: TView;
begin
  inherited;
  v := TView.Create;
  v.VIEW_NAME := '';
  v.OWNER := View.OWNER;
  v.OraSession := View.OraSession;
  if ViewDetailFrm.Init(v) then
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbView);
end;

procedure TViewPropertiesFrm.btnAlterViewClick(Sender: TObject);
begin
  inherited;
  if View.VIEW_NAME = '' then exit;
  if View = nil then exit;
  if ViewDetailFrm.Init(View) then
     GetView;
end;

procedure TViewPropertiesFrm.btnDropViewClick(Sender: TObject);
begin
  inherited;
  if View.VIEW_NAME= '' then exit;
  if View = nil then exit;
  if SchemaPublicEventFrm.Init(View, oeDrop) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbView);
end;

procedure TViewPropertiesFrm.btnCompileViewClick(Sender: TObject);
begin
  inherited;
  if SchemaPublicEventFrm.Init(View, oeCompile) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbView);
end;

{*******************************************************************************}
{                              D A T A                                          }
{*******************************************************************************}

procedure TViewPropertiesFrm.GetData;
begin
  qViewData.Session := View.OraSession;
  GetDataWithWhereCont;
  gridDataView.BeginUpdate;
  gridDataView.ClearItems;
  gridDataView.DataController.CreateAllItems();
  gridDataView.EndUpdate;
  gridDataView.ApplyBestFit(); 
end;

procedure TViewPropertiesFrm.GetDataWithWhereCont;
var
  sql: string;
begin
  sql := GetViewData(View.VIEW_NAME, View.OWNER);
  if edtDataFilter.Text <> 'Enter where clause' then
     sql := sql + edtDataFilter.Text;

  sql := sql + qViewData.SQLRefresh.Text;
  
  qViewData.Close;
  qViewData.SQL.Text := sql;
  qViewData.Open;
end; 

procedure TViewPropertiesFrm.edtDataFilterEnter(Sender: TObject);
begin
  inherited;
  if edtDataFilter.Text = 'Enter where clause' then edtDataFilter.CurText := '';
end;

procedure TViewPropertiesFrm.edtDataFilterExit(Sender: TObject);
begin
  inherited;
  if edtDataFilter.Text = '' then edtDataFilter.Text := 'Enter where clause';
end;

procedure TViewPropertiesFrm.edtDataFilterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key <> VK_RETURN	then exit;
  if edtDataFilter.Text = 'Enter where clause' then exit;

  if (edtDataFilter.Text <> '') AND (getFirstWord(UpperCase(edtDataFilter.Text)) <> 'WHERE')  then
  begin
    MessageDlg('You must enter first word equel WHERE clause', mtInformation, [mbOK], 0);
    exit;
  end;

  GetDataWithWhereCont;
end;

procedure TViewPropertiesFrm.dsViewDataStateChange(Sender: TObject);
begin
  inherited;
  sbData.Panels[0].Text := Format('Row %3d of %3d total rows', [dsViewData.DataSet.RecNo, dsViewData.DataSet.RecordCount]);
end;

procedure TViewPropertiesFrm.dsViewDataDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  dsViewDataStateChange(nil);
end;

procedure TViewPropertiesFrm.gridDataViewColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
var
  sort: TSort;
begin
  inherited;
  sort := TSort(Acolumn.SortOrder);
  if not TableSortFrm.Init(AColumn.Caption, sort) then exit;

  qViewData.SQLRefresh.Text := '';
  AColumn. SortIndex := -1;
  gridDataView.DataController.ClearSorting(false);

  if sort = sASC then
  begin
    qViewData.SQLRefresh.Text := ' ORDER BY '+AColumn.Caption + ' asc ';
    AColumn.SortOrder := soAscending;
  end;

  if sort = sDESC then
  begin
    qViewData.SQLRefresh.Text := ' ORDER BY '+AColumn.Caption + ' desc ';
    AColumn.SortOrder := soDescending;
  end;
  GetDataWithWhereCont;
end;

procedure TViewPropertiesFrm.popDataMultiSelectClick(Sender: TObject);
begin
  inherited;
  gridDataView.OptionsSelection.MultiSelect := popDataMultiSelect.Checked;
end;

procedure TViewPropertiesFrm.popDataSaveAsClick(Sender: TObject);
begin
  inherited;
  if DataSaveDialog.Execute then
  begin
    case DataSaveDialog.FilterIndex of
      1: ExportGridToText(DataSaveDialog.FileName, GridData,True,True,',','','');
      2: ExportGridToExcel(DataSaveDialog.FileName, GridData);
      3: ExportGridToHTML(DataSaveDialog.FileName, GridData);
      4: ExportGridToXML(DataSaveDialog.FileName, GridData);
    end;
  end;
end;

procedure TViewPropertiesFrm.popDataFindDataClick(Sender: TObject);
var
  i: integer;
  col: string;
begin
  inherited;
  for i := 0 to gridDataView.ColumnCount -1 do
      if gridDataView.Columns[i].Focused then
         col := gridDataView.Columns[i].Caption;
  TableFindFrm.Init(qViewData, col);
end;

procedure TViewPropertiesFrm.popDataRecordCountClick(Sender: TObject);
begin
  inherited;
  MessageDlg('Record count : '+IntToStr(View.RecordCount), mtInformation, [mbOK], 0);
end;

{*******************************************************************************}
{                            G R A N T S                                        }
{*******************************************************************************}
procedure TViewPropertiesFrm.btnRefreshGrantsClick(Sender: TObject);
begin
  inherited;
  View.GrantList.SetDDL;
  vtGrants.close;
  vtGrants.Assign(View.GrantList.DSGrantList);
  vtGrants.Open;
end;

procedure TViewPropertiesFrm.bbtnGrantPrivilegesClick(Sender: TObject);
begin
  inherited;
  if GrantsFrm.Init(View.GrantList) then
     GetView;
end;

{*******************************************************************************}
{                            T R I G E R S                                      }
{*******************************************************************************}

procedure TViewPropertiesFrm.GetTriggers;
begin
  qTrigger.close;
  qTrigger.Session := View.OraSession;
  qTrigger.SQL.Text := GetOraTriggers;
  qTrigger.ParamByName('pName').AsString := FViewName;
  qTrigger.ParamByName('pOwner').AsString := FOwner;
  qTrigger.ParamByName('pType').AsString := 'VIEW';
  qTrigger.Open;
  GetTriggerDetail;
end;   

procedure TViewPropertiesFrm.GridTrigersDBTableView1CanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  GetTriggerDetail;
end;

procedure TViewPropertiesFrm.GetTriggerDetail;
var
  t: TTrigger;
  TriggerName: string;
begin
  editTriggers.Lines.Clear;
  if not qTrigger.Active then exit;
  if qTrigger.RecordCount = 0 then exit;
  TriggerName := qTrigger.FieldByName('TRIGGER_NAME').AsString;
  if TriggerName = '' then exit;

  t := TTrigger.Create;
  t.OraSession := View.OraSession;
  t.TRIGGER_NAME := TriggerName;
  t.Owner := FOwner;
  t.SetDDL;
  editTriggers.Text := t.GetDDL;
  CodeColors(self, 'Default', editTriggers, false);
end;

procedure TViewPropertiesFrm.bbtnCreateTriggerClick(Sender: TObject);
var
  t: TTrigger;
begin
  inherited;
  t := TTrigger.Create;
  t.OraSession := View.OraSession;
  t.TRIGGER_NAME := '';
  t.Owner := FOwner;
  t.TABLE_NAME := FViewName;
  t.TABLE_OWNER := FOwner;
  t.BASE_OBJECT_TYPE := 'VIEW';
  if TriggerDetailFrm.Init(t) then
  begin
    GetTriggers;
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
  end;  
end;

procedure TViewPropertiesFrm.bbtnAlterTriggerClick(Sender: TObject);
var
  t: TTrigger;
  TriggerName: string;
begin
  inherited;
  if not qTrigger.Active then exit;
  if qTrigger.RecordCount = 0 then exit;
  TriggerName := qTrigger.FieldByName('TRIGGER_NAME').AsString;
  if TriggerName = '' then exit;

  t := TTrigger.Create;
  t.OraSession := View.OraSession;
  t.TRIGGER_NAME := TriggerName;
  t.Owner := FOwner;
  t.SetDDL;
  TriggerDetailFrm.Init(t);
  GetTriggers;
end;

procedure TViewPropertiesFrm.bbtnDropTriggerClick(Sender: TObject);
var
  trigger: TTrigger;
  TriggerName: string;
begin
  inherited;
  if not qTrigger.Active then exit;
  if qTrigger.RecordCount = 0 then exit;
  TriggerName := qTrigger.FieldByName('TRIGGER_NAME').AsString;
  if TriggerName = '' then exit;

  trigger := TTrigger.Create;
  trigger.OraSession := View.OraSession;
  trigger.TRIGGER_NAME := TriggerName;
  trigger.Owner := FOwner;

  if SchemaPublicEventFrm.Init(trigger, oeDrop) then
     GetTriggers;
end;

procedure TViewPropertiesFrm.bbtnEnableTriggerClick(Sender: TObject);
var
  trigger: TTrigger;
  TriggerName: string;
begin
  inherited;
  if not qTrigger.Active then exit;
  if qTrigger.RecordCount = 0 then exit;
  TriggerName := qTrigger.FieldByName('TRIGGER_NAME').AsString;
  if TriggerName = '' then exit;

  trigger := TTrigger.Create;
  trigger.OraSession := View.OraSession;
  trigger.TRIGGER_NAME := TriggerName;
  trigger.Owner := FOwner;

  if SchemaPublicEventFrm.Init(trigger, oeEnable) then
     GetTriggers;
end;

procedure TViewPropertiesFrm.bbtnEnableAllTriggersClick(Sender: TObject);
begin
  inherited;
  if View.VIEW_NAME= '' then exit;
  if View = nil then exit;
  if SchemaPublicEventFrm.Init(View, oeEnableTriggers) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
end;

procedure TViewPropertiesFrm.bbtnDisableTriggerClick(Sender: TObject);
var
  trigger: TTrigger;
  TriggerName: string;
begin
  inherited;
  if not qTrigger.Active then exit;
  if qTrigger.RecordCount = 0 then exit;
  TriggerName := qTrigger.FieldByName('TRIGGER_NAME').AsString;
  if TriggerName = '' then exit;

  trigger := TTrigger.Create;
  trigger.OraSession := View.OraSession;
  trigger.TRIGGER_NAME := TriggerName;
  trigger.Owner := FOwner;

  if SchemaPublicEventFrm.Init(trigger, oeDisable) then
     GetTriggers;
end;

procedure TViewPropertiesFrm.bbtnDisableAllTriggersClick(Sender: TObject);
begin
  inherited;
  if View.VIEW_NAME= '' then exit;
  if View = nil then exit;
  if SchemaPublicEventFrm.Init(View, oeDisableTriggers) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
end;     

procedure TViewPropertiesFrm.bbtnCompileTriggerClick(Sender: TObject);
var
  trigger: TTrigger;
  TriggerName: string;
begin
  inherited;
  if not qTrigger.Active then exit;
  if qTrigger.RecordCount = 0 then exit;
  TriggerName := qTrigger.FieldByName('TRIGGER_NAME').AsString;
  if TriggerName = '' then exit;

  trigger := TTrigger.Create;
  trigger.OraSession := View.OraSession;
  trigger.TRIGGER_NAME := TriggerName;
  trigger.Owner := FOwner;

  if SchemaPublicEventFrm.Init(trigger, oeCompile) then
     GetTriggers;
end;

procedure TViewPropertiesFrm.bbtnRefreshTriggerClick(Sender: TObject);
begin
  inherited;
  GetTriggers;
end;

{*******************************************************************************}
{                              S Y N O N Y M S                                  }
{*******************************************************************************}
procedure TViewPropertiesFrm.bbtnCreateSynonymClick(Sender: TObject);
begin
  inherited;
  if SynonymsFrm.Init(view.SynonymList) then
  begin
    GetView;
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbSynonyms);
  end;
end;

procedure TViewPropertiesFrm.bbtnDropSynonymClick(Sender: TObject);
var
  SynonymList: TSynonymList;
  FSynonym: TSynonym;
begin
  inherited;
  if not vtSynonyms.Active then exit;
  new(FSynonym);
  FSynonym^.Owner := FOwner;
  FSynonym^.SynonymName := vtSynonyms.FieldByName('SYNONYM_NAME').AsString;
  FSynonym^.TableOwner := vtSynonyms.FieldByName('TABLE_OWNER').AsString;
  FSynonym^.TableName := vtSynonyms.FieldByName('TABLE_NAME').AsString;

  SynonymList := TSynonymList.Create;
  SynonymList.OraSession := View.OraSession;
  SynonymList.TableOwner := FOwner;
  SynonymList.TableName := FViewName;
  SynonymList.SynonymAdd(FSynonym);

  if SchemaPublicEventFrm.Init(SynonymList, oeDrop) then
     GetView;
end;

procedure TViewPropertiesFrm.bbtnRefreshSynonymClick(Sender: TObject);
begin
  inherited;
  View.SynonymList.SetDDL;
  vtSynonyms.close;
  vtSynonyms.Assign(View.SynonymList.DSSynonymList);
  vtSynonyms.Open;
end;

{*******************************************************************************}
{                              U S E D                                          }
{*******************************************************************************}

procedure TViewPropertiesFrm.GetUsed;
begin
  vtUsed.Close;
  vtUsed.Assign(View.UsedByList);
  vtUsed.Open;
end;

{*******************************************************************************}
{                              U S E S                                          }
{*******************************************************************************}

procedure TViewPropertiesFrm.GetUses;
begin
  vtUses.Close;
  vtUses.Assign(View.UsesList);
  vtUses.Open;
end;







end.
