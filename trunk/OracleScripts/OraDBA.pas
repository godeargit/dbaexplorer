unit OraDBA;

interface

function GetParameters: string;
function GetInstance: string;
function GetDatabase: string;
function GetVersion: string;
function GetLicense: string;
function GetOption: string;
function GetNLSDatabase: string;
function GetNLSInstance: string;
function GetNLSSession: string;
function GetSysstat: string;

function GetTopSQL(AOrder: string): string;
function GetTopSQLPlan: string;
function GetTopSegments: string;
function GetSegmentStatistic: string;
function GetTopSessions: string;

function GetMemoryBufferPool: string;
function GetMemoryBufferPoolStatistic: string;
function GetMemoryBufferWaitStats: string;
function GetMemoryPGAAdvice: string;
function GetMemoryPGAStat: string;
function GetMemorySharedPoolAdvice: string;
function GetMemoryDataCacheAdvice: string;

function GetWaitEvents: string;
function GetWaitLocks: string;
function GetWaitLockDetail: string;
function GetWaitLockSession: string;
function GetWaitLockSQL: string;
function GetSQLStat: string;
function GetWaitSessionStat: string;
function GetWaitLock: string;
function GetWaitLatches : string;
function GetWaitChildLatches : string;
function GetWaitLatchHolders : string;

function GetStorageTablespaces: string;
function GetStorageTablespaceFiles(FileType:string) : string;
function GetStorageTablespaceObjects: string;
function GetStorageTablespaceQuotas: string;
function GetStorageTablespaceFragmentation: string;
function GetStorageTablespaceObjectTotal: string;


function GetIOFiles: string;
function GetSGAFiles: string;

function GetUndoTablespaces: string;
function GetUndoTablespacesRollbackSegment: string;
function GetUndoTablespacesRollbackSegmentStat: string;
function GetUndoTablespacesCurrentTrans: string;
function GetUndoUndoStats: string;

function GetRedoGroups: string;
function GetRedoGroupDetail: string;
function GetRedoLogSwitchHistory: string;
function GetRedoArchivedLogs: string;
function GetRedoArchivedLogDetail: string;

function GetTempFiles: string;

function GetControlFiles: string;
function GetControlFileDetail: string;

function GetDBStatus: string;
function GetDB_SGA_Status: string;

implementation

uses SysUtils;

{*******************************************************************************}
{                          S Y S T E M                                          }
{*******************************************************************************}

function GetParameters: string;
begin
  result :=
     'SELECT   i.instance_name INSTANCE, p.NAME, p.VALUE VALUE, '
    +'         DECODE (p.issys_modifiable, '
    +'                 ''DEFERRED'', ''TRUE'', '
    +'                 ''FALSE'' '
    +'                ) issys_modifiable, '
    +'         DECODE (p.isdefault, ''TRUE'', ''YES'', ''FALSE'', ''NO'') "DEFAULT", '
    +'         DECODE (p.isses_modifiable, '
    +'                 ''IMMEDIATE'', ''YES'', '
    +'                 ''FALSE'', ''NO'', '
    +'                 ''DEFERRED'', ''NO'', '
    +'                 ''YES'' '
    +'                ) ses_modifiable, '
    +'         DECODE (p.issys_modifiable, '
    +'                 ''IMMEDIATE'', ''YES'', '
    +'                 ''FALSE'', ''NO'', '
    +'                 ''DEFERRED'', ''YES'', '
    +'                 ''YES'' '
    +'                ) sys_modifiable, '
    +'         p.description, p.update_comment '
    +'    FROM gv$parameter p, gv$instance i '
    +'   WHERE NAME NOT LIKE ''nls%'' AND (i.inst_id = p.inst_id) '
    +'ORDER BY p.NAME, i.instance_name ';
end;


function GetInstance: string;
begin
  result :=  'select * from v$INSTANCE';
end;

function GetDatabase: string;
begin
  result :=  'select * from v$DATABASE';
end;

function GetVersion: string;
begin
  result :=  'select * from v$VERSION';
end;

function GetLicense: string;
begin
  result :=  'select * from v$LICENSE';
end;

function GetOption: string;
begin
  result :=  'select * from v$OPTION';
end;

function GetNLSDatabase: string;
begin
  result :=  'select * from nls_database_parameters';
end;

function GetNLSInstance: string;
begin
  result :=  'select * from nls_instance_parameters';
end;

function GetNLSSession: string;
begin
  result :=  'select * from nls_session_parameters';
end;

function GetSysstat: string;
begin
  result :=  'select * from V$SYSSTAT';
end;

{*******************************************************************************}
{                          T O P   S Q L                                        }
{*******************************************************************************}

function GetTopSQL(AOrder: string): string;
var
  order: string;
begin
  if AOrder = 'Buffer gets' then order := 'buffer_gets';
  if AOrder = 'Disk reads' then order := 'disk_reads';
  if AOrder = 'Row processed' then order := 'rows_processed';
  if AOrder = 'Executions' then order := 'executions';
  if AOrder = 'Sharable memory' then order := 'sharable_mem';
  if AOrder = 'Persistent memory' then order := 'persistent_mem';
  if AOrder = 'Runtime memory' then order := 'runtime_mem';
  if AOrder = 'Sorts' then order := 'sorts';
  if AOrder = 'Parse calls' then order := 'parse_calls';
  if AOrder = 'Invalidations' then order := 'invalidations';
  if AOrder = 'First load time' then order := 'first_load_time';
  if AOrder = 'Bufferr gets/execution' then order := 'decode(executions, 0, 0, buffer_gets/executions)';
  if AOrder = 'Disk reads/execution' then order := 'decode(executions, 0, 0, disk_reads/executions)';
  if AOrder = 'Rows processed/execution' then order := 'decode(executions, 0, 0, rows_processed/executions)';
  if AOrder = 'Hit ratio' then order := 'DECODE (buffer_gets, 0, 100, ((buffer_gets - disk_reads) / buffer_gets) * 100 )';

  result :=
    'SELECT sql_text, sharable_mem, persistent_mem, runtime_mem, sorts, '
    +'    loaded_versions, open_versions, users_opening, executions, '
    +'       users_executing, loads, first_load_time, invalidations, parse_calls, '
    +'       disk_reads, buffer_gets, rows_processed, '
    +'       DECODE (executions,'
    +'               0, 0, '
    +'               buffer_gets / executions '
    +'              ) buffer_gets_per_executions, '
    +'       DECODE (executions, '
    +'               0, 0, '
    +'               disk_reads / executions '
    +'              ) disk_reads_per_executions, '
    +'       DECODE (executions, '
    +'               0, 0, '
    +'               rows_processed / executions '
    +'              ) rows_processed_per_executions, '
    +'       DECODE (buffer_gets, '
    +'               0, 100, '
    +'               ((buffer_gets - disk_reads) / buffer_gets) * 100 '
    +'              ) hit_ratio, '
    +'       address, hash_value '
    +'  FROM (SELECT * '
    +'          FROM v$sql '
    +'         ORDER BY '+order+' DESC) '
    +' WHERE ROWNUM < :row1 ';
end;

function GetTopSQLPlan: string;
begin
  result :=
    'select * from v$sql_plan '
   +' where address = :pAddress '
   +'  and hash_value = :pHash '
   +' order by ID, POSITION ';
end;

function GetTopSegments: string;
begin
  result :=
    'SELECT owner, '
    +'        object_name || DECODE (subobject_name, NULL, NULL, ''.'' || subobject_name) full_object_name, '
    +'        object_type, VALUE, tablespace_name, statistic_name, obj#, dataobj# '
    +' FROM (SELECT  * '
    +'         FROM v$segment_statistics '
    +'        WHERE statistic_name = :str1 '
    +'          AND VALUE <> 0 '
    +'     ORDER BY VALUE DESC) '
    +' WHERE ROWNUM < :row1 '
end;

function GetSegmentStatistic: string;
begin
  result :=  'select statistic_name, value from v$segment_statistics where obj# = :1 and dataobj# = :2';
end;

function GetTopSessions: string;
begin
  result :=
     '  SELECT * '
    +'    FROM (SELECT s.SID, ''SID =''|| s.SID ||'' , Serial =''|| s.serial#||'' , User = ''|| s.username as sessions, '
    +'           s.status, s.osuser, s.machine, '
    +'           s.terminal, s.program, s.module, s.action, s.client_info, sn.NAME, '
    +'           st.VALUE, s.sql_address, s.sql_hash_value, s.prev_sql_addr, '
    +'           s.prev_hash_value '
    +'          FROM v$session s, v$sesstat st, v$statname sn '
    +'         WHERE st.statistic# = sn.statistic# '
    +'           and s.SID = st.SID '
    +'           AND sn.NAME = :str1 '
    +'         ORDER BY VALUE DESC) '
    +'      WHERE ROWNUM <= :row1 ';
end;

{*******************************************************************************}
{                           M E M O R Y                                         }
{*******************************************************************************}

function GetMemoryBufferPool: string;
begin
  result :=
     'SELECT ID, NAME, block_size, resize_state, current_size, buffers, target_size, '
    +'       target_buffers, prev_size, prev_buffers '
    +'  FROM v$buffer_pool ';
end;

function GetMemoryBufferPoolStatistic: string;
begin
  result := 'select * from v$buffer_pool_statistics where id = :id ';
end;

function GetMemoryBufferWaitStats: string;
begin
  result := 'select * from v$waitstat ';
end;

function GetMemoryPGAAdvice: string;
begin
  result :=
    'select trunc(pga_target_for_estimate/1024/1024) pga_target_for_estimate, '
    +'     to_char(pga_target_factor * 100,''999.9'') ||''%'' pga_target_factor, '
    +'     trunc(bytes_processed/1024/1024) bytes_processed, '
    +'     trunc(estd_extra_bytes_rw/1024/1024) estd_extra_bytes_rw, '
    +'     to_char(estd_pga_cache_hit_percentage,''999'') || ''%'' estd_pga_cache_hit_percentage, '
    +'     estd_overalloc_count '
    +'   from v$pga_target_advice ';  
end;

function GetMemoryPGAStat: string;
begin
  result := 'select * from v$pgastat';
end;

function GetMemorySharedPoolAdvice: string;
begin
  result := 'select * from v$shared_pool_advice';
end;

function GetMemoryDataCacheAdvice: string;
begin
  result := 'select * from v$db_cache_advice';
end;


{*******************************************************************************}
{                              W A Ý T S                                        }
{*******************************************************************************}

function GetWaitEvents: string;
begin
  result :=
     'SELECT a.event, a.total_waits AS "Total waits", '
    +'       a.total_timeouts AS "Total timeouts", a.time_waited AS "Time waited",'
    +'       a.average_wait AS "Average wait" '
    +'  FROM v$system_event a '
    +' WHERE event NOT IN '
    +'    (''Null event'', '
    +'     ''PX Deq: Execution Msg'', '
    +'     ''PX Deq: Table Q Normal'', '
    +'     ''PX Idle Wait'', '
    +'     ''SQL*Net message from client'', '
    +'     ''SQL*Net message to client'', '
    +'     ''SQL*Net more data from client'', '
    +'     ''client message'', '
    +'     ''dispatcher timer'', '
    +'     ''gcs for action'', '
    +'     ''gcs remote message'', '
    +'     ''ges remote message'', '
    +'     ''i/o slave wait'', '
    +'     ''jobq slave wait'', '
    +'     ''lock manager wait for remote message'', '
    +'     ''null event'', '
    +'     ''parallel query dequeue'', '
    +'     ''pipe get'', '
    +'     ''pmon timer'', '
    +'     ''queue messages'', '
    +'     ''rdbms ipc message'', '
    +'     ''slave wait'', '
    +'     ''smon timer'', '
    +'     ''virtual circuit status'', '
    +'     ''wakeup time manager'' '
    +'    ) ';
end;

function GetWaitLocks: string;
begin
  result :=
     'SELECT /*+ ordered */ distinct '
    +'  s.SID, s.username, s.status, s.TYPE, s.osuser, s.server, '
    +'  s.serial# , s.sql_address, s.sql_hash_value, s.prev_sql_addr, '
    +'  s.prev_hash_value '
    +'from v$lock l,  v$session s '
    +'where l.sid = s.sid '
    +'AND l.TYPE IN (''TX'', ''TM'', ''UL'') ';
end;

function GetWaitLockDetail: string;
begin
  result :=
     'SELECT /*+ ordered */ '
    +'       l.lmode, l.request, l.TYPE , l.id1, l.id2, l.BLOCK, l.ctime, '
    +'       DO.object_type, DO.owner, DO.object_name, '
    +'       DECODE (lmode, '
    +'               0, ''None'', '
    +'               1, ''Null (NULL)'', '
    +'               2, ''Row-S (SS)'', '
    +'               3, ''Row-X (SX)'', '
    +'               4, ''Share (S)'', '
    +'               5, ''S/Row-X (SSX)'', '
    +'               6, ''Exclusive (X)'', '
    +'               lmode '
    +'              ) locked_mode '
    +'  FROM v$lock l,  dba_objects DO '
    +' WHERE l.id1 = DO.object_id(+) '
    +'   AND l.TYPE IN (''TX'', ''TM'', ''UL'') '
    +'   and l.SID = :sid ' ;
end;

function GetWaitLockSession: string;
begin
  result :=
     'SELECT SID, serial#, username, TYPE, command, status, server, logon_time , '
    +'      last_call_et , schemaname , osuser , machine, terminal, program, '
    +'       module, action, client_info '
    +'  FROM v$session '
    +'  where sid = :sid ';
end;

function GetWaitLockSQL: string;
begin
  result :=
    'select sql_text '
   +'  from v$sqltext_with_newlines '
   +' where address = :pAdd '
   +'  and hash_value = :pHash '
   +' order by piece ';
end;

function GetSQLStat: string;
begin
  result :=
     'SELECT sharable_mem, persistent_mem, runtime_mem, sorts, loaded_versions, '
    +'       open_versions, users_opening, fetches, executions, users_executing, '
    +'       loads, first_load_time, invalidations, parse_calls, disk_reads, '
    +'       buffer_gets, rows_processed, command_type, optimizer_mode, '
    +'       optimizer_cost, du.username "Parsing user", kept_versions, '
    +'       child_number, module, action, serializable_aborts, outline_category, '
    +'       DECODE (executions, '
    +'               0, 0, '
    +'               buffer_gets / executions '
    +'              ) "Buffer gets per execution", '
    +'       DECODE (executions, '
    +'               0, 0, '
    +'               disk_reads / executions '
    +'              ) "Disk reads per execution", '
    +'       DECODE (executions, '
    +'               0, 0, '
    +'               rows_processed / executions '
    +'              ) "Rows processed per execution", '
    +'       DECODE (buffer_gets, '
    +'               0, 100, '
    +'               ((buffer_gets - disk_reads) / buffer_gets) * 100 '
    +'              ) "Hit ratio", '
    +'       address, hash_value, cpu_time, elapsed_time, sqltype, remote, '
    +'       object_status, last_load_time, is_obsolete, child_latch '
    +'  FROM v$sql v, dba_users du '
    +' WHERE v.parsing_user_id = du.user_id '
    +'   AND address = :pAdd '
    +'   AND hash_value = :pHash ';
end;

function GetWaitSessionStat: string;
begin
  result :=
     'select name,value '
    +'  from v$sesstat st, v$statname sn '
    +' where st.statistic# = sn.statistic# '
    +'   and st.sid = :pSid ';
end;

function GetWaitLock: string;
begin
  result :=
      'select event, time_waited, total_waits, total_timeouts, average_wait, max_wait '
     +'  from v$session_event '
     +' where sid = :pSid ';
end;

function GetWaitLatches : string;
begin
  result :=
     'SELECT latch#, level#, NAME, wait_time, '
    +'       DECODE (misses, 0, 100, 100 * spin_gets / misses) hit_rate, gets, '
    +'       misses, sleeps, immediate_gets, immediate_misses, spin_gets, sleep1, '
    +'       sleep2, sleep3, sleep4 '
    +'  FROM v$latch ';
end;

function GetWaitChildLatches : string;
begin
  result :=
     'SELECT   lp.NAME, lp.latch#, lc.child#, lc.level#, lc.gets, lc.misses, '
    +'         lc.sleeps, lc.immediate_gets, lc.immediate_misses, lc.spin_gets, '
    +'         lc.sleep1, lc.sleep2, lc.sleep3, lc.sleep4 '
    +'    FROM v$latch_parent lp, v$latch_children lc '
    +'   WHERE lp.latch# = lc.latch# '
    +'ORDER BY lp.latch#, lc.child# ';
end;

function GetWaitLatchHolders : string;
begin
  result :=
     'select lh.name,s.SID,s.serial#,s.username,s.osuser,s.machine,s.terminal,s.program '
    +'from v$latchholder lh, v$session s '
    +' where lh.sid = s.sid ';
end;

{*******************************************************************************}
{                          T A B L E S P A C E                                  }
{*******************************************************************************}

function GetStorageTablespaces: string;
begin
  result :=
     'select '
    +'TABLESPACE_NAME, '
    +'ROUND((100*(BYTES-BYTES_FREE))/BYTES,2) PERCENT_USED, '
    +'ROUND(BYTES/1024/1024,2) BYTES, '
    +'ROUND(MAXBYTES/1024/1024,2) MAXBYTES, '
    +'ROUND(BYTES_FREE/1024/1024,2) BYTES_FREE, '
    +'TABLESPACE_TYPE, STATUS, CONTENTS, LOGGING, EXTENT_MANAGEMENT, ALLOCATION_TYPE '
    +'from '
    +'( '
    +'SELECT a.*, dt.status, dt.CONTENTS, dt.LOGGING, dt.extent_management, '
    +'       dt.allocation_type '
    +'  FROM (SELECT   dt.tablespace_name, ddf.BYTES, ddf.maxbytes, '
    +'                 NVL (dfs.bytes_free, 0) bytes_free, ''DATA'' tablespace_type '
    +'            FROM (SELECT   tablespace_name, SUM (BYTES) BYTES, '
    +'                           SUM (DECODE (autoextensible, '
    +'                                        ''YES'', maxbytes, '
    +'                                        ''NO'', BYTES '
    +'                                       ) '
    +'                               ) maxbytes '
    +'                      FROM dba_data_files '
    +'                  GROUP BY tablespace_name) ddf, '
    +'                 (SELECT   tablespace_name, SUM (BYTES) bytes_free '
    +'                      FROM dba_free_space '
    +'                  GROUP BY tablespace_name) dfs, '
    +'                 dba_tablespaces dt '
    +'           WHERE dt.tablespace_name = ddf.tablespace_name '
    +'             AND ddf.tablespace_name = dfs.tablespace_name(+) '
    +'             AND dt.CONTENTS <> ''TEMPORARY'' '
    +'        UNION ALL '
    +'        SELECT   dt.tablespace_name, ddf.BYTES, ddf.maxbytes, '
    +'                 ddf.BYTES - NVL (dfs.bytes_used, 0) bytes_free, '
    +'                 ''TEMP-DICT'' tablespace_type '
    +'            FROM (SELECT   tablespace_name, SUM (BYTES) BYTES, '
    +'                           SUM (DECODE (autoextensible, '
    +'                                        ''YES'', maxbytes, '
    +'                                        ''NO'', BYTES '
    +'                                       ) '
    +'                               ) maxbytes '
    +'                      FROM dba_data_files '
    +'                  GROUP BY tablespace_name) ddf, '
    +'                 (SELECT   NVL (SUM (tu.blocks * bs.block_size), '
    +'                                0) bytes_used, t.tablespace_name '
    +'                      FROM v$sort_usage tu, '
    +'                           dba_tablespaces t, '
    +'                           (SELECT VALUE block_size '
    +'                              FROM v$parameter2 '
    +'                             WHERE NAME = ''db_block_size'') bs '
    +'                     WHERE tu.CONTENTS = ''TEMPORARY'' '
    +'                       AND tu.TABLESPACE = t.tablespace_name '
    +'                       AND t.extent_management = ''DICTIONARY'' '
    +'                  GROUP BY t.tablespace_name) dfs, '
    +'                 dba_tablespaces dt '
    +'           WHERE dt.tablespace_name = ddf.tablespace_name '
    +'             AND ddf.tablespace_name = dfs.tablespace_name(+) '
    +'             AND dt.CONTENTS = ''TEMPORARY'' '
    +'        UNION ALL '
    +'        SELECT   tsh.tablespace_name, '
    +'                 SUM (tsh.bytes_free + tsh.bytes_used) BYTES, dtf.maxbytes, '
    +'                 SUM (tsh.bytes_free + tsh.bytes_used '
    +'                      - NVL (tep.bytes_used, 0) '
    +'                     ) bytes_free, '
    +'                 ''TEMP-LOCAL'' tablespace_type '
    +'            FROM v$temp_space_header tsh, '
    +'                 v$temp_extent_pool tep, '
    +'                 dba_temp_files dtf '
    +'           WHERE tsh.file_id = tep.file_id(+) '
    +'             AND tsh.tablespace_name = tep.tablespace_name(+) '
    +'             AND tsh.file_id = dtf.file_id '
    +'        GROUP BY tsh.tablespace_name, dtf.maxbytes '
    +'        ORDER BY 1) a, '
    +'       dba_tablespaces dt '
    +' WHERE a.tablespace_name = dt.tablespace_name '
    +') x';
end;

function GetStorageTablespaceFiles(FileType:string) : string;
begin
  if FileType = 'TEMP' then
  result :=
    'SELECT dtf.file_name, round(dtf.BYTES/1024/1024,2) bytes, '
    +'      round(SUM (tsh.bytes_free + tsh.bytes_used - NVL (tep.bytes_used, 0) )/1024/1024,2) bytes_free, '
    +'         dtf.status, dtf.blocks, dtf.autoextensible, '
    +'         NVL (dtf.increment_by, 0) increment_by, dtf.maxbytes, dtf.maxblocks '
    +'    FROM dba_temp_files dtf, v$temp_space_header tsh, v$temp_extent_pool tep '
    +'   WHERE tsh.file_id = tep.file_id(+) '
    +'     AND tsh.tablespace_name = tep.tablespace_name(+) '
    +'     AND tsh.file_id = dtf.file_id '
    +'     AND dtf.tablespace_name = :pName '
    +'GROUP BY tsh.file_id, '
    +'         dtf.file_name, '
    +'         dtf.BYTES, '
    +'         dtf.status, '
    +'         dtf.blocks, '
    +'         dtf.autoextensible, '
    +'         NVL (dtf.increment_by, 0), '
    +'         dtf.maxbytes, '
    +'         dtf.maxblocks '
  else
  result :=
    'SELECT   ddf.file_name, ROUND(ddf.BYTES/1024/1024,2) bytes, ROUND(SUM (dfs.BYTES)/1024/1024,2) bytes_free, ddf.status, '
    +'         ddf.blocks, ddf.autoextensible, '
    +'         NVL (ddf.increment_by, 0) increment_by, ddf.maxbytes, ddf.maxblocks '
    +'    FROM dba_data_files ddf, dba_free_space dfs '
    +'   WHERE ddf.file_id = dfs.file_id AND ddf.tablespace_name = :pName '
    +'GROUP BY dfs.file_id, '
    +'         ddf.file_name, '
    +'         ddf.BYTES, '
    +'         ddf.status, '
    +'         ddf.blocks, '
    +'         ddf.autoextensible, '
    +'         NVL (ddf.increment_by, 0), '
    +'         ddf.maxbytes,'
    +'         ddf.maxblocks ';
end;

function GetStorageTablespaceObjects: string;
begin
  result :=
     'SELECT owner, '
    +'       DECODE (partition_name, '
    +'               NULL, segment_name, '
    +'               segment_name || '':'' || partition_name '
    +'              ) objectname, '
    +'       segment_type object_type, ROUND (BYTES / 1024 / 1024, 2) object_size, '
    +'       initial_extent initial_ex, next_extent next_ex, extents, BYTES ttlsize, '
    +'       max_extents '
    +'  FROM dba_segments '
    +' WHERE tablespace_name = :pName ';
end;

function GetStorageTablespaceQuotas: string;
begin
  result :=
    'SELECT USERNAME, '
    +'  DECODE(MAX_BYTES, -1, ''Unlimited'', MAX_BYTES/1024), '
    +'  BYTES/1024, DECODE(MAX_BYTES, -1, 0, 0, 0, ROUND((BYTES/MAX_BYTES)*100, 2)) '
    +'from   sys.dba_ts_quotas '
    +'WHERE tablespace_name= :pName ';
end;


function GetStorageTablespaceFragmentation: string;
begin
  result :=
     'SELECT   tablespace_name,  '
    +'         ROUND (  SQRT (MAX (blocks) / SUM (blocks)) '
    +'                * (100 / SQRT (SQRT (COUNT (blocks)))), '
    +'                2 '
    +'               ) fragmentation_index, '
    +'         COUNT (*) free_chunks, '
    +'         DECODE (ROUND ((MAX (BYTES) / 1024000), 2), '
    +'                 NULL, 0, '
    +'                 ROUND ((MAX (BYTES) / 1024000), 2) '
    +'                ) largest_chunk '
    +'    FROM SYS.dba_free_space '
    +'GROUP BY tablespace_name '
    +'ORDER BY 2 DESC, 1 ';
end;

function GetStorageTablespaceObjectTotal: string;
begin
  result :=
     'SELECT   /*+ RULE */ '
    +'         s_name tablespace_name, ROUND (NVL (table_space, 0), 2) table_mb, '
    +'         ROUND (NVL (index_space, 0), 2) index_mb, '
    +'         ROUND (NVL (cluster_space, 0), 2) cluster_mb,'
    +'         ROUND (NVL (rollback_space, 0), 2) rollback_mb,'
    +'         ROUND (NVL (lob_space, 0), 2) lob_mb   '
    +'    FROM (SELECT NAME s_name '
    +'            FROM SYS.ts$ '
    +'           WHERE online$ <> 3),'
    +'         (SELECT   tablespace_name t_name, '
    +'                   (    SUM (DECODE (segment_type, ''TABLE'', NVL (BYTES, 0), 0 )) / 1024 / 1024'
    +'                    +   SUM (DECODE (segment_type, ''TABLE PARTITION'', NVL (BYTES, 0), 0 ) ) / 1024 / 1024'
    +'                    +   SUM (DECODE (segment_type, ''TABLE SUBPARTITION'', NVL (BYTES, 0), 0 ) ) / 1024 / 1024'
    +'                    +   SUM (DECODE (segment_type, ''NESTED TABLE'', NVL (BYTES, 0), 0 ) ) / 1024 / 1024'
    +'                   ) table_space, '
    +'                       SUM (DECODE (segment_type, ''INDEX'', NVL (BYTES, 0), 0) ) / 1024 / 1024 '
    +'                   +   SUM (DECODE (segment_type, ''INDEX PARTITION'', NVL (BYTES, 0), 0 ) ) / 1024 / 1024'
    +'                   +   SUM (DECODE (segment_type, ''INDEX SUBPARTITION'', NVL (BYTES, 0), 0 ) ) / 1024 / 1024 index_space,'
    +'                       SUM (DECODE (segment_type, ''CLUSTER'', NVL (BYTES, 0), 0) ) / 1024 / 1024 cluster_space,'
    +'                       SUM (DECODE (segment_type, ''ROLLBACK'', NVL (BYTES, 0), 0 ) ) / 1024 / 1024'
    +'                   +   SUM (DECODE (segment_type, ''TYPE2 UNDO'', NVL (BYTES, 0), 0 ) ) / 1024 / 1024 rollback_space,'
    +'                       SUM (DECODE (segment_type, ''LOBINDEX'', NVL (BYTES, 0), 0 ) ) / 1024 / 1024'
    +'                   +   SUM (DECODE (segment_type, ''LOBSEGMENT'', NVL (BYTES, 0), 0 ) ) / 1024 / 1024 lob_space'
    +'              FROM SYS.dba_segments '
    +'             WHERE segment_type IN '
    +'                      (''TABLE'', '
    +'                       ''TABLE PARTITION'', '
    +'                       ''TABLE SUBPARTITION'', '
    +'                       ''INDEX'', '
    +'                       ''INDEX PARTITION'', '
    +'                       ''INDEX SUBPARTITION'', '
    +'                       ''ROLLBACK'', '
    +'                       ''TYPE2 UNDO'', '
    +'                       ''CLUSTER'', '
    +'                       ''LOBINDEX'', '
    +'                       ''LOBSEGMENT'' '
    +'                      ) '
    +'          GROUP BY tablespace_name) '
    +'   WHERE s_name = t_name(+) '
    +'ORDER BY 1 ';
end;

{*******************************************************************************}
{                              I / O                                            }
{*******************************************************************************}

function GetIOFiles: string;
begin
  result :=
     'SELECT fs.file#, NAME, phyrds, phywrts, phyblkrd, phyblkwrt, singleblkrds, '
    +'       readtim, writetim, singleblkrdtim, avgiotim, lstiotim, miniotim, '
    +'       maxiortm, maxiowtm '
    +'  FROM v$filestat fs, v$datafile df '
    +' WHERE fs.file# = df.file# '
    +'UNION '
    +'SELECT ts.file#, NAME, phyrds, phywrts, phyblkrd, phyblkwrt, singleblkrds, '
    +'       readtim, writetim, singleblkrdtim, avgiotim, lstiotim, miniotim, '
    +'       maxiortm, maxiowtm '
    +'  FROM v$tempstat ts, v$tempfile tf '
    +' WHERE ts.file# = tf.file# ';
end;

function GetSGAFiles: string;
begin
  result :=' select * from 	v$sgastat order	by NAME ';
end;


{*******************************************************************************}
{                             U N D O                                           }
{*******************************************************************************}
function GetUndoTablespaces: string;
begin
  result :=
     'SELECT dt.tablespace_name, ddf.BYTES, ddf.maxbytes,'
    +'       NVL (dfs.bytes_free, 0) bytes_free, dt.status, ''DATA'' tablespace_type, '
    +'   	   ROUND((100*(BYTES-BYTES_FREE))/BYTES,2) PERCENT_USED '
    +'  FROM (SELECT   tablespace_name, SUM (BYTES) BYTES, '
    +'                 SUM (DECODE (autoextensible, ''YES'', maxbytes, ''NO'', BYTES) '
    +'                     ) maxbytes '
    +'            FROM dba_data_files '
    +'        GROUP BY tablespace_name) ddf, '
    +'       (SELECT   tablespace_name, SUM (BYTES) bytes_free '
    +'            FROM dba_free_space '
    +'        GROUP BY tablespace_name) dfs, '
    +'       dba_tablespaces dt '
    +' WHERE dt.tablespace_name = ddf.tablespace_name '
    +'   AND ddf.tablespace_name = dfs.tablespace_name(+) '
    +'   AND dt.CONTENTS = ''UNDO'' ';
end;

function GetUndoTablespacesRollbackSegment: string;
begin
  result :=
     'SELECT segment_id, segment_name, owner, status, instance_num, initial_extent, '
    +'       next_extent, min_extents, max_extents, pct_increase '
    +'  FROM dba_rollback_segs '
    +' WHERE tablespace_name = :pName ';
end;

function GetUndoTablespacesRollbackSegmentStat: string;
begin
  result :=
     'SELECT rs.usn, rs.extents, rs.rssize, rs.writes, rs.xacts, rs.gets, rs.waits, '
    +'  rs.optsize, rs.hwmsize, rs.shrinks, rs.wraps, rs.EXTENDS, rs.aveshrink, '
    +'   rs.aveactive, rs.status, rs.curext, rs.curblk '
    +' FROM v$rollstat rs, dba_rollback_segs drs '
    +'WHERE rs.usn = drs.segment_id '
    +'  AND drs.tablespace_name = :pName ';
end;

function GetUndoTablespacesCurrentTrans: string;
begin
  result :=
    'SELECT drs.segment_name, t.xidusn, t.status xact_status, t.start_time, '
    +'       t.used_ublk, t.log_io, t.phy_io, t.cr_get, t.cr_change, s.SID, '
    +'       s.serial#, s.username, s.osuser, s.machine, s.terminal, s.program '
    +'  FROM v$transaction t, v$session s, dba_rollback_segs drs '
    +' WHERE t.ses_addr = s.saddr '
    +'   AND t.xidusn = drs.segment_id '
    +'   AND drs.tablespace_name = :pName ';
end;


function GetUndoUndoStats: string;
begin
  result :=
     'SELECT  to_date(begin_time,''dd.mm.yyyy'') thedate, '
    +'        TO_NUMBER (TO_CHAR (begin_time, ''hh24'')) thehour, '
    +'        SUM (undoblks) sum_undoblks, SUM (txncount) sum_tnxcount, '
    +'        MAX (maxquerylen) max_querylen '
    +'   FROM v$undostat '
    +'  GROUP BY to_date(begin_time,''dd.mm.yyyy''), '
    +'         TO_CHAR (begin_time, ''hh24'') '
    +'  ORDER BY 1 DESC, 2 DESC, 3 DESC, 4 DESC ';
end;


{*******************************************************************************}
{                          R E D O                                              }
{*******************************************************************************}

function GetRedoGroups: string;
begin
  result :=
    'SELECT group#, thread#, sequence#, BYTES, members, archived, status, '
    +'      first_change#, first_time '
    +' FROM v$log ';
end;

function GetRedoGroupDetail: string;
begin
  result := 'select status, member from v$logfile where group# = :pGroup';
end;

function GetRedoLogSwitchHistory: string;
begin
      result := 'SELECT   TO_NUMBER (TO_CHAR (first_time, ''YYYY'')) theyear,'
    +'         TO_NUMBER (TO_CHAR (first_time, ''MM'')) themonth,'
    +'         TO_NUMBER (TO_CHAR (first_time, ''DD'')) theday,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''00'', 1, 0)) h0, '
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''01'', 1, 0)) h1, '
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''02'', 1, 0)) h2, '
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''03'', 1, 0)) h3, '
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''04'', 1, 0)) h4, '
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''05'', 1, 0)) h5, '
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''06'', 1, 0)) h6, '
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''07'', 1, 0)) h7, '
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''08'', 1, 0)) h8, '
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''09'', 1, 0)) h9, '
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''10'', 1, 0)) h10,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''11'', 1, 0)) h11,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''12'', 1, 0)) h12,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''13'', 1, 0)) h13,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''14'', 1, 0)) h14,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''15'', 1, 0)) h15,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''16'', 1, 0)) h16,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''17'', 1, 0)) h17,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''18'', 1, 0)) h18,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''19'', 1, 0)) h19,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''20'', 1, 0)) h20,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''21'', 1, 0)) h21,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''22'', 1, 0)) h22,'
    +'         SUM (DECODE (TO_CHAR (first_time, ''hh24''), ''23'', 1, 0)) h23 '
    +'    FROM v$archived_log '
    +'   WHERE TRUNC (SYSDATE) - TRUNC (first_time) < 14  '
    +'GROUP BY TO_NUMBER (TO_CHAR (first_time, ''YYYY'')),'
    +'         TO_NUMBER (TO_CHAR (first_time, ''MM'')),  '
    +'         TO_NUMBER (TO_CHAR (first_time, ''DD''))   '
    +'ORDER BY 1, 2, 3 ';
end;


function GetRedoArchivedLogs: string;
begin
  result :=
    'SELECT dest_id, status, BINDING, name_space, target, reopen_secs, destination, '
    +'      fail_date, fail_sequence, fail_block, error '
    +' FROM v$archive_dest ';
end;

function GetRedoArchivedLogDetail: string;
begin
  result :=
   'SELECT NAME, thread#, sequence#, resetlogs_change#, resetlogs_time, '
  +'     first_change#, first_time, next_change#, next_time, blocks, block_size, '
  +'     creator, registrar, standby_dest, archived, applied, deleted, status, '
  +'     completion_time, dictionary_begin, dictionary_end '
  +' FROM v$archived_log '
  +'WHERE dest_id = :pID ';
end;

{*******************************************************************************}
{                          T E M P                                              }
{*******************************************************************************}

function GetTempFiles: string;
begin
  result :=
    'SELECT ts.file#, NAME, phyrds, phywrts, phyblkrd, phyblkwrt, singleblkrds, '
    +'      readtim, writetim, singleblkrdtim, avgiotim, lstiotim, miniotim, '
    +'      maxiortm, maxiowtm '
    +' FROM v$tempstat ts, v$tempfile tf '
    +'WHERE ts.file# = tf.file# ';
end;

{*******************************************************************************}
{                          C O N T R O L  F I L E S                             }
{*******************************************************************************}

function GetControlFiles: string;
begin
  result := 'SELECT * from v$ControlFile';
end;

function GetControlFileDetail: string;
begin
  result :=
     'SELECT INITCAP(TYPE), record_size, records_total, records_used, '
    +'(record_size*records_used) "Used", '
    +'record_size*(records_total-records_used) "Free" '
    +' FROM V$CONTROLFILE_RECORD_SECTION ORDER BY 1 ';
end;



{*******************************************************************************}
{                              DATABASE STATUS                                 }
{*******************************************************************************}

function GetDBStatus: string;
begin
    result :=
    'SELECT /*+ RULE */ '
    +'       instance_name, VERSION, startup_time, host_name, current_sessions, '
    +'       current_locks, blocked_sessions, log_mode, optimizer_mode, created, '
    +'       cache_advice, total_space '
    +'  FROM (SELECT instance_name, VERSION, startup_time, host_name '
    +'          FROM SYS.v_$instance), '
    +'       (SELECT log_mode, created '
    +'          FROM SYS.v_$database), '
    +'       (SELECT COUNT (*) current_sessions '
    +'          FROM SYS.v_$session), '
    +'       (SELECT COUNT (*) blocked_sessions '
    +'          FROM SYS.v_$session '
    +'         WHERE lockwait IS NOT NULL), '
    +'       (SELECT VALUE optimizer_mode '
    +'          FROM SYS.v_$parameter '
    +'         WHERE NAME = ''optimizer_mode''), '
    +'       (SELECT /*+ rule */ '
    +'               COUNT (*) current_locks '
    +'          FROM v$lock l, SYS.dba_objects o, v$session s '
    +'         WHERE l.SID = s.SID AND l.id1 = o.object_id), '
    +'       (SELECT NVL (MAX (VALUE), ''OFF'') cache_advice '
    +'          FROM SYS.v_$parameter '
    +'         WHERE NAME = ''db_cache_advice''), '
    +'	     (SELECT ROUND (((total_perm_space + total_temp_space) / 1048576.0), 2 ) total_space '
    +'          FROM (SELECT SUM (NVL (BYTES, 0.0)) total_perm_space '
    +'          FROM SYS.dba_data_files), '
    +'       (SELECT NVL (SUM (NVL (BYTES, 0.0)), 0.0) total_temp_space '
    +'          FROM SYS.dba_temp_files)) ';
end;

function GetDB_SGA_Status: string;
begin
    result :=
     '	   select ''DB Buffers (MB)'' detail, db_size_in_mb - db_caches value '
	  +' from '
    +'     (SELECT ROUND (MAX (a.BYTES) / 1048576.0, 2) db_size_in_mb '
    +'      FROM SYS.v_$sgastat a '
    +'     WHERE (a.NAME = ''db_block_buffers'' OR a.NAME = ''buffer_cache'')), '
		+' (SELECT NVL '
    +'              (SUM (DECODE (SUBSTR (UPPER (b.VALUE), -1, 1), '
    +'                            ''K'', ROUND ((  REPLACE (UPPER (b.VALUE), ''K'', '''' ) / 1024 ), 2),'
    +'                            ''M'', REPLACE (UPPER (b.VALUE), ''M'', ''''), '
    +'                            ''B'', ROUND ((  REPLACE (UPPER (b.VALUE), ''B'', '''')/ 1048576.0), 2 ), '
    +'                            ROUND ((b.VALUE / 1048576.0), 2) '
    +'                           ) ), 0 ) db_caches '
    +'      FROM SYS.v_$parameter b '
    +'     WHERE b.NAME LIKE ''%k_cache_size'') '
		+'union all '
    +'   (SELECT ''DB Caches (MB)'' detail, NVL '
    +'              (SUM (DECODE (SUBSTR (UPPER (b.VALUE), -1, 1), '
    +'                            ''K'', ROUND ((  REPLACE (UPPER (b.VALUE), ''K'', '''' ) / 1024 ), 2), '
    +'                            ''M'', REPLACE (UPPER (b.VALUE), ''M'', ''''), '
    +'                            ''B'', ROUND ((  REPLACE (UPPER (b.VALUE), ''B'', '''')/ 1048576.0), 2 ), '
    +'                            ROUND ((b.VALUE / 1048576.0), 2) '
    +'                           ) ), 0 ) value '
    +'      FROM SYS.v_$parameter b '
    +'     WHERE b.NAME LIKE ''%k_cache_size'') '
    +'	union all  '
    +'   (SELECT ''Fixed Size (MB)'' detail, ROUND (SUM (b.BYTES) / 1048576.0, 2)value '
    +'      FROM SYS.v_$sgastat b  WHERE b.NAME = ''fixed_sga'') '
		+'union all '
    +'   (SELECT ''Log Buffer (MB)'' detail, ROUND (SUM (c.BYTES) / 1048576.0, 2) value '
    +'      FROM SYS.v_$sgastat c   WHERE c.NAME = ''log_buffer'') '
		+'union all '
    +'   (SELECT ''Shared Pool (MB)'' detail, ROUND (SUM (d.BYTES) / 1048576.0, 2) value '
    +'      FROM SYS.v_$sgastat d  WHERE d.pool = ''shared pool'') '
	  +'  union all '
    +'   (SELECT ''Large Pool (MB)'' detail, ROUND (SUM (e.BYTES) / 1048576.0, 2) value '
    +'      FROM SYS.v_$sgastat e  WHERE e.pool = ''large pool'') '
	  +' union all '
    +'   (SELECT ''Java Pool (MB)'' detail, ROUND (SUM (f.BYTES) / 1048576.0, 2) value '
    +'      FROM SYS.v_$sgastat f  WHERE f.pool = ''java pool'')  ';

end;    

end.


