unit frmUserDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxGraphics, cxMemo, cxRichEdit,
  cxCheckBox, cxLabel, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxPC, cxControls, cxButtons, ExtCtrls, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, OraUser, MemDS, VirtualTable, cxCalc,
  cxImageComboBox, OraRole, OraSysPrivs, OraQuota, cxHeader, cxGroupBox;

type
  TUserDetailFrm = class(TForm)
    pc: TcxPageControl;
    tsUser: TcxTabSheet;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    tsRoles: TcxTabSheet;
    tsSystemPrivileges: TcxTabSheet;
    tsQuotas: TcxTabSheet;
    GridGrants: TcxGrid;
    GridGrantsDBTableView1: TcxGridDBTableView;
    GridGrantsDBTableView1Column1: TcxGridDBColumn;
    GridGrantsDBTableView1Column2: TcxGridDBColumn;
    GridGrantsDBTableView1Column3: TcxGridDBColumn;
    GridGrantsDBTableView1Column4: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    vtRoles: TVirtualTable;
    dsRoles: TDataSource;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    vtPrivs: TVirtualTable;
    dsSystemPrivileges: TDataSource;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    dsQuotas: TDataSource;
    vtQuotas: TVirtualTable;
    vtProfiles: TVirtualTable;
    dsProfiles: TDataSource;
    vtProfilesprofile: TStringField;
    vtTemporary: TVirtualTable;
    dsTemporary: TDataSource;
    vtTemporaryTABLESPACE_NAME: TStringField;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtNewPassword: TcxMaskEdit;
    cxLabel3: TcxLabel;
    edtConfirmPassword: TcxMaskEdit;
    chkPasswordExpired: TcxCheckBox;
    chkAccountLocked: TcxCheckBox;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    lcTablespace: TcxLookupComboBox;
    lcTemporaryTablespace: TcxLookupComboBox;
    cxLabel6: TcxLabel;
    lcProfile: TcxLookupComboBox;
    cxGroupBox2: TcxGroupBox;
    btnCancel: TcxButton;
    btnExecute: TcxButton;
    edtUserName: TcxMaskEdit;
    Bevel1: TBevel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
  private
    { Private declarations }
    FUser: TUser;
    FNewUser: TUser;
    FIsCreated: Boolean;
    FResult: Boolean;
    procedure SetProperties;
    procedure GetUserDetail;
    procedure GetRoles;
    procedure GetPrivs;
    procedure GetQuotas;

    function SetUserDetail: boolean;
    function SetRoles: TRoleList;
    function SetPrivs: TPrivList;
    function SetQuotas: TQuotaList;

  public
    { Public declarations }
    function Init(AUser: TUser): boolean;
  end;

var
  UserDetailFrm: TUserDetailFrm;

implementation

{$R *.dfm}

uses Util, frmSchemaBrowser, GenelDM, VisualOptions;

function TUserDetailFrm.Init(AUser: TUser): boolean;
begin
  UserDetailFrm := TUserDetailFrm.Create(Application);
  Self := UserDetailFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  FResult := false;

  FUser := TUser.Create;
  FUser := AUser;

  FNewUser := TUser.Create;
  FNewUser.OraSession := AUser.OraSession;

  FIsCreated := FUser.USERNAME = '';

  dmGenel.ReLoad(FUser.OraSession);

  GetUserDetail;
  SetProperties;

  pc.ActivePage := tsUser;
  
  ShowModal;
  result := FResult;
  Free;
end;    

procedure TUserDetailFrm.btnCancelClick(Sender: TObject);
begin
  FResult := false;
  close;
end;

procedure TUserDetailFrm.SetProperties;
begin
  edtUserName.Enabled := FIsCreated;
end; //SetProperties

procedure TUserDetailFrm.GetUserDetail;
begin
  if FIsCreated then Caption := 'Create User ' else Caption := 'Alter User '+FUser.USERNAME;

  vtProfiles.close;
  vtProfiles.Assign(FUser.DSProfilesList);
  vtProfiles.Open;

  vtTemporary.close;
  vtTemporary.Assign(FUser.DSTemporaryTablespaceList);
  vtTemporary.Open;

  edtUserName.Text := FUser.USERNAME;
  chkPasswordExpired.Checked := FUser.EXPIRY_DATE <> '';
  chkAccountLocked.Checked := FUser.LOCK_DATE <> '';
  lcTablespace.Text := FUser.DEFAULT_TABLESPACE;
  lcTemporaryTablespace.Text := FUser.TEMPORARY_TABLESPACE;
  lcProfile.Text := FUser.PROFILE;

  GetRoles;
  GetPrivs;
  GetQuotas;
end; //GetUserDetail;

procedure TUserDetailFrm.GetRoles;
begin
  if FIsCreated then FUser.RoleList.SetDDL;
  vtRoles.close;
  vtRoles.Assign(FUser.RoleList.DSRoleList);
  vtRoles.Open;
end;

procedure TUserDetailFrm.GetPrivs;
begin
  if FIsCreated then FUser.PrivList.SetDDL;
  vtPrivs.Close;
  vtPrivs.Assign(FUser.PrivList.DSPrivList);
  vtPrivs.Open;
end;

procedure TUserDetailFrm.GetQuotas;
begin
  if FIsCreated then FUser.QuotaList.SetDDL;
  vtQuotas.Close;
  vtQuotas.Assign(FUser.QuotaList.DSQuotaList);
  vtQuotas.Open;
end;


function TUserDetailFrm.SetUserDetail: boolean;
begin
  result := true;
  if edtUserName.Text = '' then
  begin
    MessageDlg('User Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if (edtNewPassword.Text = '') and (FIsCreated) then
  begin
    MessageDlg('Password must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if (edtNewPassword.Text <> edtConfirmPassword.Text) then
  begin
    MessageDlg('Passwords do not match', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;  

  with FNewUser do
  begin
    USERNAME := edtUserName.Text;
    //USER_ID,
    PASSWORD := edtNewPassword.Text;
    if chkAccountLocked.Checked then
       ACCOUNT_STATUS := 'LOCKED'
    else
       ACCOUNT_STATUS := 'OPEN';
    //LOCK_DATE,
    if chkPasswordExpired.Checked then
       EXPIRY_DATE := DateTimeToStr(now)
    else
       EXPIRY_DATE := '';
    DEFAULT_TABLESPACE := lcTablespace.Text;
    TEMPORARY_TABLESPACE := lcTemporaryTablespace.Text;
    //CREATED,
    PROFILE := lcProfile.Text;
    //INITIAL_RSRC_CONSUMER_GROUP,
    //EXTERNAL_NAME
    RoleList := SetRoles;
    PrivList := SetPrivs;
    QuotaList := SetQuotas;
  end; //FUser     
end; //SetUserDetail

function TUserDetailFrm.SetRoles: TRoleList;
var
  FRole: TRole;
begin
  result := TRoleList.Create;
  vtRoles.First;
  while not vtRoles.Eof do
  begin
    //if (vtRoles.fieldByName('GRANTED').AsString = 'YES') then
    begin
      new(FRole);
      FRole.GRANTEE := edtUserName.Text;
      FRole.GRANTED_ROLE := vtRoles.fieldByName('ROLE').AsString;
      FRole.GRANTED := vtRoles.fieldByName('GRANTED').AsString = 'YES';
      FRole.ADMIN_OPTION := vtRoles.fieldByName('ADMIN_OPTION').AsString = 'YES';
      FRole.DEFAULT_ROLE := vtRoles.fieldByName('DEFAULT_ROLE').AsString = 'YES';
      result.RoleAdd(FRole);
    end;
    vtRoles.Next;
  end;
end;

function TUserDetailFrm.SetPrivs: TPrivList;
var
  FPriv: TPriv;
begin
  result := TPrivList.Create;
  vtPrivs.First;
  while not vtPrivs.Eof do
  begin
    //if (vtPrivs.fieldByName('GRANTED').AsString = 'YES') then
    begin
      new(FPriv);
      FPriv.GRANTEE := edtUserName.Text;
      FPriv.NAME := vtPrivs.fieldByName('NAME').AsString;
      FPriv.GRANTED := vtPrivs.fieldByName('GRANTED').AsString = 'YES';
      FPriv.ADMIN_OPTION := vtPrivs.fieldByName('ADMIN_OPTION').AsString = 'YES';
      result.PrivAdd(FPriv);
    end;
    vtPrivs.Next;
  end;
end;

function TUserDetailFrm.SetQuotas: TQuotaList;
var
  FQuota: TQuota;
begin
  result := TQuotaList.Create;
  vtQuotas.First;
  while not vtQuotas.Eof do
  begin
    new(FQuota);
    FQuota.USERNAME := edtUserName.Text;
    FQuota.TABLESPACE_NAME := vtQuotas.FieldByName('TABLESPACE_NAME').AsString;
    FQuota.UNLIMITID := vtQuotas.FieldByName('UNL').AsString = 'YES';
    FQuota.UNITS := vtQuotas.FieldByName('UNIT').AsString;
    FQuota.AMOUNT := vtQuotas.FieldByName('AMT').AsInteger;
    result.QuotaAdd(FQuota);
    vtQuotas.Next;
  end;
end;


procedure TUserDetailFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetUserDetail then AllowChange := false
    else
    begin
      if FIsCreated then
         redtDDL.Text := FNewUser.GetDDL
      else
         redtDDL.Text := FNewUser.GetAlterDDL(FUser);
    end;
    CodeColors(self, 'Default', redtDDL, false);
  end;

end;

procedure TUserDetailFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetUserDetail then exit;
  if FIsCreated then
  begin
    redtDDL.Text := FNewUser.GetDDL;
    if FNewUser.CreateUser(redtDDL.Text) then close;
  end else
  begin
    redtDDL.Text := FNewUser.GetAlterDDL(FUser);
    if FNewUser.AlterUser(redtDDL.Text) then close;
  end;
  FResult := true;
end;


end.
