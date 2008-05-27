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
unit OraMaterializedView;

interface

uses Classes, SysUtils, Ora, OraStorage, OraGrants, OraSynonym, DB,DBQuery,
     Forms, Dialogs, VirtualTable;

type

  TMaterializedView = class(TObject)
  private
    FOWNER,
    FNAME,
    FSQL_QUERY: string;
    FMODE: TMVRefreshMode;
    FWHEN: TMVWhenMethods;
    FSTART_TIME,
    FSTART_DATE,
    FNEXT_TIME,
    FNEXT_DATE : string;
    FREFRESH_TYPE: TMVRefreshType;
    FPARALLEL: string;
    FALLOW_UPDATES: boolean;
    FPREBUILT_OPTION: string;
    FENABLE_ROW_MOVEMENT,
    FENABLE_QUERY_REWRITE,
    FCOMPRESS: boolean;
    FBUILT_TYPE: TMVBuiltType;
    FINDEX_TABLESPACE: string;
    FUSE_DEFAULT_ROLLBACK_SEGMENT: boolean;
    FROLLBACK_SEGMENT_LOCATION: TMVSegmentLocation;
    FROLLBACK_SEGMENT_NAME: string;
    FCACHE : boolean;
    FLOGGING: TLoggingType;
    FPhsicalAttributes : TPhsicalAttributes;

    FOraSession: TOraSession;
  public
    property OWNER: string read FOWNER write FOWNER;
    property NAME: string  read FNAME write FNAME;
    property SQL_QUERY: string read FSQL_QUERY write FSQL_QUERY;
    property MODE: TMVRefreshMode read FMODE write FMODE;
    property WHEN: TMVWhenMethods read FWHEN write FWHEN;
    property START_TIME: string read  FSTART_TIME write FSTART_TIME;
    property START_DATE: string read  FSTART_DATE write FSTART_DATE;
    property NEXT_TIME: string read   FNEXT_TIME write FNEXT_TIME;
    property NEXT_DATE: string read   FNEXT_DATE write FNEXT_DATE;
    property REFRESH_TYPE: TMVRefreshType read  FREFRESH_TYPE write FREFRESH_TYPE;
    property PARALLEL: string read FPARALLEL write FPARALLEL;
    property ALLOW_UPDATES: boolean read FALLOW_UPDATES write FALLOW_UPDATES;
    property PREBUILT_OPTION: string read FPREBUILT_OPTION write FPREBUILT_OPTION;
    property ENABLE_ROW_MOVEMENT: boolean read FENABLE_ROW_MOVEMENT write FENABLE_ROW_MOVEMENT;
    property ENABLE_QUERY_REWRITE: boolean read FENABLE_QUERY_REWRITE write FENABLE_QUERY_REWRITE;
    property COMPRESS: boolean read FCOMPRESS write FCOMPRESS;
    property BUILT_TYPE: TMVBuiltType read FBUILT_TYPE write FBUILT_TYPE;
    property INDEX_TABLESPACE: string read FINDEX_TABLESPACE write FINDEX_TABLESPACE;
    property USE_DEFAULT_ROLLBACK_SEGMENT: boolean read FUSE_DEFAULT_ROLLBACK_SEGMENT write FUSE_DEFAULT_ROLLBACK_SEGMENT;
    property ROLLBACK_SEGMENT_LOCATION: TMVSegmentLocation read FROLLBACK_SEGMENT_LOCATION write FROLLBACK_SEGMENT_LOCATION;
    property ROLLBACK_SEGMENT_NAME: string read FROLLBACK_SEGMENT_NAME write FROLLBACK_SEGMENT_NAME;
    property CACHE : boolean read FCACHE write FCACHE;
    property LOGGING: TLoggingType read FLOGGING write FLOGGING;
    property PhsicalAttributes : TPhsicalAttributes read FPhsicalAttributes write FPhsicalAttributes;

    property OraSession: TOraSession read FOraSession write FOraSession;
    constructor Create;
    destructor Destroy; override;
    function GetDDL: string;
    function CreateView(ViewScript: string) : boolean;
    function ValidateQuery(Query: string) : boolean;
  end;

implementation

uses Util, frmSchemaBrowser, OraScripts, Languages;

resourcestring
  strMaterializedViewCreated = 'Matetialized View %s has been created.';
  strMaterializedViewValidate = 'Query parsed OK.';

constructor TMaterializedView.Create;
begin
  inherited;
end;

destructor TMaterializedView.destroy;
begin
  inherited;
end;


function TMaterializedView.GetDDL: string;
var
  s: string;
begin
  result := '';
  with self do
  begin
    result := 'CREATE MATERIALIZED VIEW '+FOWNER+'.'+FNAME;

    if FPREBUILT_OPTION = 'Reduced Precision' then
       result := result + ln + 'ON PREBUILT TABLE WITH REDUCED PRECISION';
    if FPREBUILT_OPTION = 'No Reduced Precision' then
       result := result + ln + 'ON PREBUILT TABLE WITHOUT REDUCED PRECISION';

    if FPREBUILT_OPTION = '' then
    begin
      result := result + ln + GenerateStorage(FPhsicalAttributes) ;

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
      if FCOMPRESS then
         result := result + ln +'  COMPRESS'
      else
         result := result + ln +'  NOCOMPRESS';
      if isNullorZero(FPARALLEL,'0') then
         result := result + ln +'  PARALLEL '+FPARALLEL
      else
         result := result + ln +'  NOPARALLEL ';
      if FBUILT_TYPE = btImmediate then
         result := result + ln +'  BUILD IMMEDIATE';
      if FBUILT_TYPE = btDeferred then
         result := result + ln +'  BUILD DEFERRED';
    end;

    if FINDEX_TABLESPACE <> '' then
       result := result + ln +'  USING INDEX TABLESPACE '+FINDEX_TABLESPACE;

    if FMODE = rmNever then
       result := result + ln +'  NEVER REFRESH'
    else
    begin
       result := result + ln +'  REFRESH';

      if FMODE = rmFast then result := result + ' FAST';
      if FMODE = rmComplete then result := result + ' COMPLETE';
      if FMODE = rmForce then result := result + ' FORCE';

      if FWHEN = wmOnDemand then result := result + ln + '  ON DEMAND';
      if FWHEN = wmOnCommit then result := result + ln + '  ON COMMIT';

      if FSTART_TIME <> '' then
         result := result + ln + '  START WITH TO_DATE('+str(FSTART_DATE+' '+FSTART_TIME)+','+str('dd.mm.yyyy hh24:mi:ss')+')';

      if FNEXT_TIME <> '' then
         result := result + ln + '  NEXT TO_DATE('+str(FNEXT_DATE+' '+FNEXT_TIME)+','+str('dd.mm.yyyy hh24:mi:ss')+')';

      if FREFRESH_TYPE = rtRowid then result := result + ln + '  WITH ROWID';
      if FREFRESH_TYPE = rtPrimaryKey then result := result + ln + '  WITH PRIMARY KEY';

      if FUSE_DEFAULT_ROLLBACK_SEGMENT then
         s := ' DEFAULT' else s := '';

      if FROLLBACK_SEGMENT_LOCATION = stMaster then
         result := result + ln + '  USING '+s+' MASTER ROLLBACK SEGMENT';

      if FROLLBACK_SEGMENT_LOCATION = stLocal then
         result := result + ln + '  USING '+s+' LOCAL ROLLBACK SEGMENT';

      if FROLLBACK_SEGMENT_NAME <> '' then
         result := result + ' '+FROLLBACK_SEGMENT_NAME;
    end; //rmNever

    if FALLOW_UPDATES then
       result := result + ln +'  FOR UPDATE';

    if FENABLE_QUERY_REWRITE then
       result := result + ln +'  ENABLE QUERY REWRITE'
    else
       result := result + ln +'  DISABLE QUERY REWRITE';

    result := result + ln +' as '
                     + ln +FSQL_QUERY;

  end;  //self
end; //GetDDL

function TMaterializedView.CreateView(ViewScript: string) : boolean;
begin
  result := false;
  if FNAME = '' then exit;
  result := ExecSQL(ViewScript, Format(ChangeSentence('strMaterializedViewCreated',strMaterializedViewCreated),[FNAME]), FOraSession);
end;

function TMaterializedView.ValidateQuery(Query: string) : boolean;
begin
  result := false;
  if Query = '' then exit;
  result := ExecSQL(Query, ChangeSentence('strMaterializedViewValidate',strMaterializedViewValidate), FOraSession);
end;


end.
