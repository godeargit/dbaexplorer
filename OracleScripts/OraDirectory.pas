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
unit OraDirectory;


interface

uses Classes, SysUtils, Ora, OraStorage, DB, DBQuery, Forms, Dialogs, VirtualTable;

type

  TDBDirectory = class(TObject)
  private
    FOWNER,
    FDIRECTORY_NAME,
    FDIRECTORY_PATH: string;
    FOraSession: TOraSession;
    function GetStatus: string;
    function GetDBDirectoryDetail: String;
  public
    property OWNER: String read FOWNER write FOWNER;
    property DIRECTORY_NAME: String read FDIRECTORY_NAME write FDIRECTORY_NAME;
    property DIRECTORY_PATH: String read FDIRECTORY_PATH write FDIRECTORY_PATH;
    property Status: String read GetStatus;
    property OraSession: TOraSession read FOraSession write FOraSession;
    procedure SetDDL;
    function GetDDL: string;
    function GetAlterDDL: string;
    function CreateDBDirectory(Script: string) : boolean;
    function AlterDBDirectory(Script: string) : boolean;
    function DropDBDirectory: boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  function GetDBDirectories(): string;

implementation

uses Util, frmSchemaBrowser, OraScripts, Languages;

resourcestring
  strDBDirectoryDropped = 'Directory %s has been dropped.';
  strDBDirectoryAltered = 'Directory %s has been altered.';
  strDBDirectoryCreated = 'Directory %s has been created.';
  
function GetDBDirectories(): string;
begin
  result := 'select * from SYS.DBA_DIRECTORIES '
           +' order by DIRECTORY_NAME ';
end;

constructor TDBDirectory.Create;
begin
  inherited;
end;

destructor TDBDirectory.destroy;
begin
  inherited;
end;

function TDBDirectory.GetDBDirectoryDetail: String;
begin
  Result :=
    'Select * '
   +' from DBA_DIRECTORIES '
   +'WHERE DIRECTORY_NAME = :pName ';
end;

function TDBDirectory.GetStatus: string;
var
  q1: TOraQuery;
begin
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectStatusSQL;
  q1.ParamByName('pOName').AsString := FDIRECTORY_NAME;
  q1.ParamByName('pOType').AsString := 'DIRECTORY';
  q1.ParamByName('pOwner').AsString := 'SYS';
  q1.Open;
  result := FDIRECTORY_NAME+' ( Created: '+q1.FieldByName('CREATED').AsString
                    +' Last DDL: '+q1.FieldByName('LAST_DDL_TIME').AsString
                    +' Status: '+q1.FieldByName('STATUS').AsString
                    +' )';
  q1.Close;
end;

procedure TDBDirectory.SetDDL;
var
  q1: TOraQuery;
begin
  if FDIRECTORY_NAME = '' then exit;
  if FOWNER = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetDBDirectoryDetail;
  q1.ParamByName('pName').AsString := FDIRECTORY_NAME;
  q1.Open;

  FDIRECTORY_NAME := q1.FieldByName('DIRECTORY_NAME').AsString;
  FDIRECTORY_PATH := q1.FieldByName('DIRECTORY_PATH').AsString;
  Q1.close;
end;

function TDBDirectory.GetDDL: string;
begin
  result := 'CREATE OR REPLACE DIRECTORY '+FDIRECTORY_NAME+' AS '+Str(FDIRECTORY_PATH);
end;

function TDBDirectory.GetAlterDDL: string;
begin
  result := 'CREATE OR REPLACE DIRECTORY '+FDIRECTORY_NAME+' AS '+Str(FDIRECTORY_PATH);
end;

function TDBDirectory.CreateDBDirectory(Script: string) : boolean;
begin
  result := false;
  if FDIRECTORY_NAME = '' then exit;
  result := ExecSQL(Script, Format(ChangeSentence('strDBDirectoryCreated',strDBDirectoryCreated),[FDIRECTORY_NAME]), FOraSession);
end;

function TDBDirectory.AlterDBDirectory(Script: string) : boolean;
begin
  result := false;
  if FDIRECTORY_NAME = '' then exit;
  result := ExecSQL(Script, Format(ChangeSentence('strDBDirectoryAltered',strDBDirectoryAltered),[FDIRECTORY_NAME]), FOraSession);
end;

function TDBDirectory.DropDBDirectory: boolean;
var
  FSQL: string;
begin
  result := false;
  if FDIRECTORY_NAME = '' then exit;
  FSQL := 'drop DIRECTORY '+FDIRECTORY_NAME;
  result := ExecSQL(FSQL, Format(ChangeSentence('strDBDirectoryDropped',strDBDirectoryDropped),[FDIRECTORY_NAME]), FOraSession);
end;


end.
