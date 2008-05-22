unit frmVisualOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, ComCtrls, cxTreeView, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, StdCtrls, cxButtons, cxGraphics,
  cxCheckBox, dxBar, cxTextEdit, cxMaskEdit, cxDropDownEdit, dxStatusBar,
  cxListView, cxMemo, cxGroupBox, cxCheckGroup, cxRadioGroup, cxPC,
  cxSplitter, dxNavBarCollns, cxClasses, dxNavBarBase, dxNavBar, ImgList,
  GenelDM, cxLookAndFeels, cxListBox;

type
  TVisualOptionsFrm = class(TForm)
    Panel2: TPanel;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    barManager: TdxBarManager;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    comboTemplate: TcxComboBox;
    treeList: TcxTreeView;
    Panel1: TPanel;
    pc: TcxPageControl;
    tsBars: TcxTabSheet;
    cxLabel1: TcxLabel;
    comboBarStyle: TcxComboBox;
    cxLabel2: TcxLabel;
    comboBarMenuAnim: TcxComboBox;
    cbBarSunkenBorder: TcxCheckBox;
    cbBarUseF10forMenu: TcxCheckBox;
    cbBarFlatCloseButton: TcxCheckBox;
    tsTrees: TcxTabSheet;
    cxLabel3: TcxLabel;
    comboTreeLook: TcxComboBox;
    cbTreeHide: TcxCheckBox;
    cxLabel4: TcxLabel;
    comboTreeBorder: TcxComboBox;
    tsEdit: TcxTabSheet;
    comboEditBorder: TcxComboBox;
    cxLabel5: TcxLabel;
    comboEditButton: TcxComboBox;
    cxLabel6: TcxLabel;
    cbEditHotTrack: TcxCheckBox;
    cbEditNative: TcxCheckBox;
    tsCheck: TcxTabSheet;
    cxLabel7: TcxLabel;
    comboCheckBorder: TcxComboBox;
    cbCheckHot: TcxCheckBox;
    cbCheckNative: TcxCheckBox;
    tsButtons: TcxTabSheet;
    cxLabel8: TcxLabel;
    comboButtonBorder: TcxComboBox;
    cbButtonNative: TcxCheckBox;
    tsPagecontrol: TcxTabSheet;
    cxLabel9: TcxLabel;
    comboPageBorder: TcxComboBox;
    cbPageHot: TcxCheckBox;
    cbPageNative: TcxCheckBox;
    cxLabel14: TcxLabel;
    comboPageTab: TcxComboBox;
    tsGroupBox: TcxTabSheet;
    cbGroupNative: TcxCheckBox;
    comboGroupBorder: TcxComboBox;
    cxLabel10: TcxLabel;
    cbGroupShadow: TcxCheckBox;
    cxLabel13: TcxLabel;
    comboGroupLook: TcxComboBox;
    tsSipletters: TcxTabSheet;
    cxLabel11: TcxLabel;
    comboSipletterHot: TcxComboBox;
    tsNavigatonBar: TcxTabSheet;
    cxLabel12: TcxLabel;
    comboNavigatonStyle: TcxComboBox;
    Panel3: TPanel;
    imgToolBar: TImage;
    lblObjectName: TcxLabel;
    imgObject: TImage;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    comboCheckLook: TcxComboBox;
    cxLabel15: TcxLabel;
    cbButtonNativeStyle: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    Panel13: TPanel;
    cxListBox1: TcxListBox;
    spExam: TcxSplitter;
    cxListBox2: TcxListBox;
    cxGroupBox2: TcxGroupBox;
    gbGroupExam: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    pcPageExam: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxGroupBox4: TcxGroupBox;
    btnButtonExam: TcxButton;
    cxGroupBox5: TcxGroupBox;
    cbCheckExam: TcxCheckBox;
    rgCheckRadioGroupExam2: TcxRadioGroup;
    rgCheckRadioGroupExam: TcxRadioGroup;
    cxGroupBox6: TcxGroupBox;
    edtEditExam: TcxTextEdit;
    comboEditExam: TcxComboBox;
    memEditExam: TcxMemo;
    cxGroupBox7: TcxGroupBox;
    tvTreeExam: TcxTreeView;
    lvTreeExam: TcxListView;
    cxGroupBox8: TcxGroupBox;
    Panel6: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    dxStatusBar1: TdxStatusBar;
    cxGroupBox9: TcxGroupBox;
    navBarNavigatonExam: TdxNavBar;
    navBarNavigatonExamGroup1: TdxNavBarGroup;
    navBarNavigatonExamGroup2: TdxNavBarGroup;
    navBarNavigatonExamItem1: TdxNavBarItem;
    navBarNavigatonExamItem2: TdxNavBarItem;
    navBarNavigatonExamItem3: TdxNavBarItem;
    procedure treeListChange(Sender: TObject; Node: TTreeNode);
    procedure btnCancelClick(Sender: TObject);
    procedure StyleBarChange(Sender: TObject);
    procedure StyleTreeListChange(Sender: TObject);
    procedure StyleEditChange(Sender: TObject);
    procedure StyleCheckChange(Sender: TObject);
    procedure comboButtonBorderPropertiesChange(Sender: TObject);
    procedure StylePageChange(Sender: TObject);
    procedure StyleGroupBoxChange(Sender: TObject);
    procedure comboSipletterHotPropertiesChange(Sender: TObject);
    procedure comboNavigatonStylePropertiesChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure comboTemplatePropertiesChange(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure Init();
  end;

var
  VisualOptionsFrm: TVisualOptionsFrm;

implementation

uses VisualOptions;

{$R *.dfm}

procedure TVisualOptionsFrm.Init();
begin
  VisualOptionsFrm := TVisualOptionsFrm.Create(Application);
  Self := VisualOptionsFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  
  comboTemplate.Properties.Items := ReadAllVisualOptions;
  comboTemplate.Text := DefaultGUITemplate;

  pc.ActivePageIndex := 0;
  treeListChange(nil, treeList.Items[0]);

  ShowModal;

  free;
end;

procedure TVisualOptionsFrm.treeListChange(Sender: TObject;
  Node: TTreeNode);
begin
  pc.ActivePageIndex := Node.Index;
  lblObjectName.Caption := Node.Text;
  imgObject.Picture := nil;
  dmGenel.ilVisualOptions.GetBitmap(pc.ActivePageIndex,imgObject.Picture.Bitmap);
  imgObject.Repaint;
  imgObject.Refresh;
end;

procedure TVisualOptionsFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

{*********************** Bars And Menus ***************************************}

procedure TVisualOptionsFrm.styleBarChange(Sender: TObject);
begin
  if comboBarStyle.Text = 'Enhanced' then barManager.Style := bmsEnhanced
  else if comboBarStyle.Text = 'Flat' then barManager.Style := bmsFlat
  else if comboBarStyle.Text = 'Office11' then barManager.Style := bmsOffice11
  else if comboBarStyle.Text = 'Standard' then barManager.Style := bmsStandard
  else if comboBarStyle.Text = 'UseLookAndFeel' then barManager.Style := bmsUseLookAndFeel
  else barManager.Style := bmsXP;

  //----------------------------------------------------------//
  if comboBarMenuAnim.Text = 'None' then barManager.MenuAnimations := maNone
  else if comboBarMenuAnim.Text = 'Random' then barManager.MenuAnimations := maRandom
  else if comboBarMenuAnim.Text = 'Unfold' then barManager.MenuAnimations := maUnfold
  else if comboBarMenuAnim.Text = 'Slide' then barManager.MenuAnimations := maSlide
  else barManager.MenuAnimations := maFade;

  barManager.SunkenBorder := cbBarSunkenBorder.Checked;
  barManager.FlatCloseButton := cbBarFlatCloseButton.Checked;
  barManager.UseF10ForMenu := cbBarUseF10forMenu.Checked;
end; //styleBarChange

{*********************** Trees And List ***************************************}

procedure TVisualOptionsFrm.StyleTreeListChange(Sender: TObject);
begin
  if comboTreeBorder.Text = '3D' then tvTreeExam.Style.BorderStyle := cbs3D
  else if comboTreeBorder.Text = 'Flat' then tvTreeExam.Style.BorderStyle := cbsFlat
  else if comboTreeBorder.Text = 'None' then tvTreeExam.Style.BorderStyle := cbsNone
  else if comboTreeBorder.Text = 'Office11' then tvTreeExam.Style.BorderStyle := cbsOffice11
  else if comboTreeBorder.Text = 'Single' then tvTreeExam.Style.BorderStyle := cbsSingle
  else if comboTreeBorder.Text = 'Thick' then tvTreeExam.Style.BorderStyle := cbsThick
  else tvTreeExam.Style.BorderStyle := cbsUltraFlat;

  lvTreeExam.Style.BorderStyle := tvTreeExam.Style.BorderStyle;

  //----------------------------------------------------------//
  if comboTreeLook.Text = 'Flat' then tvTreeExam.Style.LookAndFeel.Kind := lfFlat
  else if comboTreeLook.Text = 'Office11' then tvTreeExam.Style.LookAndFeel.Kind := lfOffice11
  else if comboTreeLook.Text = 'Standard' then tvTreeExam.Style.LookAndFeel.Kind := lfStandard
  else tvTreeExam.Style.LookAndFeel.Kind := lfUltraFlat;

  lvTreeExam.Style.LookAndFeel.Kind := tvTreeExam.Style.LookAndFeel.Kind;

  tvTreeExam.HideSelection := cbTreeHide.Checked;
  lvTreeExam.HideSelection := cbTreeHide.Checked;
end;

{************************ Edit Control ****************************************}

procedure TVisualOptionsFrm.StyleEditChange(Sender: TObject);
begin
  if comboEditBorder.Text = '3D' then edtEditExam.Style.BorderStyle := ebs3D
  else if comboEditBorder.Text = 'Flat' then edtEditExam.Style.BorderStyle := ebsFlat
  else if comboEditBorder.Text = 'None' then edtEditExam.Style.BorderStyle := ebsNone
  else if comboEditBorder.Text = 'Office11' then edtEditExam.Style.BorderStyle := ebsOffice11
  else if comboEditBorder.Text = 'Single' then edtEditExam.Style.BorderStyle := ebsSingle
  else if comboEditBorder.Text = 'Thick' then edtEditExam.Style.BorderStyle := ebsThick
  else edtEditExam.Style.BorderStyle := ebsUltraFlat;

  comboEditExam.Style.BorderStyle := edtEditExam.Style.BorderStyle;
  memEditExam.Style.BorderStyle := edtEditExam.Style.BorderStyle;

  //----------------------------------------------------------//
  if comboEditButton.Text = '3D' then comboEditExam.Style.ButtonStyle := bts3D
  else if comboEditButton.Text = 'Default' then comboEditExam.Style.ButtonStyle := btsDefault
  else if comboEditButton.Text = 'Flat' then comboEditExam.Style.ButtonStyle := btsFlat
  else if comboEditButton.Text = 'HotFlat' then comboEditExam.Style.ButtonStyle := btsHotFlat
  else if comboEditButton.Text = 'Office11' then comboEditExam.Style.ButtonStyle := btsOffice11
  else if comboEditButton.Text = 'Simple' then comboEditExam.Style.ButtonStyle := btsSimple
  else comboEditExam.Style.ButtonStyle := btsUltraFlat;

  //----------------------------------------------------------//

  edtEditExam.Style.HotTrack := cbEditHotTrack.Checked;
  comboEditExam.Style.HotTrack := cbEditHotTrack.Checked;
  memEditExam.Style.HotTrack := cbEditHotTrack.Checked;

  edtEditExam.Style.LookAndFeel.NativeStyle := cbEditNative.Checked;
  comboEditExam.Style.LookAndFeel.NativeStyle := cbEditNative.Checked;
  memEditExam.Style.LookAndFeel.NativeStyle := cbEditNative.Checked;
end;

{************************ Check Box / Radio Button  ***************************}

procedure TVisualOptionsFrm.StyleCheckChange(Sender: TObject);
begin
  if comboCheckBorder.Text = '3D' then cbCheckExam.Style.BorderStyle := ebs3D
  else if comboCheckBorder.Text = 'Flat' then cbCheckExam.Style.BorderStyle := ebsFlat
  else if comboCheckBorder.Text = 'None' then cbCheckExam.Style.BorderStyle := ebsNone
  else if comboCheckBorder.Text = 'Office11' then cbCheckExam.Style.BorderStyle := ebsOffice11
  else if comboCheckBorder.Text = 'Single' then cbCheckExam.Style.BorderStyle := ebsSingle
  else if comboCheckBorder.Text = 'Thick' then cbCheckExam.Style.BorderStyle := ebsThick
  else cbCheckExam.Style.BorderStyle := ebsUltraFlat;

  rgCheckRadioGroupExam.Style.BorderStyle := cbCheckExam.Style.BorderStyle;
  rgCheckRadioGroupExam2.Style.BorderStyle := cbCheckExam.Style.BorderStyle;

  //----------------------------------------------------------//

  if comboCheckLook.Text = 'Flat' then cbCheckExam.Style.LookAndFeel.Kind := lfFlat
  else if comboCheckLook.Text = 'Office11' then cbCheckExam.Style.LookAndFeel.Kind := lfOffice11
  else if comboCheckLook.Text = 'Standard' then cbCheckExam.Style.LookAndFeel.Kind := lfStandard
  else cbCheckExam.Style.LookAndFeel.Kind := lfUltraFlat;

  rgCheckRadioGroupExam.Style.LookAndFeel.Kind := cbCheckExam.Style.LookAndFeel.Kind;
  rgCheckRadioGroupExam2.Style.LookAndFeel.Kind := cbCheckExam.Style.LookAndFeel.Kind;

  cbCheckExam.Style.HotTrack := cbCheckHot.Checked;
  rgCheckRadioGroupExam.Style.HotTrack := cbCheckHot.Checked;
  rgCheckRadioGroupExam2.Style.HotTrack := cbCheckHot.Checked;

  cbCheckExam.Style.LookAndFeel.NativeStyle := cbCheckNative.Checked;
  rgCheckRadioGroupExam.Style.LookAndFeel.NativeStyle := cbCheckNative.Checked;
  rgCheckRadioGroupExam2.Style.LookAndFeel.NativeStyle := cbCheckNative.Checked;
end;

{********************************* Buttons ************************************}

procedure TVisualOptionsFrm.comboButtonBorderPropertiesChange(
  Sender: TObject);
begin
  if comboButtonBorder.Text = 'Flat' then btnButtonExam.LookAndFeel.Kind := lfFlat
  else if comboButtonBorder.Text = 'Office11' then btnButtonExam.LookAndFeel.Kind := lfOffice11
  else if comboButtonBorder.Text = 'Standard' then btnButtonExam.LookAndFeel.Kind := lfStandard
  else btnButtonExam.LookAndFeel.Kind := lfUltraFlat;

  btnButtonExam.LookAndFeel.NativeStyle := cbButtonNativeStyle.Checked;
end;

{********************************* Buttons ************************************}

procedure TVisualOptionsFrm.StylePageChange(
  Sender: TObject);
begin
  if comboPageBorder.Text  = 'Default' then pcPageExam.Style := 0
  else if comboPageBorder.Text  = 'Tabs' then pcPageExam.Style := 1
  else if comboPageBorder.Text  = 'Buttons' then pcPageExam.Style := 2
  else if comboPageBorder.Text  = 'FlatButtons' then pcPageExam.Style := 3
  else if comboPageBorder.Text  = 'ExtraFlat' then pcPageExam.Style := 5
  else if comboPageBorder.Text  = 'UltraFlat' then pcPageExam.Style := 6
  else if comboPageBorder.Text  = 'Flat' then pcPageExam.Style := 7
  else if comboPageBorder.Text  = 'Office11' then pcPageExam.Style := 8
  else if comboPageBorder.Text  = 'Slanted' then pcPageExam.Style := 9
  else pcPageExam.Style := 10;

  if comboPageTab.Text = 'Slant' then pcPageExam.TabSlants.Kind := skSlant
  else pcPageExam.TabSlants.Kind := skCutCorner;

  pcPageExam.HotTrack := cbPageHot.Checked;
  pcPageExam.LookAndFeel.NativeStyle := cbPageNative.Checked;
end;

{********************************* Group Box **********************************}

procedure TVisualOptionsFrm.StyleGroupBoxChange(
  Sender: TObject);
begin
  if comboGroupBorder.Text = '3D' then gbGroupExam.Style.BorderStyle := ebs3D
  else if comboGroupBorder.Text = 'Flat' then gbGroupExam.Style.BorderStyle := ebsFlat
  else if comboGroupBorder.Text = 'None' then gbGroupExam.Style.BorderStyle := ebsNone
  else if comboGroupBorder.Text = 'Office11' then gbGroupExam.Style.BorderStyle := ebsOffice11
  else if comboGroupBorder.Text = 'Single' then gbGroupExam.Style.BorderStyle := ebsSingle
  else if comboGroupBorder.Text = 'Thick' then gbGroupExam.Style.BorderStyle := ebsThick
  else gbGroupExam.Style.BorderStyle := ebsUltraFlat;

  //----------------------------------------------------------//

  if comboGroupLook.Text = 'Flat' then gbGroupExam.Style.LookAndFeel.Kind := lfFlat
  else if comboGroupLook.Text = 'Office11' then gbGroupExam.Style.LookAndFeel.Kind := lfOffice11
  else if comboGroupLook.Text = 'Standard' then gbGroupExam.Style.LookAndFeel.Kind := lfStandard
  else gbGroupExam.Style.LookAndFeel.Kind := lfUltraFlat;

  gbGroupExam.Style.Shadow := cbGroupShadow.Checked;
  gbGroupExam.Style.LookAndFeel.NativeStyle := cbGroupNative.Checked;
end;

procedure TVisualOptionsFrm.comboSipletterHotPropertiesChange(
  Sender: TObject);
var
  vText: string;
  vHzcl: TcxHotZoneStyleClass;
begin
  vText := comboSipletterHot.Text;
  vHzCl := TcxHotZoneStyleClass(GetRegisteredHotZoneStyles.FindByClassName(vText));
  if vHzCl = nil then
    vHzCl := TcxHotZoneStyleClass(GetRegisteredHotZoneStyles.FindByDescription(vText));
  spExam.HotZoneStyleClass := vHzCl;
end;

procedure TVisualOptionsFrm.comboNavigatonStylePropertiesChange(
  Sender: TObject);
begin
  if comboNavigatonStyle.Text = 'BaseView' then navBarNavigatonExam.View := 0
  else if comboNavigatonStyle.Text = 'FlatView' then navBarNavigatonExam.View := 1
  else if comboNavigatonStyle.Text = 'Office1View' then navBarNavigatonExam.View := 2
  else if comboNavigatonStyle.Text = 'Office2View' then navBarNavigatonExam.View := 3
  else if comboNavigatonStyle.Text = 'Office3View' then navBarNavigatonExam.View := 4
  else if comboNavigatonStyle.Text = 'VSToolBoxView' then navBarNavigatonExam.View := 5
  else if comboNavigatonStyle.Text = 'XP1View' then navBarNavigatonExam.View := 6
  else if comboNavigatonStyle.Text = 'XP2View' then navBarNavigatonExam.View := 7
  else if comboNavigatonStyle.Text = 'ExplorerBarView' then navBarNavigatonExam.View := 8
  else if comboNavigatonStyle.Text = 'UltraFlatExplorerView' then navBarNavigatonExam.View := 9
  else if comboNavigatonStyle.Text = 'AdvExplorerBarView' then navBarNavigatonExam.View := 10
  else if comboNavigatonStyle.Text = 'XPExplorerBarView' then navBarNavigatonExam.View := 11
  else if comboNavigatonStyle.Text = 'Office11TaskPaneView' then navBarNavigatonExam.View := 12
  else navBarNavigatonExam.View := 13;
end;

procedure TVisualOptionsFrm.btnOKClick(Sender: TObject);
begin
  if comboTemplate.Text = '' then
  begin
    MessageDlg('Template Name must be specified', mtWarning, [mbOk], 0);
    exit;
  end;

  barManagerStyle := comboBarStyle.Text;
  barManagerMenuAnim := comboBarMenuAnim.Text;
  barManagerSunkenBorder := cbBarSunkenBorder.Checked;
  barManagerUseF10forMenu := cbBarUseF10forMenu.Checked;
  barManagerFlatCloseButton := cbBarFlatCloseButton.Checked;

  treeLookAndFeel := comboTreeLook.Text;
  treeBorderStyle := comboTreeBorder.Text;
  treeHideSelection := cbTreeHide.Checked;

  editBorderStyle := comboEditBorder.Text;
  editButtonStyle := comboEditButton.Text;
  editHotTrack := cbEditHotTrack.Checked;
  editNativeStyle := cbEditNative.Checked;

  checkBoxBorderStyle := comboCheckBorder.Text;
  checkBoxLookAndFeal := comboCheckLook.Text;
  checkBoxHotTrack := cbCheckHot.Checked;
  checkBoxNativeStyle := cbCheckNative.Checked;

  buttonLookAndFeel := comboButtonBorder.Text;
  buttonNativeStyle := cbButtonNativeStyle.Checked;

  pageControlStyle := comboPageBorder.Text;
  pageControlTabSlant := comboPageTab.Text;
  pageControlHotTrack := cbPageHot.Checked;
  pageControlNativeStyle := cbPageNative.Checked;

  groupBoxBorderStyle := comboGroupBorder.Text;
  groupBoxLookAndFeel := comboGroupLook.Text;
  groupBoxShadow := cbGroupShadow.Checked;
  groupBoxNativeStyle := cbGroupNative.Checked;

  siplettersHotZone := comboSipletterHot.Text;

  navigatonBarViewStyle := comboNavigatonStyle.Text;

  WriteVisualOptions(comboTemplate.Text);
  
  close;
end; //btnOKClick

procedure TVisualOptionsFrm.comboTemplatePropertiesChange(Sender: TObject);
begin
  ReadVisualOptions(comboTemplate.Text);

  comboBarStyle.EditText := barManagerStyle;
  comboBarMenuAnim.Text := barManagerMenuAnim;
  cbBarSunkenBorder.Checked := barManagerSunkenBorder;
  cbBarUseF10forMenu.Checked := barManagerUseF10forMenu;
  cbBarFlatCloseButton.Checked := barManagerFlatCloseButton;

  comboTreeLook.Text := treeLookAndFeel;
  comboTreeBorder.Text := treeBorderStyle;
  cbTreeHide.Checked := treeHideSelection;

  comboEditBorder.Text := editBorderStyle;
  comboEditButton.Text := editButtonStyle;
  cbEditHotTrack.Checked := editHotTrack;
  cbEditNative.Checked := editNativeStyle;

  comboCheckBorder.Text := checkBoxBorderStyle;
  comboCheckLook.Text := checkBoxLookAndFeal;
  cbCheckHot.Checked := checkBoxHotTrack;
  cbCheckNative.Checked := checkBoxNativeStyle;

  comboButtonBorder.Text := buttonLookAndFeel;
  cbButtonNativeStyle.Checked := buttonNativeStyle;

  comboPageBorder.EditText := pageControlStyle;
  comboPageTab.Text := pageControlTabSlant;
  cbPageHot.Checked := pageControlHotTrack;
  cbPageNative.Checked := pageControlNativeStyle;

  comboGroupBorder.Text := groupBoxBorderStyle;
  comboGroupLook.Text := groupBoxLookAndFeel;
  cbGroupShadow.Checked := groupBoxShadow;
  cbGroupNative.Checked := groupBoxNativeStyle;

  comboSipletterHot.Text := siplettersHotZone;

  comboNavigatonStyle.Text := navigatonBarViewStyle;

end; //comboTemplatePropertiesChange




end.
