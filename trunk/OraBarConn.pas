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
unit OraBarConn;

interface

uses Ora, dxBar, Classes, Graphics, Controls, Forms, OraClasses;

const
  CON_SUCCESS = 0;
  CON_FAILED = 1;

type

  TLoginParams = record
    Server,
    UserName,
    Password,
    ConnectionString,
    HomeName: string;
    ConnectionMode: string;
    OraSession : TOraSession;
  end;
  PLoginParams = ^TLoginParams; 

  TBarConnection = class(TdxBarButton)
  private
    FSession : TOraSession;
    FLastError : String;
    FLoginParams: TLoginParams;
    FCount: Integer;
    function GetIsAlive: Boolean;
    function GetIsConnected: Boolean;
    procedure SetSession(ASession: TOraSession);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    function Connect(AParams : PLoginParams) : Integer;

    property Session: TOraSession read FSession write SetSession;
    property IsConnected : Boolean read GetIsConnected;
    property IsAlive : Boolean read GetIsAlive;
    property LastError : String read FLastError;
    property Count: integer read FCount write FCount;
  end;

implementation

uses SysUtils;


constructor TBarConnection.Create(AOwner: TComponent); 
begin
  inherited Create(AOwner);
  FSession := TOraSession.Create(nil);
  FLastError := '';
end;

destructor TBarConnection.Destroy;
begin
  inherited;
end;

function TBarConnection.Connect(AParams : PLoginParams): Integer;
begin
  FLoginParams := AParams^;

  FLastError := '';

  with FLoginParams do
  begin
    FSession.Server := Server;
    FSession.Username := UserName;
    FSession.Password := Password;
    FSession.ConnectString := ConnectionString;
    FSession.HomeName := HomeName;
    if ConnectionMode = 'Normal' then
       FSession.ConnectMode := cmNormal;
    if ConnectionMode = 'SysDBA' then
       FSession.ConnectMode := cmSysDBA;
    if ConnectionMode = 'SysOper' then
       FSession.ConnectMode := cmSysOper;
  end;
  FSession.LoginPrompt := false;
  try
    FSession.Connect();
    Result := CON_SUCCESS;
  except
    on E : Exception do
      begin
        FLastError := E.Message;
        Result := CON_FAILED;
      end;
  end;
end;

procedure TBarConnection.SetSession(ASession: TOraSession);
begin
  FSession := ASession;
  if FSession.Connected = false then
  begin
    try
    FSession.LoginPrompt := false;
    FSession.Connect();
    except
      on E : Exception do
        begin
          FLastError := E.Message;
        end;
    end;
  end;
end;

function TBarConnection.GetIsAlive: Boolean;
begin
  Result := False;
  if IsConnected then Result := FSession.Connected;
end;

function TBarConnection.GetIsConnected: Boolean;
begin
  Result := FSession.Connected;
end;

end.
