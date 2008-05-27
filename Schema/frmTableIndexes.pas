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
unit frmTableIndexes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxPC, cxTextEdit, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxGraphics, cxCheckBox, cxImageComboBox, cxRadioGroup, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Buttons, cxMemo, cxRichEdit,
  DBAccess, Ora, MemDS, VirtualTable, OraScripts, GenelDM, OraStorage,
  cxSpinEdit, jpeg, OraIndex, OraPartitions;

type
  TTableIndexesFrm = class(TForm)
    qIndexTable: TOraQuery;
    StringField3: TStringField;
    dsIndexTable: TDataSource;
    qTableColumns: TOraQuery;
    qTableColumnsCOLUMN_NAME: TStringField;
    qTableColumnsDATA_TYPE: TStringField;
    dsTableColumns: TDataSource;
    qIndexColumns: TVirtualTable;
    dsIndexColumns: TDataSource;
    qIndexColumnsCOLUMN_NAME: TStringField;
    qIndexColumnsDATA_TYPE: TStringField;
    qIndexColumnsORDER: TStringField;
    qIndexColumnsSORT: TFloatField;
    qIndexCluster: TOraQuery;
    dsIndexCluster: TDataSource;
    qIndexClusterCLUSTER_NAME: TStringField;
    qAvailabeColumns: TVirtualTable;
    dsAvailabeColumns: TDataSource;
    qAvailabeColumnsCOLUMN_NAME: TStringField;
    qAvailabeColumnsDATA_TYPE: TStringField;
    dsPartitionColumns: TDataSource;
    qPartitionColumns: TVirtualTable;
    StringField2: TStringField;
    StringField4: TStringField;
    dsSubPartitionColumns: TDataSource;
    qSubPartitionColumns: TVirtualTable;
    StringField5: TStringField;
    StringField6: TStringField;
    qTableColumnsCOLUMN_ID: TFloatField;
    qRangePartition: TVirtualTable;
    dsRangePartition: TDataSource;
    qRangePartitionPARTITION_NAME: TStringField;
    qRangePartitionTABLESPACE_NAME: TStringField;
    qRangePartitionPARTITION_ID: TIntegerField;
    qHashPartition: TVirtualTable;
    StringField7: TStringField;
    StringField8: TStringField;
    dsHashPartition: TDataSource;
    qTemp: TOraQuery;
    pc: TcxPageControl;
    tsIndex: TcxTabSheet;
    tsProperties: TcxTabSheet;
    tsPartitions: TcxTabSheet;
    sbtnPartitionAdd: TSpeedButton;
    sbtnPartitionAddAll: TSpeedButton;
    sbtnPartitionRemove: TSpeedButton;
    sbtnPartitionRemoveAll: TSpeedButton;
    sbtnSubPartitionAdd: TSpeedButton;
    sbtnSubPartitionAddAll: TSpeedButton;
    sbtnSubPartitionRemove: TSpeedButton;
    sbtnSubPartitionRemoveAll: TSpeedButton;
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
    Label20: TLabel;
    cxGrid2: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBTableView6PARTITION_NAME: TcxGridDBColumn;
    cxGridDBTableView6TABLESPACE_NAME: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    btnHashAdd: TcxButton;
    btnHashDelete: TcxButton;
    rgroupHashPartitionType: TcxRadioGroup;
    edtHashQuantity: TcxSpinEdit;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    cxGroupBox1: TcxGroupBox;
    sbtnAddIndex: TSpeedButton;
    sbtnAddAllIndex: TSpeedButton;
    sbtnRemoveIndex: TSpeedButton;
    sbtnRemoveAllIndex: TSpeedButton;
    sbtnUpIndex: TSpeedButton;
    sbtnDownIndex: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    lblIndexTable: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblPartition: TLabel;
    cxGroupBox2: TcxGroupBox;
    Label6: TLabel;
    btnFunction: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    rgroupKeyCompression: TcxRadioGroup;
    cbReverse: TcxCheckBox;
    cbNoSorted: TcxCheckBox;
    cbBitmap: TcxCheckBox;
    cbParalel: TcxCheckBox;
    cbComputeStatistic: TcxCheckBox;
    cbOnline: TcxCheckBox;
    cbFunction: TcxCheckBox;
    edtFunction: TcxTextEdit;
    edtParalelDegree: TcxMaskEdit;
    edtKeyCompressionColumns: TcxMaskEdit;
    cbLogging: TcxImageComboBox;
    edtParalelInstances: TcxMaskEdit;
    gridTableColums: TcxGrid;
    gridTableColumsDBTableView1: TcxGridDBTableView;
    gridTableColumsDBTableView1COLUMN_NAME: TcxGridDBColumn;
    gridTableColumsDBTableView1Column1: TcxGridDBColumn;
    gridTableColumsLevel1: TcxGridLevel;
    gridIndexColums: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBTableView4Column1: TcxGridDBColumn;
    cxGridDBTableView4Column2: TcxGridDBColumn;
    cxGridDBTableView4Column3: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    edtIndexName: TcxTextEdit;
    lcIndexSchema: TcxLookupComboBox;
    lcTableSchema: TcxLookupComboBox;
    lcIndexTable: TcxLookupComboBox;
    rgroupIndexClause: TcxRadioGroup;
    rgroupIndexType: TcxRadioGroup;
    cbPartitionClause: TcxComboBox;
    cxGroupBox4: TcxGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    edtPercentFree: TcxMaskEdit;
    edtInitialTrans: TcxMaskEdit;
    edtMaxTrans: TcxMaskEdit;
    cxGroupBox3: TcxGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
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
    lcTablespace: TcxLookupComboBox;
    rgroupBitmapIndex: TcxGroupBox;
    Label3: TLabel;
    Label16: TLabel;
    edtBitmapIndexFromClause: TcxRichEdit;
    chkBitmapIndex: TcxCheckBox;
    edtBitmapIndexWhereClause: TcxRichEdit;
    cxGroupBox5: TcxGroupBox;
    btnCancel: TcxButton;
    btnExecute: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure onPropertiesChange(Sender: TObject);
    procedure lcTableSchemaPropertiesEditValueChanged(Sender: TObject);
    procedure lcIndexTablePropertiesEditValueChanged(Sender: TObject);
    procedure sbtnAddIndexClick(Sender: TObject);
    procedure sbtnAddAllIndexClick(Sender: TObject);
    procedure sbtnRemoveIndexClick(Sender: TObject);
    procedure sbtnRemoveAllIndexClick(Sender: TObject);
    procedure sbtnUpIndexClick(Sender: TObject);
    procedure sbtnDownIndexClick(Sender: TObject);
    procedure rgroupIndexClausePropertiesChange(Sender: TObject);
    procedure btnFunctionClick(Sender: TObject);
    procedure rgroupIndexClausePropertiesEditValueChanged(Sender: TObject);
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
    procedure cbPartitionClausePropertiesEditValueChanged(Sender: TObject);
    procedure btnRangeAddClick(Sender: TObject);
    procedure btnRangeEditClick(Sender: TObject);
    procedure btnRangeDeleteClick(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure btnHashAddClick(Sender: TObject);
    procedure btnHashDeleteClick(Sender: TObject);
    procedure qHashPartitionBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FTableIndex: TTableIndex;
    FTableIndexNew: TTableIndex;
    TableIsChanged: boolean;
    FPartitionId: integer;
    FTablePartitionType: TIndexPartitionType;
    IndexPartitionList: TIndexPartitionList;

    procedure GetIndexDetail;
    function SetIndexDetail : boolean;
    procedure SetProperties;
    function PartitionControls: boolean;
    function PartitionTypeControl: boolean;
    function GetSubPartitionList: string;

  public
    { Public declarations }
    function Init(TableIndex: TTableIndex): boolean;

  end;

var
  TableIndexesFrm: TTableIndexesFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, Util, frmTableIndexPartition, OraCluster, OraTable,
     VisualOptions;

function TTableIndexesFrm.Init(TableIndex: TTableIndex): boolean;
begin
  TableIndexesFrm := TTableIndexesFrm.Create(Application);
  Self := TableIndexesFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  FTableIndex := TableIndex;

  FTableIndexNew := TTableIndex.Create;
  FTableIndexNew.OraSession := FTableIndex.OraSession;

  FPartitionId := 0;
  
  qIndexTable.Session := FTableIndex.OraSession;
  qIndexCluster.Session := FTableIndex.OraSession;
  qTemp.Session := FTableIndex.OraSession;
  dmGenel.ReLoad(FTableIndex.OraSession);

  TableIsChanged := false;
  IndexPartitionList := TIndexPartitionList.Create;
  tsPartitions.TabVisible := false;

  GetIndexDetail;
  SetProperties;
  pc.ActivePage := tsIndex;

  ShowModal;

  result := ModalResult = mrOK;
  Free;
end;


procedure TTableIndexesFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;      

procedure TTableIndexesFrm.GetIndexDetail;
var
  i: integer;
begin
  if FTableIndex.IndexName = '' then Caption := 'Create Index' else Caption := 'Alter Index '+FTableIndex.IndexName;
  lcIndexSchema.Text := FTableIndex.IndexSchema;
  edtIndexName.Text := FTableIndex.IndexName;
  lcTableSchema.Text := FTableIndex.TableSchema;

  qIndexTable.SQL.Text := GetTables(FTableIndex.TableSchema);
  qIndexTable.Open;
  lcIndexTable.Text := FTableIndex.TableName;

  qTemp.SQL.Text := GetTablePartition();
  qTemp.ParamByName('pTable').AsString := FTableIndex.TableName;
  qTemp.Open;
  if qTemp.RecordCount > 0 then
  begin
    if qTemp.FieldByName('PARTITIONING_TYPE').AsString = 'RANGE' then
       FTablePartitionType := ptRange
    else
       FTablePartitionType := ptHash;
    lblPartition.Caption := 'This table has '+qTemp.FieldByName('PARTITION_COUNT').AsString
                                           +' '+qTemp.FieldByName('PARTITIONING_TYPE').AsString
                                           +' partitions';
    cbPartitionClause.Properties.Items.Add('Local');
  end;
  qTemp.close;

  qIndexColumns.open;
  with FTableIndex do
  begin
    for i := 0 to IndexColumnLists.Count -1 do
    begin
      qTableColumns.Locate('COLUMN_NAME',IndexColumnLists.Items[i].ColumnName,[]);
      sbtnAddIndex.Click;
    end;

    if IndexType = Uniqe then
       rgroupIndexType.ItemIndex := 1;

    edtParalelDegree.Text := IntToStr(ParalelDegree);
    edtParalelInstances.Text := IntToStr(ParalelInstances);
    cbLogging.ItemIndex := Integer(LoggingType);
    cbOnline.Checked := Online;
    cbBitmap.Checked := Bitmap;
    cbReverse.Checked := Reverse;
    cbNoSorted.Checked := NoSorted;
    edtFunction.Text := FunctionCnt;
    edtKeyCompressionColumns.Text := IntToStr(CompressColumns);

    with PhsicalAttributes do
    begin
      edtPercentFree.Text := PercentFree;
      //edtPercentUsed.Text := PercentUsed;
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

    rgroupIndexClause.ItemIndex := 0;
    IndexPartitionList := IndexPartitionLists;
    if IndexPartitionList.Count > 0 then
    begin
      cbPartitionClause.ItemIndex := 1;
      tsPartitions.TabVisible := True;
      tsPartitions.Visible := True;
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
    
  end; //FTableIndex

end; //GetIndexDetail

function TTableIndexesFrm.SetIndexDetail: boolean;
var
  FColumn: TColumn;
  FColumnList : TColumnList;
begin
  result := true;
  if edtIndexName.Text = '' then
  begin
    MessageDlg('Index Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;
  if (qIndexColumns.RecordCount = 0) and (rgroupIndexClause.ItemIndex = 0) then
  begin
    MessageDlg('Index Columns must be required', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;
  if (lcIndexTable.Text = '') and (rgroupIndexClause.ItemIndex = 0) then
  begin
    MessageDlg('Table name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;
  if (lcIndexTable.Text = '') and (rgroupIndexClause.ItemIndex = 1) then
  begin
    MessageDlg('Cluster name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;
  if (cbFunction.Checked) and (edtFunction.Text = '') then
  begin
    MessageDlg('Index Function must be required', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if cbPartitionClause.Text <> 'Non-Partitioned' then
  begin
    if IndexPartitionList.Count <= 0 then
    begin
       MessageDlg('You must name the parttions for a globally partitioned index.', mtWarning, [mbOk], 0);
       result := false;
       exit;
    end;
  end;

  if IndexPartitionList = nil then exit;
  if not QTableColumns.Active then exit;
  if (qIndexColumns.RecordCount <= 0) and (rgroupIndexClause.ItemIndex = 0) then exit;

  if cbComputeStatistic.Enabled = false then cbComputeStatistic.Checked := false;
  if cbOnline.Enabled = false then cbOnline.Checked := false;
  if cbParalel.Enabled = false then cbParalel.Checked := false;
  if cbBitmap.Enabled = false then cbBitmap.Checked := false;
  if cbReverse.Enabled = false then cbReverse.Checked := false;
  if cbNoSorted.Enabled = false then cbNoSorted.Checked := false;
  if cbFunction.Enabled = false then cbFunction.Checked := false;
  if rgroupKeyCompression.Enabled = false then rgroupKeyCompression.ItemIndex := 1;

  FColumnList := TColumnList.Create;

  with FTableIndexNew do
  begin
    IndexName :=  edtIndexName.Text;
    IndexSchema :=  lcIndexSchema.Text;
    TableSchema :=  lcTableSchema.Text;
    TableName :=  lcIndexTable.Text;
    IndexType := TIndexType(rgroupIndexType.ItemIndex);
    IndexClause := TIndexClause(rgroupIndexClause.ItemIndex); //0-TableIndex, 1-ClusterIndex
    PartitionClause := TPartitionClause(cbPartitionClause.ItemIndex); //0-NonPartition, 1-Global
    Online := cbOnline.Checked;
    Paralel := cbParalel.Checked;
    ParalelDegree := StrToIntDef(edtParalelDegree.Text,0);
    ParalelInstances := StrToIntDef(edtParalelInstances.Text,0);
    ComputeStatistic := cbComputeStatistic.Checked;
    LoggingType := TLoggingType(cbLogging.ItemIndex);
    Bitmap := cbBitmap.Checked;
    Reverse := cbReverse.Checked;
    NoSorted := cbNoSorted.Checked;
    Functions := cbFunction.Checked;
    FunctionCnt := edtFunction.Text;
    Compress := rgroupKeyCompression.ItemIndex = 0; //True-compres, False-non compress
    CompressColumns := StrToIntDef(edtKeyCompressionColumns.Text,0);

    qIndexColumns.first;
    while not qIndexColumns.Eof do
    begin
      FColumn := TColumn.Create;
      FColumn.ColumnName := qIndexColumns.FieldByName('COLUMN_NAME').AsString;
      FColumn.DataType := qIndexColumns.FieldByName('DATA_TYPE').AsString;
      FColumnList.Add(FColumn);
      FColumn.NewInstance;
      FColumnList.NewInstance;
      qIndexColumns.Next;
    end;

    IndexColumnLists := FColumnList;
    IndexPartitionLists := IndexPartitionList;
    IndexPartitionLists.SubpartitionList := GetSubPartitionList;
    IndexHashPartitionType := rgroupHashPartitionType.EditValue;

    with PhsicalAttributes do
    begin
      PercentFree:=  edtPercentFree.Text;
      //PercentUsed:=  edtPercentUsed.Text;
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
    BitmapIndexFromClause := edtBitmapIndexFromClause.Text;
    BitmapIndexWhereClause:= edtBitmapIndexWhereClause.Text;
  end;
end;


procedure TTableIndexesFrm.SetProperties;
begin
  edtParalelDegree.Enabled := (cbParalel.Checked)
                        and (rgroupIndexType.ItemIndex<> 0);
  edtParalelInstances.Enabled := (cbParalel.Checked)
                        and (rgroupIndexType.ItemIndex<> 0);


  cbParalel.Enabled := (rgroupIndexType.ItemIndex<> 0);

  edtKeyCompressionColumns.Enabled := (rgroupKeyCompression.ItemIndex = 0)
                                      and (rgroupIndexType.ItemIndex<> 0);

  cbComputeStatistic.Enabled := (not cbOnline.Checked)
                                 and (rgroupIndexType.ItemIndex<> 0);

  cbOnline.Enabled := (not cbComputeStatistic.Checked)
                      and (rgroupKeyCompression.ItemIndex = 1)
                      and (not cbFunction.Checked)
                      and (rgroupIndexType.ItemIndex<> 0);
                      
  btnFunction.Enabled := cbFunction.Checked;
  cbNoSorted.Enabled := (not cbFunction.Checked)
                        and (not cbReverse.Checked)
                        and (not cbBitmap.Checked);  

  cbReverse.Enabled := (not cbBitmap.Checked)
                       and (not cbNoSorted.Checked)
                       and (rgroupIndexType.ItemIndex<> 0);

  if cbFunction.Checked then
     cbReverse.Enabled := true;

  if cbBitmap.Checked then
     cbReverse.Enabled := false;

  rgroupKeyCompression.Enabled := (not cbBitmap.Checked)
                                   and (rgroupIndexType.ItemIndex<> 0);

  if cbBitmap.Checked then rgroupIndexType.ItemIndex := 2;

  edtBitmapIndexFromClause.Enabled := (chkBitmapIndex.Checked) and (cbBitmap.Checked);
  edtBitmapIndexWhereClause.Enabled := (chkBitmapIndex.Checked) and (cbBitmap.Checked);

  lcTableSchema.Enabled := FTableIndex.IndexName = '';
  lcIndexTable.Enabled := FTableIndex.IndexName = '';
  lcIndexSchema.Enabled := FTableIndex.IndexName = '';
  edtIndexName.Enabled := FTableIndex.IndexName = '';
  cbPartitionClause.Enabled := FTableIndex.IndexName = '';
  rgroupIndexClause.Enabled := FTableIndex.IndexName = '';
  rgroupIndexType.Enabled := FTableIndex.IndexName = '';
  gridTableColums.Enabled := FTableIndex.IndexName = '';
  gridIndexColums.Enabled := FTableIndex.IndexName = '';
  sbtnAddIndex.Enabled := FTableIndex.IndexName = '';
  sbtnAddAllIndex.Enabled := FTableIndex.IndexName = '';
  sbtnRemoveIndex.Enabled := FTableIndex.IndexName = '';
  sbtnRemoveAllIndex.Enabled := FTableIndex.IndexName = '';
  sbtnUpIndex.Enabled := FTableIndex.IndexName = '';
  sbtnDownIndex.Enabled := FTableIndex.IndexName = '';
  cbFunction.Enabled := FTableIndex.IndexName = '';
  cbNoSorted.Enabled := FTableIndex.IndexName = '';
  cbReverse.Enabled := FTableIndex.IndexName = '';
  cbBitmap.Enabled := FTableIndex.IndexName = '';
  cbOnline.Enabled := FTableIndex.IndexName = '';
  rgroupKeyCompression.Enabled := FTableIndex.IndexName = '';
  rgroupBitmapIndex.Enabled := FTableIndex.IndexName = '';
  chkBitmapIndex.Enabled := FTableIndex.IndexName = '';

  sbtnPartitionAdd.Enabled := FTableIndex.IndexName = '';
  sbtnPartitionAddAll.Enabled := FTableIndex.IndexName = '';
  sbtnPartitionRemove.Enabled := FTableIndex.IndexName = '';
  sbtnPartitionRemoveAll.Enabled := FTableIndex.IndexName = '';
  sbtnSubPartitionAdd.Enabled := FTableIndex.IndexName = '';
  sbtnSubPartitionAddAll.Enabled := FTableIndex.IndexName = '';
  sbtnSubPartitionRemove.Enabled := FTableIndex.IndexName = '';
  sbtnSubPartitionRemoveAll.Enabled := FTableIndex.IndexName = '';
  gridAvailabeColumns.Enabled := FTableIndex.IndexName = '';
  gridPartitionColumns.Enabled := FTableIndex.IndexName = '';
  gridSubPartitionColumns.Enabled := FTableIndex.IndexName = '';
  btnRangeAdd.Enabled := FTableIndex.IndexName = '';
  btnRangeEdit.Enabled := FTableIndex.IndexName = '';
  btnRangeDelete.Enabled := FTableIndex.IndexName = '';
  btnHashAdd.Enabled := FTableIndex.IndexName = '';
  btnHashDelete.Enabled := FTableIndex.IndexName = '';


end; //setProperties

procedure TTableIndexesFrm.onPropertiesChange(Sender: TObject);
begin
  SetProperties;
end;

procedure TTableIndexesFrm.lcTableSchemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  qIndexTable.close;
  qTableColumns.Close;
  if qIndexColumns.Active then qIndexColumns.Clear;
  qIndexColumns.close;
  if lcTableSchema.Text = '' then exit;
  qIndexTable.SQL.Text := GetTables(lcTableSchema.Text);
  qIndexTable.Open;
  pc.ActivePage := tsIndex;
end;

procedure TTableIndexesFrm.lcIndexTablePropertiesEditValueChanged(
  Sender: TObject);
begin
  TableIsChanged := true;
  QTableColumns.Close;
  if qIndexColumns.Active then qIndexColumns.Clear;
  qIndexColumns.close;
  if lcIndexTable.Text = '' then exit;
  QTableColumns.SQL.Text := GetTableColumns(lcIndexTable.Text, lcTableSchema.Text, '');
  QTableColumns.Open;
  qIndexColumns.Open;
  pc.ActivePage := tsIndex;
end;

procedure TTableIndexesFrm.sbtnAddIndexClick(Sender: TObject);
begin
  if not QTableColumns.Active then exit;
  if QTableColumns.RecordCount <= 0 then exit;
  qIndexColumns.Append;
  qIndexColumns.Fields[0].AsString := QTableColumns.Fields[0].AsString;
  qIndexColumns.Fields[1].AsString := QTableColumns.Fields[1].AsString;
  qIndexColumns.Fields[2].AsString := 'Asc';
  qIndexColumns.Fields[3].AsFloat := (qIndexColumns.RecordCount+1) * 10;
  qIndexColumns.Post;
  QTableColumns.Delete;
end;

procedure TTableIndexesFrm.sbtnAddAllIndexClick(Sender: TObject);
begin
  if not QTableColumns.Active then exit;
  if QTableColumns.RecordCount <= 0 then exit;

  QTableColumns.First;
  while not QTableColumns.Eof do
    sbtnAddIndex.Click;
end;

procedure TTableIndexesFrm.sbtnRemoveIndexClick(Sender: TObject);
begin
  if not QTableColumns.Active then exit;
  if qIndexColumns.RecordCount <= 0 then exit;
  QTableColumns.Append;
  QTableColumns.Fields[0].AsString := qIndexColumns.Fields[0].AsString;
  QTableColumns.Fields[1].AsString := qIndexColumns.Fields[1].AsString;
  QTableColumns.Post;
  qIndexColumns.Delete;
end;

procedure TTableIndexesFrm.sbtnRemoveAllIndexClick(Sender: TObject);
begin
  if not QTableColumns.Active then exit;
  if qIndexColumns.RecordCount <= 0 then exit;

  qIndexColumns.First;
  while not qIndexColumns.Eof do
     sbtnRemoveIndex.Click;
end;

procedure TTableIndexesFrm.sbtnUpIndexClick(Sender: TObject);
var
   bm: TBookmark;
   sort: double;
begin
  if not QTableColumns.Active then exit;
  if qIndexColumns.RecordCount <= 0 then exit;
  try
    bm := qIndexColumns.GetBookmark;
    qIndexColumns.FindPrior;
    sort := qIndexColumns.Fields[3].AsFloat;
    qIndexColumns.GotoBookmark(bm);
  finally
      qIndexColumns.FreeBookmark(bm);
  end;
  qIndexColumns.Edit;
  qIndexColumns.Fields[3].AsFloat := sort - 1 ;
  qIndexColumns.Post;
end;

procedure TTableIndexesFrm.sbtnDownIndexClick(Sender: TObject);
var
   bm: TBookmark;
   sort: double;
begin
  if not QTableColumns.Active then exit;
  if qIndexColumns.RecordCount <= 0 then exit;
  try
    bm := qIndexColumns.GetBookmark;
    qIndexColumns.FindNext;
    sort := qIndexColumns.Fields[3].AsFloat;
    qIndexColumns.GotoBookmark(bm);
  finally
      qIndexColumns.FreeBookmark(bm);
  end;
  qIndexColumns.Edit;
  qIndexColumns.Fields[3].AsFloat := sort + 1 ;
  qIndexColumns.Post;
end;



procedure TTableIndexesFrm.rgroupIndexClausePropertiesChange(
  Sender: TObject);
begin
  rgroupIndexType.Enabled := rgroupIndexClause.ItemIndex = 0;
  gridTableColums.Enabled := rgroupIndexClause.ItemIndex = 0;
  gridIndexColums.Enabled := rgroupIndexClause.ItemIndex = 0;
  cbBitmap.Enabled := rgroupIndexClause.ItemIndex = 0;
  cbReverse.Enabled := rgroupIndexClause.ItemIndex = 0;
  cbNoSorted.Enabled := rgroupIndexClause.ItemIndex = 0;
  cbFunction.Enabled := rgroupIndexClause.ItemIndex = 0;
  rgroupKeyCompression.Enabled := rgroupIndexClause.ItemIndex = 0;
  cbOnline.Enabled := rgroupIndexClause.ItemIndex = 0;

  sbtnAddIndex.Enabled := rgroupIndexClause.ItemIndex = 0;
  sbtnAddAllIndex.Enabled := rgroupIndexClause.ItemIndex = 0;
  sbtnRemoveIndex.Enabled := rgroupIndexClause.ItemIndex = 0;
  sbtnRemoveAllIndex.Enabled := rgroupIndexClause.ItemIndex = 0;
  sbtnUpIndex.Enabled := rgroupIndexClause.ItemIndex = 0;
  sbtnDownIndex.Enabled := rgroupIndexClause.ItemIndex = 0;

  qTableColumns.close;
  if qIndexColumns.Active then qIndexColumns.Clear;
  qIndexColumns.close;

  if rgroupIndexClause.ItemIndex = 0 then
    lcIndexTablePropertiesEditValueChanged(self);

  tsPartitions.TabVisible := rgroupIndexClause.ItemIndex = 0;
  cbPartitionClause.Enabled := rgroupIndexClause.ItemIndex = 0;
end;

procedure TTableIndexesFrm.btnFunctionClick(Sender: TObject);
begin
  edtFunction.Text := InputBox('Index Function', 'Enter complete expression for index', edtFunction.Text);
end;

procedure TTableIndexesFrm.rgroupIndexClausePropertiesEditValueChanged(
  Sender: TObject);
begin
  if lcTableSchema.Text = '' then exit;
  qIndexTable.close;
  qTableColumns.Close;
  qIndexColumns.close;
  qIndexCluster.close;
  
  if rgroupIndexClause.ItemIndex = 0 then
  begin
    qIndexTable.SQL.Text := GetTables(lcTableSchema.Text);
    qIndexTable.Open;

    lblIndexTable.Caption := 'Table Name :';
    lcIndexTable.Properties.ListSource := dsIndexTable;
    lcIndexTable.Properties.ListFieldNames := 'TABLE_NAME';
    lcIndexTable.Properties.KeyFieldNames := 'TABLE_NAME';
  end;
  if rgroupIndexClause.ItemIndex = 1 then
  begin
    qIndexCluster.SQL.Text := GetCluster(lcIndexSchema.Text, 'INDEX');
    qIndexCluster.Open;

    lblIndexTable.Caption := 'Cluster Name :';
    lcIndexTable.Properties.ListSource := dsIndexCluster;
    lcIndexTable.Properties.ListFieldNames := 'CLUSTER_NAME';
    lcIndexTable.Properties.KeyFieldNames := 'CLUSTER_NAME';
    cbPartitionClause.ItemIndex := 0;
  end;
  lcIndexTable.Text := '';
  pc.ActivePage := tsIndex;
end;

{*******************************************************************************}
{                        P A R T I T I O N S                                    }
{*******************************************************************************}

procedure TTableIndexesFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetIndexDetail then AllowChange := false
       else
       begin
         if FTableIndex.IndexName = '' then
            redtDDL.Text := FTableIndexNew.GetDDL
         else
            redtDDL.Text := FTableIndex.GetAlterDDL(FTableIndexNew);
       end;
    CodeColors(self, 'Default', redtDDL, false);
  end;

  if NewPage = tsPartitions then
  begin

    if TableIsChanged then
    begin
      if qAvailabeColumns.Active then qAvailabeColumns.Clear;
      qAvailabeColumns.Close;

      if qPartitionColumns.Active then qPartitionColumns.Clear;
      qPartitionColumns.close;

      if qSubPartitionColumns.Active then qSubPartitionColumns.Clear;
      qSubPartitionColumns.close;
    end;

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
        if not qIndexColumns.Locate('COLUMN_NAME', qAvailabeColumns.FieldByName('COLUMN_NAME').AsString,[]) then
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
        if not qIndexColumns.Locate('COLUMN_NAME', qPartitionColumns.FieldByName('COLUMN_NAME').AsString,[]) then
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
        if not qIndexColumns.Locate('COLUMN_NAME', qSubpartitionColumns.FieldByName('COLUMN_NAME').AsString,[]) then
           qSubpartitionColumns.Delete;
        qSubpartitionColumns.Next;
      end;
    end;

    //indexlenmiþ kolonlarý partition kolon olabilir olarak seç
    if qIndexColumns.RecordCount <> qAvailabeColumns.RecordCount then
    begin
      qIndexColumns.First;
      while not qIndexColumns.Eof do
      begin
        if (not qAvailabeColumns.Locate('COLUMN_NAME', qIndexColumns.FieldByName('COLUMN_NAME').AsString, []) )
           and (not qPartitionColumns.Locate('COLUMN_NAME', qIndexColumns.FieldByName('COLUMN_NAME').AsString, []) )
           and (not qSubpartitionColumns.Locate('COLUMN_NAME', qIndexColumns.FieldByName('COLUMN_NAME').AsString, []) ) then
           begin
              qAvailabeColumns.Append;
              qAvailabeColumns.FieldByName('COLUMN_NAME').AsString := qIndexColumns.FieldByName('COLUMN_NAME').AsString;
              qAvailabeColumns.FieldByName('DATA_TYPE').AsString := qIndexColumns.FieldByName('DATA_TYPE').AsString;
              qAvailabeColumns.Post;
           end;
        qIndexColumns.Next;
      end;
    end;

    TableIsChanged := false;
  end; //tsPartitions   
end;

function TTableIndexesFrm.Partitioncontrols: boolean;
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

function TTableIndexesFrm.PartitionTypeControl: boolean;
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

procedure TTableIndexesFrm.sbtnPartitionAddClick(Sender: TObject);
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

procedure TTableIndexesFrm.sbtnPartitionAddAllClick(Sender: TObject);
begin
  qAvailabeColumns.First;
  while not qAvailabeColumns.Eof do
     sbtnPartitionAdd.Click;
end;                      

procedure TTableIndexesFrm.sbtnPartitionRemoveClick(Sender: TObject);
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

procedure TTableIndexesFrm.sbtnPartitionRemoveAllClick(Sender: TObject);
begin
  qPartitionColumns.First;
  while not qPartitionColumns.Eof do
    sbtnPartitionRemove.Click;
end;

procedure TTableIndexesFrm.sbtnSubPartitionAddClick(Sender: TObject);
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

procedure TTableIndexesFrm.sbtnSubPartitionAddAllClick(Sender: TObject);
begin
  qAvailabeColumns.First;
  while not qAvailabeColumns.Eof do
     sbtnSubPartitionAdd.Click;
end;

procedure TTableIndexesFrm.sbtnSubPartitionRemoveClick(Sender: TObject);
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

procedure TTableIndexesFrm.sbtnSubPartitionRemoveAllClick(Sender: TObject);
begin
  qSubPartitionColumns.First;
  while not qSubPartitionColumns.Eof do
    sbtnSubPartitionRemove.Click;
end;

procedure TTableIndexesFrm.cbPartitionClausePropertiesEditValueChanged(
  Sender: TObject);
begin
  tsPartitions.TabVisible := cbPartitionClause.Text <> 'Non-Partitioned';
end;

procedure TTableIndexesFrm.btnRangeAddClick(Sender: TObject);
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

  FTableIndexNew.IndexPartitionType := ptRange;
  Dispose(FPartitionColumn);
end;

procedure TTableIndexesFrm.btnRangeEditClick(Sender: TObject);
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

procedure TTableIndexesFrm.btnRangeDeleteClick(Sender: TObject);
begin
  if not qRangePartition.Active then exit;
  if qRangePartition.RecordCount <= 0 then exit;  
  IndexPartitionList.DeleteByName(qRangePartition.FieldByName('PARTITION_NAME').AsString);
  qRangePartition.Delete;
end;   

procedure TTableIndexesFrm.btnHashAddClick(Sender: TObject);
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

    FIndexPartition.PartitionName := edtIndexName.EditingText+'_HP'+ IntToStr(qHashPartition.RecordCount);
    IndexPartitionList.Add(FIndexPartition);
    FIndexPartition.NewInstance;
    IndexPartitionList.NewInstance;
    qHashPartition.Append;
    qHashPartition.FieldByName('PARTITION_NAME').AsString := FIndexPartition.PartitionName;
    qHashPartition.Post;
  end;

  FTableIndexNew.IndexPartitionType := ptHash;
end;

procedure TTableIndexesFrm.btnHashDeleteClick(Sender: TObject);
begin
  if not qHashPartition.Active then exit;
  if qHashPartition.RecordCount <= 0 then exit;
  IndexPartitionList.DeleteByName(qHashPartition.FieldByName('PARTITION_NAME').AsString);
  qHashPartition.Delete;
end;

procedure TTableIndexesFrm.qHashPartitionBeforePost(DataSet: TDataSet);
var
  index: integer;
  PhsicalAttributes: TPhsicalAttributes;
begin
  index := IndexPartitionList.FindByPartitionId(qHashPartition.FieldByName('PARTITION_NAME').AsString);

  PhsicalAttributes.Tablespace := qHashPartition.FieldByName('TABLESPACE_NAME').AsString;
  IndexPartitionList.Items[index].PhsicalAttributes := PhsicalAttributes;
  IndexPartitionList.Items[index].PartitionName := qHashPartition.FieldByName('PARTITION_NAME').AsString;
end;


function TTableIndexesFrm.GetSubPartitionList: string;
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


procedure TTableIndexesFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetIndexDetail then exit;

  if FTableIndex.IndexName = '' then
  begin
    redtDDL.Text := FTableIndexNew.GetDDL;
    if FTableIndexNew.CreateIndex(redtDDL.Text) then ModalResult := mrOK;
  end else
  begin
    redtDDL.Text := FTableIndex.GetAlterDDL(FTableIndexNew);
    if FTableIndexNew.AlterIndex(redtDDL.Text) then ModalResult := mrOK;
  end;

end;





end.
