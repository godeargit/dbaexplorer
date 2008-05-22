unit frmDiffMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, StdCtrls, DiffUnit, ExtCtrls, Menus, ComCtrls, ShellApi, 
  IniFiles, ToolWin, ImgList, Clipbrd, GenelDM;

type
  TDiffMainFrm = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarSubItem1: TdxBarSubItem;
    mnuEdit: TdxBarSubItem;
    mnuSearch: TdxBarSubItem;
    mnuOptions: TdxBarSubItem;
    dxBarSubItem5: TdxBarSubItem;
    mnuOpen1: TdxBarButton;
    mnuOpen2: TdxBarButton;
    mnuSave1: TdxBarButton;
    mnuSave2: TdxBarButton;
    mnuFolder: TdxBarButton;
    mnuSaveReport: TdxBarButton;
    mnuExit: TdxBarButton;
    mnuUndo: TdxBarButton;
    mnuRedo: TdxBarButton;
    mnuCut: TdxBarButton;
    mnuCopy: TdxBarButton;
    mnuPaste: TdxBarButton;
    mnuFind: TdxBarButton;
    mnuFindNext: TdxBarButton;
    mnuReplace: TdxBarButton;
    mnuIgnoreBlanks: TdxBarButton;
    mnuIgnoreCase: TdxBarButton;
    mnuShowDiffsOnly: TdxBarButton;
    mnuHorzSplit: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    Added1: TdxBarButton;
    Modified1: TdxBarButton;
    Deleted1: TdxBarButton;
    mnuFont: TdxBarButton;
    mnuCompare: TdxBarButton;
    mnuCancel: TdxBarButton;
    mnuCompareFiles: TdxBarButton;
    mnuNext: TdxBarButton;
    mnuPrev: TdxBarButton;
    mnuCopyBlockRight: TdxBarButton;
    mnuCopyBlockLeft: TdxBarButton;
    ColorDialog1: TColorDialog;
    tbFolder: TdxBarButton;
    tbOpen1: TdxBarButton;
    tbOpen2: TdxBarButton;
    tbCompare: TdxBarButton;
    tbCancel: TdxBarButton;
    tbHorzSplit: TdxBarButton;
    tbSave1: TdxBarButton;
    tbSave2: TdxBarButton;
    tbFindNext: TdxBarButton;
    tbReplace: TdxBarButton;
    tbNext: TdxBarButton;
    tbPrev: TdxBarButton;
    StatusBar1: TStatusBar;
    procedure mnuFolderClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuIgnoreBlanksClick(Sender: TObject);
    procedure mnuIgnoreCaseClick(Sender: TObject);
    procedure mnuShowDiffsOnlyClick(Sender: TObject);
    procedure Added1Click(Sender: TObject);
    procedure Modified1Click(Sender: TObject);
    procedure Deleted1Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
  private
    { Private declarations }
    procedure LoadOptionsFromIni;
    procedure SaveOptionsToIni;
  public
    { Public declarations }
    FilesFrame: TFrame;
    FoldersFrame: TFrame;
    procedure Init();
  end;

var
  DiffMainFrm: TDiffMainFrm;

  addClr, delClr, modClr: TColor;
  LastOpenedFolder1, LastOpenedFolder2: string;
const
  FILEVIEW = 12;
  FOLDERVIEW = 13;
  DESIGN_RESOLUTION = 96;

implementation

uses FileView, FolderView, frmMain, VisualOptions;       

{$R *.dfm}

procedure TDiffMainFrm.Init();
begin
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  MainFrm.dxBarListWindows.Items.AddObject(Caption, Self);

  FilesFrame := TFilesFrame.Create(self);
  FilesFrame.Parent := self;
  FilesFrame.Align := alClient;
  FilesFrame.ScaleBy(Screen.PixelsPerInch, DESIGN_RESOLUTION);

  FoldersFrame := TFoldersFrame.Create(self);
  FoldersFrame.Parent := self;
  FoldersFrame.Align := alClient;
  FoldersFrame.ScaleBy(Screen.PixelsPerInch, DESIGN_RESOLUTION);

  //load ini settings before calling FileFrame.Setup ...
  LoadOptionsFromIni;
  TFilesFrame(FilesFrame).Setup;
  TFoldersFrame(FoldersFrame).Setup;

  Statusbar1.Panels[2].Text := #150;

  application.helpfile := changefileext(ParamStr(0), '.hlp');
  if paramcount = 2 then
  begin
    //load files or folders from the commandline ...
    if directoryExists(paramstr(1)) then
      with TFoldersFrame(FoldersFrame) do
      begin
        mnuFolderClick(nil);
        DoOpenFolder(paramstr(1), true);
        DoOpenFolder(paramstr(2), false);
      end
    else
      with TFilesFrame(FilesFrame) do
      begin
        mnuFolder.Down := true; //trick the toggle
        mnuFolderClick(nil);
        DoOpenFile(paramstr(1), true);
        DoOpenFile(paramstr(2), false);
      end;
    mnuCompare.Click;
  end
  //nb: FoldersFrame.Visible set in LoadOptionsFromIni ...
  else if FoldersFrame.Visible then mnuFolderClick(nil)
  else TFilesFrame(FilesFrame).SetMenuEventsToFileView;

end;



procedure TDiffMainFrm.FormDestroy(Sender: TObject);
begin
  TFilesFrame(FilesFrame).Cleanup;
  TFoldersFrame(FoldersFrame).Cleanup;
end;

procedure TDiffMainFrm.mnuFolderClick(Sender: TObject);
begin
//  mnuFolder.down := not mnuFolder.down;

  if mnuFolder.down then
  begin
    TFoldersFrame(FoldersFrame).Visible := true;
    TFilesFrame(FilesFrame).Visible := false;
    TFoldersFrame(FoldersFrame).SetMenuEventsToFolderView;
  end else
  begin
    TFilesFrame(FilesFrame).Visible := true;
    TFoldersFrame(FoldersFrame).Visible := false;
    TFilesFrame(FilesFrame).SetMenuEventsToFileView;
  end;
end;

procedure TDiffMainFrm.LoadOptionsFromIni;
var
  l,t,w,h: integer;
begin
  with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  try
    l := ReadInteger('Diff Options','Bounds.Left', 0);
    t := ReadInteger('Diff Options','Bounds.Top', 0);
    w := ReadInteger('Diff Options','Bounds.Width', -1);
    h := ReadInteger('Diff Options','Bounds.Height', -1);
    //set (Add, Del, Mod) colors...
    addClr := strtointdef(ReadString('Diff Options','AddColor', ''),$F0CCA8);
    modClr := strtointdef(ReadString('Diff Options','ModColor', ''),$6FFB8A);
    delClr := strtointdef(ReadString('Diff Options','DelColor', ''),$BB77FF);

    with TFilesFrame(FilesFrame).FontDialog1.Font do
    begin
      Name := ReadString('Diff Options','Font.Name', 'Courier New');
      Size := ReadInteger('Diff Options','Font.size', 10);
    end;

    if ReadBool('Diff Options','Horizontal',false) then mnuHorzSplit.Down := true;

    LastOpenedFolder1 := ReadString('Diff Options','Folder.1', '');
    LastOpenedFolder2 := ReadString('Diff Options','Folder.2', '');
    FoldersFrame.Visible := ReadBool('Diff Options','FolderView', false);
  finally
    free;
  end;
  //make sure the form is positioned on screen ...
  //ie: make sure nobody's done something silly with the INI file!
  if (w > 0) and (h > 0) and (l < screen.Width) and (t < screen.Height) and
      (l+w > 0) and (t+h > 0) then
    setbounds(l,t,w,h) else
    Position := poScreenCenter;
end;
//---------------------------------------------------------------------

procedure TDiffMainFrm.SaveOptionsToIni;
begin
  with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  try
    if windowState = wsNormal then
    begin
      WriteInteger('Diff Options','Bounds.Left', self.Left);
      WriteInteger('Diff Options','Bounds.Top', self.Top);
      WriteInteger('Diff Options','Bounds.Width', self.Width);
      WriteInteger('Diff Options','Bounds.Height', self.Height);
    end;
    WriteString('Diff Options','AddColor', '$'+inttohex(addClr,8));
    WriteString('Diff Options','ModColor', '$'+inttohex(modClr,8));
    WriteString('Diff Options','DelColor', '$'+inttohex(delClr,8));
    with TFilesFrame(FilesFrame).FontDialog1.Font do
    begin
      WriteString('Diff Options','Font.Name', name);
      WriteInteger('Diff Options','Font.size', Size);
    end;
    WriteBool('Diff Options','Horizontal', mnuHorzSplit.Down);
    WriteString('Diff Options','Folder.1', LastOpenedFolder1);
    WriteString('Diff Options','Folder.2', LastOpenedFolder2);
    WriteBool('Diff Options','FolderView', FoldersFrame.Visible);
  finally
    free;
  end;
end;  

procedure TDiffMainFrm.mnuExitClick(Sender: TObject);
begin
  close;
end;

procedure TDiffMainFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveOptionsToIni;
  with MainFrm.dxBarListWindows.Items do
       Delete(IndexOfObject(Self));
  Action := caFree;     
end;

procedure TDiffMainFrm.mnuIgnoreBlanksClick(Sender: TObject);
begin
//  mnuIgnoreBlanks.Down := not mnuIgnoreBlanks.Down;
end;

procedure TDiffMainFrm.mnuIgnoreCaseClick(Sender: TObject);
begin
//  mnuIgnoreCase.Down := not mnuIgnoreCase.Down;
end;

procedure TDiffMainFrm.mnuShowDiffsOnlyClick(Sender: TObject);
begin
//  mnuShowDiffsOnly.Down := not mnuShowDiffsOnly.Down;
  //if files have already been compared then refresh the changes
  with TFilesFrame(FilesFrame) do
    if FilesCompared then DisplayDiffs;
end;

procedure TDiffMainFrm.Added1Click(Sender: TObject);
begin
  with ColorDialog1 do
  begin
    color := addClr;
    if not execute then exit;
    addClr := color;
  end;
  StatusBar1.Repaint;
end;

procedure TDiffMainFrm.Modified1Click(Sender: TObject);
begin
  with ColorDialog1 do
  begin
    color := modClr;
    if not execute then exit;
    modClr := color;
  end;
  StatusBar1.Repaint;
end;

procedure TDiffMainFrm.Deleted1Click(Sender: TObject);
begin
  with ColorDialog1 do
  begin
    color := delClr;
    if not execute then exit;
    delClr := color;
  end;
  StatusBar1.Repaint;
end;

procedure TDiffMainFrm.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  case Panel.Index of
    0: StatusBar1.Canvas.Brush.Color := addClr;
    1: StatusBar1.Canvas.Brush.Color := modClr;
    2: StatusBar1.Canvas.Brush.Color := delClr;
  else exit;
  end;
  StatusBar1.Canvas.FillRect(Rect);
  StatusBar1.Canvas.TextOut(Rect.Left+4,Rect.Top,Panel.Text);
end;

end.
