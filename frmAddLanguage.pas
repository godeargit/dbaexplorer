unit frmAddLanguage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls, cxContainer, cxEdit,
  cxLabel;

type
  TAddLanguageFrm = class(TForm)
    Panel2: TPanel;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    Panel1: TPanel;
    imgToolBar: TImage;
    lblObjectName: TcxLabel;
    Shape1: TShape;
    lblAction: TLabel;
    Label1: TLabel;
    bedtLanguageFile: TcxButtonEdit;
    edtLanguageName: TcxTextEdit;
    OpenDialog: TOpenDialog;
    procedure btnCancelClick(Sender: TObject);
    procedure bedtLanguageFilePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Init(): string;
  end;

var
  AddLanguageFrm: TAddLanguageFrm;

implementation

uses GenelDM, VisualOptions;

{$R *.dfm}

function TAddLanguageFrm.Init(): string;
begin
  AddLanguageFrm := TAddLanguageFrm.Create(Application);
  Self := AddLanguageFrm;

  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  result := '';

  ShowModal;

  result := edtLanguageName.Text+'='+bedtLanguageFile.Text;
  Free;
end;

procedure TAddLanguageFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TAddLanguageFrm.bedtLanguageFilePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if OpenDialog.Execute then
     bedtLanguageFile.Text := OpenDialog.FileName;
end;

procedure TAddLanguageFrm.btnOKClick(Sender: TObject);
begin
  if edtLanguageName.Text = '' then
  begin
    MessageDlg('Language Name must be specified', mtWarning, [mbOk], 0);
    exit;
  end;
  close;
end;

end.
