unit OraUser;

interface

uses Classes, SysUtils, Ora, OraStorage, DB,DBQuery, Forms, Dialogs,
     VirtualTable, OraRole, OraSysPrivs, OraQuota;

type

  TUser = class(TObject)
  private
    FUSERNAME,
    FUSER_ID,
    FPASSWORD,
    FACCOUNT_STATUS,
    FLOCK_DATE,
    FEXPIRY_DATE,
    FDEFAULT_TABLESPACE,
    FTEMPORARY_TABLESPACE,
    FCREATED,
    FPROFILE,
    FINITIAL_RSRC_CONSUMER_GROUP,
    FEXTERNAL_NAME: String;
    FRoleList : TRoleList;
    FPrivList: TPrivList;
    FQuotaList: TQuotaList;
    FOraSession: TOraSession;

    function GetDSProfilesList: TVirtualTable;
    function GetDSTemporaryTablespaceList: TVirtualTable;

    function GetUserDetail: String;
    function GetStatus: string;
  public
    property USERNAME: String read FUSERNAME  write FUSERNAME;
    property USER_ID: String read FUSER_ID  write FUSER_ID;
    property PASSWORD: String read FPASSWORD  write FPASSWORD;
    property ACCOUNT_STATUS: String read FACCOUNT_STATUS write FACCOUNT_STATUS;
    property LOCK_DATE: String read FLOCK_DATE  write FLOCK_DATE;
    property EXPIRY_DATE: String read FEXPIRY_DATE write FEXPIRY_DATE;
    property DEFAULT_TABLESPACE: String read FDEFAULT_TABLESPACE write FDEFAULT_TABLESPACE;
    property TEMPORARY_TABLESPACE: String read FTEMPORARY_TABLESPACE write FTEMPORARY_TABLESPACE;
    property CREATED: String read FCREATED write FCREATED;
    property PROFILE: String read FPROFILE write FPROFILE;
    property INITIAL_RSRC_CONSUMER_GROUP: String read FINITIAL_RSRC_CONSUMER_GROUP write FINITIAL_RSRC_CONSUMER_GROUP;
    property EXTERNAL_NAME: String read FEXTERNAL_NAME write FEXTERNAL_NAME;

    property RoleList : TRoleList read FRoleList write FRoleList;
    property PrivList : TPrivList read FPrivList write FPrivList;
    property QuotaList: TQuotaList read FQuotaList write FQuotaList;
    property DSProfilesList: TVirtualTable read GetDSProfilesList;
    property DSTemporaryTablespaceList: TVirtualTable read  GetDSTemporaryTablespaceList;
    property Status: String read GetStatus;

    property OraSession: TOraSession read FOraSession write FOraSession;

    procedure SetDDL;
    function GetDDL: string;
    function GetAlterDDL(AUser: TUser): string;
    function CreateUser(UserScript: string) : boolean;
    function AlterUser(UserScript: string) : boolean;
    function DropUser: boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  function GetUsers: string;
  function GetUsersAndRoles: string;

implementation

uses Util, frmSchemaBrowser, OraScripts, Languages;

resourcestring
  strUserDrop = 'User %s has been dropped.';
  strUserAltered = 'User %s has been altered.';
  strUserCreated = 'User %s has been created.';

function GetUsers: string;
begin
  result := 'select * from sys.all_users order by username ';
end;

function GetUsersAndRoles: string;
begin
  result := 'SELECT username name FROM all_users '
           +'UNION '
           +'SELECT ''PUBLIC'' FROM DUAL '
           +'ORDER BY 1 asc ';
end;


constructor TUser.Create;
begin
  inherited;
  FRoleList := TRoleList.Create;
  FPrivList := TPrivList.Create;
  FQuotaList:= TQuotaList.Create;
end;

destructor TUser.destroy;
begin
  FRoleList.Free;
  FPrivList.Free;
  FQuotaList.Free;
  inherited;
end;

function TUser.GetUserDetail: String;
begin
  Result :=
    'Select * FROM dba_users '
   +'WHERE USERNAME = :pName ';
end;

function TUser.GetStatus: string;
begin
  result := FUSERNAME+' ( Created: '+FCREATED +' )';
end;

function TUser.GetDSProfilesList: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetProfiles;
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

function TUser.GetDSTemporaryTablespaceList: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetTemporaryTablespaces;
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

procedure TUser.SetDDL;
var
  q1: TOraQuery;
begin
  if FUSERNAME = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetUserDetail;
  q1.ParamByName('pName').AsString := FUSERNAME;
  q1.Open;

  FUSERNAME := q1.FieldByName('USERNAME').AsString;
  FUSER_ID := q1.FieldByName('USER_ID').AsString;
  FPASSWORD := q1.FieldByName('PASSWORD').AsString;
  FACCOUNT_STATUS := q1.FieldByName('ACCOUNT_STATUS').AsString;
  FLOCK_DATE := q1.FieldByName('LOCK_DATE').AsString;
  FEXPIRY_DATE := q1.FieldByName('EXPIRY_DATE').AsString;
  FDEFAULT_TABLESPACE := q1.FieldByName('DEFAULT_TABLESPACE').AsString;
  FTEMPORARY_TABLESPACE := q1.FieldByName('TEMPORARY_TABLESPACE').AsString;
  FCREATED := q1.FieldByName('CREATED').AsString;
  FPROFILE := q1.FieldByName('PROFILE').AsString;
  FINITIAL_RSRC_CONSUMER_GROUP := q1.FieldByName('INITIAL_RSRC_CONSUMER_GROUP').AsString;
  FEXTERNAL_NAME := q1.FieldByName('EXTERNAL_NAME').AsString;
  Q1.close;

  FRoleList.OraSession := FOraSession;
  FRoleList.GRANTEE := FUSERNAME;
  FRoleList.SetDDL;

  FPrivList.OraSession := FOraSession;
  FPrivList.GRANTEE := FUSERNAME;
  FPrivList.SetDDL;

  FQuotaList.OraSession := FOraSession;
  FQuotaList.USER := FUSERNAME;
  FQuotaList.SetDDL;
end;

function TUser.GetDDL: string;
begin
  result := 'CREATE USER '+FUSERNAME+' IDENTIFIED BY '+ FPASSWORD;
  if FDEFAULT_TABLESPACE <> '' then
     result := result + ln + 'DEFAULT TABLESPACE '+FDEFAULT_TABLESPACE;
  if FTEMPORARY_TABLESPACE <> '' then
     result := result + ln + 'TEMPORARY TABLESPACE '+FTEMPORARY_TABLESPACE;
  if FPROFILE <> '' then
     result := result + ln + 'PROFILE '+FPROFILE;
  if FEXPIRY_DATE <> '' then
     result := result + ln + 'PASSWORD EXPIRE ';
  if FACCOUNT_STATUS <> 'OPEN' then
     result := result + ln + 'ACCOUNT LOCK '
  else
     result := result + ln + 'ACCOUNT UNLOCK ';
  result := result +';';
  result := result + ln;
  result := result + FRoleList.GetDDL;
  result := result + ln;
  result := result + FPrivList.GetDDL;
  result := result + ln;
  result := result + FQuotaList.GetDDL;

end;

function TUser.GetAlterDDL(AUser: TUser): string;
begin

  if FPASSWORD <> '' then
     result := result + ln + ' IDENTIFIED BY '+FPASSWORD;
  if (FDEFAULT_TABLESPACE <> '') and (FDEFAULT_TABLESPACE <> Auser.DEFAULT_TABLESPACE) then
     result := result + ln + 'DEFAULT TABLESPACE '+FDEFAULT_TABLESPACE;

  if (FTEMPORARY_TABLESPACE <> '') and (FTEMPORARY_TABLESPACE <> AUser.TEMPORARY_TABLESPACE) then
     result := result + ln + 'TEMPORARY TABLESPACE '+FTEMPORARY_TABLESPACE;
     
  if (FPROFILE <> '') and (FPROFILE <> AUser.PROFILE) then
     result := result + ln + 'PROFILE '+FPROFILE;

  if (FEXPIRY_DATE <> '') and (FEXPIRY_DATE <> AUser.EXPIRY_DATE) then
     result := result + ln + 'PASSWORD EXPIRE ';
     
  if (FACCOUNT_STATUS <> AUser.ACCOUNT_STATUS) then
  begin
    if (FACCOUNT_STATUS <> 'OPEN') then
       result := result + ln + 'ACCOUNT LOCK '
    else
       result := result + ln + 'ACCOUNT UNLOCK ';
  end;

  if result <> '' then
     result := 'ALTER USER '+FUSERNAME + result +';'+ln;

  result := result + FRoleList.GetAlterDDL(AUser.RoleList);
  result := result + ln;
  result := result + FPrivList.GetAlterDDL(AUser.PrivList);
  result := result + ln;
  result := result + FQuotaList.GetDDL;
end;


function TUser.CreateUser(UserScript: string) : boolean;
begin
  result := false;
  if FUSERNAME = '' then exit;
  result := ExecSQL(UserScript,Format(ChangeSentence('strUserCreated',strUserCreated),[FUSERNAME]) , FOraSession);
end;

function TUser.AlterUser(UserScript: string) : boolean;
begin
  result := false;
  if FUSERNAME = '' then exit;
  result := ExecSQL(UserScript, Format(ChangeSentence('strUserAltered',strUserAltered),[FUSERNAME]), FOraSession);
end;

function TUser.DropUser: boolean;
var
  FSQL: string;
begin
  result := false;
  if FUSERNAME = '' then exit;
  FSQL := 'drop user '+FUSERNAME;
  result := ExecSQL(FSQL, Format(ChangeSentence('strUserDrop',strUserDrop),[FUSERNAME]), FOraSession);
end;


end.
