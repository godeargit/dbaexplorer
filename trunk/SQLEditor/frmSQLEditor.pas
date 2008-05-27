{
	DBAExplorer - Oracle Admin Management Tool
    Copyright (C) 2008  Alpaslan KILICKAYA

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit frmSQLEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ComCtrls, cxGridCardView,
  cxEditRepositoryItems, ImgList, dxBar, ExtCtrls, dxDockControl,
  cxListView, cxMemo, cxRichEdit, cxDBRichEdit, cxGridLevel,
  cxGridCustomTableView, cxGridDBCardView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxPC, cxInplaceContainer, cxSplitter,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, StdCtrls, cxContainer, cxGroupBox, dxStatusBar,
  dxDockPanel, VirtualTable, RichEdit,
  GenelDM,
  OraQueryThread, Util, OraScripts, OraBarConn, DBQuery, OraScript,
  cxProgressBar;  

type
  TSQLEditorFrm = class(TForm)
    dsHost: TdxDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dpObjectPalet: TdxDockPanel;
    dpSQLRecallList: TdxDockPanel;
    dpOutput: TdxDockPanel;
    dxDockingManager1: TdxDockingManager;
    TimerConnected: TTimer;
    dxBarManager1: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    DockObjectsPanel: TdxDockPanel;
    dxLayoutDockSite3: TdxLayoutDockSite;
    cxGroupBox1: TcxGroupBox;
    Label4: TLabel;
    lcbObjectUserName: TcxLookupComboBox;
    pcSQLEditor: TcxPageControl;
    dxBarDockControl2: TdxBarDockControl;
    btnNewQuery: TdxBarButton;
    btnSaveQuery: TdxBarButton;
    btnExecute: TdxBarButton;
    btnOpenQuery: TdxBarButton;
    btnCommit: TdxBarButton;
    btnRollback: TdxBarButton;
    btnFindText: TdxBarButton;
    btnExplainPlan: TdxBarButton;
    btnNextSQL: TdxBarButton;
    btnPriorSQL: TdxBarButton;
    btnQueryBuilder: TdxBarButton;
    btnUndo: TdxBarButton;
    btnRedo: TdxBarButton;
    btnDeleteQuery: TdxBarButton;
    btnBullet: TdxBarButton;
    btnAlignLeft: TdxBarButton;
    SQLEditorPopupMenu: TdxBarPopupMenu;
    editorStatusBar: TdxStatusBar;
    ilStatusBarImages: TImageList;
    btnAlignCenter: TdxBarButton;
    btnAlignRight: TdxBarButton;
    btnPrint: TdxBarButton;
    btnCut: TdxBarButton;
    btnCopy: TdxBarButton;
    btnPaste: TdxBarButton;
    btnClear: TdxBarButton;
    btnSelectAll: TdxBarButton;
    btnReplace: TdxBarButton;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    FindDialog: TFindDialog;
    ReplaceDialog: TReplaceDialog;
    OpenDialog: TOpenDialog;
    btnStop: TdxBarButton;
    lvOutput: TcxListView;
    dxBarDockControl3: TdxBarDockControl;
    btnObjectRefresh: TdxBarButton;
    btnObjectFilter: TdxBarButton;
    btnObjectShowColumns: TdxBarButton;
    ds: TDataSource;
    cxSplitter2: TcxSplitter;
    tlObjectBrowser: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    tlObjectColumns: TcxTreeList;
    cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    edtObjectFilter: TdxBarEdit;
    btnUnIndent: TdxBarButton;
    btnIndent: TdxBarButton;
    btnSQLRecallSave: TdxBarButton;
    btnSQLRecallOpen: TdxBarButton;
    btnSQLRecallToSQLEditor: TdxBarButton;
    btnSQLRecallFirst: TdxBarButton;
    btnSQLRecallPrior: TdxBarButton;
    btnSQLRecallNext: TdxBarButton;
    btnSQLRecallLast: TdxBarButton;
    edtSQLRecallFilter: TdxBarEdit;
    btnSQLRecallDelete: TdxBarButton;
    cxEditRepository: TcxEditRepository;
    cxEditRepositoryBlobItem1: TcxEditRepositoryBlobItem;
    cxEditRepositoryMemoItem1: TcxEditRepositoryMemoItem;
    StyleRepository: TcxStyleRepository;
    styleSelection: TcxStyle;
    styleCardHeader: TcxStyle;
    styleCardBorder: TcxStyle;
    styleBackground: TcxStyle;
    styleCategoryRow: TcxStyle;
    stylePrice: TcxStyle;
    CardsStyleSheet: TcxGridCardViewStyleSheet;
    pcSQLRecall: TcxPageControl;
    tsAllSQL: TcxTabSheet;
    tsSingleSQL: TcxTabSheet;
    gridSQLRecall: TcxGrid;
    gridSQLRecallDB: TcxGridDBCardView;
    gridSQLRecallDBLAST_EXEC: TcxGridDBCardViewRow;
    gridSQLRecallDBCONNECTION: TcxGridDBCardViewRow;
    gridSQLRecallDBHISTORY_ID: TcxGridDBCardViewRow;
    gridSQLRecallDBSQL: TcxGridDBCardViewRow;
    gridSQLRecallLevel2: TcxGridLevel;
    redtSQLRecall: TcxDBRichEdit;
    dxBarButton1: TdxBarButton;
    btnSQLRecalType: TdxBarButton;
    dxLayoutDockSite4: TdxLayoutDockSite;
    btnSQLRecallRefresh: TdxBarButton;
    editorStatusBarContainer5: TdxStatusBarContainerControl;
    progressQueryRunning: TcxProgressBar;
    timerQueryRunning: TTimer;
    procedure TimerConnectedTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnNewQueryClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecuteClick(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnDeleteQueryClick(Sender: TObject);
    procedure btnSaveQueryClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
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
    procedure ReplaceDialogReplace(Sender: TObject);
    procedure btnPriorSQLClick(Sender: TObject);
    procedure btnNextSQLClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnRollbackClick(Sender: TObject);
    procedure btnObjectRefreshClick(Sender: TObject);
    procedure tlObjectBrowserCanSelectNode(Sender: TObject;
      ANode: TcxTreeListNode; var Allow: Boolean);
    procedure btnObjectShowColumnsClick(Sender: TObject);
    procedure edtObjectFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnUnIndentClick(Sender: TObject);
    procedure btnIndentClick(Sender: TObject);
    procedure btnSQLRecallSaveClick(Sender: TObject);
    procedure btnSQLRecallOpenClick(Sender: TObject);
    procedure btnSQLRecallFirstClick(Sender: TObject);
    procedure btnSQLRecallPriorClick(Sender: TObject);
    procedure btnSQLRecallNextClick(Sender: TObject);
    procedure btnSQLRecallLastClick(Sender: TObject);
    procedure btnSQLRecalTypeClick(Sender: TObject);
    procedure edtSQLRecallFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSQLRecallToSQLEditorClick(Sender: TObject);
    procedure btnSQLRecallDeleteClick(Sender: TObject);
    procedure btnExplainPlanClick(Sender: TObject);
    procedure timerQueryRunningTimer(Sender: TObject);
  private
    { Private declarations }
    FBarConnection : TBarConnection;
    FBarConnName   : string;
    time_connected : Integer;
    FEditorUpdating: Boolean;

    function GetSQLFrame: Tform;
    function GetSQLEditor: TRichEdit;
    function GetSQLEditorCol: Integer;
    function GetSQLEditorRow: Integer;
    function GetSQLEditorFileName: string;
    procedure SetSQLEditorFileName(Value: string);
    procedure RulerToIndent(IsRight: Boolean);

    procedure ObjectBrowserRefresh;

  public
    { Public declarations }
    procedure Init(ABarConnection : TBarConnection);
    property BarConnName: String read FBarConnName write FBarConnName;
    procedure AddHistory(SQL: string);

    procedure EditorSelectionChange(Sender: TObject);
    procedure EditorChange(Sender: TObject);
    procedure EditorDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure EditorDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure EditorStartDrag(Sender: TObject;var DragObject: TDragObject);
    procedure EditorEndDrag(Sender, Target: TObject; X, Y: Integer);

    function CharPosInRichEdit(aRichEdit: TRichEdit; X, Y: integer): integer;
    function SaveFile(ASaveAs: Boolean): Boolean;
    procedure SetModified(Value: Boolean);
    procedure SetRecToStatusBar(RecordCount, RecNo: integer; msg: string; LastExecuteTime: String; IsSelect: boolean);
    procedure LogSQL(msg: string = '');

    procedure QueryRunning(Run: Boolean);
    property SQLFrame: TForm read GetSQLFrame;
    property SQLEditor: TRichEdit read GetSQLEditor;
    property SQLEditorCol: Integer read GetSQLEditorCol;
    property SQLEditorRow: Integer read GetSQLEditorRow;
    property SQLEditorFileName: string read GetSQLEditorFileName write SetSQLEditorFileName;


  end;

var
  SQLEditorFrm: TSQLEditorFrm;

implementation

uses frmMain, frmSQLEditorFrame, frmBaseform,
     StrUtils, OraTable, OraStorage, OraView, VisualOptions;

const
  RulerAdj = 4/3;
  GutterWid = 6;

{$R *.dfm}

procedure TSQLEditorFrm.Init(ABarConnection : TBarConnection);
begin
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FBarConnection := ABarConnection;
  FBarConnName   := ABarConnection.Name;
  Caption := FBarConnection.Session.Server+'/'+FBarConnection.Session.UserName+' - '+'SQL Editor';
  MainFrm.dxBarListWindows.Items.AddObject(Caption, Self);
  if pcSQLEditor.PageCount = 0 then btnNewQueryClick(self);
  dmGenel.ReLoad(FBarConnection.Session);
  lcbObjectUserName.Text := FBarConnection.Session.UserName;
  QueryRunning(False);
  ObjectBrowserRefresh;
end;

procedure TSQLEditorFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  mainfrm.FormDelete(FBarConnection);

  with MainFrm.dxBarListWindows.Items do
       Delete(IndexOfObject(Self));

  dmGenel.SaveHistory('');
  action := caFree;
end;

procedure TSQLEditorFrm.FormActivate(Sender: TObject);
begin
  TimerConnected.OnTimer(self);

  if mainfrm.ActiveMDIChild = self then
    mainfrm.ShowConnButton(FBarConnection);
end;


procedure TSQLEditorFrm.TimerConnectedTimer(Sender: TObject);
var
  hours, minutes, seconds : Integer;
begin
  inc(time_connected); 
  if mainfrm.ActiveMDIChild = self then
  begin
    seconds := time_connected mod (60*60*24);
    hours := seconds div (60*60);
    seconds := seconds mod (60*60);
    minutes := seconds div 60;
    seconds := seconds mod 60;
    mainfrm.showstatus( format('Connected: %.2d:%.2d:%.2d', [hours, minutes, seconds]), 1 );
  end;
end;


procedure TSQLEditorFrm.btnNewQueryClick(Sender: TObject);
var
  FTab : TcxTabSheet;
begin
  FTab := TcxTabSheet.Create(pcSQLEditor);
  FTab.Caption := '<No name>';
  FTab.PageControl := pcSQLEditor;
  pcSQLEditor.ActivePageIndex := FTab.PageIndex;

  with TSQLEditorFrameFrm.Create(FTab) do
  begin
    ParentForm := self;
    setEditorAttributes;
    borderstyle := bsNone;
    parent := FTab;
    caption := FTab.Caption;
    align := alclient;
    show;

    Init(FBarConnection);
  end;
  LogSQL('New Connection');
end;

procedure TSQLEditorFrm.LogSQL(msg: string = '');
begin
  with lvOutPut.Items.Add do
  begin
    Caption := FBarConnection.Session.Server +' / '+ FBarConnection.Session.Username;
    ImageIndex := -1;
  end;
  lvOutPut.Items[lvOutPut.Items.count-1].SubItems.Add(TimeToStr(Now));
  lvOutPut.Items[lvOutPut.Items.count-1].SubItems.Add(msg);
end;

procedure TSQLEditorFrm.QueryRunning(Run: Boolean);
begin
  progressQueryRunning.Properties.PeakValue := 0;
  progressQueryRunning.Properties.ShowPeak := Run;
  timerQueryRunning.Enabled := Run;
  btnStop.Enabled := Run;
  btnExecute.Enabled := not Run;
end;

procedure TSQLEditorFrm.timerQueryRunningTimer(Sender: TObject);
begin
  if progressQueryRunning.Properties.PeakValue = 0 then progressQueryRunning.Tag := 0;
  if progressQueryRunning.Properties.PeakValue = 10 then progressQueryRunning.Tag := 10;
  if progressQueryRunning.Tag = 0 then
     progressQueryRunning.Properties.PeakValue := progressQueryRunning.Properties.PeakValue + 1;
  if progressQueryRunning.Tag = 10 then
     progressQueryRunning.Properties.PeakValue := progressQueryRunning.Properties.PeakValue - 1;
end;

{****************************  EDITOR OPTIONS *********************************}

function TSQLEditorFrm.GetSQLFrame: TForm;
var
  i: integer;
begin
  Result := nil;
  if pcSQLEditor.ActivePage = nil then Result := nil
  else
  for i := 0 to pcSQLEditor.ActivePage.ComponentCount -1 do
    if TForm(pcSQLEditor.ActivePage.Components[i]) is TSQLEditorFrameFrm then
    begin
       result := TSQLEditorFrameFrm(pcSQLEditor.ActivePage.Components[i]);
       break;
    end;
end;

function TSQLEditorFrm.GetSQLEditor: TRichEdit;
var
  i: integer;
begin
  Result := nil;
  if pcSQLEditor.ActivePage = nil then result := nil
  else
  for i := 0 to pcSQLEditor.ActivePage.ComponentCount -1 do
    if TForm(pcSQLEditor.ActivePage.Components[i]) is TSQLEditorFrameFrm then
    begin
       result := TSQLEditorFrameFrm(pcSQLEditor.ActivePage.Components[i]).SQLEditor;
       break;
    end;
end;

procedure TSQLEditorFrm.EditorChange(Sender: TObject);
begin
  if SQLEditor = nil then Exit;
  SQLEditor.OnSelectionChange(SQLEditor);
  SetModified(SQLEditor.Modified);
  TdxStatusBarTextPanelStyle(editorStatusBar.Panels[1].PanelStyle).ImageIndex := 0;
  TdxStatusBarTextPanelStyle(editorStatusBar.Panels[0].PanelStyle).ImageIndex := 2;
  btnUndo.Enabled := SendMessage(SQLEditor.Handle, EM_CANUNDO, 0, 0) <> 0;
  btnRedo.Enabled := SendMessage(SQLEditor.Handle, EM_CANREDO, 0, 0) <> 0;
end;

procedure TSQLEditorFrm.EditorSelectionChange(Sender: TObject);
begin
  with SQLEditor do
  begin
    FEditorUpdating := True;
    try
       editorStatusBar.Panels[0].Text := Format('Line: %3d   Col: %3d', [1 + SQLEditorRow, 1 + SQLEditorCol]);
       btnCopy.Enabled := SelLength > 0;
       btnCut.Enabled := btnCopy.Enabled;
       btnPaste.Enabled := SendMessage(SQLEditor.Handle, EM_CANPASTE, 0, 0) <> 0;
       btnClear.Enabled := btnCopy.Enabled;
       btnExecute.Enabled := Lines.Text <> '';
       btnPriorSQL.Enabled := not (TSQLEditorFrameFrm(SQLFrame).LocalHistory.RecNo = 1);
       btnNextSQL.Enabled := not TSQLEditorFrameFrm(SQLFrame).LocalHistory.Eof;

       case Ord(Paragraph.Alignment) of
         0: btnAlignLeft.Down := True;
         1: btnAlignRight.Down := True;
         2: btnAlignCenter.Down := True;
       end;

    finally
      FEditorUpdating := False;
    end;
  end;
end;

procedure TSQLEditorFrm.EditorDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  P: TPoint;
begin
  Accept := (source = tlObjectBrowser)
            or (source = tlObjectColumns)
            or (TcxGridSite(TDragControlObject(Source).Control).GridView = gridSQLRecallDB);
  if Accept = false then exit;
  if GetCursorPos(P) then
    with SQLEditor do
    begin
      P := ScreenToClient(P);
      SelStart := CharPosInRichEdit(SQLEditor, P.X, P.Y);
      SetFocus;
    end;
end;

procedure TSQLEditorFrm.EditorDragDrop(Sender, Source: TObject; X, Y: Integer);
var
 i: integer;
 ANode: TcxTreeListNode;
 s: string;
begin
  s:= '';
  if Source = tlObjectBrowser then
  begin
     for i := 0 to tlObjectBrowser.SelectionCount -1  do
     begin
        ANode := tlObjectBrowser.Selections[i];
        if not ANode.HasChildren then
        begin
           s := s + ANode.Texts[0];
           if i <> tlObjectBrowser.SelectionCount -1 then  s := s +', ';
        end;
     end;
  end else
  if Source = tlObjectColumns then
  begin
     for i := 0 to tlObjectColumns.SelectionCount -1  do
     begin
        ANode := tlObjectColumns.Selections[i];
        if not ANode.HasChildren then
        begin
           s := s + ANode.Texts[0];
           if i <> tlObjectColumns.SelectionCount -1 then  s := s +', ';
        end;
     end;
  end else
  if (TcxGridSite(TDragControlObject(Source).Control).GridView = gridSQLRecallDB) then
  begin
     s := dmGenel.tSQLRecall.FieldByName('SQL').AsString;
  end;

  SQLEditor.SelText := s;
end;

procedure TSQLEditorFrm.EditorStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
   SQLEditor.DragMode := dmAutomatic;
end;

procedure TSQLEditorFrm.EditorEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
   SQLEditor.DragMode := dmManual;
end;


function TSQLEditorFrm.CharPosInRichEdit(aRichEdit: TRichEdit; X, Y: integer): integer;
var
  P: TPoint;
begin
  P := Point(X, Y);
  Result := SendMessage(aRichEdit.Handle, EM_CHARFROMPOS, 0, Longint(@P));
end;


function TSQLEditorFrm.SaveFile(ASaveAs: Boolean): Boolean;
begin
  if ASaveAs or (SQLEditorFileName = '') then
  begin
    SaveDialog.FileName := SQLEditorFileName;
    Result := SaveDialog.Execute;
    if not Result then Exit;
    SQLEditorFileName := SaveDialog.FileName;
  end;
  SQLEditor.Lines.SaveToFile(SQLEditorFileName);
  SetModified(False);
  Result := True;
end;


procedure TSQLEditorFrm.SetModified(Value: Boolean);
begin
  SQLEditor.Modified := Value;
  if Value then
  begin
    editorStatusBar.Panels[2].Text := 'Modified';
    TdxStatusBarTextPanelStyle(editorStatusBar.Panels[2].PanelStyle).ImageIndex := 1;
  end
  else
  begin
    editorStatusBar.Panels[2].Text := '';
    TdxStatusBarTextPanelStyle(editorStatusBar.Panels[2].PanelStyle).ImageIndex := 4;
  end;
  btnSaveQuery.Enabled := Value;
end;

procedure TSQLEditorFrm.SetRecToStatusBar(RecordCount, RecNo: integer; msg: string; LastExecuteTime: String; IsSelect: boolean);
begin
  if RecordCount > 0 then
  begin
    if IsSelect then
       editorStatusBar.Panels[3].Text := Format('Row %3d of %3d total rows', [RecNo, RecordCount])
    else
       editorStatusBar.Panels[3].Text := Format('%3d rows affected', [RecordCount]);
  end else
      editorStatusBar.Panels[3].Text := msg;

  editorStatusBar.Panels[4].Text := LastExecuteTime;
end;

function TSQLEditorFrm.GetSQLEditorCol: Integer;
begin
  with SQLEditor do
    Result := SelStart - SendMessage(Handle, EM_LINEINDEX, SQLEditorRow, 0);
end;

function TSQLEditorFrm.GetSQLEditorRow: Integer;
begin
  with SQLEditor do
    Result := SendMessage(Handle, EM_LINEFROMCHAR, SelStart, 0);
end;

function TSQLEditorFrm.GetSQLEditorFileName: string;
begin
  if pcSQLEditor.ActivePage = nil then Result := '';
     result := TSQLEditorFrameFrm(SQLFrame).FileName;
end;

procedure TSQLEditorFrm.SetSQLEditorFileName(Value: string);
begin
  if pcSQLEditor.ActivePage = nil then exit;
  pcSQLEditor.ActivePage.Caption := Value;
  TSQLEditorFrameFrm(SQLFrame).FileName := Value;
end;

procedure TSQLEditorFrm.btnExecuteClick(Sender: TObject);
begin
  TSQLEditorFrameFrm(SQLFrame).ExecSQL;
end;

procedure TSQLEditorFrm.btnStopClick(Sender: TObject);
begin
  TSQLEditorFrameFrm(SQLFrame).StopSQL;
  QueryRunning(False);
end;

procedure TSQLEditorFrm.btnExplainPlanClick(Sender: TObject);
begin
  TSQLEditorFrameFrm(SQLFrame).ExplainPlan;
end;

procedure TSQLEditorFrm.btnOpenQueryClick(Sender: TObject);
begin
  OpenDialog.FileName := '';
  if OpenDialog.Execute then
  begin
    btnNewQueryClick(self);
    SetSQLEditorFileName(OpenDialog.FileName);
    SQLEditor.Lines.LoadFromFile(OpenDialog.FileName);
  end;
end;

procedure TSQLEditorFrm.btnDeleteQueryClick(Sender: TObject);
begin
  if pcSQLEditor.ActivePage = nil then exit;
  SQLFrame.Close;
  pcSQLEditor.ActivePage.Destroy;
  if pcSQLEditor.PageCount <= 0 then btnNewQueryClick(self);
end;

procedure TSQLEditorFrm.btnSaveQueryClick(Sender: TObject);
begin
  SaveFile(True);
end;

procedure TSQLEditorFrm.btnPrintClick(Sender: TObject);
begin
  if PrintDialog.Execute then SQLEditor.Print(SQLEditorFileName);
end;

procedure TSQLEditorFrm.btnUndoClick(Sender: TObject);
begin
  SendMessage(SQLEditor.Handle, EM_UNDO, 0, 0);
end;

procedure TSQLEditorFrm.btnRedoClick(Sender: TObject);
begin
  SendMessage(SQLEditor.Handle, EM_REDO, 0, 0);
end;

procedure TSQLEditorFrm.btnCutClick(Sender: TObject);
begin
  SQLEditor.CutToClipboard;
end;

procedure TSQLEditorFrm.btnCopyClick(Sender: TObject);
begin
  SQLEditor.CopyToClipboard;
end;

procedure TSQLEditorFrm.btnPasteClick(Sender: TObject);
begin
  SQLEditor.PasteFromClipboard;
end;

procedure TSQLEditorFrm.btnClearClick(Sender: TObject);
begin
  SQLEditor.ClearSelection;
end;

procedure TSQLEditorFrm.btnSelectAllClick(Sender: TObject);
begin
  SQLEditor.SelectAll;
end;

procedure TSQLEditorFrm.btnFindTextClick(Sender: TObject);
begin
  SQLEditor.SelLength := 0;
  FindDialog.Execute;
end;

procedure TSQLEditorFrm.btnReplaceClick(Sender: TObject);
begin
  SQLEditor.SelLength := 0;
  ReplaceDialog.Execute;
end;

procedure TSQLEditorFrm.btnAlignLeftClick(Sender: TObject);
begin
  if TdxBarButton(Sender).Down then
    SQLEditor.Paragraph.Alignment := TAlignment(TdxBarButton(Sender).Tag)
  else
    SQLEditor.Paragraph.Alignment := taLeftJustify;
end;

procedure TSQLEditorFrm.btnUnIndentClick(Sender: TObject);
begin
  RulerToIndent(false);
end;

procedure TSQLEditorFrm.btnIndentClick(Sender: TObject);
begin
  RulerToIndent(true);
end;

procedure TSQLEditorFrm.RulerToIndent(IsRight: Boolean);
var
  t: string;
  s: TStringList;
  i: integer;
  x: integer;
begin
  s := TStringList.Create;
  with SQLEditor do begin
    if length(SelText) <= 0 then exit;
    s.Text := SelText;
    x := SelStart;
    if IsRight then
    begin
       for i := 0 to s.Count - 1 do
          s[i] := ' '+ s[i];
    end;

    if not IsRight then
    begin
       for i := 0 to s.Count - 1 do
       begin
          t := s[i]; 
          if t[1] = ' ' then
             delete(t,1,1);
          s[i] := t;
       end;
    end;
    for i := 0 to s.Count - 1 do
       SelText := s[i]+#13#10;
    SelStart := x;
    SelLength := length(s.text);
  end; //with
end;


procedure TSQLEditorFrm.FindDialogFind(Sender: TObject);
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

procedure TSQLEditorFrm.ReplaceDialogReplace(Sender: TObject);
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

procedure TSQLEditorFrm.btnPriorSQLClick(Sender: TObject);
begin
  TSQLEditorFrameFrm(SQLFrame).PriorHistory;
end;

procedure TSQLEditorFrm.btnNextSQLClick(Sender: TObject);
begin
  TSQLEditorFrameFrm(SQLFrame).NextHistory;
end;

procedure TSQLEditorFrm.btnCommitClick(Sender: TObject);
begin
  TSQLEditorFrameFrm(SQLFrame).Commit;
end;

procedure TSQLEditorFrm.btnRollbackClick(Sender: TObject);
begin
  TSQLEditorFrameFrm(SQLFrame).Rollback;
end;

{****************************  OBJECT BROWSER  *********************************}

procedure TSQLEditorFrm.ObjectBrowserRefresh;
var
  q : TDBQuery;
  pNode,cNode: TcxTreeListNode;

  procedure FillTree(ColumnName: string);
  begin
     ds.DataSet.First;
     while not ds.DataSet.Eof do
     begin
       cNode := tlObjectBrowser.AddChild(pNode, Pointer(1)); cNode.Texts[0] := ds.DataSet.fieldByName(ColumnName).AsString;
       ds.DataSet.Next;
     end;
  end;
  procedure ExecuteDS(sql, column_name: string);
  begin
    q := ExecQueryAsync(sql, FBarConnection.Session, nil, self.Handle);
    while not (q.Result >= 1) do Application.ProcessMessages;

    if q.Result in [MQR_CONNECT_FAIL,MQR_QUERY_FAIL] then
    begin
      ds.DataSet := nil;
      MessageDlg(q.Comment, mtError, [mbOK], 0 );
      LogSQL(q.Comment);
    end else
    begin
       if q.HasResultset then
       begin
         ds.DataSet := q.DBDataset;
         if edtObjectFilter.Text <> '' then
         begin
           ds.DataSet.Filtered := False;
           ds.DataSet.Filter := column_name+' = '+  QuotedStr('*'+edtObjectFilter.Text+'*');
           ds.DataSet.Filtered := true;
         end;
         FillTree(column_name);
       end
    end;
  end;

begin
  tlObjectBrowser.Nodes.Clear;
  {****************************** Table ****************************************}
  pNode := tlObjectBrowser.Add(nil,Pointer(0)); pNode.Texts[0] := DBFormType[dbTable];
  ExecuteDS(GetTables(lcbObjectUserName.Text), 'TABLE_NAME');

  {****************************** VIEW ****************************************}
  pNode := tlObjectBrowser.Add(nil,Pointer(0)); pNode.Texts[0] := DBFormType[dbView];
  ExecuteDS(GetViews(lcbObjectUserName.Text), 'VIEW_NAME');
end;

procedure TSQLEditorFrm.btnObjectRefreshClick(Sender: TObject);
begin
  ObjectBrowserRefresh;
end;

procedure TSQLEditorFrm.tlObjectBrowserCanSelectNode(Sender: TObject;
  ANode: TcxTreeListNode; var Allow: Boolean);
var
  q : TDBQuery;
  pNode: TcxTreeListNode;  
begin
  if not tlObjectColumns.Visible then exit; 
  tlObjectColumns.Nodes.Clear;
  if ANode = nil then exit;
  if ANode.HasChildren then exit;
  if tlObjectBrowser.SelectionCount > 0 then exit;

  q := ExecQueryAsync(GetTableColumns(ANode.Texts[0], lcbObjectUserName.Text, ''),
                      FBarConnection.Session, nil, self.Handle);
  while not (q.Result >= 1) do Application.ProcessMessages;

  if q.Result in [MQR_CONNECT_FAIL,MQR_QUERY_FAIL] then
  begin
    ds.DataSet := nil;
    MessageDlg(q.Comment, mtError, [mbOK], 0 );
    LogSQL(q.Comment);
  end else
  begin
     if q.HasResultset then
     begin
       ds.DataSet := q.DBDataset;
       ds.DataSet.First;
       while not ds.DataSet.Eof do
       begin
          with tlObjectColumns do
          begin
            pNode := Add(nil,Pointer(0));
            pNode.Texts[0] := ds.DataSet.FieldByName('COLUMN_NAME').AsString;
            pNode.Texts[1] := ds.DataSet.FieldByName('DATA_TYPE').AsString;
          end;
          ds.DataSet.Next;
       end;
     end;
  end;

end;

procedure TSQLEditorFrm.btnObjectShowColumnsClick(Sender: TObject);
begin
  tlObjectColumns.Visible := btnObjectShowColumns.Down;
end;

procedure TSQLEditorFrm.edtObjectFilterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_RETURN) then  ObjectBrowserRefresh; 
end;


{****************************  SQL RECALL LIST  *********************************}
procedure TSQLEditorFrm.AddHistory(SQL: string);
begin
  dmGenel.AddHistory(SQL, FBarConnection.Session.Server +' / '+ FBarConnection.Session.Username);
end;

procedure TSQLEditorFrm.btnSQLRecalTypeClick(Sender: TObject);
begin
  if btnSQLRecalType.Down then
    dmGenel.FilterHistory('CONNECTION = ' +QuotedStr(FBarConnection.Session.Server +' / '+ FBarConnection.Session.Username))
  else
    dmGenel.FilterHistory('');
end;

procedure TSQLEditorFrm.edtSQLRecallFilterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_RETURN) then  dmGenel.FilterHistory('SQL = '+QuotedStr('*'+edtSQLRecallFilter.Text+'*'));
end;


procedure TSQLEditorFrm.btnSQLRecallSaveClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    dmGenel.SaveHistory(SaveDialog.FileName);
end;

procedure TSQLEditorFrm.btnSQLRecallOpenClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    dmGenel.LoadHistory(OpenDialog.FileName);
end;

procedure TSQLEditorFrm.btnSQLRecallFirstClick(Sender: TObject);
begin
  dmGenel.tSQLRecall.Last;
end;

procedure TSQLEditorFrm.btnSQLRecallPriorClick(Sender: TObject);
begin
  dmGenel.tSQLRecall.Next;
end;

procedure TSQLEditorFrm.btnSQLRecallNextClick(Sender: TObject);
begin
  dmGenel.tSQLRecall.Prior;
end;

procedure TSQLEditorFrm.btnSQLRecallLastClick(Sender: TObject);
begin
  dmGenel.tSQLRecall.First;
end;

procedure TSQLEditorFrm.btnSQLRecallToSQLEditorClick(Sender: TObject);
begin
  SQLEditor.Lines.Add(dmGenel.tSQLRecall.FieldByName('SQL').AsString);
end;

procedure TSQLEditorFrm.btnSQLRecallDeleteClick(Sender: TObject);
begin
  dmGenel.tSQLRecall.Delete;
end;




end.
