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
unit OraMaterializedViewLog;

interface

uses Classes, SysUtils, Ora, OraStorage, OraGrants, OraSynonym, DB,DBQuery,
     Forms, Dialogs, VirtualTable;

type

  TMaterializedViewLog = class(TObject)
  private
    FOWNER,
    FTABLE_NAME,
    FPARALLEL: string;
    FCACHE : boolean;
    FLOGGING: TLoggingType;
    FENABLE_ROW_MOVEMENT: boolean;
    FNEW_VALUES: TMVNewValues;
    FROW_ID,
    FOBJECT_ID,
    FPRIMARY_KEY,
    FSEQUENCE: Boolean;
    FCOLUMNS: TStringList;
    FPhsicalAttributes : TPhsicalAttributes;
    FOraSession: TOraSession;
    function GetTablesList: TVirtualTable;
    function GetTableColumnsList: TVirtualTable;
  public
    property OWNER: string read FOWNER write FOWNER;
    property TABLE_NAME: string read FTABLE_NAME write FTABLE_NAME;
    property PARALLEL: string read FPARALLEL write FPARALLEL;
    property CACHE : boolean read FCACHE write FCACHE;
    property LOGGING: TLoggingType read FLOGGING write FLOGGING;
    property ENABLE_ROW_MOVEMENT: boolean read FENABLE_ROW_MOVEMENT write FENABLE_ROW_MOVEMENT;
    property NEW_VALUES: TMVNewValues read FNEW_VALUES write FNEW_VALUES;
    property ROW_ID: boolean read FROW_ID write FROW_ID;
    property OBJECT_ID: boolean read FOBJECT_ID write FOBJECT_ID;
    property PRIMARY_KEY: boolean read FPRIMARY_KEY write FPRIMARY_KEY;
    property SEQUENCE: boolean read FSEQUENCE write FSEQUENCE;
    property COLUMNS: TStringList read FCOLUMNS write FCOLUMNS;
    property PhsicalAttributes : TPhsicalAttributes read FPhsicalAttributes write FPhsicalAttributes;
    property TablesList: TVirtualTable read GetTablesList;
    property TableColumnsList: TVirtualTable read GetTableColumnsList;
    property OraSession: TOraSession read FOraSession write FOraSession;
    constructor Create;
    destructor Destroy; override;
    function GetDDL: string;
    function CreateViewLog(ViewLogScript: string) : boolean;
  end;

implementation

uses Util, frmSchemaBrowser, OraScripts, oraTable, Languages;

resourcestring
  strMaterializedViewLogCreated = 'Matetialized View Log %s has been created.';

constructor TMaterializedViewLog.Create;
begin
  inherited;
  FCOLUMNS := TStringList.Create;
end;

destructor TMaterializedViewLog.destroy;
begin
  inherited;
  FreeAndNil(FCOLUMNS);
end;                   

function TMaterializedViewLog.GetDDL: string;
var
  s,s1: string;
  i: integer;
begin
  result := '';
  with self do
  begin
    result := 'CREATE MATERIALIZED VIEW LOG ON  '+FOWNER+'.'+FTABLE_NAME;

    result := result + ln + GenerateStorage(FPhsicalAttributes);

    if FLOGGING = ltLogging then
       result := result + ln +'  LOGGING';
    if FLOGGING = ltNoLogging then
       result := result +ln + '  NOLOGGING';
    if FENABLE_ROW_MOVEMENT then
       result := result + ln + '  ENABLE ROW MOVEMENT';
    if FCACHE then
       result := result + ln +'  CACHE'
    else
       result := result + ln +'  NOCACHE';
    if isNullorZero(FPARALLEL,'0') then
       result := result + ln +'  PARALLEL '+FPARALLEL
    else
       result := result + ln +'  NOPARALLEL ';

    s := '';
    if FROW_ID then s := s +'ROWID,';
    if FOBJECT_ID then s := s +'OBJECT ID,';
    if FPRIMARY_KEY then s := s +'PRIMARY KEY,';
    if FSEQUENCE then s := s +'SEQUENCE,';
    if length(s) > 0 then delete(s,length(s),1);

    s1 := '';
    for i := 0 to FCOLUMNS.Count -1 do
    begin
      s1 := s1 + FCOLUMNS[i];
      if i <> FCOLUMNS.Count-1 then s1 := s1 + ',';
    end;
    if length(s1) > 0 then s1 := ln + '  ('+s1+')';

    if (length(s)> 0) or (length(s1)>0) then
       result := result + ln + '  WITH '
                             +s
                             +s1;

    if FNEW_VALUES = nvIncluding then
       result := result + ln + '  INCLUDING NEW VALUES';
    if FNEW_VALUES = nvExcluding then
       result := result + ln + '  EXCLUDING NEW VALUES'; 
  end;  //self
end; //GetDDL

function TMaterializedViewLog.CreateViewLog(ViewLogScript: string) : boolean;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  result := ExecSQL(ViewLogScript, Format(ChangeSentence('strMaterializedViewLogCreated',strMaterializedViewLogCreated),[FTABLE_NAME]), FOraSession);
end;

function TMaterializedViewLog.GetTablesList: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetTables(FOWNER);
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

function TMaterializedViewLog.GetTableColumnsList: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetTableColumns;
  q1.ParamByName('pTable').AsString := FTABLE_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;


end.
