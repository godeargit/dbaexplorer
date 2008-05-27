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
unit frmSchemaBrowserList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
    //
  frmBaseForm, cxPC, cxControls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, StdCtrls,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ComCtrls, ToolWin,
  cxContainer, cxLabel, ExtCtrls, MemDS, DBAccess, Ora, OraStorage;

type
  TSchemaBrowserListFrm = class(TBaseform)
    dsList: TDataSource;
    Panel1: TPanel;
    lblDescription: TLabel;
    GridLists: TcxGrid;
    GridListsDB: TcxGridDBTableView;
    GridListsLevel1: TcxGridLevel;
    qList: TOraQuery;
    imgObject: TImage;
    procedure GridListsDBCanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FObjectName,
    FObjectOwner : string;
    FOldObjectType: TDBFormType;
    procedure GetObjectList;
  public
    { Public declarations }
    procedure Init(ObjName, OwnerName: string); override;
  end;

var
  SchemaBrowserListFrm: TSchemaBrowserListFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, OraScripts, DBQuery, util,
     OraTable,        frmTableProperties,    frmTableDetail,
     OraIndex,        frmIndexProperties,
     OraTriger,       frmTriggerProperties,
     OraView,         frmViewProperties,     frmViewDetail,
     OraSequence,     frmSequenceProperties,
     OraProcSource,   frmProcedureProperties,
     OraSynonym,      frmSynonymProperties,
     OraDBLink,       frmDatabaseLinkProperties, GenelDM,
     OraUser,         frmUserProperties,
     OraSysPrivs,
     OraRole,
     OraDirectory,
     OraRollbackSegment,
     OraTablespace,
     VisualOptions;


procedure TSchemaBrowserListFrm.Init(ObjName, OwnerName: string);
begin
  inherited Show;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  top := 0;
  left := 0;

  FObjectName := ObjName;
  FObjectOwner := OwnerName;
  lblDescription.Caption := FObjectName;
  dmGenel.ilSchemaBrowser.GetBitmap(Integer(ObjectType), imgObject.Picture.Bitmap);
  GetObjectList;
end;

procedure TSchemaBrowserListFrm.GetObjectList;
var
  str: string;
  i: integer;
begin
//  if FOldObjectType <> ObjectType then
  begin
    FOldObjectType := ObjectType;

    if ObjectType = dbTable then
      str := GetTables(FObjectOwner);

    if ObjectType = dbView then
      str := GetViews(FObjectOwner);

    if ObjectType = dbIndexes then
      str := GetIndexes(FObjectOwner);

    if ObjectType = dbTriggers then
      str := GetTriggers(FObjectOwner);

    if ObjectType = dbSequences then
      str := GetSequences(FObjectOwner);

    if ObjectType = dbProcedures then
      str := GetProcSources('PROCEDURE', FObjectOwner);

    if ObjectType = dbFunctions then
      str := GetProcSources('FUNCTION', FObjectOwner);

    if ObjectType = dbPackages then
      str := GetProcSources('PACKAGE', FObjectOwner);

    if ObjectType = dbTypes then
      str := GetProcSources('TYPE', FObjectOwner);

    if ObjectType = dbSynonyms then
      str := GetSynonyms(FObjectOwner);

    if ObjectType = dbPublicSynonyms then
      str := GetSynonyms('PUBLIC');

    if ObjectType = dbDatabaseLinks then
      str := GetDBLinks(FObjectOwner);

    if ObjectType = dbUsers then
      str := GetUsers();

    if ObjectType = dbSysPrivs then
      str := GetSysPrivs();

    if ObjectType = dbRoles then
      str := GetRoles();

    if ObjectType = dbDirectories then
      str := GetDBDirectories();

    if ObjectType = dbRollbackSegments then
      str := GetRollbackSegments();

    if ObjectType = dbTablespaces then
      str := GetTablespaces();

    qList.close;
    qList.Session := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;
    qList.SQL.Text := str;
    qList.Open;

    GridListsDB.BeginUpdate;
    GridListsDB.ClearItems;
    GridListsDB.DataController.CreateAllItems();

    for i := 0 to GridListsDB.ColumnCount -1 do
      GridListsDB.Columns[i].Caption := FormatColumnName(GridListsDB.Columns[i].Caption);
    //GridListsDB.Columns[0].Summary.FooterFormat 
    GridListsDB.Columns[0].Summary.FooterKind := skCount;
    GridListsDB.EndUpdate;
   // GridListsDB.ApplyBestFit();
  end;
end;

procedure TSchemaBrowserListFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qList.close;
//  Free;
end;

procedure TSchemaBrowserListFrm.GridListsDBCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  //TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).ObjectName := ds.DataSet.FieldByName('OBJECT_NAME').AsString;
end;





end.
