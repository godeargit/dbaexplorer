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
unit OraView;

interface

uses Classes, SysUtils, Ora, OraStorage, OraGrants, OraSynonym, DB,DBQuery,
     Forms, Dialogs, VirtualTable;

type

  TView = class(TObject)
  private
    FOWNER,
    FVIEW_NAME: string;
    FTEXT_LENGTH: integer;
    FTEXT: string;
    FTYPE_TEXT_LENGTH: integer;
    FTYPE_TEXT: string;
    FVIEW_TYPE_OWNER,
    FVIEW_TYPE,
    FSUPERVIEW_NAME: string;
    FCHECK_CONSTRAINT: string;
    FVIEW_COMMENT: string;
    FREAD_ONLY: Boolean;
    FCHECK_OPTION: Boolean;
    FFORCE_ON_CREATE: boolean;
    FRecCount : integer;
    FColumnLists : TColumnList;
    FGrantList : TGrantList;
    FSynonymList : TSynonymList;

    FOraSession: TOraSession;
    function GetViewDetail: String;
    function GetViewConstraint: string;
    function GetViewComment: string;
    function GetViewStatus: string;
    function GetUsedByList: TVirtualTable;
    function GetUsesList: TVirtualTable;
  public
    property OWNER: String read FOWNER write FOWNER;
    property VIEW_NAME: string read FVIEW_NAME write FVIEW_NAME;
    property TEXT_LENGTH: integer read FTEXT_LENGTH write FTEXT_LENGTH;
    property TEXT: string read FTEXT write FTEXT;
    property TYPE_TEXT_LENGTH: integer read FTYPE_TEXT_LENGTH write FTYPE_TEXT_LENGTH;
    property TYPE_TEXT: string read FTYPE_TEXT write FTYPE_TEXT;
    property VIEW_TYPE_OWNER: string read FVIEW_TYPE_OWNER write FVIEW_TYPE_OWNER;
    property VIEW_TYPE :string read FVIEW_TYPE write FVIEW_TYPE;
    property SUPERVIEW_NAME: string read FSUPERVIEW_NAME write FSUPERVIEW_NAME;
    property CHECK_CONSTRAINT: string read FCHECK_CONSTRAINT write FCHECK_CONSTRAINT;
    property VIEW_COMMENT: string read FVIEW_COMMENT write FVIEW_COMMENT;
    property READ_ONLY: Boolean read FREAD_ONLY write FREAD_ONLY;
    property CHECK_OPTION: Boolean read FCHECK_OPTION write FCHECK_OPTION;
    property FORCE_ON_CREATE: boolean read FFORCE_ON_CREATE write FFORCE_ON_CREATE;
    property ColumnLists : TColumnList read FColumnLists write FColumnLists;
    property GrantList: TGrantList read FGrantList write FGrantList;
    property SynonymList : TSynonymList read FSynonymList write FSynonymList;
    property ViewStatus: string read GetViewStatus;
    property UsedByList: TVirtualTable read GetUsedByList;
    property UsesList: TVirtualTable read GetUsesList;
    property OraSession: TOraSession read FOraSession write FOraSession;
    constructor Create;
    destructor Destroy; override;
    procedure SetDDL;
    function GetDDL: string;
    function CreateView(ViewScript: string) : boolean;
    function DropView: boolean;
    function CompileView: boolean;
    function RenameView(NewViewName: string) : boolean;
    function RecordCount: integer;
    function DisableALLTriggers: boolean;
    function EnableALLTriggers: boolean;
  end;

function GetViews(OwnerName: string): string;
function GetViewData(ViewName, Owner: string): string;
function GetViewsWithNested(OwnerName: string): string;

implementation

uses Util, frmSchemaBrowser, OraScripts, Languages;

resourcestring
  strTriggersEnabled = 'Triggers Enabled';
  strTriggersDisabled = 'Triggers Disabled';
  strViewRenamed = 'View %s has been renamed.';
  strViewCompiled = 'View %s has been compiled.';
  strViewDropped = 'View %s has been dropped.';
  strViewCreated = 'View %s has been created/replaced.';

function GetViewsWithNested(OwnerName: string): string;
begin
  result :='Select c.table_name VIEW_NAME, c.column_id, c.column_name, substr(c.data_type, 1, 30) DATA_TYPE '
        +' from   ALL_TAB_COLUMNS c '
        +' where  c.owner = '+#39+UpperCase(OwnerName)+#39
        +' and    c.data_type_owner is not null '
        +' and    c.data_type is not null '
        +' and    exists (select ''x'' '
        +'                from   ALL_VIEWS v '
        +'                where  v.owner = c.owner '
        +'                and    v.view_name = c.TABLE_NAME) '
        +' and    exists (select {+ ALL_ROWS } ''x'' '
        +'                from   ALL_TYPES t '
        +'                where  t.type_name = c.data_type '
        +'                and    t.owner     = c.data_type_owner) '
        +' order by 1,2 ';
end;

function GetViewData(ViewName, Owner: string): string;
begin
  result := 'select * from '+Owner+'.'+ViewName+'  ';
end;

function GetViews(OwnerName: string): string;
begin
  result := 'select * from ALL_VIEWS '
           +' where OWNER = '+Str(OwnerName)
           +' order by view_name ';
end;

constructor TView.Create;
begin
  inherited;
  FColumnLists := TColumnList.Create;
  FGrantList := TGrantList.Create;
  FSynonymList := TSynonymList.Create;
end;

destructor TView.destroy;
begin
  inherited;
  FColumnLists.Free;
  FGrantList.Free;
  FSynonymList.Free;
end;   

function TView.GetViewDetail: String;
begin
  Result :=
    'Select * from ALL_VIEWS '
   +'WHERE VIEW_NAME = :pName '
   +'  AND OWNER = :pOwner ';
end;

function TView.GetViewConstraint: string;
begin
  result :=
    'Select TABLE_NAME, CONSTRAINT_NAME '
   +'  from SYS.ALL_CONSTRAINTS '
   +' where owner = :pOwner '
   +'   AND constraint_type = ''V'' '
   +'   AND GENERATED = ''USER NAME'' '
   +'   and table_name = :pName ';
end;

function TView.GetViewComment: string;
begin
  result :=
    'select c.TABLE_NAME, NULL COLUMN_NAME, c.COMMENTS '
   +'  from SYS.ALL_TAB_COMMENTS c '
   +' WHERE c.OWNER = :pOwner '
   +'   AND c.COMMENTS IS NOT NULL '
   +'   AND C.TABLE_NAME = :pName ';
end;

function TView.GetViewStatus: string;
var
  q1: TOraQuery;
begin
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectStatusSQL;
  q1.ParamByName('pOName').AsString := FVIEW_NAME;
  q1.ParamByName('pOType').AsString := 'VIEW';
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;
  result := FVIEW_NAME+' ( Created: '+q1.FieldByName('CREATED').AsString
                      +' Last DDL: '+q1.FieldByName('LAST_DDL_TIME').AsString
                      +' Status: '+q1.FieldByName('STATUS').AsString+' )';
  q1.Close;
end;

function TView.GetUsedByList: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectUsedsql;
  q1.ParamByName('pName').AsString := FVIEW_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.ParamByName('pType').AsString := 'VIEW';
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

function TView.GetUsesList: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectUsesSQL;
  q1.ParamByName('pName').AsString := FVIEW_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.ParamByName('pType').AsString := 'VIEW';
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

procedure TView.SetDDL;
var
  q1: TOraQuery;
begin
  if FVIEW_NAME = '' then exit;
  if FOWNER = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetViewDetail;
  q1.ParamByName('pName').AsString := FVIEW_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;

  FTEXT_LENGTH := q1.FieldByName('TEXT_LENGTH').AsInteger;
  FTEXT := q1.FieldByName('TEXT').AsString;
  FTYPE_TEXT_LENGTH := q1.FieldByName('TYPE_TEXT_LENGTH').AsInteger;
  FTYPE_TEXT := q1.FieldByName('TYPE_TEXT').AsString;
  FVIEW_TYPE_OWNER := q1.FieldByName('VIEW_TYPE_OWNER').AsString;
  FVIEW_TYPE := q1.FieldByName('VIEW_TYPE').AsString;
  FSUPERVIEW_NAME := q1.FieldByName('SUPERVIEW_NAME').AsString;

  FCHECK_OPTION := pos('WITH CHECK OPTION', UpperCase(FTEXT))>0;
  FREAD_ONLY := pos('WITH READ ONLY', UpperCase(FTEXT))>0;

  if FCHECK_OPTION then delete(FTEXT, pos('WITH CHECK OPTION', UpperCase(FTEXT)), length('WITH CHECK OPTION'));
  if FREAD_ONLY then delete(FTEXT, pos('WITH READ ONLY', UpperCase(FTEXT)), length('WITH READ ONLY'));

  Q1.close;

  if FCHECK_OPTION then
  begin
    q1.SQL.Text := GetViewConstraint;
    q1.ParamByName('pName').AsString := FVIEW_NAME;
    q1.ParamByName('pOwner').AsString := FOWNER;
    q1.Open;
    if q1.FieldByName('CONSTRAINT_NAME').AsString <> '' then
       FCHECK_CONSTRAINT := 'CONSTRAINT '+q1.FieldByName('CONSTRAINT_NAME').AsString;
  end;
  
  q1.SQL.Text := GetViewComment;
  q1.ParamByName('pName').AsString := FVIEW_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;

  FVIEW_COMMENT := q1.FieldByName('COMMENTS').AsString;

  FColumnLists.OraSession := OraSession;
  FColumnLists.TableName := FVIEW_NAME;
  FColumnLists.Owner := FOWNER;
  FColumnLists.SetDDL;

  FGrantList.OraSession := OraSession;
  FGrantList.TableName := FVIEW_NAME;
  FGrantList.TableSchema := FOWNER;
  FGrantList.ObjectType := dbView;
  FGrantList.SetDDL;

  FSynonymList.OraSession := OraSession;
  FSynonymList.TableName := FVIEW_NAME;
  FSynonymList.TableOwner := FOWNER;
  FSynonymList.ObjectType := dbView;
  FSynonymList.SetDDL;
end;

function TView.GetDDL: string;
var
  force: string;
begin
  with self do
  begin
    if FFORCE_ON_CREATE then
       force :='FORCE'
    else
       force := '';

    result := 'CREATE OR REPLACE '+force+' VIEW '+FOWNER+'.'+FVIEW_NAME
             +FColumnLists.GetDDLOnlyColumns(FOWNER, FVIEW_NAME)
             +ln+'AS '
             +ln+FTEXT;

    if FCHECK_OPTION then
       result := result + ln + 'WITH CHECK OPTION ';

    if FCHECK_OPTION and (FCHECK_CONSTRAINT <> '') then
       result := result + ln + 'CONSTRAINT '+FCHECK_CONSTRAINT;

    if FREAD_ONLY then
       result := result + ln + 'WITH READ ONLY';

    result := result + ';'+ ln;

    if FVIEW_COMMENT <> '' then
       result := result + ln + 'COMMENT ON TABLE '+FOWNER+'.'+FVIEW_NAME+' IS '+str(FVIEW_COMMENT)+';';

    result := result + ln + ColumnLists.GetCommentDDL(FOWNER, FVIEW_NAME)+ln
                     + ln + FGrantList.GetDDL
                     + ln + FSynonymList.GetDDL;
  end;
end;

function TView.CreateView(ViewScript: string) : boolean;
begin
  result := false;
  if FVIEW_NAME = '' then exit;
  result := ExecSQL(ViewScript, Format(ChangeSentence('strViewCreated',strViewCreated),[FVIEW_NAME]) , FOraSession);
end;

function TView.DropView: boolean;
var
  FSQL: string;
begin
  result := false;
  if FVIEW_NAME = '' then exit;
  FSQL := 'drop view '+FOWNER+'.'+FVIEW_NAME;
  result := ExecSQL(FSQL, Format(ChangeSentence('strViewDropped',strViewDropped),[FVIEW_NAME]), FOraSession);
end;

function TView.CompileView: boolean;
var
  FSQL: string;
begin
  result := false;
  if FVIEW_NAME = '' then exit;
  FSQL := 'alter view '+FOWNER+'.'+FVIEW_NAME+' compile';
  result := ExecSQL(FSQL,  Format(ChangeSentence('strViewCompiled',strViewCompiled),[FVIEW_NAME]), FOraSession);
end;

function TView.RenameView(NewViewName: string) : boolean;
var
  FSQL: string;
begin
  result := false;
  if FVIEW_NAME = '' then exit;
  FSQL := 'rename '+FOWNER+'.'+FVIEW_NAME+' to '+NewViewName+'; '
         +'alter view '+FOWNER+'.'+NewViewName+' compile; ';
  result := ExecSQL(FSQL, Format(ChangeSentence('strViewRenamed',strViewRenamed),[FVIEW_NAME]), FOraSession);
end;

function TView.RecordCount: integer;
begin
  FRecCount := 0;
  ExecSQL('select count(*) from '+FOWNER+'.'+FVIEW_NAME, '', FOraSession, FRecCount);
  result := FRecCount;
end;

function TView.DisableALLTriggers: boolean;
var
  FSQL: string;
begin
  result := false;
  if FVIEW_NAME = '' then exit;
  FSQL := 'alter view '+(FOWNER)+'.'+(FVIEW_NAME)+' disable all triggers';
  result := ExecSQL(FSQL, ChangeSentence('strTriggersDisabled',strTriggersDisabled), FOraSession);
end;

function TView.EnableALLTriggers: boolean;
var
  FSQL: string;
begin
  result := false;
  if FVIEW_NAME = '' then exit;
  FSQL := 'alter view '+(FOWNER)+'.'+(FVIEW_NAME)+' enable all triggers';
  result := ExecSQL(FSQL, ChangeSentence('strTriggersEnabled',strTriggersEnabled), FOraSession);
end;


end.
