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
unit OraConstraint;

interface

uses Classes, SysUtils, Ora, DB, OraStorage,DBQuery, Forms, Dialogs;

type
  TConstraint = class(TObject)
  private
    FConstraintName,
    FOwner: String;
    FConstraintType: TConstraintType;
    FTableName,
    FSearchCondidion,
    FROwner,
    FRConstraintName,
    FStatus,
    FDeleteRule,
    FDeferrable,
    FDeferred,
    FValidated,
    FGenerated,
    FBad,
    FRely: string;
    FLastChange: TDateTime;
    FIndexOwner,
    FIndexName,
    FInvalid,
    FViewRelated: string;
    FUsingIndexAttributes: boolean;
    FExceptionSchema,
    FExceptionTable: string;
    FConstraitColumns: TColumnList;
    FReferencedColumns: TColumnList;
    FPhsicalAttributes : TPhsicalAttributes;
    FOraSession: TOraSession; 
  public
    property ConstraintName: String read FConstraintName write FConstraintName;
    property Owner: String read FOwner write FOwner;
    property ConstraintType: TConstraintType read FConstraintType write FConstraintType;
    property TableName : String read FTableName write FTableName;
    property SearchCondidion : String read FSearchCondidion write FSearchCondidion;
    property ROwner : String read FROwner write FROwner;
    property RConstraintName : String read FRConstraintName write FRConstraintName;
    property Status : String read FStatus write FStatus;
    property DeleteRule : String read FDeleteRule write FDeleteRule;
    property Deferrable : String read FDeferrable write FDeferrable;
    property Deferred : String read FDeferred write FDeferred;
    property Validated : String read FValidated write FValidated;
    property Generated : String read FGenerated write FGenerated;
    property Bad : String read FBad write FBad;
    property Rely: string read FRely write FRely;
    property LastChange: TDateTime read FLastChange write FLastChange;
    property IndexOwner : String read FIndexOwner write FIndexOwner;
    property IndexName : String read FIndexName write FIndexName;
    property Invalid : String read FInvalid write FInvalid;
    property ViewRelated: string read FViewRelated write FViewRelated;
    property UsingIndexAttributes: boolean read FUsingIndexAttributes write FUsingIndexAttributes;
    property ExceptionSchema: string read FExceptionSchema write FExceptionSchema;
    property ExceptionTable: string read FExceptionTable write FExceptionTable;
    property ConstraitColumns: TColumnList read FConstraitColumns write FConstraitColumns;
    property ReferencedColumns: TColumnList read FReferencedColumns write FReferencedColumns;
    property PhsicalAttributes : TPhsicalAttributes read FPhsicalAttributes write FPhsicalAttributes;
    property OraSession: TOraSession read FOraSession write FOraSession;
    constructor Create;
    destructor Destroy; override;
    function GetConstaintDetail: string;
    function GetConstaintColumns: string;
    procedure SetDDL;
    function GetDDL: string;
    function CreateConstraint(ConstraintScript: string) : boolean;
    function DropConstraint: boolean;
    function EnableConstraint: boolean;
    function DisableConstraint: boolean;
    function RenameConstraint(NewConstraintName: string): boolean;
  end;


  TConstraintList = class(TObject)
  private
    FInnerList: TList;
    FOraSession: TOraSession;
    FTableName: string;
    FOwner: string;
    function GetItem(Index: Integer): TConstraint;
    procedure SetItem(Index: Integer; Constraint: TConstraint);
    function GetCount: Integer;
    function GetTableConstraints: string;
  public
    property OraSession: TOraSession read FOraSession write FOraSession;
    property TableName: string read FTableName write FTableName;
    property Owner: string read FOwner write FOwner;
    constructor Create;
    destructor Destroy; override;
    procedure Add(Constraint: TConstraint);
    procedure Delete(Index: Integer);
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TConstraint read GetItem write SetItem;
    procedure SetDDL;
    function GetDDL: string;
  end;

function GetConstaints(ConstraintType: string): string;
  
implementation

uses Util, frmSchemaBrowser, Languages;

resourcestring
  strConstraintRenamed = 'Constraint %s has been renamed.';
  strConstraintDisabled = 'Constraint %s has been disabled.';
  strConstraintEnabled = 'Constraint %s has been enabled.';
  strConstraintDropped = 'Constraint %s has been dropped.';
  strConstraintCreated = 'Constraint %s has been created.';

function GetConstaints(ConstraintType: string): string;
begin
  result :=
    ' Select * from all_constraints '
   +' where table_name = :pTable'
   +'   and CONSTRAINT_TYPE in ( '+ConstraintType+' ) '
   +'   and OWNER = :pOwner '
   +' order by CONSTRAINT_NAME ';
end;

{**************************** TConstraintList **************************************}
constructor TConstraintList.Create;
begin
  FInnerList := TList.Create;
end;

destructor TConstraintList.Destroy;
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

procedure TConstraintList.Add(Constraint: TConstraint);
begin
  FInnerList.Add(Constraint);
end;

procedure TConstraintList.Delete(Index: Integer);
begin
  TObject(FInnerList.Items[Index]).Free;
  FinnerList.Delete(Index);
end;

function TConstraintList.GetItem(Index: Integer): TConstraint;
begin
  Result := FInnerList.Items[Index];
end;

procedure TConstraintList.SetItem(Index: Integer; Constraint: TConstraint);
begin
  if Assigned(Constraint) then
    FInnerList.Items[Index] := Constraint
end;

function TConstraintList.GetCount: Integer;
begin
  Result := FInnerList.Count;
end;

function TConstraintList.GetTableConstraints: string;
begin
  Result :=
     ' Select * from USER_constraints '
    +' WHERE TABLE_NAME = :pTable '
    +'   AND OWNER = :pOwner '
    +'   AND CONSTRAINT_NAME NOT LIKE ''SYS_C%'' ';
end;

procedure TConstraintList.SetDDL;
var
  q1: TOraQuery;
  FConstraint: TConstraint;
begin
  if FTableName = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;

  q1.SQL.Text := GetTableConstraints;
  q1.ParamByName('pTable').AsString := FTableName;
  q1.ParamByName('pOwner').AsString := FOwner;
  q1.Open;
  while Not q1.Eof do
  begin
    FConstraint := TConstraint.Create;
    FConstraint.TableName := FTableName;
    FConstraint.Owner := FOwner;
    FConstraint.OraSession := OraSession;
    FConstraint.ConstraintName := q1.FieldByName('CONSTRAINT_NAME').AsString;
    FConstraint.SetDDL;
    Add(FConstraint);
    FConstraint.NewInstance;
    NewInstance;
    q1.Next;
  end;
  q1.close;
end;

function TConstraintList.GetDDL: string;
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


{**************************** TConstraint **************************************}
constructor TConstraint.Create;
begin
  inherited;
  FConstraitColumns := TColumnList.Create;
  FReferencedColumns := TColumnList.Create;
end;

destructor TConstraint.destroy;
begin
  FConstraitColumns.Free;
  FReferencedColumns.Free;
  inherited;
end;

function TConstraint.GetConstaintDetail: string;
begin
  Result :=
    ' Select * from all_constraints '
   +' where CONSTRAINT_NAME = :pName '
   +'   and OWNER = :pOwner ';
end;

function TConstraint.GetConstaintColumns: string;
begin
  Result :=
    ' Select * from ALL_CONS_COLUMNS '
   +' where constraint_name = :pName '
   +'   and owner = :pOwner '
   +' order by position ';
end;  

procedure TConstraint.SetDDL;
var
  q1: TOraQuery;
  FColumn: TColumn;
  FConstaintColumnList : TColumnList;
  FReferencedColumnList : TColumnList;
begin
  if FConstraintName = '' then exit;

  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;

  q1.SQL.Text := GetConstaintDetail();
  q1.ParamByName('pName').AsString := FConstraintName;
  q1.ParamByName('pOwner').AsString := FOwner;
  q1.Open;

  if q1.FieldByName('CONSTRAINT_TYPE').AsString = 'P' then FConstraintType := ctPrimary;
  if q1.FieldByName('CONSTRAINT_TYPE').AsString = 'U' then FConstraintType := ctUniqe;
  if q1.FieldByName('CONSTRAINT_TYPE').AsString = 'C' then FConstraintType := ctCheck;
  if q1.FieldByName('CONSTRAINT_TYPE').AsString = 'R' then FConstraintType := ctForeignKey;

  FTableName := q1.FieldByName('TABLE_NAME').AsString;
  FSearchCondidion := q1.FieldByName('SEARCH_CONDITION').AsString;
  FROwner := q1.FieldByName('R_OWNER').AsString;
  FRConstraintName := q1.FieldByName('R_CONSTRAINT_NAME').AsString;
  FStatus := q1.FieldByName('STATUS').AsString;
  FDeleteRule := q1.FieldByName('DELETE_RULE').AsString;
  FDeferrable := q1.FieldByName('DEFERRABLE').AsString;
  FDeferred := q1.FieldByName('DEFERRED').AsString;
  if q1.FieldByName('VALIDATED').AsString = 'NOT VALIDATED' then
     FValidated := 'NOVALIDATE'
  else
     FValidated := '';   
  FGenerated := q1.FieldByName('GENERATED').AsString;
  FBad := q1.FieldByName('BAD').AsString;
  FRely := q1.FieldByName('RELY').AsString;
  FLastChange := q1.FieldByName('LAST_CHANGE').AsDateTime;
  FIndexOwner := q1.FieldByName('INDEX_OWNER').AsString;
  FIndexName := q1.FieldByName('INDEX_NAME').AsString;
  FInvalid := q1.FieldByName('INVALID').AsString;
  FViewRelated := q1.FieldByName('VIEW_RELATED').AsString;
  FUsingIndexAttributes := q1.FieldByName('INDEX_NAME').AsString <> '';

  if FConstraintType <> ctCheck then
  begin
    FConstaintColumnList := TColumnList.Create;
    q1.close;
    q1.SQL.Text := GetConstaintColumns();
    q1.ParamByName('pName').AsString := FConstraintName;
    q1.ParamByName('pOwner').AsString := FOwner;
    q1.Open;
    while not q1.Eof do
    begin
        FColumn := TColumn.Create;
        FColumn.ColumnName := q1.FieldByName('COLUMN_NAME').AsString;
        FColumn.DataType := '';

        FConstaintColumnList.Add(FColumn);
        FColumn.NewInstance;
        FConstaintColumnList.NewInstance;
      q1.Next;
    end;
    FConstraitColumns := FConstaintColumnList;
  end;

  if FConstraintType = ctForeignKey  then
  begin
    {q1.Close;
    q1.SQL.Text := GetConstaintDetail(FRConstraintName, FROwner);
    q1.Open;
    FROwner := q1.FieldByName('OWNER').AsString;
    FRConstraintName := q1.FieldByName('TABLE_NAME').AsString;
    }
    FReferencedColumnList := TColumnList.Create;
    q1.close;
    q1.SQL.Text := GetConstaintColumns; //('', FOwner , FRConstraintName);
    q1.ParamByName('pName').AsString := FRConstraintName;
    q1.ParamByName('pOwner').AsString := FOwner;
    q1.Open;
    while not q1.Eof do
    begin
       FROwner := q1.FieldByName('OWNER').AsString;
       FRConstraintName := q1.FieldByName('TABLE_NAME').AsString;

        FColumn := TColumn.Create;
        FColumn.ColumnName := q1.FieldByName('COLUMN_NAME').AsString;
        FColumn.DataType := '';

        FReferencedColumnList.Add(FColumn);
        FColumn.NewInstance;
        FReferencedColumnList.NewInstance;
      q1.Next;
    end;
    FReferencedColumns := FReferencedColumnList;
  end;
  Q1.Close;
end;

function TConstraint.GetDDL: string;
var
  strHeader: string;
  i: integer;
begin
  with self do
  begin
    strHeader := 'ALTER TABLE '+Owner+'.'+TableName+' ADD '+ln ;
    if Generated = 'USER NAME' then strHeader := strHeader +'  CONSTRAINT '+ConstraintName+ln;
    strHeader := strHeader+'   '+DBConstraintType[ConstraintType];

     if ConstraintType = ctCheck then
        strHeader := strHeader +' ('
                               +SearchCondidion
                               +')'+ln;

     if ConstraintType <> ctCheck then
     begin
        if ConstraitColumns.Count > 0 then
        begin
          strHeader := strHeader +' (';
          for i := 0 to ConstraitColumns.Count -1 do
          begin
            strHeader := strHeader + ConstraitColumns.Items[I].ColumnName;
           if i <> ConstraitColumns.Count-1 then strHeader := strHeader +',';
          end;
          strHeader := strHeader +')'+ln;
        end;
     end;

     if ConstraintType = ctForeignKey  then
     begin
        strHeader := strHeader +'   REFERENCES '+ROwner +'.'+ RConstraintName +'(' ;
        if ReferencedColumns.Count > 0 then
        begin
          for i := 0 to ReferencedColumns.Count -1 do
          begin
            strHeader := strHeader + ReferencedColumns.Items[I].ColumnName;
           if i <> ReferencedColumns.Count-1 then strHeader := strHeader +',';
          end;
          strHeader := strHeader +')'+ln;
        end;

          if DeleteRule <> 'NO ACTION' then
             strHeader := strHeader +'   ON DELETE '+DeleteRule+ln;
     end;

    if Deferrable = 'DEFERRABLE' then strHeader := strHeader +'   '+Deferred+ln;

    if UsingIndexAttributes then
    begin
      strHeader := strHeader +'   USING INDEX';
      strHeader := strHeader + GenerateStorage(PhsicalAttributes)+ln
    end;


    if (Status <> 'ENABLE') or (Status <> 'ENABLED') then
       strHeader := strHeader +'   '+ Status+ln;
    strHeader := strHeader +'   '+ Validated+ln;

    if ((Validated = 'VALIDATE') or (Validated = 'VALIDATED')) and (ExceptionTable <> '') then
       strHeader := strHeader +'   EXCEPTIONS INTO '+ExceptionSchema+'.'+ExceptionTable+ln;

    strHeader := strHeader +';'+ln;   
    if Rely = 'RELY' then
       strHeader := strHeader +'   ALTER TABLE '+TableName+' MODIFY CONSTRAINT '+ConstraintName+' RELY;'+ln;

  end; //with PConstraint
  Result :=  strHeader ;
end;

function TConstraint.CreateConstraint(ConstraintScript: string) : boolean;
begin
  result := false;
  if FConstraintName = '' then exit;
  result := ExecSQL(ConstraintScript, Format(ChangeSentence('strConstraintCreated',strConstraintCreated),[FConstraintName]), FOraSession);
end;

function TConstraint.DropConstraint: boolean;
var
  FSQL: string;
begin
  result := false;
  if FConstraintName = '' then exit;
  FSQL := 'alter table '+FOwner+'.'+FTableName+' drop constraint '+FConstraintName;
  result := ExecSQL(FSQL, Format(ChangeSentence('strConstraintDropped',strConstraintDropped),[FConstraintName]), FOraSession);
end;

function TConstraint.EnableConstraint: boolean;
var
  FSQL: string;
begin
  result := false;
  if FConstraintName = '' then exit;
  FSQL := 'alter table '+FOwner+'.'+FTableName+' enable constraint '+FConstraintName;
  result := ExecSQL(FSQL, Format(ChangeSentence('strConstraintEnabled',strConstraintEnabled),[FConstraintName]), FOraSession);
end;

function TConstraint.DisableConstraint: boolean;
var
  FSQL: string;
begin
  result := false;
  if FConstraintName = '' then exit;
  FSQL := 'alter table '+FOwner+'.'+FTableName+' disable constraint '+FConstraintName;
  result := ExecSQL(FSQL, Format(ChangeSentence('strConstraintDisabled',strConstraintDisabled),[FConstraintName]), FOraSession);
end;

function TConstraint.RenameConstraint(NewConstraintName: string): boolean;
var
  FSQL: string;
begin
  result := false;
  if FConstraintName = '' then exit;
  FSQL := 'alter table '+FOwner+'.'+FTableName+' rename constraint '+FConstraintName+' to '+NewConstraintName;
  result := ExecSQL(FSQL, Format(ChangeSentence('strConstraintRenamed',strConstraintRenamed),[FConstraintName]), FOraSession);
end;



end.
