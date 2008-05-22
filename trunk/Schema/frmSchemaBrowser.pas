unit frmSchemaBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxsbar, ComCtrls, StdCtrls, dxDockControl, ExtCtrls,
  dxDockPanel, ImgList, DB, MemDS, DBAccess, Ora,
  Registry, Global, OraSmart, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxTextEdit, cxInplaceContainer, cxControls,
  dxNavBarCollns, cxClasses, dxNavBarBase, dxNavBar, cxPC,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  Grids, DBGrids, GenelDM,  cxContainer, cxTreeView,

  //
  OraQueryThread, frmBaseForm, Util, OraScripts, OraBarConn, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  OraScript, cxLabel, cxImage, cxGroupBox, Contnrs, OraErrHand, OraError, DBQuery,
  dxBar, Menus, oraStorage, cxHeader, jpeg, cxListView;

type

  TSchemaBrowserFrm = class(TForm)
    dxDockingManager1: TdxDockingManager;
    dsHost: TdxDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dpOutput: TdxDockPanel;
    memOutput: TMemo;
    dpToolbox: TdxDockPanel;
    TimerConnected: TTimer;
    dxLayoutDockSite3: TdxLayoutDockSite;
    cxStyleRepository1: TcxStyleRepository;
    DockObjectsPanel: TdxDockPanel;
    dxLayoutDockSite4: TdxLayoutDockSite;
    popupSchema: TPopupMenu;
    miCreateTables: TMenuItem;
    miCreateViews: TMenuItem;
    cxHeader1: TcxHeader;
    lcIndexSchema: TcxLookupComboBox;
    treeBrowser: TcxTreeView;
    popupTable: TPopupMenu;
    miCreateTable: TMenuItem;
    miCreateIndexes: TMenuItem;
    miCreateTriggers: TMenuItem;
    miCreateSequences: TMenuItem;
    miCreatePackages: TMenuItem;
    miCreateProcedures: TMenuItem;
    miCreateFunctions: TMenuItem;
    miCreateTypes: TMenuItem;
    miCreateSynonyms: TMenuItem;
    miCreatePublicSynonyms: TMenuItem;
    miCreateDatabaseLinks: TMenuItem;
    miCreateUsers: TMenuItem;
    miCreateRoles: TMenuItem;
    miCreateSystemPrivs: TMenuItem;
    miCreateDirectories: TMenuItem;
    miCreateRollbackSegments: TMenuItem;
    miCreateTablespaces: TMenuItem;
    miCizgi: TMenuItem;
    miRefreshObjects: TMenuItem;
    miAlterTable: TMenuItem;
    popupView: TPopupMenu;
    miCreateView: TMenuItem;
    miTableName: TMenuItem;
    N1: TMenuItem;
    miAlterView: TMenuItem;
    ViewName1: TMenuItem;
    N2: TMenuItem;
    popupIndex: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    miCreateIndex: TMenuItem;
    miAlterIndex: TMenuItem;
    miDropTable: TMenuItem;
    miAddColumn: TMenuItem;
    miAddIndex: TMenuItem;
    miAddKeys: TMenuItem;
    miAddForeignKey: TMenuItem;
    miAddCheck: TMenuItem;
    miTableAddTrigger: TMenuItem;
    miTableGrants: TMenuItem;
    miTableSynonym: TMenuItem;
    Constraint1: TMenuItem;
    miTableEnableAllConstraint: TMenuItem;
    miTableDisableAllConstraint: TMenuItem;
    rigger1: TMenuItem;
    miTableEnableAllTrigger: TMenuItem;
    miTableDisableAllTrigger: TMenuItem;
    miTableExportData: TMenuItem;
    miTableExportDDL: TMenuItem;
    Export1: TMenuItem;
    miTableCreateSequence: TMenuItem;
    miViewGrants: TMenuItem;
    miViewSynonym: TMenuItem;
    rigger2: TMenuItem;
    miViewTrigger: TMenuItem;
    miViewEnableAllTrigger: TMenuItem;
    miViewDisableAllTrigger: TMenuItem;
    miDropView: TMenuItem;
    popupTrigger: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    miCreateTrigger: TMenuItem;
    miAlterTrigger: TMenuItem;
    miDropIndex: TMenuItem;
    miDropTrigger: TMenuItem;
    popupSequence: TPopupMenu;
    popupPackage: TPopupMenu;
    SequenceName1: TMenuItem;
    miCreateSequence: TMenuItem;
    miAlterSequence: TMenuItem;
    miDropSequence: TMenuItem;
    N3: TMenuItem;
    ProcedureName1: TMenuItem;
    N4: TMenuItem;
    miCreatePackage: TMenuItem;
    miAlterPackage: TMenuItem;
    miDropPackage: TMenuItem;
    miCompilePackage: TMenuItem;
    miExecutePackage: TMenuItem;
    miGrantPackage: TMenuItem;
    miSynonymPackage: TMenuItem;
    popupProcedure: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    miCreateProcedure: TMenuItem;
    miAlterProcedure: TMenuItem;
    miDropProcedure: TMenuItem;
    miCompileProcedure: TMenuItem;
    miExecuteProcedure: TMenuItem;
    miGrantProcedure: TMenuItem;
    miSynonymProcedure: TMenuItem;
    popupFunction: TPopupMenu;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    miCreateFunction: TMenuItem;
    miAlterFunction: TMenuItem;
    mDropFunction: TMenuItem;
    miCompileFunction: TMenuItem;
    miExecuteFunction: TMenuItem;
    miGrantFunction: TMenuItem;
    miSynonymFunction: TMenuItem;
    popupType: TPopupMenu;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    miCreateType: TMenuItem;
    miAlterType: TMenuItem;
    miDropType: TMenuItem;
    miCompileType: TMenuItem;
    miExecuteType: TMenuItem;
    miGrantType: TMenuItem;
    miSynonymType: TMenuItem;
    popupSynonym: TPopupMenu;
    SynonymName1: TMenuItem;
    N5: TMenuItem;
    miCreateSynonym: TMenuItem;
    miDropSynonym: TMenuItem;
    popupDBLink: TPopupMenu;
    DBlinkName1: TMenuItem;
    N6: TMenuItem;
    miCreateDBLink: TMenuItem;
    miDropDBLink: TMenuItem;
    miAlterDBLink: TMenuItem;
    N7: TMenuItem;
    miCreateMaterializedView: TMenuItem;
    miCreateMaterializedViewLog: TMenuItem;
    miCreateMaterializedViews: TMenuItem;
    miCreateMaterializedViewLogs: TMenuItem;
    miCizgi2: TMenuItem;
    popupUser: TPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    miCreateUser: TMenuItem;
    miAlteruser: TMenuItem;
    miDropUser: TMenuItem;
    popupDirectory: TPopupMenu;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    miCreateDirectory: TMenuItem;
    miAlterDirectory: TMenuItem;
    miDropDirectory: TMenuItem;
    popupRollbackSegment: TPopupMenu;
    MenuItem13: TMenuItem;
    MenuItem16: TMenuItem;
    miCreateRollbackSegment: TMenuItem;
    miAlterRollbackSegment: TMenuItem;
    miDropRollbackSegment: TMenuItem;
    popupTablespace: TPopupMenu;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    miCreateTablespace: TMenuItem;
    miAlterTablespace: TMenuItem;
    miDropTablespace: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerConnectedTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    
    procedure treeBrowserChange(Sender: TObject; Node: TTreeNode);
    procedure treeBrowserChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure lcIndexSchemaPropertiesEditValueChanged(Sender: TObject);
    procedure treeBrowserMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure treeBrowserExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure miRefreshObjectsClick(Sender: TObject);
    procedure miCreateViewClick(Sender: TObject);
    procedure miCreateTableClick(Sender: TObject);
    procedure miAlterTableClick(Sender: TObject);
    procedure miDropTableClick(Sender: TObject);
    procedure miTableCreateSequenceClick(Sender: TObject);
    procedure miAddColumnClick(Sender: TObject);
    procedure miAddIndexClick(Sender: TObject);
    procedure miTableGrantsClick(Sender: TObject);
    procedure miTableSynonymClick(Sender: TObject);
    procedure miAddKeysClick(Sender: TObject);
    procedure miAddForeignKeyClick(Sender: TObject);
    procedure miAddCheckClick(Sender: TObject);
    procedure miTableEnableAllConstraintClick(Sender: TObject);
    procedure miTableDisableAllConstraintClick(Sender: TObject);
    procedure miTableAddTriggerClick(Sender: TObject);
    procedure miTableEnableAllTriggerClick(Sender: TObject);
    procedure miTableDisableAllTriggerClick(Sender: TObject);
    procedure miAlterViewClick(Sender: TObject);
    procedure miViewTriggerClick(Sender: TObject);
    procedure miDropViewClick(Sender: TObject);
    procedure miViewEnableAllTriggerClick(Sender: TObject);
    procedure miCreateTablesClick(Sender: TObject);
    procedure miViewDisableAllTriggerClick(Sender: TObject);
    procedure miViewSynonymClick(Sender: TObject);
    procedure miViewGrantsClick(Sender: TObject);
    procedure miCreateIndexClick(Sender: TObject);
    procedure miAlterIndexClick(Sender: TObject);
    procedure miCreateViewsClick(Sender: TObject);
    procedure miCreateIndexesClick(Sender: TObject);
    procedure miCreateTriggersClick(Sender: TObject);
    procedure miCreateTriggerClick(Sender: TObject);
    procedure miAlterTriggerClick(Sender: TObject);
    procedure miDropTriggerClick(Sender: TObject);
    procedure miDropIndexClick(Sender: TObject);
    procedure miCreateSequencesClick(Sender: TObject);
    procedure miCreateSequenceClick(Sender: TObject);
    procedure miAlterSequenceClick(Sender: TObject);
    procedure miDropSequenceClick(Sender: TObject);
    procedure miCreatePackagesClick(Sender: TObject);
    procedure miCreatePackageClick(Sender: TObject);
    procedure miAlterPackageClick(Sender: TObject);
    procedure miDropPackageClick(Sender: TObject);
    procedure miCompilePackageClick(Sender: TObject);
    procedure miExecutePackageClick(Sender: TObject);
    procedure miGrantPackageClick(Sender: TObject);
    procedure miSynonymPackageClick(Sender: TObject);
    procedure miCreateProceduresClick(Sender: TObject);
    procedure miCreateFunctionsClick(Sender: TObject);
    procedure miCreateTypesClick(Sender: TObject);
    procedure miCreateSynonymClick(Sender: TObject);
    procedure miDropSynonymClick(Sender: TObject);
    procedure miCreateSynonymsClick(Sender: TObject);
    procedure miCreatePublicSynonymsClick(Sender: TObject);
    procedure miCreateDBLinkClick(Sender: TObject);
    procedure miAlterDBLinkClick(Sender: TObject);
    procedure miDropDBLinkClick(Sender: TObject);
    procedure miCreateDatabaseLinksClick(Sender: TObject);
    procedure miCreateMaterializedViewClick(Sender: TObject);
    procedure miCreateMaterializedViewLogClick(Sender: TObject);
    procedure miCreateUserClick(Sender: TObject);
    procedure miAlteruserClick(Sender: TObject);
    procedure miDropUserClick(Sender: TObject);
    procedure miCreateDirectoryClick(Sender: TObject);
    procedure miAlterDirectoryClick(Sender: TObject);
    procedure miDropDirectoryClick(Sender: TObject);
    procedure miCreateRollbackSegmentClick(Sender: TObject);
    procedure miAlterRollbackSegmentClick(Sender: TObject);
    procedure miDropRollbackSegmentClick(Sender: TObject);
    procedure miCreateDirectoriesClick(Sender: TObject);
    procedure miCreateRollbackSegmentsClick(Sender: TObject);
    procedure miCreateUsersClick(Sender: TObject);
    procedure miCreateTablespaceClick(Sender: TObject);
    procedure miAlterTablespaceClick(Sender: TObject);
    procedure miDropTablespaceClick(Sender: TObject);
    procedure miCreateTablespacesClick(Sender: TObject);
  private
    { Private declarations }
    FBarConnection : TBarConnection;
    FOraSession: TOraSession;
    FBarConnName: string;

    time_connected: Integer;

    FormObj: TDBObjects;
    ActiveForm: TBaseform;
    oldForm: TBaseform;

    FThreads: TObjectList;

    FObjectName,
    FObjectOwner: string;
    FObjectType: TDBFormType;

    procedure SetObjectName(ObjectName: string);
    procedure PerformConnect;

    procedure CreateParentNode;
    procedure CreateChildNode(ParentNode :TTreeNode; FormType : TDBFormType);
    function FindNode(Text: string): TTreeNode;
    function FindChildNode(Text: string): TTreeNode;

  public
    { Public declarations }
    property BarConnName: String read FBarConnName write FBarConnName;
    property OraSession: TOraSession read FOraSession;
    property ObjectName: string read FObjectName write SetObjectName;
    property ObjectOwner: string read FObjectOwner write FObjectOwner;
    property ObjectType: TDBFormType read FObjectType write FObjectType;

    procedure LogSQL(msg: string = ''; comment: Boolean = true);
    procedure Init(ABarConnection : TBarConnection);
    procedure RefreshNode(FormType : TDBFormType);

  end;

type
  // Represents errors already "handled" (shown to user),
  // which can thus safely be ignored.
  THandledSQLError = class(Exception)
  end;

var
  SchemaBrowserFrm: TSchemaBrowserFrm;

implementation

{$R *.dfm}

uses VisualOptions, frmMain, frmSchemaBrowserList,
     frmTableEvents,
     OraTable,        frmTableProperties,        frmTableDetail,    frmTableColumns,
     OraIndex,        frmIndexProperties,        frmTableIndexes,
     OraTriger,       frmTriggerProperties,      frmTrigerDetail,
     OraView,         frmViewProperties,         frmViewDetail,
     OraSequence,     frmSequenceProperties,     frmSequenceDetail,
     OraProcSource,   frmProcedureProperties,    frmProcedureDetail, frmProcedureEditor,
     OraSynonym,      frmSynonymProperties,      frmSynonyms,
     OraDBLink,       frmDatabaseLinkProperties, frmDatabaseLinkDetail,
     OraGrants,       frmGrants,
     OraConstraint,   frmTableConstraints,
     OraMaterializedView,    frmMaterializedViewDetail,
     OraMaterializedViewLog, frmMaterializedViewLogDetail,
     OraUser,         frmUserProperties,
     OraSysPrivs,
     OraRole,
     OraDirectory,       frmDirectoryProperties,       frmDirectoryDetail,
     OraRollbackSegment, frmRollbackSegmentProperties, frmRollbackSegmentDetail,
     OraTablespace,      frmTablespaceProperties,      frmTablespaceDetail,
  frmUserDetail;

procedure TSchemaBrowserFrm.Init(ABarConnection : TBarConnection);
begin
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  FBarConnection := ABarConnection;
  FBarConnName := ABarConnection.Name;
  FThreads := TObjectList.create(false);

  if ABarConnection.Count = 1 then //mevcut baglantiyi kullan
  begin
     FOraSession := ABarConnection.Session;
  end
  else
  begin //yeni baglanti olustur
    try
      FOraSession := nil;
      FOraSession := TOraSession.Create(self);
      FOraSession.Username := ABarConnection.Session.Username;
      FOraSession.Password := ABarConnection.Session.Password;
      FOraSession.Server := ABarConnection.Session.Server;
      FOraSession.ConnectString := ABarConnection.Session.ConnectString;
      FOraSession.HomeName := ABarConnection.Session.HomeName;
      FOraSession.ConnectMode := ABarConnection.Session.ConnectMode;
      FOraSession.LoginPrompt := false;
      FOraSession.Connect;
    except
      on E : Exception do
      begin
        ShowMessage(E.Message);
        exit;
      end;
    end;
  end;
  Caption := FOraSession.Server+'/'+FOraSession.UserName+' - '+'Schema Browser';
  MainFrm.dxBarListWindows.Items.AddObject(Caption, Self);

  FObjectOwner := FOraSession.UserName;
  dmGenel.ReLoad(FOraSession);
  lcIndexSchema.Text := FObjectOwner;

  try
    PerformConnect;
  except
    Exit;
  end;

end;

procedure TSchemaBrowserFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  while FThreads.Count > 0 do
     Fthreads.Remove(TOraQueryThread(Fthreads[0]));

  FOraSession.Close;
  FormObj.Free;
  FThreads.Destroy;
  mainfrm.FormDelete(FBarConnection);

  with MainFrm.dxBarListWindows.Items do
       Delete(IndexOfObject(Self));

  action := caFree;
end;

procedure TSchemaBrowserFrm.FormActivate(Sender: TObject);
begin
  TimerConnected.OnTimer(self);
  if mainfrm.ActiveMDIChild = self then
    mainfrm.ShowConnButton(FBarConnection);
end;

procedure TSchemaBrowserFrm.LogSQL(msg: string = ''; comment: Boolean = true);
var
  s: string;
begin
  s := memOutput.Text;
  memOutput.Clear;
  memOutput.Lines.Add(DateTimeToStr(now)+' -> '+msg);
  memOutput.Lines.Add(s);
end;

procedure TSchemaBrowserFrm.PerformConnect;
begin
  try
    time_connected := 0;
    TimerConnected.Enabled := true;
    LogSQL( 'Connection established with host "' +FOraSession.Server);
    LogSQL( 'Connection-User: ' + FOraSession.Username );
    LogSQL( 'Oracle Version: ' + FOraSession.OracleVersion );

  except
    on E: Exception do
    begin
      LogSQL(E.Message, true);
      Screen.Cursor := crDefault;
      MessageDlg(E.Message, mtError, [mbOK], 0);
      raise;
    end;
  end;
end;


procedure TSchemaBrowserFrm.TimerConnectedTimer(Sender: TObject);
var
  hours, minutes, seconds : Integer;
begin
  inc(time_connected); 
  if mainfrm.ActiveMDIChild = self then
  begin
    // calculate and display connection-time
    seconds := time_connected mod (60*60*24);
    hours := seconds div (60*60);
    seconds := seconds mod (60*60);
    minutes := seconds div 60;
    seconds := seconds mod 60;
    mainfrm.showstatus( format('Connected: %.2d:%.2d:%.2d', [hours, minutes, seconds]), 1 );
  end;
end; 
                            
procedure TSchemaBrowserFrm.CreateParentNode;
var
  i: integer;
  Node: TTreeNode;
begin
  treeBrowser.Items.BeginUpdate;
  treeBrowser.Items.Clear;

  Node := treeBrowser.Items.AddObject(nil, 'Schema', nil);
  Node.HasChildren := true;
  Node.ImageIndex := 20;
  Node.SelectedIndex := 20;

  Node := treeBrowser.Items.AddObject(nil, 'Security', nil);
  Node.HasChildren := true;
  Node.ImageIndex := 21;
  Node.SelectedIndex := 21;

  Node := treeBrowser.Items.AddObject(nil, 'Storage', nil);
  Node.HasChildren := true;
  Node.ImageIndex := 22;
  Node.SelectedIndex := 22;


  FormObj := TDBObjects.Create;
  for i := 0 to 19 do
  begin
    FormObj.RegisterFrameClass(TSchemaBrowserListFrm);
    FormObj[i].PopMenu := popupSchema;
    FormObj[i].ObjectType := TDBFormType(i);
    if i <= 11 then
       Node := treeBrowser.Items.AddChildObject(FindNode('Schema'), FormObj[i].ObjectName, FormObj[i]);
    if (i > 11) and (i <= 14) then
       Node := treeBrowser.Items.AddChildObject(FindNode('Security'), FormObj[i].ObjectName, FormObj[i]);
    if (i > 14) then
       Node := treeBrowser.Items.AddChildObject(FindNode('Storage'), FormObj[i].ObjectName, FormObj[i]);

    Node.HasChildren := true;
    Node.ImageIndex := i;
    Node.SelectedIndex := i;
  end;

  treeBrowser.Items.EndUpdate;
end; //CreateParentNode

procedure TSchemaBrowserFrm.CreateChildNode(ParentNode :TTreeNode; FormType : TDBFormType);
var
  ds: TdataSource;
  index : integer;
  Node: TTreeNode;
  
  procedure FillTree(ColumnName: string; index: integer);
  begin
     if ds = nil then exit;
     ds.DataSet.First;
     while not ds.DataSet.Eof do
     begin
       Node := treeBrowser.Items.AddChildObject(ParentNode,
                                        ds.DataSet.fieldByName(ColumnName).AsString,
                                        FormObj[index]);
       Node.ImageIndex := integer(FormType);
       Node.SelectedIndex := integer(FormType);
       ds.DataSet.Next;
     end;

  end;
begin
  try
    treeBrowser.Items.BeginUpdate;
    index := FormObj.FramesCount;

    ds := TDataSource.Create(nil);
    
    if FormType = dbTable then
    begin
      ExecQuery(GetTables(FObjectOwner),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TTablePropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupTable;
      FillTree('TABLE_NAME', index);
    end;

    if FormType = dbView then
    begin
      ExecQuery(GetViews(FObjectOwner),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TViewPropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupView;
      FillTree('VIEW_NAME', index);
    end;

    if FormType = dbIndexes then
    begin
      ExecQuery(GetIndexes(FObjectOwner),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TIndexPropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupIndex;
      FillTree('INDEX_NAME', index);
    end;

    if FormType = dbTriggers then
    begin
      ExecQuery(GetTriggers(FObjectOwner),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TTriggerPropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupTrigger;
      FillTree('TRIGGER_NAME', index);
    end;

    if FormType = dbSequences then
    begin
      ExecQuery(GetSequences(FObjectOwner),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TSequencePropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupSequence;
      FillTree('SEQUENCE_NAME', index);
    end;

    if FormType = dbProcedures then
    begin
      ExecQuery(GetProcSources('PROCEDURE', FObjectOwner),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TProcedurePropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupProcedure;
      FillTree('OBJECT_NAME', index);
    end;

    if FormType = dbFunctions then
    begin
      ExecQuery(GetProcSources('FUNCTION', FObjectOwner),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TProcedurePropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupFunction;
      FillTree('OBJECT_NAME', index);
    end;

    if FormType = dbPackages then
    begin
      ExecQuery(GetProcSources('PACKAGE', FObjectOwner),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TProcedurePropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupPackage;
      FillTree('OBJECT_NAME', index);
    end;

    if FormType = dbTypes then
    begin
      ExecQuery(GetProcSources('TYPE', FObjectOwner),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TProcedurePropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupType;
      FillTree('OBJECT_NAME', index);
    end;

    if FormType = dbSynonyms then
    begin
      ExecQuery(GetSynonyms(FObjectOwner),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TSynonymPropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupSynonym;
      FillTree('SYNONYM_NAME', index);
    end;

    if FormType = dbPublicSynonyms then
    begin
      ExecQuery(GetSynonyms('PUBLIC'),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TSynonymPropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupSynonym;
      FillTree('SYNONYM_NAME', index);
    end;

    if FormType = dbDatabaseLinks then
    begin
      ExecQuery(GetDBLinks(FObjectOwner),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TDatabaseLinkPropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupDBLink;
      FillTree('DB_LINK', index);
    end;

    if FormType = dbUsers then
    begin
      ExecQuery(GetUsers(),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TUserPropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupUser;
      FillTree('USERNAME', index);
    end;

    if FormType = dbSysPrivs then
    begin
      ExecQuery(GetSysPrivs(),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TSchemaBrowserListFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := nil;
      FillTree('NAME', index);
    end;

    if FormType = dbRoles then
    begin
      ExecQuery(GetRoles(),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TSchemaBrowserListFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := nil;
      FillTree('ROLE', index);
    end;

    if FormType = dbDirectories then
    begin
      ExecQuery(GetDBDirectories(),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TDirectoryPropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupDirectory;
      FillTree('DIRECTORY_NAME', index);
    end;

    if FormType = dbRollbackSegments then
    begin
      ExecQuery(GetRollbackSegments(),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TRollbackSegmentPropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupRollbackSegment;
      FillTree('SEGMENT_NAME', index);
    end;

    if FormType = dbTablespaces then
    begin
      ExecQuery(GetTablespaces(),'', ds, FOraSession);
      FormObj.RegisterFrameClass(TTablespacePropertiesFrm);
      FormObj[index].ObjectType := FormType;
      FormObj[index].PopMenu := popupTablespace;
      FillTree('TABLESPACE_NAME', index);
    end;

    if ds.DataSet = nil then
    begin
       ParentNode.HasChildren := false;
       ParentNode.Text := DBFormType[FormType] +' [0]';
    end;

    if ds.DataSet <> nil then
       ParentNode.Text := DBFormType[FormType] +' ['+IntTostr(ds.DataSet.RecordCount)+']';
    treeBrowser.Items.EndUpdate;
  finally
    ds.DataSet.Close;
    FreeAndNil(ds);
  end;
end;

procedure TSchemaBrowserFrm.treeBrowserChange(Sender: TObject;
  Node: TTreeNode);
begin

end;


{*******************************************************************************}
{                        T A B L E                                              }
{*******************************************************************************}

procedure TSchemaBrowserFrm.treeBrowserChanging(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);
var
  answer: word;
begin
  if treeBrowser.Tag = 9 then exit;
  if Node.Data = nil then exit;
  if TBaseform(Node.Data).ObjectType = dbTable then
  begin
    if (TBaseform(Node.Data) = TablePropertiesfrm) then
      if TTablePropertiesFrm(TBaseform(Node.Data)).DataChanged then
      begin
        answer := MessageDlg('Table '+FObjectName+' has been modified. Save changes ?',mtConfirmation, [mbYes, mbNo, mbCancel], 0);
        if answer =  mrYes then TTablePropertiesFrm(TBaseform(Node.Data)).CommitData;
        if answer =  mrNo then TTablePropertiesFrm(TBaseform(Node.Data)).RoolbackData;
        if answer =  mrCancel then AllowChange := false;
      end;
  end;
end;

{*******************************************************************************}
{                        B R O W S E R                                          }
{*******************************************************************************}

procedure TSchemaBrowserFrm.SetObjectName(ObjectName: string);
begin
  FObjectName := ObjectName;
end;

procedure TSchemaBrowserFrm.lcIndexSchemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  treeBrowser.Tag := 9;
  FObjectOwner := lcIndexSchema.Text;
  if ActiveForm <> nil then ActiveForm.Close;
  CreateParentNode;
  treeBrowser.Tag := 0;
end;

procedure TSchemaBrowserFrm.treeBrowserMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node: TTreeNode;
  form : TBaseform;
  pt: TPoint;
  i: integer;
begin
  if treeBrowser.Tag = 9 then exit;
  if (Button = mbRight) or (Button = mbLeft) Then
  begin
    Node:= treeBrowser.GetNodeAt(x,y);
    if Node <> Nil then
    begin
      if Node.Data = nil then exit;
      Node.Selected:= True;

      begin
        if ActiveForm = nil then
           ActiveForm := TBaseform(Node.Data);

        if ActiveForm <> TBaseform(Node.Data) then
        begin
           ActiveForm.Close;
           ActiveForm := nil;
        end;

        ActiveForm := TBaseform(Node.Data);
        form := TBaseform(Node.Data);

        FObjectType := TBaseform(Node.Data).ObjectType;
        FObjectName := Node.Text;

        DockObjectsPanel.Caption := FObjectName;

        Self.Caption := FOraSession.Server+'/'+FObjectOwner+' - '+'Schema Browser' +' ('+FObjectName+')';
        with MainFrm.dxBarListWindows do
             Items[Items.IndexOfObject(Self)] := Self.Caption ;

        form.Parent := DockObjectsPanel;
        form.Show;
        if (ActiveForm <> oldForm) or (pos(form.name,'SchemaBrowserListFrm')<= 0)  then //yeni
           form.Init(FObjectName, FObjectOwner);
        oldForm := ActiveForm;
      end;
    end;

   if (Button = mbRight) then
   begin
     pt := treeBrowser.ClientOrigin;

     for i := 0 to popupSchema.Items.Count -1 do
         popupSchema.Items[i].Visible := i = Integer(ActiveForm.ObjectType);
     miCizgi.Visible := true;
     miRefreshObjects.Visible := true;

     miCreateMaterializedViews.Visible := ActiveForm.ObjectType = dbTable;
     miCreateMaterializedViewLogs.Visible := ActiveForm.ObjectType = dbTable;
     miCizgi2.Visible := ActiveForm.ObjectType = dbTable;

     if ActiveForm.PopMenu <> nil then
     begin
       if ActiveForm.PopMenu <> popupSchema then
          ActiveForm.PopMenu.Items[0].Caption := FObjectName;
       ActiveForm.PopMenu.Popup(pt.X + x, pt.Y+ y);
     end;
   end;
  end;
end;

procedure TSchemaBrowserFrm.treeBrowserExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
   if (Node.Parent <> nil) and (Node.Count = 0) and (Node.Data <> nil) then
      CreateChildNode(Node, TBaseform(Node.Data).ObjectType);
end;

procedure TSchemaBrowserFrm.RefreshNode(FormType : TDBFormType);
var
  Node: TTreeNode;
  SelectNode: string;
begin
  Node := FindChildNode(DBFormType[FormType]);
  if Node = nil then exit;

  SelectNode := treeBrowser.Selected.Text;

  Node.DeleteChildren;
  CreateChildNode(Node, FormType);
  node.Expanded := true;
  if SelectNode <> '' then
  begin
    Node := FindChildNode(SelectNode);
    ActiveForm.Close;
    if Node = nil then exit;
    treeBrowser.Selected := Node;
    Node.Focused := true;
    ActiveForm.Init(FObjectName, FObjectOwner);
  end;
end;

procedure TSchemaBrowserFrm.miRefreshObjectsClick(Sender: TObject);
begin
  RefreshNode(ActiveForm.ObjectType);
end;

function TSchemaBrowserFrm.FindNode(Text: string): TTreeNode;
begin
  Result := treeBrowser.Items[0];
  while not ((Pos(Text, Result.Text)>0) and (Result.Parent = nil))
    and (Result <> nil) do
    Result := Result.GetNext;
end;

function TSchemaBrowserFrm.FindChildNode(Text: string): TTreeNode;
begin
  try
    Result := treeBrowser.Items[0];
    while not ((Pos(Text, Result.Text)>0) and (Result.Parent <> nil))
      and (Result <> nil) do
      Result := Result.GetNext;
  except
    Result := nil;
  end;
end;

{******************************************************************************}
{                       CREATE OBJECT EVENTS                                   }
{******************************************************************************}
procedure TSchemaBrowserFrm.miCreateTablesClick(Sender: TObject);
var
  FTable: TTable;
begin
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := '';
  FTable.OWNER := FObjectOwner;
  if TableDetailFrm.Init(FTable) then
     RefreshNode(dbTable);
end;

procedure TSchemaBrowserFrm.miCreateViewsClick(Sender: TObject);
var
  v: TView;
begin
  v := TView.Create;
  v.VIEW_NAME := '';
  v.OWNER := FObjectOwner;
  v.OraSession := FOraSession;
  if ViewDetailFrm.Init(v) then
     RefreshNode(dbView);
end;

procedure TSchemaBrowserFrm.miCreateIndexesClick(Sender: TObject);
var
  FTableIndex : TTableIndex;
begin
  FTableIndex := TTableIndex.Create;
  FTableIndex.IndexName := '';
  FTableIndex.IndexSchema := FObjectOwner;
  FTableIndex.TableName := '';
  FTableIndex.TableSchema := FObjectOwner;
  FTableIndex.OraSession := FOraSession;
  if TableIndexesFrm.Init(FTableIndex) then
     RefreshNode(dbIndexes);
end;

procedure TSchemaBrowserFrm.miCreateTriggersClick(Sender: TObject);
var
  t: TTrigger;
begin
  t := TTrigger.Create;
  t.OraSession := FOraSession;
  t.TRIGGER_NAME := '';
  t.Owner := FObjectOwner;
  t.TABLE_NAME := '';
  t.TABLE_OWNER := FObjectOwner;
  t.BASE_OBJECT_TYPE := 'TABLE';
  if TriggerDetailFrm.Init(t) then
    RefreshNode(dbTriggers);
end;

procedure TSchemaBrowserFrm.miCreateSequencesClick(Sender: TObject);
var
  s: TSequence;
begin
  s := TSequence.Create;
  s.OWNER := FObjectOwner;
  s.SEQUENCE_NAME := '';
  s.OraSession := FOraSession;
  if SequenceDetailFrm.Init(s) then
    RefreshNode(dbSequences);
end;

procedure TSchemaBrowserFrm.miCreatePackagesClick(Sender: TObject);
var
  f : TProcedureEditorFrm;
  ProcSource, FProcSource : TProcSource;
begin
  ProcSource := TProcSource.Create;
  ProcSource.OraSession := FOraSession;
  ProcSource.SOURCE_NAME := '';
  ProcSource.OWNER := FObjectOwner;
  ProcSource.SOURCE_TYPE := stPackage;

  FProcSource := ProcedureDetailFrm.Init(ProcSource);
  if FProcSource <> nil then
  begin
    ProcSource.Mode := InsertMode;
    f := TProcedureEditorFrm.Create(Application);
    f.Init(FProcSource);
  end;
end;

procedure TSchemaBrowserFrm.miCreateProceduresClick(Sender: TObject);
var
  f : TProcedureEditorFrm;
  ProcSource, FProcSource : TProcSource;
begin
  ProcSource := TProcSource.Create;
  ProcSource.OraSession := FOraSession;
  ProcSource.SOURCE_NAME := '';
  ProcSource.OWNER := FObjectOwner;
  ProcSource.SOURCE_TYPE := stProcedure;

  FProcSource := ProcedureDetailFrm.Init(ProcSource);
  if FProcSource <> nil then
  begin
    ProcSource.Mode := InsertMode;
    f := TProcedureEditorFrm.Create(Application);
    f.Init(FProcSource);
  end;
end;

procedure TSchemaBrowserFrm.miCreateFunctionsClick(Sender: TObject);
var
  f : TProcedureEditorFrm;
  ProcSource, FProcSource : TProcSource;
begin
  ProcSource := TProcSource.Create;
  ProcSource.OraSession := FOraSession;
  ProcSource.SOURCE_NAME := '';
  ProcSource.OWNER := FObjectOwner;
  ProcSource.SOURCE_TYPE := stFunction;

  FProcSource := ProcedureDetailFrm.Init(ProcSource);
  if FProcSource <> nil then
  begin
    ProcSource.Mode := InsertMode;
    f := TProcedureEditorFrm.Create(Application);
    f.Init(FProcSource);
  end;
end;

procedure TSchemaBrowserFrm.miCreateTypesClick(Sender: TObject);
var
  f : TProcedureEditorFrm;
  ProcSource, FProcSource : TProcSource;
begin
  ProcSource := TProcSource.Create;
  ProcSource.OraSession := FOraSession;
  ProcSource.SOURCE_NAME := '';
  ProcSource.OWNER := FObjectOwner;
  ProcSource.SOURCE_TYPE := stType;

  FProcSource := ProcedureDetailFrm.Init(ProcSource);
  if FProcSource <> nil then
  begin
    ProcSource.Mode := InsertMode;
    f := TProcedureEditorFrm.Create(Application);
    f.Init(FProcSource);
  end;
end;

procedure TSchemaBrowserFrm.miCreateSynonymsClick(Sender: TObject);
var
  FSynonymList : TSynonymList;
begin
  FSynonymList := TSynonymList.Create;
  FSynonymList.OraSession := FOraSession;
  FSynonymList.TableOwner := FObjectOwner;
  if SynonymsFrm.Init(FSynonymList) then
     RefreshNode(dbSynonyms);
end;

procedure TSchemaBrowserFrm.miCreatePublicSynonymsClick(Sender: TObject);
var
  FSynonymList : TSynonymList;
begin
  FSynonymList := TSynonymList.Create;
  FSynonymList.OraSession := FOraSession;
  FSynonymList.TableOwner := FObjectOwner;
  if SynonymsFrm.Init(FSynonymList) then
     RefreshNode(dbPublicSynonyms);
end;

procedure TSchemaBrowserFrm.miCreateDatabaseLinksClick(Sender: TObject);
var
  FDBLink : TDBLink;
begin
  FDBLink := TDBLink.Create;
  FDBLink.OraSession := FOraSession;
  FDBLink.Mode := InsertMode;
  if DatabaseLinkDetailFrm.Init(FDBLink) then
     RefreshNode(dbDatabaseLinks);
end;

procedure TSchemaBrowserFrm.miCreateUsersClick(Sender: TObject);
var
  User: TUser;
begin
  inherited;
  User := TUser.Create;
  User.USERNAME := '';
  User.OraSession := FOraSession;
  if UserDetailFrm.Init(User) then
    RefreshNode(dbUsers);
end;

procedure TSchemaBrowserFrm.miCreateDirectoriesClick(Sender: TObject);
var
  FDBDirectory : TDBDirectory;
begin
  FDBDirectory := TDBDirectory.Create;
  FDBDirectory.OraSession := FOraSession;
  if DirectoryDetailFrm.Init(FDBDirectory) then
     RefreshNode(dbDirectories);
end;

procedure TSchemaBrowserFrm.miCreateRollbackSegmentsClick(Sender: TObject);
var
  FRollbackSegment : TRollbackSegment;
begin
  FRollbackSegment := TRollbackSegment.Create;
  FRollbackSegment.OraSession := FOraSession;
  FRollbackSegment.Mode := InsertMode;
  if RollbackSegmentDetailFrm.Init(FRollbackSegment) then
     RefreshNode(dbRollbackSegments);
end;

procedure TSchemaBrowserFrm.miCreateTablespacesClick(Sender: TObject);
var
  FTablespace : TTablespace;
begin
  inherited;
  FTablespace := TTablespace.Create;
  FTablespace.OraSession := FOraSession;
  FTablespace.Mode := InsertMode;
  if TablespaceDetailFrm.Init(FTablespace) then
     RefreshNode(dbTablespaces);
end;

{******************************************************************************}
{                          TABLE EVENTS                                        }
{******************************************************************************}

procedure TSchemaBrowserFrm.miCreateTableClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnCreateTable.Click;
end;

procedure TSchemaBrowserFrm.miAlterTableClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnAlterTable.Click;
end;

procedure TSchemaBrowserFrm.miDropTableClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnDropTable.Click;
  ActiveForm.Close;
end;

procedure TSchemaBrowserFrm.miTableCreateSequenceClick(Sender: TObject);
var
  s: TSequence;
begin
  s := TSequence.Create;
  s.OWNER := FObjectOwner;
  s.SEQUENCE_NAME := 'SEQ_'+FObjectName;
  s.OraSession := FOraSession;
  if SequenceDetailFrm.Init(s) then
  begin
    ActiveForm.Init(FObjectName, FObjectOwner);
    RefreshNode(dbSequences);
  end;
end;

procedure TSchemaBrowserFrm.miAddColumnClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnAddColumn.Click;
end;

procedure TSchemaBrowserFrm.miAddIndexClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnAddColumn.Click;
end;

procedure TSchemaBrowserFrm.miTableGrantsClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnGrantPrivileges.Click;
end;

procedure TSchemaBrowserFrm.miTableSynonymClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnCreateSynonym.Click;
end;

procedure TSchemaBrowserFrm.miAddKeysClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnCreateKey.Click;
end;

procedure TSchemaBrowserFrm.miAddForeignKeyClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnCreateForeignKey.Click;
end;

procedure TSchemaBrowserFrm.miAddCheckClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnCreateCheck.Click;
end;

procedure TSchemaBrowserFrm.miTableEnableAllConstraintClick(
  Sender: TObject);
var
  FTable: TTable;
begin
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := FObjectName;
  FTable.OWNER := FObjectOwner;
  if TableEventsfrm.Init(FTable, oeEnableConstraints) then
     ActiveForm.Init(FObjectName, FObjectOwner);
end;

procedure TSchemaBrowserFrm.miTableDisableAllConstraintClick(
  Sender: TObject);
var
  FTable: TTable;
begin
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := FObjectName;
  FTable.OWNER := FObjectOwner;
  if TableEventsfrm.Init(FTable, oeDisableConstraints) then
     ActiveForm.Init(FObjectName, FObjectOwner);
end;

procedure TSchemaBrowserFrm.miTableAddTriggerClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnCreateTrigger.Click;
end;

procedure TSchemaBrowserFrm.miTableEnableAllTriggerClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnEnableAllTriggers.Click;
end;

procedure TSchemaBrowserFrm.miTableDisableAllTriggerClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablePropertiesFrm(ActiveForm).bbtnDisableAllTriggers.Click;
end;

procedure TSchemaBrowserFrm.miCreateMaterializedViewClick(Sender: TObject);
var
  FMaterializedView: TMaterializedView;
begin
  FMaterializedView := TMaterializedView.Create;
  FMaterializedView.NAME := '';
  FMaterializedView.OWNER := FObjectOwner;
  FMaterializedView.OraSession := FOraSession;
  if MaterializedViewDetailFrm.Init(FMaterializedView) then
     RefreshNode(dbTable);
end;

procedure TSchemaBrowserFrm.miCreateMaterializedViewLogClick(
  Sender: TObject);
var
  FMaterializedViewLog: TMaterializedViewLog;
begin
  FMaterializedViewLog := TMaterializedViewLog.Create;
  FMaterializedViewLog.TABLE_NAME := '';
  FMaterializedViewLog.OWNER := FObjectOwner;
  FMaterializedViewLog.OraSession := FOraSession;
  if MaterializedViewLogDetailFrm.Init(FMaterializedViewLog) then
     RefreshNode(dbTable);
end;
{******************************************************************************}
{                            VIEW EVENTS                                       }
{******************************************************************************}

procedure TSchemaBrowserFrm.miCreateViewClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TViewPropertiesFrm(ActiveForm).btnCreateView.Click;
end;

procedure TSchemaBrowserFrm.miAlterViewClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TViewPropertiesFrm(ActiveForm).btnAlterView.Click;
end;

procedure TSchemaBrowserFrm.miDropViewClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TViewPropertiesFrm(ActiveForm).btnDropView.Click;
  ActiveForm.Close;
end;

procedure TSchemaBrowserFrm.miViewTriggerClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TViewPropertiesFrm(ActiveForm).btnCreateView.Click;
end;

procedure TSchemaBrowserFrm.miViewEnableAllTriggerClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TViewPropertiesFrm(ActiveForm).bbtnEnableAllTriggers.Click;
end;

procedure TSchemaBrowserFrm.miViewDisableAllTriggerClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TViewPropertiesFrm(ActiveForm).bbtnDisableAllTriggers.Click;
end;

procedure TSchemaBrowserFrm.miViewSynonymClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TViewPropertiesFrm(ActiveForm).bbtnCreateSynonym.Click;
end;

procedure TSchemaBrowserFrm.miViewGrantsClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TViewPropertiesFrm(ActiveForm).bbtnGrantPrivileges.Click;
end;

{******************************************************************************}
{                            VIEW EVENTS                                       }
{******************************************************************************}

procedure TSchemaBrowserFrm.miCreateIndexClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TIndexPropertiesFrm(ActiveForm).bbtnCreateIndex.Click;
end;

procedure TSchemaBrowserFrm.miAlterIndexClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TIndexPropertiesFrm(ActiveForm).bbtnAlterIndex.Click;
end;

procedure TSchemaBrowserFrm.miDropIndexClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TIndexPropertiesFrm(ActiveForm).bbtnDropIndex.Click;
  ActiveForm.Close;
end;

{******************************************************************************}
{                         TRIGGER EVENTS                                       }
{******************************************************************************}

procedure TSchemaBrowserFrm.miCreateTriggerClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTriggerPropertiesFrm(ActiveForm).bbtnCreateTrigger.Click;
end;

procedure TSchemaBrowserFrm.miAlterTriggerClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTriggerPropertiesFrm(ActiveForm).bbtnAlterTrigger.Click;
end;

procedure TSchemaBrowserFrm.miDropTriggerClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTriggerPropertiesFrm(ActiveForm).bbtnDropTrigger.Click;
  ActiveForm.close;
end;

{******************************************************************************}
{                         SEQUENCE EVENTS                                      }
{******************************************************************************}

procedure TSchemaBrowserFrm.miCreateSequenceClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TSequencePropertiesFrm(ActiveForm).bbtnCreateSequence.Click;
end;

procedure TSchemaBrowserFrm.miAlterSequenceClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TSequencePropertiesFrm(ActiveForm).bbtnAlterSequence.Click;
end;

procedure TSchemaBrowserFrm.miDropSequenceClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TSequencePropertiesFrm(ActiveForm).bbtnDropSequence.Click;
  Activeform.close;
end;

{******************************************************************************}
{               PACKAGE/PROCEDURE/FUNCTION  EVENTS                             }
{******************************************************************************}

procedure TSchemaBrowserFrm.miCreatePackageClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TProcedurePropertiesFrm(ActiveForm).btnCreateProc.Click;
end;

procedure TSchemaBrowserFrm.miAlterPackageClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TProcedurePropertiesFrm(ActiveForm).btnAlterProc.Click;
end;

procedure TSchemaBrowserFrm.miDropPackageClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TProcedurePropertiesFrm(ActiveForm).btnDropProc.Click;
  ActiveForm.close;
end;

procedure TSchemaBrowserFrm.miCompilePackageClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TProcedurePropertiesFrm(ActiveForm).btnCompileProc.Click;
end;

procedure TSchemaBrowserFrm.miExecutePackageClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TProcedurePropertiesFrm(ActiveForm).bbtnExecPro.Click;
end;

procedure TSchemaBrowserFrm.miGrantPackageClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TProcedurePropertiesFrm(ActiveForm).bbtnGrantPrivileges.Click;
end;

procedure TSchemaBrowserFrm.miSynonymPackageClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TProcedurePropertiesFrm(ActiveForm).bbtnCreateSynonym.Click;
end;

{******************************************************************************}
{                          SYNONYM  EVENTS                                     }
{******************************************************************************}

procedure TSchemaBrowserFrm.miCreateSynonymClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TSynonymPropertiesFrm(ActiveForm).bbtnCreateSynonym.Click;
end;

procedure TSchemaBrowserFrm.miDropSynonymClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TSynonymPropertiesFrm(ActiveForm).bbtnDropSynonym.Click;
  ActiveForm.Close;
end;

{******************************************************************************}
{                          DB Link  EVENTS                                     }
{******************************************************************************}

procedure TSchemaBrowserFrm.miCreateDBLinkClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TDatabaseLinkPropertiesFrm(ActiveForm).bbtnCreateDBLink.Click;
end;

procedure TSchemaBrowserFrm.miAlterDBLinkClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TDatabaseLinkPropertiesFrm(ActiveForm).bbtnAlterDBLink.Click;
end;

procedure TSchemaBrowserFrm.miDropDBLinkClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TDatabaseLinkPropertiesFrm(ActiveForm).bbtnDropDBLink.Click;
  ActiveForm.Close;
end;

{******************************************************************************}
{                          USER  EVENTS                                        }
{******************************************************************************}

procedure TSchemaBrowserFrm.miCreateUserClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TUserPropertiesFrm(ActiveForm).bbtnCreateUser.Click;
end;

procedure TSchemaBrowserFrm.miAlteruserClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TUserPropertiesFrm(ActiveForm).bbtnAlterUser.Click;
end;

procedure TSchemaBrowserFrm.miDropUserClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TUserPropertiesFrm(ActiveForm).bbtnDropUser.Click;
  ActiveForm.Close;
end;

{******************************************************************************}
{                          USER  EVENTS                                        }
{******************************************************************************}

procedure TSchemaBrowserFrm.miCreateDirectoryClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TDirectoryPropertiesFrm(ActiveForm).bbtnCreateDirectory.Click;
end;

procedure TSchemaBrowserFrm.miAlterDirectoryClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TDirectoryPropertiesFrm(ActiveForm).bbtnAlterDirectory.Click;
end;

procedure TSchemaBrowserFrm.miDropDirectoryClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TDirectoryPropertiesFrm(ActiveForm).bbtnDropDirectory.Click;
  ActiveForm.Close;
end;

{******************************************************************************}
{                    ROLLBACK SEGMENT  EVENTS                                  }
{******************************************************************************}

procedure TSchemaBrowserFrm.miCreateRollbackSegmentClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TRollbackSegmentPropertiesFrm(ActiveForm).bbtnCreateRollbackSegment.Click;
end;

procedure TSchemaBrowserFrm.miAlterRollbackSegmentClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TRollbackSegmentPropertiesFrm(ActiveForm).bbtnAlterRollbackSegment.Click;
end;

procedure TSchemaBrowserFrm.miDropRollbackSegmentClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TRollbackSegmentPropertiesFrm(ActiveForm).bbtnDropRollbackSegment.Click;
  ActiveForm.Close;
end;

{******************************************************************************}
{                         TABLESPACE  EVENTS                                   }
{******************************************************************************}

procedure TSchemaBrowserFrm.miCreateTablespaceClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablespacePropertiesFrm(ActiveForm).bbtnCreateTablespace.Click;
end;

procedure TSchemaBrowserFrm.miAlterTablespaceClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablespacePropertiesFrm(ActiveForm).bbtnAlterTablespace.Click;
end;

procedure TSchemaBrowserFrm.miDropTablespaceClick(Sender: TObject);
begin
  if ActiveForm = nil then exit;
  TTablespacePropertiesFrm(ActiveForm).bbtnDropTablespace.Click;
  ActiveForm.Close;
end;


end.

