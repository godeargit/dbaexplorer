unit OraSysPrivs;

interface

uses Classes, SysUtils, Ora, OraStorage, DB,DBQuery, Forms, Dialogs, VirtualTable;

type

  Priv = record
    GRANTEE,
    NAME : string;
    PROPERTIES: Integer;
    GRANTED,
    ADMIN_OPTION : boolean;
  end;
  TPriv = ^Priv;

  TPrivList = class(TObject)
  private
    FPrivList: TList;
    FOraSession: TOraSession;
    FDSPrivList: TVirtualTable;
    FGRANTEE: String;
    function GetPriv(Index: Integer): TPriv;
    procedure SetPriv(Index: Integer; Priv: TPriv);
    function GetPrivCount: Integer;
    function GetPrivs: string;
  public
    procedure PrivAdd(Priv: TPriv);
    procedure PrivDelete(Index: Integer);
    property  PrivCount: Integer read GetPrivCount;
    property  PrivItems[Index: Integer]: TPriv read GetPriv write SetPriv;
    procedure CopyFrom(PrivList: TPrivList);
    function FindByPriv(Name: string): integer;
    property GRANTEE: String read FGRANTEE write FGRANTEE;
    property DSPrivList: TVirtualTable read FDSPrivList;
    property OraSession: TOraSession read FOraSession write FOraSession;
    constructor Create;
    destructor Destroy; override;
    procedure SetDDL;
    function GetDDL: string;
    function GetAlterDDL(APrivList: TPrivList): string;
    function Priv(PrivScript: string) : boolean;
  end;

  function GetSysPrivs: string;


implementation

uses util, frmSchemaBrowser;

{********************** TPriv ***********************************}

function GetSysPrivs: string;
begin
  result := 'select * from sys.system_privilege_map ';
end;

constructor TPrivList.Create;
begin
  FPrivList := TList.Create;
  FDSPrivList := TVirtualTable.Create(nil);
end;

destructor TPrivList.Destroy;
var
  i : Integer;
  FPriv: TPriv;
begin
  try
    if FPrivList.Count > 0 then
    begin
      for i := FPrivList.Count - 1 downto 0 do
      begin
        FPriv := FPrivList.Items[i];
        Dispose(FPriv);
      end;
    end;
  finally
    FPrivList.Free;
  end;
  FDSPrivList.Free;
  inherited;
end;

function TPrivList.GetPrivs: string;
begin
  result :=
     ' Select GRANTEE, spm.name, '
    +' decode(dsp.GRANTEE,null,''NO'',''YES'') GRANTED, '
    +' nvl(dsp.ADMIN_OPTION,''NO'') ADMIN_OPTION, '
    +' PROPERTY '
    +' from sys.dba_sys_privs dsp, '
    +' sys.system_privilege_map spm '
    +' where dsp.privilege(+) = spm.name '
    +' and dsp.grantee(+)= :pName '
    +' and spm.name not in (''DEBUG CONNECT ANY'', ''DEBUG CONNECT USER'') '
    +' order by spm.name ';
end;

procedure TPrivList.PrivAdd(Priv: TPriv);
begin
  FPrivList.Add(Priv);
end;

procedure TPrivList.PrivDelete(Index: Integer);
begin
  TObject(FPrivList.Items[Index]).Free;
  FPrivList.Delete(Index);
end;

function TPrivList.GetPriv(Index: Integer): TPriv;
begin
  Result := FPrivList.Items[Index];
end;

procedure TPrivList.SetPriv(Index: Integer; Priv: TPriv);
begin
  if Assigned(Priv) then
    FPrivList.Items[Index] := Priv;
end;

function TPrivList.GetPrivCount: Integer;
begin
  Result := FPrivList.Count;
end;

procedure TPrivList.CopyFrom(PrivList: TPrivList);
var
  i: integer;
begin
  FOraSession := PrivList.OraSession;
  FGRANTEE := PrivList.GRANTEE;

  for i := 0 to PrivList.PrivCount -1 do
    FPrivList.Add(TPriv(PrivList.PrivItems[i]));
end;

function TPrivList.FindByPriv(Name: string): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to FPrivList.Count -1 do
  begin
    if (TPriv(FPrivList[i]).NAME = Name) then
    begin
       result := i;
       exit;
    end;
  end;
end;

procedure TPrivList.SetDDL;
var
  FPriv: TPriv;
  q: TOraQuery;
begin
  q := TOraQuery.Create(nil);
  q.Session := FOraSession;
  q.SQL.Text := GetPrivs;
  q.ParamByName('pName').AsString := FGRANTEE;
  q.Open;
  CopyDataSet(q, FDSPrivList);
  while not q.Eof do
  begin
    if q.FieldByName('GRANTEE').AsString = FGRANTEE then
    begin
      new(FPriv);
      FPriv^.GRANTEE := q.FieldByName('GRANTEE').AsString;
      FPriv^.PROPERTIES := q.FieldByName('PROPERTY').asInteger;
      FPriv^.NAME := q.FieldByName('NAME').AsString;
      FPriv^.GRANTED  := q.FieldByName('GRANTED').AsString = 'YES';
      FPriv^.ADMIN_OPTION := q.FieldByName('ADMIN_OPTION').AsString = 'YES';
      PrivAdd(FPriv);
    end;
    q.Next;
  end;
  q.close;  
end;

function TPrivList.GetDDL: string;
var
  i: integer;
  FPriv: TPriv;
  s: string;
begin
  s := ''; 
  with self do
  begin
    for i := 0 to GetPrivCount -1 do
    begin
      if FPriv.GRANTEE <> '' then
      begin
        s := '';
        FPriv := PrivItems[i];
        if FPriv.GRANTED then
           s := ln+ 'GRANT '+FPriv.NAME +' TO '+FPriv.GRANTEE;
        if FPriv.ADMIN_OPTION then
           s := s + ' WITH ADMIN OPTION ';
        if s <> '' then
           s := s + ';';
        result := result + s;
      end;  
    end;
  end; //with self
end;

function TPrivList.GetAlterDDL(APrivList: TPrivList): string;
var
  i: integer;
  FPriv: TPriv;
  s: string;
begin
  s := ''; 
  with self do
  begin
    for i := 0 to GetPrivCount -1 do
    begin
      FPriv := PrivItems[i];
      
      if FPriv.GRANTEE <> '' then
      begin
        if APrivList.FindByPriv(FPriv.NAME) >= 0 then
        begin
          if not FPriv.GRANTED then
             result := result + ln+ 'REWORK '+FPriv.NAME +' FROM '+FPriv.GRANTEE +';';
        end else
        begin
          s := '';
          if FPriv.GRANTED then
             s := ln+ 'GRANT '+FPriv.NAME +' TO '+FPriv.GRANTEE;
          if (FPriv.ADMIN_OPTION) and ( s <> '') then
             s := s + ' WITH ADMIN OPTION ';
          if s <> '' then
             s := s + ';';

          result := result + s;
        end;
      end;  
    end;
  end; //with self
end;

function TPrivList.Priv(PrivScript: string) : boolean;
begin
  result := ExecSQL(PrivScript, '', FOraSession);
end;


end.
