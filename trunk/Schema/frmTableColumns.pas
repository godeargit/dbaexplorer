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
unit frmTableColumns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Ora, cxGroupBox, cxRadioGroup, cxDBEdit,
  cxTextEdit, StdCtrls, cxControls, cxContainer, cxEdit, cxGraphics, cxPC,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMemo, cxCheckBox, cxSpinEdit, cxImageComboBox,
  Menus, cxLookAndFeelPainters, cxRichEdit, cxButtons, ExtCtrls, OraScript,
  jpeg, GenelDM;

type
  TTableColumnsFrm = class(TForm)
    QTableColumns: TOraQuery;
    QTableColumnsTABLE_NAME: TStringField;
    QTableColumnsCOLUMN_NAME: TStringField;
    QTableColumnsDATA_TYPE: TStringField;
    QTableColumnsDATA_TYPE_MOD: TStringField;
    QTableColumnsDATA_TYPE_OWNER: TStringField;
    QTableColumnsDATA_LENGTH: TFloatField;
    QTableColumnsDATA_PRECISION: TFloatField;
    QTableColumnsDATA_SCALE: TFloatField;
    QTableColumnsNULLABLE: TStringField;
    QTableColumnsCOLUMN_ID: TFloatField;
    QTableColumnsDEFAULT_LENGTH: TFloatField;
    QTableColumnsDATA_DEFAULT: TMemoField;
    QTableColumnsNUM_DISTINCT: TFloatField;
    QTableColumnsLOW_VALUE: TVarBytesField;
    QTableColumnsHIGH_VALUE: TVarBytesField;
    QTableColumnsDENSITY: TFloatField;
    QTableColumnsNUM_NULLS: TFloatField;
    QTableColumnsNUM_BUCKETS: TFloatField;
    QTableColumnsLAST_ANALYZED: TDateTimeField;
    QTableColumnsSAMPLE_SIZE: TFloatField;
    QTableColumnsCHARACTER_SET_NAME: TStringField;
    QTableColumnsCHAR_COL_DECL_LENGTH: TFloatField;
    QTableColumnsGLOBAL_STATS: TStringField;
    QTableColumnsUSER_STATS: TStringField;
    QTableColumnsAVG_COL_LEN: TFloatField;
    QTableColumnsCHAR_LENGTH: TFloatField;
    QTableColumnsCHAR_USED: TStringField;
    QTableColumnsV80_FMT_IMAGE: TStringField;
    QTableColumnsDATA_UPGRADED: TStringField;
    QTableColumnsCOMMENTS: TStringField;
    dsTableColumns: TDataSource;
    qUserDataType: TOraQuery;
    dsUserDataType: TDataSource;
    qUserDataTypeTYPE_NAME: TStringField;
    qForeignTable: TOraQuery;
    dsForeignTable: TDataSource;
    dsForeignColumn: TDataSource;
    qForeignColumn: TOraQuery;
    qForeignTableTABLE_NAME: TStringField;
    qForeignColumnCOLUMN_NAME: TStringField;
    dsExceptionTable: TDataSource;
    qExceptionTable: TOraQuery;
    StringField3: TStringField;
    pc: TcxPageControl;
    tsDataType: TcxTabSheet;
    tsCheck: TcxTabSheet;
    Label10: TLabel;
    edtCheckName: TcxTextEdit;
    cxGroupBox3: TcxGroupBox;
    edtCheckCondition: TcxMemo;
    tsForeign: TcxTabSheet;
    tsDDL: TcxTabSheet;
    edtColumnDDL: TcxRichEdit;
    cxGroupBox1: TcxGroupBox;
    btnCancel: TcxButton;
    btnExecute: TcxButton;
    cxGroupBox5: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblDataType: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtDefaultValue: TcxTextEdit;
    memComment: TcxMemo;
    edtOracleDataSize: TcxSpinEdit;
    edtOracleDataScale: TcxSpinEdit;
    icUserDataType: TcxLookupComboBox;
    cboxNullable: TcxCheckBox;
    rgroupSizeType: TcxRadioGroup;
    edtColumnName: TcxTextEdit;
    edtTableName: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    Label3: TLabel;
    rgroupColumnType: TcxRadioGroup;
    lcDataTypeSchema: TcxLookupComboBox;
    icOracleDataType: TcxImageComboBox;
    cxGroupBox6: TcxGroupBox;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    edtForeignName: TcxTextEdit;
    cboxStatus: TcxImageComboBox;
    cboxValidation: TcxImageComboBox;
    cxGroupBox4: TcxGroupBox;
    lcExceptionOwner: TcxLookupComboBox;
    lcExceptionTable: TcxLookupComboBox;
    lcForeignTable: TcxLookupComboBox;
    lcForeignSchema: TcxLookupComboBox;
    lcForeinColumn: TcxLookupComboBox;
    cboxDeleteRule: TcxImageComboBox;
    cboxDeferrable: TcxImageComboBox;
    chkDeferrable: TcxCheckBox;
    procedure rgroupColumnTypePropertiesChange(Sender: TObject);
    procedure icOracleDataTypePropertiesEditValueChanged(Sender: TObject);
    procedure lcDataTypeSchemaPropertiesEditValueChanged(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure lcForeignSchemaPropertiesEditValueChanged(Sender: TObject);
    procedure lcForeignTablePropertiesEditValueChanged(Sender: TObject);
    procedure tsDDLShow(Sender: TObject);
    procedure chkDeferrablePropertiesEditValueChanged(Sender: TObject);
    procedure lcExceptionOwnerPropertiesEditValueChanged(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
  private
    { Private declarations }
    FOraSession: TOraSession;
    FTableName, FOwnerName, FColumnName: string;

    procedure SetDataType(userType: boolean);
    procedure GetForeignKeyDetail;
    procedure GetTableColumnDetail;
    function ConvertDataType: string;
    function GenerateDDL: string;

  public
    { Public declarations }
    procedure Init(TableName, OwnerName, ColumnName: string; OraSession: TOraSession);
  end;

var
  TableColumnsFrm: TTableColumnsFrm;

implementation

{$R *.dfm}
uses frmSchemaBrowser, OraScripts, Util, OraTable, OraStorage, DBQuery, VisualOptions;

procedure TTableColumnsFrm.Init(TableName, OwnerName, ColumnName: string; OraSession: TOraSession);
begin
  TableColumnsFrm := TTableColumnsFrm.Create(Application);
  Self := TableColumnsFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FTableName := TableName;
  FOwnerName := OwnerName;
  FColumnName := ColumnName;
  FOraSession := OraSession;
  edtTableName.Text := FTableName;
  edtColumnName.Text := FColumnName;
  
  pc.ActivePage := tsDataType;
  
  QTableColumns.Session := FOraSession;
  qUserDataType.Session := FOraSession;

  dmGenel.ReLoad(FOraSession);

  SetDataType(false);

  if ColumnName <> '' then
  begin
    tsCheck.TabVisible := false;
    tsForeign.TabVisible := false;
  end
  else
  begin
    qForeignTable.Session := FOraSession;
    qForeignColumn.Session := FOraSession;
    qExceptionTable.Session := FOraSession;
    GetForeignKeyDetail;
  end;
  GetTableColumnDetail;
  ShowModal;
  Free;
end;

procedure TTableColumnsFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TTableColumnsFrm.GetTableColumnDetail;
begin
  if FColumnName = '' then Caption := 'Add Column to '+FOwnerName+'.'+FTableName
     else Caption := 'Modify Column on '+FColumnName;
  if FColumnName = '' then exit;

  QTableColumns.SQL.Text := GetTableColumns(FTableName, FOwnerName, FColumnName);
  QTableColumns.Open;

  if QTableColumns.FieldByName('DATA_TYPE_OWNER').AsString <> '' then
  begin
     rgroupColumnType.ItemIndex :=  1;
     lcDataTypeSchema.EditValue := QTableColumns.FieldByName('DATA_TYPE_OWNER').AsString;
     icUserDataType.EditValue := QTableColumns.FieldByName('DATA_TYPE').AsString;
  end
  else
  begin
     rgroupColumnType.ItemIndex :=  0;
     icOracleDataType.EditValue := QTableColumns.FieldByName('DATA_TYPE').AsString;
     lcDataTypeSchema.EditValue := '';
  end;

  if copy(GetColumnType(QTableColumns.FieldByName('DATA_TYPE').AsString),1,3) = '100' then
  begin
    edtOracleDataSize.Value := QTableColumns.FieldByName('DATA_LENGTH').AsFloat;
  end;
  if copy(GetColumnType(QTableColumns.FieldByName('DATA_TYPE').AsString),1,3) = '011' then
  begin
    edtOracleDataSize.Value := QTableColumns.FieldByName('DATA_PRECISION').AsFloat;
    edtOracleDataScale.Value := QTableColumns.FieldByName('DATA_SCALE').AsFloat;
  end;

  cboxNullable.Checked := QTableColumns.FieldByName('NULLABLE').AsString = 'Y';
  edtDefaultValue.Text := QTableColumns.FieldByName('DATA_DEFAULT').AsString;
  memComment.Text := QTableColumns.FieldByName('comments').AsString;
end;

procedure TTableColumnsFrm.rgroupColumnTypePropertiesChange(
  Sender: TObject);
begin
  SetDataType(rgroupColumnType.ItemIndex = 1);
end;

procedure TTableColumnsFrm.SetDataType(userType: boolean);
begin
  lcDataTypeSchema.Enabled := userType;
  icUserDataType.Enabled := userType;
  icOracleDataType.Enabled := not userType;
  edtOracleDataSize.Enabled := not userType;
  edtOracleDataScale.Enabled := not userType;
  if userType then
  begin
     rgroupColumnType.ItemIndex :=  1;
  end
  else
  begin
     rgroupColumnType.ItemIndex :=  0;
     lcDataTypeSchema.EditValue := '';
  end;

  icOracleDataTypePropertiesEditValueChanged(self);
end;

procedure TTableColumnsFrm.icOracleDataTypePropertiesEditValueChanged(
  Sender: TObject);
begin
  if rgroupColumnType.ItemIndex = 1 then exit;

  edtOracleDataSize.Enabled := false; edtOracleDataSize.Value := 0;
  edtOracleDataScale.Enabled := false; edtOracleDataScale.Value := 0;

  if icOracleDataType.EditValue = Null then exit;

  if copy(GetColumnType(icOracleDataType.EditValue),1,3) = '100' then
  begin
    edtOracleDataSize.Enabled := true;
  end;
  if copy(GetColumnType(icOracleDataType.EditValue),1,3) = '011' then
  begin
    edtOracleDataSize.Enabled := true;
    edtOracleDataScale.Enabled := true;
  end;

  rgroupSizeType.Visible := copy(GetColumnType(icOracleDataType.EditValue),4,1) = '1';
end;

procedure TTableColumnsFrm.chkDeferrablePropertiesEditValueChanged(
  Sender: TObject);
begin
  cboxDeferrable.Enabled := chkDeferrable.Checked;
end;

procedure TTableColumnsFrm.lcDataTypeSchemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  qUserDataType.close;
  qUserDataType.SQL.Text := GetUserTypes(lcDataTypeSchema.Text);
  qUserDataType.Open;
end;

procedure TTableColumnsFrm.GetForeignKeyDetail;
begin
{  qForeignSchema.close;
  qForeignSchema.SQL.Text := GetUsers;
  qForeignSchema.Open;

  qExceptionOwner.close;
  qExceptionOwner.SQL.Text := GetUsers;
  qExceptionOwner.Open;}
end;

procedure TTableColumnsFrm.lcForeignSchemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  qForeignTable.close;
  qForeignColumn.close;
  if lcForeignSchema.Text = '' then exit;
  qForeignTable.SQL.Text := GetTables(lcForeignSchema.Text);
  qForeignTable.Open;
end;

procedure TTableColumnsFrm.lcForeignTablePropertiesEditValueChanged(
  Sender: TObject);
begin
  qForeignColumn.close;
  if lcForeignTable.Text = '' then exit;
  qForeignColumn.SQL.Text := GetTableColumns(lcForeignTable.Text, lcForeignSchema.Text, '');
  qForeignColumn.Open;
end;

procedure TTableColumnsFrm.lcExceptionOwnerPropertiesEditValueChanged(
  Sender: TObject);
begin
  qExceptionTable.Close;
  if lcExceptionOwner.Text = '' then exit;
  qExceptionTable.close;
  qExceptionTable.SQL.Text := GetTables(lcExceptionOwner.Text);
  qExceptionTable.Open;  
end;

function TTableColumnsFrm.ConvertDataType: string;
begin
  result := icOracleDataType.Text;
  if copy(GetColumnType(icOracleDataType.EditValue),1,3) = '100' then
  begin
    result := result + '('+edtOracleDataSize.Text;
    if copy(GetColumnType(icOracleDataType.EditValue),4,1) = '1' then
    begin
       if rgroupSizeType.ItemIndex = 0 then
          result := result + ' BYTE'
       else
         result := result + ' CHAR';
    end;
    result := result + ')';
  end;
  if copy(GetColumnType(icOracleDataType.EditValue),1,3) = '011' then
  begin
    result := result + '('+edtOracleDataSize.Text+','+edtOracleDataScale.Text+')';
  end;
end;

procedure TTableColumnsFrm.tsDDLShow(Sender: TObject);
begin
  edtColumnDDL.Text := GenerateDDL;
end;

function TTableColumnsFrm.GenerateDDL: string;
var
  ddl, alterMode: string;
begin
  edtColumnDDL.Text := '';
  if edtcolumnName.Text = '' then
  begin
     MessageDlg('Column name must be specified', mtWarning, [mbOk], 0);
     exit;
  end;

  if (icOracleDataType.Text = '') and (rgroupColumnType.ItemIndex = 0) then
  begin
     MessageDlg('Column type must be specified', mtWarning, [mbOk], 0);
     exit;
  end;

  if (icUserDataType.Text = '') and (rgroupColumnType.ItemIndex = 1) then
  begin
     MessageDlg('Column user type must be specified', mtWarning, [mbOk], 0);
     exit;
  end;

  if (edtForeignName.Text <> '') and (lcForeignTable.Text = '') then
  begin
     MessageDlg('Foreign key table must be specified', mtWarning, [mbOk], 0);
     exit;
  end;

  if (edtForeignName.Text <> '') and (lcForeinColumn.Text = '') then
  begin
     MessageDlg('Foreign key column must be specified', mtWarning, [mbOk], 0);
     exit;
  end;

  if (lcForeignTable.Text <> '') and (edtForeignName.Text = '') then
  begin
     MessageDlg('Foreign key name must be specified', mtWarning, [mbOk], 0);
     exit;
  end;

  if (edtCheckCondition.Text<> '') and (edtCheckName.Text = '') then
  begin
     MessageDlg('Check Constraint name must be specified', mtWarning, [mbOk], 0);
     exit;
  end;

  ddl := 'ALTER TABLE '+FOwnerName+'.'+FTableName+ln;

  if FColumnName = '' then alterMode := 'ADD'
     else alterMode := 'MODIFY';

  if rgroupColumnType.ItemIndex = 0 then
     ddl := ddl + alterMode +' ('+edtColumnName.Text +' '+ ConvertDataType
  else
     ddl := ddl +'ADD ('+edtColumnName.Text +' '+ lcDataTypeSchema.Text+'.'+icUserDataType.Text;

  if edtDefaultValue.Text <> '' then
     ddl := ddl + ' DEFAULT '+ edtDefaultValue.Text;

  if edtCheckCondition.Text <> '' then
     ddl := ddl + ' CONSTRAINT '+edtCheckName.Text+ ' CHECK ('+edtCheckCondition.Text+')';

  ddl := ddl +');'+ln+ln;

  if edtForeignName.Text <> '' then
  begin
    ddl := ddl +'ALTER TABLE '+FOwnerName+'.'+FTableName+ln
               +'ADD CONSTRAINT '+edtForeignName.Text+ln
               +'FOREIGN KEY'+ln
               +'   ('+edtColumnName.Text+')'+ln
               +'REFERENCES'+ln
               +'   '+lcForeignSchema.Text+'.'+lcForeignTable.Text+ln
               +'   ('+lcForeinColumn.Text+')'+ln;
    if cboxStatus.Text = 'Disable' then
       ddl := ddl + 'DISABLE'+ln;
    if cboxValidation.Text = 'Validate' then
       ddl := ddl + 'VALIDATE'+ln
    else
       ddl := ddl + 'NOVALIDATE'+ln;
    if chkDeferrable.Checked then
    begin
      ddl := ddl + 'DEFERRABLE'+ln;
      if cboxDeferrable.Text = 'Initially Immediate' then
         ddl := ddl + 'INITIALLY IMMEDIATE'+ln
      else
         ddl := ddl + 'INITIALLY DEFERRED'+ln;
    end;

    if lcExceptionTable.Text <> '' then
       ddl := ddl + 'EXCEPTIONS INTO '+lcExceptionOwner.Text+'.'+lcExceptionTable.Text+ln;

    ddl := ddl + ';';   
  end;

  ddl := ddl +ln;

  if memComment.Text <> '' then
     ddl := ddl +'COMMENT ON COLUMN'+ln
                +FOwnerName+'.'+FTableName+'.'+edtColumnName.Text +' IS '+ln
                +Str(memComment.Text)+';'+ln;
  result := ddl;
end;


procedure TTableColumnsFrm.btnExecuteClick(Sender: TObject);
begin
  if ExecSQL(GenerateDDL,'Column Created', FOraSession) then
    close;
end;

end.
