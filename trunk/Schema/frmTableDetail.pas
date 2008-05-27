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
unit frmTableDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, StdCtrls,
  cxGraphics, Menus, cxLookAndFeelPainters, cxButtons, cxPC, ExtCtrls,
  dxStatusBar, cxCheckBox, cxGroupBox, cxMemo, cxListBox, cxSpinEdit,
  cxMaskEdit, cxDropDownEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Ora,
  MemDS, DBAccess, cxImageComboBox, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBExtLookupComboBox, jpeg, cxRadioGroup, Buttons,
  VirtualTable, cxRichEdit, OraTable, GenelDM, OraIndex, OraStorage, OraPartitions,
  cxButtonEdit, OraScript;

type
  TTableDetailFrm = class(TForm)
    pc: TcxPageControl;
    tsStorage: TcxTabSheet;
    tsPartitions: TcxTabSheet;
    tsClusters: TcxTabSheet;
    tsDDL: TcxTabSheet;
    tsTable: TcxTabSheet;
    Label2: TLabel;
    Label1: TLabel;
    edtTableName: TcxTextEdit;
    lcTableSchema: TcxLookupComboBox;
    gbColumns: TcxGroupBox;
    gridColumn: TcxGrid;
    gridColumnDB: TcxGridDBTableView;
    gridColumnDBCOLUMN_NAME: TcxGridDBColumn;
    gridColumnDBDATA_TYPE: TcxGridDBColumn;
    gridColumnDBDATA_LENGTH: TcxGridDBColumn;
    gridColumnDBDATA_SCALE: TcxGridDBColumn;
    gridColumnDBNULLABLE: TcxGridDBColumn;
    gridColumnDBDATA_DEFAULT: TcxGridDBColumn;
    gridColumnDBCOMMENT: TcxGridDBColumn;
    gridColumnLevel1: TcxGridLevel;
    gbColumnObject: TcxGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    lcbObjectOwner: TcxLookupComboBox;
    lcbObjectType: TcxLookupComboBox;
    rgColumnType: TcxRadioGroup;
    gbConstraintDefinition: TcxGroupBox;
    cbDeleteRule: TcxDBComboBox;
    Label30: TLabel;
    cbStatus: TcxDBComboBox;
    Label31: TLabel;
    Label34: TLabel;
    cbDeferrable: TcxDBComboBox;
    Label35: TLabel;
    cbValidation: TcxDBComboBox;
    Label36: TLabel;
    Label37: TLabel;
    edtConstraintName: TcxDBTextEdit;
    lblForeignKeyTable: TLabel;
    lblForeignKeyColumn: TLabel;
    qAvailabeColumns: TVirtualTable;
    qAvailabeColumnsCOLUMN_NAME: TStringField;
    qAvailabeColumnsDATA_TYPE: TStringField;
    dsAvailabeColumns: TDataSource;
    dsPartitionColumns: TDataSource;
    dsSubPartitionColumns: TDataSource;
    dsRangePartition: TDataSource;
    dsHashPartition: TDataSource;
    qHashPartition: TVirtualTable;
    StringField7: TStringField;
    StringField8: TStringField;
    qRangePartition: TVirtualTable;
    qRangePartitionPARTITION_NAME: TStringField;
    qRangePartitionTABLESPACE_NAME: TStringField;
    qRangePartitionPARTITION_ID: TIntegerField;
    qSubPartitionColumns: TVirtualTable;
    StringField5: TStringField;
    StringField6: TStringField;
    qPartitionColumns: TVirtualTable;
    StringField2: TStringField;
    StringField4: TStringField;
    gridAvailabeColumns: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1COLUMN_NAME: TcxGridDBColumn;
    cxGridDBTableView1DATA_TYPE: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    gridPartitionColumns: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2COLUMN_NAME: TcxGridDBColumn;
    cxGridDBTableView2DATA_TYPE: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    gridSubPartitionColumns: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3COLUMN_NAME: TcxGridDBColumn;
    cxGridDBTableView3DATA_TYPE: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    sbtnPartitionAdd: TSpeedButton;
    sbtnPartitionAddAll: TSpeedButton;
    sbtnPartitionRemove: TSpeedButton;
    sbtnPartitionRemoveAll: TSpeedButton;
    sbtnSubPartitionAdd: TSpeedButton;
    sbtnSubPartitionAddAll: TSpeedButton;
    sbtnSubPartitionRemove: TSpeedButton;
    sbtnSubPartitionRemoveAll: TSpeedButton;
    pcPartitionType: TcxPageControl;
    tsRange: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBTableView5PARTITION_NAME: TcxGridDBColumn;
    cxGridDBTableView5TABLESPACE_NAME: TcxGridDBColumn;
    cxGridDBTableView5PARTITION_ID: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    btnRangeAdd: TcxButton;
    btnRangeEdit: TcxButton;
    btnRangeDelete: TcxButton;
    tsHash: TcxTabSheet;
    Label18: TLabel;
    cxGrid2: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBTableView6PARTITION_NAME: TcxGridDBColumn;
    cxGridDBTableView6TABLESPACE_NAME: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    btnHashAdd: TcxButton;
    btnHashDelete: TcxButton;
    rgroupHashPartitionType: TcxRadioGroup;
    edtHashQuantity: TcxSpinEdit;
    tsIndexOrganized: TcxTabSheet;
    tsExternal: TcxTabSheet;
    tsQueuing: TcxTabSheet;
    tsSubpartition: TcxTabSheet;
    redtDDL: TcxRichEdit;
    rgTableType: TcxRadioGroup;
    tsComment: TcxTabSheet;
    redtComment: TcxRichEdit;
    tsGlobalTemporary: TcxTabSheet;
    qTableColumns: TVirtualTable;
    dsTableColumns: TDataSource;
    qTableColumnsCOLUMN_NAME: TStringField;
    qTableColumnsDATA_TYPE: TStringField;
    qTableColumnsDATA_TYPE_MOD: TStringField;
    qTableColumnsDATA_TYPE_OWNER: TStringField;
    qTableColumnsDATA_LENGTH: TFloatField;
    qTableColumnsDATA_PRECISION: TFloatField;
    qTableColumnsDATA_SCALE: TFloatField;
    qTableColumnsNULLABLE: TStringField;
    qTableColumnsCOLUMN_ID: TFloatField;
    qTableColumnsDATA_DEFAULT: TMemoField;
    qTableColumnsCOMMENTS: TStringField;
    cbUnique: TcxDBCheckBox;
    qTableColumnsCONSTRAINT_NAME: TStringField;
    qTableColumnsCONSTRAINT_REF_TABLE: TStringField;
    qTableColumnsCONSTRAINT_REF_COLUMN: TStringField;
    qTableColumnsCONSTRAINT_DELETE_RULE: TStringField;
    qTableColumnsCONSTRAINT_STATUS: TStringField;
    qTableColumnsCONSTRAINT_VALIDATION: TStringField;
    qRefTable: TOraQuery;
    StringField1: TStringField;
    dsRefTable: TDataSource;
    dsRefTableColumns: TDataSource;
    qRefTableColumns: TOraQuery;
    StringField3: TStringField;
    StringField9: TStringField;
    FloatField1: TFloatField;
    qUserDataType: TOraQuery;
    qUserDataTypeTYPE_NAME: TStringField;
    dsUserDataType: TDataSource;
    rgPartitionRangeType: TcxRadioGroup;
    qClasterColumns: TVirtualTable;
    dsClasterColumns: TDataSource;
    qClasterColumnsCLUSTER_COLUMN_NAME: TStringField;
    qClasterColumnsCOLUMN_NAME: TStringField;
    qCluster: TOraQuery;
    qClusterCLUSTER_NAME: TStringField;
    dsCluster: TDataSource;
    qTemp: TOraQuery;
    qExternalLocations: TVirtualTable;
    dsExternalLocations: TDataSource;
    OpenDialog: TOpenDialog;
    qQueuing: TOraQuery;
    dsQueuing: TDataSource;
    qQueuingTYPE_NAME: TStringField;
    lcbRefTable: TcxDBLookupComboBox;
    lcbRefTableColumn: TcxDBLookupComboBox;
    edtCheck: TcxDBTextEdit;
    lblCheck: TLabel;
    qTableColumnsCONSTRAINT_CHK: TStringField;
    redtTableSQL: TcxRichEdit;
    qTableColumnsUNIQUE: TStringField;
    qTableColumnsCONSTRAINT_TYPE: TIntegerField;
    icbColumnType: TcxDBImageComboBox;
    qTableColumnsCONSTRAINT_DEFERRABLE: TStringField;
    cbObjectIdentifier: TcxCheckBox;
    dsSubPartition: TDataSource;
    qSubPartition: TVirtualTable;
    StringField10: TStringField;
    StringField11: TStringField;
    qSubPartitionVALUES: TStringField;
    OraScript: TOraScript;
    gbConstraintDefinition2: TcxGroupBox;
    Label27: TLabel;
    icbColumnType2: TcxDBImageComboBox;
    cxGroupBox3: TcxGroupBox;
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
    cbMonitoring: TcxCheckBox;
    cbRowMovement: TcxCheckBox;
    rgCache: TcxRadioGroup;
    rgLogging: TcxRadioGroup;
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
    gbParalel: TcxGroupBox;
    Label19: TLabel;
    Label28: TLabel;
    edtParalelInstances: TcxMaskEdit;
    edtParalelDegree: TcxMaskEdit;
    cbParalel: TcxCheckBox;
    cxGroupBox8: TcxGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    cbCluster: TcxCheckBox;
    lcbClusterSchema: TcxLookupComboBox;
    lcbClusterTable: TcxLookupComboBox;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3DBTableView1CLUSTER_COLUMN_NAME: TcxGridDBColumn;
    cxGrid3DBTableView1COLUMN_NAME: TcxGridDBColumn;
    cxGrid3Level1: TcxGridLevel;
    cxGroupBox9: TcxGroupBox;
    gridSubPartition: TcxGrid;
    gridDBSubPartition: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    gridDBSubPartitionValues: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    rgSubpartitionType: TcxRadioGroup;
    Label26: TLabel;
    edtSubQuantity: TcxSpinEdit;
    btnSubpartitionAdd: TcxButton;
    btnSubpartitionDelete: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    rgroupExternalLimit: TcxRadioGroup;
    cbExternalParalel: TcxCheckBox;
    icbDirectory: TcxImageComboBox;
    edtAccessDriver: TcxTextEdit;
    edtAccessType: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    gridExternalLocations: TcxGrid;
    gridDBExternalLocations: TcxGridDBTableView;
    gridDBExternalLocationsColumn1: TcxGridDBColumn;
    gridDBExternalLocationsColumn2: TcxGridDBColumn;
    gridExternalLocationsLevel1: TcxGridLevel;
    cxGroupBox10: TcxGroupBox;
    redtExternalParameters: TcxRichEdit;
    btnOpenControlFile: TcxButton;
    edtExternalDegree: TcxSpinEdit;
    edtExternalLimit: TcxSpinEdit;
    cxGroupBox7: TcxGroupBox;
    cxGroupBox11: TcxGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtPercentageThreshold: TcxMaskEdit;
    cbKeyCompression: TcxCheckBox;
    edtKeyCompression: TcxMaskEdit;
    cbOverfloaw: TcxCheckBox;
    lcbIndexOrganizedField: TcxLookupComboBox;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    rgPayloadType: TcxRadioGroup;
    lcbQueuingSchema: TcxLookupComboBox;
    lcbQueuingType: TcxLookupComboBox;
    cxGroupBox6: TcxGroupBox;
    cbQueuningSubscribes: TcxCheckBox;
    cbQueuningMessageGrouping: TcxCheckBox;
    rgQueuningCapatibility: TcxRadioGroup;
    cxGroupBox12: TcxGroupBox;
    lbQueuingSortList: TcxListBox;
    cxGroupBox13: TcxGroupBox;
    rgBlobalTemporaryParams: TcxRadioGroup;
    cxGroupBox14: TcxGroupBox;
    btnCancel: TcxButton;
    btnExecute: TcxButton;
    procedure rgColumnTypePropertiesChange(Sender: TObject);
    procedure cbParalelPropertiesChange(Sender: TObject);
    procedure rgTableTypePropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbObjectOwnerPropertiesChange(Sender: TObject);
    procedure cbColumnTypePropertiesChange(Sender: TObject);
    procedure lcbRefTablePropertiesChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure sbtnPartitionAddClick(Sender: TObject);
    procedure sbtnPartitionAddAllClick(Sender: TObject);
    procedure sbtnPartitionRemoveClick(Sender: TObject);
    procedure sbtnPartitionRemoveAllClick(Sender: TObject);
    procedure sbtnSubPartitionAddClick(Sender: TObject);
    procedure sbtnSubPartitionAddAllClick(Sender: TObject);
    procedure sbtnSubPartitionRemoveClick(Sender: TObject);
    procedure sbtnSubPartitionRemoveAllClick(Sender: TObject);
    procedure btnRangeAddClick(Sender: TObject);
    procedure btnRangeEditClick(Sender: TObject);
    procedure btnRangeDeleteClick(Sender: TObject);
    procedure btnHashAddClick(Sender: TObject);
    procedure btnHashDeleteClick(Sender: TObject);
    procedure qHashPartitionBeforePost(DataSet: TDataSet);
    procedure cbClusterPropertiesChange(Sender: TObject);
    procedure lcbClusterTablePropertiesEditValueChanged(Sender: TObject);
    procedure lcbClusterSchemaPropertiesEditValueChanged(Sender: TObject);
    procedure gridColumnDBDATA_TYPEPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbExternalParalelPropertiesChange(Sender: TObject);
    procedure rgroupKeyCompressionPropertiesChange(Sender: TObject);
    procedure gridDBExternalLocationsColumn2PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cbKeyCompressionPropertiesChange(Sender: TObject);
    procedure cbOverfloawPropertiesChange(Sender: TObject);
    procedure rgPayloadTypePropertiesChange(Sender: TObject);
    procedure lcbQueuingSchemaPropertiesEditValueChanged(Sender: TObject);
    procedure lcbObjectTypePropertiesEditValueChanged(Sender: TObject);
    procedure qTableColumnsNewRecord(DataSet: TDataSet);
    procedure qTableColumnsAfterScroll(DataSet: TDataSet);
    procedure btnOpenControlFileClick(Sender: TObject);
    procedure btnSubpartitionAddClick(Sender: TObject);
    procedure btnSubpartitionDeleteClick(Sender: TObject);
    procedure rgSubpartitionTypePropertiesChange(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure qTableColumnsBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FTable: TTable;
    FTableNew: TTable;
    FPartitionId: integer;
    IndexPartitionList: TIndexPartitionList;

    procedure GetTableDetail;
    function SetTableDetail: boolean;
    procedure SetProperties;

    function Partitioncontrols: boolean;
    function PartitionTypeControl: boolean;
    function GetSubPartitionList: string;
    procedure SetSubPartitionList(Subpartitions: string);
    function GetSubPartitions: string;

    procedure GetClusters;
    function GetClusterColumn: string;
    procedure SetClusterColumn(str: string);

    procedure GetExternal;
    function GetExternalLocatons: string;

  public
    { Public declarations }
    function  Init(ATable: TTable): boolean;
  end;

var
  TableDetailFrm: TTableDetailFrm;

implementation

{$R *.dfm}
uses OraScripts, Util, frmTableIndexPartition, OraCluster,frmSchemaBrowser,
     OraConstraint, VisualOptions;

function  TTableDetailFrm.Init(ATable: TTable): boolean;
begin
  TableDetailFrm := TTableDetailFrm.Create(Application);
  Self := TableDetailFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  gbColumns.Style.BorderStyle := ebsNone;
  
  FTable := TTable.Create;
  FTable := ATable;

  if FTable.TABLE_NAME <> '' then
     FTable.SetDDL;

  FTableNew := TTable.Create;
  FTableNew.OraSession := FTable.OraSession;

  pc.ActivePage := tsTable;

  dmGenel.ReLoad(FTable.OraSession);
  qUserDataType.Session := FTable.OraSession;
  qRefTable.Session := FTable.OraSession;
  qRefTableColumns.Session := FTable.OraSession;
  qCluster.Session := FTable.OraSession;
  qTemp.Session := FTable.OraSession;
  qQueuing.Session := FTable.OraSession;
  OraScript.Session := FTable.OraSession;
  
  qTableColumns.Open;

  IndexPartitionList := TIndexPartitionList.Create;

  GetTableDetail;
  SetProperties;
  ShowModal;

  result := ModalResult = mrOk;
  Free;
end;

procedure TTableDetailFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qUserDataType.Close;
  qRefTable.close;
  qRefTableColumns.close;
  qTableColumns.Close;
  qAvailabeColumns.close;
  qPartitionColumns.Close;
  qSubPartitionColumns.Close;
  qRangePartition.close;
  qHashPartition.close;
  qSubPartition.close;
  qCluster.close;
  qTemp.close;
  qQueuing.close;
  qExternalLocations.close;
  qClasterColumns.close;
end;

procedure TTableDetailFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetTableDetail then exit;
  if FTable.TABLE_NAME = '' then
  begin
    redtDDL.Text := FTableNew.GetDDL;
    if FTableNew.CreateTable(redtDDL.Text) then ModalResult := mrOK;
  end else
  begin
    redtDDL.Text := FTable.GetAlterDDL(FTableNew);
    if FTableNew.AlterTable(redtDDL.Text) then ModalResult := mrOK;
  end;
end;

procedure TTableDetailFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TTableDetailFrm.GetTableDetail;
var
  i: integer;
begin
  if FTable.TABLE_NAME = '' then Caption := 'Create Table'
     else Caption := 'Alter Table '+FTable.OWNER+'.'+FTable.TABLE_NAME;

  edtTableName.Text := FTable.TABLE_NAME;
  lcTableSchema.Text := FTable.OWNER;
  if FTable.TABLE_NAME = '' then qTableColumns.Append;

  with FTable do
  begin
    lcTableSchema.Text := OWNER;
    edtTableName.Text := TABLE_NAME;

    case TableType of  //yada Integer(TableType)
      ttStandart : rgTableType.ItemIndex := 0;
      ttIndexOrganized: rgTableType.ItemIndex := 1;
      ttAdvancedQuening: rgTableType.ItemIndex := 2;
      ttGlobalTemporary: rgTableType.ItemIndex := 3;
      ttClustered: rgTableType.ItemIndex := 4;
      ttExternel: rgTableType.ItemIndex := 5;
    end;  

    case ColumnType of
      ctDefineColumns : rgColumnType.ItemIndex := 0;
      ctDefineQuery: rgColumnType.ItemIndex := 1;
      ctObjectTable: rgColumnType.ItemIndex := 2;
    end;

    //IOT_NAME := '';
    //STATUS := '';
    case LOGGING of
      ltDefault: rgLogging.ItemIndex := 0;
      ltLogging: rgLogging.ItemIndex := 1;
      ltNoLogging: rgLogging.ItemIndex := 2;
    end;

    //BACKED_UP := 'N';
    //NUM_ROWS := '';
    //BLOCKS := '';
    //EMPTY_BLOCKS := '';
    //AVG_SPACE := '';
    //CHAIN_CNT := '';
    //AVG_ROW_LEN := '';
    //AVG_SPACE_FREELIST_BLOCKS := '';
    //NUM_FREELIST_BLOCKS := '';

    if (DEGREE <> '1') or (INSTANCES <> '1') then
       cbParalel.Checked := true;

    edtParalelDegree.Text := DEGREE;
    edtParalelInstances.Text := INSTANCES;

    if CACHE then
      rgCache.ItemIndex := 0
    else
      rgCache.ItemIndex := 1;

    tsPartitions.TabVisible := PARTITIONED = 'YES';
    tsSubpartition.TabVisible := PARTITIONED = 'YES';

    //TABLE_LOCK := 'ENABLED';
    //SAMPLE_SIZE := '';
    //LAST_ANALYZED := '';

    //if IndexPartitionList.Count > 0 then
    //   PARTITIONED := 'YES'
    //else
    //   PARTITIONED := 'NO';
    //IOT_TYPE := '';

    //if TableType = ttGlobalTemporary then
    //  TEMPORARY := 'Y'
    //else
    //  TEMPORARY := 'N';
    //SECONDARY := '';
    //NESTED := 'NO';
    cbRowMovement.Checked := ROW_MOVEMENT = 'ENABLED';
    //GLOBAL_STATS := '';
    //USER_STATS := '';
    //DURATION := '';
    //SKIP_CORRUPT := '';
    cbMonitoring.Checked := MONITORING;
    //DEPENDENCIES := '';
    //COMPRESSION := '';
    //DROPPED := '';

    redtTableSQL.Text := DEFINE_QUERY;
    
    redtComment.Text := COMMENT;

    with PhsicalAttributes do
    begin
      edtPercentFree.Text := PercentFree;
      edtPercentUsed.Text := PercentUsed;
      edtInitialTrans.Text := InitialTrans;
      edtMaxTrans.Text := MaxTrans;
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

    for i := 0 to ColumnLists.Count - 1 do
    begin
      qTableColumns.Append;
      qTableColumns.FieldByName('COLUMN_NAME').AsString := ColumnLists.Items[i].ColumnName;
      qTableColumns.FieldByName('DATA_TYPE').AsString := ColumnLists.Items[i].DataType;
      if copy(GetColumnType(ColumnLists.Items[i].DataType),1,3) = '011' then
         qTableColumns.FieldByName('DATA_LENGTH').AsInteger := ColumnLists.Items[i].Precision
      else
         qTableColumns.FieldByName('DATA_LENGTH').AsInteger := ColumnLists.Items[i].Length;
      qTableColumns.FieldByName('DATA_PRECISION').AsInteger := ColumnLists.Items[i].Precision;
      qTableColumns.FieldByName('DATA_SCALE').AsInteger := ColumnLists.Items[i].Scale;
      if ColumnLists.Items[i].Nullable then
         qTableColumns.FieldByName('NULLABLE').AsString := 'Y'
      else
         qTableColumns.FieldByName('NULLABLE').AsString := 'N';
      qTableColumns.FieldByName('UNIQUE').AsBoolean := ColumnLists.Items[i].Unique;
      qTableColumns.FieldByName('DATA_DEFAULT').AsString := ColumnLists.Items[i].Default;
      qTableColumns.FieldByName('COMMENTS').AsString := ColumnLists.Items[i].Comment;
      qTableColumns.FieldByName('CONSTRAINT_TYPE').AsInteger := Integer(ColumnLists.Items[i].ConstraintType);
      qTableColumns.FieldByName('CONSTRAINT_NAME').AsString := ColumnLists.Items[i].ConstraintName;
      qTableColumns.FieldByName('CONSTRAINT_REF_TABLE').AsString := ColumnLists.Items[i].ConstraintTable;
      qTableColumns.FieldByName('CONSTRAINT_REF_COLUMN').AsString := ColumnLists.Items[i].ConstraintColumn;
      qTableColumns.FieldByName('CONSTRAINT_DELETE_RULE').AsString := ColumnLists.Items[i].ConstraintDeleteRule;
      qTableColumns.FieldByName('CONSTRAINT_STATUS').AsString := ColumnLists.Items[i].ConstraintStatus;
      qTableColumns.FieldByName('CONSTRAINT_DEFERRABLE').AsString := ColumnLists.Items[i].ConstraintDeferrable;
      qTableColumns.FieldByName('CONSTRAINT_VALIDATION').AsString := ColumnLists.Items[i].ConstraintValidation;
      qTableColumns.FieldByName('CONSTRAINT_CHK').AsString := ColumnLists.Items[i].ConstraintCheck;
      qTableColumns.Post;
    end;

    for i := 0 to ConstraintList.Count -1 do
    begin
       if ConstraintList.Items[i].ConstraintType <> ctCheck then
       if qTableColumns.Locate('COLUMN_NAME',  ConstraintList.Items[i].ConstraitColumns.Items[0].ColumnName, []) then
       begin
          qTableColumns.Edit;
          qTableColumnsCONSTRAINT_TYPE.AsInteger := integer(ConstraintList.Items[i].ConstraintType);
          qTableColumnsCONSTRAINT_NAME.AsString := ConstraintList.Items[i].ConstraintName;
          qTableColumnsCONSTRAINT_DELETE_RULE.AsString := ConstraintList.Items[i].DeleteRule;
          qTableColumnsCONSTRAINT_STATUS.AsString := ConstraintList.Items[i].Status;
          qTableColumnsCONSTRAINT_DEFERRABLE.AsString := ConstraintList.Items[i].Deferrable;
          qTableColumnsCONSTRAINT_VALIDATION.AsString := ConstraintList.Items[i].Validated;
          qTableColumnsCONSTRAINT_CHK.AsString := ConstraintList.Items[i].SearchCondidion;

          if ConstraintList.Items[i].ConstraintType = ctForeignKey then
          begin
            qTableColumnsCONSTRAINT_REF_TABLE.AsString := ConstraintList.Items[i].RConstraintName;
            qTableColumnsCONSTRAINT_REF_COLUMN.AsString := ConstraintList.Items[i].ReferencedColumns.Items[0].ColumnName;
          end;
          qTableColumns.Post;
       end;
    end;

    //////////////////////////
    //burada IndexPartitionList clone lamak gerekiyor

    IndexPartitionList := IndexPartitionLists.Clone;
    SetSubPartitionList(IndexPartitionLists.SubpartitionList);
    rgroupHashPartitionType.EditValue := IndexHashPartitionType;
    rgPartitionRangeType.ItemIndex := Integer(IndexPartitionRangeType);

    if IndexPartitionList.Count > 0 then
    begin
      qPartitionColumns.open;
      for i := 0 to IndexPartitionList.Items[0].PartitionColumnCount -1 do
      begin
        qPartitionColumns.Append;
        qPartitionColumns.FieldByName('COLUMN_NAME').AsString := IndexPartitionList.Items[0].PartitionColumnItems[i].ColumnName;
        qPartitionColumns.Post;
      end;

      qSubPartitionColumns.Open;
      for i := 0 to IndexPartitionList.Items[0].SubpartitionColumnCount -1 do
      begin
        qSubPartitionColumns.Append;
        qSubPartitionColumns.FieldByName('COLUMN_NAME').AsString := IndexPartitionList.Items[0].SubPartitionColumnItems[i].SubpartitionName;
        qSubPartitionColumns.Post;
      end;

      qRangePartition.Open;
      for i := 0 to IndexPartitionList.Count -1 do
      begin
        qRangePartition.Append;
        qRangePartition.FieldByName('PARTITION_NAME').AsString := IndexPartitionList.Items[i].PartitionName;
        qRangePartition.FieldByName('TABLESPACE_NAME').AsString := IndexPartitionList.Items[i].PhsicalAttributes.Tablespace;
        qRangePartition.FieldByName('PARTITION_ID').AsInteger   := IndexPartitionList.Count;
        qRangePartition.Post;
      end;
    end;
    //if IndexPartitionList.count > 0 then
    //   PartitionClause := pcGlobal
    //else
    //   PartitionClause := pcNonPartition;

    //IndexPartitionLists := IndexPartitionList;
    //IndexPartitionLists.SubpartitionList := GetSubPartitionList;
    //IndexPartitionLists.Subpartitions := GetSubPartitions;
    //IndexHashPartitionType := rgroupHashPartitionType.EditValue;
    //IndexPartitionRangeType := TPartitionRangeType(rgPartitionRangeType.ItemIndex);


    lcbObjectOwner.Text := OBJECT_OWNER;
    lcbObjectType.Text := OBJECT_TYPE;
    cbObjectIdentifier.Checked := OBJECT_PRIMARY_KEY = True;

    if rgTableType.ItemIndex = 0 then //standart
    begin
    end;
    
    if rgTableType.ItemIndex = 1 then //index organized
    begin
      edtPercentageThreshold.EditValue := PERCENTAGE_THRESHOLD;
      cbKeyCompression.Checked := edtKeyCompression.Text <> '0';
      edtKeyCompression.EditValue := KEY_COMPRESSION;
      cbOverfloaw.Checked := lcbIndexOrganizedField.Text <> '';
      lcbIndexOrganizedField.Text := INDEX_OGANIZED_FIELD;
    end;

    if rgTableType.ItemIndex = 2 then //Advanced Quening
    begin
      rgPayloadType.ItemIndex := Integer(QUEUE_PAYLOAD_TYPE);
      lcbQueuingSchema.Text := QUEUE_SCHEMA;
      lcbQueuingType.Text := QUEUE_TYPE;
      cbQueuningSubscribes.Checked := QUEUE_SUBSCRIBERS = True;
      cbQueuningMessageGrouping.Checked := QUEUE_MESSAGE_GROUPING = True;
      rgQueuningCapatibility.ItemIndex := QUEUE_CAPATIBILITY;

      //for i := 0 to lbQueuingSortList.Count - 1 do
      //    if lbQueuingSortList.Selected[i] then
      //       QUEUE_SORT_LIST := lbQueuingSortList.Items[i];
    end;

    if rgTableType.ItemIndex = 3 then //Global Temporary
       rgBlobalTemporaryParams.ItemIndex := Integer(GLOBAL_TEMPORARY);

    if rgTableType.ItemIndex = 4 then //cluster
    begin
      cbCluster.Checked := CLUSTER_NAME <> '';
      lcbClusterSchema.Text := CLUSTER_OWNER;
      lcbClusterTable.Text := CLUSTER_NAME;
      //lcbClusterTablePropertiesEditValueChanged(nil);
      SetClusterColumn(CLUSTER_COLUMNS);
    end;

    if rgTableType.ItemIndex = 5 then //external
    begin
      edtAccessDriver.Text := ExternalAccessDriver;
      edtAccessType.Text := ExternalAccessType;
      icbDirectory.EditValue := ExternalDefaultDirectory;
      qExternalLocations.Open;
      qExternalLocations.Append;
      qExternalLocations.FieldByName('DIRECTORY').AsString := ExternalLocations;
      qExternalLocations.Post;
      redtExternalParameters.text := ExternalParameters;
      if ExternalSpecify = 'UNLIMITED' then
         rgroupExternalLimit.ItemIndex := 0
      else
         rgroupExternalLimit.ItemIndex := 1;
      edtExternalLimit.EditValue := ExternalSpecify;   
      cbExternalParalel.Checked  := ExternalParalelDegree > 0;
      edtExternalDegree.EditValue := ExternalParalelDegree;
    end; //external
    
  end; //with FTable do


end; //GetTableDetail

function TTableDetailFrm.SetTableDetail: boolean;
var
  FColumnList : TColumnList;
  FColumn: TColumn;
  i: integer;
begin
  if (qTableColumns.State in [dsEdit,dsInsert]) and (qTableColumns.FieldByName('COLUMN_NAME').AsString <> '') then
     qTableColumns.Post;
     
  result := true;
  if edtTableName.Text = '' then
  begin
    MessageDlg('Table Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if (qTableColumns.RecordCount <= 0) and (rgColumnType.ItemIndex <> 1) and (rgTableType.ItemIndex <> 2) then
  begin
    MessageDlg('Table must contain at least one column', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if (redtTableSQL.Text = '') and (rgColumnType.ItemIndex = 1) then
  begin
    MessageDlg('Define Query cannot be blank', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  //FTableNew.NewInstance;

  with FTableNew do
  begin
    OWNER := lcTableSchema.Text;
    TABLE_NAME := edtTableName.Text;
    TableType := TTableType(rgTableType.ItemIndex);
    ColumnType := TColumnType(rgColumnType.ItemIndex);
    IOT_NAME := '';
    STATUS := '';
    LOGGING := TLoggingType(rgLogging.ItemIndex);
    BACKED_UP := 'N';
    NUM_ROWS := '';
    BLOCKS := '';
    EMPTY_BLOCKS := '';
    AVG_SPACE := '';
    CHAIN_CNT := '';
    AVG_ROW_LEN := '';
    AVG_SPACE_FREELIST_BLOCKS := '';
    NUM_FREELIST_BLOCKS := '';
    if cbParalel.Checked then
       DEGREE := edtParalelDegree.Text
    else
       DEGREE := '1';
    if cbParalel.Checked then
       INSTANCES := edtParalelInstances.Text
    else
       INSTANCES := '1';
    CACHE := rgCache.ItemIndex = 0;
    TABLE_LOCK := 'ENABLED';
    SAMPLE_SIZE := '';
    LAST_ANALYZED := '';   
    if IndexPartitionList.Count > 0 then
       PARTITIONED := 'YES'
    else
       PARTITIONED := 'NO';
    IOT_TYPE := '';
    if TableType = ttGlobalTemporary then
      TEMPORARY := 'Y'
    else
      TEMPORARY := 'N';
    SECONDARY := '';
    NESTED := 'NO';
    if cbRowMovement.Checked then
       ROW_MOVEMENT:= 'ENABLED'
    else
       ROW_MOVEMENT:= 'DISABLED';
    GLOBAL_STATS := '';
    USER_STATS := '';
    DURATION := '';
    SKIP_CORRUPT := '';
    MONITORING := cbMonitoring.Checked;
    DEPENDENCIES := '';
    COMPRESSION := '';
    DROPPED := '';

    DEFINE_QUERY := redtTableSQL.Text;

    COMMENT := redtComment.Text;

    with PhsicalAttributes do
    begin
      PercentFree:=  edtPercentFree.Text;
      PercentUsed:=  edtPercentUsed.Text;
      InitialTrans:= edtInitialTrans.Text;
      MaxTrans:=    edtMaxTrans.Text;
      Tablespace:=   lcTablespace.Text;
      InitialExtent:=edtInitialExtend.Text;
      NextExtent:=  edtNextExtend.Text;
      MinExtent:=   edtMinExtents.Text;
      MaxExtent:=   edtMaxExtents.Text;
      PctIncrease:= edtPctIncrease.Text;
      BufferPool:=  TBufferPool(cbBufferPool.ItemIndex);
      FreeLists:=   edtFreeList.Text;
      FreeGroups:=  edtFreeGroup.Text;
    end;

    FColumnList := TColumnList.Create;

    qTableColumns.first;
    while not qTableColumns.Eof do
    begin
      FColumn := TColumn.Create;
      FColumn.ColumnName := qTableColumns.FieldByName('COLUMN_NAME').AsString;
      FColumn.DataType := qTableColumns.FieldByName('DATA_TYPE').AsString;
      FColumn.UpperBound := ''; //for partitions
      FColumn.Length := qTableColumns.FieldByName('DATA_LENGTH').AsInteger;
      if copy(GetColumnType(FColumn.DataType),1,3) = '011' then
         FColumn.Precision := qTableColumns.FieldByName('DATA_LENGTH').AsInteger;
      //FColumn.Precision := //qTableColumns.FieldByName('DATA_PRECISION').AsInteger;
      FColumn.Scale := qTableColumns.FieldByName('DATA_SCALE').AsInteger;
      FColumn.Nullable := qTableColumns.FieldByName('NULLABLE').AsBoolean;
      FColumn.Unique := qTableColumns.FieldByName('UNIQUE').AsBoolean;
      FColumn.Default := qTableColumns.FieldByName('DATA_DEFAULT').AsString;
      FColumn.Comment := qTableColumns.FieldByName('COMMENTS').AsString;
      FColumn.ConstraintType := TConstraintType(qTableColumns.FieldByName('CONSTRAINT_TYPE').AsInteger);
      FColumn.ConstraintName := qTableColumns.FieldByName('CONSTRAINT_NAME').AsString;
      FColumn.ConstraintTable := qTableColumns.FieldByName('CONSTRAINT_REF_TABLE').AsString;
      FColumn.ConstraintColumn := qTableColumns.FieldByName('CONSTRAINT_REF_COLUMN').AsString;
      FColumn.ConstraintDeleteRule := qTableColumns.FieldByName('CONSTRAINT_DELETE_RULE').AsString;
      FColumn.ConstraintStatus := qTableColumns.FieldByName('CONSTRAINT_STATUS').AsString;
      FColumn.ConstraintDeferrable:= qTableColumns.FieldByName('CONSTRAINT_DEFERRABLE').AsString;
      FColumn.ConstraintValidation := qTableColumns.FieldByName('CONSTRAINT_VALIDATION').AsString;
      FColumn.ConstraintCheck := qTableColumns.FieldByName('CONSTRAINT_CHK').AsString;       
      FColumnList.Add(FColumn);
      FColumn.NewInstance;
      FColumnList.NewInstance;
      qTableColumns.Next;
    end;
    ColumnLists := FColumnList;

    if IndexPartitionList.count > 0 then
       PartitionClause := pcGlobal
    else
       PartitionClause := pcNonPartition;
    IndexPartitionLists := IndexPartitionList;
    IndexPartitionLists.SubpartitionList := GetSubPartitionList;
    IndexPartitionLists.Subpartitions := GetSubPartitions;
    IndexHashPartitionType := rgroupHashPartitionType.EditValue;
    IndexPartitionRangeType := TPartitionRangeType(rgPartitionRangeType.ItemIndex);

    OBJECT_OWNER := lcbObjectOwner.Text;
    OBJECT_TYPE := lcbObjectType.Text;
    OBJECT_PRIMARY_KEY := cbObjectIdentifier.Checked;

    if rgTableType.ItemIndex = 0 then //standart
    begin
    end;
    
    if rgTableType.ItemIndex = 1 then //index organized
    begin
      PERCENTAGE_THRESHOLD := StrToInt(edtPercentageThreshold.Text);
      if cbKeyCompression.Checked then
         KEY_COMPRESSION := StrToInt(edtKeyCompression.Text)
      else
         KEY_COMPRESSION := 0;
      if cbOverfloaw.Checked then
         INDEX_OGANIZED_FIELD := lcbIndexOrganizedField.Text
      else
         INDEX_OGANIZED_FIELD := '';
    end;

    if rgTableType.ItemIndex = 2 then //Advanced Quening
    begin
      QUEUE_PAYLOAD_TYPE := TPayloadType(rgPayloadType.ItemIndex);
      QUEUE_SCHEMA := lcbQueuingSchema.Text;
      QUEUE_TYPE := lcbQueuingType.Text;
      QUEUE_SUBSCRIBERS := cbQueuningSubscribes.Checked;
      QUEUE_MESSAGE_GROUPING := cbQueuningMessageGrouping.Checked;
      QUEUE_CAPATIBILITY := rgQueuningCapatibility.ItemIndex;

      for i := 0 to lbQueuingSortList.Count - 1 do
          if lbQueuingSortList.Selected[i] then
             QUEUE_SORT_LIST := lbQueuingSortList.Items[i];
    end;

    if rgTableType.ItemIndex = 3 then //Global Temporary
       GLOBAL_TEMPORARY := TGlobalTemporary(rgBlobalTemporaryParams.ItemIndex);

    if rgTableType.ItemIndex = 4 then //cluster
    begin
      CLUSTER_NAME := lcbClusterTable.Text;
      CLUSTER_OWNER := lcbClusterSchema.Text;
      CLUSTER_COLUMNS := GetClusterColumn;
    end;

    if rgTableType.ItemIndex = 5 then //external
    begin
      ExternalAccessDriver := edtAccessDriver.Text;
      ExternalAccessType := edtAccessType.Text;
      ExternalDefaultDirectory := icbDirectory.Text;
      ExternalLocations := GetExternalLocatons;
      ExternalParameters:= redtExternalParameters.text;
      if rgroupExternalLimit.ItemIndex = 0 then
         ExternalSpecify := 'Unlimited'
      else
         ExternalSpecify := edtExternalLimit.Text;
      if cbExternalParalel.Checked then
         ExternalParalelDegree := StrToInt(edtExternalDegree.Text)
      else
         ExternalParalelDegree := 0;
    end; //external
    
  end; //with FTable  do
end; //SetTableDetail;

procedure TTableDetailFrm.SetProperties;
begin
  edtParalelDegree.Enabled := cbParalel.Checked;
  edtParalelInstances.Enabled := cbParalel.Checked;
  if rgTableType.ItemIndex = 0 then //standart
  begin
    gbColumns.Visible := true;
    rgColumnType.Visible := true;
    tsStorage.TabVisible := true;
    gbStorage.Enabled := true;
    gbStorageClause.Enabled := true;
    gbParalel.Enabled := true;
    rgLogging.Enabled := true;
    tsPartitions.TabVisible := (FTable.TABLE_NAME = '') or (FTable.PARTITIONED = 'YES');
    tsSubpartition.TabVisible := (FTable.TABLE_NAME = '') or (FTable.PARTITIONED = 'YES');
    tsClusters.TabVisible := false;
    tsExternal.TabVisible := false;
    tsIndexOrganized.TabVisible := false;
    tsQueuing.TabVisible := false;
    tsGlobalTemporary.TabVisible := false;
    cbCluster.Enabled := false;
  end;

  if rgTableType.ItemIndex = 1 then //index organized
  begin
    gbColumns.Visible := true;
    rgColumnType.Visible := true;
    tsStorage.TabVisible := true;
    gbStorage.Enabled := true;
    gbStorageClause.Enabled := true;
    gbParalel.Enabled := true;
    rgLogging.Enabled := true;
    tsPartitions.TabVisible := (FTable.TABLE_NAME = '') or (FTable.PARTITIONED = 'YES');
    tsSubpartition.TabVisible := (FTable.TABLE_NAME = '') or (FTable.PARTITIONED = 'YES');
    tsClusters.TabVisible := false;
    tsExternal.TabVisible := false;
    tsIndexOrganized.TabVisible := true;
    tsQueuing.TabVisible := false;
    tsGlobalTemporary.TabVisible := false;
    cbCluster.Enabled := false;
  end;

  if rgTableType.ItemIndex = 2 then //Advanced Quening
  begin
    gbColumns.Visible := false;
    rgColumnType.Visible := false;
    tsStorage.TabVisible := true;
    gbStorage.Enabled := true;
    gbStorageClause.Enabled := true;
    gbParalel.Enabled := false;
    rgLogging.Enabled := true;
    tsPartitions.TabVisible := false;
    tsSubpartition.TabVisible := false;
    tsClusters.TabVisible := false;
    tsExternal.TabVisible := false;
    tsIndexOrganized.TabVisible := false;
    tsQueuing.TabVisible := true;
    tsGlobalTemporary.TabVisible := false;
    cbCluster.Enabled := false;
  end;

  if rgTableType.ItemIndex = 3 then //Global Temporary
  begin
    gbColumns.Visible := true;
    rgColumnType.Visible := true;
    tsStorage.TabVisible := true;
    gbStorage.Enabled := false;
    gbStorageClause.Enabled := false;
    gbParalel.Enabled := false;
    rgLogging.Enabled := false;
    tsPartitions.TabVisible := false;
    tsSubpartition.TabVisible := false;
    tsClusters.TabVisible := false;
    tsExternal.TabVisible := false;
    tsIndexOrganized.TabVisible := false;
    tsQueuing.TabVisible := false;
    tsGlobalTemporary.TabVisible := true;
    cbCluster.Enabled := false;
  end;

  if rgTableType.ItemIndex = 4 then //Clustered
  begin
    gbColumns.Visible := true;
    rgColumnType.Visible := false;
    tsStorage.TabVisible := true;
    gbStorage.Enabled := false;
    gbStorageClause.Enabled := false;
    gbParalel.Enabled := true;
    rgLogging.Enabled := false;
    tsPartitions.TabVisible := (FTable.TABLE_NAME = '') or (FTable.PARTITIONED = 'YES');
    tsSubpartition.TabVisible := (FTable.TABLE_NAME = '') or (FTable.PARTITIONED = 'YES');
    tsClusters.TabVisible := true;
    tsExternal.TabVisible := false;
    tsIndexOrganized.TabVisible := false;
    tsQueuing.TabVisible := false;
    tsGlobalTemporary.TabVisible := false;
    cbCluster.Enabled := (FTable.TABLE_NAME = '');
  end;

  if rgTableType.ItemIndex = 5 then //Externel
  begin
    gbColumns.Visible := true;
    rgColumnType.Visible := false;
    tsStorage.TabVisible := false;
    gbStorageClause.Enabled := false;
    gbParalel.Enabled := false;
    tsPartitions.TabVisible := false;
    tsSubpartition.TabVisible := false;
    tsClusters.TabVisible := false;
    tsExternal.TabVisible := true;
    tsIndexOrganized.TabVisible := false;
    tsQueuing.TabVisible := false;
    tsGlobalTemporary.TabVisible := false;
    cbCluster.Enabled := false;
    edtAccessDriver.Enabled := FTable.TABLE_NAME = '';
    edtAccessType.Enabled := FTable.TABLE_NAME = '';
  end;

  gbColumnObject.Visible := rgColumnType.ItemIndex = 2;

  rgTableType.Enabled := FTable.TABLE_NAME = '';
  edtTableName.Enabled := FTable.TABLE_NAME = '';
  lcTableSchema.Enabled := FTable.TABLE_NAME = '';
  rgColumnType.Enabled := FTable.TABLE_NAME = '';
  gbColumnObject.Enabled := FTable.TABLE_NAME = '';
  rgBlobalTemporaryParams.Enabled := FTable.TABLE_NAME = '';

  sbtnPartitionAdd.Enabled := FTable.TABLE_NAME = '';
  sbtnPartitionAddAll.Enabled := FTable.TABLE_NAME = '';
  sbtnPartitionRemove.Enabled := FTable.TABLE_NAME = '';
  sbtnPartitionRemoveAll.Enabled := FTable.TABLE_NAME = '';
  sbtnSubPartitionAdd.Enabled := FTable.TABLE_NAME = '';
  sbtnSubPartitionAddAll.Enabled := FTable.TABLE_NAME = '';
  sbtnSubPartitionRemove.Enabled := FTable.TABLE_NAME = '';
  sbtnSubPartitionRemoveAll.Enabled := FTable.TABLE_NAME = '';
  rgPartitionRangeType.Enabled := FTable.TABLE_NAME = '';
  gridAvailabeColumns.Enabled := FTable.TABLE_NAME = '';
  gridPartitionColumns.Enabled := FTable.TABLE_NAME = '';
  gridSubPartitionColumns.Enabled := FTable.TABLE_NAME = '';


  gbConstraintDefinition.Enabled := FTable.TABLE_NAME = '';
//  tsPartitions.TabVisible := (FTable.TABLE_NAME = '') or (FTable.PARTITIONED = 'YES');
//  tsSubpartition.TabVisible := (FTable.TABLE_NAME = '') or (FTable.PARTITIONED = 'YES');

end; //SetProperties


procedure TTableDetailFrm.rgColumnTypePropertiesChange(Sender: TObject);
begin
  SetProperties;
  qTableColumns.Clear;
  if rgColumnType.ItemIndex = 2 then
  begin
    gridColumnDBCOLUMN_NAME.Options.Editing := false;
    gridColumnDBDATA_TYPE.Options.Editing := false;
    gridColumnDBDATA_LENGTH.Options.Editing := false;
    gridColumnDBDATA_SCALE.Options.Editing := false;
  end else
    begin
    gridColumnDBCOLUMN_NAME.Options.Editing := true;
    gridColumnDBDATA_TYPE.Options.Editing := true;
    gridColumnDBDATA_LENGTH.Options.Editing := true;
    gridColumnDBDATA_SCALE.Options.Editing := true;
  end;
  gbConstraintDefinition.Visible := rgColumnType.ItemIndex = 0;
  gbConstraintDefinition2.Visible := (rgColumnType.ItemIndex = 2);
  gridColumn.Visible := not (rgColumnType.ItemIndex = 1);
  redtTableSQL.Visible := (rgColumnType.ItemIndex = 1);
  if (rgColumnType.ItemIndex = 0) and ( FTable.TABLE_NAME = '') then
     qTableColumns.Append;
end;

procedure TTableDetailFrm.cbParalelPropertiesChange(Sender: TObject);
begin
  SetProperties;
end;

procedure TTableDetailFrm.rgTableTypePropertiesChange(Sender: TObject);
begin
  SetProperties;
end;

procedure TTableDetailFrm.lcbObjectOwnerPropertiesChange(Sender: TObject);
begin
  qUserDataType.close;
  if (rgColumnType.ItemIndex = 2) and (gbColumnObject.Visible) then //object table
  begin
    qUserDataType.close;
    qUserDataType.SQL.Text := GetUserTypes(lcbObjectOwner.Text);
    qUserDataType.open;
  end;
end;

procedure TTableDetailFrm.lcbObjectTypePropertiesEditValueChanged(
  Sender: TObject);
begin
  qTemp.Close;
  qTemp.SQL.Text := GetDBATypesAttrs(lcbObjectOwner.Text,lcbObjectType.Text);
  qTemp.Open;
  qTableColumns.Clear;
  while not qTemp.Eof do
  begin
    qTableColumns.Append;
    qTableColumns.FieldByName('COLUMN_NAME').AsString := qTemp.FieldByName('ATTR_NAME').AsString;
    qTableColumns.FieldByName('DATA_TYPE').AsString :=  qTemp.FieldByName('ATTR_TYPE_NAME').AsString;
    qTableColumns.FieldByName('DATA_LENGTH').AsFloat := qTemp.FieldByName('LENGTH').AsFloat;
    if qTemp.FieldByName('PRECISION').AsFloat > 0 then
      qTableColumns.FieldByName('DATA_SCALE').AsFloat := qTemp.FieldByName('PRECISION').AsFloat
    else
      qTableColumns.FieldByName('DATA_SCALE').AsFloat := qTemp.FieldByName('SCALE').AsFloat;
    qTableColumns.Post;  
    qTemp.next;
  end;   
end;

procedure TTableDetailFrm.qTableColumnsNewRecord(DataSet: TDataSet);
begin
  qTableColumnsCONSTRAINT_TYPE.AsInteger := -1;
  qTableColumnsDATA_TYPE.AsString := 'NUMBER';
end;

procedure TTableDetailFrm.qTableColumnsBeforePost(DataSet: TDataSet);
begin
  if (qTableColumnsCONSTRAINT_TYPE.AsInteger > -1) and
     (qTableColumnsCONSTRAINT_TYPE.AsInteger < 4) and
     (qTableColumnsCONSTRAINT_NAME.Text = '') then
  begin
    MessageDlg('You must specify a constraint name. Name is missing.', mtError, [mbOk], 0);
    Abort;
  end;
end;


procedure TTableDetailFrm.gridColumnDBDATA_TYPEPropertiesEditValueChanged(
  Sender: TObject);
var
  v: variant;
begin
  v := TcxCustomEdit(Sender).EditValue;

  gridColumnDBDATA_LENGTH.Options.Editing := false; qTableColumnsDATA_LENGTH.AsInteger := 0;
  gridColumnDBDATA_SCALE.Options.Editing:= false; qTableColumnsDATA_SCALE.AsInteger := 0;

  if copy(GetColumnType(v),1,3) = '100' then
  begin
    gridColumnDBDATA_LENGTH.Options.Editing := true;
  end;
  if copy(GetColumnType(v),1,3) = '011' then
  begin
    gridColumnDBDATA_LENGTH.Options.Editing := true;
    gridColumnDBDATA_SCALE.Options.Editing := true;
  end;
  qTableColumnsDATA_TYPE.AsString := v;
end;

{*******************************************************************************}
{                          F O R E I G N                                        }
{*******************************************************************************}

procedure TTableDetailFrm.cbColumnTypePropertiesChange(Sender: TObject);
begin
  lcbRefTable.Visible := false;
  lblForeignKeyTable.Visible := false;
  lcbRefTableColumn.Visible:= false;
  lblForeignKeyColumn.Visible := false;
  edtCheck.Visible := false;
  lblCheck.Visible := false;

  qRefTable.Close;
  qRefTableColumns.Close;
  if icbColumnType.Text = 'Foreign' then
  begin
    lcbRefTable.Visible := true;
    lblForeignKeyTable.Visible := true;
    lcbRefTableColumn.Visible:= true;
    lblForeignKeyColumn.Visible := true;
    qRefTable.Close;
    qRefTable.SQL.Text := GetTables(lcTableSchema.Text);
    qRefTable.Open;
  end;

  if icbColumnType.Text = 'Check' then
  begin
    edtCheck.Visible := true;
    lblCheck.Visible := true;
  end;

  cbUnique.Enabled := icbColumnType.Text <> '';
  edtConstraintName.Enabled := icbColumnType.Text <> '';
  edtCheck.Enabled := icbColumnType.Text <> '';
  lcbRefTableColumn.Enabled := icbColumnType.Text <> '';
  lcbRefTable.Enabled := icbColumnType.Text <> '';
  icbColumnType2.Enabled := icbColumnType.Text <> '';
  cbDeleteRule.Enabled := icbColumnType.Text <> '';
  cbStatus.Enabled := icbColumnType.Text <> '';
  cbDeferrable.Enabled := icbColumnType.Text <> '';
  cbValidation.Enabled := icbColumnType.Text <> '';
end;

procedure TTableDetailFrm.lcbRefTablePropertiesChange(Sender: TObject);
begin
  if icbColumnType.Text = 'Foreign' then
  begin
    if lcbRefTable.Text = '' then exit;
    qRefTableColumns.Close;
    qRefTableColumns.SQL.Text :=  GetTableColumns(lcbRefTable.Text, lcTableSchema.Text, '');
    qRefTableColumns.Open;
  end;      
end;

{*******************************************************************************}
{                        P A R T I T I O N S                                    }
{*******************************************************************************}

procedure TTableDetailFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsPartitions then
  begin
    qAvailabeColumns.Open;
    qPartitionColumns.Open;
    qSubPartitionColumns.Open;

    qRangePartition.Open;
    qHashPartition.Open;
    
    //index kolon deðiþikliðini kontrol et
    if qAvailabeColumns.RecordCount > 0 then
    begin
      qAvailabeColumns.First;
      while not qAvailabeColumns.Eof do
      begin
        if not qTableColumns.Locate('COLUMN_NAME', qAvailabeColumns.FieldByName('COLUMN_NAME').AsString,[]) then
           qAvailabeColumns.Delete;
        qAvailabeColumns.Next;
      end;
    end;

    //index kolon deðiþikliðini kontrol et
    if qPartitionColumns.RecordCount > 0 then
    begin
      qPartitionColumns.First;
      while not qPartitionColumns.Eof do
      begin
        if not qTableColumns.Locate('COLUMN_NAME', qPartitionColumns.FieldByName('COLUMN_NAME').AsString,[]) then
           qPartitionColumns.Delete;
        qPartitionColumns.Next;
      end;
    end;

    //index kolon deðiþikliðini kontrol et
    if qSubpartitionColumns.RecordCount > 0 then
    begin
      qSubpartitionColumns.First;
      while not qSubpartitionColumns.Eof do
      begin
        if not qTableColumns.Locate('COLUMN_NAME', qSubpartitionColumns.FieldByName('COLUMN_NAME').AsString,[]) then
           qSubpartitionColumns.Delete;
        qSubpartitionColumns.Next;
      end;
    end;

    //indexlenmiþ kolonlarý partition kolon olabilir olarak seç
    if qTableColumns.RecordCount <> qAvailabeColumns.RecordCount then
    begin
      qTableColumns.First;
      while not qTableColumns.Eof do
      begin
        if (not qAvailabeColumns.Locate('COLUMN_NAME', qTableColumns.FieldByName('COLUMN_NAME').AsString, []) )
           and (not qPartitionColumns.Locate('COLUMN_NAME', qTableColumns.FieldByName('COLUMN_NAME').AsString, []) )
           and (not qSubpartitionColumns.Locate('COLUMN_NAME', qTableColumns.FieldByName('COLUMN_NAME').AsString, []) ) then
           begin
              qAvailabeColumns.Append;
              qAvailabeColumns.FieldByName('COLUMN_NAME').AsString := qTableColumns.FieldByName('COLUMN_NAME').AsString;
              qAvailabeColumns.FieldByName('DATA_TYPE').AsString := qTableColumns.FieldByName('DATA_TYPE').AsString;
              qAvailabeColumns.Post;
           end;
        qTableColumns.Next;
      end;
    end;

  end; //tsPartitions

  if NewPage = tssubpartition then
  begin
    qSubPartition.Open;
  end;

  if NewPage = tsExternal then
  begin
    GetExternal;
  end;

  if NewPage = tsDDL then
  begin
    if not SetTableDetail then AllowChange := false
    else
       begin
         if FTable.TABLE_NAME = '' then
            redtDDL.Text := FTableNew.GetDDL
         else
            redtDDL.Text := FTable.GetAlterDDL(FTableNew);
       end;
    CodeColors(self, 'Default', redtDDL, false);   
  end;
end; //pcPageChanging


function TTableDetailFrm.Partitioncontrols: boolean;
begin
  result := true;
  if qRangePartition.Active then
  begin
    if qRangePartition.RecordCount > 0 then
    begin
       if MessageDlg('This operation requires that all partitions be deleted. Continue ?', mtConfirmation, [mbYes, mbNo], 0) =  mrNo
       then result := false
       else
       begin
         qRangePartition.Clear;
         IndexPartitionList.DeleteAll;
       end;
    end;
  end;
  if qHashPartition.Active then
  begin
    if qHashPartition.RecordCount > 0 then
    begin
       if MessageDlg('This operation requires that all partitions be deleted. Continue ?', mtConfirmation, [mbYes, mbNo], 0) =  mrNo
       then result := false
       else
       begin
         qHashPartition.Clear;
         IndexPartitionList.DeleteAll;
       end;
    end;
  end;
end;

function TTableDetailFrm.PartitionTypeControl: boolean;
begin
  result := true;
  if pcPartitionType.ActivePage = tsRange then
  begin
    if qHashPartition.RecordCount > 0 then
    begin
       if MessageDlg('Hash partitions definitioned. Remove them and proceed ?', mtConfirmation, [mbYes, mbNo], 0) =  mrNo
       then result := false
       else
       begin
         qHashPartition.Clear;
         IndexPartitionList.DeleteAll;
       end;
    end;
  end;
  if pcPartitionType.ActivePage = tsHash then
  begin
    if qRangePartition.RecordCount > 0 then
    begin
       if MessageDlg('Range partitions definitioned. Remove them and proceed ?', mtConfirmation, [mbYes, mbNo], 0) =  mrNo
       then result := false
       else
       begin
         qRangePartition.Clear;
         IndexPartitionList.DeleteAll;
       end;
    end;
  end;
end;

procedure TTableDetailFrm.sbtnPartitionAddClick(Sender: TObject);
begin
  if not qAvailabeColumns.Active then exit;
  if qAvailabeColumns.RecordCount <= 0 then exit;
  if not Partitioncontrols then exit;
  qPartitionColumns.Append;
  qPartitionColumns.Fields[0].AsString := qAvailabeColumns.Fields[0].AsString;
  qPartitionColumns.Fields[1].AsString := qAvailabeColumns.Fields[1].AsString;
  qPartitionColumns.Post;
  qAvailabeColumns.Delete;
end;

procedure TTableDetailFrm.sbtnPartitionAddAllClick(Sender: TObject);
begin
  qAvailabeColumns.First;
  while not qAvailabeColumns.Eof do
     sbtnPartitionAdd.Click;
end;

procedure TTableDetailFrm.sbtnPartitionRemoveClick(Sender: TObject);
begin
  if not qPartitionColumns.Active then exit;
  if qPartitionColumns.RecordCount <= 0 then exit;
  if not Partitioncontrols then exit;
  qAvailabeColumns.Append;
  qAvailabeColumns.Fields[0].AsString := qPartitionColumns.Fields[0].AsString;
  qAvailabeColumns.Fields[1].AsString := qPartitionColumns.Fields[1].AsString;
  qAvailabeColumns.Post;
  qPartitionColumns.Delete;
end;

procedure TTableDetailFrm.sbtnPartitionRemoveAllClick(Sender: TObject);
begin
  qPartitionColumns.First;
  while not qPartitionColumns.Eof do
    sbtnPartitionRemove.Click;
end;

procedure TTableDetailFrm.sbtnSubPartitionAddClick(Sender: TObject);
begin
  if not qAvailabeColumns.Active then exit;
  if qAvailabeColumns.RecordCount <= 0 then exit;
  if not Partitioncontrols then exit;
  qSubPartitionColumns.Append;
  qSubPartitionColumns.Fields[0].AsString := qAvailabeColumns.Fields[0].AsString;
  qSubPartitionColumns.Fields[1].AsString := qAvailabeColumns.Fields[1].AsString;
  qSubPartitionColumns.Post;
  qAvailabeColumns.Delete;
end;

procedure TTableDetailFrm.sbtnSubPartitionAddAllClick(Sender: TObject);
begin
  qAvailabeColumns.First;
  while not qAvailabeColumns.Eof do
     sbtnSubPartitionAdd.Click;
end;

procedure TTableDetailFrm.sbtnSubPartitionRemoveClick(Sender: TObject);
begin
  if not qSubPartitionColumns.Active then exit;
  if qSubPartitionColumns.RecordCount <= 0 then exit;
  if not Partitioncontrols then exit;
  qAvailabeColumns.Append;
  qAvailabeColumns.Fields[0].AsString := qSubPartitionColumns.Fields[0].AsString;
  qAvailabeColumns.Fields[1].AsString := qSubPartitionColumns.Fields[1].AsString;
  qAvailabeColumns.Post;
  qSubPartitionColumns.Delete;
end;

procedure TTableDetailFrm.sbtnSubPartitionRemoveAllClick(Sender: TObject);
begin
  qSubPartitionColumns.First;
  while not qSubPartitionColumns.Eof do
    sbtnSubPartitionRemove.Click;
end;

procedure TTableDetailFrm.btnRangeAddClick(Sender: TObject);
var
  FIndexPartition: TIndexPartition;
  FPartitionColumn: TPartitionColumn;
begin
  if not qPartitionColumns.Active then exit;
  if qPartitionColumns.RecordCount <= 0 then
  begin
    MessageDlg('You must select partition columns.', mtWarning, [mbOk], 0);
    exit;
  end;
  if not PartitionTypeControl then exit;
  
  inc(FPartitionId);
  FIndexPartition := TIndexPartition.Create;
  New(FPartitionColumn);
  FIndexPartition.PartitionPosition := FPartitionId;

  qPartitionColumns.First;
  while not qPartitionColumns.Eof do
  begin
    FPartitionColumn^.ColumnName := qPartitionColumns.FieldByName('COLUMN_NAME').AsString;
    FPartitionColumn^.DataType   := qPartitionColumns.FieldByName('DATA_TYPE').AsString;
    FPartitionColumn^.UpperBound := 'MAXVALUE';
    FIndexPartition.PartitionColumnAdd(FPartitionColumn);
    New(FPartitionColumn);

    qPartitionColumns.Next;
  end;

  if TableIndexPartitionFrm.Init(FIndexPartition) then  //Show Partition colomns form
  begin
     IndexPartitionList.Add(FIndexPartition);
     qRangePartition.Append;
     qRangePartition.FieldByName('PARTITION_NAME').AsString  := FIndexPartition.PartitionName;
     qRangePartition.FieldByName('TABLESPACE_NAME').AsString := FIndexPartition.PhsicalAttributes.Tablespace;
     qRangePartition.FieldByName('PARTITION_ID').AsInteger   := IndexPartitionList.Count;
     qRangePartition.Post;
  end;

  FTable.IndexPartitionType := ptRange;
  Dispose(FPartitionColumn);
end;

procedure TTableDetailFrm.btnRangeEditClick(Sender: TObject);
var
 index: integer;
begin
  if not qRangePartition.Active then exit;
  if qRangePartition.RecordCount <= 0 then exit;

  index := IndexPartitionList.FindByPartitionId(qRangePartition.FieldByName('PARTITION_NAME').AsString);
  if TableIndexPartitionFrm.Init(IndexPartitionList.Items[index]) then
  begin
     qRangePartition.Edit;
     qRangePartition.FieldByName('PARTITION_NAME').AsString := IndexPartitionList.Items[index].PartitionName;
     qRangePartition.FieldByName('TABLESPACE_NAME').AsString := IndexPartitionList.Items[index].PhsicalAttributes.Tablespace;
     //qRangePartition.FieldByName('PARTITION_ID').AsInteger := index;
     qRangePartition.Post;
  end;
end;

procedure TTableDetailFrm.btnRangeDeleteClick(Sender: TObject);
begin
  if not qRangePartition.Active then exit;
  if qRangePartition.RecordCount <= 0 then exit;  
  IndexPartitionList.DeleteByName(qRangePartition.FieldByName('PARTITION_NAME').AsString);
  qRangePartition.Delete;
  if qRangePartition.RecordCount <= 0 then IndexPartitionList.DeleteAll;
end;

procedure TTableDetailFrm.btnHashAddClick(Sender: TObject);
var
  FIndexPartition: TIndexPartition;
  FPartitionColumn: TPartitionColumn;
  i: integer;
begin
  if not qPartitionColumns.Active then exit;
  if qPartitionColumns.RecordCount <= 0 then
  begin
    MessageDlg('You must select partition columns.', mtWarning, [mbOk], 0);
    exit;
  end;
  if not PartitionTypeControl then exit;

  for i := 1 to edtHashQuantity.EditValue do
  begin
    New(FPartitionColumn);
    FIndexPartition := TIndexPartition.Create;
    FIndexPartition.PartitionPosition := i;
    qPartitionColumns.First;
    while not qPartitionColumns.Eof do
    begin
      FPartitionColumn^.ColumnName := qPartitionColumns.FieldByName('COLUMN_NAME').AsString;
      FPartitionColumn^.DataType   := qPartitionColumns.FieldByName('DATA_TYPE').AsString;
      FPartitionColumn^.UpperBound := '';
      FIndexPartition.PartitionColumnAdd(FPartitionColumn);
      New(FPartitionColumn);
      qPartitionColumns.Next;
    end;

    FIndexPartition.PartitionName := edtTableName.EditingText+'_HP'+ IntToStr(qHashPartition.RecordCount);
    IndexPartitionList.Add(FIndexPartition);
    FIndexPartition.NewInstance;
    IndexPartitionList.NewInstance;
    qHashPartition.Append;
    qHashPartition.FieldByName('PARTITION_NAME').AsString := FIndexPartition.PartitionName;
    qHashPartition.Post;
  end;

  FTable.IndexPartitionType := ptHash;
end;

procedure TTableDetailFrm.btnHashDeleteClick(Sender: TObject);
begin
  if not qHashPartition.Active then exit;
  if qHashPartition.RecordCount <= 0 then exit;
  IndexPartitionList.DeleteByName(qHashPartition.FieldByName('PARTITION_NAME').AsString);
  qHashPartition.Delete;
end;

procedure TTableDetailFrm.qHashPartitionBeforePost(DataSet: TDataSet);
var
  index: integer;
  PhsicalAttributes: TPhsicalAttributes;
begin
  index := IndexPartitionList.FindByPartitionId(qHashPartition.FieldByName('PARTITION_NAME').AsString);

  PhsicalAttributes.Tablespace := qHashPartition.FieldByName('TABLESPACE_NAME').AsString;
  IndexPartitionList.Items[index].PhsicalAttributes := PhsicalAttributes;
  IndexPartitionList.Items[index].PartitionName := qHashPartition.FieldByName('PARTITION_NAME').AsString;
end;

function TTableDetailFrm.GetSubPartitionList: string;
begin
  result := '';
  if not qSubPartitionColumns.Active then exit;
  qSubPartitionColumns.First;
  while not qSubPartitionColumns.Eof do
  begin
    result := result + qSubPartitionColumns.FieldByName('COLUMN_NAME').AsString;
    qSubPartitionColumns.Next;
    if not qSubPartitionColumns.Eof then result := result +',';
  end;
end;

procedure TTableDetailFrm.SetSubPartitionList(Subpartitions: string);
var
  i: integer;
  sl: TStringList;
  s: string;
begin
  if Subpartitions = '' then exit;

  sl := TStringList.Create;

  while length(Subpartitions) > 0 do
  begin
    s := copy(Subpartitions,1, pos(',',Subpartitions)-1);
    delete(Subpartitions,1,pos(',',Subpartitions));
    if (s = '') and (length(Subpartitions) > 0) then
    begin
      s := Subpartitions;
      Subpartitions := '';
    end;
    sl.Add(s);
  end;

  qSubPartitionColumns.open;
  for i := 0 to sl.Count-1 do
  begin
    qSubPartitionColumns.Append;
    qSubPartitionColumns.FieldByName('COLUMN_NAME').AsString := sl.Strings[i];
    qSubPartitionColumns.Post;
  end;
end;

procedure TTableDetailFrm.btnSubpartitionAddClick(Sender: TObject);
begin
  if not PartitionTypeControl then exit;
  qSubPartition.Append;
end;

procedure TTableDetailFrm.btnSubpartitionDeleteClick(Sender: TObject);
begin
  if qSubPartition.RecordCount > 0 then
     qSubPartition.Delete;
end;

function TTableDetailFrm.GetSubPartitions: string;
begin
  result := '';
  if not qSubPartition.Active then exit;
  qSubPartition.First;
  while not qSubPartition.Eof do
  begin
   if rgSubpartitionType.ItemIndex = 0 then //user name
      result := result +'SUBPARTITION '
                       +qSubPartition.FieldByName('PARTITION_NAME').AsString
                       +'TABLESPACE '
                       + qSubPartition.FieldByName('TABLESPACE_NAME').AsString;

   if rgSubpartitionType.ItemIndex = 1 then  //list
      result := result +'SUBPARTITION '
                       +qSubPartition.FieldByName('PARTITION_NAME').AsString
                       +' VALUES '
                       +'('+qSubPartition.FieldByName('VALUES').AsString+') '
                       +'TABLESPACE '
                       + qSubPartition.FieldByName('TABLESPACE_NAME').AsString;
    qSubPartition.Next;
    if not qSubPartition.Eof then result := result +','+ln;
  end;
end;


procedure TTableDetailFrm.rgSubpartitionTypePropertiesChange(
  Sender: TObject);
begin
  gridDBSubPartitionValues.Visible := rgSubpartitionType.ItemIndex = 1;
end;

{*******************************************************************************}
{                        C L U S T E R                                          }
{*******************************************************************************}

procedure TTableDetailFrm.cbClusterPropertiesChange(Sender: TObject);
begin
  lcbClusterSchema.Enabled := cbCluster.Checked;
  lcbClusterTable.Enabled := cbCluster.Checked;
  lcbClusterSchema.Text := lcTableSchema.Text;
  qClasterColumns.Clear;
  if cbCluster.Checked then GetClusters;
end;

procedure TTableDetailFrm.lcbClusterSchemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  GetClusters;
end;

procedure TTableDetailFrm.GetClusters;
begin
  qClasterColumns.Close;
  if not cbCluster.Checked then exit;
  if lcbClusterSchema.Text = '' then exit;
  qCluster.close;
  qCluster.SQL.Text := GetCluster(lcbClusterSchema.Text, '');
  qCluster.Open;
end;

function TTableDetailFrm.GetClusterColumn: string;
begin
  result := '';
  qClasterColumns.First;
  while not qClasterColumns.Eof do
  begin
    if qClasterColumns.FieldByName('COLUMN_NAME').AsString <> '' then
       result := result + qClasterColumns.FieldByName('COLUMN_NAME').AsString+',';
    qClasterColumns.Next;
  end;
  delete(result,length(result),1);
end;

procedure TTableDetailFrm.SetClusterColumn(str: string);
var
  i: integer;
  sl: TStringList;
  s: string;
begin
  sl := TStringList.Create;

  while length(str) > 0 do
  begin
    s := copy(str,1, pos(',',str)-1);
    delete(str,1,pos(',',str));
    if (s = '') and (length(str) > 0) then
    begin
      s := str;
      str := '';
    end;
    sl.Add(s);
  end;

  qClasterColumns.First;
  i := 0;
  while not qClasterColumns.Eof do
  begin
    qClasterColumns.Edit;
    qClasterColumns.FieldByName('COLUMN_NAME').AsString := sl.Strings[i];
    qClasterColumns.Next;
    inc(i);
  end;
end;

procedure TTableDetailFrm.lcbClusterTablePropertiesEditValueChanged(
  Sender: TObject);
begin
  if not cbCluster.Checked then exit;
  if lcbClusterSchema.Text = '' then exit;
  if lcbClusterTable.Text = '' then exit;
  qTemp.close;
  qTemp.SQL.Text := GetClusterColumns(lcbClusterSchema.Text, lcbClusterTable.Text);
  qTemp.Open;
  qClasterColumns.Clear;
  qClasterColumns.Close;
  qClasterColumns.Open;
  while not qTemp.Eof do
  begin
    qClasterColumns.Append;
    qClasterColumns.FieldByName('CLUSTER_COLUMN_NAME').AsString := qTemp.FieldByName('column_name').AsString;
    qClasterColumns.FieldByName('COLUMN_NAME').AsString := '';
    qClasterColumns.Post;
    qTemp.Next;
  end;
end;


{*******************************************************************************}
{                          E X T E R N A L                                      }
{*******************************************************************************}

procedure TTableDetailFrm.GetExternal;
begin
  qExternalLocations.Open;
end;

procedure TTableDetailFrm.cbExternalParalelPropertiesChange(
  Sender: TObject);
begin
   edtExternalDegree.Enabled := cbExternalParalel.Checked;
end;

procedure TTableDetailFrm.rgroupKeyCompressionPropertiesChange(
  Sender: TObject);
begin
  edtExternalLimit.Enabled := rgroupExternalLimit.ItemIndex = 1;
end;

procedure TTableDetailFrm.gridDBExternalLocationsColumn2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if OpenDialog.Execute then
     qExternalLocations.FieldByName('DIRECTORY').AsString := OpenDialog.FileName;
end;

procedure TTableDetailFrm.btnOpenControlFileClick(Sender: TObject);
begin
  if OpenDialog.Execute then
     redtExternalParameters.Lines.LoadFromFile(OpenDialog.FileName);
end;

function TTableDetailFrm.GetExternalLocatons: string;
begin
  result := '';
  qExternalLocations.First;
  while not qExternalLocations.Eof do
  begin
    result := result + qExternalLocations.FieldByName('DIRECTORY').AsString;
    if qExternalLocations.FieldByName('FILE_NAME').AsString <> '' then
       result := result + ':' +Str(qExternalLocations.FieldByName('FILE_NAME').AsString);
    qExternalLocations.next;
    if not qExternalLocations.Eof then result := result + ',';
  end;

end;


{*******************************************************************************}
{                          INDEX ORGANIZED                                      }
{*******************************************************************************}

procedure TTableDetailFrm.cbKeyCompressionPropertiesChange(
  Sender: TObject);
begin
  edtKeyCompression.Enabled := cbKeyCompression.Checked;
end;

procedure TTableDetailFrm.cbOverfloawPropertiesChange(Sender: TObject);
begin
  lcbIndexOrganizedField.Enabled := cbOverfloaw.Checked;
end;

{*******************************************************************************}
{                          INDEX ORGANIZED                                      }
{*******************************************************************************}
procedure TTableDetailFrm.rgPayloadTypePropertiesChange(Sender: TObject);
begin
  lcbQueuingSchema.Enabled := rgPayloadType.ItemIndex = 1;
  lcbQueuingType.Enabled := rgPayloadType.ItemIndex = 1;
  if rgPayloadType.ItemIndex = 1 then
     lcbQueuingSchemaPropertiesEditValueChanged(self);
end;

procedure TTableDetailFrm.lcbQueuingSchemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  if rgPayloadType.ItemIndex = 0 then exit;
  if lcbQueuingSchema.Text = '' then exit;
  if rgTableType.ItemIndex <> 2 then exit;
  qQueuing.Close;
  qQueuing.SQL.Text := GetDBATypes(lcbQueuingSchema.Text);
  qQueuing.Open;
end;

procedure TTableDetailFrm.qTableColumnsAfterScroll(DataSet: TDataSet);
begin
  if qTableColumns.State=dsInsert then
     SendMessage(gridColumn.Handle,WM_KeyDown,VK_HOME,0);

  gridColumnDBDATA_LENGTH.Options.Editing := false;
  gridColumnDBDATA_SCALE.Options.Editing:= false;

  if copy(GetColumnType(qTableColumnsDATA_TYPE.AsString),1,3) = '100' then
  begin
    gridColumnDBDATA_LENGTH.Options.Editing := true;
  end;
  if copy(GetColumnType(qTableColumnsDATA_TYPE.AsString),1,3) = '011' then
  begin
    gridColumnDBDATA_LENGTH.Options.Editing := true;
    gridColumnDBDATA_SCALE.Options.Editing := true;
  end;
end;







end.

