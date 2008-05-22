Unit OraSessions;

interface
uses SysUtils, Util;

function GetExplainTable(ID: string): string;
function GetCurrentStatement(HashValue: string): string; overload;
function GetCurrentStatement(SID, UserName: string): string;  overload;
function GetSessions: string;
function GetSesstat(SID: string): string;
function GetWaits(SID: string): string;
function GetEvents(SID: string): string;
function GetIO(SID: string): string;
function GetProcess(SID: string): string;
function GetLocks(SID: string): string;
function GetSQLInformation(SID: string): string;
function GetOpenCursors(SID: string): string;
function GetAccess(SID: string): string;



implementation


function GetExplainTable(ID: string): string;
begin
  result := 'SELECT * from PLAN_TABLE '
           +' WHERE STATEMENT_ID = '+ID
           +' ORDER BY ID, POSITION ';
end;

function GetCurrentStatement(HashValue: string): string; overload;
begin
  result := ' SELECT SQL_TEXT FROM  V$SQLTEXT_WITH_NEWLINES '
           +' WHERE HASH_VALUE = TO_NUMBER('+HashValue+') '
           +' ORDER BY PIECE ';
end;

function GetCurrentStatement(SID, UserName: string): string;  overload;
begin
  result := ' select sql_text '
           +' from V$sqltext_with_newlines '
           +' where address = (select prev_sql_addr '
           +'   from   V$session '
           +'  where username = '+Str(UserName)
           +'   and sid = '+SID+') '
           +' ORDER BY piece ';
end;


function GetSessions: string;
begin
  result := ' SELECT  * '
           +'   FROM V$SESSION s '
           +'  WHERE  ( (s.USERNAME is not null) '
           +'    and (NVL(s.osuser,''x'') <> ''SYSTEM'') and (s.type <> ''BACKGROUND'') ) '
           +' order by PROGRAM , OWNERID ';
end;


function GetSesstat(SID: string): string;
begin
  result := ' SELECT  a.sid, '
           +' decode(b.class,1,''User'',2,''Redo'',4,''Enqueue'',8,''Cache'',16,''OS'',32,''ParallelServer'',64,''SQL'', '
           +' 128,''Debug'',72, ''SQL & Cache'',40,''ParallelServer & Cache'') class, b.name,a.value '
           +'  from v$sesstat a, v$statname b '
           +' where (a.statistic#=b.statistic#) '
           +'   and sid = '+SID
           +' order by b.class ';
end;

function GetWaits(SID: string): string;
begin
  result := ' SELECT  SID, SEQ#,EVENT,WAIT_TIME,SECONDS_IN_WAIT, STATE '
           +'   FROM v$session_wait '
           +'  WHERE  sid = '+SID ;
end;

function GetEvents(SID: string): string;
begin
  result := 'SELECT  ROWNUM, EVENT,TOTAL_WAITS,TOTAL_TIMEOUTS,TIME_WAITED,AVERAGE_WAIT , MAX_WAIT, TIME_WAITED_MICRO '
           +'  FROM v$session_event '
           +' WHERE  sid = '+SID ;
end;


function GetIO(SID: string): string;
begin
  result := 'SELECT  * FROM V$SESS_IO '
           +' WHERE  sid = '+SID ;
end;

function GetProcess(SID: string): string;
begin
  result := 'SELECT p.* '
           +'  FROM v$session s, v$process p '
           +' WHERE  s.paddr = p.addr '
           +'   AND SID = '+SID
           +' ORDER BY s.username, s.osuser ';
end;


function GetLocks(SID: string): string;
begin
   result := 'SELECT /*+ RULE */ '
      +'  lk.SID, se.username, se.osuser, se.machine, '
      +' DECODE (lk.TYPE, '
      +'         ''TX'', ''Transaction'', '
      +'         ''TM'', ''DML'', '
      +'         ''UL'', ''PL/SQL User Lock'', '
      +'         lk.TYPE '
      +'        ) lock_type, '
      +' DECODE (lk.lmode, '
      +'         0, ''None'', '
      +'         1, ''Null'', '
      +'         2, ''Row-S (SS)'', '
      +'         3, ''Row-X (SX)'', '
      +'         4, ''Share'', '
      +'         5, ''S/Row-X (SSX)'', '
      +'         6, ''Exclusive'', '
      +'         TO_CHAR (lk.lmode) '
      +'        ) mode_held, '
      +' DECODE (lk.request, '
      +'         0, ''None'', '
      +'         1, ''Null'', '
      +'         2, ''Row-S (SS)'', '
      +'         3, ''Row-X (SX)'', '
      +'         4, ''Share'', '
      +'         5, ''S/Row-X (SSX)'', '
      +'         6, ''Exclusive'', '
      +'         TO_CHAR (lk.request) '
      +'        ) mode_requested, '
      +' TO_CHAR (lk.id1) lock_id1, TO_CHAR (lk.id2) lock_id2, ob.owner, '
      +' ob.object_type, ob.object_name, lk.BLOCK, se.lockwait '
      +' FROM v$lock lk, dba_objects ob, v$session se '
      +' WHERE lk.TYPE IN (''TM'', ''UL'', ''TX'' ) '
      +'   AND lk.SID = se.SID '
      +'   AND lk.id1 = ob.object_id (+) '
      +'   AND lk.SID = '+SID;  
end;

function GetSQLInformation(SID: string): string;
begin
   result := 'select * from v$sql'
            +' WHERE (address,hash_value) = (SELECT sql_address,sql_hash_value '
                                             +' FROM v$session where sid = '+SID+' ) ';
end;

function GetSQLInformationForCursor(SID: string): string;
begin
   result := 'select * from v$sql'
            +' WHERE (address,hash_value) = (SELECT sql_address,sql_hash_value '
                                            +' FROM V$open_cursor where sid = '+SID+' ) ';
end;

function GetOpenCursors(SID: string): string;
begin
   result := 'SELECT  sid, sql_text, address, hash_value, user_name '
            +'  FROM V$open_cursor '
            +' WHERE  sid = '+SID;
end;

function GetAccess(SID: string): string;
begin
   result := 'SELECT  * '
            +'  FROM v$access '
            +' WHERE  sid = '+SID;
end;



end.
