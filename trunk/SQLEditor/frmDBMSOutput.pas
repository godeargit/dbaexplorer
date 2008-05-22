unit frmDBMSOutput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QDialogs, dxBar, dxBarExtItems, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, cxRichEdit, ExtCtrls, DB, MemDS, DBAccess, Ora, GenelDM,
  OraBarConn, cxGraphics, dxStatusBar;

type
  TDBMSOutputFrm = class(TForm)
    dxBarManager1: TdxBarManager;
    btnTurnOutputOn: TdxBarButton;
    btnClearWindows: TdxBarButton;
    btnSetBufferSize: TdxBarButton;
    btnSaveToFile: TdxBarButton;
    lblSeconds: TdxBarStatic;
    btnFrequency: TdxBarSpinEdit;
    tDbMS_output: TTimer;
    redtDBMS_output: TcxRichEdit;
    sdDBMS: TSaveDialog;
    spDbms_output: TOraStoredProc;
    statusBar: TdxStatusBar;
    btnClose: TdxBarButton;
    procedure btnTurnOutputOnClick(Sender: TObject);
    procedure btnClearWindowsClick(Sender: TObject);
    procedure btnSetBufferSizeClick(Sender: TObject);
    procedure btnSaveToFileClick(Sender: TObject);
    procedure tDbMS_outputTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    DBMS_OUTPUT_BufferSize: integer;
  public
    { Public declarations }
    procedure Init(ABarConnection : TBarConnection);
  end;

var
  DBMSOutputFrm: TDBMSOutputFrm;

implementation

{$R *.dfm}

uses frmMain, VisualOptions, DBQuery;

procedure TDBMSOutputFrm.Init(ABarConnection : TBarConnection);
begin
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  DBMS_OUTPUT_BufferSize := 20000;
  spDbms_output.Session := ABarConnection.Session;

  Caption := ABarConnection.Session.Server+'/'+ABarConnection.Session.UserName+' - '+'DBMS Output';
  statusBar.Panels[0].Text := ABarConnection.Session.Server+'/'+ABarConnection.Session.UserName;
  MainFrm.dxBarListWindows.Items.AddObject(Caption, Self);
end;


procedure TDBMSOutputFrm.btnTurnOutputOnClick(Sender: TObject);
begin
  if btnTurnOutputOn.Down then
  begin
   ExecSQL('Begin '
           +'  DBMS_OUTPUT.enable('+IntToStr(DBMS_OUTPUT_BufferSize)+'); '
           +'end; ',
           '',
           spDbms_output.Session);
    tDbMS_output.Interval := (btnFrequency.IntValue * 1000);
    tDbMS_output.Enabled := true;
  end else
  begin
    ExecSQL('Begin '
           +'  DBMS_OUTPUT.disable; '
           +'end; ',
           '',
           spDbms_output.Session);

    tDbMS_output.Enabled := false;
  end;
end;

procedure TDBMSOutputFrm.btnClearWindowsClick(Sender: TObject);
begin
  redtDBMS_output.Clear;
end;

procedure TDBMSOutputFrm.btnSetBufferSizeClick(Sender: TObject);
begin
  DBMS_OUTPUT_BufferSize := InputBox('Set DBMS Output Buffer', 'Size', DBMS_OUTPUT_BufferSize, 1, 1000000);
end;

procedure TDBMSOutputFrm.btnSaveToFileClick(Sender: TObject);
begin
  if sdDBMS.Execute then
     redtDBMS_output.Lines.SaveToFile(sdDBMS.FileName);
end;

procedure TDBMSOutputFrm.tDbMS_outputTimer(Sender: TObject);
begin
  spDbms_output.ExecProc;
  if spDbms_output.Params[1].AsString = '0' then
     redtDBMS_output.Lines.Add(spDbms_output.Params[0].AsString);
end;

procedure TDBMSOutputFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  spDbms_output.close;
  with MainFrm.dxBarListWindows.Items do
       Delete(IndexOfObject(Self));
  action := caFree;
end;

procedure TDBMSOutputFrm.btnCloseClick(Sender: TObject);
begin
  ExecSQL('Begin '
         +'  DBMS_OUTPUT.disable; '
         +'end; ',
         '',
         spDbms_output.Session);
  close;
end;

end.
