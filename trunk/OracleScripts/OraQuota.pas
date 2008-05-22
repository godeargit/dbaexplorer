unit OraQuota;

interface

uses Classes, SysUtils, Ora, OraStorage, DB,DBQuery, Forms, Dialogs, VirtualTable;

type

  Quota = record
    USERNAME,
    TABLESPACE_NAME: string;
    UNLIMITID: boolean;
    UNITS: string;
    AMOUNT: Integer;
  end;
  TQuota = ^Quota;

  TQuotaList = class(TObject)
  private
    FQuotaList: TList;
    FOraSession: TOraSession;
    FDSQuotaList: TVirtualTable;
    FUSER: String;
    function GetQuota(Index: Integer): TQuota;
    procedure SetQuota(Index: Integer; Quota: TQuota);
    function GetQuotaCount: Integer;
  public
    procedure QuotaAdd(Quota: TQuota);
    procedure QuotaDelete(Index: Integer);
    property  QuotaCount: Integer read GetQuotaCount;
    property  QuotaItems[Index: Integer]: TQuota read GetQuota write SetQuota;
    procedure CopyFrom(QuotaList: TQuotaList);
    property USER: String read FUSER write FUSER;
    property DSQuotaList: TVirtualTable read FDSQuotaList;
    property OraSession: TOraSession read FOraSession write FOraSession;
    constructor Create;
    destructor Destroy; override;
    procedure SetDDL;
    function GetDDL: string;
    function Quota(QuotaScript: string) : boolean;
  end;

  function GetQuotas: string;

implementation

uses util, frmSchemaBrowser;

{********************** TQuota ***********************************}

function GetQuotas: string;
begin
  result :=
      'select username, T.tablespace_name, '
     +'  decode(mod(max_bytes,1048576), -1, ''YES'', ''NO'') UNL, '
     +'  decode(mod(max_bytes,1048576), 0, max_bytes / 1048576, -1, 0, max_bytes / 1024) amt, '
	   +'  decode(mod(max_bytes,1048576), 0, ''MB'', -1, '''', null, null, ''KB'') unit '
     +'  from dba_ts_quotas q, dba_tablespaces t '
     +' where  q.TABLESPACE_NAME (+) = t.TABLESPACE_NAME '
     +'   AND username (+) = :pName ';
end;

constructor TQuotaList.Create;
begin
  FQuotaList := TList.Create;
  FDSQuotaList := TVirtualTable.Create(nil);
end;

destructor TQuotaList.Destroy;
var
  i : Integer;
  FQuota: TQuota;
begin
  try
    if FQuotaList.Count > 0 then
    begin
      for i := FQuotaList.Count - 1 downto 0 do
      begin
        FQuota := FQuotaList.Items[i];
        Dispose(FQuota);
      end;
    end;
  finally
    FQuotaList.Free;
  end;
  FDSQuotaList.Free;
  inherited;
end;

procedure TQuotaList.QuotaAdd(Quota: TQuota);
begin
  FQuotaList.Add(Quota);
end;

procedure TQuotaList.QuotaDelete(Index: Integer);
begin
  TObject(FQuotaList.Items[Index]).Free;
  FQuotaList.Delete(Index);
end;

function TQuotaList.GetQuota(Index: Integer): TQuota;
begin
  Result := FQuotaList.Items[Index];
end;

procedure TQuotaList.SetQuota(Index: Integer; Quota: TQuota);
begin
  if Assigned(Quota) then
    FQuotaList.Items[Index] := Quota;
end;

function TQuotaList.GetQuotaCount: Integer;
begin
  Result := FQuotaList.Count;
end;

procedure TQuotaList.CopyFrom(QuotaList: TQuotaList);
var
  i: integer;
begin
  FOraSession := QuotaList.OraSession;
  FUSER := QuotaList.USER;

  for i := 0 to QuotaList.QuotaCount -1 do
    FQuotaList.Add(TQuota(QuotaList.QuotaItems[i]));
end;

procedure TQuotaList.SetDDL;
var
  FQuota: TQuota;
  q: TOraQuery;
begin
  q := TOraQuery.Create(nil);
  q.Session := FOraSession;
  q.SQL.Text := GetQuotas;
  q.ParamByName('pName').AsString := FUSER;
  q.Open;
  CopyDataSet(q, FDSQuotaList);
  while not q.Eof do
  begin
    if q.FieldByName('USERNAME').AsString = FUSER then
    begin
      new(FQuota);
      FQuota^.USERNAME := q.FieldByName('USERNAME').AsString;
      FQuota^.TABLESPACE_NAME := q.FieldByName('TABLESPACE_NAME').AsString;
      FQuota^.UNLIMITID := q.FieldByName('UNL').AsString = 'YES';
      FQuota^.UNITS := q.FieldByName('UNIT').AsString;
      FQuota^.AMOUNT := q.FieldByName('AMT').AsInteger;
      QuotaAdd(FQuota);
    end;  
    q.Next;
  end;
  q.close;  
end;

function TQuotaList.GetDDL: string;
var
  i: integer;
  FQuota: TQuota;
begin
  result := '';

  with self do
  begin
    for i := 0 to GetQuotaCount -1 do
    begin
      FQuota := QuotaItems[i];
      if FQuota.UNLIMITID then
         result := result + ln + 'ALTER USER '+FQuota.USERNAME +' ' + 'QUOTA UNLIMITED ON '+ FQuota.TABLESPACE_NAME+ ';';
      if FQuota.AMOUNT > 0 then
         result := result + ln + 'ALTER USER '+FQuota.USERNAME +' ' + 'QUOTA '+IntToStr(FQuota.AMOUNT)+FQuota.UNITS+ ' ON '+ FQuota.TABLESPACE_NAME +';';
    end;
  end; //with self
end;

function TQuotaList.Quota(QuotaScript: string) : boolean;
begin
  result := ExecSQL(QuotaScript, '', FOraSession);
end;


end.
