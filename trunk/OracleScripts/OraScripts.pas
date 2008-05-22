unit OraScripts;

interface

uses SysUtils, Util;
          
//function GetSchemas: string;
function GetTablespaces: string;
function GetTemporaryTablespaces: string;
function GetUserTypes(OwnerName: string): string;
function GetDBATypes(OwnerName: string): string;
function GetDBATypesAttrs(OwnerName, TypeName: string): string;
function GetObjectStatusSQL: string;
function GetObjectType: string;
function GetObjectUsedSQL: string;
function GetObjectUsesSQL: string;
function GetObjects: string;

function GetProfiles: string;

function FindInDB(SearchText: string;
                  Objects, Columns, Procedures: boolean;
                  SchemaList, TextPosition: string): string;

implementation

function GetProfiles: string;
begin
  result :=
      'Select  distinct(profile) profile from sys.DBA_PROFILES';
end;

function GetVersion:  string;
begin
  result :=
       ' select ''Database Instance   = ''||name from v$database;  '
      +'union '
      +' select ''Database Version    = ''||banner from v$version where rownum = 1; '
      +'union '
      +' select ''Database Block Size = ''||value from v$parameter where name = ''db_block_size'' ';
end;

{function GetSchemas: string;
begin
  result := 'SELECT USERNAME FROM SYS.ALL_USERS';
end;
}
function GetTablespaces: string;
begin
  result := 'select * from sys.user_tablespaces order by tablespace_name ';
end;

function GetTemporaryTablespaces: string;
begin
  result := 'select * from sys.user_tablespaces where contents = ''TEMPORARY'' '
           +' order by tablespace_name ';
end;

function GetUserTypes(OwnerName: string): string;
begin
  result :=
   ' SELECT TYPE_NAME FROM ALL_TYPES '
  +'  WHERE OWNER = '+Str(OwnerName)
  +'    AND TYPECODE IN (''OBJECT'', ''COLLECTION'', ''XMLTYPE'') '
  +' ORDER BY TYPE_NAME ';
end;

function GetDBATypes(OwnerName: string): string;
begin
  result :=
   ' SELECT TYPE_NAME FROM sys.all_types '
  +'  WHERE OWNER = '+Str(OwnerName)
  +' ORDER BY TYPE_NAME ';
end;

function GetDBATypesAttrs(OwnerName, TypeName: string): string;
begin
  result :=
   ' SELECT * from sys.all_TYPE_ATTRS '
  +'  WHERE OWNER = '+Str(OwnerName)
  +'    and type_name = '+Str(TypeName)
  +' ORDER BY ATTR_NO ';
end;


function GetObjectStatusSQL: string;
begin
  result :=
     'Select CREATED, LAST_DDL_TIME, OBJECT_ID, STATUS, TIMESTAMP '
    +'  from all_objects '
    +' where object_name = :pOName '
    +'   and object_type = :pOType '
    +'   and owner = :pOwner ';
end;

function GetObjectType: string;
begin
  result :=
     'Select * '
    +'  from all_objects '
    +' where object_name = :pOName '
    +'   and owner = :pOwner ';
end;

function GetObjects: string;
begin
  result :=
     'Select * '
    +'  from all_objects '
    +' where owner = :pOwner '
    +'  and object_type = :pOType '
    +'  order by object_name ';
end;

function GetObjectUsedSQL: string;
begin
  result :=
    'Select owner, object_type, object_name, object_id, status '
    +'from ALL_OBJECTS where object_id in ( '
    +'Select object_id '
    +'  from public_dependency '
    +'  connect by prior object_id = referenced_object_id '
    +'  start with referenced_object_id = ( '
    +'Select object_id from ALL_OBJECTS '
    +' where owner        = :pOwner '
    +' and   object_name  = :pName '
    +' and   object_type  = :pType )) ';
end;

function GetObjectUsesSQL: string;
begin
  result :=
    'Select a.object_type,  '
   +' b.owner, b.object_type, b.object_name, b.object_id, b.status '
   +' from  sys.ALL_OBJECTS a, '
   +' sys.ALL_OBJECTS b, '
   +' (Select object_id, referenced_object_id '
   +'   FROM PUBLIC_DEPENDENCY '
   +'   start with object_id = (Select object_id '
   +'   from sys.ALL_OBJECTS '
   +'   WHERE owner  = :pOwner '
   +'   AND object_name = :pName '
   +'   AND object_type  = :pType ) '
   +'    connect by prior referenced_object_id = object_id) c '
   +' where a.object_id = c.object_id '
   +' and b.object_id = c.referenced_object_id '
   +' and a.owner not in (''SYS'', ''SYSTEM'') '
   +' and b.owner not in (''SYS'', ''SYSTEM'') '
   +' and a.object_name <> ''DUAL'' '
   +' and b.object_name <> ''DUAL'' ';
end;


function FindInDB(SearchText: string;
                  Objects, Columns, Procedures: boolean;
                  SchemaList, TextPosition: string): string;
var
  strObjects, strColumns,
  strProcedures, strTriggers, strViews: string;
  searchOption: string;
begin
  strObjects := ''; strColumns := '';
  strProcedures := ''; strTriggers := ''; strViews := '';

  if TextPosition = 'Text occurs anyware' then
     searchOption := ' like '+Str('%'+SearchText+'%');

  if TextPosition = 'Start with text' then
     searchOption := ' like '+Str(SearchText+'%');

  if TextPosition = 'Exact match' then
     searchOption := ' = '+Str(SearchText);

  if Objects then
     strObjects :=
      ' Select owner, object_type, '' '' Result_Type, object_name '
     +'   from DBA_OBJECTS '
     +'  Where object_name '+searchOption
     +'    and owner in ('+SchemaList+') ';

  if Columns then
     strColumns :=
      'Select allo.owner,  allo.object_type || ''COLUMN'' object_type, '
     +' atc.table_name Result_Type,  atc.column_name ||''(''||atc.data_type||'')''  object_name '
     +' from DBA_TAB_COLUMNS atc, DBA_OBJECTS allo '
     +' Where atc.column_name '+searchOption
     +'   and atc.owner in ('+SchemaList+') '
     +'   and allo.object_name=atc.table_name '
     +'   and allo.owner=atc.owner ';

  if Procedures then
     strProcedures :=
     ' Select distinct allsrc.owner, ''Source Search'' object_type, allsrc.type Result_Type, allsrc.name object_name '
     +' from DBA_SOURCE allsrc, DBA_OBJECTS allo '
     +' Where Instr(Upper(allsrc.text), '+Str(SearchText)+')<>0 '
     +' and allo.owner = allsrc.owner '
     +' and allo.object_name = allsrc.name '
     +' and allo.object_type = allsrc.type '
     +' and allsrc.owner in ('+SchemaList+') ';

  result := strObjects;

  if (result <> '') and (strColumns <> '') then result := result + ' union all ';

  result := result + strColumns;

  if (result <> '') and (strProcedures <> '') then result := result + ' union all ';

  result := result + strProcedures;


end;


end.
