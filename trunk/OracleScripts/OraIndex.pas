unit OraIndex;

interface

uses Classes, SysUtils, Ora, OraStorage, DB, OraPartitions, DBQuery, Forms,
     Dialogs, VirtualTable;

type

  TTableIndex = class(TObject)
  private
    FIndexName,
    FIndexSchema,
    FTableSchema,
    FTableName : string;
    FIndexType: TIndexType;
    FIndexClause: TIndexClause; //0-TableIndex, 1-ClusterIndex
    FPartitionClause: TPartitionClause; //0-NonPartition, 1-Global
    FOnline: boolean;
    FParalel: boolean;
    FParalelDegree: integer;
    FParalelInstances: integer;
    FComputeStatistic: boolean;
    FLoggingType: TLoggingType;
    FBitmap,
    FReverse,
    FNoSorted,
    FFunctions: Boolean;
    FFunctionCnt: string;
    FCompress: Boolean; //True-compres, False-non compress
    FCompressColumns: integer;
    FPhsicalAttributes : TPhsicalAttributes;
    FBitmapIndexFromClause,
    FBitmapIndexWhereClause: string;

    FIndexPartitionLists: TIndexPartitionList;
    FIndexPartitionType: TIndexPartitionType;
    FIndexSubpartitionType: TIndexPartitionType;
    FIndexHashPartitionType: string;
    FIndexColumnLists: TColumnList;
    FOraSession: TOraSession;

    FDSIndex: TVirtualTable;
    FDSIndexColumns: TVirtualTable;
    FDSIndexPartitions: TVirtualTable;

    function GetTableIndexPartitions: string;
    function GetTableIndexExpressions(IndexOwner, IndexName, TableOwner, TableName, ColumnPosition: string): string;
    function GetIndexStatus: string;
  public
    property IndexName: string read FIndexName write FIndexName;
    property IndexSchema: string read FIndexSchema write FIndexSchema;
    property TableSchema: string read FTableSchema write FTableSchema;
    property TableName: string read FTableName write FTableName;
    property IndexType: TIndexType read FIndexType write FIndexType;
    property IndexClause: TIndexClause read FIndexClause write FIndexClause;
    property PartitionClause: TPartitionClause read FPartitionClause write FPartitionClause;
    property Online: boolean read FOnline write FOnline;
    property Paralel: boolean read FParalel  write FParalel;
    property ParalelDegree: integer read FParalelDegree write FParalelDegree;
    property ParalelInstances: integer read FParalelInstances write FParalelInstances;
    property ComputeStatistic: boolean read FComputeStatistic write FComputeStatistic;
    property LoggingType: TLoggingType read FLoggingType write FLoggingType;
    property Bitmap: boolean read FBitmap write FBitmap;
    property Reverse: boolean read FReverse write FReverse;
    property NoSorted: boolean read FNoSorted write FNoSorted;
    property Functions: boolean read FFunctions write FFunctions;
    property FunctionCnt: string read FFunctionCnt write FFunctionCnt;
    property Compress: boolean read FCompress write FCompress;
    property CompressColumns: integer read FCompressColumns write FCompressColumns;
    property PhsicalAttributes : TPhsicalAttributes read  FPhsicalAttributes write FPhsicalAttributes;
    property BitmapIndexFromClause: string read FBitmapIndexFromClause write FBitmapIndexFromClause;
    property BitmapIndexWhereClause: string read FBitmapIndexWhereClause write FBitmapIndexWhereClause;
    property IndexPartitionLists : TIndexPartitionList read FIndexPartitionLists write FIndexPartitionLists;
    property IndexPartitionType: TIndexPartitionType read FIndexPartitionType write FIndexPartitionType;
    property IndexSubpartitionType: TIndexPartitionType read FIndexSubpartitionType write FIndexSubpartitionType;
    property IndexHashPartitionType: string read FIndexHashPartitionType write FIndexHashPartitionType;
    property IndexColumnLists : TColumnList read FIndexColumnLists write FIndexColumnLists;
    property DSIndex: TVirtualTable read FDSIndex;
    property DSIndexColumns: TVirtualTable read FDSIndexColumns;
    property DSIndexPartitions: TVirtualTable read FDSIndexPartitions;
    property IndexStatus: String read GetIndexStatus;
    property OraSession: TOraSession read FOraSession write FOraSession;
    constructor Create;
    destructor destroy; override;
    procedure SetDDL;
    function GetDDL: string;
    function GetTableIndexDetail: string;
    function GetAlterDDL(NewValue: TTableIndex): string;
    function CreateIndex(IndexScript: string) : boolean;
    function DropIndex: boolean;
    function RebuildIndex: boolean;
    function CoalesceIndex: boolean;
    function AnalyzeTable(AnalyzeFunction: TAnalyzeFunction; Sample: integer; SampleType: integer): boolean;
    function AlterIndex(IndexScript: string) : boolean;
  end;

  TIndexList = class(TObject)
  private
    FInnerList: TList;
    FOraSession: TOraSession;
    FTableName: string;
    FOwner: string;
    function GetItem(Index: Integer): TTableIndex;
    procedure SetItem(Index: Integer; TableIndex: TTableIndex);
    function GetCount: Integer;
    function GetTableIndexes: string;
  public
    property OraSession: TOraSession read FOraSession write FOraSession;
    property TableName: string read FTableName write FTableName;
    property Owner: string read FOwner write FOwner;
    constructor Create;
    destructor Destroy; override;
    procedure Add(TableIndex: TTableIndex);
    procedure Delete(Index: Integer);
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TTableIndex read GetItem write SetItem;
    procedure SetDDL;
    function GetDDL: string;
  end;

  function GetTableIndexs: string;
  function GetIndexes(OwnerName: string): string;

implementation

uses Util, frmSchemaBrowser, OraScripts, Languages;

resourcestring
  strIndexAnalyzed = 'Index %s has been analyzed.';
  strIndexCoalesced = 'Index % has been Coalesced.';
  strIndexRebuilt = 'Index %s has been rebuilt.';
  strIndexDropped = 'Index %s has been dropped.';
  strIndexAltered = 'Index %s has been altered.';
  strIndexCreated = 'Index %s has been created.';

//schema browser için
function GetIndexes(OwnerName: string): string;
begin
  result :=
     'Select * FROM ALL_INDEXES '
    +' WHERE OWNER = '+Str(OwnerName)
    +'  ORDER BY INDEX_NAME ';
end;

function GetTableIndexs: string;
begin
  result :=
    'Select C.*, '
   +'(Select uniqueness '
	 +'   from ALL_INDEXES I '
   +'  WHERE I.INDEX_NAME = C.INDEX_NAME '
   +'    and I.OWNER = C.INDEX_OWNER ) ISUNIQE '
   +'from ALL_IND_COLUMNS C '
   +'where TABLE_OWNER = :pOwner '
   +'  and TABLE_NAME = :pTable '
   +'  and INDEX_OWNER = TABLE_OWNER '
end;

function GetTableIndexColumn: string;
begin
  result :=
    'Select C.*, '
   +'(Select uniqueness '
	 +'   from ALL_INDEXES I '
   +'  WHERE I.INDEX_NAME = C.INDEX_NAME '
   +'    and I.OWNER = C.INDEX_OWNER ) ISUNIQE '
   +'from ALL_IND_COLUMNS C '
   +'where TABLE_OWNER = :pOwner '
   +'  and TABLE_NAME = :pTable '
   +'  and INDEX_OWNER = TABLE_OWNER '
   +'  and INDEX_NAME = :pIndex';
end;


{**************************** TIndexList **************************************}
constructor TIndexList.Create;
begin
  FInnerList := TList.Create;
end;

destructor TIndexList.Destroy;
var
  i : Integer;
begin
  try
    if FInnerList.Count > 0 then
    begin
      for i := FInnerList.Count - 1 downto 0 do
      begin
        TObject(FInnerList.Items[i]).Free;
      end;
    end;
  finally
    FInnerList.Free;
  end;  
  inherited;
end;

procedure TIndexList.Add(TableIndex: TTableIndex);
begin
  FInnerList.Add(TableIndex);
end;

procedure TIndexList.Delete(Index: Integer);
begin
  TObject(FInnerList.Items[Index]).Free;
  FinnerList.Delete(Index);
end;

function TIndexList.GetItem(Index: Integer): TTableIndex;
begin
  Result := FInnerList.Items[Index];
end;

procedure TIndexList.SetItem(Index: Integer; TableIndex: TTableIndex);
begin
  if Assigned(TableIndex) then
    FInnerList.Items[Index] := TableIndex
end;

function TIndexList.GetCount: Integer;
begin
  Result := FInnerList.Count;
end;

function TIndexList.GetTableIndexes: string;
begin
  result :=
     'Select * FROM ALL_INDEXES '
    +' WHERE TABLE_NAME = :pTable '
    +'   AND TABLE_OWNER = :pOwner';
end;

procedure TIndexList.SetDDL;
var
  q1: TOraQuery;
  FTableIndex: TTableIndex;
begin
  if FTableName = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;

  q1.SQL.Text := GetTableIndexes;
  q1.ParamByName('pTable').AsString := FTableName;
  q1.ParamByName('pOwner').AsString := FOwner;
  q1.Open;
  while Not q1.Eof do
  begin
    FTableIndex := TTableIndex.Create;
    FTableIndex.TableName := FTableName;
    FTableIndex.TableSchema := FOwner;
    FTableIndex.OraSession := OraSession;
    FTableIndex.IndexName := q1.FieldByName('INDEX_NAME').AsString;
    FTableIndex.IndexSchema := FOwner;
    FTableIndex.SetDDL;
    Add(FTableIndex);
    FTableIndex.NewInstance;
    NewInstance;
    q1.Next;
  end;
  q1.close;
end;

function TIndexList.GetDDL: string;
var
  i: integer;
begin
  result := '';
  if Count > 0 then
  begin
    for i := 0 to Count -1 do
    begin
      result := result + Items[i].GetDDL+ln+ln;
    end;
  end;                          
end;


{**************************** TTableIndex **************************************}

constructor TTableIndex.Create;
begin
  inherited;
  FIndexPartitionLists := TIndexPartitionList.Create;
  FIndexColumnLists := TColumnList.Create;
  FDSIndex := TVirtualTable.Create(nil);
  FDSIndexColumns := TVirtualTable.Create(nil);
  FDSIndexPartitions := TVirtualTable.Create(nil);
end;

destructor TTableIndex.destroy;
begin
  FIndexPartitionLists.Free;
  FIndexColumnLists.Free;
  FDSIndex.Free;
  FDSIndexColumns.Free;
  FDSIndexPartitions.Free;
  inherited;
end;

function TTableIndex.GetIndexStatus: string;
var
  q1: TOraQuery;
begin
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectStatusSQL;
  q1.ParamByName('pOName').AsString := FIndexName;
  q1.ParamByName('pOType').AsString := 'INDEX';
  q1.ParamByName('pOwner').AsString := FIndexSchema;
  q1.Open;
  result := FIndexName+' ( Created: '+q1.FieldByName('CREATED').AsString
                            +' Last DDL: '+q1.FieldByName('LAST_DDL_TIME').AsString
                            +' Status: '+q1.FieldByName('STATUS').AsString
                            +' )';
  q1.Close;
end;

function TTableIndex.GetTableIndexDetail: string;
begin
  result :=
     'Select * FROM  ALL_INDEXES '
    +' WHERE INDEX_NAME = :pIndex '
    +'   AND OWNER = :pOwner ';
end;

function TTableIndex.GetTableIndexPartitions: string;
begin
  result :=
     'Select pii.* '
    +' from  ( Select i.owner, pi.index_name, i.table_owner, i.table_name, pi.partitioning_type, '
    +'           pi.subpartitioning_type, '
    +'           pi.partition_count, pi.locality, pi.def_tablespace_name, '
    +'           pi.DEF_BUFFER_POOL, pi.DEF_INI_TRANS, pi.DEF_MAX_TRANS, pi.DEF_INITIAL_EXTENT, '
    +'           pi.DEF_NEXT_EXTENT, pi.DEF_MIN_EXTENTS, pi.DEF_MAX_EXTENTS, pi.DEF_FREELISTS, '
    +'           pi.DEF_FREELIST_GROUPS, pi.DEF_PCT_INCREASE, pi.DEF_PCT_FREE, pi.DEF_LOGGING '
    +'    from   ALL_PART_INDEXES pi, ALL_INDEXES i '
    +'    where  i.OWNER = pi.owner '
    +'    and    i.INDEX_NAME = pi.INDEX_NAME '
    +'    and    i.TABLE_NAME = pi.TABLE_NAME '
    +'    and    i.PARTITIONED = ''YES'') pii '
    +' where pii.owner = :pOwner '
    +'   and pii.index_name = :pIndex ';
end;  

function TTableIndex.GetTableIndexExpressions(IndexOwner, IndexName, TableOwner, TableName, ColumnPosition: string): string;
begin
  result :=
     'Select IE.* '
    +'  FROM ALL_IND_EXPRESSIONS IE '
    +' WHERE IE.INDEX_OWNER = '+Str(IndexOwner)
    +'   AND IE.INDEX_NAME =  '+Str(IndexName)
    +'   AND IE.TABLE_OWNER = '+Str(TableOwner)
    +'   AND IE.TABLE_NAME = '+Str(TableName)
    +'   AND IE.COLUMN_POSITION = '+ColumnPosition;
end;

procedure TTableIndex.SetDDL;
var
  qDetail,q,q2: TOraQuery;
  FColumn: TColumn;
  FColumnList : TColumnList;
begin
  if FIndexName = '' then exit;

  qDetail := TOraQuery.Create(nil);
  q  := TOraQuery.Create(nil);
  q2 := TOraQuery.Create(nil);

  qDetail.Session  := OraSession;
  q.Session := OraSession;
  q2.Session := OraSession;

  qDetail.SQL.Text := GetTableIndexDetail;
  qDetail.ParamByName('pIndex').AsString := FIndexName;
  qDetail.ParamByName('pOwner').AsString := FIndexSchema;
  qDetail.Open; {open}
  
  CopyDataSet(qDetail, FDSIndex);

  FBitmap := qDetail.FieldByName('INDEX_TYPE').AsString = 'BITMAP';
  if qDetail.FieldByName('UNIQUENESS').AsString = 'UNIQUE' then FIndexType := Uniqe;
  FTableName :=   qDetail.FieldByName('TABLE_NAME').AsString;
  FTableSchema := qDetail.FieldByName('TABLE_OWNER').AsString;
  FFunctions := qDetail.FieldByName('FUNCIDX_STATUS').AsString = 'ENABLED';

  FLoggingType := ltDefault;
  if qDetail.FieldByName('LOGGING').AsString = 'YES' then FLoggingType := ltLogging;
  if qDetail.FieldByName('LOGGING').AsString = 'NO' then FLoggingType := ltNoLogging;

  FParalel := (isNullorZero(qDetail.FieldByName('DEGREE').AsString,'1')) or (isNullorZero(qDetail.FieldByName('INSTANCES').AsString,'1'));
  FParalelInstances := StrToInt(isNull(qDetail.FieldByName('INSTANCES').AsString));
  FParalelDegree := StrToInt(isNull(qDetail.FieldByName('DEGREE').AsString));
  FCompress := qDetail.FieldByName('PREFIX_LENGTH').AsInteger > 0;
  FCompressColumns := qDetail.FieldByName('PREFIX_LENGTH').AsInteger;

  FPhsicalAttributes.Tablespace :=   qDetail.FieldByName('TABLESPACE_NAME').AsString;
  FPhsicalAttributes.PercentFree :=  qDetail.FieldByName('PCT_FREE').AsString;
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

  if qDetail.FieldByName('PARTITIONED').AsString = 'NO' then
     FPartitionClause := pcNonPartition
  else FPartitionClause := pcGlobal;

  if FPartitionClause <> pcNonPartition then
  begin
    q.close;
    q.SQL.Text := GetTableIndexPartitions;
    q.ParamByName('pOwner').AsString := FIndexSchema;
    q.ParamByName('pIndex').AsString := FIndexName;
    q.Open;

    if q.RecordCount > 0 then
    begin
      if q.FieldByName('LOCALITY').AsString = 'LOCAL' then
         FPartitionClause := pcLocal
      else FPartitionClause := pcGlobal;

      if q.FieldByName('PARTITIONING_TYPE').AsString = 'RANGE' then
         FIndexPartitionType := ptRange
      else FIndexPartitionType := ptHash;

      if q.FieldByName('SUBPARTITIONING_TYPE').AsString = 'RANGE' then
         FIndexSubpartitionType := ptRange
      else FIndexSubpartitionType := ptHash;
      IndexHashPartitionType := 'User Named';
    end;
    FIndexPartitionLists.ObjectName := FIndexName;
    FIndexPartitionLists.ObjectOwner := FIndexSchema;
    FIndexPartitionLists.OraSession := OraSession;
    FIndexPartitionLists.SetDDL;
    CopyDataSet(FIndexPartitionLists.DSPartitionList, FDSIndexPartitions); 
  end;

  qDetail.Close;{close}

  FColumnList := TColumnList.Create;
  q.close;
  q.SQL.Text := GetTableIndexColumn;
  q.ParamByName('pTable').AsString := FTableName;
  q.ParamByName('pOwner').AsString := FTableSchema;
  q.ParamByName('pIndex').AsString := FIndexName;
  q.Open;
  CopyDataSet(q, FDSIndexColumns);
  while not q.Eof do
  begin
      FColumn := TColumn.Create;
      if copy(q.FieldByName('COLUMN_NAME').AsString,1,4) = 'SYS_' then
      begin
        q2.close;
        q2.SQL.Text := GetTableIndexExpressions(q.FieldByName('INDEX_OWNER').AsString,
                                                q.FieldByName('INDEX_NAME').AsString,
                                                q.FieldByName('TABLE_OWNER').AsString,
                                                q.FieldByName('TABLE_NAME').AsString,
                                                q.FieldByName('COLUMN_POSITION').AsString);
        Q2.Open;
        if Q2.RecordCount > 0 then
           FColumn.ColumnName := q2.FieldByName('COLUMN_EXPRESSION').AsString
        else FColumn.ColumnName := q.FieldByName('COLUMN_NAME').AsString;
      end else
         FColumn.ColumnName := q.FieldByName('COLUMN_NAME').AsString;
      FColumn.DataType := '';
      
      FColumnList.Add(FColumn);
      FColumn.NewInstance;
      FColumnList.NewInstance;
    q.Next;
  end;
  FIndexColumnLists := FColumnList;
  qDetail.close;
  q.close;
  q2.close;
end;

function TTableIndex.GetDDL: string;
var
  strTypes, indexHeader, strColumns, strBody, strPartitions: string;
  i : integer;
begin
  //header
  strTypes := '';
  with self do
  begin
    if Bitmap then strTypes := 'BITMAP';
    if IndexType = Uniqe then strTypes := 'UNIQUE';

    indexHeader := 'CREATE '+strTypes+' INDEX '+IndexSchema+'.'+ IndexName+ln
                              +'   ON '
                              +TableSchema+'.'
                              +TableName+' ' ;

    if IndexColumnLists.Count > 0 then
    begin
      strColumns := '(';
      for I := 0 to IndexColumnLists.Count -1 do
      begin
       //if copy(indexColumns[I].ColumnName,1,4) = 'SYS_' then
       if Functions then
       begin
         if length(FunctionCnt) > 0 then
            strColumns := strColumns + FunctionCnt
         else
            strColumns := strColumns + IndexColumnLists.Items[I].ColumnName;
       end
       else
        strColumns := strColumns + IndexColumnLists.Items[I].ColumnName;

       if i <> IndexColumnLists.Count-1 then strColumns := strColumns +',';
      end; //IndexColumnLists.Count
      strColumns := strColumns +')';
    end; //IndexColumns

    //BODY
    if LoggingType = ltLogging then
       strBody := strBody +ln+ '   LOGGING';
    if LoggingType = ltNoLogging then
       strBody := strBody +ln+ '   NOLOGGING';

    if ComputeStatistic then
       strBody := strBody +ln +'   COMPUTE STATISTICS';
    if Paralel then
       strBody := strBody +ln+'   PARALLEL( DEGREE '+IntToStr(ParalelDegree)
                             +'   INSTANCES '+IntToStr(ParalelInstances) +' ) '
    else
       strBody := strBody +ln+'   NOPARALLEL';

    if Compress then
       strBody := strBody +ln+'   COMPRESS '+IntToStr(CompressColumns) ;

    if NoSorted then
       strBody := strBody +ln+'   NOSORT ';

    if Reverse then
       strBody := strBody +ln+'   REVERSE ';

    strBody := strBody + GenerateStorage(PhsicalAttributes);

    if PartitionClause <> pcNonPartition then
    begin
      FIndexPartitionLists.IndexHashPartitionType := FIndexHashPartitionType;
      FIndexPartitionLists.PartitionClause := FPartitionClause;
      FIndexPartitionLists.IndexPartitionType := FIndexPartitionType;
      FIndexPartitionLists.IndexPartitionRangeType := rpRange;
      strPartitions := FIndexPartitionLists.GetDDL; //(FIndexHashPartitionType, FPartitionClause, FIndexPartitionType, rpRange)
    end;//PartitionClause <> NonPartition
   
  end; //with TTableIndex do

  result := indexHeader + strColumns + strBody + strPartitions
           +';'
end; //GetDDL


function TTableIndex.GetAlterDDL(NewValue: TTableIndex): string;
var
  strHeader, header: string;
begin
  result := ''; strHeader := '';
  with self do
  begin
    Header := 'ALTER INDEX '+IndexSchema+'.'+IndexName+ln;

    if ParalelDegree <> NewValue.ParalelDegree then
    begin
      if (isNullorZero(NewValue.ParalelDegree,1)) or (isNullorZero(NewValue.ParalelInstances,1)) then
         strHeader := strHeader + Header + ' PARALLEL ( DEGREE '+IntToStr(NewValue.ParalelDegree)+' INSTANCES '+IntTOStr(NewValue.ParalelInstances)+' );'+ln
      else
         strHeader := strHeader + Header + ' NOPARALLEL;'+ln;
    end;

    if LoggingType <> NewValue.LoggingType then
    begin
      if NewValue.LoggingType = ltLogging then
         strHeader := strHeader + Header + ' LOGGING;'+ln;
      if NewValue.LoggingType = ltNoLogging then
         strHeader := strHeader + Header + ' NOLOGGING;'+ln;
    end;

    strHeader := strHeader + GenerateDiffStorage(ooIndex, Header, PhsicalAttributes, NewValue.PhsicalAttributes);

  end; //with
  
  result := strHeader;
end; //GetAlterDDL

function TTableIndex.CreateIndex(IndexScript: string) : boolean;
begin
  result := false;
  if FIndexName = '' then exit;
  result := ExecSQL(IndexScript, Format(ChangeSentence('strIndexCreated',strIndexCreated),[FIndexName]), FOraSession);
end;

function TTableIndex.AlterIndex(IndexScript: string) : boolean;
begin
  result := false;
  if FIndexName = '' then exit;
  result := ExecSQL(IndexScript, Format(ChangeSentence('strIndexAltered',strIndexAltered),[FIndexName]), FOraSession);
end;

function TTableIndex.DropIndex: boolean;
var
  FSQL: string;
begin
  result := false;
  if FIndexName = '' then exit;
  FSQL := 'drop index '+FIndexSchema+'.'+FIndexName;
  result := ExecSQL(FSQL, Format(ChangeSentence('strIndexDropped',strIndexDropped),[FIndexName]), FOraSession);
end;

function TTableIndex.RebuildIndex: boolean;
var
  FSQL: string;
begin
  result := false;
  if FIndexName = '' then exit;
  FSQL := 'alter index '+FIndexSchema+'.'+FIndexName+' rebuild ';
  result := ExecSQL(FSQL, Format(ChangeSentence('strIndexRebuilt',strIndexRebuilt),[FIndexName]), FOraSession);
end;

function TTableIndex.CoalesceIndex: boolean;
var
  FSQL: string;
begin
  result := false;
  if FIndexName = '' then exit;
  FSQL := 'alter index '+FIndexSchema+'.'+FIndexName+' Coalesce ';
  result := ExecSQL(FSQL, Format(ChangeSentence('strIndexCoalesced',strIndexCoalesced),[FIndexName]), FOraSession);
end;

function TTableIndex.AnalyzeTable(AnalyzeFunction: TAnalyzeFunction; Sample: integer; SampleType: integer): boolean;
var
  FSQL, s: string;
begin
  result := false;
  if FIndexName = '' then exit;
  if SampleType = 0 then
     s := IntToStr(Sample)+' ROWS '
  else
     s := IntToStr(Sample)+' PERCENT ';
  case AnalyzeFunction of
    afCompute: FSQL := 'ANALYZE INDEX '+FIndexSchema+'.'+FIndexName + ' COMPUTE STATISTICS ';
    afEstimate: FSQL := 'ANALYZE INDEX '+FIndexSchema+'.'+FIndexName + ' ESTIMATE STATISTICS SAMPLE '+s;
    afDelete: FSQL := 'ANALYZE INDEX '+FIndexSchema+'.'+FIndexName + ' DELETE STATISTICS ';
  end;

  result := ExecSQL(FSQL, Format(ChangeSentence('strIndexAnalyzed',strIndexAnalyzed),[FIndexName]), FOraSession);

end;



end.
