unit frmProcedureEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxGraphics, dxStatusBar, cxSplitter, cxListView,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, cxRichEdit, dxBar,
  ExtCtrls, OraProcSource, OraBarConn, frmProcedureDetail, StdCtrls,RichEdit,
  ora, oraStorage, cxPC;

type
  TProcedureEditorFrm = class(TForm)
    bottomPanel: TPanel;
    lviewError: TcxListView;
    cxSplitter2: TcxSplitter;
    dxBarManager1: TdxBarManager;
    btnSaveQuery: TdxBarButton;
    btnCompile: TdxBarButton;
    btnNewQuery: TdxBarButton;
    btnOpenQuery: TdxBarButton;
    btnUndo: TdxBarButton;
    btnRedo: TdxBarButton;
    btnFindText: TdxBarButton;
    btnAlignLeft: TdxBarButton;
    btnAlignCenter: TdxBarButton;
    btnAlignRight: TdxBarButton;
    btnCut: TdxBarButton;
    btnCopy: TdxBarButton;
    btnPaste: TdxBarButton;
    btnClear: TdxBarButton;
    btnSelectAll: TdxBarButton;
    btnReplace: TdxBarButton;
    dxBarDockControl1: TdxBarDockControl;
    OpenDialog: TOpenDialog;
    editorStatusBar: TdxStatusBar;
    SaveDialog: TSaveDialog;
    ReplaceDialog: TReplaceDialog;
    FindDialog: TFindDialog;
    bbtnRun: TdxBarButton;
    pc: TcxPageControl;
    tsSource: TcxTabSheet;
    tsBody: TcxTabSheet;
    SQLEditorSource: TRichEdit;
    SQLEditorBody: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewQueryClick(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnSaveQueryClick(Sender: TObject);
    procedure SQLEditorSourceChange(Sender: TObject);
    procedure SQLEditorSourceSelectionChange(Sender: TObject);
    procedure btnUndoClick(Sender: TObject);
    procedure btnRedoClick(Sender: TObject);
    procedure btnCutClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnPasteClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnFindTextClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure btnAlignLeftClick(Sender: TObject);
    procedure FindDialogFind(Sender: TObject);
    procedure ReplaceDialogFind(Sender: TObject);
    procedure btnCompileClick(Sender: TObject);
    procedure bbtnRunClick(Sender: TObject);
    procedure pcChange(Sender: TObject);
  private
    { Private declarations }
    FProcSource: TProcSource;

    procedure NewProcSource;
    procedure SetErrorStatus;
    function GetSQLEditor: TRichEdit;
    function GetSQLEditorCol: Integer;
    function GetSQLEditorRow: Integer;
    
    property SQLEditorCol: Integer read GetSQLEditorCol;
    property SQLEditorRow: Integer read GetSQLEditorRow;
    property SQLEditor: TRichEdit read GetSQLEditor;
  public
    { Public declarations }
    procedure Init(ProcSource : TProcSource);
  end;

var
  ProcedureEditorFrm: TProcedureEditorFrm;

implementation

uses frmMain, util, frmProcedureRun, VisualOptions, GenelDM;

{$R *.dfm}

procedure TProcedureEditorFrm.Init(ProcSource : TProcSource);
begin
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  Caption := ProcSource.OraSession.Server+'/'+ProcSource.OraSession.UserName+' - '+'Procedure Editor' +' ('+ProcSource.SOURCE_NAME+')';
  editorStatusBar.Panels[0].Text := ProcSource.OraSession.Server+'/'+ProcSource.OraSession.UserName;
  MainFrm.dxBarListWindows.Items.AddObject(Caption, Self);

  FProcSource := TProcSource.Create;
  FProcSource := ProcSource;

  tsBody.TabVisible := FProcSource.SOURCE_TYPE = stPackage;

  if FProcSource.Mode = InsertMode then
  begin
    SQLEditorSource.Text := FProcSource.GetDefaultDDL;
    if FProcSource.SOURCE_TYPE = stPackage then
       SQLEditorBody.Text := FProcSource.GetDefaultBodyDDL;
    SQLEditor.Modified := True;
  end else
  begin
    FProcSource.SetDDL;
    SQLEditorSource.Text := FProcSource.GetDDL;
    if FProcSource.SOURCE_TYPE = stPackage then
       SQLEditorBody.Text := FProcSource.GetBodyDDL;
    SQLEditor.Modified := false;
  end;

  SetErrorStatus;
  Show;
end;

procedure TProcedureEditorFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  answer: word;
begin
  if SQLEditor.Modified then
  begin
    answer := MessageDlg('Would you like to save your changes to '+FProcSource.OWNER+'.'+FProcSource.SOURCE_NAME+' ?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if answer =  mrYes then btnCompile.Click;
    //if answer =  mrNo then
    if answer =  mrCancel then abort;
  end;

  with MainFrm.dxBarListWindows.Items do
       Delete(IndexOfObject(Self));

  action := caFree;
end;

{****************************  PROCEDURE EVENT *********************************}

procedure TProcedureEditorFrm.btnNewQueryClick(Sender: TObject);
var
  answer: word;
begin
  if SQLEditor.Modified then
  begin
    answer := MessageDlg('Would you like to save your changes to '+FProcSource.OWNER+'.'+FProcSource.SOURCE_NAME+' ?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if answer =  mrYes then btnCompile.Click;
    if answer =  mrNo then NewProcSource;
    if answer =  mrCancel then abort;
  end;
end;

procedure TProcedureEditorFrm.NewProcSource;
begin
  FProcSource := ProcedureDetailFrm.Init(FProcSource);
  SQLEditorSource.Text := FProcSource.GetDDL;

  if FProcSource.SOURCE_TYPE = stPackage then
     SQLEditorBody.Text := FProcSource.GetDefaultBodyDDL;
end;

procedure TProcedureEditorFrm.btnOpenQueryClick(Sender: TObject);
begin
  OpenDialog.FileName := '';
  if OpenDialog.Execute then
  begin
    btnNewQuery.Click;
    SQLEditor.Lines.LoadFromFile(OpenDialog.FileName);
    Caption := FProcSource.OraSession.Server+'/'+FProcSource.OraSession.UserName+' - '+'Procedure Editor' +' ('+OpenDialog.FileName+')';
    with MainFrm.dxBarListWindows do
         Items[Items.IndexOfObject(Self)] := Self.Caption ;
    editorStatusBar.Panels[2].Text := 'Modified';
  end;
end;

procedure TProcedureEditorFrm.btnSaveQueryClick(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    SQLEditor.Lines.SaveToFile(SaveDialog.FileName);
    Caption := FProcSource.OraSession.Server+'/'+FProcSource.OraSession.Username+' - '+'Procedure Editor' +' ('+SaveDialog.FileName+')';
    with MainFrm.dxBarListWindows do
         Items[Items.IndexOfObject(Self)] := Self.Caption ;
    editorStatusBar.Panels[2].Text := '';
  end;
end;

function TProcedureEditorFrm.GetSQLEditor: TRichEdit;
begin
  if pc.ActivePage = tsSource then
     result := SQLEditorSource
  else
     result := SQLEditorBody;
end;

function TProcedureEditorFrm.GetSQLEditorCol: Integer;
begin
  with SQLEditor do
    Result := SelStart - SendMessage(Handle, EM_LINEINDEX, SQLEditorRow, 0);
end;

function TProcedureEditorFrm.GetSQLEditorRow: Integer;
begin
  with SQLEditor do
    Result := SendMessage(Handle, EM_LINEFROMCHAR, SelStart, 0);
end;

procedure TProcedureEditorFrm.SQLEditorSourceChange(Sender: TObject);
begin
  if FProcSource = nil then exit;
  SQLEditor.OnSelectionChange(SQLEditor);
  TdxStatusBarTextPanelStyle(editorStatusBar.Panels[1].PanelStyle).ImageIndex := 0;
  TdxStatusBarTextPanelStyle(editorStatusBar.Panels[0].PanelStyle).ImageIndex := 2;
  btnUndo.Enabled := SendMessage(SQLEditor.Handle, EM_CANUNDO, 0, 0) <> 0;
  btnRedo.Enabled := SendMessage(SQLEditor.Handle, EM_CANREDO, 0, 0) <> 0;
  if SQLEditor.Text = FProcSource.CODE then
     editorStatusBar.Panels[2].Text := ''
  else
     editorStatusBar.Panels[2].Text := 'Modified';
end;

procedure TProcedureEditorFrm.SQLEditorSourceSelectionChange(Sender: TObject);
begin
  with SQLEditor do
  begin
    //FEditorUpdating := True;
    try
       editorStatusBar.Panels[1].Text := Format('Line: %3d   Col: %3d', [1 + SQLEditorRow, 1 + SQLEditorCol]);
       btnCopy.Enabled := SelLength > 0;
       btnCut.Enabled := btnCopy.Enabled;
       btnPaste.Enabled := SendMessage(SQLEditor.Handle, EM_CANPASTE, 0, 0) <> 0;
       btnClear.Enabled := btnCopy.Enabled;
       btnCompile.Enabled := Lines.Text <> '';

       case Ord(Paragraph.Alignment) of
         0: btnAlignLeft.Down := True;
         1: btnAlignRight.Down := True;
         2: btnAlignCenter.Down := True;
       end;

    finally
      //FEditorUpdating := False;
    end;
  end;
end;

procedure TProcedureEditorFrm.btnUndoClick(Sender: TObject);
begin
  SendMessage(SQLEditor.Handle, EM_UNDO, 0, 0);
end;

procedure TProcedureEditorFrm.btnRedoClick(Sender: TObject);
begin
  SendMessage(SQLEditor.Handle, EM_REDO, 0, 0);
end;

procedure TProcedureEditorFrm.btnCutClick(Sender: TObject);
begin
  SQLEditor.CutToClipboard;
end;

procedure TProcedureEditorFrm.btnCopyClick(Sender: TObject);
begin
  SQLEditor.CopyToClipboard;
end;

procedure TProcedureEditorFrm.btnPasteClick(Sender: TObject);
begin
  SQLEditor.PasteFromClipboard;
end;

procedure TProcedureEditorFrm.btnClearClick(Sender: TObject);
begin
  SQLEditor.ClearSelection;
end;

procedure TProcedureEditorFrm.btnSelectAllClick(Sender: TObject);
begin
  SQLEditor.SelectAll;
end;

procedure TProcedureEditorFrm.btnFindTextClick(Sender: TObject);
begin
  SQLEditor.SelLength := 0;
  FindDialog.Execute;
end;

procedure TProcedureEditorFrm.btnReplaceClick(Sender: TObject);
begin
  SQLEditor.SelLength := 0;
  ReplaceDialog.Execute;
end;

procedure TProcedureEditorFrm.btnAlignLeftClick(Sender: TObject);
begin
  if TdxBarButton(Sender).Down then
    SQLEditor.Paragraph.Alignment := TAlignment(TdxBarButton(Sender).Tag)
  else
    SQLEditor.Paragraph.Alignment := taLeftJustify;
end;

procedure TProcedureEditorFrm.FindDialogFind(Sender: TObject);
var
  StartPos, FindLength, FoundAt: Integer;
  Flags: TSearchTypes;
  P: TPoint;
  CaretR, R, IntersectR: TRect;
begin
  with SQLEditor, TFindDialog(Sender) do
  begin
    if frDown in Options then
    begin
      if SelLength = 0 then StartPos := SelStart
      else StartPos := SelStart + SelLength;
      FindLength := Length(Text) - StartPos;
    end
    else
    begin
      StartPos := SelStart;
      FindLength := -StartPos;
    end;
    Flags := [];
    if frMatchCase in Options then Include(Flags, stMatchCase);
    if frWholeWord in Options then Include(Flags, stWholeWord);
    Screen.Cursor := crHourglass;
    FoundAt := SQLEditor.FindText(FindText, StartPos, FindLength, Flags);
    if not (frReplaceAll in Options) then Screen.Cursor := crDefault;
    if FoundAt > -1 then
      if frReplaceAll in Options then
      begin
        SelStart := FoundAt;
        SelLength := Length(FindText);
      end
      else
      begin
        SetFocus;
        SelStart := FoundAt;
        SelLength := Length(FindText);

        GetCaretPos(P);
        P := ClientToScreen(P);
        CaretR := Rect(P.X, P.Y, P.X + 2, P.Y + 20);
        GetWindowRect(Handle, R);
        if IntersectRect(IntersectR, CaretR, R) then
          if P.Y < Screen.Height div 2 then
            Top := P.Y + 40
          else
            Top := P.Y - (R.Bottom - R.Top + 20);
      end
    else
      if not (frReplaceAll in Options) then
        Application.MessageBox('The search text is not found.',
          'Information', MB_ICONINFORMATION);
  end;
end;

procedure TProcedureEditorFrm.ReplaceDialogFind(Sender: TObject);
var
  ReplacedCount, OldSelStart, PrevSelStart: Integer;
  S: string;
begin
  with SQLEditor, TReplaceDialog(Sender) do
  begin
    ReplacedCount := 0;
    OldSelStart := SelStart;
    if frReplaceAll in Options then
      Screen.Cursor := crHourglass;
    repeat
      if (SelLength > 0) and ((SelText = FindText) or
        (not (frMatchCase in Options) and
         (AnsiUpperCase(SelText) = AnsiUpperCase(FindText)))) then
      begin
        SelText := ReplaceText;
        Inc(ReplacedCount);
      end;
      PrevSelStart := SelStart;
      FindDialogFind(Sender);
    until not (frReplaceAll in Options) or (SelStart = PrevSelStart);
    if frReplaceAll in Options then
    begin
      Screen.Cursor := crDefault;
      if ReplacedCount = 0 then S := 'The search text is not found.'
      else
      begin
        SelStart := OldSelStart;
        S := Format('Replaced %d occurances.', [ReplacedCount]);
      end;
      Application.MessageBox(PChar(S), 'Information',
        MB_ICONINFORMATION);
    end;
  end;
end;

{****************************  PROCEDURE EVENT *********************************}

procedure TProcedureEditorFrm.btnCompileClick(Sender: TObject);
var
  isValid: boolean;
begin
  if SQLEditor.Text = '' then exit;
  FProcSource.CODE := SQLEditorSource.Text;

  if FProcSource.SOURCE_TYPE = stPackage then
     FProcSource.BODY_CODE := SQLEditorBody.Text;

  isValid := FProcSource.AlterSource(FProcSource.CODE);

  if (isValid) and (FProcSource.SOURCE_TYPE = stPackage) then
      isValid := FProcSource.AlterSource(FProcSource.BODY_CODE);

  SetErrorStatus;
  SQLEditor.Modified := false;
  editorStatusBar.Panels[2].Text := '';
  if not isValid then editorStatusBar.Panels[3].Text := 'Invalid';
end;

procedure TProcedureEditorFrm.SetErrorStatus;
begin
  lviewError.Items.Clear;

  if pc.ActivePage = tsSource then
  begin
    FillViewHorizontal(FProcSource.SourceErrors, lviewError);
    if FProcSource.SourceErrors.RecordCount = 0 then
       editorStatusBar.Panels[3].Text := 'Valid'
    else
       editorStatusBar.Panels[3].Text := 'Invalid';
  end;

  if pc.ActivePage = tsBody  then
  begin
    FillViewHorizontal(FProcSource.SourceBodyErrors, lviewError);
    if FProcSource.SourceBodyErrors.RecordCount = 0 then
       editorStatusBar.Panels[3].Text := 'Valid'
    else
       editorStatusBar.Panels[3].Text := 'Invalid';
  end;
end;

procedure TProcedureEditorFrm.bbtnRunClick(Sender: TObject);
begin
  ProcedureRunFrm.Init(FProcSource);
end;

procedure TProcedureEditorFrm.pcChange(Sender: TObject);
begin
  SetErrorStatus;
end;

end.
