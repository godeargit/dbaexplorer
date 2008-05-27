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
unit frmBaseform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, jpeg, ExtCtrls, OraStorage, Menus,
  VisualOptions;

type

  TBaseform = class(TForm)
  private
    { Private declarations }
    procedure setObjectType(oname: TDBFormType);
    function GetObjectName: string;
  protected
    FObjectType: TDBFormType;
    FObjectName: string;
    FPopMenu: TPopupMenu;
  public
    { Public declarations }
    property ObjectType: TDBFormType read FObjectType write setObjectType;
    property ObjectName: string read GetObjectName;
    property PopMenu: TPopupMenu read FPopMenu write FPopMenu;
    procedure Init(ObjName, OwnerName: string);  dynamic;
  end;

  TBaseformClass = class of TBaseform;

  TDBObjects = class
  private
    FFrameList: TList;
    function GetFrame(AIndex: Integer): TBaseform;
    function GetFramesCount: Integer;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure RegisterFrameClass(AFrameClass: TBaseformClass);
    property FramesCount: Integer read GetFramesCount;
    property Frames[AIndex: Integer]: TBaseform read GetFrame; default;
  end;

var
  Baseform: TBaseform;


implementation

{$R *.dfm}

procedure TBaseform.Init(ObjName, OwnerName: string);
begin
end;

procedure TBaseform.setObjectType(oname: TDBFormType);
begin
  FObjectType := oname;
end;

function TBaseform.GetObjectName: string;
begin
  result := DBFormType[FObjectType];
end;


{******************************************************************************}

constructor TDBObjects.Create;
begin
  inherited Create;
  FFrameList := TList.Create;
end;

destructor TDBObjects.Destroy;
var
  I: Integer;
  AFrame: TBaseform;
begin
  for I := 0 to FFrameList.Count - 1 do
  begin
    AFrame := TBaseform(FFrameList[I]);
    AFrame.Close;
    FreeAndNil(AFrame);
  end;
  FreeAndNil(FFrameList);
  inherited Destroy;
end;

function TDBObjects.GetFrame(AIndex: Integer): TBaseform;
begin
  Result := TBaseform(FFrameList[AIndex]);
end;          

function TDBObjects.GetFramesCount: Integer;
begin
  Result := FFrameList.Count;
end;

procedure TDBObjects.RegisterFrameClass(AFrameClass: TBaseformClass);
var
  AFrame: TBaseform;
begin
  AFrame := AFrameClass.Create(nil);
  FFrameList.Add(AFrame);
end;

end.
