unit frmIndexProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmBaseForm, OraBarConn, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxMemo,
  cxRichEdit, cxSplitter, dxStatusBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxLabel, cxContainer, cxTextEdit, dxBar, jpeg,
  cxPC, StdCtrls, ExtCtrls, GenelDM, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDropDownEdit, cxImageComboBox, cxGroupBox,
  cxRadioGroup, cxMaskEdit, cxCheckBox, MemDS, DBAccess, Ora, VirtualTable, OraIndex;

type
  TIndexPropertiesFrm = class(TBaseform)
    Panel1: TPanel;
    imgToolBar: TImage;
    lblDescription: TLabel;
    pcIndexProperties: TcxPageControl;
    tsPartitions: TcxTabSheet;
    tsProperties: TcxTabSheet;
    dxBarDockControl4: TdxBarDockControl;
    tsViewScripts: TcxTabSheet;
    dxBarManager1: TdxBarManager;
    bbtnCreateIndex: TdxBarButton;
    bbtnDropIndex: TdxBarButton;
    bbtnAlterIndex: TdxBarButton;
    bbtnAnalyzeIndex: TdxBarButton;
    bbtnRebuildIndex: TdxBarButton;
    bbtnCoalesceIndex: TdxBarButton;
    bbtnRefreshIndex: TdxBarButton;
    pcTableIndex: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Label3: TLabel;
    Label43: TLabel;
    Label37: TLabel;
    Label44: TLabel;
    lblPartition: TLabel;
    cgroupParalel: TcxGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    cbParalel: TcxCheckBox;
    edtParalelDegree: TcxMaskEdit;
    edtParalelInstances: TcxMaskEdit;
    edtIndexName: TcxTextEdit;
    edtIndexType: TcxTextEdit;
    rgroupIndexType: TcxRadioGroup;
    rgroupKeyCompression: TcxRadioGroup;
    edtKeyCompressionColumns: TcxMaskEdit;
    cbLogging: TcxImageComboBox;
    cxTabSheet2: TcxTabSheet;
    Label28: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    cxGroupBox7: TcxGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edtInitialExtend: TcxMaskEdit;
    edtNextExtend: TcxMaskEdit;
    edtMinExtents: TcxMaskEdit;
    edtMaxExtents: TcxMaskEdit;
    edtPctIncrease: TcxMaskEdit;
    edtFreeList: TcxMaskEdit;
    edtFreeGroup: TcxMaskEdit;
    cbBufferPool: TcxImageComboBox;
    edtPercentFree: TcxMaskEdit;
    edtPercentUsed: TcxMaskEdit;
    edtInitialTrans: TcxMaskEdit;
    edtMaxTrans: TcxMaskEdit;
    lcTablespace: TcxLookupComboBox;
    cxSplitter1: TcxSplitter;
    GridIndex: TcxGrid;
    GridIndexDBTableView: TcxGridDBTableView;
    GridIndexDBTableViewColumn1: TcxGridDBColumn;
    GridIndexDBTableViewColumn2: TcxGridDBColumn;
    GridIndexDBTableViewColumn3: TcxGridDBColumn;
    GridIndexDBTableViewColumn4: TcxGridDBColumn;
    GridIndexDBTableViewColumn5: TcxGridDBColumn;
    GridIndexDBTableViewColumn6: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dsIndexes: TDataSource;
    vIndexes: TVirtualTable;
    vIndexColumns: TVirtualTable;
    dsIndexColumns: TDataSource;
    redtDDL: TcxRichEdit;
    vtIndexPartitions: TVirtualTable;
    dsIndexPartitions: TDataSource;
    GridPartitiones: TcxGrid;
    GridPartitionesDBTableView1: TcxGridDBTableView;
    GridPartitionesDBTableView1Column1: TcxGridDBColumn;
    GridPartitionesDBTableView1Column2: TcxGridDBColumn;
    GridPartitionesDBTableView1Column3: TcxGridDBColumn;
    GridPartitionesDBTableView1Column4: TcxGridDBColumn;
    GridPartitionesDBTableView1Column5: TcxGridDBColumn;
    GridPartitionesDBTableView1Column6: TcxGridDBColumn;
    GridPartitionesDBTableView1Column7: TcxGridDBColumn;
    GridPartitionesDBTableView1Column8: TcxGridDBColumn;
    GridPartitionesDBTableView1Column9: TcxGridDBColumn;
    GridPartitionesDBTableView1Column10: TcxGridDBColumn;
    GridPartitionesLevel1: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCreateIndexClick(Sender: TObject);
    procedure bbtnAlterIndexClick(Sender: TObject);
    procedure bbtnDropIndexClick(Sender: TObject);
    procedure bbtnAnalyzeIndexClick(Sender: TObject);
    procedure bbtnRebuildIndexClick(Sender: TObject);
    procedure bbtnCoalesceIndexClick(Sender: TObject);
    procedure bbtnRefreshIndexClick(Sender: TObject);
  private
    { Private declarations }
    FOraSession: TOraSession;
    FIndexName,
    FOwnerName : string;
    TableIndex : TTableIndex;
    procedure GetIndex;
    procedure GetIndexDetail;

  public
    { Public declarations }
    procedure Init(ObjName, OwnerName: string); override;
  end;

var
  IndexPropertiesFrm: TIndexPropertiesFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, Util, OraStorage, frmTableIndexes, frmTableEvents,
     frmSchemaPublicEvent, VisualOptions;

procedure TIndexPropertiesFrm.Init(ObjName, OwnerName: string);
begin
  inherited Show;
  top := 0;
  left := 0;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FIndexName := ObjName;
  FOwnerName := OwnerName;
  FOraSession := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;

  GetIndex;
end;

procedure TIndexPropertiesFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if TableIndex <> nil then FreeAndNil(TableIndex);
end;

{*******************************************************************************}
{                         I N D E X                                             }
{*******************************************************************************}
procedure TIndexPropertiesFrm.GetIndex;
begin
  if TableIndex <> nil then
     FreeAndNil(TableIndex);
  TableIndex := TTableIndex.Create;
  TableIndex.IndexName := FIndexName;
  TableIndex.IndexSchema := FOwnerName;
  TableIndex.OraSession := FOraSession;
  TableIndex.SetDDL;

  lblDescription.Caption := TableIndex.IndexStatus;

  vIndexes.close;
  vIndexes.Assign(TableIndex.DSIndex);
  vIndexes.open;

  vIndexColumns.close;
  vIndexColumns.Assign(TableIndex.DSIndexColumns);
  vIndexColumns.open;

  vtIndexPartitions.close;
  vtIndexPartitions.Assign(TableIndex.DSIndexPartitions);
  vtIndexPartitions.open;

  GetIndexDetail;
end;

procedure TIndexPropertiesFrm.GetIndexDetail;
begin
  redtDDL.Text := '';
  if FIndexName = '' then exit;
  if TableIndex = nil then exit;
  
  redtDDL.Text := TableIndex.GetDDL;
  CodeColors(self, 'Default', redtDDL, false);

  edtIndexName.Text := TableIndex.IndexName;
  edtIndexType.Text := 'NORMAL';
  if TableIndex.Bitmap then edtIndexType.Text := 'BITMAP';
  if TableIndex.Functions then edtIndexType.Text := 'FUNCTION-BASED NORMAL';
  cbLogging.ItemIndex := Integer(TableIndex.LoggingType);
  if TableIndex.IndexType = Uniqe then rgroupIndexType.ItemIndex := 0
     else rgroupIndexType.ItemIndex := 1;

  if TableIndex.Compress then rgroupKeyCompression.ItemIndex := 0
     else rgroupKeyCompression.ItemIndex := 1;
  edtKeyCompressionColumns.Text := IntToStr(TableIndex.CompressColumns);

  cbParalel.Checked := TableIndex.Paralel;
  edtParalelDegree.Text :=  IntToStr(TableIndex.ParalelDegree);
  edtParalelInstances.Text := IntToStr(TableIndex.ParalelInstances);

  lblPartition.Visible := TableIndex.PartitionClause <> pcNonPartition ;
  if TableIndex.PartitionClause <> pcNonPartition then
     lblPartition.Caption := 'This table has '+ IntToStr(TableIndex.IndexPartitionLists.Count)
                                           +' '+DBIndexPartitionType[TableIndex.IndexPartitionType]
                                           +' partitions';

  with TableIndex.PhsicalAttributes do
  begin
    edtPercentFree.Text := PercentFree;
    edtPercentUsed.Text := PercentUsed;
    edtInitialTrans.Text := InitialTrans;
    edtMaxTrans.Text := MaxExtent;
    lcTablespace.Text := Tablespace;
    edtInitialExtend.Text := InitialExtent;
    edtNextExtend.Text := NextExtent;
    edtMinExtents.Text := MinExtent;
    edtMaxExtents.Text := MaxExtent;
    edtPctIncrease.Text := PctIncrease;
    cbBufferPool.ItemIndex := Integer(BufferPool);
    edtFreeList.Text := FreeLists;
    edtFreeGroup.Text := FreeGroups;
  end;
end;


procedure TIndexPropertiesFrm.bbtnCreateIndexClick(Sender: TObject);
var
  FTableIndex : TTableIndex;
begin
  inherited;
  FTableIndex := TTableIndex.Create;
  FTableIndex.IndexName := '';
  FTableIndex.IndexSchema := FOwnerName;
  FTableIndex.TableName := '';
  FTableIndex.TableSchema := FOwnerName;
  FTableIndex.OraSession := FOraSession;
  if TableIndexesFrm.Init(FTableIndex) then 
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbIndexes);
end;

procedure TIndexPropertiesFrm.bbtnAlterIndexClick(Sender: TObject);
begin
  inherited;
  if FIndexName = '' then exit;
  if TableIndex = nil then exit;
  if TableIndexesFrm.Init(TableIndex) then
     GetIndex;
end;

procedure TIndexPropertiesFrm.bbtnDropIndexClick(Sender: TObject);
begin
  inherited;
  if FIndexName = '' then exit;
  if TableIndex = nil then exit;
  if SchemaPublicEventFrm.Init(TableIndex, oeDrop) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbIndexes);
end;

procedure TIndexPropertiesFrm.bbtnAnalyzeIndexClick(Sender: TObject);
begin
  inherited;
  if FIndexName = '' then exit;
  if TableIndex = nil then exit;
  if TableEventsfrm.Init(TableIndex, oeAnalyze) then
     GetIndex;
end;

procedure TIndexPropertiesFrm.bbtnRebuildIndexClick(Sender: TObject);
begin
  inherited;
  if FIndexName = '' then exit;
  if TableIndex = nil then exit;
  if SchemaPublicEventFrm.Init(TableIndex, oeRebuild) then
     GetIndex;
end;

procedure TIndexPropertiesFrm.bbtnCoalesceIndexClick(Sender: TObject);
begin
  inherited;
  if FIndexName = '' then exit;
  if TableIndex = nil then exit;
  if SchemaPublicEventFrm.Init(TableIndex, oeCoalesce) then
     GetIndex;
end;

procedure TIndexPropertiesFrm.bbtnRefreshIndexClick(Sender: TObject);
begin
  GetIndex;
end;

end.
