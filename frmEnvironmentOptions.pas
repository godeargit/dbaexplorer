unit frmEnvironmentOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, ComCtrls, cxControls, cxContainer,
  cxTreeView, StdCtrls, cxButtons, ExtCtrls, cxPC, cxEdit, cxLabel,
  cxGraphics, cxListView, cxTextEdit, cxMaskEdit, cxDropDownEdit, GenelDM,
  cxSpinEdit, cxFontNameComboBox;

type
  TEnvironmentOptionsFrm = class(TForm)
    Panel2: TPanel;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    treeList: TcxTreeView;
    Panel1: TPanel;
    Panel3: TPanel;
    imgToolBar: TImage;
    imgObject: TImage;
    lblObjectName: TcxLabel;
    pc: TcxPageControl;
    tsLanguages: TcxTabSheet;
    tsFont: TcxTabSheet;
    tsEditorColor: TcxTabSheet;
    cxLabel1: TcxLabel;
    comboDefaultLanguage: TcxComboBox;
    cxLabel2: TcxLabel;
    lvLanguageList: TcxListView;
    btnAddLanguage: TcxButton;
    cxLabel3: TcxLabel;
    comboFontName: TcxFontNameComboBox;
    cxLabel4: TcxLabel;
    sedtFontSize: TcxSpinEdit;
    lblFontSample: TcxLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddLanguageClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure treeListChange(Sender: TObject; Node: TTreeNode);
    procedure comboFontNamePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure SetLanguages;
    procedure SaveLanguages;
    procedure SetFont;
    procedure SaveFont;
  public
    { Public declarations }
    procedure Init();
  end;

var
  EnvironmentOptionsFrm: TEnvironmentOptionsFrm;

implementation

uses VisualOptions, Languages, frmAddLanguage;

{$R *.dfm}

procedure TEnvironmentOptionsFrm.Init();
begin
  EnvironmentOptionsFrm := TEnvironmentOptionsFrm.Create(Application);
  Self := EnvironmentOptionsFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  pc.ActivePageIndex := 0;
  treeListChange(nil, treeList.Items[0]);

  SetLanguages;
  SetFont;
  
  ShowModal;

  free;
end;

procedure TEnvironmentOptionsFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TEnvironmentOptionsFrm.treeListChange(Sender: TObject;
  Node: TTreeNode);
begin
  pc.ActivePageIndex := Node.Index;
  lblObjectName.Caption := Node.Text;
  imgObject.Picture := nil;
  dmGenel.ilEnviromentOptions.GetBitmap(pc.ActivePageIndex, imgObject.Picture.Bitmap);
  imgObject.Repaint;
  imgObject.Refresh;
end;

procedure TEnvironmentOptionsFrm.SetLanguages;
var
  str: TStrings;
  i: integer;
begin
  str := ReadAllLanguages;

  for i := 0 to str.Count -1 do
  begin
    with lvLanguageList.Items.Add do
    begin
      Caption := copy(str[i],1,pos('=',str[i])-1);
      ImageIndex := -1;
    end;
    lvLanguageList.Items[lvLanguageList.Items.count-1].SubItems.Add(copy(str[i],pos('=',str[i])+1, length(str[i])));
  end;

  for i := 0 to str.Count -1 do
    str[i] := copy(str[i],1,pos('=',str[i])-1);

  comboDefaultLanguage.Properties.Items := str;
  comboDefaultLanguage.Text := ReadDefaultLanguage;
end;

procedure TEnvironmentOptionsFrm.btnAddLanguageClick(Sender: TObject);
var
  str : string;
begin
  str := AddLanguageFrm.Init;
  if str = '' then exit;

  with lvLanguageList.Items.Add do
  begin
    Caption := copy(str,1,pos('=',str)-1);
    ImageIndex := -1;
  end;
  lvLanguageList.Items[lvLanguageList.Items.count-1].SubItems.Add(copy(str,pos('=',str)+1, length(str)));

  comboDefaultLanguage.Properties.Items.Add(copy(str,1,pos('=',str)-1));
end;

procedure TEnvironmentOptionsFrm.SaveLanguages;
var
  ml: TMultiLanguages;
  i: integer;
begin
  ml := TMultiLanguages.Create(nil);
  for i := 0 to lvLanguageList.Items.Count -1 do
  begin
    ml.Add(lvLanguageList.Items[i].Caption, lvLanguageList.Items[i].SubItems.CommaText);
  end;
  ml.SaveDefault(comboDefaultLanguage.Text);
  ml.Free;
end;

procedure TEnvironmentOptionsFrm.btnOKClick(Sender: TObject);
begin
  if pc.ActivePage = tsLanguages then SaveLanguages;
  if pc.ActivePage = tsFont then SaveFont;
  close;
end;

procedure TEnvironmentOptionsFrm.SetFont;
begin
  ReadSystemFontName;
  comboFontName.FontName := SystemFontName;
  sedtFontSize.Value := SystemFontSize;
end;

procedure TEnvironmentOptionsFrm.SaveFont;
begin
  SystemFontName := comboFontName.FontName;
  SystemFontSize := sedtFontSize.Value;
  WriteSystemFontName;
end;

procedure TEnvironmentOptionsFrm.comboFontNamePropertiesChange(
  Sender: TObject);
begin
  lblFontSample.Style.Font.Name := comboFontName.FontName;
  lblFontSample.Style.Font.Size := sedtFontSize.Value;
end;

end.
