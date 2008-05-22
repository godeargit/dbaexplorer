unit OraTable;

interface

uses Windows, Classes, SysUtils, Ora, OraStorage, DB, OraPartitions, OraConstraint,
     OraIndex, OraSynonym, OraGrants, OraScript, OraErrHand, OraError, DBQuery, Forms,
     Dialogs, VirtualTable;

type
  TTableType = (ttStandart, ttIndexOrganized, ttAdvancedQuening, ttGlobalTemporary, ttClustered, ttExternel);
  TColumnType = (ctDefineColumns, ctDefineQuery, ctObjectTable);
  TLockMode = (lmRowShare, lmRowExclusive, lmShareRowExclusive, lmExclusive);

  TTable = class(TPersistent)
  private
    FOWNER,
    FTABLE_NAME: string;
    FTableType: TTableType;
    FIOT_NAME,
    FSTATUS: string;
    FLOGGING: TLoggingType;
    FBACKED_UP,
    FNUM_ROWS,
    FBLOCKS,
    FEMPTY_BLOCKS,
    FAVG_SPACE,
    FCHAIN_CNT,
    FAVG_ROW_LEN,
    FAVG_SPACE_FREELIST_BLOCKS,
    FNUM_FREELIST_BLOCKS,
    FDEGREE,
    FINSTANCES: string;
    FCACHE : boolean;
    FTABLE_LOCK,
    FSAMPLE_SIZE,
    FLAST_ANALYZED,
    FPARTITIONED,
    FIOT_TYPE,
    FTEMPORARY,
    FSECONDARY,
    FNESTED,
    FROW_MOVEMENT,
    FGLOBAL_STATS,
    FUSER_STATS,
    FDURATION,
    FSKIP_CORRUPT :string;
    FMONITORING: boolean;
    FDEPENDENCIES,
    FCOMPRESSION,
    FDROPPED  :string;

    FDEFINE_QUERY: string;

    FCOMMENT: string;

    FExternalAccessDriver,
    FExternalAccessType,
    FExternalDefaultDirectory,
    FExternalLocations,
    FExternalSpecify: string;
    FExternalParalelDegree: integer;
    FExternalParameters: string;

    FOBJECT_OWNER,
    FOBJECT_TYPE: string;
    FOBJECT_PRIMARY_KEY: Boolean;

    FCLUSTER_NAME,
    FCLUSTER_OWNER,
    FCLUSTER_COLUMNS : string;

    FQUEUE_PAYLOAD_TYPE: TPayloadType;
    FQUEUE_SCHEMA,
    FQUEUE_TYPE: string;
    FQUEUE_SUBSCRIBERS,
    FQUEUE_MESSAGE_GROUPING: boolean;
    FQUEUE_CAPATIBILITY: integer;
    FQUEUE_SORT_LIST: string;

    FGLOBAL_TEMPORARY: TGlobalTemporary;

    FPERCENTAGE_THRESHOLD,
    FKEY_COMPRESSION: integer;
    FINDEX_OGANIZED_FIELD: string;

    FPhsicalAttributes : TPhsicalAttributes;
    FColumnType: TColumnType;
    FColumnLists: TColumnList;

    FPartitionClause: TPartitionClause; //0-NonPartition, 1-Global
    FIndexPartitionLists: TIndexPartitionList;
    FIndexPartitionType: TIndexPartitionType;
    FIndexSubpartitionType: TIndexPartitionType;
    FIndexHashPartitionType: string;
    FIndexPartitionRangeType: TPartitionRangeType;

    FIndexList: TIndexList;
    FConstraintList : TConstraintList;
    FSynonymList : TSynonymList;
    FGrantList : TGrantList;

    FRecCount : integer;
    FOraSession: TOraSession;

    function GetTableComment: string;
    function GetExternalTable: string;
    function GetClusterColumns: string;
    function GetIndexedTableColumns: string;
  public
    property OWNER  : string read FOWNER  write FOWNER;
    property TABLE_NAME  : string read FTABLE_NAME  write FTABLE_NAME;
    property TableType: TTableType read FTableType write FTableType;
    property CLUSTER_NAME  : string read FCLUSTER_NAME  write FCLUSTER_NAME;
    property IOT_NAME   : string read FIOT_NAME  write FIOT_NAME;
    property STATUS  : string read FSTATUS  write FSTATUS;
    property LOGGING   : TLoggingType read FLOGGING  write FLOGGING;
    property BACKED_UP  : string read FBACKED_UP  write FBACKED_UP;
    property NUM_ROWS   : string read FNUM_ROWS  write FNUM_ROWS;
    property BLOCKS  : string read FBLOCKS  write FBLOCKS;
    property EMPTY_BLOCKS  : string read FEMPTY_BLOCKS  write FEMPTY_BLOCKS;
    property AVG_SPACE  : string read FAVG_SPACE  write FAVG_SPACE;
    property CHAIN_CNT  : string read FCHAIN_CNT  write FCHAIN_CNT;
    property AVG_ROW_LEN  : string read FAVG_ROW_LEN  write FAVG_ROW_LEN;
    property AVG_SPACE_FREELIST_BLOCKS : string read FAVG_SPACE_FREELIST_BLOCKS write FAVG_SPACE_FREELIST_BLOCKS;
    property NUM_FREELIST_BLOCKS  : string read FNUM_FREELIST_BLOCKS write FNUM_FREELIST_BLOCKS;
    property DEGREE  : string read FDEGREE  write FDEGREE;
    property INSTANCES  : string read FINSTANCES  write FINSTANCES;
    property CACHE  : boolean read FCACHE  write FCACHE;
    property TABLE_LOCK  : string read FTABLE_LOCK  write FTABLE_LOCK;
    property SAMPLE_SIZE  : string read FSAMPLE_SIZE  write FSAMPLE_SIZE;
    property LAST_ANALYZED  : string read FLAST_ANALYZED write FLAST_ANALYZED;
    property PARTITIONED  : string read FPARTITIONED  write FPARTITIONED;
    property IOT_TYPE   : string read FIOT_TYPE  write FIOT_TYPE;
    property TEMPORARY  : string read FTEMPORARY  write FTEMPORARY;
    property SECONDARY  : string read FSECONDARY  write FSECONDARY;
    property NESTED  : string read FNESTED  write FNESTED;
    property ROW_MOVEMENT  : string read FROW_MOVEMENT  write FROW_MOVEMENT;
    property GLOBAL_STATS  : string read FGLOBAL_STATS  write FGLOBAL_STATS;
    property USER_STATS  : string read FUSER_STATS  write FUSER_STATS;
    property DURATION   : string read FDURATION  write FDURATION;
    property SKIP_CORRUPT  : string read FSKIP_CORRUPT  write FSKIP_CORRUPT;
    property MONITORING  : boolean read FMONITORING  write FMONITORING;
    property CLUSTER_OWNER  : string read FCLUSTER_OWNER write FCLUSTER_OWNER;
    property DEPENDENCIES  : string read FDEPENDENCIES  write FDEPENDENCIES;
    property COMPRESSION  : string read FCOMPRESSION  write FCOMPRESSION;
    property DROPPED  : string read FDROPPED write FDROPPED;
    property CLUSTER_COLUMNS: string read FCLUSTER_COLUMNS write FCLUSTER_COLUMNS;
    property DEFINE_QUERY: string read FDEFINE_QUERY write FDEFINE_QUERY;
    property COMMENT: string read FCOMMENT write FCOMMENT;

    property ExternalAccessDriver : string read FExternalAccessDriver write FExternalAccessDriver;
    property ExternalAccessType : string read FExternalAccessType write FExternalAccessType;
    property ExternalDefaultDirectory : string read FExternalDefaultDirectory write FExternalDefaultDirectory;
    property ExternalLocations : string read FExternalLocations write FExternalLocations;
    property ExternalSpecify : string read FExternalSpecify write FExternalSpecify;
    property ExternalParalelDegree : integer read FExternalParalelDegree write FExternalParalelDegree;
    property ExternalParameters: string read FExternalParameters write FExternalParameters;

    property OBJECT_OWNER: string read FOBJECT_OWNER write FOBJECT_OWNER;
    property OBJECT_TYPE: string read FOBJECT_TYPE write FOBJECT_TYPE;
    property OBJECT_PRIMARY_KEY: Boolean read FOBJECT_PRIMARY_KEY write FOBJECT_PRIMARY_KEY;

    property QUEUE_PAYLOAD_TYPE: TPayloadType read FQUEUE_PAYLOAD_TYPE write FQUEUE_PAYLOAD_TYPE; 
    property QUEUE_SCHEMA: string read FQUEUE_SCHEMA write FQUEUE_SCHEMA;
    property QUEUE_TYPE: string read FQUEUE_TYPE write FQUEUE_TYPE;
    property QUEUE_SUBSCRIBERS: boolean read FQUEUE_SUBSCRIBERS write FQUEUE_SUBSCRIBERS;
    property QUEUE_MESSAGE_GROUPING: boolean read FQUEUE_MESSAGE_GROUPING write FQUEUE_MESSAGE_GROUPING;
    property QUEUE_CAPATIBILITY: integer read FQUEUE_CAPATIBILITY write FQUEUE_CAPATIBILITY;
    property QUEUE_SORT_LIST: string read FQUEUE_SORT_LIST write FQUEUE_SORT_LIST;

    property GLOBAL_TEMPORARY: TGlobalTemporary read FGLOBAL_TEMPORARY write FGLOBAL_TEMPORARY;
    
    property PERCENTAGE_THRESHOLD: integer read FPERCENTAGE_THRESHOLD write FPERCENTAGE_THRESHOLD;
    property KEY_COMPRESSION: integer read FKEY_COMPRESSION write FKEY_COMPRESSION;
    property INDEX_OGANIZED_FIELD: string read FINDEX_OGANIZED_FIELD write FINDEX_OGANIZED_FIELD;

    property PhsicalAttributes : TPhsicalAttributes read  FPhsicalAttributes write FPhsicalAttributes;
    property ColumnType: TColumnType read FColumnType write FColumnType;
    property ColumnLists : TColumnList read FColumnLists write FColumnLists;

    property PartitionClause: TPartitionClause read FPartitionClause write FPartitionClause;
    property IndexPartitionLists : TIndexPartitionList read FIndexPartitionLists write FIndexPartitionLists;
    property IndexPartitionType: TIndexPartitionType read FIndexPartitionType write FIndexPartitionType;
    property IndexSubpartitionType: TIndexPartitionType read FIndexSubpartitionType write FIndexSubpartitionType;
    property IndexHashPartitionType: string read FIndexHashPartitionType write FIndexHashPartitionType;
    property IndexPartitionRangeType: TPartitionRangeType read FIndexPartitionRangeType write FIndexPartitionRangeType;
    property IndexList: TIndexList read FIndexList write FIndexList;
    property ConstraintList : TConstraintList read FConstraintList write FConstraintList;
    property SynonymList : TSynonymList read FSynonymList write FSynonymList;
    property GrantList: TGrantList read FGrantList write FGrantList;

    property OraSession: TOraSession read FOraSession write FOraSession;
    constructor Create;
    destructor destroy; override;
    procedure SetDDL;
    function GetDDL: string;
    function GetAlterDDL(NewValue: TTable): string;

    function DropTable(CascadeConstraint: boolean): boolean;
    function TruncateTable(TableStorage: integer): boolean;
    function LockTable(LockMode:TLockMode; NoWait: boolean) : boolean;
    function CopyTable(NEW_TABLE_NAME, NEW_OWNER: string; INCLUDE_DATA: boolean) : boolean;
    function RenameTable(NEW_TABLE_NAME: string): boolean;
    function AnalyzeTable(AnalyzeFunction: TAnalyzeFunction; Sample: integer; SampleType: integer): boolean;
    function RecordCount: integer;
    function CreateTable(TableScript: string) : boolean;
    function AlterTable(TableScript: string) : boolean;
    function DisableALLConstraints: boolean;
    function EnableALLConstraints: boolean;
    function DisableALLTriggers: boolean;
    function EnableALLTriggers: boolean;

  end;

  function GetTables(OwnerName: string): string;
  function GetTableStatus: string;
  function GetTableDetail: string;
  function GetTableComment: string;
  function GetTableData(TableName, Owner: string): string;
  function GetTableUsed: string;
  function GetTablesDescription(OwnerName: string): string;


implementation

uses Util, frmSchemaBrowser, Languages;

resourcestring
  strTableAnalayzed = 'Table %s has been analyzed.';
  strTriggersEnabled = 'Triggers Enabled';
  strTriggersDisabled = 'Triggers Disabled';
  strConstraintsEnabled = 'Constraints Enabled';
  strConstraintsDisabled = 'Constraints Disabled';
  strTableRenamed = 'Table %s has been renamed to %s';
  strTableCopied = 'Table %s has been copied to %s';
  strTableLocked = 'Table %s has been locked.';
  strTableTruncated = 'Table %s has been truncated.';
  strTableDropped = 'Table %s has been dropped.';
  strTableCreated = 'Table %s has been created.';
  strTableAltered = 'Table %s has been altered.';


function GetTables(OwnerName: string): string;
begin
  result :=
    ' select * from sys.ALL_All_tables '
   +' where OWNER = '+Str(OwnerName)
   +'order by TABLE_NAME ';
end;

function GetTableUsed: string;
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
    +' and   object_type  = ''TABLE'' )) ';
end;

function GetTableData(TableName, Owner: string): string;
begin
  result := 'select ROWID, x.* from '+Owner+'.'+TableName+' x ';
end;

function GetTableComment: string;
begin
  result :=
    'select * from ALL_TAB_COMMENTS '
   +' where owner  = :pOwner '
   +'   and TABLE_name = :pName ';
end;


function GetTableDetail: string;
begin
  result :=
    ' Select * from All_all_tables '
   +' where table_name = :pTable '
   +'   and owner = :pOwner ';
end;

function GetTableStatus: string;
begin
  result :=
     'Select CREATED, LAST_DDL_TIME, OBJECT_ID, STATUS, TIMESTAMP '
    +'  from all_objects '
    +' where object_name = :pOName '
    +'   and object_type = :pOType '
    +'   and owner = :pOwner ';
end;

function GetTablesDescription(OwnerName: string): string;
begin
  result :=
    'Select u.OBJECT_NAME, u.CREATED, u.LAST_DDL_TIME, u.OBJECT_ID, u.STATUS, a.OWNER, TABLESPACE_NAME, LAST_ANALYZED , c.COMMENTS '
   +' from  all_objects  u, ALL_TABLES a, ALL_TAB_COMMENTS c '
   +'where u.object_name = a.TABLE_NAME '
   +'  and C.TABLE_NAME = a.TABLE_NAME '
	 +'  and c.OWNER = a.OWNER '
	 +'  and c.OWNER = U.OWNER '
	 +'  and c.TABLE_TYPE =  u.object_type '
   +'  and a.OWNER = '+#39+UpperCase(OwnerName)+#39
   +'  and u.object_type = ''TABLE'' ';
end;

constructor TTable.Create;
begin
  inherited;
  FColumnLists := TColumnList.Create;
  FIndexPartitionLists := TIndexPartitionList.Create;
  FIndexList := TIndexList.Create;
  FConstraintList := TConstraintList.Create;
  FSynonymList := TSynonymList.Create;
  FGrantList := TGrantList.Create;
end;

destructor TTable.destroy;
begin
  FColumnLists.Free;
  FIndexPartitionLists.Free;
  FIndexList.Free;
  FConstraintList.Free;
  FSynonymList.Free;
  FGrantList.Free;
  inherited;
end;


function TTable.GetIndexedTableColumns: string;
begin
  result := 'Select * from USER_INDEXES '
           +' where index_type <> ''LOB'' '
           +'   and table_name = '+Str(UpperCase(FTABLE_NAME));
end;

function TTable.GetClusterColumns: string;
begin
  result := 'Select * from USER_CLU_COLUMNS '
           +' WHERE TABLE_NAME = '+Str(UpperCase(FTABLE_NAME));

end;

function TTable.GetExternalTable: string;
begin
  result := 'Select * from user_external_tables '
           +' where TABLE_NAME = '+Str(UpperCase(FTABLE_NAME));
end;           

function TTable.GetTableComment: string;
begin
  result := 'Select comments '
           +'  from user_tab_comments '
           +' where table_name = '+Str(UpperCase(FTABLE_NAME));
end;

procedure TTable.SetDDL;
var
  qDetail : TOraQuery;
begin
  if FTABLE_NAME = '' then exit;

  qDetail := TOraQuery.Create(nil);
  qDetail.Session  := OraSession;
  qDetail.SQL.Text := GetTableDetail;
  qDetail.ParamByName('pTable').AsString := FTABLE_NAME;
  qDetail.ParamByName('pOwner').AsString := FOWNER;
  qDetail.Open;

  FTableType := ttStandart;

  if qDetail.FieldByName('IOT_TYPE').AsString <> '' then
     FTableType := ttIndexOrganized;

  if qDetail.FieldByName('TEMPORARY').AsString = 'Y' then
     FTableType := ttGlobalTemporary;

  if qDetail.FieldByName('CLUSTER_NAME').AsString <> '' then
     FTableType := ttClustered;

  FColumnType := ctDefineColumns;   
  //ttAdvancedQuening, );

  FIOT_NAME := qDetail.FieldByName('IOT_TYPE').AsString;
  //9i de yok FSTATUS := qDetail.FieldByName('STATUS').AsString;
  FLOGGING := ltDefault;
  if qDetail.FieldByName('LOGGING').AsString = 'YES' then FLOGGING := ltLogging;
  if qDetail.FieldByName('LOGGING').AsString = 'NO' then FLOGGING := ltNoLogging;
  FBACKED_UP := qDetail.FieldByName('BACKED_UP').AsString;
  FNUM_ROWS := qDetail.FieldByName('NUM_ROWS').AsString;
  FBLOCKS := qDetail.FieldByName('BLOCKS').AsString;
  FEMPTY_BLOCKS := qDetail.FieldByName('EMPTY_BLOCKS').AsString;
  FAVG_SPACE := qDetail.FieldByName('AVG_SPACE').AsString;
  FCHAIN_CNT := qDetail.FieldByName('CHAIN_CNT').AsString;
  FAVG_ROW_LEN := qDetail.FieldByName('AVG_ROW_LEN').AsString;
  FAVG_SPACE_FREELIST_BLOCKS := qDetail.FieldByName('AVG_SPACE_FREELIST_BLOCKS').AsString;
  FNUM_FREELIST_BLOCKS := qDetail.FieldByName('NUM_FREELIST_BLOCKS').AsString;
  FDEGREE := trim(qDetail.FieldByName('DEGREE').AsString);
  FINSTANCES := trim(qDetail.FieldByName('INSTANCES').AsString);
  FCACHE := trim(qDetail.FieldByName('CACHE').AsString) = 'Y';
  FTABLE_LOCK := qDetail.FieldByName('TABLE_LOCK').AsString;
  FSAMPLE_SIZE := qDetail.FieldByName('SAMPLE_SIZE').AsString;
  FLAST_ANALYZED := qDetail.FieldByName('LAST_ANALYZED').AsString;
  FPARTITIONED := qDetail.FieldByName('PARTITIONED').AsString;
  if qDetail.FieldByName('PARTITIONED').AsString = 'YES' then
     FPartitionClause := pcGlobal
  else
     FPartitionClause := pcNonPartition;
  FIOT_TYPE := qDetail.FieldByName('IOT_TYPE').AsString;
  FTEMPORARY := qDetail.FieldByName('TEMPORARY').AsString;
  FSECONDARY := qDetail.FieldByName('SECONDARY').AsString;
  FNESTED := qDetail.FieldByName('NESTED').AsString;
  FROW_MOVEMENT := qDetail.FieldByName('ROW_MOVEMENT').AsString;
  FGLOBAL_STATS := qDetail.FieldByName('GLOBAL_STATS').AsString;
  FUSER_STATS := qDetail.FieldByName('USER_STATS').AsString;
  FDURATION := qDetail.FieldByName('DURATION').AsString;
  FSKIP_CORRUPT := qDetail.FieldByName('SKIP_CORRUPT').AsString;
  FMONITORING := trim(qDetail.FieldByName('MONITORING').AsString) = 'YES';
  FDEPENDENCIES := qDetail.FieldByName('DEPENDENCIES').AsString;
  FCOMPRESSION := qDetail.FieldByName('COMPRESSION').AsString;
  //9i de yok FDROPPED := qDetail.FieldByName('DROPPED').AsString;

  FDEFINE_QUERY := ''; //sadece yený tablo olusturulurken kullanýlýyor

  FOBJECT_OWNER := qDetail.FieldByName('TABLE_TYPE_OWNER').AsString;
  FOBJECT_TYPE := qDetail.FieldByName('TABLE_TYPE').AsString;
  FOBJECT_PRIMARY_KEY := qDetail.FieldByName('OBJECT_ID_TYPE').AsString = 'USER-DEFINED';
  if qDetail.FieldByName('TABLE_TYPE').AsString <> '' then
     FColumnType := ctObjectTable;

  if qDetail.FieldByName('DURATION').AsString = 'SYS$SESSION' then
     FGLOBAL_TEMPORARY := gtPreserveRows
  else
     FGLOBAL_TEMPORARY := gtDeleteRows;

  FCLUSTER_NAME := qDetail.FieldByName('CLUSTER_NAME').AsString;
  FCLUSTER_OWNER := qDetail.FieldByName('CLUSTER_OWNER').AsString;
  FCLUSTER_COLUMNS := '';

  FPhsicalAttributes.Tablespace :=   qDetail.FieldByName('TABLESPACE_NAME').AsString;
  FPhsicalAttributes.PercentFree :=  qDetail.FieldByName('PCT_FREE').AsString;
  FPhsicalAttributes.PercentUsed :=  qDetail.FieldByName('PCT_USED').AsString;
  FPhsicalAttributes.InitialTrans := qDetail.FieldByName('INI_TRANS').AsString;
  FPhsicalAttributes.MaxTrans :=     qDetail.FieldByName('MAX_TRANS').AsString;
  FPhsicalAttributes.InitialExtent:= qDetail.FieldByName('INITIAL_EXTENT').AsString;
  FPhsicalAttributes.MinExtent :=    qDetail.FieldByName('MIN_EXTENTS').AsString;
  FPhsicalAttributes.MaxExtent :=    qDetail.FieldByName('MAX_EXTENTS').AsString;
  FPhsicalAttributes.PctIncrease :=  qDetail.FieldByName('PCT_INCREASE').AsString;
  FPhsicalAttributes.FreeLists :=    qDetail.FieldByName('FREELISTS').AsString;
  FPhsicalAttributes.FreeGroups :=   qDetail.FieldByName('FREELIST_GROUPS').AsString;
  FPhsicalAttributes.BufferPool := bpDefault;
  if qDetail.FieldByName('BUFFER_POOL').AsString = 'RECYCLE' then
     FPhsicalAttributes.BufferPool := bpRecycle;
  if qDetail.FieldByName('BUFFER_POOL').AsString = 'KEEP' then
     FPhsicalAttributes.BufferPool := bpKeep;
  qDetail.close;
       
  if FTableType = ttClustered then
  begin
    qDetail.Close;
    qDetail.SQL.Text := GetClusterColumns;
    qDetail.Open;
    while not qDetail.Eof do
    begin
      FCLUSTER_COLUMNS := FCLUSTER_COLUMNS + qDetail.FieldByName('TAB_COLUMN_NAME').AsString;
      qDetail.Next;
      if not qDetail.Eof then FCLUSTER_COLUMNS := FCLUSTER_COLUMNS + ',';
    end;
    qDetail.Close;
  end;          

  qDetail.Close;
  qDetail.SQL.Text := GetExternalTable;
  qDetail.Open;
  if qDetail.RecordCount > 0 then
  begin
    FTableType :=  ttExternel;
    FExternalAccessDriver := qDetail.FieldByName('TYPE_NAME').AsString;
    FExternalAccessType := qDetail.FieldByName('ACCESS_TYPE').AsString;
    FExternalDefaultDirectory := qDetail.FieldByName('DEFAULT_DIRECTORY_NAME').AsString;
    FExternalLocations := qDetail.FieldByName('DEFAULT_DIRECTORY_NAME').AsString;
    FExternalSpecify := qDetail.FieldByName('REJECT_LIMIT').AsString;
    FExternalParalelDegree := 0;
    FExternalParameters := qDetail.FieldByName('ACCESS_PARAMETERS').AsString;
  end;
  qDetail.Close;
  {
  FQUEUE_PAYLOAD_TYPE: TPayloadType;
  FQUEUE_SCHEMA,
  FQUEUE_TYPE: string;
  FQUEUE_SUBSCRIBERS,
  FQUEUE_MESSAGE_GROUPING: boolean;
  FQUEUE_CAPATIBILITY: integer;
  FQUEUE_SORT_LIST: string;
  }
  FColumnLists.OraSession := OraSession;
  FColumnLists.TableName := FTABLE_NAME;
  FColumnLists.Owner := FOWNER;
  FColumnLists.SetDDL;

  if FTableType = ttIndexOrganized then
  begin
    qDetail.Close;
    qDetail.SQL.Text := GetIndexedTableColumns;
    qDetail.Open;

    FPERCENTAGE_THRESHOLD := qDetail.FieldByName('PCT_THRESHOLD').AsInteger;
    FKEY_COMPRESSION := 0;
    if qDetail.FieldByName('INCLUDE_COLUMN').AsInteger > 0 then
       FINDEX_OGANIZED_FIELD := FColumnLists.Items[qDetail.FieldByName('INCLUDE_COLUMN').AsInteger-1].ColumnName; //ÝLGÝL FÝELD GELMELI qDetail.FieldByName('INCLUDE_COLUMN').AsInteger;
    qDetail.close;
  end;

  qDetail.Close;
  qDetail.SQL.Text := GetTableComment;
  qDetail.Open;
  FCOMMENT := qDetail.FieldByName('comments').AsString;
  qDetail.close;
  
  FIndexList.OraSession := OraSession;
  FIndexList.TableName := FTABLE_NAME;
  FIndexList.Owner := FOWNER;
  FIndexList.SetDDL;

  FConstraintList.OraSession := OraSession;
  FConstraintList.TableName := FTABLE_NAME;
  FConstraintList.Owner := FOWNER;
  FConstraintList.SetDDL;

  FSynonymList.OraSession := OraSession;
  FSynonymList.TableName := FTABLE_NAME;
  FSynonymList.TableOwner := FOWNER;
  FSynonymList.SetDDL;

  FGrantList.OraSession := OraSession;
  FGrantList.TableName := FTABLE_NAME;
  FGrantList.TableSchema := FOWNER;
  FGrantList.SetDDL;

  FIndexPartitionLists.OraSession := OraSession;
  FIndexPartitionLists.ObjectName := FTABLE_NAME;
  FIndexPartitionLists.ObjectOwner := FOWNER;
  FIndexPartitionLists.PartitionClause := pcTable;
  FIndexPartitionLists.SetDDL;
end; // SetDDL

function TTable.GetDDL: string;
var
  strHeader, strPartitions, strComment: string;
  useIndex, useConstraint: boolean;
begin
  result := ''; strPartitions := ''; strHeader := '';

  with self do
  begin
    strHeader := 'CREATE TABLE '+FOWNER+'.'+FTABLE_NAME+ln;

    if TableType = ttStandart then
    begin
      if ColumnType = ctDefineColumns then
        strHeader := strHeader + '('+ln +ColumnLists.GetDDL(FOWNER, FTABLE_NAME) +')'+ln;

      if ColumnType = ctDefineQuery then
        strHeader := strHeader + 'AS '+ln+ FDEFINE_QUERY+ln;

      if ColumnType =  ctObjectTable then
      begin
        strHeader := strHeader + 'OF '+FOBJECT_OWNER +'.' +FOBJECT_TYPE+ln;
        if FOBJECT_PRIMARY_KEY then
        begin
           strHeader := strHeader + ln + ColumnLists.GetPrimaryKey(FOWNER, FTABLE_NAME)
                                  +') '+ln;
           strHeader := strHeader + 'OBJECT IDENTIFIER IS PRIMARY KEY'+ln;
        end;
      end;
      strHeader := strHeader + GenerateStorage(PhsicalAttributes) ;
    end; //ttStandart

    if TableType = ttIndexOrganized then
    begin
      if ColumnType = ctDefineColumns then
        strHeader := strHeader + '('+ln +ColumnLists.GetDDL(FOWNER, FTABLE_NAME);
      if FOBJECT_PRIMARY_KEY then
      begin
        strHeader := strHeader +',';
        strHeader := strHeader + ln + ColumnLists.GetPrimaryKey(FOWNER, FTABLE_NAME)
                                 +') '+ln;
        strHeader := strHeader + 'OBJECT IDENTIFIER IS PRIMARY KEY'+ln;
      end
        else strHeader := strHeader + ') '+ln;

      if ColumnType = ctDefineQuery then
        strHeader := strHeader + 'AS '+ln+ FDEFINE_QUERY+ln;

      strHeader := strHeader + 'ORGANIZATION INDEX';
      if PERCENTAGE_THRESHOLD > 0 then
         strHeader := strHeader + ' PCTTHRESHOLD '+IntToStr(PERCENTAGE_THRESHOLD);
      if KEY_COMPRESSION > 0 then
         strHeader := strHeader + ' COMPRESS '+IntToStr(KEY_COMPRESSION);
      if INDEX_OGANIZED_FIELD <> '' then
         strHeader := strHeader + ' INCLUDING '+INDEX_OGANIZED_FIELD+' OVERFLOW';

      strHeader := strHeader + GenerateStorage(PhsicalAttributes) + ln;
    end; //ttIndexOrganized

    if TableType = ttAdvancedQuening then
    begin
      strHeader := 'BEGIN'+ln
                  +'sys.dbms_aqadm.create_queue_table ('+ln
                  +'queue_table          => '+Str(FOWNER+'.'+FTABLE_NAME)+ln;
      if FQUEUE_PAYLOAD_TYPE = ptRaw then
         strHeader := strHeader +', queue_payload_type => '+str('RAW')+ln ;
      strHeader := strHeader
                                +', sort_list          => '+str(QUEUE_SORT_LIST)+ln
                                +', comment            => '+str(FCOMMENT)+ln;
      if QUEUE_SUBSCRIBERS then
         strHeader := strHeader +', multiple_consumers => TRUE '+ln
      else
         strHeader := strHeader +', multiple_consumers => FALSE '+ln;

      if QUEUE_MESSAGE_GROUPING then
         strHeader := strHeader +', message_grouping   => DBMS_AQADM.TRANSACTIONAL '+ln
      else
         strHeader := strHeader +', message_grouping   => DBMS_AQADM.NONE '+ln;

      strHeader := strHeader    +', storage_clause     => '+Str(GenerateStorage(PhsicalAttributes))+ln;

      if QUEUE_CAPATIBILITY = 0 then
         strHeader := strHeader +', compatible         => '+str('8.0')+ln
      else
         strHeader := strHeader +', compatible         => '+str('8.1')+ln;

      strHeader := strHeader + ', primary_instance   => ''0'' '+ln
                              +', secondary_instance => ''0''); '+ln
                              +'COMMIT; '+ln
                              +'END ';
    end; //ttAdvancedQuening

    if TableType = ttGlobalTemporary then
    begin
      strHeader := 'CREATE GLOBAL TEMPORARY TABLE '+FOWNER+'.'+FTABLE_NAME+ln;
      if ColumnType = ctDefineColumns then
        strHeader := strHeader + '('+ln +ColumnLists.GetDDL(FOWNER, FTABLE_NAME) +')'+ln;

      if ColumnType =  ctObjectTable then
      begin
        strHeader := strHeader + 'OF '+FOBJECT_OWNER +'.' +FOBJECT_TYPE+ln;
        if FOBJECT_PRIMARY_KEY then
        begin
           strHeader := strHeader + ln + ColumnLists.GetPrimaryKey(FOWNER, FTABLE_NAME)
                                  +') '+ln;
           strHeader := strHeader + 'OBJECT IDENTIFIER IS PRIMARY KEY'+ln;
        end;   
      end;
      if FGLOBAL_TEMPORARY = gtDeleteRows then
         strHeader := strHeader + 'ON COMMIT DELETE ROWS'+ln
      else
         strHeader := strHeader + 'ON COMMIT PRESERVE ROWS'+ln; 
    end; //ttGlobalTemporary

    if TableType = ttClustered then
    begin
      if ColumnType = ctDefineColumns then
        strHeader := strHeader + '('+ln +ColumnLists.GetDDL(FOWNER, FTABLE_NAME) +')'+ln;

      strHeader := strHeader + 'CLUSTER '+ CLUSTER_NAME + '( ' + CLUSTER_COLUMNS + ')'+ln;
    end; //ttClustered

    if TableType = ttExternel then
    begin
      strHeader := strHeader + '('+ln +ColumnLists.GetDDL(FOWNER, FTABLE_NAME) +')'+ln;
      strHeader := strHeader + 'ORGANIZATION EXTERNAL'+ln
                             + '(TYPE '+FExternalAccessDriver+ln
                             + ' DEFAULT DIRECTORY '+FExternalDefaultDirectory+ln
                             + ' ACCESS PARAMETERS '+ln
                             + ' ( '+ln
                             + ExternalParameters
                             + ' )'+ln
                             + ' LOCATION ('+ExternalLocations+')'+ln
                             + ' ) '+ln;
      if ExternalSpecify <> '0' then
         strHeader := strHeader +'REJECT LIMIT '+ExternalSpecify+ln;
      if ExternalParalelDegree > 0 then
         strHeader := strHeader +'PARALLEL ( DEGREE '+IntTOStr(ExternalParalelDegree)+' INSTANCES DEFAULT )'+ln;
    end; //ttExternel

    if FLOGGING = ltLogging then
       strHeader := strHeader + '  LOGGING'+ln;
    if FLOGGING = ltNoLogging then
       strHeader := strHeader + '  NOLOGGING'+ln;
    if isNullorZero(FDEGREE,'1') then
       strHeader := strHeader + '  PARALLEL ( DEGREE '+FDEGREE+' INSTANCES '+FINSTANCES+' )'+ln;
    if FROW_MOVEMENT = 'ENABLED' then
       strHeader := strHeader + '  ENABLE ROW MOVEMENT'+ln;
    if FCACHE then
       strHeader := strHeader + '  CACHE'+ln;
    if FMONITORING then
       strHeader := strHeader + '  MONITORING'+ln;

    if FPartitionClause = pcGlobal then
    begin
      FIndexPartitionLists.IndexHashPartitionType := FIndexHashPartitionType;
      FIndexPartitionLists.PartitionClause := pcTable;
      FIndexPartitionLists.IndexPartitionType := ptRange;
      FIndexPartitionLists.IndexPartitionRangeType := FIndexPartitionRangeType;
      strPartitions := FIndexPartitionLists.GetDDL;
    end;

    if strPartitions = '' then
       strHeader := strHeader + ';';

    strComment := ColumnLists.GetCommentDDL(FOWNER, FTABLE_NAME);

    if FComment <> '' then
       strComment := strComment + 'COMMENT ON TABLE '+FOWNER+'.'+FTABLE_NAME+' IS '+str(FComment)+';';

    result := strHeader+ln;

    useIndex := true;
    if (TableType = ttIndexOrganized) then useIndex := false;
    if (useIndex) and (ColumnType = ctObjectTable) then useIndex := false;

    if useIndex then
       result := result + FIndexList.GetDDL+ln;

    useConstraint := true;

    if TableType = ttIndexOrganized then useConstraint := false;
    if (useConstraint) and (ColumnType = ctObjectTable) then useConstraint := false;

    if useConstraint then
       result := result + FConstraintList.GetDDL+ln;
             
    result := result
             +strPartitions+ln
             +FSynonymList.GetDDL+ln
             +FGrantList.GetDDL+ln
             +strComment;

  end; //self
end; //GetDDL

function TTable.GetAlterDDL(NewValue: TTable): string;
var
  strHeader, header, s: string;
  i: integer;
begin
  result := ''; strHeader := '';  s := '';
  Header := 'ALTER TABLE '+FOWNER+'.'+FTABLE_NAME+ln;

  with self do
  begin

    //colon deðiþklikleri
    for i := 0 to FColumnLists.Count -1 do
    begin
       if FColumnLists.Items[i].ColumnName <> NewValue.ColumnLists.Items[i].ColumnName then
          strHeader := strHeader + Header+ 'RENAME COLUMN '+ColumnLists.Items[i].ColumnName+' TO '+NewValue.ColumnLists.Items[i].ColumnName+';'+ln+ln;

       if (FColumnLists.Items[i].DataType <> NewValue.ColumnLists.Items[i].DataType)
          or
          (FColumnLists.Items[i].Length <> NewValue.ColumnLists.Items[i].Length)
          or
          (FColumnLists.Items[i].Scale <> NewValue.ColumnLists.Items[i].Scale)
          or
          (FColumnLists.Items[i].Nullable <> NewValue.ColumnLists.Items[i].Nullable)
          or
          (FColumnLists.Items[i].Default <> NewValue.ColumnLists.Items[i].Default)
        then
        begin
          strHeader := strHeader + Header + 'MODIFY ('+FColumnLists.Items[i].ColumnName+ ' '
                                              +ConvertDataType(NewValue.ColumnLists.Items[i]);

          if FColumnLists.Items[i].Default <> NewValue.ColumnLists.Items[i].Default then
             strHeader := strHeader +' DEFAULT '+ NewValue.ColumnLists.Items[i].Default;

          if FColumnLists.Items[i].Nullable <> NewValue.ColumnLists.Items[i].Nullable then
          begin
             if NewValue.ColumnLists.Items[i].Nullable then
                strHeader := strHeader +' NOT NULL'
             else
                strHeader := strHeader +' NULL';
          end;                                  
          strHeader := strHeader +');'+ln+ln;
        end;

       if FColumnLists.Items[i].Comment <> NewValue.ColumnLists.Items[i].Comment then
          strHeader := strHeader + Header + ' COMMENT ON COLUMN '+OWNER+'.'+TABLE_NAME+'.'+FColumnLists.Items[I].ColumnName
                                          + ' IS '+ Str(NewValue.ColumnLists.Items[I].Comment)+';'+ln+ln;
    end; //deðiþen kolonlar

    //eklenen kolonlar
    if NewValue.ColumnLists.Count > FColumnLists.Count then
    begin
       for i := FColumnLists.Count to NewValue.ColumnLists.Count -1 do
       begin
         strHeader := strHeader + Header + ' ADD ('+NewValue.ColumnLists.Items[i].ColumnName+ ' '
                                                   +ConvertDataType(NewValue.ColumnLists.Items[i]);

         if NewValue.ColumnLists.Items[i].Default <> ''then
            strHeader := strHeader +' DEFAULT '+ NewValue.ColumnLists.Items[i].Default;

         if NewValue.ColumnLists.Items[i].Nullable then
            strHeader := strHeader +' NOT NULL';

          strHeader := strHeader +');'+ln+ln;

        if NewValue.ColumnLists.Items[i].Comment <> '' then
           strHeader := strHeader + Header + ' COMMENT ON COLUMN '+OWNER+'.'+TABLE_NAME+'.'+NewValue.ColumnLists.Items[I].ColumnName
                                           + ' IS '+ Str(NewValue.ColumnLists.Items[I].Comment)+';'+ln+ln;
       end;
    end;//eklenen kolonlar

    strHeader := strHeader + GenerateDiffStorage(ooTable, Header, PhsicalAttributes, NewValue.PhsicalAttributes);

    s := '';
    if FLOGGING <> NewValue.LOGGING then
    begin
      if NewValue.FLOGGING = ltLogging then
         s := s + ' LOGGING';
      if NewValue.FLOGGING = ltNoLogging then
         s := s + ' NOLOGGING';
    end;

    if FDEGREE <> NewValue.DEGREE then
    begin
      if (isNullorZero(NewValue.DEGREE,'1')) or (isNullorZero(NewValue.INSTANCES,'1')) then
         s := s + ' PARALLEL ( DEGREE '+NewValue.DEGREE+' INSTANCES '+NewValue.INSTANCES+' )'
      else
         s := s + ' NOPARALLEL';
    end;

    if FROW_MOVEMENT <> NewValue.ROW_MOVEMENT then
    begin
      if NewValue.ROW_MOVEMENT = 'ENABLED' then
         s := s + ' ENABLE ROW MOVEMENT'
      else
         s := s + ' DISABLE ROW MOVEMENT';
    end;

    if FCACHE <> NewValue.CACHE then
    begin
      if NewValue.FCACHE then
         s := s + ' CACHE'
      else
         s := s + ' NOCACHE';
    end;

    if FMONITORING <> NewValue.MONITORING then
    begin
      if NewValue.FMONITORING then
         s := s + ' MONITORING'
      else
         s := s + ' NOMONITORING';
    end;

    if s <> '' then
       strHeader := strHeader + Header + s + ';' + ln + ln;


    if FTableType = ttStandart then
    begin

    end; //ttStandart

    if FTableType = ttExternel then
    begin
      if FExternalSpecify <> NewValue.ExternalSpecify then
         strHeader := strHeader + Header + 'REJECT LIMIT '+NewValue.ExternalSpecify+';'+ln;

      if FExternalDefaultDirectory <> NewValue.ExternalDefaultDirectory then
         strHeader := strHeader + Header + 'DEFAULT DIRECTORY  '+NewValue.ExternalDefaultDirectory+';'+ln;

      if FExternalParalelDegree <> NewValue.ExternalParalelDegree then
         strHeader := strHeader + Header + ' PARALLEL ( DEGREE '+IntToStr(NewValue.ExternalParalelDegree)+' ); '+ln;

      if FExternalLocations <> NewValue.ExternalLocations then
         strHeader := strHeader + Header + ' LOCATION ('+NewValue.ExternalLocations+');'+ln;

      if not CompareStr(FExternalParameters , NewValue.ExternalParameters) then
         strHeader := strHeader + Header + ' ACCESS PARAMETERS ( '+ln
                                                                  + NewValue.ExternalParameters+ln
                                                                  + ' );'+ln;
    end; //ttExternel


    if FCOMMENT <> NewValue.COMMENT then
       strHeader := strHeader + 'COMMENT ON TABLE '+FOWNER+'.'+FTABLE_NAME+' IS '+str(NewValue.COMMENT)+';'+ln;

    //silinen partitionlar
    for i := 0 to FIndexPartitionLists.Count -1 do
    begin
       if FIndexPartitionLists.Items[i].IsDeleted then
            strHeader := strHeader + Header +'DROP PARTITION '+FIndexPartitionLists.Items[i].PartitionName+';'+ln+ln;
    end; //FIndexPartitionLists.Count > 0

    //eklenen partitionlar
    if NewValue.IndexPartitionLists.Count > FIndexPartitionLists.Count then
    begin
       for i := FIndexPartitionLists.Count to NewValue.IndexPartitionLists.Count -1 do
       begin
        if IndexPartitionRangeType = rpRange then
           strHeader := strHeader + Header + 'ADD PARTITION '+ NewValue.IndexPartitionLists.Items[i].PartitionName
                                           +' VALUES LESS THAN  ('
                                           +NewValue.IndexPartitionLists.Items[i].HighValue
                                           +')'+ln
        else
           strHeader := strHeader + Header + NewValue.IndexPartitionLists.Items[i].PartitionName
                                           +' VALUES  ('
                                           +NewValue.IndexPartitionLists.Items[i].HighValue
                                           +')'+ln;

          if NewValue.IndexPartitionLists.Items[i].Logging = ltLogging then
             strHeader := strHeader +ln+ '   LOGGING';
          if NewValue.IndexPartitionLists.Items[i].Logging = ltNoLogging then
             strHeader := strHeader +ln+ '   NOLOGGING';
           strHeader := strHeader + GenerateStorage(NewValue.IndexPartitionLists.Items[i].PhsicalAttributes);
       end;
    end; //eklenen partition

    //storage deðiþen partitionlar
    //for i := 0 to FIndexPartitionLists.Count -1 do
    //begin
   //    strHeader := strHeader + GenerateDiffStorage(Header + ' MODIFY PARTITION '
   //                                                +FIndexPartitionLists.Items[i].PartitionName,
   //                                                 IndexPartitionLists.Items[i].PhsicalAttributes,
   //                                                 NewValue.IndexPartitionLists.Items[i].PhsicalAttributes);
   // end; //FIndexPartitionLists.Count > 0

  end; //self

  result := strHeader;

end; //GetAlterDDL

function TTable.AlterTable(TableScript: string): boolean;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  result := ExecSQL(TableScript, Format(ChangeSentence('strTableAltered',strTableAltered),[FTABLE_NAME]), FOraSession);
end;

function TTable.CreateTable(TableScript: string): boolean;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  result := ExecSQL(TableScript, Format(ChangeSentence('strTableCreated',strTableCreated),[FTABLE_NAME]), FOraSession);
end;

function TTable.DropTable(CascadeConstraint: boolean): boolean;
var
  FSQL: string;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  FSQL := 'drop table '+FOWNER+'.'+FTABLE_NAME;
  if CascadeConstraint then FSQL := FSQL +' cascade constraints ';
  result := ExecSQL(FSQL, Format(ChangeSentence('strTableDropped',strTableDropped),[FTABLE_NAME]), FOraSession);
end;

function TTable.TruncateTable(TableStorage: integer): boolean;
var
  FSQL: string;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  FSQL := 'truncate table '+FOWNER+'.'+FTABLE_NAME;
  if TableStorage = 0 then FSQL := FSQL +' drop storage '
     else FSQL := FSQL +' reuse storage ';
  result := ExecSQL(FSQL, Format(ChangeSentence('strTableTruncated',strTableTruncated),[FTABLE_NAME]), FOraSession);
end;

function TTable.LockTable(LockMode:TLockMode; NoWait: boolean) : boolean;
var
  FSQL: string;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  FSQL := 'lock table '+FOWNER+'.'+FTABLE_NAME;
  case LockMode of
   lmRowShare : FSQL := FSQL +' in ROW SHARE mode ';
   lmRowExclusive : FSQL := FSQL +' in SHARE ROW EXCLUSIVE mode ';
   lmShareRowExclusive : FSQL := FSQL +' in SHARE ROW EXCLUSIVE mode ';
   lmExclusive : FSQL := FSQL +' in EXCLUSIVE mode ';
  end;
  if NoWait then FSQL := FSQL +' nowait';
  result := ExecSQL(FSQL, Format(ChangeSentence('strTableLocked', strTableLocked),[FTABLE_NAME]), FOraSession);
end;


function TTable.CopyTable(NEW_TABLE_NAME, NEW_OWNER: string; INCLUDE_DATA: boolean) : boolean;
var
  FSQL: string;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  if NEW_TABLE_NAME = '' then exit;
  FSQL := 'create table '+NEW_OWNER+'.'+NEW_TABLE_NAME + ' as select * from '+FOWNER+'.'+FTABLE_NAME;
  if not INCLUDE_DATA then
     FSQL := FSQL + ' where 1 = 2 ';
  result := ExecSQL(FSQL, Format(ChangeSentence('strTableCopied',strTableCopied),[FTABLE_NAME,NEW_OWNER+'.'+NEW_TABLE_NAME ]), FOraSession);

end;

function TTable.RenameTable(NEW_TABLE_NAME: string): boolean;
var
  FSQL: string;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  if NEW_TABLE_NAME = '' then exit;
  FSQL := 'alter table '+FOWNER+'.'+FTABLE_NAME + ' rename to '+NEW_TABLE_NAME;
  result := ExecSQL(FSQL, Format(ChangeSentence('strTableRenamed', strTableRenamed), [FTABLE_NAME, FOWNER+'.'+NEW_TABLE_NAME]), FOraSession);
end;

function TTable.AnalyzeTable(AnalyzeFunction: TAnalyzeFunction; Sample: integer; SampleType: integer): boolean;
var
  FSQL, s: string;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  if SampleType = 0 then
     s := IntToStr(Sample)+' ROWS '
  else
     s := IntToStr(Sample)+' PERCENT ';
  case AnalyzeFunction of
    afCompute: FSQL := 'ANALYZE TABLE '+FOWNER+'.'+FTABLE_NAME + ' COMPUTE STATISTICS ';
    afEstimate: FSQL := 'ANALYZE TABLE '+FOWNER+'.'+FTABLE_NAME + ' ESTIMATE STATISTICS SAMPLE '+s;
    afDelete: FSQL := 'ANALYZE TABLE '+FOWNER+'.'+FTABLE_NAME + ' DELETE STATISTICS ';
  end;

  result := ExecSQL(FSQL, Format(ChangeSentence('strTableAnalayzed', strTableAnalayzed), [FTABLE_NAME]), FOraSession);
end;

function TTable.RecordCount: integer;
begin
  FRecCount := 0;
  ExecSQL('select count(*) from '+FOWNER+'.'+FTABLE_NAME, '', FOraSession, FRecCount);
  result := FRecCount;
end;

function TTable.DisableALLConstraints: boolean;
var
  FSQL: string;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  FSQL :=
     'begin '
    +' for cur in (select owner, constraint_name , table_name '
    +'    from all_constraints '
    +'    where owner = '+Str(FOWNER)+' and '
    +'    TABLE_NAME = '+Str(FTABLE_NAME)+') loop '
    +'    execute immediate ''ALTER TABLE ''||cur.owner||''.''||cur.table_name||'' MODIFY CONSTRAINT ''||cur.constraint_name||'' DISABLE''; '
    +'   end loop; '
    +'end; ';
  result := ExecSQL(FSQL, ChangeSentence('strConstraintsDisabled',strConstraintsDisabled), FOraSession);
end;

function TTable.EnableALLConstraints: boolean;
var
  FSQL: string;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  FSQL :=
     'begin '
    +' for cur in (select owner, constraint_name , table_name '
    +'    from all_constraints '
    +'    where owner = '+Str(FOWNER)+' and '
    +'    TABLE_NAME = '+Str(FTABLE_NAME)+') loop '
    +'    execute immediate ''ALTER TABLE ''||cur.owner||''.''||cur.table_name||'' MODIFY CONSTRAINT ''||cur.constraint_name||'' ENABLE''; '
    +'   end loop; '
    +'end; ';
  result := ExecSQL(FSQL, ChangeSentence('strConstraintsEnabled',strConstraintsEnabled), FOraSession);
end;

function TTable.DisableALLTriggers: boolean;
var
  FSQL: string;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  FSQL := 'alter table '+(FOWNER)+'.'+(FTABLE_NAME)+' disable all triggers';
  result := ExecSQL(FSQL, ChangeSentence('strTriggersDisabled',strTriggersDisabled), FOraSession);
end;

function TTable.EnableALLTriggers: boolean;
var
  FSQL: string;
begin
  result := false;
  if FTABLE_NAME = '' then exit;
  FSQL := 'alter table '+(FOWNER)+'.'+(FTABLE_NAME)+' enable all triggers';
  result := ExecSQL(FSQL, ChangeSentence('strTriggersEnabled',strTriggersEnabled), FOraSession);
end;


end.
