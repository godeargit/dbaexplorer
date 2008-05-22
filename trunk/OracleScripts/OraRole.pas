unit OraRole;

interface

uses Classes, SysUtils, Ora, OraStorage, DB,DBQuery, Forms, Dialogs, VirtualTable;

type

  Role = record
    GRANTEE,
    GRANTED_ROLE,
    PASSWORD_REQUIRED : string;
    GRANTED,
    ADMIN_OPTION,
    DEFAULT_ROLE: boolean;
  end;
  TRole = ^Role;

  TRoleList = class(TObject)
  private
    FRoleList: TList;
    FOraSession: TOraSession;
    FDSRoleList: TVirtualTable;
    FGRANTEE: String;
    function GetRole(Index: Integer): TRole;
    procedure SetRole(Index: Integer; Role: TRole);
    function GetRoleCount: Integer;
    function GetRoles: string;
  public
    procedure RoleAdd(Role: TRole);
    procedure RoleDelete(Index: Integer);
    property  RoleCount: Integer read GetRoleCount;
    property  RoleItems[Index: Integer]: TRole read GetRole write SetRole;
    procedure CopyFrom(RoleList: TRoleList);
    function FindByRole(GrantedRole: string): integer;
    property GRANTEE: String read FGRANTEE write FGRANTEE;
    property DSRoleList: TVirtualTable read FDSRoleList;
    property OraSession: TOraSession read FOraSession write FOraSession;
    constructor Create;
    destructor Destroy; override;
    procedure SetDDL;
    function GetDDL: string;
    function GetAlterDDL(ARoleList: TRoleList): string;
    function Role(RoleScript: string) : boolean;
  end;

  function GetRoles: string;

implementation

uses util, frmSchemaBrowser;

{********************** TRole ***********************************}

function GetRoles: string;
begin
  result := 'select * from dba_roles ';
end;

constructor TRoleList.Create;
begin
  FRoleList := TList.Create;
  FDSRoleList := TVirtualTable.Create(nil);
end;

destructor TRoleList.Destroy;
var
  i : Integer;
  FRole: TRole;
begin
  try
    if FRoleList.Count > 0 then
    begin
      for i := FRoleList.Count - 1 downto 0 do
      begin
        FRole := FRoleList.Items[i];
        Dispose(FRole);
      end;
    end;
  finally
    FRoleList.Free;
  end;
  FDSRoleList.Free;
  inherited;
end;

function TRoleList.GetRoles: string;
begin
  result :=
      'SELECT GRANTEE, ROLE, decode(granted_role,'''', ''NO'',''YES'') granted, '
     +'    nvl(admin_option,''NO'') admin_option, '
		 +'    nvl(default_role,''NO'') default_role '
     +'  FROM SYS.dba_role_privs drp, SYS.dba_roles ROLES '
     +' WHERE drp.granted_role(+) = ROLES.ROLE '
     +'   AND ROLES.password_required <> ''GLOBAL'' '
		 +'   AND drp.grantee(+) = :pName '
     +' ORDER BY ROLES.ROLE';
end;

procedure TRoleList.RoleAdd(Role: TRole);
begin
  FRoleList.Add(Role);
end;

procedure TRoleList.RoleDelete(Index: Integer);
begin
  TObject(FRoleList.Items[Index]).Free;
  FRoleList.Delete(Index);
end;

function TRoleList.GetRole(Index: Integer): TRole;
begin
  Result := FRoleList.Items[Index];
end;

procedure TRoleList.SetRole(Index: Integer; Role: TRole);
begin
  if Assigned(Role) then
    FRoleList.Items[Index] := Role;
end;

function TRoleList.GetRoleCount: Integer;
begin
  Result := FRoleList.Count;
end;

procedure TRoleList.CopyFrom(RoleList: TRoleList);
var
  i: integer;
begin
  FOraSession := RoleList.OraSession;
  FGRANTEE := RoleList.GRANTEE;

  for i := 0 to RoleList.RoleCount -1 do
    FRoleList.Add(TRole(RoleList.RoleItems[i]));
end;

function TRoleList.FindByRole(GrantedRole: string): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to FRoleList.Count -1 do
  begin
    if (TRole(FRoleList[i]).GRANTED_ROLE = GrantedRole) then
    begin
       result := i;
       exit;
    end;
  end;
end;

procedure TRoleList.SetDDL;
var
  FRole: TRole;
  q: TOraQuery;
begin
  q := TOraQuery.Create(nil);
  q.Session := FOraSession;
  q.SQL.Text := GetRoles;
  q.ParamByName('pName').AsString := FGRANTEE;
  q.Open;
  CopyDataSet(q, FDSRoleList);
  while not q.Eof do
  begin
    if q.FieldByName('GRANTEE').AsString = FGRANTEE then
    begin
      new(FRole);
      FRole^.GRANTEE := q.FieldByName('GRANTEE').AsString;
      FRole^.GRANTED_ROLE := q.FieldByName('ROLE').AsString;
      FRole^.PASSWORD_REQUIRED := '';
      FRole^.GRANTED  := q.FieldByName('GRANTED').AsString = 'YES';
      FRole^.ADMIN_OPTION := q.FieldByName('ADMIN_OPTION').AsString = 'YES';
      FRole^.DEFAULT_ROLE := q.FieldByName('DEFAULT_ROLE').AsString = 'YES';
      RoleAdd(FRole);
    end;  
    q.Next;
  end;
  q.close;  
end;

function TRoleList.GetDDL: string;
var
  i: integer;
  FRole: TRole;
  s,s1: string;
begin
  s := ''; s1 := '';

  with self do
  begin
    for i := 0 to GetRoleCount -1 do
    begin
      FRole := RoleItems[i];
      if FRole.GRANTEE <> '' then
      begin
        s := '';
        if FRole.GRANTED then
           s := ln+ 'GRANT '+FRole.GRANTED_ROLE +' TO '+FRole.GRANTEE;
        if FRole.ADMIN_OPTION then
           s := s + ' WITH ADMIN OPTION ';
        if s <> '' then
           s := s + ';';

        result := result + s;

        if FRole.DEFAULT_ROLE then
           s1 := s1 + FRole.GRANTED_ROLE+',';
      end;     
    end;
  end; //with self
  if s1 <> '' then
  begin
    delete(s1,length(s1),1);
    result := result + ln + 'ALTER USER '+FRole.GRANTEE+' DEFAULT ROLE '+s1+';';
  end;
end;

function TRoleList.GetAlterDDL(ARoleList: TRoleList): string;
var
  i: integer;
  FRole: TRole;
  s,s1: string;
begin
  s := ''; s1 := '';

  with self do
  begin
    for i := 0 to GetRoleCount -1 do
    begin
      FRole := RoleItems[i];
      
      if FRole.GRANTEE <> '' then
      begin

        if AroleList.FindByRole(FRole.GRANTED_ROLE) >= 0 then
        begin
          if not FRole.GRANTED then
             result := result + ln+ 'REWORK '+FRole.GRANTED_ROLE +' FROM '+FRole.GRANTEE +';';
        end else
        begin
          s := '';
          if FRole.GRANTED then
             s := ln+ 'GRANT '+FRole.GRANTED_ROLE +' TO '+FRole.GRANTEE;
          if FRole.ADMIN_OPTION then
             s := s + ' WITH ADMIN OPTION ';
          if s <> '' then
             s := s + ';';

          result := result + s;
        end;

        if (FRole.GRANTED) and (FRole.DEFAULT_ROLE) then
             s1 := s1 + FRole.GRANTED_ROLE+',';
      end;     
    end;
  end; //with self
  if (result <> '') and (s1 <> '') then
  begin
    delete(s1,length(s1),1);
    result := result + ln + 'ALTER USER '+FRole.GRANTEE+' DEFAULT ROLE '+s1+';';
  end;
end;


function TRoleList.Role(RoleScript: string) : boolean;
begin
  result := ExecSQL(RoleScript, '', FOraSession);
end;


end.
