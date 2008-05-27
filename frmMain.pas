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
unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, dxBar, dxBarExtItems, dxsbar, ComCtrls, StdCtrls,
  dxDockControl, ExtCtrls, dxDockPanel, cxGraphics, cxControls, dxStatusBar, GenelDM,
  Buttons, Ora, OraBarConn, Menus, DB, DBAccess;

type

  TMainFrm = class(TForm)
    BarManager: TdxBarManager;
    dxBarSubItemFile: TdxBarSubItem;
    dxBarSubItemWindow: TdxBarSubItem;
    dxBarSubItemHelp: TdxBarSubItem;
    StatusBar: TdxStatusBar;
    dxBarPopupFormType: TdxBarPopupMenu;
    MI_SchemaBrowser: TdxBarButton;
    MI_SQLEditor: TdxBarButton;
    MI_Disconnect: TdxBarButton;
    dxBarListWindows: TdxBarListItem;
    dxBarLargeButton1: TdxBarLargeButton;
    btnSessions: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    btnDBA: TdxBarButton;
    barConnectDatabase: TdxBarButton;
    Memo1: TMemo;
    btnExit: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    btnUserReports: TdxBarButton;
    btnVisualOptions: TdxBarButton;
    btnDBStatus: TdxBarButton;
    btnFindInFiles: TdxBarButton;
    btnDatabaseSearch: TdxBarButton;
    btnVisualCompare: TdxBarButton;
    btnSQLPlus: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    btnAlertOptions: TdxBarButton;
    btnViewAlarms: TdxBarButton;
    btnExport: TdxBarButton;
    btnImport: TdxBarButton;
    bbtnDBMSOutput: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    btnAbout: TdxBarButton;
    btnEnvironmentOptions: TdxBarButton;
    procedure barConnectDatabaseClick(Sender: TObject);
    procedure onConnectionClick(Sender: TObject);
    procedure MI_SchemaBrowserClick(Sender: TObject);
    procedure MI_DisconnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarListWindowsClick(Sender: TObject);
    procedure dxBarListWindowsGetData(Sender: TObject);
    procedure MI_SQLEditorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSessionsClick(Sender: TObject);
    procedure btnDBAClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnVisualOptionsClick(Sender: TObject);
    procedure btnDBStatusClick(Sender: TObject);
    procedure btnVisualCompareClick(Sender: TObject);
    procedure btnAlertOptionsClick(Sender: TObject);
    procedure btnViewAlarmsClick(Sender: TObject);
    procedure bbtnDBMSOutputClick(Sender: TObject);
    procedure btnEnvironmentOptionsClick(Sender: TObject);
    procedure btnDatabaseSearchClick(Sender: TObject);
  private
    { Private declarations }
      myButton: TBarConnection;
      BarConnectionCount: integer;
      function BarConnection: TBarConnection;
      procedure CheckConnection;
  public
    { Public declarations }
    procedure ShowStatus(msg: string='';  panel : Integer=0; busy: Boolean=false);
    procedure ShowConnButton(ConnButton: TBarConnection);
    procedure FormDelete(ABarConnection: TBarConnection);
  end;

var
  MainFrm: TMainFrm;

implementation

{$R *.dfm}

uses frmLogin, frmSchemaBrowser, frmSQLEditor, frmSessionBrowser,  frmDBA,
     frmVisualOptions,
     VisualOptions,
     frmDatabaseStatus,
     frmDiffMain, frmAlarmOptions, frmAlarmHistory, frmDBMSOutput,
     frmEnvironmentOptions, frmFindInDB;

procedure TMainFrm.FormCreate(Sender: TObject);
begin
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(MainFrm);
  BarConnectionCount := 0;
end;

procedure TMainFrm.barConnectDatabaseClick(Sender: TObject);
var
  LP: TLoginParams;
  myItem : TdxBarItemLink;
begin
  LP := LoginFrm.login;
  CheckConnection;
  if LP.UserName = '' then exit;
  if not LP.OraSession.Connected then exit;

  myButton := TBarConnection.Create(self);

  inc(BarConnectionCount);
  myButton.Name := LP.UserName+IntTostr(BarConnectionCount);
  myButton.ButtonStyle := bsChecked;
  myButton.Caption := LP.Server+'/'+LP.UserName;
  myButton.Category := 2;
  myButton.GroupIndex := 9;
  myButton.Visible :=ivNever;
  myButton.Down := true;
  myButton.Session := LP.OraSession;
  myButton.OnClick := onConnectionClick;
  myButton.Count := 0; //ilk baglanti, hic bir ekran acik degil, ilk ekrana bu baglanti verilecek.

  myItem :=  BarManager.Bars[3].ItemLinks.Add;
  myItem.Item := myButton;
  myButton.Visible :=ivAlways;
  //FreeAndNil(LP);
  CheckConnection;
 
end;

procedure TMainFrm.CheckConnection;
var
  OpenConnection: boolean;
  i: integer;
  Temp: TComponent;
begin
  OpenConnection := False;
  for I := ComponentCount - 1 downto 0 do
  begin
    Temp := Components[I];
    if (Temp is TBarConnection) then
    begin
      OpenConnection := True;
      break;
    end;
  end;

  MI_SchemaBrowser.Enabled := OpenConnection;
  MI_SQLEditor.Enabled := OpenConnection;
  btnDBA.Enabled := OpenConnection;
  btnSessions.Enabled := OpenConnection;
  btnDBStatus.Enabled := OpenConnection;
  btnAlertOptions.Enabled := OpenConnection;
  btnViewAlarms.Enabled := OpenConnection;
  bbtnDBMSOutput.Enabled := OpenConnection;

end;

procedure TMainFrm.MI_DisconnectClick(Sender: TObject);
var
  i : integer;
  Temp: TComponent;
begin


  Temp := nil;
  for I := ComponentCount - 1 downto 0 do
  begin
    Temp := Components[I];
    if (Temp is TBarConnection) then
    begin
      if TBarConnection(Temp).Down then break;
    end;
  end;

  if MessageDlg('End connection '+TBarConnection(Temp).Caption+' . are you sure ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

  if Temp is TBarConnection then
  begin
    //bütün baðlý formlarý kapat
    with MainFrm do
    for I := MDIChildCount-1 downto 0 do
    begin
      if MDIChildren[I] is TSchemaBrowserFrm then
        if TSchemaBrowserFrm(MDIChildren[I]).BarConnName = TBarConnection(Temp).Name then
           MDIChildren[I].Close;

      if MDIChildren[I] is TSQLEditorFrm then
        if TSQLEditorFrm(MDIChildren[I]).BarConnName = TBarConnection(Temp).Name then
           MDIChildren[I].Close;

      if MDIChildren[I] is TDBAfrm then
        if TDBAfrm(MDIChildren[I]).BarConnName = TBarConnection(Temp).Name then
           MDIChildren[I].Close;

      if MDIChildren[I] is TSessionBrowserFrm then
        if TSessionBrowserFrm(MDIChildren[I]).BarConnName = TBarConnection(Temp).Name then
           MDIChildren[I].Close;

    end;

    TBarConnection(Temp).Count := 0;
    if TBarConnection(Temp).Session <> nil then
       TBarConnection(Temp).Session.Disconnect;
    FreeAndNil(TBarConnection(Temp));
  end;
  
  CheckConnection;
end;

procedure TMainFrm.onConnectionClick(Sender: TObject);
begin
  dxBarPopupFormType.PopupFromCursorPos;
end;


procedure TMainFrm.MI_SchemaBrowserClick(Sender: TObject);
var
  f : TSchemaBrowserFrm;
begin
  if BarConnection = nil then exit;
  BarConnection.Count := BarConnection.Count + 1;
  f := TSchemaBrowserFrm.Create(Application);
  f.Init(BarConnection);
end;

procedure TMainFrm.MI_SQLEditorClick(Sender: TObject);
var
  f : TSQLEditorFrm;
begin
  if BarConnection = nil then exit;
  BarConnection.Count := BarConnection.Count + 1;
  f := TSQLEditorFrm.Create(Application);
  f.Init(BarConnection);
end;

procedure TMainFrm.btnSessionsClick(Sender: TObject);
var
  f : TSessionBrowserFrm;
begin
  if BarConnection = nil then exit;
  BarConnection.Count := BarConnection.Count + 1;
  f := TSessionBrowserFrm.Create(Application);
  f.Init(BarConnection);
end;

procedure TMainFrm.btnDBAClick(Sender: TObject);
var
  f : TDBAFrm;
begin
  if BarConnection = nil then exit;
  BarConnection.Count := BarConnection.Count + 1;
  f := TDBAFrm.Create(Application);
  f.Init(BarConnection);
end;

procedure TMainFrm.btnDBStatusClick(Sender: TObject);
var
  f : TDatabaseStatusFrm;
begin
  if BarConnection = nil then exit;
  BarConnection.Count := BarConnection.Count + 1;
  f := TDatabaseStatusFrm.Create(Application);
  f.Init(BarConnection);
end;

procedure TMainFrm.btnVisualCompareClick(Sender: TObject);
var
  f: TDiffMainFrm;
begin
  f := TDiffMainFrm.Create(Application);
  f.Init;
end;

procedure TMainFrm.btnVisualOptionsClick(Sender: TObject);
begin
  VisualOptionsFrm.Init;
  ChangeVisualGUI(MainFrm);
end;

procedure TMainFrm.btnEnvironmentOptionsClick(Sender: TObject);
begin
  EnvironmentOptionsFrm.Init();
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(MainFrm);
end;

procedure TMainFrm.btnAlertOptionsClick(Sender: TObject);
begin
  AlarmOptionsFrm.Init;
end;

procedure TMainFrm.btnViewAlarmsClick(Sender: TObject);
var
  f: TAlarmHistoryFrm;
begin
  if BarConnection = nil then exit;
  BarConnection.Count := BarConnection.Count + 1;
  f := TAlarmHistoryFrm.Create(Application);
  f.Init(BarConnection);
end;

procedure TMainFrm.bbtnDBMSOutputClick(Sender: TObject);
var
  f: TDBMSOutputFrm;
begin
  if BarConnection = nil then exit;
  BarConnection.Count := BarConnection.Count + 1;
  f := TDBMSOutputFrm.Create(Application);
  f.Init(BarConnection);
end;

procedure TMainFrm.FormDelete(ABarConnection: TBarConnection);
begin
  TBarConnection(ABarConnection).Count := TBarConnection(ABarConnection).Count - 1;
end;

procedure TMainFrm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
  Temp: TComponent;
begin               
  with MainFrm do
    for I := MDIChildCount-1 downto 0 do
      MDIChildren[I].Close;

  for I := ComponentCount - 1 downto 0 do
  begin
    Temp := Components[I];
    if (Temp is TBarConnection) then
    begin
      RemoveComponent(Temp);
    end;
  end;
  Action := caFree;
end;


procedure TMainFrm.ShowStatus(msg: string='';  panel : Integer=0; busy: Boolean=false);
begin
  // show Message in statusbar
  if panel = 2 then begin
    StatusBar.Panels[panel].Text := msg;
    if busy then
      TdxStatusBarTextPanelStyle(StatusBar.Panels[1].PanelStyle).ImageIndex := 43
    else
      TdxStatusBarTextPanelStyle(StatusBar.Panels[1].PanelStyle).ImageIndex := 42;
  end
  else
    StatusBar.Panels[panel].Text := msg;
  StatusBar.Repaint;
end;


procedure TMainFrm.ShowConnButton(ConnButton: TBarConnection);
var
  i: integer;
  Temp: TComponent;
begin
  for I := ComponentCount - 1 downto 0 do
  begin
    Temp := Components[I];
    if (Temp is TBarConnection) then
    begin
      if TBarConnection(Temp) = ConnButton then
      begin
        TBarConnection(Temp).Down := true;
        break;
      end;
    end;
  end;
end;

procedure TMainFrm.dxBarListWindowsClick(Sender: TObject);
begin
  with dxBarListWindows do
    TCustomForm(Items.Objects[ItemIndex]).Show;
end;

procedure TMainFrm.dxBarListWindowsGetData(Sender: TObject);
begin
  with dxBarListWindows do
    ItemIndex := Items.IndexOfObject(ActiveMDIChild);
end;

procedure TMainFrm.FormShow(Sender: TObject);
begin
  barConnectDatabase.Click;
end;

function TMainFrm.BarConnection: TBarConnection;
var
  i : integer;
  Temp: TComponent;
begin
  Temp := nil;
  for I := ComponentCount - 1 downto 0 do
  begin
    Temp := Components[I];
    if (Temp is TBarConnection) then
    begin
      if TBarConnection(Temp).Down then break;
    end;
  end;
  result := TBarConnection(Temp);
end;


procedure TMainFrm.btnExitClick(Sender: TObject);
begin
  close;
end;






procedure TMainFrm.btnDatabaseSearchClick(Sender: TObject);
var
  f : TFindInDBFrm;
begin
  if BarConnection = nil then exit;
  BarConnection.Count := BarConnection.Count + 1;
  f := TFindInDBFrm.Create(Application);
  f.Init(BarConnection);
end;

initialization
  dxBarRegisterItem(TBarConnection, TdxBarButtonControl, false);

finalization
  dxBarUnregisterItem(TBarConnection);




end.
