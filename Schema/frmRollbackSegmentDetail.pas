unit frmRollbackSegmentDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMemo, cxRichEdit, cxPC, cxControls, StdCtrls, cxButtons, ExtCtrls,
  cxSpinEdit, cxMaskEdit, cxButtonEdit, cxGroupBox, cxCheckBox, cxLabel,
  OraRollbackSegment, cxGraphics, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TRollbackSegmentDetailFrm = class(TForm)
    pc: TcxPageControl;
    tsRollbackSegment: TcxTabSheet;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    cxGroupBox1: TcxGroupBox;
    edtName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel8: TcxLabel;
    chkOnline: TcxCheckBox;
    chkPublic: TcxCheckBox;
    gbStorageClause: TcxGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label5: TLabel;
    edtInitialExtend: TcxButtonEdit;
    edtNextExtend: TcxButtonEdit;
    edtPctIncrease: TcxButtonEdit;
    edtMinExtents: TcxSpinEdit;
    edtMaxExtents: TcxSpinEdit;
    lcTablespace: TcxLookupComboBox;
    Bevel2: TBevel;
    cxGroupBox2: TcxGroupBox;
    btnCancel: TcxButton;
    btnExecute: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure btnExecuteClick(Sender: TObject);
  private
    { Private declarations }
    FRollbackSegment: TRollbackSegment;
    procedure GetRollbackSegmentDetail;
    function SetRollbackSegmentDetail: boolean;
  public
    { Public declarations }
    function Init(ARollbackSegment: TRollbackSegment): boolean;
  end;

var
  RollbackSegmentDetailFrm: TRollbackSegmentDetailFrm;

implementation

{$R *.dfm}

uses Util, frmSchemaBrowser, GenelDM, OraStorage, VisualOptions;

function TRollbackSegmentDetailFrm.Init(ARollbackSegment: TRollbackSegment): boolean;
begin
  RollbackSegmentDetailFrm := TRollbackSegmentDetailFrm.Create(Application);
  Self := RollbackSegmentDetailFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  FRollbackSegment := TRollbackSegment.Create;
  FRollbackSegment := ARollbackSegment;

  dmGenel.ReLoad(FRollbackSegment.OraSession);

  GetRollbackSegmentDetail;
  pc.ActivePage := tsRollbackSegment;
  ShowModal;
  result := ModalResult = mrOk;
  Free;
end;

procedure TRollbackSegmentDetailFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TRollbackSegmentDetailFrm.GetRollbackSegmentDetail;
begin
  if FRollbackSegment.Mode = InsertMode then Caption := 'Create Rollback Segment ' else Caption := 'Alter Rollback Segment '+FRollbackSegment.SEGMENT_NAME;

  with FRollbackSegment do
  begin
    edtName.Text := SEGMENT_NAME;
    lcTablespace.Text := TABLESPACE_NAME;
    chkOnline.Checked := STATUS = 'ONLINE';
    chkPublic.Checked  :=  OWNER = 'PUBLIC';
    edtInitialExtend.Text := FloatToStr(INITIAL_EXTENT);
    edtNextExtend.Text := FloatToStr(NEXT_EXTENT);
    edtMinExtents.Text := FloatToStr(MIN_EXTENTS);
    edtMaxExtents.Text := FloatToStr(MAX_EXTENTS);
  end;
  edtName.enabled := FRollbackSegment.Mode = InsertMode;
  lcTablespace.enabled := FRollbackSegment.Mode = InsertMode;
end; //GetRollbackSegmentDetail;

function TRollbackSegmentDetailFrm.SetRollbackSegmentDetail: boolean;
begin
  result := true;
  if edtName.Text = '' then
  begin
    MessageDlg('Rollback Segment Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  with FRollbackSegment do
  begin
    SEGMENT_NAME := edtName.Text;
    TABLESPACE_NAME := lcTablespace.Text;
    if chkOnline.Checked then
       STATUS := 'ONLINE'
    else
       STATUS := 'OFFLINE';   
    PUBLIC := chkPublic.Checked;

    INITIAL_EXTENT := StrToFloat(isNull(edtInitialExtend.Text));
    NEXT_EXTENT := StrToFloat(isNull(edtNextExtend.Text));
    MIN_EXTENTS := StrToFloat(isNull(edtMinExtents.Text));
    MAX_EXTENTS := StrToFloat(isNull(edtMaxExtents.Text));
  end; //RollbackSegment

end; //SetRollbackSegmentDetail


procedure TRollbackSegmentDetailFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetRollbackSegmentDetail then AllowChange := false
    else
    begin
      if FRollbackSegment.Mode = InsertMode then
         redtDDL.Text := FRollbackSegment.GetDDL
      else
         redtDDL.Text := FRollbackSegment.GetAlterDDL;
    end;
    CodeColors(self, 'Default', redtDDL, false);
  end;
end;

procedure TRollbackSegmentDetailFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetRollbackSegmentDetail then exit;
  if FRollbackSegment.Mode = InsertMode then
  begin
    redtDDL.Text := FRollbackSegment.GetDDL;
    if FRollbackSegment.CreateRollbackSegment(redtDDL.Text) then ModalResult := mrOK;
  end else
  begin
    redtDDL.Text := FRollbackSegment.GetAlterDDL;
    if FRollbackSegment.AlterRollbackSegment(redtDDL.Text) then ModalResult := mrOK;
  end;
end;

end.
