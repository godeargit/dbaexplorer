unit VisualOptions;

interface

uses SysUtils, IniFiles, classes, Forms, WinTypes, ShellAPI, Graphics,
  cxLookAndFeelPainters, cxTreeView, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, StdCtrls, cxButtons, cxGraphics,
  cxCheckBox, dxBar, cxTextEdit, cxMaskEdit, cxDropDownEdit, dxStatusBar,
  cxListView, cxMemo, cxGroupBox, cxCheckGroup, cxRadioGroup, cxPC,
  cxSplitter, dxNavBarCollns, cxClasses, dxNavBarBase, dxNavBar,
  cxLookAndFeels, cxListBox, dxDockControl, cxHeader,
  cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxDBTL, cxButtonEdit;

var
  SystemFontName: String;
  SystemFontSize: integer;

  barManagerStyle : string;
  barManagerMenuAnim: string;
  barManagerSunkenBorder: boolean;
  barManagerUseF10forMenu: boolean;
  barManagerFlatCloseButton: boolean;

  treeLookAndFeel: string;
  treeBorderStyle: string;
  treeHideSelection: boolean;

  editBorderStyle: string;
  editButtonStyle: string;
  editHotTrack: boolean;
  editNativeStyle: boolean;

  checkBoxBorderStyle: string;
  checkBoxLookAndFeal: string;
  checkBoxHotTrack: boolean;
  checkBoxNativeStyle: boolean;

  buttonLookAndFeel: string;
  buttonNativeStyle: boolean;

  pageControlStyle: string;
  pageControlTabSlant: string;
  pageControlHotTrack: boolean;
  pageControlNativeStyle: boolean;

  groupBoxBorderStyle: string;
  groupBoxLookAndFeel: string;
  groupBoxShadow: boolean;
  groupBoxNativeStyle: boolean;

  siplettersHotZone: string;

  navigatonBarViewStyle: string;

function ReadAllVisualOptions: TStrings;
function DefaultGUITemplate: string;
procedure ReadVisualOptions(Section: string);
procedure WriteVisualOptions(Section: string);
procedure ChangeVisualGUI(var AForm);

procedure WriteSystemFontName;
procedure ReadSystemFontName;

implementation

uses GenelDM, Controls;

procedure WriteSystemFontName;
begin
  with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  try
    WriteString('System Font', 'SystemFontName', SystemFontName);
    WriteInteger('System Font', 'SystemFontSize', SystemFontSize);
  finally
    free;
  end;
end;

procedure ReadSystemFontName;
begin
  with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  try
    SystemFontName := ReadString('System Font', 'SystemFontName', 'Tahoma');
    SystemFontSize := ReadInteger('System Font', 'SystemFontSize', 8);
  finally
    free;
  end;
end;


function DefaultGUITemplate: string;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'ORAMAN_GUI.INI');
  try
    result := Ini.ReadString('Default', 'DefaultTemplate', '');
  finally
    Ini.Free;
  end;
end;

function ReadAllVisualOptions: TStrings;
var
  Ini: TIniFile;
begin
  result := TStringList.Create;
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'ORAMAN_GUI.INI');
  try
    Ini.ReadSections(result);
    if result.Count > 1 then
       result.Delete(0); //delete default value
  finally
    Ini.Free;
  end;
end;

procedure ReadVisualOptions(Section: string);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'ORAMAN_GUI.INI');
  try
    barManagerStyle             := Ini.ReadString(Section, 'BarManager-Style', '');
    barManagerMenuAnim          := Ini.ReadString(Section, 'BarManager-MenuAnim', '');
    barManagerSunkenBorder      := Ini.ReadBool(Section, 'BarManager-SunkenBorder', false);
    barManagerUseF10forMenu     := Ini.ReadBool(Section, 'BarManager-UseF10forMenu', false);
    barManagerFlatCloseButton   := Ini.ReadBool(Section, 'BarManager-FlatCloseButton', false);

    treeLookAndFeel             := Ini.ReadString(Section, 'Tree-LookAndFeel', '');
    treeBorderStyle             := Ini.ReadString(Section, 'Tree-BorderStyle', '');
    treeHideSelection           := Ini.ReadBool(Section, 'Tree-HideSelection', false);

    editBorderStyle             := Ini.ReadString(Section, 'Edit-BorderStyle', '');
    editButtonStyle             := Ini.ReadString(Section, 'Edit-ButtonStyle', '');
    editHotTrack                := Ini.ReadBool(Section, 'Edit-HotTrack', false);
    editNativeStyle             := Ini.ReadBool(Section, 'Edit-NativeStyle', false);

    checkBoxBorderStyle         := Ini.ReadString(Section, 'CheckBox-BorderStyle', '');
    checkBoxLookAndFeal         := Ini.ReadString(Section, 'CheckBox-LookAndFeal', '');
    checkBoxHotTrack            := Ini.ReadBool(Section, 'CheckBox-HotTrack', false);
    checkBoxNativeStyle         := Ini.ReadBool(Section, 'CheckBox-NativeStyle', false);

    buttonLookAndFeel           := Ini.ReadString(Section, 'Button-LookAndFee', '');
    buttonNativeStyle           := Ini.ReadBool(Section, 'Button-NativeStyle', false);

    pageControlStyle            := Ini.ReadString(Section, 'PageControl-Style', '');
    pageControlTabSlant         := Ini.ReadString(Section, 'PageControl-TabSlant', '');
    pageControlHotTrack         := Ini.ReadBool(Section, 'PageControl-HotTrack', false);
    pageControlNativeStyle      := Ini.ReadBool(Section, 'PageControl-NativeStyle', false);

    groupBoxBorderStyle         := Ini.ReadString(Section, 'GroupBox-BorderStyle', '');
    groupBoxLookAndFeel         := Ini.ReadString(Section, 'GroupBox-LookAndFeel', '');
    groupBoxShadow              := Ini.ReadBool(Section, 'GroupBox-Shadow', false);
    groupBoxNativeStyle         := Ini.ReadBool(Section, 'GroupBox-NativeStyle', false);

    siplettersHotZone           := Ini.ReadString(Section, 'Sipletters-HotZone', '');

    navigatonBarViewStyle       := Ini.ReadString(Section, 'NavigatonBar-ViewStyle', '');

  finally
    Ini.Free;
  end;

end;

procedure WriteVisualOptions(Section: string);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'ORAMAN_GUI.INI');
  try
    Ini.WriteString('Default', 'DefaultTemplate', Section);

    Ini.EraseSection(Section);
    Ini.WriteString(Section, 'BarManager-Style', barManagerStyle);
    Ini.WriteString(Section, 'BarManager-MenuAnim', barManagerMenuAnim);
    Ini.WriteBool(Section, 'BarManager-SunkenBorder', barManagerSunkenBorder);
    Ini.WriteBool(Section, 'BarManager-UseF10forMenu', barManagerUseF10forMenu);
    Ini.WriteBool(Section, 'BarManager-FlatCloseButton', barManagerFlatCloseButton);

    Ini.WriteString(Section, 'Tree-LookAndFeel', treeLookAndFeel);
    Ini.WriteString(Section, 'Tree-BorderStyle', treeBorderStyle);
    Ini.WriteBool(Section, 'Tree-HideSelection', treeHideSelection);

    Ini.WriteString(Section, 'Edit-BorderStyle', editBorderStyle);
    Ini.WriteString(Section, 'Edit-ButtonStyle', editButtonStyle);
    Ini.WriteBool(Section, 'Edit-HotTrack', editHotTrack);
    Ini.WriteBool(Section, 'Edit-NativeStyle', editNativeStyle);

    Ini.WriteString(Section, 'CheckBox-BorderStyle', checkBoxBorderStyle);
    Ini.WriteString(Section, 'CheckBox-LookAndFeal', checkBoxLookAndFeal);
    Ini.WriteBool(Section, 'CheckBox-HotTrack', checkBoxHotTrack);
    Ini.WriteBool(Section, 'CheckBox-NativeStyle', checkBoxNativeStyle);

    Ini.WriteString(Section, 'Button-LookAndFee', buttonLookAndFeel);
    Ini.WriteBool(Section, 'Button-NativeStyle', buttonNativeStyle);

    Ini.WriteString(Section, 'PageControl-Style', pageControlStyle);
    Ini.WriteString(Section, 'PageControl-TabSlant', pageControlTabSlant);
    Ini.WriteBool(Section, 'PageControl-HotTrack', pageControlHotTrack);
    Ini.WriteBool(Section, 'PageControl-NativeStyle', pageControlNativeStyle);

    Ini.WriteString(Section, 'GroupBox-BorderStyle', groupBoxBorderStyle);
    Ini.WriteString(Section, 'GroupBox-LookAndFeel',  groupBoxLookAndFeel);
    Ini.WriteBool(Section, 'GroupBox-Shadow', groupBoxShadow);
    Ini.WriteBool(Section, 'GroupBox-NativeStyle', groupBoxNativeStyle);

    Ini.WriteString(Section, 'Sipletters-HotZone', siplettersHotZone);

    Ini.WriteString(Section, 'NavigatonBar-ViewStyle', navigatonBarViewStyle);

  finally
    Ini.Free;
  end;
end;

procedure ChangeVisualGUI(var AForm);
var
  i,x: integer;
begin
  if Tform(AForm) = nil then exit;

  ReadSystemFontName;
  Tform(AForm).Font.Name := SystemFontName;
  Tform(AForm).Font.Size := SystemFontSize;

  ReadVisualOptions(DefaultGUITemplate);
  for I := 0 to TForm(AForm).ComponentCount - 1 do
  begin
    if (TForm(AForm).Components[i]) is TdxBarManager then
    begin
      with (TForm(AForm).Components[i] as TdxBarManager) do
      begin
        if barManagerStyle = 'Enhanced' then Style := bmsEnhanced
        else if barManagerStyle = 'Flat' then Style := bmsFlat
        else if barManagerStyle = 'Office11' then Style := bmsOffice11
        else if barManagerStyle = 'Standard' then Style := bmsStandard
        else if barManagerStyle = 'UseLookAndFeel' then Style := bmsUseLookAndFeel
        else Style := bmsXP;

        if barManagerMenuAnim = 'None' then MenuAnimations := maNone
        else if barManagerMenuAnim = 'Random' then MenuAnimations := maRandom
        else if barManagerMenuAnim = 'Unfold' then MenuAnimations := maUnfold
        else if barManagerMenuAnim = 'Slide' then MenuAnimations := maSlide
        else MenuAnimations := maFade;

        SunkenBorder := barManagerSunkenBorder;
        FlatCloseButton := barManagerFlatCloseButton;
        UseF10ForMenu := barManagerUseF10forMenu;
        for x := 0 to Bars.Count -1 do
        begin
          Bars[x].Font.Name := SystemFontName;
          Bars[x].Font.Size := SystemFontSize;
        end;
      end; 
    end; //TdxBarManager

    if (TForm(AForm).Components[i]) is TdxStatusBar then
    begin
      with (TForm(AForm).Components[i] as TdxStatusBar) do
      begin
        if barManagerStyle = 'Enhanced' then PaintStyle := stpsFlat
        else if barManagerStyle = 'Flat' then PaintStyle := stpsFlat
        else if barManagerStyle = 'Office11' then PaintStyle := stpsOffice11
        else if barManagerStyle = 'Standard' then PaintStyle := stpsStandard
        else if barManagerStyle = 'UseLookAndFeel' then PaintStyle := stpsUseLookAndFeel
        else PaintStyle := stpsXP;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end; 
    end; //TdxStatusBar

    if (TForm(AForm).Components[i]) is TdxDockingManager then
    begin
      with (TForm(AForm).Components[i] as TdxDockingManager) do
      begin
        if barManagerStyle = 'Enhanced' then ViewStyle := vsNET
        else if barManagerStyle = 'Flat' then ViewStyle := vsNET
        else if barManagerStyle = 'Office11' then ViewStyle := vsOffice11
        else if barManagerStyle = 'Standard' then ViewStyle := vsStandard
        else if barManagerStyle = 'UseLookAndFeel' then ViewStyle := vsUseLookAndFeel
        else ViewStyle := vsXP;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end; //TdxDockingManager

    if (TForm(AForm).Components[i]) is TcxGrid then
    begin
      with (TForm(AForm).Components[i] as TcxGrid) do
      begin
        if barManagerStyle = 'Enhanced' then LookAndFeel.Kind := lfFlat
        else if barManagerStyle = 'Flat' then LookAndFeel.Kind := lfFlat
        else if barManagerStyle = 'Office11' then LookAndFeel.Kind := lfOffice11
        else if barManagerStyle = 'Standard' then LookAndFeel.Kind := lfStandard
        else if barManagerStyle = 'UseLookAndFeel' then LookAndFeel.Kind := lfUltraFlat
        else LookAndFeel.Kind := lfUltraFlat;

        if pageControlStyle  = 'Default' then LevelTabs.Style := 0
        else if pageControlStyle  = 'Tabs' then LevelTabs.Style := 1
        else if pageControlStyle  = 'Buttons' then LevelTabs.Style := 2
        else if pageControlStyle  = 'FlatButtons' then LevelTabs.Style := 3
        else if pageControlStyle  = 'ExtraFlat' then LevelTabs.Style := 5
        else if pageControlStyle  = 'UltraFlat' then LevelTabs.Style := 6
        else if pageControlStyle  = 'Flat' then LevelTabs.Style := 7
        else if pageControlStyle  = 'Office11' then LevelTabs.Style := 8
        else if pageControlStyle  = 'Slanted' then LevelTabs.Style := 9
        else LevelTabs.Style := 10;
        if pageControlTabSlant = 'Slant' then LevelTabs.Slants.Kind := skSlant
        else LevelTabs.Slants.Kind := skCutCorner;

        if LookAndFeel.Kind = lfFlat then BevelKind := bkSoft
           else BevelKind := bkNone;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end; //TcxGrid

    if ((TForm(AForm).Components[i]) is TcxTreeView) then
    begin
      with (TForm(AForm).Components[i] as TcxTreeView).Style do
      begin
        if treeBorderStyle = '3D' then BorderStyle := cbs3D
        else if treeBorderStyle = 'Flat' then BorderStyle := cbsFlat
        else if treeBorderStyle = 'None' then BorderStyle := cbsNone
        else if treeBorderStyle = 'Office11' then BorderStyle := cbsOffice11
        else if treeBorderStyle = 'Single' then BorderStyle := cbsSingle
        else if treeBorderStyle = 'Thick' then BorderStyle := cbsThick
        else BorderStyle := cbsUltraFlat;

        if treeLookAndFeel = 'Flat' then LookAndFeel.Kind := lfFlat
        else if treeLookAndFeel = 'Office11' then LookAndFeel.Kind := lfOffice11
        else if treeLookAndFeel = 'Standard' then LookAndFeel.Kind := lfStandard
        else LookAndFeel.Kind := lfUltraFlat;

        (TForm(AForm).Components[i] as TcxTreeView).HideSelection := treeHideSelection;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end;//TcxTreeView

    if ((TForm(AForm).Components[i]) is TcxLabel) then
    begin
      with (TForm(AForm).Components[i] as TcxLabel) do
      begin
        Transparent := True;
        Style.Font.Name := SystemFontName;
        Style.Font.Size := SystemFontSize;
      end;
    end;

    if ((TForm(AForm).Components[i]) is TcxDBTreeList) then
    begin
      with (TForm(AForm).Components[i] as TcxDBTreeList) do
      begin
        if treeLookAndFeel = 'Flat' then LookAndFeel.Kind := lfFlat
        else if treeLookAndFeel = 'Office11' then LookAndFeel.Kind := lfOffice11
        else if treeLookAndFeel = 'Standard' then LookAndFeel.Kind := lfStandard
        else LookAndFeel.Kind := lfUltraFlat;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end;//TcxDBTreeList

    if ((TForm(AForm).Components[i]) is TcxListView) then
    begin
      with (TForm(AForm).Components[i] as TcxListView).Style do
      begin
        if treeBorderStyle = '3D' then BorderStyle := cbs3D
        else if treeBorderStyle = 'Flat' then BorderStyle := cbsFlat
        else if treeBorderStyle = 'None' then BorderStyle := cbsNone
        else if treeBorderStyle = 'Office11' then BorderStyle := cbsOffice11
        else if treeBorderStyle = 'Single' then BorderStyle := cbsSingle
        else if treeBorderStyle = 'Thick' then BorderStyle := cbsThick
        else BorderStyle := cbsUltraFlat;

        if treeLookAndFeel = 'Flat' then LookAndFeel.Kind := lfFlat
        else if treeLookAndFeel = 'Office11' then LookAndFeel.Kind := lfOffice11
        else if treeLookAndFeel = 'Standard' then LookAndFeel.Kind := lfStandard
        else LookAndFeel.Kind := lfUltraFlat;

        (TForm(AForm).Components[i] as TcxListView).HideSelection := treeHideSelection;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end;//TcxListView

    if ((TForm(AForm).Components[i]) is TcxCustomTextEdit) then
    begin
      with (TForm(AForm).Components[i] as TcxCustomTextEdit).Style do
      begin
        if editBorderStyle = '3D' then BorderStyle := ebs3D
        else if editBorderStyle = 'Flat' then BorderStyle := ebsFlat
        else if editBorderStyle = 'None' then BorderStyle := ebsNone
        else if editBorderStyle = 'Office11' then BorderStyle := ebsOffice11
        else if editBorderStyle = 'Single' then BorderStyle := ebsSingle
        else if editBorderStyle = 'Thick' then BorderStyle := ebsThick
        else BorderStyle := ebsUltraFlat;

        HotTrack := editHotTrack;
        LookAndFeel.NativeStyle := editNativeStyle;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end; //TcxCustomTextEdit

    if ((TForm(AForm).Components[i]) is TcxButtonEdit) then
    begin
      with (TForm(AForm).Components[i] as TcxButtonEdit).Style do
      begin
        if editBorderStyle = '3D' then BorderStyle := ebs3D
        else if editBorderStyle = 'Flat' then BorderStyle := ebsFlat
        else if editBorderStyle = 'None' then BorderStyle := ebsNone
        else if editBorderStyle = 'Office11' then BorderStyle := ebsOffice11
        else if editBorderStyle = 'Single' then BorderStyle := ebsSingle
        else if editBorderStyle = 'Thick' then BorderStyle := ebsThick
        else BorderStyle := ebsUltraFlat;

        HotTrack := editHotTrack;
        LookAndFeel.NativeStyle := editNativeStyle;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end; //TcxButtonEdit

    if ((TForm(AForm).Components[i]) is TcxMemo) then
    begin
      with (TForm(AForm).Components[i] as TcxMemo).Style do
      begin
        if editBorderStyle = '3D' then BorderStyle := ebs3D
        else if editBorderStyle = 'Flat' then BorderStyle := ebsFlat
        else if editBorderStyle = 'None' then BorderStyle := ebsNone
        else if editBorderStyle = 'Office11' then BorderStyle := ebsOffice11
        else if editBorderStyle = 'Single' then BorderStyle := ebsSingle
        else if editBorderStyle = 'Thick' then BorderStyle := ebsThick
        else BorderStyle := ebsUltraFlat;

        HotTrack := editHotTrack;
        LookAndFeel.NativeStyle := editNativeStyle;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end; //TcxMemo

    if ((TForm(AForm).Components[i]) is TcxCustomComboBox) then
    begin
      with (TForm(AForm).Components[i] as TcxCustomComboBox).Style do
      begin
        if editBorderStyle = '3D' then BorderStyle := ebs3D
        else if editBorderStyle = 'Flat' then BorderStyle := ebsFlat
        else if editBorderStyle = 'None' then BorderStyle := ebsNone
        else if editBorderStyle = 'Office11' then BorderStyle := ebsOffice11
        else if editBorderStyle = 'Single' then BorderStyle := ebsSingle
        else if editBorderStyle = 'Thick' then BorderStyle := ebsThick
        else BorderStyle := ebsUltraFlat;

        HotTrack := editHotTrack;
        LookAndFeel.NativeStyle := editNativeStyle;

        if editButtonStyle = '3D' then ButtonStyle := bts3D
        else if editButtonStyle = 'Default' then ButtonStyle := btsDefault
        else if editButtonStyle = 'Flat' then ButtonStyle := btsFlat
        else if editButtonStyle = 'HotFlat' then ButtonStyle := btsHotFlat
        else if editButtonStyle = 'Office11' then ButtonStyle := btsOffice11
        else if editButtonStyle = 'Simple' then ButtonStyle := btsSimple
        else ButtonStyle := btsUltraFlat;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end; //TcxComboBox

    if ((TForm(AForm).Components[i]) is TcxCheckBox) then
    begin
      with (TForm(AForm).Components[i] as TcxCheckBox).Style do
      begin
        if checkBoxBorderStyle = '3D' then BorderStyle := ebs3D
        else if checkBoxBorderStyle = 'Flat' then BorderStyle := ebsFlat
        else if checkBoxBorderStyle = 'None' then BorderStyle := ebsNone
        else if checkBoxBorderStyle = 'Office11' then BorderStyle := ebsOffice11
        else if checkBoxBorderStyle = 'Single' then BorderStyle := ebsSingle
        else if checkBoxBorderStyle = 'Thick' then BorderStyle := ebsThick
        else BorderStyle := ebsUltraFlat;

        if checkBoxLookAndFeal = 'Flat' then LookAndFeel.Kind := lfFlat
        else if checkBoxLookAndFeal = 'Office11' then LookAndFeel.Kind := lfOffice11
        else if checkBoxLookAndFeal = 'Standard' then LookAndFeel.Kind := lfStandard
        else LookAndFeel.Kind := lfUltraFlat;

        HotTrack := checkBoxHotTrack;
        LookAndFeel.NativeStyle := checkBoxNativeStyle;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end; //TcxCheckBox


    if ((TForm(AForm).Components[i]) is tcxRadioButton) then
    begin
      with (TForm(AForm).Components[i] as tcxRadioButton) do
      begin
        if checkBoxLookAndFeal = 'Flat' then LookAndFeel.Kind := lfFlat
        else if checkBoxLookAndFeal = 'Office11' then LookAndFeel.Kind := lfOffice11
        else if checkBoxLookAndFeal = 'Standard' then LookAndFeel.Kind := lfStandard
        else LookAndFeel.Kind := lfUltraFlat;

        LookAndFeel.NativeStyle := checkBoxNativeStyle;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end; //tcxRadioButton

    if ((TForm(AForm).Components[i]) is TcxRadioGroup) then
    begin
      with (TForm(AForm).Components[i] as TcxRadioGroup).Style do
      begin
        if checkBoxBorderStyle = '3D' then BorderStyle := ebs3D
        else if checkBoxBorderStyle = 'Flat' then BorderStyle := ebsFlat
        else if checkBoxBorderStyle = 'None' then BorderStyle := ebsNone
        else if checkBoxBorderStyle = 'Office11' then BorderStyle := ebsOffice11
        else if checkBoxBorderStyle = 'Single' then BorderStyle := ebsSingle
        else if checkBoxBorderStyle = 'Thick' then BorderStyle := ebsThick
        else BorderStyle := ebsUltraFlat;

        if checkBoxLookAndFeal = 'Flat' then LookAndFeel.Kind := lfFlat
        else if checkBoxLookAndFeal = 'Office11' then LookAndFeel.Kind := lfOffice11
        else if checkBoxLookAndFeal = 'Standard' then LookAndFeel.Kind := lfStandard
        else LookAndFeel.Kind := lfUltraFlat;

        HotTrack := checkBoxHotTrack;
        LookAndFeel.NativeStyle := checkBoxNativeStyle;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end; //TcxRadioGroup

    if ((TForm(AForm).Components[i]) is TcxButton) then
    begin
      with (TForm(AForm).Components[i] as TcxButton) do
      begin
        if buttonLookAndFeel = 'Flat' then LookAndFeel.Kind := lfFlat
        else if buttonLookAndFeel = 'Office11' then LookAndFeel.Kind := lfOffice11
        else if buttonLookAndFeel = 'Standard' then LookAndFeel.Kind := lfStandard
        else LookAndFeel.Kind := lfUltraFlat;
        LookAndFeel.NativeStyle := buttonNativeStyle;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end; //TcxButton

    if ((TForm(AForm).Components[i]) is TcxPageControl) then
    begin
      with (TForm(AForm).Components[i] as TcxPageControl) do
      begin
        if pageControlStyle  = 'Default' then Style := 0
        else if pageControlStyle  = 'Tabs' then Style := 1
        else if pageControlStyle  = 'Buttons' then Style := 2
        else if pageControlStyle  = 'FlatButtons' then Style := 3
        else if pageControlStyle  = 'ExtraFlat' then Style := 5
        else if pageControlStyle  = 'UltraFlat' then Style := 6
        else if pageControlStyle  = 'Flat' then Style := 7
        else if pageControlStyle  = 'Office11' then Style := 8
        else if pageControlStyle  = 'Slanted' then Style := 9
        else Style := 10;

        Options := [pcoGradient, pcoRedrawOnResize];

        if pageControlTabSlant = 'Slant' then TabSlants.Kind := skSlant
           else TabSlants.Kind := skCutCorner;
        ShowFrame := true;
        //Color := clWhite;
        HotTrack := pageControlHotTrack;
        LookAndFeel.NativeStyle := pageControlNativeStyle;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;

      end;
    end; //TcxPageControl

    if ((TForm(AForm).Components[i]) is TcxGroupBox) then
    begin
      with (TForm(AForm).Components[i] as TcxGroupBox).Style do
      begin
        if BorderStyle <> ebsNone then
        begin
          if groupBoxBorderStyle = '3D' then BorderStyle := ebs3D
          else if groupBoxBorderStyle = 'Flat' then BorderStyle := ebsFlat
          else if groupBoxBorderStyle = 'None' then BorderStyle := ebsNone
          else if groupBoxBorderStyle = 'Office11' then BorderStyle := ebsOffice11
          else if groupBoxBorderStyle = 'Single' then BorderStyle := ebsSingle
          else if groupBoxBorderStyle = 'Thick' then BorderStyle := ebsThick
          else BorderStyle := ebsUltraFlat;
        end;
        if groupBoxLookAndFeel = 'Flat' then LookAndFeel.Kind := lfFlat
        else if groupBoxLookAndFeel = 'Office11' then LookAndFeel.Kind := lfOffice11
        else if groupBoxLookAndFeel = 'Standard' then LookAndFeel.Kind := lfStandard
        else LookAndFeel.Kind := lfUltraFlat;

        Shadow := groupBoxShadow;
        LookAndFeel.NativeStyle := groupBoxNativeStyle;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end; //TcxGroupBox

    if ((TForm(AForm).Components[i]) is TcxHeader) then
    begin
      with (TForm(AForm).Components[i] as TcxHeader) do
      begin
        if groupBoxLookAndFeel = 'Flat' then LookAndFeel.Kind := lfFlat
        else if groupBoxLookAndFeel = 'Office11' then LookAndFeel.Kind := lfOffice11
        else if groupBoxLookAndFeel = 'Standard' then LookAndFeel.Kind := lfStandard
        else LookAndFeel.Kind := lfUltraFlat;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
   end; //TcxHeader

    if ((TForm(AForm).Components[i]) is TcxSplitter) then
    begin
      with (TForm(AForm).Components[i] as TcxSplitter) do
      begin
        HotZoneStyleClass := TcxHotZoneStyleClass(GetRegisteredHotZoneStyles.FindByDescription(siplettersHotZone));
      end;
    end; //TcxSplitter

    if ((TForm(AForm).Components[i]) is TdxNavBar) then
    begin
      with (TForm(AForm).Components[i] as TdxNavBar) do
      begin
        if navigatonBarViewStyle = 'BaseView' then View := 0
        else if navigatonBarViewStyle = 'FlatView' then View := 1
        else if navigatonBarViewStyle = 'Office1View' then View := 2
        else if navigatonBarViewStyle = 'Office2View' then View := 3
        else if navigatonBarViewStyle = 'Office3View' then View := 4
        else if navigatonBarViewStyle = 'VSToolBoxView' then View := 5
        else if navigatonBarViewStyle = 'XP1View' then View := 6
        else if navigatonBarViewStyle = 'XP2View' then View := 7
        else if navigatonBarViewStyle = 'ExplorerBarView' then View := 8
        else if navigatonBarViewStyle = 'UltraFlatExplorerView' then View := 9
        else if navigatonBarViewStyle = 'AdvExplorerBarView' then View := 10
        else if navigatonBarViewStyle = 'XPExplorerBarView' then View := 11
        else if navigatonBarViewStyle = 'Office11TaskPaneView' then View := 12
        else View := 13;
        Font.Name := SystemFontName;
        Font.Size := SystemFontSize;
      end;
    end; //TdxNavBar
    {
    if ((TForm(AForm).Components[i]) is TImage) then
    begin
      with (TForm(AForm).Components[i] as TImage) do
      begin
         if Name = 'imgToolBar' then
         begin
            if pageControlStyle  = 'Office11' then
               dmGenel.ilToolBar.GetBitmap(1,Picture.Bitmap)
            else
               dmGenel.ilToolBar.GetBitmap(0,Picture.Bitmap);
         Stretch := true;      
         Repaint;
         end;
      end;
    end; }
  end; //for
end; //ChangeVisualGUI



end.
