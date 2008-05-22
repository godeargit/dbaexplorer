unit frmMaterializedViewLogDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxGraphics, cxDropDownEdit,
  cxLabel, cxCheckBox, cxMemo, cxRichEdit, cxGroupBox, cxRadioGroup,
  cxImageComboBox, cxMaskEdit, cxContainer, cxEdit, cxTextEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, jpeg,
  ExtCtrls, cxPC, cxControls, cxButtons, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, Buttons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, OraMaterializedViewLog, GenelDM, cxListBox,
  MemDS, VirtualTable;

type
  TMaterializedViewLogDetailFrm = class(TForm)
    Panel1: TPanel;
    btnExecute: TcxButton;
    btnCancel: TcxButton;
    pc: TcxPageControl;
    tsView: TcxTabSheet;
    Label2: TLabel;
    Label1: TLabel;
    lcViewSchema: TcxLookupComboBox;
    tsStorage: TcxTabSheet;
    gbStorageClause: TcxGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtInitialExtend: TcxMaskEdit;
    edtNextExtend: TcxMaskEdit;
    edtMinExtents: TcxMaskEdit;
    edtMaxExtents: TcxMaskEdit;
    edtPctIncrease: TcxMaskEdit;
    edtFreeList: TcxMaskEdit;
    edtFreeGroup: TcxMaskEdit;
    cbBufferPool: TcxImageComboBox;
    gbStorage: TcxGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    edtPercentFree: TcxMaskEdit;
    edtPercentUsed: TcxMaskEdit;
    edtInitialTrans: TcxMaskEdit;
    edtMaxTrans: TcxMaskEdit;
    lcTablespace: TcxLookupComboBox;
    rgCache: TcxRadioGroup;
    rgLogging: TcxRadioGroup;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    lcMasterTable: TcxLookupComboBox;
    cxGroupBox1: TcxGroupBox;
    chkRowId: TcxCheckBox;
    chkObjectId: TcxCheckBox;
    chkPrimaryKey: TcxCheckBox;
    chkSequence: TcxCheckBox;
    chkParalel: TcxCheckBox;
    edtParalelDegree: TcxMaskEdit;
    chkEnableRowMovement: TcxCheckBox;
    cxLabel7: TcxLabel;
    cbNewValues: TcxComboBox;
    Label3: TLabel;
    Label4: TLabel;
    sbtnAddIndex: TSpeedButton;
    sbtnRemoveIndex: TSpeedButton;
    sbtnAddAllIndex: TSpeedButton;
    sbtnRemoveAllIndex: TSpeedButton;
    vtTables: TVirtualTable;
    dsTables: TDataSource;
    vtAvailableColumns: TVirtualTable;
    dsAvailableColumns: TDataSource;
    vtSelectedColumns: TVirtualTable;
    dsSelectedColumns: TDataSource;
    gridTableColums: TcxGrid;
    gridTableColumsDBTableView1: TcxGridDBTableView;
    gridTableColumsDBTableView1COLUMN_NAME: TcxGridDBColumn;
    gridTableColumsLevel1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    vtAvailableColumnsCOLUMN_NAME: TStringField;
    vtSelectedColumnsCOLUMN_NAME: TStringField;
    procedure btnCancelClick(Sender: TObject);
    procedure chkParalelPropertiesChange(Sender: TObject);
    procedure lcViewSchemaPropertiesChange(Sender: TObject);
    procedure lcMasterTablePropertiesChange(Sender: TObject);
    procedure sbtnAddIndexClick(Sender: TObject);
    procedure sbtnAddAllIndexClick(Sender: TObject);
    procedure sbtnRemoveIndexClick(Sender: TObject);
    procedure sbtnRemoveAllIndexClick(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
  private
    { Private declarations }
    FMaterializedViewLog: TMaterializedViewLog;
    procedure SetProperties;
    function SetViewLogDetail: boolean;
  public
    { Public declarations }
    function Init(AMaterializedViewLog : TMaterializedViewLog): boolean;
  end;

var
  MaterializedViewLogDetailFrm: TMaterializedViewLogDetailFrm;

implementation

uses Util, frmSchemaBrowser, oraStorage, VisualOptions;

{$R *.dfm}

function TMaterializedViewLogDetailFrm.Init(AMaterializedViewLog : TMaterializedViewLog): boolean;
begin
  MaterializedViewLogDetailFrm := TMaterializedViewLogDetailFrm.Create(Application);
  Self := MaterializedViewLogDetailFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  
  FMaterializedViewLog := TMaterializedViewLog.Create;
  FMaterializedViewLog := AMaterializedViewLog;

  dmGenel.ReLoad(FMaterializedViewLog.OraSession);

  lcViewSchema.Text := FMaterializedViewLog.OWNER;
  
  SetProperties;
  pc.ActivePage := tsView;
  ShowModal;
  result := ModalResult = mrOk;
  Free;
end;

procedure TMaterializedViewLogDetailFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TMaterializedViewLogDetailFrm.SetProperties;
begin
  edtParalelDegree.Enabled := chkParalel.Checked;
end;

procedure TMaterializedViewLogDetailFrm.chkParalelPropertiesChange(
  Sender: TObject);
begin
  edtParalelDegree.Enabled := chkParalel.Checked;
end;

procedure TMaterializedViewLogDetailFrm.lcViewSchemaPropertiesChange(
  Sender: TObject);
begin
  FMaterializedViewLog.OWNER := lcViewSchema.Text;
  vtTables.Close;
  vtTables.Assign(FMaterializedViewLog.TablesList);
  vtTables.Open;
end;

procedure TMaterializedViewLogDetailFrm.lcMasterTablePropertiesChange(
  Sender: TObject);
begin
  FMaterializedViewLog.TABLE_NAME := lcMasterTable.Text;

  vtAvailableColumns.close;
  vtAvailableColumns.Assign(FMaterializedViewLog.TableColumnsList);
  vtAvailableColumns.open;

  if vtSelectedColumns.Active then vtSelectedColumns.Clear;
  vtSelectedColumns.close;
  vtSelectedColumns.open;
end;

procedure TMaterializedViewLogDetailFrm.sbtnAddIndexClick(Sender: TObject);
begin
  if not vtAvailableColumns.Active then exit;
  if vtAvailableColumns.RecordCount <= 0 then exit;
  vtSelectedColumns.Append;
  vtSelectedColumns.FieldByName('COLUMN_NAME').AsString := vtAvailableColumns.FieldByName('COLUMN_NAME').AsString;
  vtSelectedColumns.Post;
  vtAvailableColumns.Delete;
end;

procedure TMaterializedViewLogDetailFrm.sbtnAddAllIndexClick(
  Sender: TObject);
begin
  if not vtAvailableColumns.Active then exit;
  if vtAvailableColumns.RecordCount <= 0 then exit;
  vtAvailableColumns.First;
  while not vtAvailableColumns.Eof do
    sbtnAddIndex.Click;  
end;

procedure TMaterializedViewLogDetailFrm.sbtnRemoveIndexClick(
  Sender: TObject);
begin
  if not vtAvailableColumns.Active then exit;
  if vtSelectedColumns.RecordCount <= 0 then exit;
  vtAvailableColumns.Append;
  vtAvailableColumns.FieldByName('COLUMN_NAME').AsString := vtSelectedColumns.FieldByName('COLUMN_NAME').AsString;
  vtAvailableColumns.Post;
  vtSelectedColumns.Delete;
end;

procedure TMaterializedViewLogDetailFrm.sbtnRemoveAllIndexClick(
  Sender: TObject);
begin
  if not vtAvailableColumns.Active then exit;
  if vtSelectedColumns.RecordCount <= 0 then exit;
  vtSelectedColumns.First;
  while not vtSelectedColumns.Eof do
     sbtnRemoveIndex.Click;
end;

function TMaterializedViewLogDetailFrm.SetViewLogDetail: boolean;
begin
  result := true;
  if lcMasterTable.Text = '' then
  begin
    MessageDlg('Master Table Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if lcViewSchema.Text = '' then
  begin
    MessageDlg('Schema Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  with FMaterializedViewLog do
  begin
    OWNER := lcViewSchema.Text;
    TABLE_NAME := lcMasterTable.Text;
    if chkParalel.Checked then
       PARALLEL := edtParalelDegree.Text
    else
       PARALLEL := '0';
    CACHE := rgCache.ItemIndex = 0;
    LOGGING := TLoggingType(rgLogging.ItemIndex);
    ENABLE_ROW_MOVEMENT := chkEnableRowMovement.Checked;
    NEW_VALUES := TMVNewValues(cbNewValues.ItemIndex);
    ROW_ID := chkRowId.Checked;
    OBJECT_ID := chkObjectId.Checked;
    PRIMARY_KEY := chkPrimaryKey.Checked;
    SEQUENCE := chkSequence.Checked;

    COLUMNS.Clear;
    vtSelectedColumns.First;
    while not vtSelectedColumns.Eof do
    begin
      COLUMNS.Add(vtSelectedColumns.FieldByName('COLUMN_NAME').AsString);
      vtSelectedColumns.next;
    end;

    with PhsicalAttributes do
    begin
      PercentFree:=  edtPercentFree.Text;
      PercentUsed:=  edtPercentUsed.Text;
      InitialTrans:= edtInitialTrans.Text;
      MaxTrans:=     edtMaxTrans.Text;
      Tablespace:=   lcTablespace.Text;
      InitialExtent:=edtInitialExtend.Text;
      NextExtent:=   edtNextExtend.Text;
      MinExtent:=    edtMinExtents.Text;
      MaxExtent:=    edtMaxExtents.Text;
      PctIncrease:=  edtPctIncrease.Text;
      BufferPool:=   TBufferPool(cbBufferPool.ItemIndex);
      FreeLists:=    edtFreeList.Text;
      FreeGroups:=   edtFreeGroup.Text;
    end;
  end; //with

end;

procedure TMaterializedViewLogDetailFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetViewLogDetail then exit;
  redtDDL.Text := FMaterializedViewLog.GetDDL;
  if FMaterializedViewLog.CreateViewLog(redtDDL.Text) then  ModalResult := mrOK;
end;

procedure TMaterializedViewLogDetailFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetViewLogDetail then AllowChange := false
       else redtDDL.Text := FMaterializedViewLog.GetDDL;
    CodeColors(self, 'Default', redtDDL, false);
  end;
end;

end.
