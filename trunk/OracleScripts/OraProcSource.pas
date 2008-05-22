unit OraProcSource;

interface

uses Classes, SysUtils, Ora, OraStorage, DB,DBQuery, Forms, Dialogs,
     OraGrants, OraSynonym, VirtualTable;

type

  TProcSource = class(TObject)
  private
    FOWNER,
    FSOURCE_NAME,
    FCODE: string;
    FBODY_CODE: string;
    FSOURCE_TYPE: TSourceType;
    FGrantList : TGrantList;
    FSynonymList : TSynonymList;
    FOraSession: TOraSession;
    FMode: TMode;
    function GetSourceArguments: String;
    function GetSourceDetail: String;
    function GetSourceStatus: string;
    function GetArguments: TVirtualTable;
    function GetUsedByList: TVirtualTable;
    function GetUsesList: TVirtualTable;
    function GetSourceErrors: TVirtualTable;
    function GetSourceBodyErrors: TVirtualTable;
  public
    property OWNER: String read FOWNER write FOWNER;
    property SOURCE_NAME: string read FSOURCE_NAME write FSOURCE_NAME;
    property SOURCE_TYPE: TSourceType read FSOURCE_TYPE write FSOURCE_TYPE;
    property CODE: string read FCODE write FCODE;
    property BODY_CODE: string read FBODY_CODE write FBODY_CODE;
    property GrantList: TGrantList read FGrantList write FGrantList;
    property SynonymList : TSynonymList read FSynonymList write FSynonymList;
    property SourceStatus: string read GetSourceStatus;
    property UsedByList: TVirtualTable read GetUsedByList;
    property UsesList: TVirtualTable read GetUsesList;
    property Arguments: TVirtualTable read GetArguments;
    property SourceErrors: TVirtualTable read GetSourceErrors;
    property SourceBodyErrors: TVirtualTable read GetSourceBodyErrors;
    property Mode: TMode read FMode write FMode; 
    property OraSession: TOraSession read FOraSession write FOraSession;
    constructor Create;
    destructor Destroy; override;
    procedure SetDDL;
    function GetDDL: string;
    function GetBodyDDL: string;
    function GetDefaultDDL: string;
    function GetDefaultBodyDDL: string;
    function CreateSource(SourceScript: string) : boolean;
    function AlterSource(SourceScript: string) : boolean;
    function RunSource(SourceScript: string) : boolean;
    function DropSource: boolean;
    function CompileSource: boolean;
  end;

function GetProcSources(ObjectType, OwnerName: string): string;
  
implementation

uses Util, frmSchemaBrowser, OraScripts, Languages;

resourcestring
  strSourceCompiled = '%s has been compiled.';
  strSourceDropped = '%s has been dropped.';
  strSourceCompleted = '%s completed.';
  strSourceCreated = '%s has been created/replaced.';

function GetProcSources(ObjectType, OwnerName: string): string;
begin
  result := 'select * from all_objects  '
           +' where OWNER = '+Str(OwnerName)
           +'  and object_type = '+Str(ObjectType)
           +' order by object_name ';
end;

function GetSourceErrorsSQL: string;
begin
  result :=
     'SELECT LINE,POSITION,TEXT FROM ALL_ERRORS '
    +'WHERE NAME = :pName '
    +' AND OWNER = :pOwner '
    +' AND TYPE = :pType '
    +' ORDER BY LINE,POSITION ';
end;

constructor TProcSource.Create;
begin
  inherited;
  FGrantList := TGrantList.Create;
  FSynonymList := TSynonymList.Create;
end;

destructor TProcSource.destroy;
begin
  inherited;
  FGrantList.Free;
  FSynonymList.Free;
end;   

function TProcSource.GetSourceArguments: String;
begin
  Result :=
    '    SELECT object_name , sequence,  RPAD('' '', data_level*2, '' '') || argument_name AS argument_name, '
    +'       (CASE '
    +'         WHEN data_type IN (''VARCHAR2'',''CHAR'') then TO_CHAR(nvl(data_length,200)) '
    +'         WHEN data_scale IS NULL OR data_scale = 0 THEN TO_CHAR(data_precision) '
    +'         ELSE TO_CHAR(data_precision) || '','' || TO_CHAR(data_scale) '
    +'       END) DATA_SIZE, '
    +'       data_type, in_out,  default_value '
    +'FROM   ALL_arguments '
    +'WHERE  package_name is null '
    +'  AND  object_name  = DECODE(UPPER(:pName), ''ALL'', object_name, UPPER(:pName)) '
    +'  and owner = :pOwner '
    +'ORDER BY object_name, overload, sequence';
end;

function TProcSource.GetSourceDetail: String;
begin
  Result :=
    'Select * from SYS.ALL_SOURCE '
   +'WHERE NAME = :pName '
   +'  AND OWNER = :pOwner '
   +'  AND TYPE = :pType '
   +' order by LINE ';
end;  

function TProcSource.GetSourceStatus: string;
var
  q1: TOraQuery;
begin
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectStatusSQL;
  q1.ParamByName('pOName').AsString := FSOURCE_NAME;
  q1.ParamByName('pOType').AsString := DBSourceType[FSOURCE_TYPE];
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;
  result := FSOURCE_NAME+' ( Created: '+q1.FieldByName('CREATED').AsString
                      +' Last DDL: '+q1.FieldByName('LAST_DDL_TIME').AsString
                      +' Status: '+q1.FieldByName('STATUS').AsString+' )';
  q1.Close;
end;

function TProcSource.GetArguments: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetSourceArguments;
  q1.ParamByName('pName').AsString := FSOURCE_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

function TProcSource.GetUsedByList: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectUsedsql;
  q1.ParamByName('pName').AsString := FSOURCE_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.ParamByName('pType').AsString := DBSourceType[FSOURCE_TYPE];
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

function TProcSource.GetUsesList: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectUsesSQL;
  q1.ParamByName('pName').AsString := FSOURCE_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.ParamByName('pType').AsString := DBSourceType[FSOURCE_TYPE];
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

function TProcSource.GetSourceErrors: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetSourceErrorsSQL;
  q1.ParamByName('pName').AsString := FSOURCE_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.ParamByName('pType').AsString := DBSourceType[FSOURCE_TYPE];
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

function TProcSource.GetSourceBodyErrors: TVirtualTable;
var
  q1: TOraQuery;
begin
  result := TVirtualTable.Create(nil);
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetSourceErrorsSQL;
  q1.ParamByName('pName').AsString := FSOURCE_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.ParamByName('pType').AsString := 'PACKAGE BODY';
  q1.Open;
  CopyDataSet(q1, result);
  q1.Close;
end;

procedure TProcSource.SetDDL;
var
  q1: TOraQuery;
  DBFormType: TDBFormType;
begin
  if FSOURCE_NAME = '' then exit;
  if FOWNER = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetSourceDetail;
  q1.ParamByName('pName').AsString := FSOURCE_NAME;
  q1.ParamByName('pOwner').AsString := FOWNER;
  q1.ParamByName('pType').AsString := DBSourceType[FSOURCE_TYPE];
  q1.Open;

  FCODE := '';
  while not q1.Eof do
  begin
    FCODE := FCODE + q1.FieldByName('TEXT').AsString;
    q1.Next;
  end;
  Q1.close;

  if FSOURCE_TYPE = stPackage then
  begin
    q1.SQL.Text := GetSourceDetail;
    q1.ParamByName('pName').AsString := FSOURCE_NAME;
    q1.ParamByName('pOwner').AsString := FOWNER;
    q1.ParamByName('pType').AsString := 'PACKAGE BODY';
    q1.Open;

    FBODY_CODE := '';
    while not q1.Eof do
    begin
      FBODY_CODE := FBODY_CODE + q1.FieldByName('TEXT').AsString;
      q1.Next;
    end;
    Q1.close;
  end;

  DBFormType := dbProcedures;
  
  if FSOURCE_TYPE = stProcedure then
     DBFormType := dbProcedures;

  if FSOURCE_TYPE = stFunction then
     DBFormType := dbFunctions;

  if FSOURCE_TYPE = stPackage then
     DBFormType := dbPackages;

  if FSOURCE_TYPE = stType then
     DBFormType := dbTypes;

  FGrantList.OraSession := OraSession;
  FGrantList.TableName := FSOURCE_NAME;
  FGrantList.TableSchema := FOWNER;
  FGrantList.ObjectType := DBFormType;
  FGrantList.SetDDL;

  FSynonymList.OraSession := OraSession;
  FSynonymList.TableName := FSOURCE_NAME;
  FSynonymList.TableOwner := FOWNER;
  FSynonymList.ObjectType := DBFormType;

  FSynonymList.SetDDL;
end;

function TProcSource.GetDDL: string;
begin
  with self do
  begin
    result := 'CREATE OR REPLACE '//+DBSourceType[FSOURCE_TYPE]+' '+FSOURCE_NAME +' IS '+ln
             +FCODE;
  end;
end;

function TProcSource.GetBodyDDL: string;
begin
  with self do
  begin
    result := 'CREATE OR REPLACE '//+DBSourceType[FSOURCE_TYPE]+' '+FSOURCE_NAME +' IS '+ln
             +FBODY_CODE;
  end;
end;

function TProcSource.GetDefaultBodyDDL: string;
begin
  if FSOURCE_TYPE = stPackage then
    result := 'CREATE OR REPLACE PACKAGE BODY '+FOWNER+'.'+FSOURCE_NAME+ln
             +'AS '+ln
             +'END '+FSOURCE_NAME+';'+ln
             +'/'+ln;
end;

function TProcSource.GetDefaultDDL: string;
begin
  if FSOURCE_TYPE = stProcedure then
    result := 'CREATE OR REPLACE PROCEDURE '+FOWNER+'.'+FSOURCE_NAME+' IS '+ln
             +'tmpVar NUMBER;'+ln
             +'BEGIN'+ln
             +'  tmpVar := 0;'+ln
             +'  EXCEPTION'+ln
             +'  WHEN NO_DATA_FOUND THEN'+ln
             +'    NULL;'+ln
             +'  WHEN OTHERS THEN'+ln
             +'    RAISE;'+ln
             +'END '+FSOURCE_NAME+';'+ln
             +'/'+ln;

  if FSOURCE_TYPE = stPackage then
    result := 'CREATE OR REPLACE PACKAGE '+FOWNER+'.'+FSOURCE_NAME+ln
             +'AS'+ln
             +'END '+FSOURCE_NAME+';'+ln
             +'/'+ln;
             {+'CREATE OR REPLACE PACKAGE BODY '+FOWNER+'.'+FSOURCE_NAME+ln
             +'AS '+ln
             +'END '+FSOURCE_NAME+';'+ln
             +'/'+ln;}

  if FSOURCE_TYPE = stFunction then
    result := 'CREATE OR REPLACE FUNCTION '+FOWNER+'.'+FSOURCE_NAME+' RETURN NUMBER IS '+ln
             +'tmpVar NUMBER;'+ln
             +'BEGIN'+ln
             +'  tmpVar := 0;'+ln
             +'  RETURN tmpVar;'+ln
             +'  EXCEPTION'+ln
             +'  WHEN NO_DATA_FOUND THEN'+ln
             +'    NULL;'+ln
             +'  WHEN OTHERS THEN'+ln
             +'    RAISE;'+ln
             +'END '+FSOURCE_NAME+';'+ln
             +'/'+ln;

  if FSOURCE_TYPE = stType then
    result := 'CREATE OR REPLACE TYPE '+FOWNER+'.'+FSOURCE_NAME+' AS OBJECT '+ln
             +'('+ln
             +'  NewAttribute VARCHAR2(255), '+ln
             +'  MEMBER FUNCTION MyFunction(Param1 IN NUMBER) RETURN NUMBER, '+ln
             +'  MEMBER PROCEDURE MyProcedure(Param1 IN NUMBER) '+ln
             +'); '+ln
             +'/'+ln;

end;

function TProcSource.CreateSource(SourceScript: string) : boolean;
begin
  result := false;
  if FSOURCE_NAME = '' then exit;
  result := ExecSQL(SourceScript, Format(ChangeSentence('strSourceCreated',strSourceCreated),[DBSourceType[FSOURCE_TYPE]+' '+FSOURCE_NAME]), FOraSession);
end;

function TProcSource.AlterSource(SourceScript: string) : boolean;
begin
  result := false;
  if FSOURCE_NAME = '' then exit;
  result := ExecSQL(SourceScript, '', FOraSession);
end;

function TProcSource.RunSource(SourceScript: string) : boolean;
begin
  result := false;
  if FSOURCE_NAME = '' then exit;
  result := ExecSQL(SourceScript, Format(ChangeSentence('strSourceCompleted',strSourceCompleted),[DBSourceType[FSOURCE_TYPE]]), FOraSession);
end;

function TProcSource.DropSource: boolean;
var
  FSQL: string;
begin
  result := false;
  if FSOURCE_NAME = '' then exit;
  FSQL := 'drop '+DBSourceType[FSOURCE_TYPE]+' '+FOWNER+'.'+FSOURCE_NAME;
  result := ExecSQL(FSQL, Format(ChangeSentence('strSourceDropped',strSourceDropped),[DBSourceType[FSOURCE_TYPE]+' '+FSOURCE_NAME]), FOraSession);
end;

function TProcSource.CompileSource: boolean;
var
  FSQL: string;
begin
  result := false;
  if FSOURCE_NAME = '' then exit;
  FSQL := 'alter '+DBSourceType[FSOURCE_TYPE]+' '+FOWNER+'.'+FSOURCE_NAME+' compile';
  result := ExecSQL(FSQL, Format(ChangeSentence('strSourceCompiled',strSourceCompiled),[DBSourceType[FSOURCE_TYPE]+' '+FSOURCE_NAME]), FOraSession);
end;


end.
