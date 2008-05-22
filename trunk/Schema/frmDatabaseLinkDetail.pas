unit frmDatabaseLinkDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxGraphics, cxMemo, cxRichEdit,
  cxCheckBox, cxLabel, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, jpeg, ExtCtrls, cxPC, cxControls, cxButtons,
  OraDBLink, cxGroupBox;

type
  TDatabaseLinkDetailFrm = class(TForm)
    pc: TcxPageControl;
    tsDBLink: TcxTabSheet;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtLinkName: TcxTextEdit;
    lcDBLinkSchema: TcxLookupComboBox;
    edtHostName: TcxTextEdit;
    cbCurrentUser: TcxCheckBox;
    edtUserName: TcxTextEdit;
    edtPassword: TcxTextEdit;
    cbPublic: TcxCheckBox;
    Bevel1: TBevel;
    cxGroupBox2: TcxGroupBox;
    btnCancel: TcxButton;
    btnExecute: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure cbCurrentUserPropertiesChange(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
  private
    { Private declarations }
    FDBLink: TDBLink;
    procedure GetDBLinkDetail;
    procedure SetProperties;
    function SetDBLinkDetail: boolean;
  public
    { Public declarations }
    function Init(ADBLink: TDBLink): boolean;
  end;

var
  DatabaseLinkDetailFrm: TDatabaseLinkDetailFrm;

implementation

{$R *.dfm}

uses Util, frmSchemaBrowser, GenelDM, OraStorage, VisualOptions;

function TDatabaseLinkDetailFrm.Init(ADBLink: TDBLink): boolean;
begin
  DatabaseLinkDetailFrm := TDatabaseLinkDetailFrm.Create(Application);
  Self := DatabaseLinkDetailFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  FDBLink := TDBLink.Create;
  FDBLink := ADBLink;

  dmGenel.ReLoad(FDBLink.OraSession);

  GetDBLinkDetail;
  SetProperties;
  pc.ActivePage := tsDBLink;
  ShowModal;
  result := ModalResult = mrOk;
  Free;
end;


procedure TDatabaseLinkDetailFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TDatabaseLinkDetailFrm.SetProperties;
begin
  edtUserName.Enabled := not cbCurrentUser.Checked;
  edtPassword.Enabled := not cbCurrentUser.Checked;
end; //SetProperties


procedure TDatabaseLinkDetailFrm.cbCurrentUserPropertiesChange(
  Sender: TObject);
begin
  SetProperties;
end;

procedure TDatabaseLinkDetailFrm.GetDBLinkDetail;
begin
  if FDBLink.Mode = InsertMode then Caption := 'Create Database Link ' else Caption := 'Alter Database Link '+FDBLink.DB_LINK;
  edtLinkName.Text := FDBLink.DB_LINK;
  lcDBLinkSchema.Text := FDBLink.OWNER;
  edtHostName.Text := FDBLink.HOST;
  edtUserName.Text := FDBLink.USER_NAME;
  edtPassword.Text := FDBLink.PASSWORD;

  edtLinkName.Enabled := FDBLink.Mode = InsertMode;
end; //GetDBLinkDetail;

function TDatabaseLinkDetailFrm.SetDBLinkDetail: boolean;
begin
  result := true;
  if edtLinkName.Text = '' then
  begin
    MessageDlg('DB Link Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if edtHostName.Text = '' then
  begin
    MessageDlg('Host Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  with FDBLink do
  begin
    FDBLink.DB_LINK := edtLinkName.Text;
    FDBLink.OWNER := lcDBLinkSchema.Text;
    FDBLink.HOST := edtHostName.Text;

    if not cbCurrentUser.Checked then
    begin
      FDBLink.USER_NAME := edtUserName.Text;
      FDBLink.PASSWORD := edtPassword.Text;
    end else
    begin
      FDBLink.USER_NAME := '';
      FDBLink.PASSWORD := '';
    end;

    FDBLink.PUBLIC_LINK := cbPublic.Checked;
//    FDBLink.CURRENT_SESSION := cbCurrentUser.Checked;
  end; //FDBLink
end; //SetDBLinkDetail

procedure TDatabaseLinkDetailFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetDBLinkDetail then AllowChange := false
    else
    begin
      if FDBLink.Mode = InsertMode then
         redtDDL.Text := FDBLink.GetDDL
      else
         redtDDL.Text := FDBLink.GetAlterDDL;
    end;
    CodeColors(self, 'Default', redtDDL, false);
  end;
end;

procedure TDatabaseLinkDetailFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetDBLinkDetail then exit;
  if FDBLink.Mode = InsertMode then
  begin
    redtDDL.Text := FDBLink.GetDDL;
    if FDBLink.CreateDBLink(redtDDL.Text) then ModalResult := mrOK;
  end else
  begin
    redtDDL.Text := FDBLink.GetAlterDDL;
    if FDBLink.AlterDBLink(redtDDL.Text) then ModalResult := mrOK;
  end;
end;


end.
