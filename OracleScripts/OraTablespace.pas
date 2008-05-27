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
unit OraTablespace;

interface

uses Classes, SysUtils, Ora, OraStorage, DB, DBQuery, Forms, Dialogs, VirtualTable;

type

  DataFile = record
    NAME,
    TABLESPACE_NAME: string;
    SIZE: Extended;
    UNITS: string;
    REUSE,
    AUTOEXTEND: boolean;
    NEXT: Extended;
    NEXT_UNITS: string;
    MAX_UNLIMITED: boolean;
    MAX_SIZE: Extended;
    MAX_UNITS: string;
  end;
  TDataFile = ^DataFile;

  TTablespace = class(TObject)
  private
    FTABLESPACE_NAME: string;
    FBLOCK_SIZE,
    FINITIAL_EXTENT,
    FNEXT_EXTENT,
    FMIN_EXTENTS,
    FMAX_EXTENTS,
    FPCT_INCREASE,
    FMIN_EXTLEN: extended;
    FSTATUS: TTablespaceStatus;
    FCONTENTS: TTablespaceContents;
    FLOGGING: TLoggingType;
    FFORCE_LOGGING: boolean;
    FEXTENT_MANAGEMENT: TTablespaceExtentManagement;
    FALLOCATION_TYPE: TTablespaceAllocation;
    FSEGMENT_SPACE_MANAGEMENT: TSegmentSpaceManagement;
    FDEF_TAB_COMPRESSION: boolean;
    FRETENTION: TTablespaceRetention;
    FBIGFILE: boolean;
    FDataFileList: TList;

    FMode: TMode;
    FOraSession: TOraSession;
    function GetTablespaceDetail: String;
    function GetDataFileDetail: String;
    function GetDataFile(Index: Integer): TDataFile;
    procedure SetDataFile(Index: Integer; DataFile: TDataFile);
    function GetDataFileCount: Integer;
    function GetDataFileDDL: string;
    function GetAlterDataFileDDL: string;
    procedure SetDataFileDDL;
  public
    property TABLESPACE_NAME : String read FTABLESPACE_NAME write FTABLESPACE_NAME;
    property BLOCK_SIZE : extended read FBLOCK_SIZE write FBLOCK_SIZE;
    property INITIAL_EXTENT : extended read FINITIAL_EXTENT write FINITIAL_EXTENT;
    property NEXT_EXTENT : extended read FNEXT_EXTENT write FNEXT_EXTENT;
    property MIN_EXTENTS : extended read FMIN_EXTENTS write FMIN_EXTENTS;
    property MAX_EXTENTS : extended read FMAX_EXTENTS write FMAX_EXTENTS;
    property PCT_INCREASE : extended read FPCT_INCREASE write FPCT_INCREASE;
    property MIN_EXTLEN : extended read FMIN_EXTLEN write FMIN_EXTLEN;
    property STATUS: TTablespaceStatus read FSTATUS write FSTATUS;
    property CONTENTS: TTablespaceContents read FCONTENTS write FCONTENTS;
    property LOGGING: TLoggingType read FLOGGING write FLOGGING;
    property FORCE_LOGGING: boolean read FFORCE_LOGGING write FFORCE_LOGGING;
    property EXTENT_MANAGEMENT: TTablespaceExtentManagement read FEXTENT_MANAGEMENT write FEXTENT_MANAGEMENT;
    property ALLOCATION_TYPE: TTablespaceAllocation read FALLOCATION_TYPE write FALLOCATION_TYPE;
    property SEGMENT_SPACE_MANAGEMENT: TSegmentSpaceManagement read FSEGMENT_SPACE_MANAGEMENT write FSEGMENT_SPACE_MANAGEMENT;
    property DEF_TAB_COMPRESSION: boolean read FDEF_TAB_COMPRESSION write FDEF_TAB_COMPRESSION;
    property RETENTION: TTablespaceRetention read FRETENTION write FRETENTION;
    property BIGFILE: boolean read FBIGFILE write FBIGFILE;
    property DataFileCount: Integer read GetDataFileCount;
    property DatafileItems[Index: Integer]: TDataFile read GetDataFile write SetDataFile;
    property Mode: TMode read FMode write FMode;
    property OraSession: TOraSession read FOraSession write FOraSession;
    procedure DataFileAdd(DataFile: TDataFile);
    procedure DataFileDelete(Index: Integer);
    function FindByDataFileId(FileName: string): integer;
    procedure SetDDL;
    function GetDDL: string;
    function GetAlterDDL(OldTablespace: TTablespace): string;
    function TablespaceToOnline: boolean;
    function TablespaceToOffline: boolean;
    function CreateTablespace(Script: string) : boolean;
    function AlterTablespace(Script: string) : boolean;
    function DropTablespace: boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  function GetTablespaces(): string;

implementation

uses Util, frmSchemaBrowser, OraScripts, Languages;

resourcestring
  strTablespaceDropped = 'Tablespace %s has been dropped.';
  strTablespaceAltered = 'Tablespace %s has been altered.';
  strTablespaceCreated = 'Tablespace %s has been created.';
  strTablespaceOnline = 'Tablespace %s has been Online.';
  strTablespaceOffline = 'Tablespace %s has been Offline.';
  
function GetTablespaces(): string;
begin
  result := 'select * from sys.user_tablespaces order by tablespace_name ';
end;

constructor TTablespace.Create;
begin
  FDataFileList := TList.Create;
  inherited;
end;

destructor TTablespace.destroy;
var
  i : Integer;
  FDataFile: TDataFile;
begin
  try
    if FDataFileList.Count > 0 then
    begin
      for i := FDataFileList.Count - 1 downto 0 do
      begin
        FDataFile := FDataFileList.Items[i];
        Dispose(FDataFile);
      end;
    end;
  finally
    FDataFileList.Free;
  end;
  inherited;
end;

function TTablespace.GetDataFile(Index: Integer): TDataFile;
begin
  Result := FDataFileList.Items[Index];
end;

procedure TTablespace.SetDataFile(Index: Integer; DataFile: TDataFile);
begin
  if Assigned(DataFile) then
    FDataFileList.Items[Index] := DataFile;
end;

function TTablespace.GetDataFileCount: Integer;
begin
  Result := FDataFileList.Count;
end;

procedure TTablespace.DataFileAdd(DataFile: TDataFile);
begin
  FDataFileList.Add(DataFile);
end;

procedure TTablespace.DataFileDelete(Index: Integer);
var
  FDataFile: TDataFile;
begin
  FDataFile := FDataFileList.Items[Index];
  Dispose(FDataFile);
  FDataFileList.Delete(Index);
end;

function TTablespace.FindByDataFileId(FileName: string): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to FDataFileList.Count -1 do
  begin
    if TDataFile(FDataFileList.Items[i])^.NAME = FileName then
    begin
       result := i;
       exit;
    end;
  end;
end;

function TTablespace.GetTablespaceDetail: String;
begin
  Result :=
    'Select * '
   +' from sys.user_tablespaces '
   +'WHERE tablespace_name = :pName ';
end;

function TTablespace.GetDataFileDetail: String;
begin
  Result :=
    'Select * '
   +' from DBA_DATA_FILES '
   +'WHERE tablespace_name = :pName ';
end;

procedure TTablespace.SetDDL;
var
  q1: TOraQuery;
begin
  if FTABLESPACE_NAME = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetTablespaceDetail;
  q1.ParamByName('pName').AsString := FTABLESPACE_NAME;
  q1.Open;

  FTABLESPACE_NAME := q1.FieldByName('TABLESPACE_NAME').AsString;
  FBLOCK_SIZE := StrToFloat(isNull(q1.FieldByName('BLOCK_SIZE').AsString));
  FINITIAL_EXTENT := StrToFloat(isNull(q1.FieldByName('INITIAL_EXTENT').AsString));
  FNEXT_EXTENT := StrToFloat(isNull(q1.FieldByName('NEXT_EXTENT').AsString));
  FMIN_EXTENTS := StrToFloat(isNull(q1.FieldByName('MIN_EXTENTS').AsString));
  FMAX_EXTENTS := StrToFloat(isNull(q1.FieldByName('MAX_EXTENTS').AsString));
  FPCT_INCREASE := StrToFloat(isNull(q1.FieldByName('PCT_INCREASE').AsString));
  FMIN_EXTLEN := StrToFloat(isNull(q1.FieldByName('MIN_EXTLEN').AsString));

  FSTATUS := tsOnline;
  if q1.FieldByName('STATUS').AsString = 'READ ONLY' then FSTATUS := tsReadOnly;
  if q1.FieldByName('STATUS').AsString = 'OFFLINE' then FSTATUS := tsOffline;

  FCONTENTS := tcPermanent;
  if q1.FieldByName('CONTENTS').AsString = 'TEMPORARY' then  FCONTENTS := tcTemporary;
  if q1.FieldByName('CONTENTS').AsString = 'UNDO' then  FCONTENTS := tcUndo;

  FLOGGING := ltDefault;
  if q1.FieldByName('LOGGING').AsString = 'LOGGING' then  FLOGGING := ltLogging;
  if q1.FieldByName('LOGGING').AsString = 'NOLOGGING' then  FLOGGING := ltNoLogging;

  FFORCE_LOGGING := q1.FieldByName('FORCE_LOGGING').AsString = 'YES';

  FEXTENT_MANAGEMENT := temDictionary;
  if q1.FieldByName('EXTENT_MANAGEMENT').AsString = 'LOCAL' then FEXTENT_MANAGEMENT := temLocal;

  FALLOCATION_TYPE := taDefault;
  if q1.FieldByName('ALLOCATION_TYPE').AsString = 'UNIFORM' then
     FALLOCATION_TYPE := taUniform;
  if q1.FieldByName('ALLOCATION_TYPE').AsString = 'SYSTEM' then
     FALLOCATION_TYPE := taAuto;

  FSEGMENT_SPACE_MANAGEMENT := ssmManual;
  if q1.FieldByName('SEGMENT_SPACE_MANAGEMENT').AsString = 'AUTO' then
     FSEGMENT_SPACE_MANAGEMENT := ssmAuto;

  FDEF_TAB_COMPRESSION := q1.FieldByName('DEF_TAB_COMPRESSION').AsString = 'ENABLED';

  FRETENTION := trGuarantee;
  if q1.FieldByName('RETENTION').AsString = 'NOT APPLY' then FRETENTION := trNotApply;
  if q1.FieldByName('RETENTION').AsString = 'NOGUARANTEE' then FRETENTION := trNoGuarantee;

  FBIGFILE := q1.FieldByName('BIGFILE').AsString = 'YES';

  Q1.close;

  SetDataFileDDL;
end;

procedure TTablespace.SetDataFileDDL;
var
  q1: TOraQuery;
  DataFile: TDataFile;
begin
  if FTABLESPACE_NAME = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetDataFileDetail;
  q1.ParamByName('pName').AsString := FTABLESPACE_NAME;
  q1.Open;
  while not q1.Eof do
  begin
    new(DataFile);
    DataFile^.TABLESPACE_NAME := FTABLESPACE_NAME;
    DataFile^.NAME := q1.FieldByName('FILE_NAME').AsString;
    DataFile^.SIZE := q1.FieldByName('BYTES').AsFloat;
    DataFile^.UNITS := 'KB';
    DataFile^.REUSE := FALSE;
    DataFile^.AUTOEXTEND := q1.FieldByName('AUTOEXTENSIBLE').AsString = 'YES';
    DataFile^.NEXT := 0;
    DataFile^.NEXT_UNITS := '';
    DataFile^.MAX_UNLIMITED := FALSE;
    DataFile^.MAX_SIZE := q1.FieldByName('MAXBYTES').AsFloat;
    DataFile^.MAX_UNITS := 'KB';
    DataFileAdd(DataFile);
    q1.Next;
  end;
end;

function TTablespace.GetDataFileDDL: string;
var
  i: integer;
begin
  result := '';
  for i := 0 to FDataFileList.Count -1 do
  begin
    result := result + ln
             + '  '+Str(TDataFile(FDataFileList.Items[i])^.NAME)
             +' SIZE '+FloatToStr(TDataFile(FDataFileList.Items[i])^.SIZE);
             //+' '+TDataFile(FDataFileList.Items[i])^.UNITS;
    if TDataFile(FDataFileList.Items[i])^.REUSE then
       result := result +' REUSE';

    if TDataFile(FDataFileList.Items[i])^.AUTOEXTEND then
    begin
      result := result +ln+'    AUTOEXTEND ON NEXT '
                          +FloatToStr(TDataFile(FDataFileList.Items[i])^.NEXT)
                          +' '+TDataFile(FDataFileList.Items[i])^.NEXT_UNITS
                          +' MAXSIZE ';
      if TDataFile(FDataFileList.Items[i])^.MAX_SIZE > 0 then
         result := result + FloatToStr(TDataFile(FDataFileList.Items[i])^.MAX_SIZE)
                          +' '+TDataFile(FDataFileList.Items[i])^.MAX_UNITS
      else
         result := result + ' UNLIMITED';
    end;
    if i <> FDataFileList.Count -1 then
       result := result +',';
  end;
  if result <> '' then result := ln+'DATAFILE'
                                 +result;
end;

function TTablespace.GetAlterDataFileDDL: string;
var
  i: integer;
begin
  result := '';
  for i := 0 to FDataFileList.Count -1 do
  begin
    result := result + ln +'ALTER TABLESPACE '+FTABLESPACE_NAME +' ADD DATAFILE '
             + '  '+Str(TDataFile(FDataFileList.Items[i])^.NAME)
             +' SIZE '+FloatToStr(TDataFile(FDataFileList.Items[i])^.SIZE);
             //+' '+TDataFile(FDataFileList.Items[i])^.UNITS;
    if TDataFile(FDataFileList.Items[i])^.REUSE then
       result := result +' REUSE';

    if TDataFile(FDataFileList.Items[i])^.AUTOEXTEND then
    begin
      result := result +ln+'    AUTOEXTEND ON NEXT '
                          +FloatToStr(TDataFile(FDataFileList.Items[i])^.NEXT)
                          +' '+TDataFile(FDataFileList.Items[i])^.NEXT_UNITS
                          +' MAXSIZE ';
      if TDataFile(FDataFileList.Items[i])^.MAX_SIZE > 0 then
         result := result + FloatToStr(TDataFile(FDataFileList.Items[i])^.MAX_SIZE)
                          +' '+TDataFile(FDataFileList.Items[i])^.MAX_UNITS
      else
         result := result + ' UNLIMITED';
    end;
    if i <> FDataFileList.Count -1 then
       result := result +';';
  end;
end;

function TTablespace.GetDDL: string;
var
  s: string;
begin
  s := '';
  if FCONTENTS = tcTemporary then
  begin
    if FBIGFILE then
       result := 'CREATE BIGFILE TEMPORARY TABLESPACE '+FTABLESPACE_NAME
    else
       result := 'CREATE TEMPORARY TABLESPACE '+FTABLESPACE_NAME;
    result :=  result + ln +'EXTENT MANAGEMENT LOCAL UNIFORM';
  end;

  if FCONTENTS = tcUndo then
  begin
    if FBIGFILE then
       result := 'CREATE BIGFILE UNDO TABLESPACE '+FTABLESPACE_NAME
    else
       result := 'CREATE UNDO TABLESPACE '+FTABLESPACE_NAME;

    if FBLOCK_SIZE > 0 then
       result := result + ln + 'BLOCKSIZE '+FloatToStr(FBLOCK_SIZE);

    if FSTATUS = tsOnline then
       result := result + ln + 'ONLINE';
    if FSTATUS = tsOffline then
       result := result + ln + 'OFFLINE';

    result :=  result + ln +'EXTENT MANAGEMENT LOCAL AUTOALLOCATE';

    if FRETENTION = trGuarantee then
       result := result + ln + 'RETENTION GUARANTEE';
    if FRETENTION = trNoGuarantee then
       result := result + ln + 'RETENTION NOGUARANTEE';
  end;

  if FCONTENTS = tcPermanent then
  begin
    if FBIGFILE then
       result := 'CREATE BIGFILE TABLESPACE '+FTABLESPACE_NAME
    else
       result := 'CREATE TABLESPACE '+FTABLESPACE_NAME;

    result := result + GetDataFileDDL;

    if FBLOCK_SIZE > 0 then
       result := result + ln + 'BLOCKSIZE '+FloatToStr(FBLOCK_SIZE);

    if FLOGGING = ltLogging then
       result := result + ln + 'LOGGING';
    if FLOGGING = ltNoLogging then
       result := result + ln + 'NOLOGGING';

    if FFORCE_LOGGING then
       result := result + ln + 'FORCE LOGGING';

    if FDEF_TAB_COMPRESSION then
       result := result + ln + 'DEFAULT COMPRESS '
    else
       result := result + ln + 'DEFAULT NOCOMPRESS ';

    if FSTATUS = tsOnline then
       result := result + ln + 'ONLINE';

    if FSTATUS = tsOffline then
       result := result + ln + 'OFFLINE';

    if FCONTENTS = tcPermanent then
       result := result + ln + 'PERMANENT';

    if FALLOCATION_TYPE = taUniform then
       result := result + ln + 'EXTENT MANAGEMENT LOCAL UNIFORM';
    if FALLOCATION_TYPE = taAuto then
       result := result + ln + 'EXTENT MANAGEMENT LOCAL AUTOALLOCATE';
    if FALLOCATION_TYPE = taDefault then
       result := result + ln + 'EXTENT MANAGEMENT LOCAL';

    if FSEGMENT_SPACE_MANAGEMENT = ssmManual then
       result := result + ln + 'SEGMENT SPACE MANAGEMENT MANUAL'
    else
      result := result + ln + 'SEGMENT SPACE MANAGEMENT AUTO';

  end; //tcPermanent

  result := result +';';
end;

function TTablespace.GetAlterDDL(OldTablespace: TTablespace): string;
var
  s: string;
begin
  s := '';
  if FLOGGING <> OldTablespace.LOGGING then
  begin
    if FLOGGING = ltLogging then
       result := result + ln +'ALTER TABLESPACE '+ FTABLESPACE_NAME + ' LOGGING';
    if FLOGGING = ltNoLogging then
       result := result + ln +'ALTER TABLESPACE '+ FTABLESPACE_NAME + ' NOLOGGING';
    result := result +';';
  end;

  if FFORCE_LOGGING <> OldTablespace.FORCE_LOGGING then
     if FFORCE_LOGGING then
        result := result + ln +'ALTER TABLESPACE '+ FTABLESPACE_NAME +' FORCE LOGGING;'
     else
        result := result + ln +'ALTER TABLESPACE '+ FTABLESPACE_NAME +' NO FORCE LOGGING;';

  if FDEF_TAB_COMPRESSION <> OldTablespace.DEF_TAB_COMPRESSION then
  begin
    result := result + ln +'ALTER TABLESPACE '+ FTABLESPACE_NAME +' ';
    if FDEF_TAB_COMPRESSION then
       result := result + 'DEFAULT COMPRESS '
    else
       result := result + 'DEFAULT NOCOMPRESS ';
    result := result +';';
  end;

  if FSTATUS <> OldTablespace.STATUS then
  begin
    result := result + ln +'ALTER TABLESPACE '+ FTABLESPACE_NAME +' ';
    if FSTATUS = tsOnline then
       result := result + 'ONLINE';

    if FSTATUS = tsOffline then
       result := result + 'OFFLINE';

    if FSTATUS = tsReadOnly then
       result := result + 'READ ONLY';
    result := result +';';
  end;

  result := result + GetAlterDataFileDDL;
end;

function TTablespace.TablespaceToOnline: boolean;
var
  script: string;
begin
  result := false;
  if FTABLESPACE_NAME = '' then exit;
  script := 'ALTER TABLESPACE '+FTABLESPACE_NAME+' ONLINE';
  result := ExecSQL(Script, Format(ChangeSentence('strTablespaceOnline',strTablespaceOnline),[FTABLESPACE_NAME]), FOraSession);
end;

function TTablespace.TablespaceToOffline: boolean;
var
  script: string;
begin
  result := false;
  if FTABLESPACE_NAME = '' then exit;
  script := 'ALTER TABLESPACE '+FTABLESPACE_NAME+' OFFLINE';
  result := ExecSQL(Script, Format(ChangeSentence('strTablespaceOffline',strTablespaceOffline),[FTABLESPACE_NAME]), FOraSession);
end;

function TTablespace.CreateTablespace(Script: string) : boolean;
begin
  result := false;
  if FTABLESPACE_NAME = '' then exit;
  result := ExecSQL(Script, Format(ChangeSentence('strTablespaceCreated',strTablespaceCreated),[FTABLESPACE_NAME]), FOraSession);
end;

function TTablespace.AlterTablespace(Script: string) : boolean;
begin
  result := false;
  if FTABLESPACE_NAME = '' then exit;
  result := ExecSQL(Script, Format(ChangeSentence('strTablespaceAltered',strTablespaceAltered),[FTABLESPACE_NAME]), FOraSession);
end;

function TTablespace.DropTablespace: boolean;
var
  FSQL: string;
begin
  result := false;
  if FTABLESPACE_NAME = '' then exit;
  FSQL := 'DROP TABLESPACE '+FTABLESPACE_NAME;
  result := ExecSQL(FSQL, Format(ChangeSentence('strTablespaceDropped',strTablespaceDropped),[FTABLESPACE_NAME]), FOraSession);
end;


end.
