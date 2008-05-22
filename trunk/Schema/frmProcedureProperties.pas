unit frmProcedureProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, VirtualTable, MemDS, DBAccess, Ora,
  dxBar, StdCtrls, ExtCtrls, cxMemo, cxRichEdit, cxSplitter, cxTextEdit,
  cxLabel, cxContainer, cxGroupBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, jpeg, cxPC, frmBaseForm, OraProcSource,
  ComCtrls, cxListView;

type
  TProcedurePropertiesFrm = class(TBaseform)
    pcProcedureProperties: TcxPageControl;
    tsProcedureCode: TcxTabSheet;
    dxBarDockControl1: TdxBarDockControl;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edtName: TcxTextEdit;
    cxLabel2: TcxLabel;
    edtOwner: TcxTextEdit;
    tsProcedureGrants: TcxTabSheet;
    dxBarDockControl4: TdxBarDockControl;
    GridGrants: TcxGrid;
    GridGrantsDBTableView1: TcxGridDBTableView;
    GridGrantsDBTableView1Column1: TcxGridDBColumn;
    GridGrantsDBTableView1Column2: TcxGridDBColumn;
    GridGrantsDBTableView1Column3: TcxGridDBColumn;
    GridGrantsDBTableView1Column4: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    tsProcedureSynonyms: TcxTabSheet;
    dxBarDockControl6: TdxBarDockControl;
    GridSynonyms: TcxGrid;
    GridSynonymsDBTableView1: TcxGridDBTableView;
    GridSynonymsDBTableView1Column1: TcxGridDBColumn;
    GridSynonymsDBTableView1Column2: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    tsProcedureUsedBy: TcxTabSheet;
    GridUsed: TcxGrid;
    GridUsedDBTableView1: TcxGridDBTableView;
    GridUsedDBTableView1Column1: TcxGridDBColumn;
    GridUsedDBTableView1Column2: TcxGridDBColumn;
    GridUsedDBTableView1Column3: TcxGridDBColumn;
    GridUsedDBTableView1Column4: TcxGridDBColumn;
    GridUsedDBTableView1Column5: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    tsProcedureUses: TcxTabSheet;
    GridUses: TcxGrid;
    GridUsesDBTableView1: TcxGridDBTableView;
    GridUsesDBTableView1Column1: TcxGridDBColumn;
    GridUsesDBTableView1Column2: TcxGridDBColumn;
    GridUsesDBTableView1Column3: TcxGridDBColumn;
    GridUsesDBTableView1Column4: TcxGridDBColumn;
    GridUsesDBTableView1Column5: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel1: TPanel;
    lblDescription: TLabel;
    dxBarManager1: TdxBarManager;
    btnCreateProc: TdxBarButton;
    btnAlterProc: TdxBarButton;
    btnDropProc: TdxBarButton;
    btnCompileProc: TdxBarButton;
    btnRefreshProc: TdxBarButton;
    btnPrivilegesView: TdxBarButton;
    bbtnGrantPrivileges: TdxBarButton;
    btnRefreshGrants: TdxBarButton;
    bbtnCreateSynonym: TdxBarButton;
    bbtnDropSynonym: TdxBarButton;
    bbtnRefreshSynonym: TdxBarButton;
    dsGrants: TDataSource;
    dsSynonyms: TDataSource;
    dsUsed: TDataSource;
    dsUses: TDataSource;
    vtGrants: TVirtualTable;
    vtSynonyms: TVirtualTable;
    vtUsed: TVirtualTable;
    vtUses: TVirtualTable;
    redtCode: TcxRichEdit;
    cxSplitter1: TcxSplitter;
    lviewError: TcxListView;
    tsArguments: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    vtArguments: TVirtualTable;
    dsArguments: TDataSource;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    bbtnExecPro: TdxBarButton;
    tsBody: TcxTabSheet;
    redtBodyCode: TcxRichEdit;
    cxSplitter2: TcxSplitter;
    lviewBodyError: TcxListView;
    imgToolBar: TImage;
    procedure pcProcedurePropertiesPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure btnDropProcClick(Sender: TObject);
    procedure btnCompileProcClick(Sender: TObject);
    procedure btnRefreshProcClick(Sender: TObject);
    procedure bbtnGrantPrivilegesClick(Sender: TObject);
    procedure btnRefreshGrantsClick(Sender: TObject);
    procedure bbtnCreateSynonymClick(Sender: TObject);
    procedure bbtnRefreshSynonymClick(Sender: TObject);
    procedure bbtnDropSynonymClick(Sender: TObject);
    procedure btnAlterProcClick(Sender: TObject);
    procedure bbtnExecProClick(Sender: TObject);
    procedure btnCreateProcClick(Sender: TObject);
  private
    { Private declarations }
    FSourceName,
    FOwner : string;
    ProcSource: TProcSource;
    procedure GetSource;
    procedure GetArguments;
    procedure GetUsed;
    procedure GetUses;
  public
    { Public declarations }
    procedure Init(ObjName, OwnerName: string); override;
  end;

var
  ProcedurePropertiesFrm: TProcedurePropertiesFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, Util, frmViewDetail, OraStorage,
     frmTableSort, frmTableFind, OraGrants, frmGrants, OraTriger,
     frmTrigerDetail, frmSynonyms, OraSynonym, frmSchemaPublicEvent,
     frmProcedureEditor, frmProcedureRun, frmProcedureDetail,
     VisualOptions, GenelDM;

procedure TProcedurePropertiesFrm.Init(ObjName, OwnerName: string);
var
  a: boolean;
begin
  inherited Show;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  top := 0;
  left := 0;
  FSourceName := ObjName;
  FOwner := OwnerName;
  GetSource;
  pcProcedurePropertiesPageChanging(self, pcProcedureProperties.ActivePage ,a);
end;

procedure TProcedurePropertiesFrm.pcProcedurePropertiesPageChanging(
  Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  inherited;
  if NewPage = tsArguments then GetArguments;
  if NewPage = tsProcedureUses then GetUses;
  if NewPage = tsProcedureUsedBy then GetUsed;
end;

{*******************************************************************************}
{                         S O U R C E                                           }
{*******************************************************************************}
procedure TProcedurePropertiesFrm.GetSource;
begin
  if ProcSource <> nil then
     FreeAndNil(ProcSource);

  ProcSource := TProcSource.Create;
  ProcSource.OraSession := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;
  ProcSource.SOURCE_NAME := FSourceName;
  ProcSource.OWNER := FOwner;

  if ObjectType = dbProcedures then
     ProcSource.SOURCE_TYPE := stProcedure;
  if ObjectType = dbFunctions then
     ProcSource.SOURCE_TYPE := stFunction;
  if ObjectType = dbPackages then
     ProcSource.SOURCE_TYPE := stPackage;
  if ObjectType = dbTypes then
     ProcSource.SOURCE_TYPE := stType;

  tsBody.TabVisible := ProcSource.SOURCE_TYPE = stPackage;
  ProcSource.SetDDL;

  redtCode.Text := ProcSource.GetDDL;
  CodeColors(self, 'Default', redtCode, false);

  redtBodyCode.Text := ProcSource.GetBodyDDL;
  CodeColors(self, 'Default', redtBodyCode, false);


  edtName.Text := ProcSource.SOURCE_NAME;
  edtOwner.Text := ProcSource.OWNER;
  lblDescription.Caption := ProcSource.SourceStatus;

  lviewError.Items.Clear;
  FillViewHorizontal(ProcSource.SourceErrors, lviewError);

  lviewBodyError.Items.Clear;
  if ProcSource.SOURCE_TYPE = stPackage then
     FillViewHorizontal(ProcSource.SourceBodyErrors, lviewBodyError);

  vtGrants.close;
  vtGrants.Assign(ProcSource.GrantList.DSGrantList);
  vtGrants.Open;

  vtSynonyms.close;
  vtSynonyms.Assign(ProcSource.SynonymList.DSSynonymList);
  vtSynonyms.Open;
end;

procedure TProcedurePropertiesFrm.btnDropProcClick(Sender: TObject);
begin
  if ProcSource.SOURCE_NAME= '' then exit;
  if ProcSource = nil then exit;
  if SchemaPublicEventFrm.Init(ProcSource, oeDrop) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbProcedures);
end;

procedure TProcedurePropertiesFrm.btnCompileProcClick(Sender: TObject);
begin
  if ProcSource.SOURCE_NAME= '' then exit;
  if ProcSource = nil then exit;
  if SchemaPublicEventFrm.Init(ProcSource, oeCompile) then
     GetSource;
end;

procedure TProcedurePropertiesFrm.bbtnExecProClick(Sender: TObject);
begin
  inherited;
  if ProcSource.SOURCE_NAME= '' then exit;
  if ProcSource = nil then exit;
  ProcedureRunFrm.Init(ProcSource);
end;

procedure TProcedurePropertiesFrm.btnRefreshProcClick(Sender: TObject);
begin
  GetSource;
end;

{*******************************************************************************}
{                           ARGUMENTS                                           }
{*******************************************************************************}

procedure TProcedurePropertiesFrm.GetArguments;
begin
  vtArguments.Close;
  vtArguments.Assign(ProcSource.Arguments);
  vtArguments.Open;
end;

{*******************************************************************************}
{                              U S E D                                          }
{*******************************************************************************}

procedure TProcedurePropertiesFrm.GetUsed;
begin
  vtUsed.Close;
  vtUsed.Assign(ProcSource.UsedByList);
  vtUsed.Open;
end;

{*******************************************************************************}
{                              U S E S                                          }
{*******************************************************************************}

procedure TProcedurePropertiesFrm.GetUses;
begin
  vtUses.Close;
  vtUses.Assign(ProcSource.UsesList);
  vtUses.Open;
end; 

{*******************************************************************************}
{                            G R A N T S                                        }
{*******************************************************************************}

procedure TProcedurePropertiesFrm.bbtnGrantPrivilegesClick(
  Sender: TObject);
begin
  inherited;
  if GrantsFrm.Init(ProcSource.GrantList) then
     btnRefreshGrants.Click;
end;

procedure TProcedurePropertiesFrm.btnRefreshGrantsClick(Sender: TObject);
begin
  inherited;
  ProcSource.GrantList.SetDDL;
  vtGrants.close;
  vtGrants.Assign(ProcSource.GrantList.DSGrantList);
  vtGrants.Open;
end;

{*******************************************************************************}
{                              S Y N O N Y M S                                  }
{*******************************************************************************}

procedure TProcedurePropertiesFrm.bbtnCreateSynonymClick(Sender: TObject);
begin
  inherited;
  if SynonymsFrm.Init(ProcSource.SynonymList) then
     bbtnRefreshSynonym.Click;
end;

procedure TProcedurePropertiesFrm.bbtnRefreshSynonymClick(Sender: TObject);
begin
  inherited;
  ProcSource.SynonymList.SetDDL;
  vtSynonyms.close;
  vtSynonyms.Assign(ProcSource.SynonymList.DSSynonymList);
  vtSynonyms.Open;
end;

procedure TProcedurePropertiesFrm.bbtnDropSynonymClick(Sender: TObject);
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
  SynonymList.OraSession := ProcSource.OraSession;
  SynonymList.TableOwner := FOwner;
  SynonymList.TableName := FSourceName;
  SynonymList.SynonymAdd(FSynonym);

  if SchemaPublicEventFrm.Init(SynonymList, oeDrop) then
     bbtnRefreshSynonym.Click;
end;

procedure TProcedurePropertiesFrm.btnAlterProcClick(Sender: TObject);
var
  f : TProcedureEditorFrm;
begin
  inherited;
  ProcSource.Mode := UpdateMode;
  f := TProcedureEditorFrm.Create(Application);
  f.Init(ProcSource);
end;

procedure TProcedurePropertiesFrm.btnCreateProcClick(Sender: TObject);
var
  f : TProcedureEditorFrm;
  FProcSource : TProcSource;
begin
  inherited;
  FProcSource := ProcedureDetailFrm.Init(ProcSource);
  if FProcSource <> nil then
  begin
    ProcSource.Mode := InsertMode;
    f := TProcedureEditorFrm.Create(Application);
    f.Init(FProcSource);
  end;
end;

end.
