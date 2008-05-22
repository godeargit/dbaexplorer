unit frmTableIndexPartition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer,
  cxEdit, cxGroupBox, cxPC, cxControls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, MemDS, VirtualTable, OraStorage, ora,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxDropDownEdit,
  cxImageComboBox, cxMaskEdit, GenelDM, cxSpinEdit, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, ExtCtrls, jpeg, OraIndex,
  cxRadioGroup, OraPartitions;

type
  TTableIndexPartitionFrm = class(TForm)
    qPartitionColumns: TVirtualTable;
    qPartitionColumnsCOLUMN_NAME: TStringField;
    qPartitionColumnsDATA_TYPE: TStringField;
    dsPartitionColumns: TDataSource;
    qPartitionColumnsUPPER_BOUND: TStringField;
    pc: TcxPageControl;
    tsGeneral: TcxTabSheet;
    tsStorage: TcxTabSheet;
    tsHashSubpartition: TcxTabSheet;
    qHashPartition: TVirtualTable;
    StringField7: TStringField;
    StringField8: TStringField;
    dsHashPartition: TDataSource;
    cxGrid2: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBTableView6PARTITION_NAME: TcxGridDBColumn;
    cxGridDBTableView6TABLESPACE_NAME: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    rgroupHashPartitionType: TcxRadioGroup;
    Label20: TLabel;
    edtHashQuantity: TcxSpinEdit;
    btnHashAdd: TcxButton;
    btnHashDelete: TcxButton;
    cxGroupBox1: TcxGroupBox;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    cxGroupBox2: TcxGroupBox;
    edtPartitionName: TcxTextEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COLUMN_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_TYPE: TcxGridDBColumn;
    cxGrid1DBTableView1UPPER_BOUND: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox3: TcxGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    edtPercentFree: TcxMaskEdit;
    edtPercentUsed: TcxMaskEdit;
    edtInitialTrans: TcxMaskEdit;
    edtMaxTrans: TcxMaskEdit;
    cxGroupBox4: TcxGroupBox;
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
    cbLogging: TcxImageComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHashAddClick(Sender: TObject);
    procedure btnHashDeleteClick(Sender: TObject);
  private
    { Private declarations }
    fResult: boolean;
    FIndexPartition : TIndexPartition;

    procedure GetIndexPartitionDetail;
    procedure SetIndexPartitionDetail;

  public
    { Public declarations }
    function Init(IndexPartition : TIndexPartition): boolean;

  end;

var
  TableIndexPartitionFrm: TTableIndexPartitionFrm;

implementation

{$R *.dfm}
uses VisualOptions;

function TTableIndexPartitionFrm.Init(IndexPartition : TIndexPartition): boolean;
begin
  TableIndexPartitionFrm := TTableIndexPartitionFrm.Create(Application);
  Self := TableIndexPartitionFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  
  FIndexPartition := IndexPartition;
  pc.ActivePage := tsGeneral;
  qPartitionColumns.Open;
  qHashPartition.Open;
  GetIndexPartitionDetail;
  
  ShowModal;
 
  result := fresult;
  Free;
end;


procedure TTableIndexPartitionFrm.SetIndexPartitionDetail;
var
  FSubPartitionColumn: TSubPartitionColumn;
begin
  with FIndexPartition do
  begin
    PartitionName:=edtPartitionName.Text;
    with PhsicalAttributes do
    begin
      PercentFree:=  edtPercentFree.Text;
      PercentUsed:=  edtPercentUsed.Text;
      InitialTrans:= edtInitialTrans.Text;
      MaxTrans:=    edtMaxTrans.Text;
      Tablespace:=   lcTablespace.Text;
      InitialExtent:=   edtInitialExtend.Text;
      NextExtent:=  edtNextExtend.Text;
      MinExtent:=   edtMinExtents.Text;
      MaxExtent:=   edtMaxExtents.Text;
      PctIncrease:= edtPctIncrease.Text;
      BufferPool:=  TBufferPool(cbBufferPool.ItemIndex);
      FreeLists:=   edtFreeList.Text;
      FreeGroups:=  edtFreeGroup.Text;
    end;
    Logging := TLoggingType(cbLogging.ItemIndex);
    HighValue := '';
    qPartitionColumns.First;
    while not qPartitionColumns.Eof do
    begin
      PartitionColumnItems[qPartitionColumns.RecNo-1].UpperBound := qPartitionColumns.FieldByName('UPPER_BOUND').AsString;
      PartitionColumnItems[qPartitionColumns.RecNo-1].ColumnName:= qPartitionColumns.FieldByName('COLUMN_NAME').AsString;
      if length(HighValue) = 0 then HighValue := qPartitionColumns.FieldByName('UPPER_BOUND').AsString
         else HighValue := HighValue + ','+qPartitionColumns.FieldByName('UPPER_BOUND').AsString;
      qPartitionColumns.Next;
    end;

    SubpartitionColumnDeleteAll;
    New(FSubPartitionColumn);
    qHashPartition.First;
    while not qHashPartition.Eof do
    begin
      FSubPartitionColumn^.SubpartitionName := qHashPartition.FieldByName('PARTITION_NAME').AsString;
      FSubPartitionColumn^.Tablespace :=  qHashPartition.FieldByName('TABLESPACE_NAME').AsString;
      SubPartitionColumnAdd(FSubPartitionColumn);
      New(FSubPartitionColumn);
      qHashPartition.Next;
    end;
  end;
end;

procedure TTableIndexPartitionFrm.GetIndexPartitionDetail;
var
  i: integer;
begin
  with FIndexPartition do
  begin
    edtPartitionName.Text := PartitionName;
    with PhsicalAttributes do
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
    cbLogging.ItemIndex := Integer(Logging);
    for i := 0 to PartitionColumnCount -1 do
    begin
      qPartitionColumns.Append;
      qPartitionColumns.FieldByName('COLUMN_NAME').AsString := PartitionColumnItems[i].ColumnName;
      qPartitionColumns.FieldByName('DATA_TYPE').AsString   := PartitionColumnItems[i].DataType;
      qPartitionColumns.FieldByName('UPPER_BOUND').AsString := PartitionColumnItems[i].UpperBound;
      qPartitionColumns.Post;
    end;
    for i := 0 to SubPartitionColumnCount -1 do
    begin
      qHashPartition.Append;
      qHashPartition.FieldByName('PARTITION_NAME').AsString := SubPartitionColumnItems[i].SubpartitionName;
      qHashPartition.FieldByName('TABLESPACE_NAME').AsString := SubPartitionColumnItems[i].Tablespace;
      qHashPartition.Post;
    end;
  end;
  cxGrid1.Enabled := FIndexPartition.PartitionName = '';
  tsHashSubpartition.Enabled := FIndexPartition.PartitionName = '';
end;

procedure TTableIndexPartitionFrm.btnOkClick(Sender: TObject);
var
  UpperBoundIsNull: boolean;
begin
  if edtPartitionName.Text = '' then
  begin
    MessageDlg('Partition Name must be specified', mtWarning, [mbOk], 0);
    exit;
  end;

  UpperBoundIsNull := false;
  qPartitionColumns.First;
  while Not qPartitionColumns.Eof do
  begin
    if qPartitionColumns.FieldByName('UPPER_BOUND').AsString = '' then UpperBoundIsNull := true;
    qPartitionColumns.Next;
  end;

  if UpperBoundIsNull then
  begin
    MessageDlg('Upper bound required for columns.', mtWarning, [mbOk], 0);
    exit;
  end;

  SetIndexPartitionDetail;
  
  fresult := true;
  close;
end;

procedure TTableIndexPartitionFrm.btnCancelClick(Sender: TObject);
begin
  fresult := false;
  close;
end;

procedure TTableIndexPartitionFrm.btnHashAddClick(Sender: TObject);
var
  i: integer;
  subname: integer;
begin
  if not qPartitionColumns.Active then exit;
  if qPartitionColumns.RecordCount <= 0 then
  begin
    MessageDlg('You must select partition columns.', mtWarning, [mbOk], 0);
    exit;
  end;
  for i := 1 to edtHashQuantity.EditValue do
  begin
    if i = 1 then subname := qHashPartition.RecordCount + 1
       else subname := i;
    qHashPartition.Append;
    qHashPartition.FieldByName('PARTITION_NAME').AsString := edtPartitionName.Text+'SUB_'+IntToStr(subname);
    qHashPartition.Post;
  end;
end;

procedure TTableIndexPartitionFrm.btnHashDeleteClick(Sender: TObject);
begin
  if not qHashPartition.Active then exit;
  if qHashPartition.RecordCount <= 0 then exit;
  qHashPartition.Delete;
end;

end.
