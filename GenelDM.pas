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
unit GenelDM;

interface

uses
  SysUtils, Classes, Jpeg, cxGraphics, ImgList, Controls, DB,
  DBAccess, Ora, OraScripts, VirtualTable, Global, Forms, MemDS;

type
  TdmGenel = class(TDataModule)
    imList: TImageList;
    qTablespace: TOraQuery;
    qTablespaceTABLESPACE_NAME: TStringField;
    dsTablespace: TDataSource;
    imBarIcons: TImageList;
    ilHotImages: TImageList;
    ilDockIcons: TImageList;
    ilDisabledImages: TImageList;
    qSchema: TOraQuery;
    qSchemaUSERNAME: TStringField;
    qSchemaUSER_ID: TFloatField;
    qSchemaCREATED: TDateTimeField;
    dsSchema: TDataSource;
    tSQLRecall: TVirtualTable;
    tSQLRecallHISTORY_ID: TIntegerField;
    tSQLRecallCONNECTION: TStringField;
    tSQLRecallLAST_EXEC: TDateTimeField;
    tSQLRecallSQL: TMemoField;
    dsSQLRecall: TDataSource;
    ilSchemaBrowser: TImageList;
    ilMain: TImageList;
    ilVisualOptions: TImageList;
    ilToolBar: TImageList;
    ilDBA: TImageList;
    ilSQLEditor: TImageList;
    ilDiff: TImageList;
    ilEnviromentOptions: TImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ReLoad(OraSession: TOraSession);
    procedure AddHistory(SQL, Connection: string);
    procedure FilterHistory(Filter: string);
    procedure SaveHistory(FileName: string);
    procedure LoadHistory(FileName: string);
    procedure ChangeLanguage(AOwner: TComponent);

  end;

var
  dmGenel: TdmGenel;

implementation

{$R *.dfm}
uses OraUser, Languages, IniFiles;

procedure TdmGenel.DataModuleCreate(Sender: TObject);
begin
  AppPath := ExtractFilePath(Application.ExeName);
end;

procedure TdmGenel.ReLoad(OraSession: TOraSession);
begin
  qTablespace.Session := OraSession;
  qTablespace.Close;
  qTablespace.SQL.Text := GetTablespaces();
  qTablespace.Open;

  qSchema.Session := OraSession;
  qSchema.Close;
  qSchema.SQL.Text := GetUsers();
  qSchema.Open;

  tSQLRecall.Open;
  if FileExists(AppPath+'\SQLRecall.txt') then
     tSQLRecall.LoadFromFile(AppPath+'\SQLRecall.txt');
  tSQLRecall.Last;   
end;


procedure TdmGenel.AddHistory(SQL, Connection: string);
begin
  tSQLRecall.Append;
  tSQLRecall.FieldByName('HISTORY_ID').AsInteger := 1;
  tSQLRecall.FieldByName('CONNECTION').AsString := Connection;
  tSQLRecall.FieldByName('LAST_EXEC').AsDateTime := NOW;
  tSQLRecall.FieldByName('SQL').AsString := SQL;
  tSQLRecall.Post;
end;

procedure TdmGenel.FilterHistory(Filter: string);
begin
  if Filter <> '' then
  begin
    tSQLRecall.Filtered := false;
    tSQLRecall.Filter := Filter;
    tSQLRecall.Filtered := True;
  end else tSQLRecall.Filtered := False;
end;

procedure TdmGenel.SaveHistory(FileName: string);
begin
  if FileName = '' then FileName := AppPath+'\SQLRecall.txt';
  tSQLRecall.SaveToFile(FileName);
end;

procedure TdmGenel.LoadHistory(FileName: string);
begin
  if FileName <> '' then
  begin
    tSQLRecall.Clear;
    tSQLRecall.close;
    tSQLRecall.Open;
    tSQLRecall.LoadFromFile(FileName);
    tSQLRecall.Last;
  end;
end;

procedure TdmGenel.ChangeLanguage(AOwner: TComponent);
var
  lng: TMultiLanguages;
  DefaultLanguage: string;
  Lnglist: TStrings;
begin
  Lnglist := TStringList.Create;

  with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  try
    DefaultLanguage := ReadString('Language Options','DefaultLanguage', 'English');
    ReadSectionValues('Language Files', Lnglist);
  finally
    free;
  end;
  
  lng := TMultiLanguages.Create(AOwner);
  try
    lng.ActiveLanguage := DefaultLanguage;
    lng.Languages := LngList;
    lng.Translate;
  finally
    lng.Free;
  end;
end;



end.
