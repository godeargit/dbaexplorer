unit frmDataFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxMaskEdit, cxTextEdit,
  cxButtonEdit, cxCheckBox, cxLabel, ExtCtrls, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxGroupBox, OraTablespace;

type
  TDataFileFrm = class(TForm)
    cxGroupBox3: TcxGroupBox;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    cxGroupBox2: TcxGroupBox;
    Bevel1: TBevel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    chkReuse: TcxCheckBox;
    edtFileSize: TcxButtonEdit;
    edtFileName: TcxMaskEdit;
    cxGroupBox1: TcxGroupBox;
    cxLabel3: TcxLabel;
    edtNextSize: TcxButtonEdit;
    chkUnlimitedSize: TcxCheckBox;
    cxLabel4: TcxLabel;
    edtMaxSize: TcxButtonEdit;
    chkAutoExtend: TcxCheckBox;
    procedure chkAutoExtendPropertiesChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    DataFile: TDataFile;
    procedure GetDataFile;
  public
    { Public declarations }
    function Init(ADataFile: TDataFile): boolean;
  end;

var
  DataFileFrm: TDataFileFrm;

implementation

{$R *.dfm}

uses VisualOptions, GenelDM, Util;

function TDataFileFrm.Init(ADataFile: TDataFile): boolean;
begin
  DataFileFrm := TDataFileFrm.Create(Application);
  Self := DataFileFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  DataFile := ADataFile;
  GetDataFile;

  ShowModal;

  result := ModalResult = mrOK ;
  free;
end;

procedure TDataFileFrm.GetDataFile;
begin
  if DataFile^.NAME = '' then Caption := 'New Data File ' else Caption := 'Edit Data File';
  edtFileName.Text := DataFile^.NAME;
  edtFileSize.Text := FloatToStr(DataFile^.SIZE);
  chkReuse.Checked := DataFile^.REUSE;
  chkAutoExtend.Checked := DataFile^.AUTOEXTEND;
  edtNextSize.Text := FloatToStr(DataFile^.NEXT);
  edtMaxSize.Text := FloatToStr(DataFile^.MAX_SIZE);
  chkUnlimitedSize.Checked := DataFile^.MAX_UNLIMITED;
  chkAutoExtendPropertiesChange(nil);
end;                               

procedure TDataFileFrm.chkAutoExtendPropertiesChange(Sender: TObject);
begin
  edtNextSize.Enabled := chkAutoExtend.Checked;
  chkUnlimitedSize.Enabled := chkAutoExtend.Checked;
  edtMaxSize.Enabled := chkAutoExtend.Checked;
end;

procedure TDataFileFrm.btnOkClick(Sender: TObject);
begin
  if edtFileName.Text = '' then
  begin
    MessageDlg('Data File Name must be specified', mtWarning, [mbOk], 0);
    Abort;
  end;
  if edtFileSize.Text = '0' then
  begin
    MessageDlg('Initial size must be supplied.', mtWarning, [mbOk], 0);
    Abort;
  end;

  DataFile^.NAME := edtFileName.Text;
  DataFile^.SIZE := StrToFloat(isNull(edtFileSize.Text));
  DataFile^.UNITS := 'KB';
  DataFile^.REUSE := chkReuse.Checked;
  DataFile^.AUTOEXTEND := chkAutoExtend.Checked;
  DataFile^.NEXT := StrToFloat(isNull(edtNextSize.Text));
  DataFile^.NEXT_UNITS := 'KB';
  DataFile^.MAX_SIZE := StrToFloat(isNull(edtMaxSize.Text));
  DataFile^.MAX_UNITS := 'KB';
  DataFile^.MAX_UNLIMITED := chkUnlimitedSize.Checked;

  ModalResult := mrOK;
end;

procedure TDataFileFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

end.
