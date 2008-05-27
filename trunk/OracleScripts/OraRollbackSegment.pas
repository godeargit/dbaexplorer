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
unit OraRollbackSegment;

interface

uses Classes, SysUtils, Ora, OraStorage, DB, DBQuery, Forms, Dialogs, VirtualTable;

type

  TRollbackSegment = class(TObject)
  private
    FSEGMENT_NAME,
    FOWNER,
    FTABLESPACE_NAME: string;
    FINITIAL_EXTENT,
    FNEXT_EXTENT,
    FMIN_EXTENTS,
    FMAX_EXTENTS,
    FOPTSIZE : Extended;
    FPCT_INCREASE,
    FINSTANCE_NUM: integer;
    FSTATUS: string;
    FPUBLIC: Boolean;
    FMode: TMode;
    FOraSession: TOraSession;
    //function GetStatus: string;
    function GetRollbackSegmentDetail: String;
  public
    property SEGMENT_NAME : String read FSEGMENT_NAME write FSEGMENT_NAME;
    property OWNER : String read FOWNER write FOWNER;
    property TABLESPACE_NAME: String read FTABLESPACE_NAME write FTABLESPACE_NAME;
    property INITIAL_EXTENT: Extended read FINITIAL_EXTENT write FINITIAL_EXTENT;
    property NEXT_EXTENT: Extended read FNEXT_EXTENT write FNEXT_EXTENT;
    property MIN_EXTENTS: Extended read FMIN_EXTENTS write FMIN_EXTENTS;
    property MAX_EXTENTS: Extended read FMAX_EXTENTS write FMAX_EXTENTS;
    property OPTSIZE: Extended read FOPTSIZE write FOPTSIZE;
    property PCT_INCREASE: Integer read FPCT_INCREASE write FPCT_INCREASE;
    property INSTANCE_NUM: Integer read FINSTANCE_NUM write FINSTANCE_NUM;
    property STATUS: string read FSTATUS write FSTATUS;
    property PUBLIC: Boolean read FPUBLIC write FPUBLIC;
    property Mode: TMode read FMode write FMode;
    
    property OraSession: TOraSession read FOraSession write FOraSession;
    procedure SetDDL;
    function GetDDL: string;
    function GetAlterDDL: string;
    function RollbackSegmentToOnline: boolean;
    function RollbackSegmentToOffline: boolean;
    function CreateRollbackSegment(Script: string) : boolean;
    function AlterRollbackSegment(Script: string) : boolean;
    function DropRollbackSegment: boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  function GetRollbackSegments(): string;

implementation

uses Util, frmSchemaBrowser, OraScripts, Languages;

resourcestring
  strRollbackSegmentDropped = 'Rollback Segment %s has been dropped.';
  strRollbackSegmentAltered = 'Rollback Segment %s has been altered.';
  strRollbackSegmentCreated = 'Rollback Segment %s has been created.';
  strRollbackSegmentOnline = 'Rollback Segment %s has been Online.';
  strRollbackSegmentOffline = 'Rollback Segment %s has been Offline.';
  
function GetRollbackSegments(): string;
begin
  result := 'select * from SYS.Dba_rollback_segs '
           +' order by SEGMENT_NAME ';
end;

constructor TRollbackSegment.Create;
begin
  inherited;
end;

destructor TRollbackSegment.destroy;
begin
  inherited;
end;

function TRollbackSegment.GetRollbackSegmentDetail: String;
begin
  Result :=
    'Select * '
   +' from sys.Dba_rollback_segs '
   +'WHERE SEGMENT_NAME = :pName ';
end;

{function TRollbackSegment.GetStatus: string;
var
  q1: TOraQuery;
begin
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectStatusSQL;
  q1.ParamByName('pOName').AsString := ;
  q1.ParamByName('pOType').AsString := '';
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;
  result := FDB_LINK+' ( Created: '+q1.FieldByName('CREATED').AsString
                    +' Last DDL: '+q1.FieldByName('LAST_DDL_TIME').AsString
                    +' Status: '+q1.FieldByName('STATUS').AsString
                    +' )';
  q1.Close;
end; }

procedure TRollbackSegment.SetDDL;
var
  q1: TOraQuery;
begin
  if FSEGMENT_NAME = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetRollbackSegmentDetail;
  q1.ParamByName('pName').AsString := FSEGMENT_NAME;
  q1.Open;

  FSEGMENT_NAME := q1.FieldByName('SEGMENT_NAME').AsString;
  FOWNER := q1.FieldByName('OWNER').AsString;
  FPUBLIC := q1.FieldByName('OWNER').AsString = 'PUBLIC';
  FTABLESPACE_NAME := q1.FieldByName('TABLESPACE_NAME').AsString;
  FINITIAL_EXTENT := q1.FieldByName('INITIAL_EXTENT').AsFloat;
  FNEXT_EXTENT := q1.FieldByName('NEXT_EXTENT').AsFloat;
  FMIN_EXTENTS := q1.FieldByName('MIN_EXTENTS').AsFloat;
  FMAX_EXTENTS := q1.FieldByName('MAX_EXTENTS').AsFloat;
  FOPTSIZE := 0;
  FPCT_INCREASE := q1.FieldByName('PCT_INCREASE').AsInteger;
  FINSTANCE_NUM := StrToInt(isNull(q1.FieldByName('INSTANCE_NUM').AsString));
  FSTATUS := q1.FieldByName('STATUS').AsString;
  Q1.close;
end;

function TRollbackSegment.GetDDL: string;
var s: string;
begin
  s := '';
  if FPUBLIC then
    result := 'CREATE PUBLIC ROLLBACK SEGMENT '+FSEGMENT_NAME+ln
  else
    result := 'CREATE ROLLBACK SEGMENT '+FSEGMENT_NAME+ln;

  result := result +'TABLESPACE '+FTABLESPACE_NAME+ln;

  if isNullorZero(FINITIAL_EXTENT,0) then
     s := s + ln +'  INITIAL   '+FloatToStr(FINITIAL_EXTENT)+' K';

  if isNullorZero(FNEXT_EXTENT,0) then
     s := s + ln +'  NEXT       '+FloatToStr(FNEXT_EXTENT)+' K';

  if isNullorZero(FMIN_EXTENTS,0) then
     s := s + ln +'  MINEXTENTS '+FloatToStr(FMIN_EXTENTS)+' K';

  if isNullorZero(FMAX_EXTENTS,0) then
     s := s + ln +'  MAXEXTENTS '+FloatToStr(FMAX_EXTENTS)+' K';

  if isNullorZero(FOPTSIZE,0) then
     s := s + ln +'  OPTIMAL '+FloatToStr(FOPTSIZE)+' K';

  if length(s) > 0 then
     result := result + 'STORAGE ('
               +s
               +')';

  result := result +';';
end;

function TRollbackSegment.GetAlterDDL: string;
var s: string;
begin
  s := '';
  if FPUBLIC then
    result := 'ALTER PUBLIC ROLLBACK SEGMENT '+FSEGMENT_NAME+ln
  else
    result := 'ALTER ROLLBACK SEGMENT '+FSEGMENT_NAME+ln;

  if isNullorZero(FINITIAL_EXTENT,0) then
     s := s + ln +'  INITIAL   '+FloatToStr(FINITIAL_EXTENT)+' K';

  if isNullorZero(FNEXT_EXTENT,0) then
     s := s + ln +'  NEXT       '+FloatToStr(FNEXT_EXTENT)+' K';

  if isNullorZero(FMIN_EXTENTS,0) then
     s := s + ln +'  MINEXTENTS '+FloatToStr(FMIN_EXTENTS)+' K';

  if isNullorZero(FMAX_EXTENTS,0) then
     s := s + ln +'  MAXEXTENTS '+FloatToStr(FMAX_EXTENTS)+' K';

  if isNullorZero(FOPTSIZE,0) then
     s := s + ln +'  OPTIMAL '+FloatToStr(FOPTSIZE)+' K';

  if length(s) > 0 then
     result := result + 'STORAGE ('
               +s
               +')';
  result := result +';';
end;

function TRollbackSegment.RollbackSegmentToOnline: boolean;
var
  script: string;
begin
  result := false;
  script := 'ALTER ROLLBACK SEGMENT '+FSEGMENT_NAME+' ONLINE';
  if FSEGMENT_NAME = '' then exit;
  result := ExecSQL(Script, Format(ChangeSentence('strRollbackSegmentOnline',strRollbackSegmentOnline),[FSEGMENT_NAME]), FOraSession);
end;

function TRollbackSegment.RollbackSegmentToOffline: boolean;
var
  script: string;
begin
  result := false;
  script := 'ALTER ROLLBACK SEGMENT '+FSEGMENT_NAME+' OFFLINE';
  if FSEGMENT_NAME = '' then exit;
  result := ExecSQL(Script, Format(ChangeSentence('strRollbackSegmentOffline',strRollbackSegmentOffline),[FSEGMENT_NAME]), FOraSession);
end;

function TRollbackSegment.CreateRollbackSegment(Script: string) : boolean;
begin
  result := false;
  if FSEGMENT_NAME = '' then exit;
  result := ExecSQL(Script, Format(ChangeSentence('strRollbackSegmentCreated',strRollbackSegmentCreated),[FSEGMENT_NAME]), FOraSession);
end;

function TRollbackSegment.AlterRollbackSegment(Script: string) : boolean;
begin
  result := false;
  if FSEGMENT_NAME = '' then exit;
  result := ExecSQL(Script, Format(ChangeSentence('strRollbackSegmentAltered',strRollbackSegmentAltered),[FSEGMENT_NAME]), FOraSession);
end;

function TRollbackSegment.DropRollbackSegment: boolean;
var
  FSQL: string;
begin
  result := false;
  if FSEGMENT_NAME = '' then exit;
  FSQL := 'DROP ROLLBACK SEGMENT '+FSEGMENT_NAME;
  result := ExecSQL(FSQL, Format(ChangeSentence('strRollbackSegmentDropped',strRollbackSegmentDropped),[FSEGMENT_NAME]), FOraSession);
end;


end.
