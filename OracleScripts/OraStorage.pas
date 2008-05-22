unit OraStorage;

interface

uses Classes, SysUtils, Ora, DB, Forms, Dialogs, VirtualTable;

type
  TDBFormType = (//schema
                 dbTable, dbView, dbIndexes, dbTriggers, dbSequences, dbPackages, dbProcedures,
                 dbFunctions, dbTypes, dbSynonyms, dbPublicSynonyms, dbDatabaseLinks,
                 //sequrty
                 dbUsers, dbRoles, dbSysPrivs,
                 //storage
                 dbDirectories, dbRollbackSegments, dbTablespaces, dbRedoLogGroups, dbControlFiles,

                 //others db types
                 dbColumns, dbConstraint
                 );

  TIndexType = (Primary, Uniqe, NonUniqe);
  TLoggingType = (ltDefault, ltLogging, ltNoLogging);
  TPartitionClause = (pcNonPartition, pcGlobal, pcLocal, pcTable);
  TIndexClause = (TableIndex, ClusterIndex);
  TIndexPartitionType = (ptHash, ptRange);
  TPartitionRangeType = (rpRange, rpList);
  TBufferPool = (bpDefault, bpRecycle, bpKeep);
  TConstraintType = (ctPrimary, ctUniqe, ctCheck, ctForeignKey, ctNone);
  TPayloadType = (ptRaw, ptObject);
  TGlobalTemporary = (gtDeleteRows, gtPreserveRows);
  TOraObjects = (ooTable, ooColumn, ooIndex, ooKey, ooForeignKey, ooCheck, ooGrant, ooSynonym,
                 ooView);
  TOraEvent = (oeDrop, oeCopy, oeLock, oeRename, oeTruncate, oeAnalyze, oeRebuild, oeCoalesce,
               oeEnable, oeDisable, oeCompile,
               oeEnableConstraints, oeDisableConstraints,
               oeEnableTriggers, oeDisableTriggers, oeOffLine, oeOnLine);
  TAnalyzeFunction = (afCompute, afEstimate, afDelete);
  TSort = (sNONE, sASC, sDESC);
  TMVRefreshMode = (rmFast, rmComplete, rmForce, rmNever);
  TMVWhenMethods = (wmOnDemand, wmOnCommit, wmAutomatically);
  TMVBuiltType = (btImmediate, btDeferred);
  TMVRefreshType = (rtPrimaryKey, rtRowid);
  TMVSegmentLocation= (stMaster, stLocal);
  TMVNewValues = (nvNone, nvIncluding, nvExcluding);

  TSourceType = (stProcedure, stPackage, stPackageBody, stTrigger, stFunction, stType);
  // Exception information
  TExceptionData = record
    Msg : String[200];
    HelpContext : Integer;
  end;

  TMode = (InsertMode, UpdateMode);

  TTablespaceStatus = (tsOnline, tsOffline, tsReadOnly);
  TTablespaceContents = (tcPermanent, tcTemporary, tcUndo);
  TTablespaceExtentManagement = (temDictionary, temLocal);
  TSegmentSpaceManagement = (ssmManual, ssmAuto);
  TTablespaceRetention = (trGuarantee, trNoGuarantee, trNotApply);
  TTablespaceAllocation = (taAuto, taUniform, taDefault); 
CONST

  DBFormType: array[TDBFormType] of string = (
    //schema
    'Tables',
    'Views',
    'Indexes',
    'Triggers',
    'Sequences',
    'Packages',
    'Procedures',
    'Functions',
    'Types',
    'Synonyms',
    'Public Synonyms',
    'Database Links',
     //sequrty
    'Users',
    'Roles',
    'Sys Privs',
    //storage
    'Directories',
    'Rollback Segments',
    'Tablespaces',
    'Redo Log Groups',
    'Control Files',
    //other db types
    'Columns',
    'Constraints'
    );

  OraEvent : array[TOraEvent] of string = (
    'Drop', 'Copy', 'Lock', 'Rename', 'Truncate', 'Analyze', 'Rebuild', 'Coalesce',
    'Enable', 'Disable', 'Compile', 'Enable All Constraints', 'Disable All Constraints',
    'Enable All Triggers', 'Disable All Triggers', 'Take OffLine', 'Take OnLine');

  DBBufferPool: array[TBufferPool] of string = ('DEFAULT','RECYCLE','KEEP');
  DBConstraintType : array[TConstraintType] of string =('PRIMARY KEY', 'UNIQUE', 'CHECK', 'FOREIGN KEY', 'NONE');
  DBLoggingType: array[TLoggingType] of string = ('Default','Logging','No Logging');
  DBIndexPartitionType: array[TIndexPartitionType] of string = ('Hash', 'Range');
  DBSourceType:array[TSourceType] of string = ('PROCEDURE','PACKAGE','PACKAGE BODY','TRIGGER','FUNCTION','TYPE');

type
  TPhsicalAttributes = record
    PercentFree,
    PercentUsed,
    InitialTrans,
    MaxTrans,
    InitialExtent,
    NextExtent,
    MinExtent,
    MaxExtent,
    PctIncrease,
    FreeLists,
    FreeGroups: string;
    BufferPool: TBufferPool;
    Tablespace: string;
  end;
  PPhsicalAttributes = ^TPhsicalAttributes;

  TColumn = class(TObject)
  private
    FColumnName : string;
    FDataType: string;
    FUpperBound: string; //for partitions
    FLength,
    FPrecision,
    FScale: integer;
    FCharUsed: string;
    FNullable: Boolean;
    FUnique: Boolean;
    FDefault,
    FComment: string;
    FConstraintType: TConstraintType;
    FConstraintName,
    FConstraintTable,
    FConstraintColumn,
    FConstraintDeleteRule,
    FConstraintStatus,
    FConstraintDeferrable,
    FConstraintValidation,
    FConstraintCheck: string;
  public
    property ColumnName: String read FColumnName write FColumnName;
    property DataType: String read FDataType write FDataType;
    property UpperBound: String read FUpperBound write FUpperBound;
    property Length: integer read FLength write FLength;
    property Precision: integer read FPrecision write FPrecision;
    property Scale: integer read FScale write FScale;
    property CharUsed: string read FCharUsed write FCharUsed;
    property Nullable: boolean read FNullable write FNullable;
    property Unique: Boolean read FUnique write FUnique;
    property Default: string read FDefault  write FDefault;
    property Comment: string read FComment write FComment;
    property ConstraintType: TConstraintType read FConstraintType write FConstraintType;
    property ConstraintName: string read FConstraintName write FConstraintName;
    property ConstraintTable: string read FConstraintTable write FConstraintTable;
    property ConstraintColumn: string read FConstraintColumn write FConstraintColumn;
    property ConstraintDeleteRule: string read FConstraintDeleteRule write FConstraintDeleteRule;
    property ConstraintStatus: string read FConstraintStatus write FConstraintStatus;
    property ConstraintDeferrable: string read FConstraintDeferrable write FConstraintDeferrable;
    property ConstraintValidation: string read FConstraintValidation write FConstraintValidation;
    property ConstraintCheck: string read FConstraintCheck write FConstraintCheck;
  end;

  TColumnList = class(TObject)
  private
    FInnerList: TList;
    FOraSession: TOraSession;
    FTableName: string;
    FOwner: string;
    FColumnList : TVirtualTable;
    function GetItem(Index: Integer): TColumn;
    procedure SetItem(Index: Integer; Column: TColumn);
    function GetCount: Integer;
    function GetLastForeignKeyNo: Integer;
    function GetLastPrimaryKeyNo: Integer;
    function GetLastCheckNo: integer;
    function FillBlank(Value: string; MaxLength: integer): string;
    function ColumnAttributes(Column: TColumn): string;

  public
    property TableName: string read FTableName write FTableName;
    property Owner: string read FOwner write FOwner;
    property Count: Integer read GetCount;
    property LastForeignKeyNo: Integer read GetLastForeignKeyNo;
    property LastPrimaryKeyNo: Integer read GetLastPrimaryKeyNo;
    property LastCheckNo: Integer read GetLastCheckNo;
    property Items[Index: Integer]: TColumn read GetItem write SetItem;
    property ColumnList : TVirtualTable read FColumnList;
    property OraSession: TOraSession read FOraSession write FOraSession;

    procedure ClearColumnList;
    procedure Add(Column: TColumn);
    procedure Delete(Index: Integer);
    function FindByColumnId(ColumnName: string): integer;
    procedure SetDDL;
    function GetDDL(OWNER, TABLE_NAME: string): string;
    function GetDDLOnlyColumns(OWNER, TABLE_NAME: string): string;
    function GetPrimaryKey(OWNER, TABLE_NAME: string): string;
    function GetCommentDDL(OWNER, TABLE_NAME: string): string;
    function DropColumn: boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  function GetTableColumns(TableName, OwnerName, ColumnName: string): string; overload;
  function GetTableColumns: string; overload;
  function GenerateStorage(PhsicalAttributes: TPhsicalAttributes): string;
  function GenerateDiffStorage(OraObject: TOraObjects; Header: string; PhsicalAttributes, NewPhsicalAttributes : TPhsicalAttributes): string;
  function ConvertDataType(Column: TColumn): string;



implementation

uses util, frmSchemaBrowser, DBQuery, Languages;

resourcestring
  strColumnDrop = 'Column %s has been dropped.';

{**********************  TPhsicalAttributes  ******************************}

function GenerateStorage(PhsicalAttributes: TPhsicalAttributes): string;
var
  storage,storage2: string;
begin
  result := '';
  storage := '';
  storage2 := '';

  with PhsicalAttributes do
  begin
    if isNullorZero(Tablespace,'') then
       storage2 :=  storage2+ln +'   TABLESPACE  '+Tablespace;
    if isNullorZero(PercentFree,'10') then
       storage2 :=  storage2+ln +'   PCTFREE   '+PercentFree;
    if isNullorZero(PercentUsed,'10') then
       storage2 :=  storage2+ln +'   PCTUSED   '+PercentUsed;
    if isNullorZero(InitialTrans,'2')  then
       storage2 :=  storage2+ln +'   INITRANS  '+InitialTrans;
    if isNullorZero(MaxTrans,'255') then
       storage2 :=  storage2+ln +'   MAXTRANS  '+MaxTrans;

    if isNullorZero(InitialExtent,'65536') then
       storage :=  storage+ln +'            INITIAL     '+InitialExtent;
    if isNullorZero(MinExtent,'1') then
       storage :=  storage+ln +'            MINEXTENTS  '+MinExtent;
    if isNullorZero(NextExtent,'') then
       storage :=  storage+ln +'            NEXT        '+ NextExtent;
    if isNullorZero(MaxExtent,'2147483645') then
       storage :=  storage+ln +'            MAXEXTENTS  '+ MaxExtent;
    if isNullorZero(PctIncrease,'') then
       storage :=  storage+ln +'            PCTINCREASE '+ PctIncrease;
    if BufferPool <> bpDefault then
       storage :=  storage+ln +'            BUFFER_POOL '+DBBufferPool[BufferPool];
    if isNullorZero(FreeLists,'') then
       storage :=  storage+ln +'            FREELISTS '+ FreeLists;
    if isNullorZero(FreeGroups,'') then
       storage :=  storage+ln +'            FREELIST GROUPS '+ FreeGroups;
  end;
  if length(storage2)> 0 then
     result := storage2 + ln;
  if length(storage)> 0 then
     result := Result  +'   STORAGE ( '+storage+ln+'           )'+ln
  else
     Result := Result + '';
end;

function GenerateDiffStorage(OraObject: TOraObjects; Header: string; PhsicalAttributes, NewPhsicalAttributes : TPhsicalAttributes): string;
var
  strHeader, s: string;
begin
  strHeader := '';
  with PhsicalAttributes do
  begin
    if Tablespace <> NewPhsicalAttributes.Tablespace then
    begin
       if OraObject = ooTable then
          strHeader := strHeader + Header + ' MOVE TABLESPACE '+ NewPhsicalAttributes.Tablespace+ln+ln;
       if OraObject = ooIndex then
          strHeader := strHeader + Header + ' REBUILD TABLESPACE '+ NewPhsicalAttributes.Tablespace+ln+ln;
    end;
    s := '';
    if PercentFree <> NewPhsicalAttributes.PercentFree then
       s := ' PCTFREE '+NewPhsicalAttributes.PercentFree;
    if PercentUsed <> NewPhsicalAttributes.PercentUsed then
       s := s + ' PCTUSED '+NewPhsicalAttributes.PercentUsed;
    if InitialTrans <> NewPhsicalAttributes.InitialTrans then
       s := s + ' INITRANS '+NewPhsicalAttributes.InitialTrans;
    if MaxTrans <> NewPhsicalAttributes.MaxTrans then
       s := s + ' MAXTRANS '+NewPhsicalAttributes.MaxTrans;
    if s <> '' then
       strHeader := strHeader + Header + s + ';' + ln + ln;
    s := '';
    if InitialExtent <> NewPhsicalAttributes.InitialExtent then
       s := ' INITIAL ' +NewPhsicalAttributes.InitialExtent;
    if NextExtent    <> NewPhsicalAttributes.NextExtent then
       s := s + ' NEXT '+ NewPhsicalAttributes.InitialExtent;
    if MinExtent <> NewPhsicalAttributes.MinExtent then
       s := s + ' MINEXTENTS ' + NewPhsicalAttributes.MinExtent;
    if MaxExtent <> NewPhsicalAttributes.MaxExtent then
       s := s + ' MAXEXTENTS ' + NewPhsicalAttributes.MaxExtent;
    if PctIncrease <> NewPhsicalAttributes.PctIncrease then
       s := s + ' PCTINCREASE ' + NewPhsicalAttributes.PctIncrease;
    if BufferPool <> NewPhsicalAttributes.BufferPool then
       s := s + ' BUFFER_POOL ' + DBBufferPool[NewPhsicalAttributes.BufferPool];
    if FreeLists <> NewPhsicalAttributes.FreeLists then
       s := s + ' FREELISTS ' + NewPhsicalAttributes.FreeLists;
    if FreeGroups <> NewPhsicalAttributes.FreeGroups then
       s := s + ' FREELIST GROUPS ' + NewPhsicalAttributes.FreeGroups;
    if s <> '' then
       strHeader := strHeader + Header + ' STORAGE ( '+s+' );' + ln + ln;
  end; //PhsicalAttributes

  result := strHeader;
end;

{********************** TColumnList ***********************************}

function GetTableColumns(TableName, OwnerName, ColumnName: string): string;
begin
  result :=
    'SELECT cols.*, '
   +'      ( SELECT comments FROM SYS.user_col_comments WHERE table_name = cols.table_name AND column_name = cols.column_name) comments '
   +'     FROM SYS.ALL_tab_columns cols '
   +'    WHERE cols.table_name = '+#39+UpperCase(TableName)+#39
   +'      and COLS.OWNER = '+#39+UpperCase(OwnerName)+#39;
  if ColumnName <> '' then
     result := result +'  and cols.column_name = '+Str(ColumnName);
  result := result 
   +' ORDER BY column_id ';
end;

function GetTableColumns: string;
begin
  result :=
    'SELECT cols.*, '
   +'      ( select comments from user_col_comments WHERE table_name = cols.table_name AND column_name = cols.column_name) comments '
   +'     FROM ALL_tab_columns cols '
   +'    WHERE cols.table_name = :pTable '
   +'      and COLS.OWNER = :pOwner '
   +' ORDER BY column_id ';
end;

function ConvertDataType(Column: TColumn): string;
begin
  if copy(GetColumnType(Column.DataType),1,3) = '100' then
  begin
    if Column.Length > 0 then
    begin
       result := Column.DataType +'('+IntTOStr(Column.Length);
       if Column.CharUsed = 'B' then
          result := result + ' BYTE';
       result := result +')';
    end
    else
       result := Column.DataType;
  end;

  if copy(GetColumnType(Column.DataType),1,3) = '011' then
  begin
    if Column.Precision > 0 then
    begin
       result := Column.DataType +'('+IntToStr(Column.Precision)+')';
       if Column.Scale > 0 then
          result := Column.DataType +'('+IntToStr(Column.Precision)+','+IntTOStr(Column.Scale)+')';
    end
    else
       result := Column.DataType;
  end;

  if copy(GetColumnType(Column.DataType),1,3) = '000' then
    result := Column.DataType;
end;


constructor TColumnList.Create;
begin
  FInnerList := TList.Create;
  FColumnList := TVirtualTable.Create(nil);
end;

destructor TColumnList.Destroy;
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
  FColumnList.Free;
  inherited;
end;

procedure TColumnList.Add(Column: TColumn);
begin
  FInnerList.Add(Column);
end;

procedure TColumnList.ClearColumnList;
begin
  FInnerList.Clear;
end;

procedure TColumnList.Delete(Index: Integer);
begin
  TObject(FInnerList.Items[Index]).Free;
  FinnerList.Delete(Index);
end;

function TColumnList.GetItem(Index: Integer): TColumn;
begin
  Result := FInnerList.Items[Index];
end;

procedure TColumnList.SetItem(Index: Integer; Column: TColumn);
begin
  if Assigned(Column) then
    FInnerList.Items[Index] := Column
end;

function TColumnList.GetCount: Integer;
begin
  Result := FInnerList.Count;
end;

function TColumnList.FindByColumnId(ColumnName: string): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to FInnerList.Count -1 do
  begin
    if TColumn(FInnerList.Items[i]).ColumnName = ColumnName then
    begin
       result := i;
       exit;
    end;
  end;
end;

function TColumnList.GetLastForeignKeyNo: Integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to FInnerList.Count -1 do
  begin
    if TColumn(FInnerList.Items[i]).ConstraintType = ctForeignKey then
       result := i;
  end;
end;

function TColumnList.GetLastPrimaryKeyNo: Integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to FInnerList.Count -1 do
  begin
    if TColumn(FInnerList.Items[i]).ConstraintType = ctPrimary then
       result := i;
  end;
end;

function TColumnList.GetLastCheckNo: integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to FInnerList.Count -1 do
  begin
    if TColumn(FInnerList.Items[i]).ConstraintType = ctCheck then
       result := i;
  end;
end;


function TColumnList.FillBlank(Value: string; MaxLength: integer): string;
var
  i: integer;
begin
  result := ' ';
  if length(Value) = MaxLength then exit;
  for i := length(Value) to MaxLength do
      Result := Result + ' ';
end;

function TColumnList.ColumnAttributes(Column: TColumn): string;
begin
  result := '';
  if Column.ConstraintDeleteRule = 'On Delete Cascade' then
     result := result + ln+'    ON DELETE CASCADE';
  if Column.ConstraintDeleteRule = 'On Delete Set Null' then
     result := result + ln+'    ON DELETE SET NULL';
  if Column.ConstraintDeferrable = 'Initially Immediate' then
     result := result + ln+'    DEFERRABLE INITIALLY IMMEDIATE';
  if Column.ConstraintDeferrable = 'Initially Deferred' then
     result := result + ln+'    DEFERRABLE INITIALLY DEFERRED';
  if Column.ConstraintStatus = 'Disable' then
     result := result + ln+'    DISABLE';
  if Column.ConstraintValidation = 'Validate' then
     result := result + ln+'    VALIDATE';
  if Column.ConstraintValidation = 'No Validate' then
     result := result + ln+'    NOVALIDATE';
end;        

procedure TColumnList.SetDDL;
var
  q1: TOraQuery;
  FColumn: TColumn;
begin
  if FTableName = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetTableColumns;
  q1.ParamByName('pTable').AsString := FTableName;
  q1.ParamByName('pOwner').AsString := FOwner;
  q1.Open;
  CopyDataSet(q1, FColumnList);
  
  while Not q1.Eof do
  begin
    FColumn := TColumn.Create;
    FColumn.ColumnName := q1.FieldByName('COLUMN_NAME').AsString;
    FColumn.DataType := q1.FieldByName('DATA_TYPE').AsString;

    if copy(GetColumnType(FColumn.DataType),1,3) = '100' then
       FColumn.Length := q1.FieldByName('DATA_LENGTH').AsInteger
    else
       FColumn.Length := 0;

    if copy(GetColumnType(FColumn.DataType),1,3) = '011' then
    begin
       FColumn.Precision := q1.FieldByName('DATA_PRECISION').AsInteger;
       FColumn.Length := q1.FieldByName('DATA_PRECISION').AsInteger;
    end;

    FColumn.CharUsed := q1.FieldByName('CHAR_USED').AsString;
    FColumn.Scale := q1.FieldByName('DATA_SCALE').AsInteger;
    FColumn.Nullable := q1.FieldByName('NULLABLE').AsString =  'N';
    FColumn.Default := q1.FieldByName('DATA_DEFAULT').AsString;
    FColumn.ConstraintType := ctNone;

    Add(FColumn);
    FColumn.NewInstance;
    NewInstance;
    q1.Next;
  end;
  
  q1.First;
  while Not q1.Eof do
  begin
    items[FindByColumnId(q1.FieldByName('COLUMN_NAME').AsString)].Comment := q1.FieldByName('COMMENTS').AsString;
    q1.Next;
  end;
  q1.close;
end;//SetDDL

function TColumnList.GetDDL(OWNER, TABLE_NAME: string): string;
var
  strColumns, strPrimary, strCheck, strForeign : string;
  i, max: integer;
begin
  if Count > 0 then
  begin
    strColumns := '';
    strPrimary := ''; strCheck := ''; strForeign := '';
    max := 0;
    for I := 0 to Count -1 do
       if length(Items[I].ColumnName) > max then max := length(Items[I].ColumnName);

    for I := 0 to Count -1 do
    begin
      strColumns := strColumns +'  '+Items[I].ColumnName
                               +FillBlank(Items[I].ColumnName, max)
                               +ConvertDataType(Items[I]);
      if Items[I].Default <> '' then
         strColumns := strColumns +' DEFAULT '+ Items[I].Default;
      if Items[I].Unique then
         strColumns := strColumns +' UNIQUE';
      if Items[I].Nullable then
         strColumns := strColumns +' NOT NULL';

     if i <> Count-1 then strColumns := strColumns +',';
     if (i = Count-1) and ((LastForeignKeyNo >=  0) or
                                        (LastPrimaryKeyNo >= 0) or
                                        (LastCheckNo >= 0)) then strColumns := strColumns +',';
     strColumns := strColumns +ln;
    end; //.Count

    //CHECK
    for I := 0 to Count -1 do
    begin
      if Items[I].ConstraintType = ctCheck then
      begin
         strCheck := strCheck +'  CONSTRAINT '+Items[I].ConstraintName
                              +' CHECK ( '
                              +Items[I].ConstraintCheck+')'
                              +ColumnAttributes(Items[I]);
         if i <= LastCheckNo -1 then strCheck := strCheck +',';
         if (i = LastCheckNo) and ((LastForeignKeyNo >= 0) or (LastPrimaryKeyNo >= 0) ) then strCheck := strCheck +',';
         strCheck := strCheck +ln;
      end;
    end; //Count

    //PRIMARY KEY
    for I := 0 to Count -1 do
    begin
      if Items[I].ConstraintType = ctPrimary then
      begin
        strPrimary := strPrimary + Items[I].ColumnName;
        if i <= LastPrimaryKeyNo -1  then strPrimary := strPrimary +',';
      end;
    end; //Count
    if strPrimary <> '' then
       strPrimary := '  CONSTRAINT '+Items[LastPrimaryKeyNo].ConstraintName
                       +' PRIMARY KEY ('
                       + strPrimary +')'
                       +ColumnAttributes(Items[LastPrimaryKeyNo]);
    if (strPrimary <> '') and (LastForeignKeyNo >=  0) then
       strPrimary := strPrimary +','+ln;


    //FOREIGN KEY
    for I := 0 to Count -1 do
    begin
      if Items[I].ConstraintType = ctForeignKey then
      begin
         strForeign := strForeign +'  CONSTRAINT '+Items[I].ConstraintName
                                  +' FOREIGN KEY('
                                  +Items[I].ColumnName
                                  +')'
                                  +' REFERENCES '
                                  +Items[I].ConstraintTable
                                  +'('
                                  +Items[I].ConstraintColumn
                                  +') '
                                  +ColumnAttributes(Items[I]);
         if i <= LastForeignKeyNo -1 then strForeign := strForeign +','+ln;
      end;
    end; //Count
  end; //
  result := strColumns + strCheck + strPrimary + strForeign ;
end;

function TColumnList.GetDDLOnlyColumns(OWNER, TABLE_NAME: string): string;
var
  strColumns : string;
  i: integer;
begin
  strColumns := '';
  for I := 0 to Count -1 do
  begin
    strColumns := strColumns +Items[I].ColumnName;
   if i <> Count-1 then strColumns := strColumns +',';
  end; //.Count
  if strColumns <> '' then
     result := ln+'('+ln + strColumns + ln + ')'
  else
     result := '';   
end;

function TColumnList.GetPrimaryKey(OWNER, TABLE_NAME: string): string;
var
  strPrimary : string;
  i: integer;
begin
  //PRIMARY KEY
  strPrimary := '';
  for I := 0 to Count -1 do
  begin
    if Items[I].ConstraintType = ctPrimary then
    begin
      strPrimary := strPrimary + Items[I].ColumnName;
      if i <= LastPrimaryKeyNo -1  then strPrimary := strPrimary +',';
    end;
  end; //Count
  if strPrimary <> '' then
     strPrimary := '  CONSTRAINT PK_'+ TABLE_NAME
                     +' PRIMARY KEY ('
                     + strPrimary +')';
  result := strPrimary;
end;


function TColumnList.GetCommentDDL(OWNER, TABLE_NAME: string): string;
var
  strComment : string;
  i: integer;
begin
  strComment := '';
  if Count > 0 then
  begin
    for I := 0 to Count -1 do
    begin
     if Items[I].Comment <> '' then
        strComment := strComment + 'COMMENT ON COLUMN '+OWNER+'.'+TABLE_NAME+'.'+Items[I].ColumnName
                                 + ' IS '+ Str(Items[I].Comment)+';'+ln;
    end; //Count
  end;
  result := strComment;
end;

function TColumnList.DropColumn: boolean;
var
  FSQL: string;
begin
  result := false;
  if FTableName = '' then exit;
  FSQL :=  'ALTER TABLE '+FOwner+'.'+FTableName+ ' DROP COLUMN '+TColumn(FInnerList.Items[0]).ColumnName;
  result := ExecSQL(FSQL, Format(ChangeSentence('strColumnDrop',strColumnDrop),[TColumn(FInnerList.Items[0]).ColumnName]), FOraSession, Application.MainForm.ActiveMDIChild.Handle);
end;


end.
