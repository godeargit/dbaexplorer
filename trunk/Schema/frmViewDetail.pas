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
unit frmViewDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxGraphics, jpeg, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxContainer, cxEdit, cxTextEdit,
  cxPC, cxControls, cxMemo, cxRichEdit, cxLabel, cxCheckBox, cxGroupBox,
  cxRadioGroup, oraView;

type
  TViewDetailFrm = class(TForm)
    pc: TcxPageControl;
    tsView: TcxTabSheet;
    tsDetail: TcxTabSheet;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    lcViewSchema: TcxLookupComboBox;
    edtSQLQuery: TcxRichEdit;
    cxLabel3: TcxLabel;
    Bevel1: TBevel;
    cxGroupBox2: TcxGroupBox;
    btnCancel: TcxButton;
    btnExecute: TcxButton;
    cxGroupBox3: TcxGroupBox;
    rgroupWith: TcxRadioGroup;
    cbRestrictQuery: TcxCheckBox;
    edtCheckOption: TcxTextEdit;
    cxLabel1: TcxLabel;
    cbForceOnCreate: TcxCheckBox;
    cxLabel2: TcxLabel;
    edtComment: TcxRichEdit;
    Bevel2: TBevel;
    edtViewName: TcxMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbRestrictQueryPropertiesChange(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure btnExecuteClick(Sender: TObject);
  private
    { Private declarations }
    FView: TView;
    procedure GetViewDetail;
    procedure SetProperties;
    function SetViewDetail: boolean;

  public
    { Public declarations }
    function Init(AView: TView): boolean;
  end;

var
  ViewDetailFrm: TViewDetailFrm;

implementation

{$R *.dfm}

uses Util, frmTableIndexPartition, frmSchemaBrowser, GenelDM, VisualOptions;

function TViewDetailFrm.Init(AView: TView): boolean;
begin
  ViewDetailFrm := TViewDetailFrm.Create(Application);
  Self := ViewDetailFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  FView := TView.Create;
  FView := AView;

  dmGenel.ReLoad(FView.OraSession);

  GetViewDetail;
  SetProperties;
  pc.ActivePage := tsView;
  ShowModal;
  
  result := ModalResult = mrOk;
  Free;
end;

procedure TViewDetailFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//
end;

procedure TViewDetailFrm.SetProperties;
begin
  cbRestrictQuery.Checked := (FView.READ_ONLY) or (FView.CHECK_OPTION);
  rgroupWith.Enabled := cbRestrictQuery.Checked;
  edtViewName.Enabled := FView.VIEW_NAME = '';
  lcViewSchema.Enabled := FView.VIEW_NAME = '';
end; //SetProperties

procedure TViewDetailFrm.GetViewDetail;
begin
  if FView.VIEW_NAME = '' then Caption := 'Create View' else Caption := 'Alter View '+FView.VIEW_NAME;

  lcViewSchema.Text := FView.OWNER;
  edtViewName.Text := FView.VIEW_NAME;

  if FView.VIEW_NAME= '' then exit;
  
  edtSQLQuery.Text := FView.TEXT;
  if FView.READ_ONLY then
     rgroupWith.ItemIndex := 0;
  if FView.CHECK_OPTION then
     rgroupWith.ItemIndex := 1;

  edtCheckOption.Text := FView.CHECK_CONSTRAINT;
  edtComment.Text := FView.VIEW_COMMENT;
end; //GetViewDetail;

procedure TViewDetailFrm.cbRestrictQueryPropertiesChange(Sender: TObject);
begin
  rgroupWith.Enabled := cbRestrictQuery.Checked;
end;

function TViewDetailFrm.SetViewDetail: boolean;
begin
  result := true;
  if edtViewName.Text = '' then
  begin
    MessageDlg('View Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if lcViewSchema.Text = '' then
  begin
    MessageDlg('Schema Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if edtSQLQuery.Text = '' then
  begin
    MessageDlg('SQL Query must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  with FView do
  begin
    OWNER := lcViewSchema.Text;
    VIEW_NAME := edtViewName.Text;
    TEXT := edtSQLQuery.Text;
    CHECK_CONSTRAINT := edtCheckOption.Text;;
    VIEW_COMMENT := edtComment.Text;
    READ_ONLY := (rgroupWith.ItemIndex = 0) and (cbRestrictQuery.Checked);
    CHECK_OPTION := (rgroupWith.ItemIndex = 1) and (cbRestrictQuery.Checked);
    FORCE_ON_CREATE := cbForceOnCreate.Checked;
    ColumnLists.ClearColumnList;
  end; //FView

end; //SetViewDetail


procedure TViewDetailFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetViewDetail then AllowChange := false
       else redtDDL.Text := FView.GetDDL;
    CodeColors(self, 'Default', redtDDL, false);   
  end;
end;

procedure TViewDetailFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetViewDetail then exit;
  redtDDL.Text := FView.GetDDL;
  if FView.CreateView(redtDDL.Text) then ModalResult := mrOK;
end;

end.
