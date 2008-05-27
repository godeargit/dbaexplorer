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
unit frmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters,
  cxCheckBox,  Ora, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  StdCtrls, cxContainer, cxGroupBox, cxButtons, ExtCtrls,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, 

  OraBarConn, OraCall, OdacVcl, MemDS, VirtualTable, jpeg;

type
  TLoginFrm = class(TForm)
    Panel2: TPanel;
    btnCancel: TcxButton;
    btnConnect: TcxButton;
    vConnectionList: TVirtualTable;
    vConnectionListUSER_NAME: TStringField;
    vConnectionListPASSWORD: TStringField;
    vConnectionListDATABASE_NAME: TStringField;
    vConnectionListLAST_CONNECTIN_TIME: TStringField;
    vConnectionListCONNECT_MODE: TStringField;
    dsConnectionList: TDataSource;
    Panel4: TPanel;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1USER_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1DATABASE_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1LAST_CONNECTION_TIME: TcxGridDBColumn;
    cxGrid1DBTableView1CONNECT_MODE: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Image1: TImage;
    Panel3: TPanel;
    Label4: TLabel;
    cboxConnectMode: TcxComboBox;
    cbNet: TcxCheckBox;
    gbConnectionInfo: TcxGroupBox;
    lblServer: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblHome: TLabel;
    lblSID: TLabel;
    cboxServer: TcxComboBox;
    edtUserName: TcxTextEdit;
    edtPassword: TcxTextEdit;
    cboxHome: TcxComboBox;
    cboxSID: TcxComboBox;
    cboxHost: TcxComboBox;
    cboxPort: TcxComboBox;
    cbConnectPrompt: TcxCheckBox;
    cbDetail: TcxCheckBox;
    cboxSavePassword: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    procedure btnCancelClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure cbDetailClick(Sender: TObject);
    procedure vConnectionListAfterScroll(DataSet: TDataSet);
    procedure cbNetClick(Sender: TObject);
  private
    { Private declarations }
    LP : TLoginParams;
    procedure DoInit;
    procedure DivConnStr(Server : string; var Service, Port, Host: string); overload;
    procedure DivConnStr; overload;
    procedure MakeConnStr;
    procedure InitServerList;
    procedure AddConnectionList;

  public
    { Public declarations }
    function Login: TLoginParams;
  end;

var
  LoginFrm: TLoginFrm;

implementation

{$R *.dfm}

uses OraQueryThread,  frmMain, Global, frmSchemaBrowser, VisualOptions,
  GenelDM;

function TLoginFrm.Login: TLoginParams;
begin
  LoginFrm := TLoginFrm.Create(Application);
  Self := LoginFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  
  DoInit;
  cbDetailClick(self);

  vConnectionList.Close;
  if FileExists('ConnectionList.prm') then
  begin
    vConnectionList.LoadFromFile('ConnectionList.prm');
  end;
  vConnectionList.Open;
  
  ShowModal;
  result := LP;
  Free;
end;

procedure TLoginFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TLoginFrm.btnConnectClick(Sender: TObject);
var
  barConn: TBarConnection;
begin
  Screen.Cursor := crSQLWait;

  ZeroMemory (@LP,SizeOf(LP));

  with LP do
  begin
    Server := cboxServer.Text;
    UserName := edtUserName.Text;
    Password := edtPassword.Text;
    if cbDetail.Checked then
      MakeConnStr;
    ConnectionMode := cboxConnectMode.Text;
    ConnectionString := edtUserName.Text + '/'+ edtPassword.Text +'@'+cboxServer.Text;
    HomeName := cboxHome.Text;
  end;

  btnConnect.Enabled := false;
  MainFrm.Showstatus('Connecting to ' + cboxServer.Text+'['+edtUserName.Text + ']...', 2, true);

  barConn := TBarConnection.Create(nil);
  case barConn.Connect(@LP) of
    CON_SUCCESS:
      begin
        LP.OraSession := barConn.Session;
        MainFrm.ShowStatus( STATUS_MSG_READY, 2 );

        AddConnectionList;
        Close();
      end;
  else
    // attempt failed -- show error and keep window open
    MessageDlg ( 'Could not establish connection! Details:'+#13#10+barConn.LastError, mtError, [mbOK], 0);
    MainFrm.Showstatus('Connectin error', 2, true);

    btnConnect.Enabled := True;
    FreeAndNil (barConn);
  end;

  Screen.Cursor := crDefault;

end;

procedure TLoginFrm.AddConnectionList;
begin
  if (vConnectionList.FieldByName('USER_NAME').AsString <> edtUserName.Text)
     or (vConnectionList.FieldByName('DATABASE_NAME').AsString <> cboxServer.Text) then
    vConnectionList.Append
  else
    vConnectionList.Edit;

  vConnectionList.FieldByName('USER_NAME').AsString := UpperCase(edtUserName.Text);

  if cboxSavePassword.Checked then
     vConnectionList.FieldByName('PASSWORD').AsString := edtPassword.Text;
  vConnectionList.FieldByName('DATABASE_NAME').AsString := cboxServer.Text;
  vConnectionList.FieldByName('LAST_CONNECTION_TIME').AsString := DateTimeToStr(now);
  vConnectionList.FieldByName('CONNECT_MODE').AsString := cboxConnectMode.Text;
  vConnectionList.Post;

  vConnectionList.SaveToFile('ConnectionList.prm');
end;


procedure TLoginFrm.vConnectionListAfterScroll(DataSet: TDataSet);
begin
  if dsConnectionList.State <> dsBrowse	 then exit; 
  edtUserName.Text := vConnectionList.FieldByName('USER_NAME').AsString;
  edtPassword.Text := vConnectionList.FieldByName('PASSWORD').AsString;
  edtPassword.TexT := vConnectionList.FieldByName('PASSWORD').AsString;
  cboxServer.Text  := vConnectionList.FieldByName('DATABASE_NAME').AsString;
  cboxConnectMode.Text := vConnectionList.FieldByName('CONNECT_MODE').AsString;
  if cboxConnectMode.Text = '' then cboxConnectMode.ItemIndex := 0; 
end;


procedure TLoginFrm.DoInit;
var
  i: integer;
begin
  inherited;

  if not cbNet.Checked and not LoadedOCI then
    try
      DetectOCI; // to show homes info
    except
      on E: Exception do
        MessageDlg(E.Message, mtError, [mbOK], 0);
    end;  

/// fill home list with info
  if (DefaultOracleHome >= 0) and (OracleHomeNames[DefaultOracleHome] <> '') then
    cboxHome.Properties.Items[0] := cboxHome.Properties.Items[0] + ' [' + OracleHomeNames[DefaultOracleHome] + ']';
  for i := 0 to OracleHomeCount - 1 do begin
    cboxHome.Properties.Items.Add(OracleHomeNames[i])
  end;

  if cbDetail.Checked then
    DivConnStr;

//  if LP.OraSession.HomeName = '' then
//    cboxHome.ItemIndex := 0
//  else
    begin
    for i := 0 to OracleHomeCount - 1 do
      if AnsiCompareText(OracleHomeNames[i], cboxHome.Text) = 0 then begin
        cboxHome.ItemIndex := i + 1;
        break;
      end;
  end;

  //cbConnectPrompt.Checked := LP.OraSession.ConnectPrompt;
  //cbNet.Checked := LP.OraSession.Options.Net;

  InitServerList;
end;


procedure TLoginFrm.DivConnStr;
var
  Service: string;
  Port: string;
  Host: string;
begin
  DivConnStr(cboxServer.Text, Service, Port, Host);
  cboxSID.Text := Service;
  cboxPort.Text := Port;
  cboxHost.Text := Host;
end;

procedure TLoginFrm.DivConnStr(Server : string; var Service, Port, Host: string);
var
  i: integer;
  St,St1: string;
begin
// Parsing connect string host:1521:orcl
  Host := '';
  Port := '';
  Service := '';
  St := Server;
  if St <> '' then begin
    i := Pos(':', St);
    if i > 0 then begin
      if i > 1 then
        Host := Copy(St, 1, i - 1);
      St := Copy(St, i + 1, Length(St));
      i := Pos(':', St);
      if i > 0 then begin
        St1 := Copy(St, 1, i - 1);
        St := Copy(St, i + 1, Length(St));
        if St <> '' then
          Service := St;
      end
      else
        St1 := St;
    // get Port
      if St1 <> '' then
        try
          Port := IntToStr(StrToInt(St1));
        except
          raise Exception.Create('Invalid port');
        end;
    end
    else
      if St <> '' then
        Host := St;
  end;
end;


procedure TLoginFrm.cbDetailClick(Sender: TObject);
begin
  cboxServer.Visible := not cbDetail.Checked;
  cboxHome.Visible := not cbDetail.Checked;
  cboxHost.Visible := cbDetail.Checked;
  cboxPort.Visible := cbDetail.Checked;
  cboxSID.Visible := cbDetail.Checked;
  lblSID.Visible := cbDetail.Checked;

  if cbDetail.Checked then begin
    lblServer.Caption := 'Host :';
    lblHome.Caption := 'Port :';
    gbConnectionInfo.Height := 137;
    DivConnStr;
  end
  else begin
    lblServer.Caption := 'Server :';
    lblHome.Caption := 'Home :';
    gbConnectionInfo.Height := 110;
    MakeConnStr;
  end;
end;

procedure TLoginFrm.MakeConnStr;
var
  St: string;
begin
  St := cboxSID.Text;
  if St <> '' then
    St := ':' + St;
  St := cboxPort.Text + St;
  if St <> '' then
    St := ':' + St;
  St := cboxHost.Text + St;
  cboxServer.Text := St;
end;


procedure TLoginFrm.InitServerList;
var
  ConnectDialog: TConnectDialog;
  i: integer;
  Service: string;
  Port: string;
  Host: string;
begin
// Retrieve server list
  cboxServer.Properties.Items.Clear;

  ConnectDialog := TConnectDialog.Create(nil);
  //ConnectDialog.ReadAliases := True; //aki
  try
    GetOraServerList(cboxServer.Properties.Items, OracleHomePath, ConnectDialog.ReadAliases,
      cbNet.Checked);
    cboxSID.Properties.Items.Clear;
    cboxPort.Properties.Items.Clear;
    cboxHost.Properties.Items.Clear;
    for i :=0 to cboxServer.Properties.Items.Count - 1 do begin
      DivConnStr(cboxServer.Properties.Items.Strings[i], Service, Port, Host);
      if cboxSID.Properties.Items.IndexOf(Service) < 0 then
        cboxSID.Properties.Items.Add(Service);
      if (Port <> '') and (cboxPort.Properties.Items.IndexOf(Port) < 0) then
        cboxPort.Properties.Items.Add(Port);
      if (Host <> '') and (cboxHost.Properties.Items.IndexOf(Host) < 0) then
        cboxHost.Properties.Items.Add(Host);
    end;
  finally
    if ConnectDialog = nil then
      ConnectDialog.Free;
  end;
end;




procedure TLoginFrm.cbNetClick(Sender: TObject);
begin
  cbDetail.Enabled := cbNet.Checked;
  cboxHome.Enabled := NOT cbNet.Checked;
  if not cbNet.Checked then
     cbDetail.Checked := false;

end;

end.
