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
unit frmSynonymProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, cxMemo, cxRichEdit, cxLabel, cxContainer, cxEdit,
  cxTextEdit, jpeg, cxPC, cxControls, StdCtrls, ExtCtrls, GenelDM, OraSynonym,
  VirtualTable, frmBaseform;

type
  TSynonymPropertiesFrm = class(TBaseform)
    Panel1: TPanel;
    imgToolBar: TImage;
    lblDescription: TLabel;
    pcSequenceProperties: TcxPageControl;
    tsSequenceDetails: TcxTabSheet;
    dxBarDockControl1: TdxBarDockControl;
    edtOwner: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtObjectOwner: TcxTextEdit;
    cxLabel3: TcxLabel;
    edtObjectName: TcxTextEdit;
    cxLabel4: TcxLabel;
    edtDBLink: TcxTextEdit;
    cxLabel8: TcxLabel;
    edtName: TcxTextEdit;
    tsSequenceScripts: TcxTabSheet;
    redtDDL: TcxRichEdit;
    dxBarManager1: TdxBarManager;
    bbtnCreateSynonym: TdxBarButton;
    bbtnDropSynonym: TdxBarButton;
    bbtnRefreshSynonym: TdxBarButton;
    cxLabel5: TcxLabel;
    edtObjectType: TcxTextEdit;
    procedure bbtnCreateSynonymClick(Sender: TObject);
    procedure bbtnDropSynonymClick(Sender: TObject);
    procedure bbtnRefreshSynonymClick(Sender: TObject);
  private
    { Private declarations }
    FSynonymName, FOwner: string;
    Synonyms: TSynonyms;
    procedure GetSynonym;
    procedure GetSynonymDetail;
  public
    { Public declarations }
    procedure Init(ObjName, OwnerName: string); override;
  end;

var
  SynonymPropertiesFrm: TSynonymPropertiesFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, Util, OraStorage, frmSchemaPublicEvent, frmSynonyms,
     VisualOptions;

procedure TSynonymPropertiesFrm.Init(ObjName, OwnerName: string);
begin
  inherited Show;
  top := 0;
  left := 0;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FSynonymName := ObjName;
  if ObjectType = dbPublicSynonyms then
     FOwner := 'PUBLIC'
  else
     FOwner := OwnerName;
  GetSynonym;
end;

procedure TSynonymPropertiesFrm.GetSynonym;
begin
  if Synonyms <> nil then
     FreeAndNil(Synonyms);

  Synonyms := TSynonyms.Create;
  Synonyms.OraSession := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;
  Synonyms.SYNONYM_NAME := FSynonymName;
  Synonyms.SYNONYM_OWNER := FOwner;
  Synonyms.SetDDL;
  lblDescription.Caption := Synonyms.Status;

  GetSynonymDetail;
  
  redtDDL.Text := Synonyms.GetDDL;
  CodeColors(self, 'Default', redtDDL, false);
end;

procedure TSynonymPropertiesFrm.GetSynonymDetail;
begin
  edtOwner.Text := Synonyms.SYNONYM_OWNER;
  edtName.Text := Synonyms.SYNONYM_NAME;
  edtObjectOwner.Text := Synonyms.TABLE_OWNER;
  edtObjectName.Text := Synonyms.TABLE_NAME;
  edtObjectType.Text := Synonyms.OBJECT_TYPE;
  edtDBLink.Text := Synonyms.DB_LINK;
end;

procedure TSynonymPropertiesFrm.bbtnCreateSynonymClick(Sender: TObject);
var
  FSynonymList : TSynonymList;
begin
  FSynonymList := TSynonymList.Create;
  FSynonymList.OraSession := Synonyms.OraSession;
  FSynonymList.TableOwner := FOwner;
  if SynonymsFrm.Init(FSynonymList) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbSynonyms);
end;

procedure TSynonymPropertiesFrm.bbtnDropSynonymClick(Sender: TObject);
begin
  if Synonyms.SYNONYM_NAME= '' then exit;
  if Synonyms = nil then exit;
  if SchemaPublicEventFrm.Init(Synonyms, oeDrop) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbSynonyms);
end;

procedure TSynonymPropertiesFrm.bbtnRefreshSynonymClick(Sender: TObject);
begin
  GetSynonym;
end;

end.
