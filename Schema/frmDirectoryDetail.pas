unit frmDirectoryDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxMaskEdit, cxButtonEdit, cxLabel,
  cxMemo, cxRichEdit, cxContainer, cxEdit, cxTextEdit, cxPC, cxControls,
  StdCtrls, cxButtons, ExtCtrls, OraDirectory, cxGroupBox;

type
  TDirectoryDetailFrm = class(TForm)
    pc: TcxPageControl;
    tsDirectory: TcxTabSheet;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    cxGroupBox1: TcxGroupBox;
    edtName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtPath: TcxButtonEdit;
    Bevel1: TBevel;
    cxGroupBox2: TcxGroupBox;
    btnExecute: TcxButton;
    btnCancel: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure btnExecuteClick(Sender: TObject);
  private
    { Private declarations }
    FDBDirectory: TDBDirectory;
    procedure GetDBDirectory;
    function SetDBDirectory: boolean;
  public
    { Public declarations }
    function Init(ADBDirectory: TDBDirectory): boolean;

  end;

var
  DirectoryDetailFrm: TDirectoryDetailFrm;

implementation

{$R *.dfm}

uses Util, frmSchemaBrowser, GenelDM, OraStorage, VisualOptions;

function TDirectoryDetailFrm.Init(ADBDirectory: TDBDirectory): boolean;
begin
  DirectoryDetailFrm := TDirectoryDetailFrm.Create(Application);
  Self := DirectoryDetailFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  FDBDirectory := TDBDirectory.Create;
  FDBDirectory := ADBDirectory;

  GetDBDirectory;
  pc.ActivePage := tsDirectory;
  ShowModal;
  result := ModalResult = mrOk;
  Free;
end;

procedure TDirectoryDetailFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TDirectoryDetailFrm.GetDBDirectory;
begin
  if FDBDirectory.DIRECTORY_NAME = '' then Caption := 'Create Database Directory '
     else Caption := 'Alter Database Directory '+FDBDirectory.DIRECTORY_NAME;
  edtName.Text := FDBDirectory.DIRECTORY_NAME;
  edtPath.Text := FDBDirectory.DIRECTORY_PATH;

  edtName.Enabled := FDBDirectory.DIRECTORY_NAME = '';
  
end; //GetDBDirectory;

function TDirectoryDetailFrm.SetDBDirectory: boolean;
begin
  result := true;
  if edtName.Text = '' then
  begin
    MessageDlg('Directory Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if edtPath.Text = '' then
  begin
    MessageDlg('Directory Path must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  with FDBDirectory do
  begin
    DIRECTORY_NAME := edtName.Text;
    DIRECTORY_PATH := edtPath.Text;
  end; //FDBDirectory

end; //SetDBDirectory


procedure TDirectoryDetailFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetDBDirectory then AllowChange := false
    else
    begin
      redtDDL.Text := FDBDirectory.GetDDL
    end;
    CodeColors(self, 'Default', redtDDL, false);
  end;

end;

procedure TDirectoryDetailFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetDBDirectory then exit;
  redtDDL.Text := FDBDirectory.GetDDL;
  if FDBDirectory.CreateDBDirectory(redtDDL.Text) then ModalResult := mrOK;

end;

end.
