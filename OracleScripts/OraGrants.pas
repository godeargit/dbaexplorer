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
unit OraGrants;

interface

uses Classes, SysUtils, Ora, OraStorage, DB,DBQuery, Forms, Dialogs, VirtualTable;

type

  Grant = record
    Grantor,
    Grantee,
    TableSchema,
    TableName,
    Privilege,
    Grantable,  //yes-no,''->revoke
    Hierarchy: string;
  end;
  TGrant = ^Grant;

  TGrantList = class(TObject)
  private
    FGrantList: TList;
    FTableSchema,
    FTableName: string;
    FOraSession: TOraSession;
    FObjectType: TDBFormType;
    FDSGrantList: TVirtualTable;
    function GetGrant(Index: Integer): TGrant;
    procedure SetGrant(Index: Integer; Grant: TGrant);
    function GetGrantCount: Integer;
  public
    procedure GrantAdd(Grant: TGrant);
    procedure GrantDelete(Index: Integer);
    property  GrantCount: Integer read GetGrantCount;
    property  GrantItems[Index: Integer]: TGrant read GetGrant write SetGrant;
    function FindByGrants(Grantee, Privilege: string): integer;
    procedure CopyFrom(GrantList: TGrantList);
    property TableSchema: string read FTableSchema write FTableSchema;
    property TableName: string read FTableName write FTableName ;
    property ObjectType: TDBFormType read FObjectType write FObjectType;
    property DSGrantList: TVirtualTable read FDSGrantList;
    property OraSession: TOraSession read FOraSession write FOraSession;
    constructor Create;
    destructor Destroy; override;
    procedure SetDDL;
    function GetDDL: string;
    function Grant(GrantScript: string) : boolean;
  end;

  function GetPrivs: string;

const
  GrantTablePrivilege: array[1..12] of string = ('Select','Delete','Insert','Update','Alter','References','Index','OnCommitRefresh','QueryRewrite','Debug','Flashback','Execute');

implementation

uses util,frmSchemaBrowser;

{********************** TGrant ***********************************}

function GetPrivs: string;
begin
  result :=
    ' Select * from all_tab_privs '
   +' where TABLE_SCHEMA = :pOwner '
   +'   and TABLE_NAME = :pName '
   +' order by grantee, grantable ';
end;

constructor TGrantList.Create;
begin
  FGrantList := TList.Create;
  FDSGrantList := TVirtualTable.Create(nil);
end;

destructor TGrantList.Destroy;
var
  i : Integer;
  FGrant: TGrant;
begin
  try
    if FGrantList.Count > 0 then
    begin
      for i := FGrantList.Count - 1 downto 0 do
      begin
        FGrant := FGrantList.Items[i];
        Dispose(FGrant);
      end;
    end;
  finally
    FGrantList.Free;
  end;
  FDSGrantList.Free;
  inherited;
end;

procedure TGrantList.GrantAdd(Grant: TGrant);
begin
  FGrantList.Add(Grant);
end;

procedure TGrantList.GrantDelete(Index: Integer);
begin
  TObject(FGrantList.Items[Index]).Free;
  FGrantList.Delete(Index);
end;

function TGrantList.GetGrant(Index: Integer): TGrant;
begin
  Result := FGrantList.Items[Index];
end;

procedure TGrantList.SetGrant(Index: Integer; Grant: TGrant);
begin
  if Assigned(Grant) then
    FGrantList.Items[Index] := Grant
end;

function TGrantList.GetGrantCount: Integer;
begin
  Result := FGrantList.Count;
end;

function TGrantList.FindByGrants(Grantee, Privilege: string): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to FGrantList.Count -1 do
  begin
    if (TGrant(FGrantList[i]).Grantee = Grantee) and
       (TGrant(FGrantList[i]).Privilege = Privilege) then
    begin
       result := i;
       exit;
    end;
  end;
end;

procedure TGrantList.CopyFrom(GrantList: TGrantList);
var
  i: integer;
begin
  FOraSession := GrantList.OraSession;
  FTableSchema := GrantList.TableSchema;
  FTableName := GrantList.TableName;

  for i := 0 to GrantList.GrantCount -1 do
    FGrantList.Add(TGrant(GrantList.GrantItems[i]));
end;

procedure TGrantList.SetDDL;
var
  FGrant: TGrant;
  q: TOraQuery;
begin
  if FTableName = '' then exit;

  q := TOraQuery.Create(nil);
  q.Session := FOraSession;
  q.SQL.Text := GetPrivs;
  q.ParamByName('pOwner').AsString := FTableSchema;
  q.ParamByName('pName').AsString := FTableName;
  q.Open;
  CopyDataSet(q, FDSGrantList);
  while not q.Eof do
  begin
    new(FGrant);
    FGrant^.Grantor := q.FieldByName('Grantor').AsString;
    FGrant^.Grantee := q.FieldByName('Grantee').AsString;
    FGrant^.TableSchema := q.FieldByName('Table_Schema').AsString;
    FGrant^.TableName := q.FieldByName('Table_Name').AsString;
    FGrant^.Privilege := q.FieldByName('Privilege').AsString;
    FGrant^.Grantable := q.FieldByName('Grantable').AsString;
    FGrant^.Hierarchy := q.FieldByName('Hierarchy').AsString;
    GrantAdd(FGrant);
    q.Next;
  end;
  q.close;  
end;

function TGrantList.GetDDL: string;
var
  strHeader, strGrantebleY, strGrantebleN, strGrantebleR: string;
  i: integer;
  FGrantee: string;
begin
  FGrantee := ''; 
  strGrantebleY := '';
  strGrantebleN := '';
  strGrantebleR := '';
  with self do
  begin
    if GetGrantCount > 0 then
        FGrantee := GrantItems[0].Grantee;
    for i := 0 to GetGrantCount -1 do
    begin
      if FGrantee <> GrantItems[i].Grantee then
      begin
        if copy(strGrantebleY, length(strGrantebleY),1) =',' then
           delete(strGrantebleY, length(strGrantebleY),1);
        if copy(strGrantebleN, length(strGrantebleN),1) =',' then
           delete(strGrantebleN, length(strGrantebleN),1);
        if copy(strGrantebleR, length(strGrantebleR),1) =',' then
           delete(strGrantebleR, length(strGrantebleR),1);
      
        if length(strGrantebleY) > 0 then
           strHeader := strHeader + 'GRANT '+strGrantebleY+' on '+TableSchema+'.'+TableName+' TO '+FGrantee+' WITH GRANT OPTION;'+ln;
        if length(strGrantebleN) > 0 then
           strHeader := strHeader + 'GRANT '+strGrantebleN+' on '+TableSchema+'.'+TableName+' TO '+FGrantee+';'+ln;
        if length(strGrantebleR) > 0 then
           strHeader := strHeader + 'REVOKE '+strGrantebleR+' on '+TableSchema+'.'+TableName+' FROM '+FGrantee+';'+ln;

        strGrantebleY := '';
        strGrantebleN := '';
        strGrantebleR := '';
      end;
      FGrantee := GrantItems[i].Grantee;
      if GrantItems[i].Grantable = 'YES' then
         strGrantebleY := strGrantebleY + GrantItems[i].Privilege +','
      else if GrantItems[i].Grantable = 'NO' then
         strGrantebleN := strGrantebleN + GrantItems[i].Privilege +','
      else
         strGrantebleR := strGrantebleR + GrantItems[i].Privilege +',';
    end;

    if copy(strGrantebleY, length(strGrantebleY),1) =',' then
       delete(strGrantebleY, length(strGrantebleY),1);
    if copy(strGrantebleN, length(strGrantebleN),1) =',' then
       delete(strGrantebleN, length(strGrantebleN),1);
    if copy(strGrantebleR, length(strGrantebleR),1) =',' then
       delete(strGrantebleR, length(strGrantebleR),1);

    if length(strGrantebleY) > 0 then
       strHeader := strHeader + 'GRANT '+strGrantebleY+' on '+TableSchema+'.'+TableName+' TO '+FGrantee+' WITH GRANT OPTION;'+ln;
    if length(strGrantebleN) > 0 then
       strHeader := strHeader + 'GRANT '+strGrantebleN+' on '+TableSchema+'.'+TableName+' TO '+FGrantee+';'+ln;
    if length(strGrantebleR) > 0 then
       strHeader := strHeader + 'REVOKE '+strGrantebleR+' on '+TableSchema+'.'+TableName+' FROM '+FGrantee+';'+ln;
  end; //with self
  result := strHeader;
end;

function TGrantList.Grant(GrantScript: string) : boolean;
begin
  result := ExecSQL(GrantScript, '', FOraSession);
end;


end.
