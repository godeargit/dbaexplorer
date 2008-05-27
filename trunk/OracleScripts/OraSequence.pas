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
unit OraSequence;

interface

uses Classes, SysUtils, Ora, OraStorage, DB,DBQuery, Forms, Dialogs,
     OraGrants, OraSynonym, VirtualTable;

type

  TSequence = class(TObject)
  private
    FOWNER,
    FSEQUENCE_NAME,
    FMIN_VALUE,
    FMAX_VALUE,
    FINCREMENT_BY: string;
    FCYCLE_FLAG: boolean;
    FORDER_FLAG: boolean;
    FCACHE_SIZE,
    FLAST_NUMBER,
    FSTART_WITH : string;
    FOraSession: TOraSession;
    FGrantList : TGrantList;
    FSynonymList : TSynonymList;
    function GetSequenceDetail: String;
    function GetDSUsedByList: TVirtualTable;
    function GetStatus: string;
  public
    property OWNER: String read FOwner write FOwner;
    property SEQUENCE_NAME: String read FSEQUENCE_NAME write FSEQUENCE_NAME;
    property MIN_VALUE: String read FMIN_VALUE write FMIN_VALUE;
    property MAX_VALUE: String read FMAX_VALUE write FMAX_VALUE;
    property INCREMENT_BY: String read FINCREMENT_BY write FINCREMENT_BY;
    property CYCLE_FLAG: boolean read FCYCLE_FLAG write FCYCLE_FLAG;
    property ORDER_FLAG: boolean read FORDER_FLAG write FORDER_FLAG;
    property CACHE_SIZE: String read FCACHE_SIZE write FCACHE_SIZE;
    property LAST_NUMBER: String read FLAST_NUMBER write FLAST_NUMBER;
    property START_WITH: String read FSTART_WITH write FSTART_WITH;
    property DSUsedByList: TVirtualTable read GetDSUsedByList;
    property SynonymList : TSynonymList read FSynonymList;
    property GrantList : TGrantList read FGrantList;
    property Status: String read GetStatus;
    property OraSession: TOraSession read FOraSession write FOraSession;

    procedure SetDDL;
    function GetDDL: string;
    function GetAlterDDL: string;
    function CreateSequence(SequenceScript: string) : boolean;
    function AlterSequence(SequenceScript: string) : boolean;
    function DropSequence: boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  function GetSequences(OwnerName: string): string;

implementation

uses Util, frmSchemaBrowser, OraScripts, Languages;

resourcestring
  strSequenceDrop = 'Sequence %s has been dropped.';
  strSequenceAltered = 'Sequence %s has been altered.';
  strSequenceCreated = 'Sequence %s has been created.';
  
function GetSequences(OwnerName: string): string;
begin
  result := 'select * from ALL_SEQUENCES '
           +' where SEQUENCE_OWNER = '+Str(OwnerName)
           +' order by SEQUENCE_NAME ';
end;

constructor TSequence.Create;
begin
  inherited;
  FGrantList := TGrantList.Create;
  FSynonymList := TSynonymList.Create;
end;

destructor TSequence.destroy;
begin
  FGrantList.Free;
  FSynonymList.Free;
  inherited;  
end;

function TSequence.GetSequenceDetail: String;
begin
  Result :=
    'Select sequence_name, SEQUENCE_OWNER, to_char(min_value) min_value, '
   +' to_char(max_value) max_value, increment_by, '
   +' cycle_flag, order_flag, cache_size, to_char(Last_number) last_number '
   +' from ALL_SEQUENCES '
   +'WHERE SEQUENCE_NAME = :pName '
   +'  AND SEQUENCE_OWNER = :pOwner ';
end;

function TSequence.GetStatus: string;
var
  q1: TOraQuery;
begin
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectStatusSQL;
  q1.ParamByName('pOName').AsString := FSEQUENCE_NAME;
  q1.ParamByName('pOType').AsString := 'SEQUENCE';
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;
  result := FSEQUENCE_NAME+' ( Created: '+q1.FieldByName('CREATED').AsString
                            +' Last DDL: '+q1.FieldByName('LAST_DDL_TIME').AsString
                            +' Status: '+q1.FieldByName('STATUS').AsString
                            +' )';

  q1.Close;
end;

function TSequence.GetDSUsedByList: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectUsedSQL;
  q1.ParamByName('pName').AsString := FSEQUENCE_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.ParamByName('pType').AsString := 'SEQUENCE';
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

procedure TSequence.SetDDL;
var
  q1: TOraQuery;
begin
  if FSEQUENCE_NAME = '' then exit;
  if FOWNER = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetSequenceDetail;
  q1.ParamByName('pName').AsString := FSEQUENCE_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;
  FOWNER := q1.FieldByName('SEQUENCE_OWNER').AsString;
  FSEQUENCE_NAME := q1.FieldByName('SEQUENCE_NAME').AsString;
  FMIN_VALUE := q1.FieldByName('MIN_VALUE').AsString;
  FMAX_VALUE := q1.FieldByName('MAX_VALUE').AsString;
  FINCREMENT_BY := q1.FieldByName('INCREMENT_BY').AsString;
  FCYCLE_FLAG := q1.FieldByName('CYCLE_FLAG').AsString = 'Y';
  FORDER_FLAG := q1.FieldByName('ORDER_FLAG').AsString = 'Y';
  FCACHE_SIZE := q1.FieldByName('CACHE_SIZE').AsString;
  FLAST_NUMBER := q1.FieldByName('LAST_NUMBER').AsString;
  Q1.close;

  FGrantList.OraSession := OraSession;
  FGrantList.TableName := FSEQUENCE_NAME;
  FGrantList.TableSchema := FOWNER;
  FGrantList.ObjectType := dbSequences;
  FGrantList.SetDDL;

  FSynonymList.OraSession := OraSession;
  FSynonymList.TableName := FSEQUENCE_NAME;
  FSynonymList.TableOwner := FOWNER;
  FSynonymList.ObjectType := dbSequences;
  FSynonymList.SetDDL;
end;

function TSequence.GetDDL: string;
begin
  result := 'CREATE SEQUENCE '+FOWNER+'.'+ FSEQUENCE_NAME+ln
           +'  START WITH '+FSTART_WITH+ln
           +'  INCREMENT BY '+FINCREMENT_BY+ln;
  if FMAX_VALUE <> '0' then
     result := result +'  MAXVALUE '+FMAX_VALUE+ln;

  result := result +'  MINVALUE '+FMIN_VALUE+ln;

  if FCYCLE_FLAG then
     result := result +'  CYCLE '+ln
  else
     result := result +'  NOCYCLE '+ln;

  if FCACHE_SIZE <> '0' then
     result := result +'  CACHE '+FCACHE_SIZE+ln
  else
     result := result +'  NOCACHE '+ln;

  if FORDER_FLAG then
     result := result +'  ORDER '+ln
  else
     result := result +'  NOORDER '+ln;

  result := result + ln + FGrantList.GetDDL
                   + ln + FSynonymList.GetDDL;

end;

function TSequence.GetAlterDDL: string;
begin
  result := 'ALTER SEQUENCE '+FOWNER+'.'+ FSEQUENCE_NAME+ln
           +'  INCREMENT BY '+FINCREMENT_BY+ln;
  if FMAX_VALUE <> '0' then
     result := result +'  MAXVALUE '+FMAX_VALUE+ln;

  result := result +'  MINVALUE '+FMIN_VALUE+ln;

  if FCYCLE_FLAG then
     result := result +'  CYCLE '+ln
  else
     result := result +'  NOCYCLE '+ln;

  if FCACHE_SIZE <> '0' then
     result := result +'  CACHE '+FCACHE_SIZE+ln
  else
     result := result +'  NOCACHE '+ln;

  if FORDER_FLAG then
     result := result +'  ORDER '+ln
  else
     result := result +'  NOORDER '+ln;
end;

function TSequence.CreateSequence(SequenceScript: string) : boolean;
begin
  result := false;
  if FSEQUENCE_NAME = '' then exit;
  result := ExecSQL(SequenceScript,Format(ChangeSentence('strSequenceCreated',strSequenceCreated),[FSEQUENCE_NAME]) , FOraSession);
end;

function TSequence.AlterSequence(SequenceScript: string) : boolean;
begin
  result := false;
  if FSEQUENCE_NAME = '' then exit;
  result := ExecSQL(SequenceScript, Format(ChangeSentence('strSequenceAltered',strSequenceAltered),[FSEQUENCE_NAME]), FOraSession);
end;

function TSequence.DropSequence: boolean;
var
  FSQL: string;
begin
  result := false;
  if FSEQUENCE_NAME = '' then exit;
  FSQL := 'drop Sequence '+FOWNER+'.'+FSEQUENCE_NAME;
  result := ExecSQL(FSQL, Format(ChangeSentence('strSequenceDrop',strSequenceDrop),[FSEQUENCE_NAME]), FOraSession);
end;


end.
