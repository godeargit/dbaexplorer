unit frmSequenceDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxGraphics, cxMemo, cxRichEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxContainer, cxEdit, cxTextEdit, StdCtrls, jpeg,
  ExtCtrls, cxPC, cxControls, cxButtons, cxCheckBox, cxLabel,
  oraSequence, cxGroupBox;

type
  TSequenceDetailFrm = class(TForm)
    pc: TcxPageControl;
    tsSequence: TcxTabSheet;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtSequenceName: TcxTextEdit;
    lcSequenceSchema: TcxLookupComboBox;
    edtStartWith: TcxMaskEdit;
    cxLabel3: TcxLabel;
    edtMinValue: TcxMaskEdit;
    cxLabel1: TcxLabel;
    edtMaxValue: TcxMaskEdit;
    cxLabel2: TcxLabel;
    edtIcrementBy: TcxMaskEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    edtCache: TcxMaskEdit;
    cxLabel6: TcxLabel;
    cbCycle: TcxCheckBox;
    cxLabel7: TcxLabel;
    cbOrder: TcxCheckBox;
    Bevel2: TBevel;
    cxGroupBox2: TcxGroupBox;
    btnExecute: TcxButton;
    btnCancel: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure btnExecuteClick(Sender: TObject);
  private
    { Private declarations }
    FSequence: TSequence;
    FIsCreated: boolean;
    FResult : boolean;
    procedure GetSequenceDetail;
    procedure SetProperties;
    function SetSequenceDetail: boolean;

  public
    { Public declarations }
    function Init(ASequence: TSequence): boolean;
  end;

var
  SequenceDetailFrm: TSequenceDetailFrm;

implementation

{$R *.dfm}

uses Util, frmSchemaBrowser, GenelDM, VisualOptions;

function TSequenceDetailFrm.Init(ASequence: TSequence): boolean;
begin
  SequenceDetailFrm := TSequenceDetailFrm.Create(Application);
  Self := SequenceDetailFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  FResult := false;

  FSequence := TSequence.Create;
  FSequence := ASequence;

  FIsCreated := FSequence.SEQUENCE_NAME = '';

  dmGenel.ReLoad(FSequence.OraSession);

  GetSequenceDetail;
  SetProperties;
  pc.ActivePage := tsSequence;
  ShowModal;
  result := FResult;
  Free;
end;

procedure TSequenceDetailFrm.btnCancelClick(Sender: TObject);
begin
  FResult := false; 
  close;
end;

procedure TSequenceDetailFrm.SetProperties;
begin
  edtSequenceName.Enabled := FIsCreated;
  lcSequenceSchema.Enabled := FIsCreated;
  edtStartWith.Enabled := FIsCreated;
end; //SetProperties

procedure TSequenceDetailFrm.GetSequenceDetail;
begin
  if FIsCreated then Caption := 'Create Sequence ' else Caption := 'Alter Sequence '+FSequence.SEQUENCE_NAME;

  lcSequenceSchema.Text := FSequence.OWNER;
  edtSequenceName.Text := FSequence.SEQUENCE_NAME;

  if FIsCreated then exit;

  edtStartWith.Text := FSequence.START_WITH;
  edtMinValue.Text := FSequence.MIN_VALUE;
  edtMaxValue.Text := FSequence.MAX_VALUE;
  edtIcrementBy.Text := FSequence.INCREMENT_BY;
  cbCycle.Checked := FSequence.CYCLE_FLAG;
  edtCache.Text := FSequence.CACHE_SIZE;
  cbOrder.Checked := FSequence.ORDER_FLAG;
end; //GetSequenceDetail;

function TSequenceDetailFrm.SetSequenceDetail: boolean;
begin
  result := true;
  if edtSequenceName.Text = '' then
  begin
    MessageDlg('Sequence Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if lcSequenceSchema.Text = '' then
  begin
    MessageDlg('Schema Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  with FSequence do
  begin
    SEQUENCE_NAME := edtSequenceName.Text;
    OWNER := lcSequenceSchema.Text;
    START_WITH := edtStartWith.Text;
    MIN_VALUE := edtMinValue.Text;
    MAX_VALUE := edtMaxValue.Text;
    INCREMENT_BY := edtIcrementBy.Text;
    CYCLE_FLAG :=  cbCycle.Checked;
    CACHE_SIZE := edtCache.Text;
    ORDER_FLAG := cbOrder.Checked;
  end; //FView

end; //SetSequenceDetail


procedure TSequenceDetailFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetSequenceDetail then AllowChange := false
    else
    begin
      if FIsCreated then
         redtDDL.Text := FSequence.GetDDL
      else
         redtDDL.Text := FSequence.GetAlterDDL;
    end;
    CodeColors(self, 'Default', redtDDL, false);   
  end;
end;

procedure TSequenceDetailFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetSequenceDetail then exit;
  if FIsCreated then
  begin
    redtDDL.Text := FSequence.GetDDL;
    if FSequence.CreateSequence(redtDDL.Text) then close;
  end else
  begin
    redtDDL.Text := FSequence.GetAlterDDL;
    if FSequence.AlterSequence(redtDDL.Text) then close;
  end;
  FResult := true; 
end;

end.
