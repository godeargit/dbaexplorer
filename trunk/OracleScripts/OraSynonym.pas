unit OraSynonym;

interface

uses Classes, SysUtils, Ora, OraStorage, DB,DBQuery, Forms, Dialogs, VirtualTable;

type

  Synonym = record
    Owner,
    SynonymName,
    TableOwner,
    TableName,
    DDLink: string;
    isPublic: boolean;
  end;
  TSynonym = ^Synonym;

  TSynonyms = class(TObject)
  private
    FSYNONYM_NAME,
    FSYNONYM_OWNER,
    FTABLE_OWNER,
    FTABLE_NAME,
    FDB_LINK,
    FOBJECT_TYPE: string;
    FOraSession: TOraSession; 
    function GetStatus: string;
  public
    property SYNONYM_NAME: string read FSYNONYM_NAME write FSYNONYM_NAME;
    property SYNONYM_OWNER: string read FSYNONYM_OWNER write FSYNONYM_OWNER;
    property TABLE_OWNER: string read FTABLE_OWNER write FTABLE_OWNER;
    property TABLE_NAME: string read FTABLE_NAME write FTABLE_NAME;
    property DB_LINK: string read FDB_LINK write FDB_LINK;
    property OBJECT_TYPE: string read FOBJECT_TYPE write FOBJECT_TYPE;
    property Status: String read GetStatus;
    property OraSession: TOraSession read FOraSession write FOraSession;
    procedure SetDDL;
    function GetDDL: string;
    function DropSynonym: boolean;
    constructor Create;
    destructor Destroy; override;
  end;


  TSynonymList = class(TObject)
  private
    FSynonymList: TList;
    FOraSession: TOraSession;
    FTableOwner,
    FTableName: string;
    FObjectType: TDBFormType;
    FDSSynonymList: TVirtualTable;
    function GetSynonym(Index: Integer): TSynonym;
    procedure SetSynonym(Index: Integer; Synonym: TSynonym);
    function GetSynonymCount: Integer;
  public
    property SynonymCount: Integer read GetSynonymCount;
    property SynonymItems[Index: Integer]: TSynonym read GetSynonym write SetSynonym;
    property TableOwner: string read FTableOwner write FTableOwner;
    property TableName: string read FTableName write FTableName;
    property ObjectType: TDBFormType read FObjectType write FObjectType;
    property DSSynonymList: TVirtualTable read FDSSynonymList;
    property OraSession: TOraSession read FOraSession write FOraSession;

    procedure SynonymAdd(Synonym: TSynonym);
    procedure SynonymDelete(Index: Integer);
    procedure CopyFrom(SynonymList: TSynonymList);
    procedure SetDDL;
    function FindBySynonyms(SynonymName: string): integer;
    function GetDDL: string;
    function CreateSynonym(SynonymScript: string) : boolean;
    function DropSynonym: boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  function GetSynonyms(OwnerName: string): string;
  function GetOraSynonyms: string;

const
  SynonymTablePrivilege: array[1..11] of string = ('Select','Delete','Insert','Update','Alter','References','Index','OnCommitRefresh','QueryRewrite','Debug','Flashback');

implementation

uses util, frmSchemaBrowser, oraScripts, Languages;

resourcestring
  strSynonymsDrop = 'Synonym %s has been dropped.';
  strSynonymsCreated = 'Synonym has been created.';
  strSynonymDrop = 'Synonym %s has been dropped.';

{*************************** TSynonym ******************************************}

function GetSynonyms(OwnerName: string): string;
begin
  result :=
     'select OWNER, SYNONYM_NAME, TABLE_OWNER, TABLE_NAME, DB_LINK '
    +'  from ALL_SYNONYMS '
    +' WHERE OWNER = '+Str(OwnerName)
    +' order by SYNONYM_NAME';
end;

function GetOraSynonym: string;
begin
  result :=
     'select OWNER, SYNONYM_NAME, TABLE_OWNER, TABLE_NAME, DB_LINK '
    +'  from ALL_SYNONYMS '
    +' WHERE OWNER = :pOwner '
    +'   AND SYNONYM_NAME = :pName ';
end;

constructor TSynonyms.Create;
begin
end;

destructor TSynonyms.Destroy;
begin
  inherited;
end;

procedure TSynonyms.SetDDL;
var
  q: TOraQuery;
begin
  if FSYNONYM_NAME = '' then exit;
  q := TOraQuery.Create(nil);
  q.Session := FOraSession;
  q.SQL.Text := GetOraSynonym;
  q.ParamByName('pOwner').AsString := FSYNONYM_OWNER;
  q.ParamByName('pName').AsString := FSYNONYM_NAME;
  q.Open;
  FTABLE_OWNER := q.FieldByName('Table_OWNER').AsString;
  FTABLE_NAME := q.FieldByName('Table_Name').AsString;
  FDB_LINK := q.FieldByName('DB_LINK').AsString;
  q.Close;

  q.SQL.Text := GetObjectType;
  q.ParamByName('pOName').AsString := FTABLE_NAME;
  q.ParamByName('pOwner').AsString := FTABLE_OWNER;
  q.Open;
  FOBJECT_TYPE := q.FieldByName('OBJECT_TYPE').AsString;
  q.close;
end;

function TSynonyms.GetDDL: string;
begin
  result := 'CREATE OR REPLACE SYNONYM '+FSYNONYM_OWNER+'.'+FSYNONYM_NAME
                                        +' FOR '
                                        +FTABLE_OWNER+'.'+FTABLE_NAME+';';
end;

function TSynonyms.GetStatus: string;
var
  q1: TOraQuery;
begin
  q1 := TOraQuery.Create(nil);
  q1.Session := OraSession;
  q1.SQL.Text := GetObjectStatusSQL;
  q1.ParamByName('pOName').AsString := FSYNONYM_NAME;
  q1.ParamByName('pOType').AsString := 'SYNONYM';
  q1.ParamByName('pOwner').AsString := FSYNONYM_OWNER;
  q1.Open;
  result := FSYNONYM_NAME+' ( Created: '+q1.FieldByName('CREATED').AsString
                            +' Last DDL: '+q1.FieldByName('LAST_DDL_TIME').AsString
                            +' Status: '+q1.FieldByName('STATUS').AsString
                            +' )';

  q1.Close;
end;

function TSynonyms.DropSynonym: boolean;
var
  FSQL: string;
begin
  result := false;
  if FSYNONYM_NAME = '' then exit;
  FSQL := 'drop synonym '+FSYNONYM_OWNER+'.'+FSYNONYM_NAME;
  result := ExecSQL(FSQL,Format(ChangeSentence('strSynonymDrop',strSynonymDrop),[FSYNONYM_NAME]) , FOraSession);
end;


{************************** TSynonymList ***************************************}

function GetOraSynonyms: string;
begin
  result :=
     'select OWNER, SYNONYM_NAME, TABLE_OWNER, TABLE_NAME, DB_LINK '
    +'  from ALL_SYNONYMS '
    +' WHERE TABLE_OWNER = :pOwner '
    +'   AND TABLE_NAME = :pTable ';
end;

constructor TSynonymList.Create;
begin
  FSynonymList := TList.Create;
  FDSSynonymList := TVirtualTable.Create(nil);
end;

destructor TSynonymList.Destroy;
var
  i : Integer;
  FSynonym: TSynonym;
begin
  try
    if FSynonymList.Count > 0 then
    begin
      for i := FSynonymList.Count - 1 downto 0 do
      begin
        FSynonym := FSynonymList.Items[i];
        Dispose(FSynonym);
      end;
    end;
  finally
    FSynonymList.Free;
  end;
  FDSSynonymList.Free;
  inherited;
end;

procedure TSynonymList.SynonymAdd(Synonym: TSynonym);
begin
  FSynonymList.Add(Synonym);
end;

procedure TSynonymList.SynonymDelete(Index: Integer);
var
  FSynonym: TSynonym;
begin
  FSynonym := FSynonymList.Items[Index];
  Dispose(FSynonym);
  FSynonymList.Delete(Index);
end;

function TSynonymList.GetSynonym(Index: Integer): TSynonym;
begin
  Result := FSynonymList.Items[Index];
end;

procedure TSynonymList.SetSynonym(Index: Integer; Synonym: TSynonym);
begin
  if Assigned(Synonym) then
    FSynonymList.Items[Index] := Synonym
end;

function TSynonymList.GetSynonymCount: Integer;
begin
  Result := FSynonymList.Count;
end;

function TSynonymList.FindBySynonyms(SynonymName: string): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to FSynonymList.Count -1 do
  begin
    if (TSynonym(FSynonymList[i]).SynonymName = SynonymName) then
    begin
       result := i;
       exit;
    end;
  end;
end;

procedure TSynonymList.CopyFrom(SynonymList: TSynonymList);
var
  i: integer;
begin
  FOraSession := SynonymList.OraSession;
  FTableName := SynonymList.TableName;
  FTableOwner := SynonymList.TableOwner;
  for i := 0 to SynonymList.SynonymCount -1 do
  begin
    FSynonymList.Add(TSynonym(SynonymList.SynonymItems[i]));
  end;
end;    

procedure TSynonymList.SetDDL;
var
  FSynonym: TSynonym;
  q: TOraQuery;
begin
  if FTableName = '' then exit;
  q := TOraQuery.Create(nil);
  q.Session := FOraSession;
  q.SQL.Text := GetOraSynonyms;
  q.ParamByName('pOwner').AsString := FTableOwner;
  q.ParamByName('pTable').AsString := FTableName;
  q.Open;
  CopyDataSet(q, FDSSynonymList);
  while not q.Eof do
  begin
    new(FSynonym);
    FSynonym^.Owner := q.FieldByName('OWNER').AsString;
    FSynonym^.SynonymName := q.FieldByName('Synonym_NAME').AsString;
    FSynonym^.TableOwner:= q.FieldByName('Table_OWNER').AsString;
    FSynonym^.TableName := q.FieldByName('Table_Name').AsString;
    FSynonym^.DDLink := q.FieldByName('DB_LINK').AsString;
    SynonymAdd(FSynonym);
    q.Next;
  end;
  q.Close;
end;

function TSynonymList.GetDDL: string;
var
  strHeader: string;
  i: integer;
begin
  with self do
  begin
    for i := 0 to GetSynonymCount -1 do
    begin
      strHeader := strHeader + 'CREATE ';
      if SynonymItems[i].isPublic then
         strHeader := strHeader + 'PUBLIC ';
      strHeader := strHeader + 'SYNONYM '+SynonymItems[i].Owner+'.'
                                         +SynonymItems[i].SynonymName
                                         +' FOR '
                                         +SynonymItems[i].TableOwner+'.'
                                         +SynonymItems[i].TableName;
      if SynonymItems[i].DDLink <> '' then
         strHeader := strHeader + ' @'+SynonymItems[i].DDLink;
      strHeader := strHeader + ';'+ln;
    end;
  end; //with self
  result := strHeader;
end;

function TSynonymList.CreateSynonym(SynonymScript: string) : boolean;
begin
  result := false;
  if FTableName = '' then exit;
  result := ExecSQL(SynonymScript, ChangeSentence('strSynonymsCreated', strSynonymsCreated), FOraSession);
end;

function TSynonymList.DropSynonym: boolean;
var
  FSQL: string;
begin
  result := false;
  if FSynonymList.Count < 0 then exit;
  FSQL := 'drop synonym '+TSynonym(FSynonymList[0]).Owner+'.'+TSynonym(FSynonymList[0]).SynonymName;
  result := ExecSQL(FSQL, Format(ChangeSentence('strSynonymsDrop',strSynonymsDrop),[TSynonym(FSynonymList[0]).SynonymName]), FOraSession);

end;


end.
