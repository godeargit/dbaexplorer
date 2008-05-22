unit frmMaterializedViewDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxGraphics, cxCheckBox,
  cxGroupBox, cxRadioGroup, cxLabel, cxMemo, cxRichEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxContainer, cxEdit, cxTextEdit, StdCtrls, jpeg, ExtCtrls, cxPC,
  cxControls, cxButtons, cxSpinEdit, cxCalendar, cxTimeEdit,
  cxImageComboBox, OraMaterializedView, GenelDM;

type
  TMaterializedViewDetailFrm = class(TForm)
    pc: TcxPageControl;
    tsView: TcxTabSheet;
    tsProperties: TcxTabSheet;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cboxMethod: TcxComboBox;
    cbWhen: TcxComboBox;
    tedtOnThisTime: TcxTimeEdit;
    dedtOnThisDate: TcxDateEdit;
    cxLabel7: TcxLabel;
    cbType: TcxComboBox;
    tsStorage: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    cxLabel17: TcxLabel;
    cbBuiltType: TcxComboBox;
    chkParalel: TcxCheckBox;
    edtParalelDegree: TcxMaskEdit;
    chkAllowUpdates: TcxCheckBox;
    chkPrebuiltOption: TcxCheckBox;
    chkEnableRowMovement: TcxCheckBox;
    chkEnableQueryRewrite: TcxCheckBox;
    cboxPrebuiltOption: TcxComboBox;
    cxGroupBox3: TcxGroupBox;
    chkUsingIndex: TcxCheckBox;
    cxLabel4: TcxLabel;
    chkStartOn: TcxCheckBox;
    chkNext: TcxCheckBox;
    tedtOnNextTime: TcxTimeEdit;
    dedtOnNextDate: TcxDateEdit;
    chkCompress: TcxCheckBox;
    chkUseRollbackSegment: TcxCheckBox;
    cxGroupBox4: TcxGroupBox;
    rgLocation: TcxRadioGroup;
    cxLabel5: TcxLabel;
    edtRollbackSegmentName: TcxTextEdit;
    lcbUsingIndex: TcxLookupComboBox;
    cxGroupBox5: TcxGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtViewName: TcxTextEdit;
    lcViewSchema: TcxLookupComboBox;
    edtSQLQuery: TcxRichEdit;
    cxLabel3: TcxLabel;
    btnTestSQL: TcxButton;
    Bevel1: TBevel;
    cxGroupBox6: TcxGroupBox;
    gbStorageClause: TcxGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtInitialExtend: TcxMaskEdit;
    edtNextExtend: TcxMaskEdit;
    edtMinExtents: TcxMaskEdit;
    edtMaxExtents: TcxMaskEdit;
    edtPctIncrease: TcxMaskEdit;
    edtFreeList: TcxMaskEdit;
    edtFreeGroup: TcxMaskEdit;
    cbBufferPool: TcxImageComboBox;
    gbStorage: TcxGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    edtPercentFree: TcxMaskEdit;
    edtPercentUsed: TcxMaskEdit;
    edtInitialTrans: TcxMaskEdit;
    edtMaxTrans: TcxMaskEdit;
    lcTablespace: TcxLookupComboBox;
    rgCache: TcxRadioGroup;
    rgLogging: TcxRadioGroup;
    cxGroupBox7: TcxGroupBox;
    btnExecute: TcxButton;
    btnCancel: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure btnExecuteClick(Sender: TObject);
    procedure btnTestSQLClick(Sender: TObject);
    procedure cboxPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FMaterializedView: TMaterializedView;
    procedure SetProperties;
    function SetViewDetail: boolean;
  public
    { Public declarations }
    function Init(AMaterializedView : TMaterializedView): boolean;
  end;

var
  MaterializedViewDetailFrm: TMaterializedViewDetailFrm;

implementation

uses Util, frmSchemaBrowser, oraStorage, VisualOptions;

{$R *.dfm}

function TMaterializedViewDetailFrm.Init(AMaterializedView : TMaterializedView): boolean;
begin
  MaterializedViewDetailFrm := TMaterializedViewDetailFrm.Create(Application);
  Self := MaterializedViewDetailFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  
  FMaterializedView := TMaterializedView.Create;
  FMaterializedView := AMaterializedView;

  dmGenel.ReLoad(FMaterializedView.OraSession);

  lcViewSchema.Text := FMaterializedView.OWNER;
  SetProperties;
  pc.ActivePage := tsView;
  ShowModal;
  result := ModalResult = mrOk;
  Free;
end;

procedure TMaterializedViewDetailFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TMaterializedViewDetailFrm.SetProperties;
begin

  gbStorage.Enabled := not chkPrebuiltOption.Checked;
  gbStorageClause.Enabled := not chkPrebuiltOption.Checked;
  rgCache.Enabled := not chkPrebuiltOption.Checked;
  rgLogging.Enabled := not chkPrebuiltOption.Checked;

  cbWhen.Enabled := cboxMethod.ItemIndex <> 3;
  chkStartOn.Enabled := cboxMethod.ItemIndex <> 3;
  tedtOnThisTime.Enabled := (cboxMethod.ItemIndex <> 3) and (chkStartOn.Checked);
  dedtOnThisDate.Enabled := (cboxMethod.ItemIndex <> 3) and (chkStartOn.Checked);
  chkNext.Enabled := cboxMethod.ItemIndex <> 3;
  tedtOnNextTime.Enabled := (cboxMethod.ItemIndex <> 3) and (chkNext.Checked);
  dedtOnNextDate.Enabled := (cboxMethod.ItemIndex <> 3) and (chkNext.Checked);
  cbType.Enabled := cboxMethod.ItemIndex <> 3;
  chkUseRollbackSegment.Enabled := cboxMethod.ItemIndex <> 3;
  rgLocation.Enabled := cboxMethod.ItemIndex <> 3;
  cboxPrebuiltOption.Enabled := chkPrebuiltOption.Checked;
  lcbUsingIndex.Enabled := chkUsingIndex.Checked;
  edtRollbackSegmentName.Enabled := (not chkUseRollbackSegment.Checked) and (cboxMethod.ItemIndex <> 3); 
  edtParalelDegree.Enabled := chkParalel.Checked;
end;

procedure TMaterializedViewDetailFrm.cboxPropertiesChange(
  Sender: TObject);
begin
  SetProperties;
end;

function TMaterializedViewDetailFrm.SetViewDetail: boolean;
begin
  result := true;
  if edtViewName.Text = '' then
  begin
    MessageDlg('MaterializedView Name must be specified', mtWarning, [mbOk], 0);
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

  with FMaterializedView do
  begin
    OWNER := lcViewSchema.Text;
    NAME := edtViewName.Text;
    SQL_QUERY := edtSQLQuery.Text;
    MODE := TMVRefreshMode(cboxMethod.ItemIndex);
    WHEN := TMVWhenMethods(cbWhen.ItemIndex);
    START_TIME := '';
    START_DATE := '';
    if chkStartOn.Checked then
    begin
      START_TIME := tedtOnThisTime.Text;
      START_DATE := dedtOnThisDate.Text;
    end;
    NEXT_TIME := '';
    NEXT_DATE := '';
    if chkNext.Checked then
    begin
      NEXT_TIME := tedtOnNextTime.Text;
      NEXT_DATE := dedtOnNextDate.Text;
    end;
    REFRESH_TYPE := TMVRefreshType(cbType.ItemIndex);
    if chkParalel.Checked then
       PARALLEL := edtParalelDegree.Text
    else
       PARALLEL := '0';

    ALLOW_UPDATES := chkAllowUpdates.Checked;
    if chkPrebuiltOption.Checked then
       PREBUILT_OPTION := cboxPrebuiltOption.Text
    else
       PREBUILT_OPTION := '';

    ENABLE_ROW_MOVEMENT := chkEnableRowMovement.Checked;
    ENABLE_QUERY_REWRITE := chkEnableQueryRewrite.Checked;
    COMPRESS := chkCompress.Checked;
    BUILT_TYPE := TMVBuiltType(cbBuiltType.ItemIndex);
    if chkUsingIndex.Checked then
       INDEX_TABLESPACE := lcbUsingIndex.Text
    else
       INDEX_TABLESPACE := '';

    USE_DEFAULT_ROLLBACK_SEGMENT := chkUseRollbackSegment.Checked;
    ROLLBACK_SEGMENT_LOCATION := TMVSegmentLocation(rgLocation.ItemIndex);

    if chkUseRollbackSegment.Checked then
       ROLLBACK_SEGMENT_NAME := ''
    else
       ROLLBACK_SEGMENT_NAME := edtRollbackSegmentName.Text;      

    CACHE := rgCache.ItemIndex = 0;
    LOGGING := TLoggingType(rgLogging.ItemIndex);
    with PhsicalAttributes do
    begin
      PercentFree:=  edtPercentFree.Text;
      PercentUsed:=  edtPercentUsed.Text;
      InitialTrans:= edtInitialTrans.Text;
      MaxTrans:=     edtMaxTrans.Text;
      Tablespace:=   lcTablespace.Text;
      InitialExtent:=edtInitialExtend.Text;
      NextExtent:=   edtNextExtend.Text;
      MinExtent:=    edtMinExtents.Text;
      MaxExtent:=    edtMaxExtents.Text;
      PctIncrease:=  edtPctIncrease.Text;
      BufferPool:=   TBufferPool(cbBufferPool.ItemIndex);
      FreeLists:=    edtFreeList.Text;
      FreeGroups:=   edtFreeGroup.Text;
    end;
  end; //with

end;

  
procedure TMaterializedViewDetailFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetViewDetail then AllowChange := false
       else redtDDL.Text := FMaterializedView.GetDDL;
    CodeColors(self, 'Default', redtDDL, false);
  end;
end;

procedure TMaterializedViewDetailFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetViewDetail then exit;
  redtDDL.Text := FMaterializedView.GetDDL;
  if FMaterializedView.CreateView(redtDDL.Text) then  ModalResult := mrOK;
end;

procedure TMaterializedViewDetailFrm.btnTestSQLClick(Sender: TObject);
begin
  if edtSQLQuery.Text = '' then
  begin
    MessageDlg('Enter a query first.', mtWarning, [mbOk], 0);
    exit;
  end;
  if not ExpectResultSet(edtSQLQuery.Text) then
  begin
    MessageDlg('Syntax error in query.', mtWarning, [mbOk], 0);
    exit;
  end;
  FMaterializedView.ValidateQuery(edtSQLQuery.Text);
end;








end.
