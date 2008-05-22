unit frmTableConstraints;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxPC, cxControls, StdCtrls,
  cxButtons, ExtCtrls, cxGraphics, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  cxContainer, cxEdit, cxGroupBox, cxCheckBox, ComCtrls, cxListView,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Buttons, cxImageComboBox,
  cxMemo, cxRichEdit, cxRadioGroup, Ora, jpeg, VirtualTable, MemDS,
  DBAccess, GenelDM, OraConstraint, OraStorage;

type
  TTableConstraintsFrm = class(TForm)
    pc: TcxPageControl;
    tsKey: TcxTabSheet;
    tsCheck: TcxTabSheet;
    tsForeignKey: TcxTabSheet;
    tsOptions: TcxTabSheet;
    tsDDL: TcxTabSheet;
    edtDDL: TcxRichEdit;
    qTableColumns: TOraQuery;
    qTableColumnsCOLUMN_NAME: TStringField;
    qTableColumnsDATA_TYPE: TStringField;
    qTableColumnsCOLUMN_ID: TFloatField;
    dTableColumns: TDataSource;
    qKeyColumns: TVirtualTable;
    qKeyColumnsCOLUMN_NAME: TStringField;
    qKeyColumnsDATA_TYPE: TStringField;
    qKeyColumnsORDER: TStringField;
    qKeyColumnsSORT: TFloatField;
    dsKeyColumns: TDataSource;
    qTable: TOraQuery;
    StringField3: TStringField;
    tsStorage: TcxTabSheet;
    dsTable: TDataSource;
    qRefTable: TOraQuery;
    StringField1: TStringField;
    dsRefTable: TDataSource;
    qRefTableColumns: TOraQuery;
    StringField2: TStringField;
    StringField4: TStringField;
    FloatField1: TFloatField;
    dsRefTableColumns: TDataSource;
    qRefTableKeyColumns: TVirtualTable;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField2: TFloatField;
    dsRefTableKeyColumns: TDataSource;
    qExceptionTable: TOraQuery;
    StringField8: TStringField;
    dsExceptionTable: TDataSource;
    cxGroupBox4: TcxGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sbtnAddKey: TSpeedButton;
    sbtnAddAllKey: TSpeedButton;
    sbtnRemoveKey: TSpeedButton;
    sbtnRemoveAllKey: TSpeedButton;
    edtKeyName: TcxTextEdit;
    lcKeyTableSchema: TcxLookupComboBox;
    lcKeyTable: TcxLookupComboBox;
    cbKeySystemName: TcxCheckBox;
    rgrpKeyType: TcxRadioGroup;
    gridKeyTableColums: TcxGrid;
    gridKeyTableColumsDBTableView1: TcxGridDBTableView;
    gridKeyTableColumsDBTableView1COLUMN_NAME: TcxGridDBColumn;
    gridKeyTableColumsDBTableView1Column1: TcxGridDBColumn;
    gridKeyTableColumsLevel1: TcxGridLevel;
    gridKeyIndexColums: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBTableView4Column1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox6: TcxGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    cxGroupBox2: TcxGroupBox;
    edtCheckConditions: TcxRichEdit;
    edtCheckName: TcxTextEdit;
    lcCheckTableSchema: TcxLookupComboBox;
    lcCheckTable: TcxLookupComboBox;
    cbCheckSystemName: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    cxGroupBox5: TcxGroupBox;
    sbtnAddFKey: TSpeedButton;
    sbtnAddAllFKey: TSpeedButton;
    sbtnRemoveFKey: TSpeedButton;
    sbtnRemoveAllFKey: TSpeedButton;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    edtForeignKeyName: TcxTextEdit;
    lcForeignTableSchema: TcxLookupComboBox;
    lcForeignTable: TcxLookupComboBox;
    cbForeignKeySystemName: TcxCheckBox;
    cxGroupBox7: TcxGroupBox;
    sbtnAddRKey: TSpeedButton;
    sbtnAddAllRKey: TSpeedButton;
    sbtnRemoveRKey: TSpeedButton;
    sbtnRemoveAllRKey: TSpeedButton;
    Label6: TLabel;
    Label8: TLabel;
    cxGrid3: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    cxGrid4: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    lcRefTableSchema: TcxLookupComboBox;
    lcRefTable: TcxLookupComboBox;
    cxGroupBox8: TcxGroupBox;
    Label7: TLabel;
    Label15: TLabel;
    edtPercentFree: TcxMaskEdit;
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
    cbUIA: TcxCheckBox;
    cxGroupBox9: TcxGroupBox;
    rgrpStatus: TcxRadioGroup;
    rgrpValidation: TcxRadioGroup;
    rgrpDeferrable: TcxRadioGroup;
    rgrpRely: TcxRadioGroup;
    grpExceptions: TcxGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    lcbExceptionSchema: TcxLookupComboBox;
    lcbExceptionTable: TcxLookupComboBox;
    cbDeferrable: TcxCheckBox;
    rgrpDeleteRule: TcxRadioGroup;
    cxGroupBox10: TcxGroupBox;
    btnCancel: TcxButton;
    btnExecute: TcxButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    procedure lcKeyTableSchemaPropertiesEditValueChanged(Sender: TObject);
    procedure lcKeyTablePropertiesEditValueChanged(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure sbtnAddKeyClick(Sender: TObject);
    procedure sbtnAddAllKeyClick(Sender: TObject);
    procedure sbtnRemoveKeyClick(Sender: TObject);
    procedure sbtnRemoveAllKeyClick(Sender: TObject);
    procedure lcCheckTableSchemaPropertiesEditValueChanged(
      Sender: TObject);
    procedure lcForeignTableSchemaPropertiesEditValueChanged(
      Sender: TObject);
    procedure lcForeignTablePropertiesEditValueChanged(Sender: TObject);
    procedure sbtnAddFKeyClick(Sender: TObject);
    procedure sbtnAddAllFKeyClick(Sender: TObject);
    procedure sbtnRemoveFKeyClick(Sender: TObject);
    procedure sbtnRemoveAllFKeyClick(Sender: TObject);
    procedure lcRefTableSchemaPropertiesEditValueChanged(Sender: TObject);
    procedure lcRefTablePropertiesEditValueChanged(Sender: TObject);
    procedure sbtnAddRKeyClick(Sender: TObject);
    procedure sbtnAddAllRKeyClick(Sender: TObject);
    procedure sbtnRemoveRKeyClick(Sender: TObject);
    procedure sbtnRemoveAllRKeyClick(Sender: TObject);
    procedure cbDeferrablePropertiesChange(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure rgrpValidationPropertiesChange(Sender: TObject);
    procedure cxLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    FConstraint: TConstraint;

    procedure GetConstraintDetail;
    function SetConstraintDetail: boolean;

  public
    { Public declarations }
    function Init(Constraint: TConstraint): boolean;

  end;

var
  TableConstraintsFrm: TTableConstraintsFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, OraScripts, Util, OraTable, VisualOptions;


function TTableConstraintsFrm.Init(Constraint: TConstraint): boolean;
begin
  TableConstraintsFrm := TTableConstraintsFrm.Create(Application);
  Self := TableConstraintsFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  
  FConstraint := Constraint;

  dmGenel.ReLoad(FConstraint.OraSession);
  qTable.Session := FConstraint.OraSession;
  qTableColumns.Session := FConstraint.OraSession;

  tsKey.TabVisible := false;
  tsCheck.TabVisible := false;
  tsForeignKey.TabVisible := false;

  GetConstraintDetail;

  ShowModal;

  result := ModalResult = mrOk;
  Free;
end;

procedure TTableConstraintsFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TTableConstraintsFrm.GetConstraintDetail;
begin
  if FConstraint.ConstraintType in [ctPrimary, ctUniqe] then
  begin
    if FConstraint.ConstraintName = '' then caption := 'Create Key' else caption := 'Alter Key '+FConstraint.ConstraintName;
    tsKey.TabVisible := true;
    pc.ActivePage := tsKey;
    edtKeyName.Text := FConstraint.ConstraintName;
    lcKeyTableSchema.EditValue := FConstraint.Owner;
    qTable.SQL.Text := GetTables(FConstraint.Owner);
    qTable.Open;
    lcKeyTable.EditValue := FConstraint.TableName;
  end;

  if FConstraint.ConstraintType = ctCheck then
  begin
    if FConstraint.ConstraintName = '' then caption := 'Create Check' else caption := 'Alter Check '+FConstraint.ConstraintName;
    tsCheck.TabVisible := true;
    pc.ActivePage := tsCheck;
    edtCheckName.Text := FConstraint.ConstraintName;
    lcCheckTableSchema.EditValue := FConstraint.Owner;
    qTable.SQL.Text := GetTables(FConstraint.Owner);
    qTable.Open;
    lcCheckTable.EditValue := FConstraint.TableName;
  end;

  if FConstraint.ConstraintType = ctForeignKey then
  begin
    if FConstraint.ConstraintName = '' then caption := 'Create Foreign Key' else caption := 'Alter Foreign Key '+FConstraint.ConstraintName;
    tsForeignKey.TabVisible := true;
    pc.ActivePage := tsForeignKey;
    edtForeignKeyName.Text := FConstraint.ConstraintName;
    lcForeignTableSchema.EditValue := FConstraint.Owner;
    qTable.SQL.Text := GetTables(FConstraint.Owner);
    qTable.Open;
    lcForeignTable.EditValue := FConstraint.TableName;
    lcRefTableSchema.EditValue := FConstraint.Owner;     
  end;
  rgrpDeleteRule.Visible := FConstraint.ConstraintType = ctForeignKey;
end;

procedure TTableConstraintsFrm.cbDeferrablePropertiesChange(
  Sender: TObject);
begin
  rgrpDeferrable.Enabled := cbDeferrable.Checked;
  if not cbDeferrable.Checked then rgrpDeferrable.ItemIndex := 0;
end;

procedure TTableConstraintsFrm.rgrpValidationPropertiesChange(
  Sender: TObject);
begin
  grpExceptions.Enabled := rgrpValidation.ItemIndex = 1;
end;

procedure TTableConstraintsFrm.cxLookupComboBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
  qExceptionTable.close;
  if lcbExceptionSchema.Text = '' then exit;
  qExceptionTable.SQL.Text := GetTables(lcbExceptionSchema.Text);
  qExceptionTable.Open;
end;   

function TTableConstraintsFrm.SetConstraintDetail: boolean;
var
  FColumn: TColumn;
  FColumnList : TColumnList;
  FRefColumnList : TColumnList;
begin
  result := true;
  if FConstraint.ConstraintType in [ctPrimary, ctUniqe] then
  begin
    if edtKeyName.Text = '' then
    begin
      MessageDlg('Key Name must be specified', mtWarning, [mbOk], 0);
      result:= false;
      exit;
    end;
    if (qKeyColumns.RecordCount = 0) then
    begin
      MessageDlg('Key Columns must be required', mtWarning, [mbOk], 0);
      result:= false;
      exit;
    end;

    FColumnList := TColumnList.Create;
    qKeyColumns.first;
    while not qKeyColumns.Eof do
    begin
      FColumn := TColumn.Create;
      FColumn.ColumnName := qKeyColumns.FieldByName('COLUMN_NAME').AsString;
      FColumn.DataType := qKeyColumns.FieldByName('DATA_TYPE').AsString;
      FColumnList.Add(FColumn);
      FColumn.NewInstance;
      FColumnList.NewInstance;
      qKeyColumns.Next;
    end;

    with FConstraint do
    begin
      ConstraintName := edtKeyName.Text;
      Owner := FConstraint.Owner;
      if rgrpKeyType.ItemIndex = 0 then ConstraintType := ctPrimary else ConstraintType := ctUniqe;
      TableName := lcKeyTable.Text;
      ConstraitColumns := FColumnList;
      if cbKeySystemName.Checked then Generated := 'GENERATED NAME' else Generated := 'USER NAME';
    end; //FConstraint
  end; //FConstraintType = ctKey

  if FConstraint.ConstraintType = ctCheck then
  begin
    if edtCheckName.Text = '' then
    begin
      MessageDlg('Check Constraint Name must be specified', mtWarning, [mbOk], 0);
      result:= false;
      exit;
    end;
    if (edtCheckConditions.Text = '') then
    begin
      MessageDlg('Chechk Conditions must be required', mtWarning, [mbOk], 0);
      result:= false;
      exit;
    end;

    with FConstraint do
    begin
      ConstraintName := edtCheckName.Text;
      Owner := FConstraint.Owner;
      ConstraintType := ctCheck;
      TableName := lcCheckTable.Text;
      SearchCondidion := edtCheckConditions.Text;
      if cbCheckSystemName.Checked then Generated := 'GENERATED NAME' else Generated := 'USER NAME';
    end; //FConstraint

  end; //FConstraintType = ctCheck

  if FConstraint.ConstraintType = ctForeignKey then
  begin
    if edtForeignKeyName.Text = '' then
    begin
      MessageDlg('Foreign Key Name must be specified', mtWarning, [mbOk], 0);
      result:= false;
      exit;
    end;
    if (qKeyColumns.RecordCount = 0) then
    begin
      MessageDlg('Foreign Key Columns must be required', mtWarning, [mbOk], 0);
      result:= false;
      exit;
    end;
    if (qRefTableKeyColumns.RecordCount = 0) then
    begin
      MessageDlg('Referancel Key Columns must be required', mtWarning, [mbOk], 0);
      result:= false;
      exit;
    end;   

    FColumnList := TColumnList.Create;
    qKeyColumns.first;
    while not qKeyColumns.Eof do
    begin
      FColumn := TColumn.Create;
      FColumn.ColumnName := qKeyColumns.FieldByName('COLUMN_NAME').AsString;
      FColumn.DataType := qKeyColumns.FieldByName('DATA_TYPE').AsString;
      FColumnList.Add(FColumn);
      FColumn.NewInstance;
      FColumnList.NewInstance;
      qKeyColumns.Next;
    end;

    FRefColumnList := TColumnList.Create;
    qRefTableKeyColumns.First;
    while not qRefTableKeyColumns.Eof do
    begin
      FColumn := TColumn.Create;
      FColumn.ColumnName := qRefTableKeyColumns.FieldByName('COLUMN_NAME').AsString;
      FColumn.DataType := qRefTableKeyColumns.FieldByName('DATA_TYPE').AsString;
      FRefColumnList.Add(FColumn);
      FColumn.NewInstance;
      FRefColumnList.NewInstance;
      qRefTableKeyColumns.Next;
    end;

    with FConstraint do
    begin
      ConstraintName := edtForeignKeyName.Text;
      Owner := FConstraint.Owner;
      ConstraintType := ctForeignKey;
      TableName := lcForeignTable.Text;
      ConstraitColumns := FColumnList;
      ReferencedColumns := FRefColumnList;
      ROwner := lcRefTableSchema.Text;
      RConstraintName := lcRefTable.Text;
      if cbForeignKeySystemName.Checked then Generated := 'GENERATED NAME' else Generated := 'USER NAME';
    end; //FConstraint
  end; //FConstraintType = ctForeign

  FConstraint.UsingIndexAttributes := cbUIA.Checked;
  
  if cbUIA.Checked then
    with FConstraint do
    begin
      with PhsicalAttributes do
      begin
        PercentFree:=  edtPercentFree.Text;
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
    end;

    if rgrpStatus.ItemIndex = 0 then  FConstraint.Status := 'DISABLE'
       else FConstraint.Status := 'ENABLE';

    if rgrpValidation.ItemIndex = 0 then FConstraint.Validated := 'NOVALIDATE'
       else FConstraint.Validated := 'VALIDATE';

    if cbDeferrable.Checked then FConstraint.Deferrable := 'DEFERRABLE'
       else FConstraint.Deferrable := 'NOT DEFERRABLE';

    if rgrpDeferrable.ItemIndex = 0 then FConstraint.Deferred :=  'DEFERRABLE INITIALLY IMMEDIATE'
       else FConstraint.Deferred :=  'DEFERRABLE INITIALLY DEFERRED';

    if rgrpRely.ItemIndex = 1 then FConstraint.Rely := 'RELY'
       else FConstraint.Rely := '';

    if rgrpDeleteRule.ItemIndex = 0 then FConstraint.DeleteRule := 'NO ACTION';
    if rgrpDeleteRule.ItemIndex = 1 then FConstraint.DeleteRule := 'SET NULL';
    if rgrpDeleteRule.ItemIndex = 2 then FConstraint.DeleteRule := 'CASCADE';

    FConstraint.Bad := '';
    FConstraint.IndexOwner := '';
    FConstraint.IndexName := '';
    FConstraint.Invalid := '';
    FConstraint.ViewRelated := '';

    FConstraint.ExceptionSchema := lcbExceptionSchema.Text;
    FConstraint.ExceptionTable := lcbExceptionTable.Text;
end; //SetConstraintDetail


{************************** K E Y *********************************************}

procedure TTableConstraintsFrm.lcKeyTableSchemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  qTable.close;
  qTableColumns.Close;
  qKeyColumns.close;
  if lcKeyTableSchema.Text = '' then exit;
  qTable.SQL.Text := GetTables(lcKeyTableSchema.Text);
  qTable.Open;
end;

procedure TTableConstraintsFrm.lcKeyTablePropertiesEditValueChanged(
  Sender: TObject);
begin
  QTableColumns.Close;
  if qKeyColumns.Active then qKeyColumns.Clear;
  qKeyColumns.close;
  if lcKeyTable.Text = '' then exit;
  QTableColumns.SQL.Text := GetTableColumns(lcKeyTable.Text, lcKeyTableSchema.Text, '');
  QTableColumns.Open;
  qKeyColumns.Open;
end;

procedure TTableConstraintsFrm.sbtnAddKeyClick(Sender: TObject);
begin
  if not QTableColumns.Active then exit;
  if QTableColumns.RecordCount <= 0 then exit;
  qKeyColumns.Append;
  qKeyColumns.Fields[0].AsString := QTableColumns.Fields[0].AsString;
  qKeyColumns.Fields[1].AsString := QTableColumns.Fields[1].AsString;
  qKeyColumns.Post;
  QTableColumns.Delete;
end;

procedure TTableConstraintsFrm.sbtnAddAllKeyClick(Sender: TObject);
begin
  if not QTableColumns.Active then exit;
  if QTableColumns.RecordCount <= 0 then exit;

  QTableColumns.First;
  while not QTableColumns.Eof do
    sbtnAddKey.Click;
end;

procedure TTableConstraintsFrm.sbtnRemoveKeyClick(Sender: TObject);
begin
  if not QTableColumns.Active then exit;
  if qKeyColumns.RecordCount <= 0 then exit;
  QTableColumns.Append;
  QTableColumns.Fields[0].AsString := qKeyColumns.Fields[0].AsString;
  QTableColumns.Fields[1].AsString := qKeyColumns.Fields[1].AsString;
  QTableColumns.Post;
  qKeyColumns.Delete;
end;

procedure TTableConstraintsFrm.sbtnRemoveAllKeyClick(Sender: TObject);
begin
  if not QTableColumns.Active then exit;
  if qKeyColumns.RecordCount <= 0 then exit;

  qKeyColumns.First;
  while not qKeyColumns.Eof do
     sbtnRemoveKey.Click;
end;

{************************** C H E C K ******************************************}

procedure TTableConstraintsFrm.lcCheckTableSchemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  qTable.close;
  if lcCheckTableSchema.Text = '' then exit;
  qTable.SQL.Text := GetTables(lcCheckTableSchema.Text);
  qTable.Open;
end;


{************************** F O R E I G N  *************************************}

procedure TTableConstraintsFrm.lcForeignTableSchemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  qTable.close;
  qTableColumns.Close;
  if qKeyColumns.Active then qKeyColumns.Clear;
  qKeyColumns.close;
  if lcForeignTableSchema.Text = '' then exit;
  qTable.SQL.Text := GetTables(lcForeignTableSchema.Text);
  qTable.Open;
end;

procedure TTableConstraintsFrm.lcForeignTablePropertiesEditValueChanged(
  Sender: TObject);
begin
  QTableColumns.Close;
  if qKeyColumns.Active then qKeyColumns.Clear;
  qKeyColumns.close;
  if lcForeignTable.Text = '' then exit;
  QTableColumns.SQL.Text := GetTableColumns(lcForeignTable.Text, lcForeignTableSchema.Text, '');
  QTableColumns.Open;
  qKeyColumns.Open;
end;

procedure TTableConstraintsFrm.sbtnAddFKeyClick(Sender: TObject);
begin
  if not QTableColumns.Active then exit;
  if QTableColumns.RecordCount <= 0 then exit;
  qKeyColumns.Append;
  qKeyColumns.Fields[0].AsString := QTableColumns.Fields[0].AsString;
  qKeyColumns.Fields[1].AsString := QTableColumns.Fields[1].AsString;
  qKeyColumns.Post;
  QTableColumns.Delete;
end;

procedure TTableConstraintsFrm.sbtnAddAllFKeyClick(Sender: TObject);
begin
  if not QTableColumns.Active then exit;
  if QTableColumns.RecordCount <= 0 then exit;

  QTableColumns.First;
  while not QTableColumns.Eof do
    sbtnAddFKey.Click;
end;

procedure TTableConstraintsFrm.sbtnRemoveFKeyClick(Sender: TObject);
begin
  if not QTableColumns.Active then exit;
  if qKeyColumns.RecordCount <= 0 then exit;
  QTableColumns.Append;
  QTableColumns.Fields[0].AsString := qKeyColumns.Fields[0].AsString;
  QTableColumns.Fields[1].AsString := qKeyColumns.Fields[1].AsString;
  QTableColumns.Post;
  qKeyColumns.Delete;
end;

procedure TTableConstraintsFrm.sbtnRemoveAllFKeyClick(Sender: TObject);
begin
  if not QTableColumns.Active then exit;
  if qKeyColumns.RecordCount <= 0 then exit;
  qKeyColumns.First;
  while not qKeyColumns.Eof do
     sbtnRemoveFKey.Click;
end;

procedure TTableConstraintsFrm.lcRefTableSchemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  qRefTable.close;
  qRefTableColumns.Close;
  if qRefTableKeyColumns.Active then qRefTableKeyColumns.Clear;
  qRefTableKeyColumns.close;
  if lcRefTableSchema.Text = '' then exit;
  qRefTable.SQL.Text := GetTables(lcRefTableSchema.Text);
  qRefTable.Open;
end;

procedure TTableConstraintsFrm.lcRefTablePropertiesEditValueChanged(
  Sender: TObject);
begin
  qRefTableColumns.Close;
  if qRefTableKeyColumns.Active then qRefTableKeyColumns.Clear;
  qRefTableKeyColumns.close;
  if lcRefTable.Text = '' then exit;
  qRefTableColumns.SQL.Text := GetTableColumns(lcRefTable.Text, lcRefTableSchema.Text, '');
  qRefTableColumns.Open;
  qRefTableKeyColumns.Open; 
end;

procedure TTableConstraintsFrm.sbtnAddRKeyClick(Sender: TObject);
begin
  if not qRefTableColumns.Active then exit;
  if qRefTableColumns.RecordCount <= 0 then exit;
  qRefTableKeyColumns.Append;
  qRefTableKeyColumns.Fields[0].AsString := qRefTableColumns.Fields[0].AsString;
  qRefTableKeyColumns.Fields[1].AsString := qRefTableColumns.Fields[1].AsString;
  qRefTableKeyColumns.Post;
  qRefTableColumns.Delete;
end;

procedure TTableConstraintsFrm.sbtnAddAllRKeyClick(Sender: TObject);
begin
  if not qRefTableColumns.Active then exit;
  if qRefTableColumns.RecordCount <= 0 then exit;

  qRefTableColumns.First;
  while not qRefTableColumns.Eof do
    sbtnAddRKey.Click;
end;

procedure TTableConstraintsFrm.sbtnRemoveRKeyClick(Sender: TObject);
begin
  if not qRefTableKeyColumns.Active then exit;
  if qRefTableKeyColumns.RecordCount <= 0 then exit;
  qRefTableColumns.Append;
  qRefTableColumns.Fields[0].AsString := qRefTableKeyColumns.Fields[0].AsString;
  qRefTableColumns.Fields[1].AsString := qRefTableKeyColumns.Fields[1].AsString;
  qRefTableColumns.Post;
  qRefTableKeyColumns.Delete;
end;

procedure TTableConstraintsFrm.sbtnRemoveAllRKeyClick(Sender: TObject);
begin
  if not qRefTableKeyColumns.Active then exit;
  if qRefTableKeyColumns.RecordCount <= 0 then exit;
  qRefTableKeyColumns.First;
  while not qRefTableKeyColumns.Eof do
     sbtnRemoveRKey.Click;
end;


procedure TTableConstraintsFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetConstraintDetail then exit;

  edtDDL.Text := FConstraint.GetDDL;
  if FConstraint.CreateConstraint(edtDDL.Text) then ModalResult := mrOK;
end;

procedure TTableConstraintsFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetConstraintDetail then AllowChange := false
       else edtDDL.Text := FConstraint.GetDDL;
    CodeColors(self, 'Default', edtDDL, false);
  end;   
end;



end.
