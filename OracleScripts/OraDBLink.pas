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
unit OraDBLink;

interface

uses Classes, SysUtils, Ora, OraStorage, DB, DBQuery, Forms, Dialogs, VirtualTable;

type

  TDBLink = class(TObject)
  private
    FDB_LINK,
    FOWNER: string;
    FPUBLIC_LINK: Boolean;
    FHOST: string;
    FUSER_NAME,
    FPASSWORD,
    FCREATED: string;
    FMode: TMode;
    FOraSession: TOraSession;
    function GetStatus: string;
    function GetDBLinkDetail: String;
  public
    property DB_LINK: String read FDB_LINK write FDB_LINK;
    property USER_NAME: String read FUSER_NAME write FUSER_NAME;
    property HOST: String read FHOST write FHOST;
    property OWNER: String read FOWNER write FOWNER;
    property PASSWORD: String read FPASSWORD write FPASSWORD;
    property CREATED: String read FCREATED write FCREATED;
    property PUBLIC_LINK: Boolean read FPUBLIC_LINK write FPUBLIC_LINK;
    property Status: String read GetStatus;
    property Mode: TMode read FMode write FMode;
    property OraSession: TOraSession read FOraSession write FOraSession;
    procedure SetDDL;
    function GetDDL: string;
    function GetAlterDDL: string;
    function CreateDBLink(Script: string) : boolean;
    function AlterDBLink(Script: string) : boolean;
    function DropDBLink: boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  function GetDBLinks(OwnerName: string): string;

implementation

uses Util, frmSchemaBrowser, OraScripts, Languages;

resourcestring
  strDBLinkDropped = 'DB Link %s has been dropped.';
  strDBLinkAltered = 'DB Link %s has been altered.';
  strDBLinkCreated = 'DB Link %s has been created.';
  
function GetDBLinks(OwnerName: string): string;
begin
  result := 'select * from ALL_DB_LINKS '
           +' where OWNER = '+Str(OwnerName)
           +' order by DB_LINK ';
end;

constructor TDBLink.Create;
begin
  inherited;
end;

destructor TDBLink.destroy;
begin
  inherited;
end;

function TDBLink.GetDBLinkDetail: String;
begin
  Result :=
    'Select * '
   +' from ALL_DB_LINKS '
   +'WHERE DB_LINK = :pName '
   +'  AND OWNER = :pOwner ';
end;

function TDBLink.GetStatus: string;
var
  q1: TOraQuery;
begin
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectStatusSQL;
  q1.ParamByName('pOName').AsString := FDB_LINK;
  q1.ParamByName('pOType').AsString := 'DB LINK';
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;
  result := FDB_LINK+' ( Created: '+q1.FieldByName('CREATED').AsString
                    +' Last DDL: '+q1.FieldByName('LAST_DDL_TIME').AsString
                    +' Status: '+q1.FieldByName('STATUS').AsString
                    +' )';
  q1.Close;
end;

procedure TDBLink.SetDDL;
var
  q1: TOraQuery;
begin
  if FDB_LINK = '' then exit;
  if FOWNER = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetDBLinkDetail;
  q1.ParamByName('pName').AsString := FDB_LINK;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;

  FDB_LINK := q1.FieldByName('DB_LINK').AsString;
  FUSER_NAME := q1.FieldByName('USERNAME').AsString;
  FHOST := q1.FieldByName('HOST').AsString;
  FOWNER := q1.FieldByName('OWNER').AsString;
  FCREATED := q1.FieldByName('CREATED').AsString;
  FPASSWORD := '"<pwd>"';
  Q1.close;
end;

function TDBLink.GetDDL: string;
begin
  if FPUBLIC_LINK then
    result := 'CREATE PUBLIC DATABASE LINK '+DB_LINK+ln
  else
    result := 'CREATE DATABASE LINK '+DB_LINK+ln;

  if (FPASSWORD <> '') and (FUSER_NAME <> '') then
     result := result
           +'  CONNECT TO '+FUSER_NAME+ln
           +'  IDENTIFIED BY '+FPASSWORD+ln;

  if (FHOST <> '') then
    result := result +'  USING '+str(FHOST);
    
  result := result +';';  
end;

function TDBLink.GetAlterDDL: string;
begin
  result := 'DROP DATABASE LINK '+DB_LINK+ ';'+ln
                                 +GetDDL;
end;

function TDBLink.CreateDBLink(Script: string) : boolean;
begin
  result := false;
  if DB_LINK = '' then exit;
  result := ExecSQL(Script, Format(ChangeSentence('strDBLinkCreated',strDBLinkCreated),[DB_LINK]), FOraSession);
end;

function TDBLink.AlterDBLink(Script: string) : boolean;
begin
  result := false;
  if DB_LINK = '' then exit;
  result := ExecSQL(Script, Format(ChangeSentence('strDBLinkAltered',strDBLinkAltered),[DB_LINK]), FOraSession);
end;

function TDBLink.DropDBLink: boolean;
var
  FSQL: string;
begin
  result := false;
  if DB_LINK = '' then exit;
  FSQL := 'drop DATABASE LINK '+DB_LINK;
  result := ExecSQL(FSQL, Format(ChangeSentence('strDBLinkDropped',strDBLinkDropped),[DB_LINK]), FOraSession);
end;


end.
