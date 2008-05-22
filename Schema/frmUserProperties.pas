unit frmUserProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxMemo, cxRichEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxLabel, cxContainer,
  cxTextEdit, cxPC, StdCtrls, ExtCtrls, GenelDM, frmBaseForm, OraBarConn, OraUser,
  cxCheckBox, cxCalc, cxImageComboBox, MemDS, VirtualTable;

type
  TUserPropertiesFrm = class(TBaseform)
    Panel1: TPanel;
    imgToolBar: TImage;
    lblDescription: TLabel;
    pcUserProperties: TcxPageControl;
    tsUserDetails: TcxTabSheet;
    dxBarDockControl1: TdxBarDockControl;
    edtUserName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtDefaultTablespace: TcxTextEdit;
    cxLabel3: TcxLabel;
    edtTemporaryTablespace: TcxTextEdit;
    cxLabel4: TcxLabel;
    edtProfile: TcxTextEdit;
    cxLabel5: TcxLabel;
    edtDateCreated: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    edtAccountIsLocked: TcxTextEdit;
    edtPasswordExpireDate: TcxTextEdit;
    cxLabel8: TcxLabel;
    edtUserId: TcxTextEdit;
    tsUserRoles: TcxTabSheet;
    tsSystemPrivileges: TcxTabSheet;
    tsUserQuotas: TcxTabSheet;
    tsSequenceScripts: TcxTabSheet;
    redtDDL: TcxRichEdit;
    dxBarManager1: TdxBarManager;
    bbtnCreateUser: TdxBarButton;
    bbtnDropUser: TdxBarButton;
    bbtnAlterUser: TdxBarButton;
    bbtnRefreshUser: TdxBarButton;
    cxLabel9: TcxLabel;
    edtLockDate: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    edtExternalName: TcxTextEdit;
    edtInitialResourceGroup: TcxTextEdit;
    vtRoles: TVirtualTable;
    vtQuotas: TVirtualTable;
    vtPrivs: TVirtualTable;
    dsRoles: TDataSource;
    dsSystemPrivileges: TDataSource;
    dsQuotas: TDataSource;
    GridGrants: TcxGrid;
    GridGrantsDBTableView1: TcxGridDBTableView;
    GridGrantsDBTableView1Column1: TcxGridDBColumn;
    GridGrantsDBTableView1Column2: TcxGridDBColumn;
    GridGrantsDBTableView1Column3: TcxGridDBColumn;
    GridGrantsDBTableView1Column4: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    procedure pcUserPropertiesPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure bbtnCreateUserClick(Sender: TObject);
    procedure bbtnAlterUserClick(Sender: TObject);
    procedure bbtnDropUserClick(Sender: TObject);
    procedure bbtnRefreshUserClick(Sender: TObject);
  private
    { Private declarations }
    FUserName: string;
    User: TUser;
    procedure GetUser;
    procedure GetUserDetail;
    procedure GetRoles;
    procedure GetPrivs;
    procedure GetQuotas;

  public
    { Public declarations }
    procedure Init(ObjName, OwnerName: string); override;
  end;

var
  UserPropertiesFrm: TUserPropertiesFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, Util, frmUserDetail, OraStorage, OraGrants, VisualOptions,
  frmSchemaPublicEvent;

procedure TUserPropertiesFrm.Init(ObjName, OwnerName: string);
var
  a: boolean;
begin
  inherited Show;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  top := 0;
  left := 0;
  FUserName := ObjName;

  GetUser;
  pcUserPropertiesPageChanging(self, pcUserProperties.ActivePage ,a);
end;

procedure TUserPropertiesFrm.GetUser;
begin
  if User <> nil then
     FreeAndNil(User);

  User := TUser.Create;
  User.OraSession := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;
  User.USERNAME := FUserName;
  User.SetDDL;

  lblDescription.Caption := User.Status;

  redtDDL.Text := User.GetDDL;
  CodeColors(self, 'Default', redtDDL, false);
  GetUserDetail;
end;

procedure TUserPropertiesFrm.GetUserDetail;
begin
  edtUserId.Text := User.USER_ID;
  edtUserName.Text := User.USERNAME;
  edtDefaultTablespace.Text := User.DEFAULT_TABLESPACE;
  edtTemporaryTablespace.Text := User.TEMPORARY_TABLESPACE;
  edtProfile.Text := User.PROFILE;
  edtDateCreated.Text := User.CREATED;
  edtAccountIsLocked.Text := User.ACCOUNT_STATUS;
  edtPasswordExpireDate.Text := User.EXPIRY_DATE;
  edtLockDate.Text := User.LOCK_DATE;
  edtExternalName.Text := User.EXTERNAL_NAME;
  edtInitialResourceGroup.Text := User.INITIAL_RSRC_CONSUMER_GROUP;
  GetRoles;
  GetPrivs;
  GetQuotas;
end;

procedure TUserPropertiesFrm.GetRoles;
begin
  vtRoles.close;
  vtRoles.Assign(User.RoleList.DSRoleList);
  vtRoles.Open;
end;

procedure TUserPropertiesFrm.GetPrivs;
begin
  vtPrivs.Close;
  vtPrivs.Assign(User.PrivList.DSPrivList);
  vtPrivs.Open;
end;

procedure TUserPropertiesFrm.GetQuotas;
begin
  vtQuotas.Close;
  vtQuotas.Assign(User.QuotaList.DSQuotaList);
  vtQuotas.Open;
end;


procedure TUserPropertiesFrm.pcUserPropertiesPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  //
end;

procedure TUserPropertiesFrm.bbtnCreateUserClick(Sender: TObject);
var
  u: TUser;
begin
  inherited;
  u := TUser.Create;
  u.USERNAME := '';
  u.OraSession := User.OraSession;

  if UserDetailFrm.Init(u) then
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbUsers);
end;

procedure TUserPropertiesFrm.bbtnAlterUserClick(Sender: TObject);
begin
  inherited;
  if User = nil then exit;
  if UserDetailFrm.Init(User) then
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbUsers);
end;

procedure TUserPropertiesFrm.bbtnDropUserClick(Sender: TObject);
begin
  inherited;
  if User = nil then exit;
  if User.USERNAME = '' then exit;

  if SchemaPublicEventFrm.Init(User, oeDrop) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbUsers);

end;

procedure TUserPropertiesFrm.bbtnRefreshUserClick(Sender: TObject);
begin
  inherited;
  GetUserDetail;
end;

end.
