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
unit frmDatabaseLinkProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GenelDM, OraDBLink, VirtualTable, frmBaseform, dxBar, cxMemo,
  cxRichEdit, cxLabel, cxContainer, cxEdit, cxTextEdit, jpeg, cxPC,
  cxControls, StdCtrls, ExtCtrls;

type
  TDatabaseLinkPropertiesFrm = class(TBaseform)
    Panel1: TPanel;
    imgToolBar: TImage;
    lblDescription: TLabel;
    pcSequenceProperties: TcxPageControl;
    tsSequenceDetails: TcxTabSheet;
    dxBarDockControl1: TdxBarDockControl;
    edtOwner: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtUserName: TcxTextEdit;
    cxLabel3: TcxLabel;
    edtHost: TcxTextEdit;
    cxLabel8: TcxLabel;
    edtDBLink: TcxTextEdit;
    cxLabel5: TcxLabel;
    edtCreated: TcxTextEdit;
    tsSequenceScripts: TcxTabSheet;
    redtDDL: TcxRichEdit;
    dxBarManager1: TdxBarManager;
    bbtnCreateDBLink: TdxBarButton;
    bbtnDropDBLink: TdxBarButton;
    bbtnRefreshDBLink: TdxBarButton;
    bbtnAlterDBLink: TdxBarButton;
    procedure bbtnCreateDBLinkClick(Sender: TObject);
    procedure bbtnAlterDBLinkClick(Sender: TObject);
    procedure bbtnRefreshDBLinkClick(Sender: TObject);
    procedure bbtnDropDBLinkClick(Sender: TObject);
  private
    { Private declarations }
    FDBLinkName, FOwner: string;
    DBLink: TDBLink;
    procedure GetDBLink;
    procedure GetDBLinkDetail;
  public
    { Public declarations }
    procedure Init(ObjName, OwnerName: string); override;
  end;

var
  DatabaseLinkPropertiesFrm: TDatabaseLinkPropertiesFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, Util, OraStorage, frmSchemaPublicEvent,
  frmDatabaseLinkDetail, VisualOptions;

procedure TDatabaseLinkPropertiesFrm.Init(ObjName, OwnerName: string);
begin
  inherited Show;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  top := 0;
  left := 0;
  FDBlinkName := ObjName;
  FOwner := OwnerName;
  GetDBLink;
end;

procedure TDatabaseLinkPropertiesFrm.GetDBLink;
begin
  if DBLink <> nil then
     FreeAndNil(DBLink);

  DBLink := TDBLink.Create;
  DBLink.OraSession := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;
  DBLink.DB_LINK := FDBlinkName;
  DBLink.OWNER := FOwner;
  DBLink.SetDDL;
  lblDescription.Caption := DBLink.Status;

  GetDBLinkDetail;

  redtDDL.Text := DBLink.GetDDL;
  CodeColors(self, 'Default', redtDDL, false);
end;

procedure TDatabaseLinkPropertiesFrm.GetDBLinkDetail;
begin
  edtOwner.Text := DBLink.OWNER;
  edtDBLink.Text := DBLink.DB_LINK;
  edtUserName.Text := DBLink.USER_NAME;
  edtHost.Text := DBLink.HOST;
  edtCreated.Text := DBLink.CREATED;
end;       

procedure TDatabaseLinkPropertiesFrm.bbtnCreateDBLinkClick(
  Sender: TObject);
var
  FDBLink : TDBLink;
begin
  FDBLink := TDBLink.Create;
  FDBLink.OraSession := DBLink.OraSession;
  FDBLink.Mode := InsertMode;
  if DatabaseLinkDetailFrm.Init(FDBLink) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbDatabaseLinks);
end;

procedure TDatabaseLinkPropertiesFrm.bbtnAlterDBLinkClick(Sender: TObject);
begin
  if DBLink = nil then exit;
  if DBLink.DB_LINK = '' then exit;
  DBLink.Mode := UpdateMode;
  if DatabaseLinkDetailFrm.Init(DBLink) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbDatabaseLinks);
end;

procedure TDatabaseLinkPropertiesFrm.bbtnRefreshDBLinkClick(
  Sender: TObject);
begin
  GetDBLink;
end;

procedure TDatabaseLinkPropertiesFrm.bbtnDropDBLinkClick(Sender: TObject);
begin
  if DBLink = nil then exit;
  if DBLink.DB_LINK = '' then exit;
  if SchemaPublicEventFrm.Init(DBLink, oeDrop) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbDatabaseLinks);
end;

end.
