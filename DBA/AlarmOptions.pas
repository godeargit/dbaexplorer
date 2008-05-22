unit AlarmOptions;

interface

uses SysUtils, IniFiles, classes, Forms, WinTypes, VirtualTable;

var
  AlertUseLogFile: Boolean;
  AlertLogFileName: string;
  AlertRefreshInterval: integer;
  AlertShowSystemTrayIcon: boolean;
  AlertSentToMail: boolean;
  AlertSentToSMS: boolean;

procedure AlertOptionsLoadFromIni;
procedure AlertOptionsSaveToIni;

procedure AlertLogLoadFromFile(vt: TVirtualTable);
procedure AlertLogSaveToFile(vt: TVirtualTable);

implementation

procedure AlertOptionsLoadFromIni;
begin
  with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  try
    AlertUseLogFile := ReadBool('Alarm Options','UseLogFile', False);
    AlertLogFileName := ReadString('Alarm Options','LogFile', '');
    AlertRefreshInterval := ReadInteger('Alarm Options','RefreshInterval', 200);
    AlertShowSystemTrayIcon := ReadBool('Alarm Options','ShowSystemTrayIcon', False);
    AlertSentToMail := ReadBool('Alarm Options','SentToMail', False);
    AlertSentToSMS := ReadBool('Alarm Options','SentToSMS', False);
  finally
    free;
  end;
end;

procedure AlertOptionsSaveToIni;
begin
  with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  try
    WriteBool('Alarm Options','UseLogFile', AlertUseLogFile);
    WriteString('Alarm Options','LogFile', AlertLogFileName);
    WriteInteger('Alarm Options','RefreshInterval', AlertRefreshInterval);
    WriteBool('Alarm Options','ShowSystemTrayIcon', AlertShowSystemTrayIcon);
    WriteBool('Alarm Options','SentToMail', AlertSentToMail);
    WriteBool('Alarm Options','SentToSMS', AlertSentToSMS);
  finally
    free;
  end;
end;

procedure AlertLogLoadFromFile(vt: TVirtualTable);
begin
  AlertOptionsLoadFromIni;
  if FileExists(AlertLogFileName) then
     vt.LoadFromFile(AlertLogFileName);
end;

procedure AlertLogSaveToFile(vt: TVirtualTable);
begin
  AlertOptionsLoadFromIni;
  vt.SaveToFile(AlertLogFileName);
end;

end.

select /*+ALL_ROWS */ 'Physical I/O',
       hash_value,
       round(100 * nvl(dsk_reads/sum_disk,0),2) disk_io_pct
from
(select hash_value,
        disk_reads dsk_reads
 from sys.v_$sqlarea order by 2 desc),
(select sum(disk_reads) sum_disk
 from sys.v_$sqlarea where disk_reads > 0)
 where rownum < 2
union all
select 'Logical I/O',
       hash_value,
       round(100 * nvl(log_reads/sum_log,0),2) log_io_pct
from
(select hash_value,
        buffer_gets log_reads
 from sys.v_$sqlarea order by 2 desc),
(select sum(buffer_gets) sum_log
 from sys.v_$sqlarea where buffer_gets > 0)
 where rownum < 2
union all
select 'CPU',
       hash_value,
       round(100 * nvl(cpu/sum_cpu,0),2) cpu_pct
from
(select hash_value,
        cpu_time cpu
 from sys.v_$sqlarea order by 2 desc),
(select sum(cpu_time) sum_cpu
 from sys.v_$sqlarea where cpu_time > 0)
 where rownum < 2
union all
select 'Elapsed Time',
       hash_value,
       round(100 * nvl(etime/sum_etime,0),2) etime_pct
from
(select hash_value,
        elapsed_time etime
 from sys.v_$sqlarea order by 2 desc),
(select sum(elapsed_time) sum_etime
 from sys.v_$sqlarea where elapsed_time > 0)
 where rownum < 2;



 SELECT
       ms_ratio_num,
       ms_ratio_den,
       100*( ROUND( ( ms_ratio_num/ms_ratio_den ),  4 ) ) ms_ratio,
       TO_NUMBER( DECODE( 0, NULL, 0, 100*( ROUND( ( ms_ratio_num - 0 )/ ( DECODE( (ms_ratio_den - 0 ), 0, 1, ( ms_ratio_den - 0 ) ) ),  4 ) ) ) ) ms_delta_ratio,
       pe_ratio_num,
       pe_ratio_den,
       100*( ROUND( ( pe_ratio_num/pe_ratio_den ),  4 ) ) pe_ratio,
       TO_NUMBER( DECODE( 237902, NULL, 0, 100*( ROUND( ( pe_ratio_num - 237854 )/ ( DECODE( (pe_ratio_den - 237902 ), 0, 1, ( pe_ratio_den -237902 ) ) ),  4 ) ) ) ) pe_delta_ratio,
       cpup_ratio_num,
       cpup_ratio_den,
       100*( ROUND( ( cpup_ratio_num/cpup_ratio_den ),  4 ) ) cpup_ratio,
       TO_NUMBER( DECODE( 868895, NULL, 0, 100*( ROUND( ( cpup_ratio_num - 833232 )/ ( DECODE( (cpup_ratio_den - 868895 ), 0, 1, ( cpup_ratio_den - 868895 ) ) ),  4 ) ) ) ) cpup_delta_ratio
FROM

(SELECT b.VALUE ms_ratio_num,
        DECODE ((a.VALUE + b.VALUE), 0, 1, (a.VALUE + b.VALUE)) ms_ratio_den
FROM v$sysstat a, v$sysstat b
WHERE a.name = 'sorts (disk)' AND b.name = 'sorts (memory)' ),

(SELECT ( a.VALUE - b.VALUE) pe_ratio_num,
        DECODE (a.VALUE, 0, 1, a.VALUE)  pe_ratio_den
FROM sys.v_$sysstat a, sys.v_$sysstat b
WHERE a.name = 'execute count' AND b.name = 'parse count (hard)'),
(SELECT pc.value cpup_ratio_num,
        DECODE( ec.value, 0, 1, ec.value ) cpup_ratio_den
FROM sys.v_$sysstat ec,
     sys.v_$sysstat pc
WHERE ec.name='CPU used by this session' and pc.name='parse time cpu')


select active_sessions,
       inactive_sessions,
       open_cursors,
       commits,
       rollbacks,
       sessions_blocked,
       sessions_waiting,
       sessions_in_disk_sorts,
       sessions_in_enqueue_waits
from
(SELECT count(*) active_sessions
FROM   SYS.V_$SESSION
WHERE  USERNAME IS NOT NULL AND
       STATUS = 'ACTIVE' ),
(SELECT count(*) inactive_sessions
FROM   SYS.V_$SESSION
WHERE  USERNAME IS NOT NULL AND
       STATUS <> 'ACTIVE' ),
(SELECT COUNT(*) open_cursors
FROM SYS.V_$OPEN_CURSOR),
(select value commits
from   sys.v_$sysstat
where  name = 'user commits'),
(select value rollbacks
from   sys.v_$sysstat
where  name = 'user rollbacks'),
(SELECT count(*) sessions_blocked
FROM SYS.V_$SESSION
WHERE LOCKWAIT IS NOT NULL),
(SELECT count(*) sessions_waiting
  FROM sys.v_$session_wait
 WHERE event NOT IN
          ('lock element cleanup',
          'pmon timer',
          'rdbms ipc message',
          'smon timer',
          'SQL*Net message from client',
          'SQL*Net break/reset to client',
          'SQL*Net message to client',
          'dispatcher timer',
          'Null event',
          'parallel query dequeue wait',
          'parallel query idle wait - Slaves',
          'pipe get',
          'PL/SQL lock timer',
          'slave wait',
          'virtual circuit status',
          'WMON goes to sleep')),
(SELECT COUNT(*) sessions_in_disk_sorts
FROM SYS.V_$SORT_USAGE),
(select nvl(count(sid),0) sessions_in_enqueue_waits
from   sys.v_$session_wait a,
       sys.v_$event_name b
where  a.event = 'enqueue' and
       a.event (+) = b.name);



SELECT SID,
       USERNAME,
       ROUND(100 * TOTAL_USER_IO/TOTAL_IO,2)
FROM
(SELECT b.SID SID,
nvl(b.USERNAME,p.NAME) USERNAME,
sum(VALUE) TOTAL_USER_IO
FROM sys.V_$STATNAME c,
sys.V_$SESSTAT a,
     sys.V_$SESSION b,
     sys.v_$bgprocess p
WHERE a.STATISTIC#=c.STATISTIC# and
      p.paddr (+) = b.paddr and
      b.SID=a.SID AND
      c.NAME in ('physical reads','physical writes')
GROUP BY b.SID, nvl(b.USERNAME,p.name)
ORDER BY 3 DESC),
(select sum(value) TOTAL_IO
from sys.V_$STATNAME c,
sys.V_$SESSTAT a
WHERE a.STATISTIC#=c.STATISTIC# and
c.NAME in ('physical reads','physical writes'))
WHERE ROWNUM < 6;


SELECT percent_shared_pool_free,
       buffer_busy_waits,
       free_buffer_wait_avg,
       object_reloads,
       redo_log_space_waits,
       redo_log_space_wait_time,
       db_size_in_mb - db_caches db_buffers_in_mb,
       db_caches,
       fixed_size_in_mb,
       lb_size_in_mb,
       sp_size_in_mb,
       lp_size_in_mb,
       jp_size_in_mb
FROM
(SELECT ROUND (100 * (free_bytes / shared_pool_size), 2)
       percent_shared_pool_free
  FROM (SELECT SUM (bytes) free_bytes
          FROM sys.v_$sgastat
         WHERE name = 'free memory'
           AND pool = 'shared pool'),
       (SELECT SUM(bytes) shared_pool_size 
            FROM sys.v_$sgastat d 
           WHERE d.pool = 'shared pool')),
(select nvl(sum(total_waits),0) buffer_busy_waits
from   sys.v_$system_event a,
       sys.v_$event_name b
where  a.event = 'buffer busy waits' and
       a.event (+) = b.name),
(select (round((a.value / b.value),3)) free_buffer_wait_avg
from   sys.v_$sysstat a,
       sys.v_$sysstat b
where  a.name = 'free buffer inspected' and
       b.name = 'free buffer requested'),
(select sum(reloads) object_reloads
  from sys.v_$librarycache),
(select value redo_log_space_waits
  from sys.v_$sysstat
where  name = 'redo log space requests'),
(select value redo_log_space_wait_time
  from sys.v_$sysstat
where  name = 'redo log space wait time'),
(SELECT NVL(ROUND (MAX(a.bytes) / 1024 / 1024, 2),0)  db_size_in_mb
  FROM sys.v_$sgastat a
 WHERE (a.name = 'db_block_buffers' or a.name = 'buffer_cache')),
(SELECT NVL(ROUND (SUM (b.value) / 1024 / 1024, 2),0) db_caches
  FROM sys.v_$parameter b
 WHERE  b.name like '%k_cache_size'),
(SELECT ROUND ( NVL( SUM(b.bytes), 0 ) / 1024 / 1024, 2) fixed_size_in_mb
  FROM sys.v_$sgastat b
 WHERE b.name = 'fixed_sga'),
(SELECT ROUND ( NVL( SUM(c.bytes), 0 ) / 1024 / 1024, 2) lb_size_in_mb
  FROM sys.v_$sgastat c
 WHERE c.name=  'log_buffer' ),
  (SELECT ROUND ( NVL( SUM(d.bytes), 0 ) / 1024 / 1024, 2) sp_size_in_mb
    FROM sys.v_$sgastat d 
   WHERE d.pool = 'shared pool' ),
  (SELECT ROUND ( NVL( SUM(d.bytes), 0 ) / 1024 / 1024, 2) lp_size_in_mb
    FROM sys.v_$sgastat d 
   WHERE d.pool = 'large pool' ),
  (SELECT ROUND ( NVL( SUM(d.bytes), 0 ) / 1024 / 1024, 2) jp_size_in_mb
    FROM sys.v_$sgastat d 
   WHERE d.pool = 'java pool' );


select total_chained_objects,
       objects_at_max_extents,
       objects_no_room_expand,
       invalid_objects,
       tabs_idx_same_ts,
       locked_objects,
       object_blocks,
       free_list_waits,
       enqueue_waits
from
(select chained_row_tables + chained_part_tables + chained_subpart_tables total_chained_objects
from
(select count(*) chained_row_tables
from   sys.tab$
where  chncnt > 0),
(select count(*) chained_part_tables
from   sys.tabpart$
where  chncnt > 0),
(select count(*) chained_subpart_tables
from   sys.tabsubpart$
where  chncnt > 0)),
(SELECT COUNT(*) objects_at_max_extents
 FROM SYS.SEG$
 WHERE (EXTENTS = MAXEXTS AND MAXEXTS > 0)),
(SELECT count(*) objects_no_room_expand
FROM sys.seg$ s, sys.ts$ ts
    WHERE s.ts# = ts.ts# AND
        DECODE(BITAND(ts.flags, 3), 1, TO_NUMBER(NULL), s.extsize * ts.blocksize) > (SELECT nvl(MAX(bytes),0)
    FROM sys.dba_free_space a, sys.ts$ b
    WHERE b.name = a.tablespace_name (+)
    AND b.ts# = ts.ts#)),
(SELECT COUNT(*) invalid_objects
FROM   SYS.OBJ$
WHERE  STATUS NOT IN (0,1)),
(SELECT  /*+ ALL_ROWS ORDERED CLUSTER(T) CLUSTER(I) STAR_TRANSFORMATION USE_HASH(O,T,I) */
      COUNT(*) tabs_idx_same_ts
FROM  SYS.OBJ$ O,
      SYS.TAB$ T,
      SYS.IND$ I
WHERE O.OBJ# = T.OBJ#
AND   I.BO# = O.OBJ#
AND   I.TS# = T.TS#
AND   T.TS# <> 0
AND   I.TS# <> 0
AND   O.OWNER# IN
     (SELECT  /*+ CLUSTER() PUSH_SUBQ */
      USER#
      FROM SYS.USER$
      WHERE NAME NOT IN ('SYS','SYSTEM','OUTLN', 'XDB'))),
(SELECT COUNT(*) locked_objects
FROM   SYS.V_$LOCKED_OBJECT),
(SELECT count(*) object_blocks
FROM SYS.V_$SESSION
WHERE LOCKWAIT IS NOT NULL),
(SELECT COUNT free_list_waits
 FROM SYS.V_$WAITSTAT
 WHERE CLASS='free list'),
(select nvl(count(sid),0) enqueue_waits
from   sys.v_$session_wait a,
       sys.v_$event_name b
where  a.event = 'enqueue' and
       a.event (+) = b.name);


select objects_at_max_extents,
       objects_no_room_to_expand,
       autoextend_at_limit,
       offline_tablespaces,
       redo_bytes,
       redo_wastage
from
(SELECT COUNT(*) objects_at_max_extents
 FROM SYS.SEG$
 WHERE (EXTENTS = MAXEXTS AND MAXEXTS > 0)),
(SELECT count(*) objects_no_room_to_expand
FROM sys.seg$ s, sys.ts$ ts
    WHERE s.ts# = ts.ts# AND
        DECODE(BITAND(ts.flags, 3), 1, TO_NUMBER(NULL), s.extsize * ts.blocksize) > (SELECT nvl(MAX(bytes),0)
    FROM sys.dba_free_space a, sys.ts$ b
    WHERE b.name = a.tablespace_name (+)
    AND b.ts# = ts.ts#)),
(select count(*) autoextend_at_limit
from   sys.file$ f,
       sys.ts$ ts
where  f.ts# = ts.ts# and
f.inc > 0 and
ts.blocksize * f.blocks = ts.blocksize * f.maxextend),
(SELECT COUNT (*) offline_tablespaces
  FROM sys.dba_tablespaces
 WHERE status not in ('ONLINE', 'READ ONLY')),
(SELECT VALUE redo_bytes
FROM   SYS.V_$SYSSTAT
WHERE  UPPER(NAME)='REDO SIZE'),
(SELECT VALUE redo_wastage
FROM   SYS.V_$SYSSTAT
WHERE  NAME = 'redo wastage');


SELECT percent_shared_pool_free,
       problem_tablespaces,
       problem_objects,
       current_object_blocks,
       enqueue_waits,
       free_list_waits,
       total_used_space,
       total_free_space,
       archive_log,
       active_processes,
       inactive_processes
FROM
(SELECT ROUND (100 * (free_bytes / shared_pool_size), 2) percent_shared_pool_free
  FROM 
      (SELECT SUM(bytes) free_bytes FROM sys.v_$sgastat WHERE name = 'free memory'AND pool = 'shared pool' ),
      (SELECT SUM(bytes) shared_pool_size from sys.v_$sgastat d where d.pool = 'shared pool' )),
(SELECT CNT_PERM + CNT_TEMP problem_tablespaces FROM
(SELECT COUNT(*) CNT_PERM FROM
(select round((100*Sum_Free_Blocks /
       Sum_Alloc_Blocks),2) PCT_FREE
from
      (select Tablespace_Name,
      SUM(Blocks) Sum_Alloc_Blocks,
      NVL(sum(bytes),0) AS Total_space
      from DBA_DATA_FILES
      group by Tablespace_Name),
      (select B.Tablespace_Name FS_TS_NAME,
      NVL(sum(bytes),0) as Total_Free_Space,
      NVL(SUM(Blocks),0) AS Sum_Free_Blocks
      from DBA_FREE_SPACE A, DBA_TABLESPACES B
      WHERE A.TABLESPACE_NAME (+) = B.TABLESPACE_NAME
      group by B.Tablespace_Name)
where Tablespace_Name = FS_TS_NAME)
WHERE PCT_FREE < 10),
(SELECT COUNT(*) CNT_TEMP FROM
(SELECT (100 -(NVL(t.bytes /a.bytes * 100, 0))) PCT_FREE
FROM sys.dba_tablespaces d,
     (select tablespace_name,
      sum(bytes) bytes
      from dba_temp_files
      group by tablespace_name) a,
     (select tablespace_name,
      sum(bytes_cached) bytes
      from SYS.v_$temp_extent_pool
      group by tablespace_name)t
WHERE d.tablespace_name = a.tablespace_name(+) AND
      d.tablespace_name = t.tablespace_name(+) AND
      d.extent_management like 'LOCAL' AND d.contents like 'TEMPORARY')
      WHERE PCT_FREE < 10)),
(SELECT EXT_PBM + NEXT_PBM problem_objects
FROM
(SELECT COUNT(*) EXT_PBM
 FROM SYS.SEG$
 WHERE (EXTENTS = MAXEXTS AND MAXEXTS > 0) OR
 (MAXEXTS - 2 = EXTENTS AND MAXEXTS > 0)),
(SELECT COUNT(*) NEXT_PBM
FROM   SYS.SEG$ S,
       SYS.TS$ TS
WHERE  S.TS# = TS.TS#  AND
       DECODE(BITAND(TS.FLAGS, 3), 1, TO_NUMBER(NULL),
         S.EXTSIZE * TS.BLOCKSIZE) >
(SELECT MAX(BYTES)
 FROM SYS.DBA_FREE_SPACE A
  WHERE TS.NAME = A.TABLESPACE_NAME ))),
(SELECT count(*) current_object_blocks
FROM SYS.V_$SESSION
WHERE LOCKWAIT IS NOT NULL),
(select nvl(count(sid),0) enqueue_waits
from   sys.v_$session_wait a,
       sys.v_$event_name b
where  a.event = 'enqueue' and
       a.event (+) = b.name),
(SELECT COUNT free_list_waits
 FROM SYS.V_$WAITSTAT WHERE CLASS='free list'),
(SELECT round(((total_space_perm + nvl(total_space_temp,0)) -
(total_free_space_perm + nvl(total_free_space_temp,0)))/1048576,2) total_used_space,
 ROUND((total_free_space_perm + nvl(total_free_space_temp,0)) / 1048576,2) total_free_space
FROM
(SELECT SUM(bytes) AS total_space_perm FROM SYS.DBA_DATA_FILES),
(SELECT SUM(bytes) AS total_space_temp FROM SYS.DBA_TEMP_FILES),
(SELECT SUM(bytes) AS total_free_space_perm FROM SYS.DBA_FREE_SPACE),
(SELECT SUM(bytes_cached) AS total_free_space_temp from SYS.v_$temp_extent_pool)),
(select decode(log_mode,'NOARCHIVELOG','No','Yes') archive_log from SYS.v_$database),
(SELECT count(*) active_processes
FROM   SYS.V_$SESSION
WHERE  USERNAME IS NOT NULL AND
       STATUS = 'ACTIVE'),
(SELECT count(*) inactive_processes
FROM   SYS.V_$SESSION
WHERE  USERNAME IS NOT NULL AND
       STATUS <> 'ACTIVE');



