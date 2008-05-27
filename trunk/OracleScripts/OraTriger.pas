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
unit OraTriger;

interface

uses Classes, SysUtils, Ora, OraStorage, DB,DBQuery, Forms, Dialogs, VirtualTable;

type

  TTrigger = class(TObject)
  private
    FOWNER,
    FTRIGGER_NAME,
    FTRIGGER_TYPE,
    FTRIGGERING_EVENT,
    FTABLE_OWNER,
    FBASE_OBJECT_TYPE,
    FTABLE_NAME,
    FCOLUMN_NAME,
    FREFERENCING_NAMES,
    FWHEN_CLAUSE,
    FSTATUS,
    FDESCRIPTION,
    FACTION_TYPE,
    FTRIGGER_BODY : string;
    FOraSession: TOraSession;
    function GetTrigerDetail: String;
    function GetTriggerStatus: string;
    function GetTriggerErrors: TVirtualTable;
    function GetUsedByList: TVirtualTable;
    function GetUsesList: TVirtualTable;
  public
    property OWNER: String read FOwner write FOwner;
    property TRIGGER_NAME: String read FTRIGGER_NAME write FTRIGGER_NAME;
    property TRIGGER_TYPE: String read FTRIGGER_TYPE write FTRIGGER_TYPE;
    property TRIGGERING_EVENT: String read FTRIGGERING_EVENT write FTRIGGERING_EVENT;
    property TABLE_OWNER: String read FTABLE_OWNER write FTABLE_OWNER;
    property BASE_OBJECT_TYPE: String read FBASE_OBJECT_TYPE write FBASE_OBJECT_TYPE;
    property TABLE_NAME: String read FTABLE_NAME write FTABLE_NAME;
    property COLUMN_NAME: String read FCOLUMN_NAME write FCOLUMN_NAME;
    property REFERENCING_NAMES: String read FREFERENCING_NAMES write FREFERENCING_NAMES;
    property WHEN_CLAUSE: String read FWHEN_CLAUSE write FWHEN_CLAUSE;
    property STATUS: String read FSTATUS write FSTATUS;
    property DESCRIPTION: String read FDESCRIPTION write FDESCRIPTION;
    property ACTION_TYPE: String read FACTION_TYPE write FACTION_TYPE;
    property TRIGGER_BODY: String read FTRIGGER_BODY write FTRIGGER_BODY;
    property TriggerStatus: String read GetTriggerStatus;
    property TriggerErrors: TVirtualTable read GetTriggerErrors;
    property UsedByList: TVirtualTable read GetUsedByList;
    property UsesList: TVirtualTable read GetUsesList;
    property OraSession: TOraSession read FOraSession write FOraSession;
    constructor Create;
    destructor Destroy; override;
    procedure SetDDL;
    function GetDDL: string;
    function CreateTrigger(TriggerScript: string) : boolean;
    function DropTrigger: boolean;
    function EnableTrigger: boolean;
    function DisableTrigger: boolean;
    function CompileTrigger: boolean;

  end;

  function GetOraTriggers: string;
  function GetTriggers(OwnerName: string): string;

implementation

uses Util, frmSchemaBrowser, OraScripts, Languages;

resourcestring
  strTriggerCompiled = 'Trigger %s has been compiled.';
  strTriggerDisabled = 'Trigger %s has been disabled.';
  strTriggerEnabled = 'Trigger %s has been enabled.';
  strTriggerDropped = 'Trigger %s has been dropped.';
  strTriggerCreated = 'Trigger %s has been created.';
    
{**************************** TTriger **************************************}

function GetTriggerErrorsSQL: string;
begin
  result :=
     'SELECT LINE,POSITION,TEXT FROM ALL_ERRORS '
    +'WHERE NAME = :pName '
    +' AND OWNER = :pOwner '
    +' AND TYPE = ''TRIGGER'' '
    +' ORDER BY LINE,POSITION ';
end;

//schema browser için
function GetTriggers(OwnerName: string): string;
begin
  result := 'select * from ALL_TRIGGERS '
           +' where OWNER = '+Str(OwnerName)
           +' order by trigger_name ';
end;

function GetOraTriggers: string;
begin
  result :=
    'Select t.trigger_name, t.trigger_type, t.triggering_event, '
   +'     t.when_clause, t.status, t.description, t.trigger_body, '
   +'     t.owner, o.object_id, o.CREATED, o.LAST_DDL_TIME '
   +'from ALL_OBJECTS o, ALL_TRIGGERS t '
   +'WHERE o.object_type = ''TRIGGER'' '
   +'  and o.object_name = t.trigger_name  '
   +'  and t.table_name  = :pName '
   +'  and t.BASE_OBJECT_TYPE = :pType '
   +'  and o.owner  = t.owner '
   +'  and O.OWNER = :pOwner ';
end;

constructor TTrigger.Create;
begin
  inherited;
end;

destructor TTrigger.destroy;
begin
  inherited;
end;   

function TTrigger.GetTrigerDetail: String;
begin
  Result :=
    'Select * from ALL_TRIGGERS '
   +'WHERE TRIGGER_NAME = :pName '
   +'  AND OWNER = :pOwner ';
end;

function TTrigger.GetTriggerStatus: string;
var
  q1: TOraQuery;
begin
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectStatusSQL;
  q1.ParamByName('pOName').AsString := FTRIGGER_NAME;
  q1.ParamByName('pOType').AsString := 'TRIGGER';
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;
  result := FTRIGGER_NAME+' ( Created: '+q1.FieldByName('CREATED').AsString
                            +' Last DDL: '+q1.FieldByName('LAST_DDL_TIME').AsString
                            +' Status: '+q1.FieldByName('STATUS').AsString
                            +' )';
  q1.Close;
end;

function TTrigger.GetTriggerErrors: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetTriggerErrorsSQL;
  q1.ParamByName('pName').AsString := FTRIGGER_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

function TTrigger.GetUsedByList: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectUsedSQL;
  q1.ParamByName('pName').AsString := FTRIGGER_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.ParamByName('pType').AsString := 'TRIGGER';
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

function TTrigger.GetUsesList: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectUsesSQL;
  q1.ParamByName('pName').AsString := FTRIGGER_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.ParamByName('pType').AsString := 'TRIGGER';
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

procedure TTrigger.SetDDL;
var
  q1: TOraQuery;
begin
  if FTRIGGER_NAME = '' then exit;
  if FOWNER = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetTrigerDetail;
  q1.ParamByName('pName').AsString := FTRIGGER_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;

  FTRIGGER_TYPE := q1.FieldByName('TRIGGER_TYPE').AsString;
  FTRIGGERING_EVENT := q1.FieldByName('TRIGGERING_EVENT').AsString;
  FTABLE_OWNER := q1.FieldByName('TABLE_OWNER').AsString;
  FBASE_OBJECT_TYPE := q1.FieldByName('BASE_OBJECT_TYPE').AsString;
  FTABLE_NAME := q1.FieldByName('TABLE_NAME').AsString;
  FCOLUMN_NAME := q1.FieldByName('COLUMN_NAME').AsString;
  FREFERENCING_NAMES := q1.FieldByName('REFERENCING_NAMES').AsString;
  FWHEN_CLAUSE := q1.FieldByName('WHEN_CLAUSE').AsString;
  FSTATUS := q1.FieldByName('STATUS').AsString;
  FDESCRIPTION := q1.FieldByName('DESCRIPTION').AsString;
  FACTION_TYPE := q1.FieldByName('ACTION_TYPE').AsString;
  FTRIGGER_BODY := q1.FieldByName('TRIGGER_BODY').AsString;
  Q1.close;
end;

function TTrigger.GetDDL: string;
begin
  with self do
  begin
    result := 'CREATE OR REPLACE TRIGGER '
              +FDESCRIPTION
              +FWHEN_CLAUSE+ln
              +FTRIGGER_BODY+ln;

    if FSTATUS = 'DISABLED' then result := result +ln+ 'ALTER TRIGGER '+FOWNER+'.'+FTRIGGER_NAME+' DISABLE;';             
  end;
end;

function TTrigger.CreateTrigger(TriggerScript: string) : boolean;
begin
  result := false;
  if FTRIGGER_NAME = '' then exit;
  result := ExecSQL(TriggerScript, Format(ChangeSentence('strTriggerCreated',strTriggerCreated),[FTRIGGER_NAME]), FOraSession);
end;

function TTrigger.DropTrigger: boolean;
var
  FSQL: string;
begin
  result := false;
  if FTRIGGER_NAME = '' then exit;
  FSQL := 'drop trigger '+FOWNER+'.'+FTRIGGER_NAME;
  result := ExecSQL(FSQL, Format(ChangeSentence('strTriggerDropped',strTriggerDropped),[FTRIGGER_NAME]), FOraSession);
end;

function TTrigger.EnableTrigger: boolean;
var
  FSQL: string;
begin
  result := false;
  if FTRIGGER_NAME = '' then exit;
  FSQL := 'alter trigger '+FOWNER+'.'+FTRIGGER_NAME+' enable';
  result := ExecSQL(FSQL, Format(ChangeSentence('strTriggerEnabled',strTriggerEnabled),[FTRIGGER_NAME]), FOraSession);
end;

function TTrigger.DisableTrigger: boolean;
var
  FSQL: string;
begin
  result := false;
  if FTRIGGER_NAME = '' then exit;
  FSQL := 'alter trigger '+FOWNER+'.'+FTRIGGER_NAME+' disable';
  result := ExecSQL(FSQL, Format(ChangeSentence('strTriggerDisabled',strTriggerDisabled),[FTRIGGER_NAME]), FOraSession);
end;

function TTrigger.CompileTrigger: boolean;
var
  FSQL: string;
begin
  result := false;
  if FTRIGGER_NAME = '' then exit;
  FSQL := 'alter trigger '+FOWNER+'.'+FTRIGGER_NAME+' compile';
  result := ExecSQL(FSQL, Format(ChangeSentence('strTriggerCompiled',strTriggerCompiled),[FTRIGGER_NAME]), FOraSession);
end;


end.
