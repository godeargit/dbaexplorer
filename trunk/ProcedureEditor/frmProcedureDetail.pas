unit frmProcedureDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OraProcSource, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ExtCtrls, cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxControls, cxContainer, cxEdit, cxGroupBox, GenelDM, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, OraStorage;

type
  TProcedureDetailFrm = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    cbObjectType: TcxComboBox;
    Label2: TLabel;
    edtObjectName: TcxTextEdit;
    Label3: TLabel;
    lcViewSchema: TcxLookupComboBox;
    cxGroupBox2: TcxGroupBox;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Init(ProcSource: TProcSource): TProcSource;
  end;

var
  ProcedureDetailFrm: TProcedureDetailFrm;

implementation

{$R *.dfm}

uses Util, VisualOptions;

function TProcedureDetailFrm.Init(ProcSource: TProcSource): TProcSource;
var
  FProcSource: TProcSource;
begin
  ProcedureDetailFrm := TProcedureDetailFrm.Create(Application);
  Self := ProcedureDetailFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  dmGenel.ReLoad(ProcSource.OraSession);
  lcViewSchema.Text := ProcSource.OWNER;

  if ProcSource.SOURCE_TYPE = stProcedure then
     cbObjectType.Text := 'Procedure';

  if ProcSource.SOURCE_TYPE = stPackage then
     cbObjectType.Text := 'Package';

  if ProcSource.SOURCE_TYPE = stFunction then
     cbObjectType.Text := 'Function';

  if ProcSource.SOURCE_TYPE = stType then
     cbObjectType.Text := 'Type';

  ShowModal;

  if ModalResult = mrOK then
  begin
    FProcSource := TProcSource.Create;
    FProcSource.OraSession := ProcSource.OraSession;
    FProcSource.OWNER := lcViewSchema.Text;
    FProcSource.SOURCE_NAME := edtObjectName.Text;

    if cbObjectType.Text = 'Procedure' then
       FProcSource.SOURCE_TYPE := stProcedure;

    if cbObjectType.Text = 'Package' then
       FProcSource.SOURCE_TYPE := stPackage;

    if cbObjectType.Text = 'Function' then
       FProcSource.SOURCE_TYPE := stFunction;

    if cbObjectType.Text = 'Type' then
       FProcSource.SOURCE_TYPE := stType;

    result := FProcSource;
  end else
  begin
    result := nil;
  end;
  Free;
end;


procedure TProcedureDetailFrm.btnOKClick(Sender: TObject);
begin
  if edtObjectName.Text = '' then
  begin
    MessageDlg('Object Name must be specified', mtWarning, [mbOk], 0);
    abort;
  end;
  ModalResult := mrOK;
end;

end.
