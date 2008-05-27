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
unit frmTableEvents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxPC, cxControls, StdCtrls,
  cxButtons, ExtCtrls, cxTextEdit, cxMemo, cxRichEdit, cxCheckBox,
  cxContainer, cxEdit, cxLabel, cxGroupBox, cxRadioGroup, cxGraphics,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, Ora, OraStorage, GenelDM,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxSpinEdit;

type
  TTableEventsFrm = class(TForm)
    Panel1: TPanel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    Panel2: TPanel;
    imgToolBar: TImage;
    imgObject: TImage;
    lblObjectName: TcxLabel;
    Shape1: TShape;
    lblAction: TLabel;
    pnlDropTable: TPanel;
    cbDropTableCascadeConstraint: TcxCheckBox;
    pnlTruncateTable: TPanel;
    rgTruncateTableStorage: TcxRadioGroup;
    pnlRenameTable: TPanel;
    cxLabel3: TcxLabel;
    edtRenameTable: TcxTextEdit;
    pnlCopyTable: TPanel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    edtNewTableName: TcxTextEdit;
    cbIncludeData: TcxCheckBox;
    lcNewTableOwner: TcxLookupComboBox;
    pnlLockTable: TPanel;
    cxLabel6: TcxLabel;
    cbNowait: TcxCheckBox;
    icbLockMode: TcxImageComboBox;
    pnlDropColumn: TPanel;
    cbDropColumnCascade: TcxCheckBox;
    pnlAnalyzeTable: TPanel;
    rgAnalyzeTableFunction: TcxRadioGroup;
    edtAnalyzeTableSampleSize: TcxSpinEdit;
    cxLabel8: TcxLabel;
    rgAnalyzeTableSampleType: TcxRadioGroup;
    pnlAnalyzeIndex: TPanel;
    rgAnalyzeIndexFunction: TcxRadioGroup;
    edtAnalyzeIndexSampleSize: TcxSpinEdit;
    rgAnalyzeIndexSampleType: TcxRadioGroup;
    cxLabel12: TcxLabel;
    pnlRenameConstraint: TPanel;
    cxLabel16: TcxLabel;
    edtNewConstraintName: TcxTextEdit;
    pnlRenameView: TPanel;
    edtRenameView: TcxTextEdit;
    cxLabel1: TcxLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure rgAnalyzeTableFunctionPropertiesEditValueChanged(
      Sender: TObject);
    procedure rgAnalyzeIndexFunctionPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FResult : boolean;
    FObj: TObject;
    FOraEvent: TOraEvent;
  public
    { Public declarations }
    function Init(obj: TObject; OEvent: TOraEvent): boolean;
  end;

var
  TableEventsFrm: TTableEventsFrm;

implementation

{$R *.dfm}

uses OraTable, OraIndex, OraConstraint, OraTriger, OraSynonym, OraView,
     VisualOptions;

function TTableEventsFrm.Init(Obj: TObject; OEvent: TOraEvent): boolean;
var
  objectID: integer;
begin
  TableEventsFrm := TTableEventsFrm.Create(Application);
  Self := TableEventsFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FObj := Obj;
  FOraEvent := OEvent;
  FResult := false;
  objectID := 0;

  pnlDropTable.Visible := (FObj is TTable) and (FOraEvent = oeDrop);
  pnlCopyTable.Visible := (FObj is TTable) and (FOraEvent = oeCopy);
  pnlLockTable.Visible := (FObj is TTable) and (FOraEvent = oeLock);
  pnlRenameTable.Visible := (FObj is TTable) and (FOraEvent = oeRename);
  pnlTruncateTable.Visible := (FObj is TTable) and (FOraEvent = oeTruncate);
  pnlAnalyzeTable.Visible := (FObj is TTable) and (FOraEvent = oeAnalyze);

  pnlAnalyzeIndex.Visible := (FObj is TTableIndex) and (FOraEvent = oeAnalyze);

  pnlRenameConstraint.Visible := (FObj is TConstraint) and (FOraEvent = oeRename);

  pnlRenameView.Visible := (FObj is TView) and (FOraEvent = oeRename);

  if (FObj is TTable) then
  begin
    lblObjectName.Caption := TTable(FObj).TABLE_NAME;
    objectID := Integer(TDBFormType(dbTable));
  end;

  if (FObj is TTableIndex) then
  begin
    lblObjectName.Caption := TTableIndex(FObj).IndexName;
    objectID := Integer(TDBFormType(dbIndexes));
  end;

  if (FObj is TConstraint) then
  begin
    lblObjectName.Caption := TConstraint(FObj).ConstraintName;
    objectID := Integer(TDBFormType(dbConstraint));
  end;

  if (FObj is TView) then
  begin
    lblObjectName.Caption := TView(FObj).VIEW_NAME;
    objectID := Integer(TDBFormType(dbView));
  end;

  dmGenel.ilSchemaBrowser.GetBitmap(objectID,imgObject.Picture.Bitmap);

  Caption := OraEvent[FOraEvent]+' '+DBFormType[TDBFormType(objectID)];
  lblAction.Caption := 'Are you sure you want to '+UpperCase(OraEvent[FOraEvent])+' selected '+DBFormType[TDBFormType(objectID)]+' ?';

  ShowModal;

  result := FResult;
  Free;
end;

procedure TTableEventsFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TTableEventsFrm.btnOKClick(Sender: TObject);
begin
  btnOK.Enabled := False;
  if (FObj is TTable) then
  begin
    if FOraEvent = oeDrop then FResult := TTable(FObj).DropTable(cbDropTableCascadeConstraint.Checked);
    if FOraEvent = oeTruncate then FResult := TTable(FObj).TruncateTable(rgTruncateTableStorage.ItemIndex);
    if FOraEvent = oeLock then FResult := TTable(FObj).LockTable(TLockMode(icbLockMode.ItemIndex),cbNowait.Checked);
    if FOraEvent = oeCopy then FResult := TTable(FObj).CopyTable(edtNewTableName.Text, lcNewTableOwner.Text, cbIncludeData.Checked);
    if FOraEvent = oeRename then FResult := TTable(FObj).RenameTable(edtRenameTable.Text);
    if FOraEvent = oeAnalyze then FResult := TTable(FObj).AnalyzeTable(TAnalyzeFunction(rgAnalyzeTableFunction.ItemIndex), edtAnalyzeTableSampleSize.Value, rgAnalyzeTableSampleType.ItemIndex) ;
    if FOraEvent = oeDisableConstraints then FResult := TTable(FObj).DisableALLConstraints;
    if FOraEvent = oeEnableConstraints then FResult := TTable(FObj).EnableALLConstraints;
    if FOraEvent = oeDisableTriggers then FResult := TTable(FObj).DisableALLTriggers;
    if FOraEvent = oeEnableTriggers then FResult := TTable(FObj).EnableALLTriggers;
  end;

  if (FObj is TTableIndex) then
  begin
    if FOraEvent = oeAnalyze then FResult := TTableIndex(FObj).AnalyzeTable(TAnalyzeFunction(rgAnalyzeIndexFunction.ItemIndex), edtAnalyzeIndexSampleSize.Value, rgAnalyzeIndexSampleType.ItemIndex) ;
  end;

  if (FObj is TConstraint) then
  begin
    if FOraEvent = oeRename then FResult := TConstraint(FObj).RenameConstraint(edtNewConstraintName.Text);
  end;

  if (FObj is TView) then
  begin
    if FOraEvent = oeRename then FResult := TView(FObj).RenameView(edtRenameView.Text);
  end;

  if FResult then close;

end; //btnOKClick

procedure TTableEventsFrm.rgAnalyzeTableFunctionPropertiesEditValueChanged(
  Sender: TObject);
begin
  edtAnalyzeTableSampleSize.Enabled := rgAnalyzeTableFunction.ItemIndex = 1;
  rgAnalyzeTableSampleType.Enabled := rgAnalyzeTableFunction.ItemIndex = 1;
end;

procedure TTableEventsFrm.rgAnalyzeIndexFunctionPropertiesChange(
  Sender: TObject);
begin
  edtAnalyzeIndexSampleSize.Enabled := rgAnalyzeIndexFunction.ItemIndex = 1;
  rgAnalyzeIndexSampleType.Enabled := rgAnalyzeIndexFunction.ItemIndex = 1;
end;

end.
