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
unit OraPartitions;

interface

uses Classes, SysUtils, Ora, OraStorage, DB, VirtualTable;

type

  PartitionColumn = record
    ColumnName : string;
    DataType: string;
    UpperBound: string;
  end;
  TPartitionColumn = ^PartitionColumn;

  SubpartitionColumn = record
    SubpartitionName,
    Tablespace,
    Value: string;
  end;
  TSubpartitionColumn = ^SubpartitionColumn;

  TIndexPartition = class(TObject)
  private
    FPartitionName: String;
    FPartitionColumns: TList;
    FSubpartitionColumns: TList;
    FLogging: TLoggingType;
    FHasSubpartitionNameType: integer; //0-UserNamed, 1-SystemNamed
    FPhsicalAttributes : TPhsicalAttributes;
    FHighValue: string;
    FPartitionPosition: integer;
    FPartitionClause : TPartitionClause;
    FIsDeleted: Boolean;
    function GetPartitionColumnItem(Index: Integer): TPartitionColumn;
    procedure SetPartitionColumnItem(Index: Integer; Column: TPartitionColumn);
    function GetPartitionColumnCount: Integer;

    function GetSubpartitionColumnItem(Index: Integer): TSubpartitionColumn;
    procedure SetSubpartitionColumnItem(Index: Integer; Column: TSubpartitionColumn);
    function GetSubpartitionColumnCount: Integer;

  public
    property PartitionName: string read FPartitionName write FPartitionName;
    property Logging: TLoggingType read FLogging write FLogging;
    property HasSubpartitionNameType: integer read FHasSubpartitionNameType write FHasSubpartitionNameType;
    property PhsicalAttributes: TPhsicalAttributes read FPhsicalAttributes write FPhsicalAttributes;
    property HighValue: string read FHighValue write FHighValue;
    property PartitionPosition: integer read FPartitionPosition write FPartitionPosition;
    property IsDeleted: boolean read FIsDeleted write FIsDeleted; 
    constructor Create;
    destructor Destroy; override;
    procedure PartitionColumnAdd(Column: TPartitionColumn);
    procedure PartitionColumnDelete(Index: Integer);
    property  PartitionColumnCount: Integer read GetPartitionColumnCount;
    property  PartitionColumnItems[Index: Integer]: TPartitionColumn read GetPartitionColumnItem write SetPartitionColumnItem;

    procedure SubpartitionColumnAdd(Column: TSubpartitionColumn);
    procedure SubpartitionColumnDelete(Index: Integer);
    procedure SubpartitionColumnDeleteAll;
    property  SubpartitionColumnCount: Integer read GetSubpartitionColumnCount;
    property  SubpartitionColumnItems[Index: Integer]: TSubpartitionColumn read GetSubpartitionColumnItem write SetSubpartitionColumnItem;

    property PartitionClause : TPartitionClause read FPartitionClause write FPartitionClause;
    procedure SetDDL(ObjectName, ObjectOwner, PartitionName: string; OraSession: TOraSession);
    function GetDDL: string;

  end;

  TIndexPartitionList = class(TObject)
  private
    FInnerList: TList;
    FSubpartitionList: string;
    FSubpartitions: string;
    FPartitionClause : TPartitionClause;
    FObjectName,
    FObjectOwner: string;
    FIndexHashPartitionType: string;
    FIndexPartitionType: TIndexPartitionType;
    FIndexPartitionRangeType: TPartitionRangeType;
    FDSPartitionList: TVirtualTable;
    FOraSession: TOraSession;
    function GetItem(Index: Integer): TIndexPartition;
    procedure SetItem(Index: Integer; IndexPartition: TIndexPartition);
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(IndexPartition: TIndexPartition);
    procedure DeleteByName(PartitionName: string);
    function  FindByPartitionId(PartitionName: string): integer;
    procedure DeleteAll;
    procedure Delete(Index: Integer);
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TIndexPartition read GetItem write SetItem;
    property SubpartitionList: string read FSubpartitionList write FSubpartitionList;
    property Subpartitions: string read FSubpartitions write FSubpartitions;
    property PartitionClause : TPartitionClause read FPartitionClause write FPartitionClause;
    property ObjectName: string read FObjectName write FObjectName;
    property ObjectOwner: string read FObjectOwner write FObjectOwner;
    property IndexHashPartitionType: string read FIndexHashPartitionType write FIndexHashPartitionType;
    property IndexPartitionType: TIndexPartitionType read FIndexPartitionType write FIndexPartitionType;
    property IndexPartitionRangeType: TPartitionRangeType read FIndexPartitionRangeType write FIndexPartitionRangeType;
    property DSPartitionList: TVirtualTable read FDSPartitionList;
    property OraSession: TOraSession read FOraSession write FOraSession;
    procedure SetDDL;
    function GetDDL: string;
    function Clone: TIndexPartitionList;
  end;

  function GetTablePartitionedColumns: string;
  function GetTablePartitions: string;
  function GetTablePartition: string;
  function GetTableSubPartitionedColumns: string;
  function GetTableSubPartitions: string;

implementation

uses Util;

{********************** TIndexPartition ***********************************}

function GetTableSubPartitionedColumns: string;
begin
  result :=
    'Select COLUMN_NAME, COLUMN_POSITION '
   +'  FROM ALL_SUBPART_KEY_COLUMNS '
   +' WHERE name = :pName '
   +'  and owner = :pOwner '
   +'ORDER BY NAME, COLUMN_POSITION ';
end;

function GetTableSubPartitions: string;
begin
  result :=
    'Select * '
   +'  FROM ALL_TAB_SUBPARTITIONS '
   +' WHERE table_name = :pName '
   +'  and table_owner = :pOwner '
   +' ORDER BY SUBPARTITION_POSITION ';
end;

function GetTablePartitions: string;
begin
  result :=
    'Select * '
   +'FROM all_TAB_PARTITIONS '
   +'WHERE table_name = :pName '
   +'  and table_owner = :pOwner '
   +'ORDER BY PARTITION_POSITION ';
end;

function GetTablePartitionedColumns: string;
begin
  result :=
    'Select COLUMN_NAME, COLUMN_POSITION '
   +'  FROM ALL_PART_KEY_COLUMNS '
   +' WHERE name = :pName '
   +'   and owner = :pOwner '
   +' ORDER BY NAME, COLUMN_POSITION ';
end;

function GetTablePartition: string;
begin
  result :=
    'SELECT  * '
    +' FROM USER_PART_TABLES '
    +' WHERE TABLE_NAME = :pTable';
end;

function GetTableIndexPartitionDetail(IndexName, OwnerName, PartitionName: string): string;
begin
  result :=
    'Select * FROM ALL_IND_PARTITIONS '
   +' WHERE INDEX_OWNER = '+Str(OwnerName)
   +'   and index_name =  '+Str(IndexName);
  if PartitionName <> '' then
   Result := Result
   +'   and PARTITION_NAME = '+Str(PartitionName);
  Result := Result
   +' ORDER BY INDEX_NAME, PARTITION_POSITION';
end;

function GetTableIndexPartitionColumns: string;
begin
  result :=
    'Select NAME, rtrim(object_type) object_type, COLUMN_NAME '
   +'  FROM ALL_PART_KEY_COLUMNS '
   +' Where owner = :pOwner '
   +'   and object_type = ''INDEX'' '
   +'   and NAME = :pName '
   +' ORDER BY NAME, COLUMN_POSITION ';
end;

function GetTableIndexSubPartition: string;
begin
  result :=
    'Select * '
   +'  from ALL_IND_SUBPARTITIONS '
   +' WHERE INDEX_OWNER = :pOwner '
   +'   and index_name =  :pName '
   +'   and PARTITION_NAME = :pPartition '
   +' order by PARTITION_NAME, SUBPARTITION_NAME ';
end;

function GetTablePartitionDetail(TableName, OwnerName, PartitionName: string): string;
begin
  result :=
    'Select * FROM ALL_TAB_PARTITIONS '
   +' WHERE TABLE_OWNER = '+Str(OwnerName)
   +'   and TABLE_name =  '+Str(TableName);
  if PartitionName <> '' then
   Result := Result
   +'   and PARTITION_NAME = '+Str(PartitionName);
  Result := Result
   +' ORDER BY TABLE_NAME, PARTITION_POSITION';
end;

function GetTablePartitionColumns: string;
begin
  result :=
    'Select NAME, rtrim(object_type) object_type, COLUMN_NAME '
   +'  FROM ALL_PART_KEY_COLUMNS '
   +' Where owner = :pOwner '
   +'   and object_type = ''TABLE'' '
   +'   and NAME = :pName '
   +' ORDER BY NAME, COLUMN_POSITION ';
end;

function GetTableSubPartition: string;
begin
  result :=
    'Select * '
   +'  from ALL_TAB_SUBPARTITIONS '
   +' WHERE TABLE_OWNER = :pOwner '
   +'   and TABLE_name =  :pName '
   +'   and PARTITION_NAME = :pPartition '
   +' order by PARTITION_NAME, SUBPARTITION_NAME ';
end;

function GetTableSubPartitionKeys: string;
begin
  result :=
    'Select OBJECT_TYPE, NAME, COLUMN_NAME '
   +'  FROM ALL_SUBPART_KEY_COLUMNS '
   +' Where owner = :pOwner '
   +'   and object_type = ''TABLE'' '
   +'   and NAME = :pName '
   +' ORDER BY NAME, COLUMN_POSITION ';
end;

constructor TIndexPartition.Create;
begin
  FPartitionColumns := TList.Create;
  FSubpartitionColumns := TList.Create;
  FIsDeleted := false;
end;

destructor TIndexPartition.Destroy;
var
  i : Integer;
  FPartitionColumn: TPartitionColumn;
  FSubpartitionColumn: TSubpartitionColumn;
begin
  try
    if FPartitionColumns.Count > 0 then
    begin
      for i := FPartitionColumns.Count - 1 downto 0 do
      begin
        FPartitionColumn := FPartitionColumns.Items[i];
        Dispose(FPartitionColumn);
      end;
    end;
  finally
    FPartitionColumns.Free;
  end;

  try
    if FSubpartitionColumns.Count > 0 then
    begin
      for i := FSubpartitionColumns.Count - 1 downto 0 do
      begin
        FSubpartitionColumn := FSubpartitionColumns.Items[i];
        Dispose(FSubpartitionColumn);
      end;
    end;
  finally
    FSubpartitionColumns.Free;
  end;

  inherited;
end;

procedure TIndexPartition.PartitionColumnAdd(Column: TPartitionColumn);
begin
  FPartitionColumns.Add(Column);
end;

procedure TIndexPartition.PartitionColumnDelete(Index: Integer);
begin
  TObject(FPartitionColumns.Items[Index]).Free;
  FPartitionColumns.Delete(Index);
end;

function TIndexPartition.GetPartitionColumnItem(Index: Integer): TPartitionColumn;
begin
  Result := FPartitionColumns.Items[Index];
end;

procedure TIndexPartition.SetPartitionColumnItem(Index: Integer; Column: TPartitionColumn);
begin
  if Assigned(Column) then
  begin
    FPartitionColumns.Items[Index] := Column;
  end;
end;

function TIndexPartition.GetPartitionColumnCount: Integer;
begin
  Result := FPartitionColumns.Count;
end;

//GetSubpartitionColumn

procedure TIndexPartition.SubpartitionColumnAdd(Column: TSubpartitionColumn);
begin
  FSubpartitionColumns.Add(Column);
end;

procedure TIndexPartition.SubpartitionColumnDelete(Index: Integer);
begin
  TObject(FSubpartitionColumns.Items[Index]).Free;
  FSubpartitionColumns.Delete(Index);
end;

procedure TIndexPartition.SubpartitionColumnDeleteAll;
var
  i : Integer;
begin
  try
    if FSubpartitionColumns.Count > 0 then
    begin
      for i := FSubpartitionColumns.Count - 1 downto 0 do
      begin
        FSubpartitionColumns.Delete(i);
      end;
    end;
  finally     
  end;
end;

function TIndexPartition.GetSubpartitionColumnItem(Index: Integer): TSubpartitionColumn;
begin
  Result := FSubpartitionColumns.Items[Index];
end;

procedure TIndexPartition.SetSubpartitionColumnItem(Index: Integer; Column: TSubpartitionColumn);
begin
  if Assigned(Column) then
    FSubpartitionColumns.Items[Index] := Column;
end;

function TIndexPartition.GetSubpartitionColumnCount: Integer;
begin
  Result := FSubpartitionColumns.Count;
end;



procedure TIndexPartition.SetDDL(ObjectName, ObjectOwner, PartitionName: string;
                                 OraSession: TOraSession);
var
  q,q2: TOraQuery;
  Column: TPartitionColumn;
  SubPartition: TSubpartitionColumn;
  SubpartitionCount: integer;
begin
  if PartitionName = '' then exit;

  q  := TOraQuery.Create(nil);
  q2 := TOraQuery.Create(nil);

  q.Session := OraSession;
  q2.Session := OraSession;

  q.close;
  if FPartitionClause = pcTable then
     q.SQL.Text := GetTablePartitionDetail(ObjectName,ObjectOwner,PartitionName)
  else
     q.SQL.Text := GetTableIndexPartitionDetail(ObjectName,ObjectOwner,PartitionName);
  q.Open;

  FLogging := ltDefault;
  if q.FieldByName('LOGGING').AsString = 'YES' then FLogging := ltLogging;
  if q.FieldByName('LOGGING').AsString = 'NO' then  FLogging := ltNoLogging;
  if q.FieldByName('LOGGING').AsString = 'NO' then  FLogging := ltNoLogging;

  FPartitionPosition := q.FieldByName('PARTITION_POSITION').AsInteger;
  FPartitionName := q.FieldByName('PARTITION_NAME').AsString;
  FHighValue := q.FieldByName('HIGH_VALUE').AsString;
  FPhsicalAttributes.Tablespace  := q.FieldByName('TABLESPACE_NAME').AsString;
  FPhsicalAttributes.PercentFree := q.FieldByName('PCT_FREE').AsString;
  FPhsicalAttributes.InitialTrans:= q.FieldByName('INI_TRANS').AsString;
  FPhsicalAttributes.MaxTrans    := q.FieldByName('MAX_TRANS').AsString;
  FPhsicalAttributes.InitialExtent := q.FieldByName('INITIAL_EXTENT').AsString;
  FPhsicalAttributes.MinExtent     := q.FieldByName('MIN_EXTENT').AsString;
  FPhsicalAttributes.MaxExtent     := q.FieldByName('MAX_EXTENT').AsString;
  FPhsicalAttributes.PctIncrease   := q.FieldByName('PCT_INCREASE').AsString;
  FPhsicalAttributes.BufferPool := bpDefault;
  if q.FieldByName('BUFFER_POOL').AsString = 'KEEP' then FPhsicalAttributes.BufferPool := bpKeep;
  if q.FieldByName('BUFFER_POOL').AsString = 'RECYCLE' then FPhsicalAttributes.BufferPool := bpRecycle;
  FPhsicalAttributes.FreeLists := q.FieldByName('FREELISTS').AsString;
  FPhsicalAttributes.FreeGroups := q.FieldByName('FREELIST_GROUPS').AsString;
  SubpartitionCount := q.FieldByName('SUBPARTITION_COUNT').AsInteger;
  q.close;
  q2.close;
  if PartitionClause = pcTable then
     q2.SQL.Text := GetTablePartitionColumns
  else
     q2.SQL.Text := GetTableIndexPartitionColumns;
  q2.ParamByName('pName').AsString := ObjectName;
  q2.ParamByName('pOwner').AsString := ObjectOwner;
  q2.Open;
  while not q2.Eof do begin
    new(Column);
    Column^.ColumnName := q2.FieldByName('COLUMN_NAME').AsString;
    //DataType: string;
    Column^.UpperBound := FHighValue;
    PartitionColumnAdd(Column);
    q2.Next;
  end;

  if SubpartitionCount > 0 then
  begin
    q2.close;
    if PartitionClause = pcTable then
       q2.SQL.Text := GetTableSubPartition
    else
       q2.SQL.Text := GetTableIndexSubPartition;
    q2.ParamByName('pOwner').AsString := ObjectOwner;
    q2.ParamByName('pName').AsString := ObjectName;
    q2.ParamByName('pPartition').AsString := FPartitionName; //q.FieldByName('PARTITION_NAME').AsString;
    q2.Open;
    while not q2.Eof do
    begin
      new(SubPartition);
      SubPartition^.SubpartitionName := q2.FieldByName('SUBPARTITION_NAME').AsString;
      SubPartition^.Tablespace := q2.FieldByName('TABLESPACE_NAME').AsString;
      SubpartitionColumnAdd(SubPartition);
      q2.Next;
    end;
  end;
  q.close;
  q2.close;
end;

function TIndexPartition.GetDDL: string;
begin
   result := '';
end; //GetDDL


{********************** TIndexPartitionList ***********************************}

constructor TIndexPartitionList.Create;
begin
  FInnerList := TList.Create;
  FDSPartitionList := TVirtualTable.Create(nil);
end;

destructor TIndexPartitionList.Destroy;
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
  FDSPartitionList.Free;
  inherited;
end;

procedure TIndexPartitionList.Add(IndexPartition: TIndexPartition);
begin
  FInnerList.Add(IndexPartition);
end;

procedure TIndexPartitionList.DeleteByName(PartitionName: string);
var
  i: integer;
begin
  for i := 0 to FInnerList.Count -1 do
  begin
    if TIndexPartition(FInnerList.Items[i]).PartitionName = PartitionName then
    begin
       //Delete(i);
       TIndexPartition(FInnerList.Items[i]).IsDeleted := true;
       exit;
    end;
  end;
end;

function TIndexPartitionList.FindByPartitionId(PartitionName: string): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to FInnerList.Count -1 do
  begin
    if TIndexPartition(FInnerList.Items[i]).PartitionName = PartitionName then
    begin
       result := i;
       exit;
    end;
  end;
end;


procedure TIndexPartitionList.DeleteAll;
var
  Index: word;
begin
  for index := FInnerList.Count -1 downto 0 do
      Delete(Index);
end;

procedure TIndexPartitionList.Delete(Index: Integer);
begin
  TObject(FInnerList.Items[Index]).Free;
  FinnerList.Delete(Index);
end;

function TIndexPartitionList.GetItem(Index: Integer): TIndexPartition;
begin
  Result := FInnerList.Items[Index];
end;

procedure TIndexPartitionList.SetItem(Index: Integer; IndexPartition: TIndexPartition);
begin
  if Assigned(IndexPartition) then
    FInnerList.Items[Index] := IndexPartition
end;

function TIndexPartitionList.GetCount: Integer;
begin
  Result := FInnerList.Count;
end;

procedure TIndexPartitionList.SetDDL;
var
  q: TOraQuery;
  FIndexPartition: TIndexPartition;
begin
  if FObjectName = '' then exit;

  q  := TOraQuery.Create(nil);
  q.Session := OraSession;
  q.close;
  if FPartitionClause = pcTable then
     q.SQL.Text := GetTablePartitionDetail(FObjectName, FObjectOwner, '')
  else
     q.SQL.Text := GetTableIndexPartitionDetail(FObjectName, FObjectOwner, '');
  q.Open;

  CopyDataSet(q, FDSPartitionList);

  while not q.Eof do
  begin
    FIndexPartition := TIndexPartition.Create;
    FIndexPartition.PartitionPosition := q.FieldByName('PARTITION_POSITION').AsInteger;
    FIndexPartition.PartitionName := q.FieldByName('PARTITION_NAME').AsString;
    FIndexPartition.HighValue := q.FieldByName('HIGH_VALUE').AsString;
    FIndexPartition.PartitionClause := FPartitionClause;
    FIndexPartition.SetDDL(FObjectName, FObjectOwner, FIndexPartition.PartitionName, OraSession);
    Add(FIndexPartition);
    FIndexPartition.NewInstance;
    NewInstance;
    q.Next;
  end;
  q.Close;
  q.SQL.Text := GetTableSubPartitionKeys;
  q.ParamByName('pName').AsString := FObjectName;
  q.ParamByName('pOwner').AsString := FObjectOwner;
  q.Open;
  while not q.Eof do
  begin
    FSubpartitionList := FSubpartitionList + q.FieldByName('COLUMN_NAME').AsString;
    q.Next;
    if not q.Eof then FSubpartitionList := FSubpartitionList +',';
  end;
  q.close;
end;

function TIndexPartitionList.GetDDL: string;
var
  i, j: integer;
  strPartitions: string;
  values: string;
begin
  result := ''; strPartitions := '';
  with TIndexPartition(FInnerList.Items[0]) do
  begin
    //Global
    if self.PartitionClause = pcGlobal then
    begin
       if self.IndexPartitionType = ptRange then
          strPartitions := ln+' GLOBAL PARTITION BY RANGE (';
       if self.IndexPartitionType = ptHash then
          strPartitions := ln+' GLOBAL PARTITION BY HASH (';
         for i := 0 to PartitionColumnCount -1 do
         begin
           strPartitions := strPartitions + PartitionColumnItems[i].ColumnName;
           if i <> PartitionColumnCount-1 then strPartitions := strPartitions +',';
         end;
       strPartitions := strPartitions + ')'+ln;
    end; // PartitionClause = Global

    //pcTable
    if self.PartitionClause = pcTable then
    begin
       if self.IndexPartitionType = ptRange then
       begin
          if self.IndexPartitionRangeType = rpRange then
             strPartitions := ln+' PARTITION BY RANGE ('
          else
             strPartitions := ln+' PARTITION BY LIST ('
       end;
       if self.IndexPartitionType = ptHash then
          strPartitions := ln+' PARTITION BY HASH (';
         for i := 0 to PartitionColumnCount -1 do
         begin
           strPartitions := strPartitions + PartitionColumnItems[i].ColumnName;
           if i <> PartitionColumnCount-1 then strPartitions := strPartitions +',';
         end;
       strPartitions := strPartitions + ')'+ln;
    end; // PartitionClause = Global

    if (IndexPartitionType = ptRange) and (length(FSubpartitionList)>0) and (Subpartitions = '') then
       strPartitions := strPartitions +'SUBPARTITION BY HASH ('+FSubpartitionList+')'+ln;

    if Subpartitions <> '' then
    begin
       strPartitions := strPartitions +'SUBPARTITION BY LIST ('+FSubpartitionList+')'+ln;
       strPartitions := strPartitions +'SUBPARTITION TEMPLATE'+ln
                                      +'('+ln
                                      +Subpartitions+ln
                                      +')'+ln
    end;

     //local
    if PartitionClause = pcLocal then
       strPartitions := ln+'LOCAL '+ln;

    if IndexPartitionType = ptRange then strPartitions := strPartitions+' ('+ln;
    if (IndexPartitionType = ptHash) then
    begin
      if(IndexHashPartitionType = 'User Named') then
        strPartitions := strPartitions+' ('+ln
      else
        strPartitions := strPartitions+' STORE IN  ('+ln;
    end;
  end;

  if IndexPartitionRangeType = rpRange then
     values := ' VALUES LESS THAN '
  else
     values := ' VALUES ';

  if FInnerList.Count > 0 then
  begin
     for i:= 0 to FInnerList.Count - 1 do
     begin
       if TIndexPartition(FInnerList.Items[i]).IsDeleted then Continue;
       if IndexPartitionType = ptRange then
       begin
          strPartitions := strPartitions +'   PARTITION ';
          if PartitionClause = pcLocal then
             strPartitions := strPartitions + TIndexPartition(FInnerList.Items[i]).PartitionName
          else
             strPartitions := strPartitions + TIndexPartition(FInnerList.Items[i]).PartitionName
                                            +values+' ('
                                            +TIndexPartition(FInnerList.Items[i]).HighValue
                                            +')';

          if TIndexPartition(FInnerList.Items[i]).Logging = ltLogging then
            strPartitions := strPartitions +ln+ '   LOGGING';
          if TIndexPartition(FInnerList.Items[i]).Logging = ltNoLogging then
            strPartitions := strPartitions +ln+ '   NOLOGGING';

          strPartitions := strPartitions + GenerateStorage(TIndexPartition(FInnerList.Items[i]).PhsicalAttributes);

          if IndexPartitionRangeType = rpRange then
          begin
            if TIndexPartition(FInnerList.Items[i]).SubpartitionColumnCount > 1 then
            begin
              strPartitions := strPartitions+ln+'    ('+ln;
              for j := 0 to TIndexPartition(FInnerList.Items[i]).SubpartitionColumnCount-1 do
              begin
                strPartitions := strPartitions+'       SUBPARTITION '+TIndexPartition(FInnerList.Items[i]).SubpartitionColumnItems[j].SubpartitionName+'  '
                                                                    +'TABLESPACE '+TIndexPartition(FInnerList.Items[i]).SubpartitionColumnItems[j].Tablespace+'  ';
                if j <> TIndexPartition(FInnerList.Items[i]).SubpartitionColumnCount-1 then strPartitions := strPartitions+','+ln;
              end;
              strPartitions := strPartitions+ln+'    )';
            end;
          end;
       end //Range
       else
       begin
         if IndexHashPartitionType = 'User Named' then
         begin
            strPartitions := strPartitions +'  PARTITION ';
            strPartitions := strPartitions +TIndexPartition(FInnerList.Items[i]).PartitionName;
            if TIndexPartition(FInnerList.Items[i]).PhsicalAttributes.Tablespace <> '' then
               strPartitions := strPartitions +'  TABLESPACE '+TIndexPartition(FInnerList.Items[i]).PhsicalAttributes.Tablespace;
         end else
            strPartitions := strPartitions +'            '+ TIndexPartition(FInnerList.Items[i]).PhsicalAttributes.Tablespace;
       end;

       if i <> FInnerList.Count -1 then
             strPartitions := strPartitions+ ','+ln;

     end;  //IndexPartitionLists.Count-1
  end; //IndexPartitionLists.Count > 0
  strPartitions := strPartitions +ln+ ' )';
  result := strPartitions;      
end;

function TIndexPartitionList.Clone: TIndexPartitionList;
var
  i: integer;
begin
  result := TIndexPartitionList.Create;
  for i := 0 to FInnerList.Count -1 do
    result.Add(FInnerList.Items[i]);
  result.SubpartitionList := FSubpartitionList;
  result.Subpartitions :=  FSubpartitions;
  result.PartitionClause := FPartitionClause;
  result.ObjectName := FObjectName;
  result.ObjectOwner := FObjectOwner;
  result.IndexHashPartitionType := FIndexHashPartitionType;
  result.IndexPartitionType := FIndexPartitionType;
  result.IndexPartitionRangeType := FIndexPartitionRangeType;
  result.OraSession := FOraSession;
end;

end.
