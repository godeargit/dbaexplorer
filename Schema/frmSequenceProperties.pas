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
unit frmSequenceProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmBaseForm, OraBarConn, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxMemo,
  cxRichEdit, cxSplitter, dxStatusBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxLabel, cxContainer, cxTextEdit, dxBar, jpeg,
  cxPC, StdCtrls, ExtCtrls, ora, MemDS, DBAccess, GenelDM, OraSequence,
  VirtualTable;

type                       
  TSequencePropertiesFrm = class(TBaseform)
    Panel1: TPanel;
    imgToolBar: TImage;
    lblDescription: TLabel;
    pcSequenceProperties: TcxPageControl;
    tsSequenceDetails: TcxTabSheet;
    dxBarDockControl1: TdxBarDockControl;
    edtIncrementBy: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtLastValue: TcxTextEdit;
    cxLabel3: TcxLabel;
    edtMinValue: TcxTextEdit;
    cxLabel4: TcxLabel;
    edtMaxValue: TcxTextEdit;
    cxLabel5: TcxLabel;
    edtCacheSize: TcxTextEdit;
    tsSequenceGrants: TcxTabSheet;
    dxBarDockControl4: TdxBarDockControl;
    GridGrants: TcxGrid;
    GridGrantsDBTableView1: TcxGridDBTableView;
    GridGrantsDBTableView1Column1: TcxGridDBColumn;
    GridGrantsDBTableView1Column2: TcxGridDBColumn;
    GridGrantsDBTableView1Column3: TcxGridDBColumn;
    GridGrantsDBTableView1Column4: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    tsSequenceSynonyms: TcxTabSheet;
    dxBarDockControl6: TdxBarDockControl;
    GridSynonyms: TcxGrid;
    GridSynonymsDBTableView1: TcxGridDBTableView;
    GridSynonymsDBTableView1Column1: TcxGridDBColumn;
    GridSynonymsDBTableView1Column2: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    tsSequenceUsedBy: TcxTabSheet;
    GridUsed: TcxGrid;
    GridUsedDBTableView1: TcxGridDBTableView;
    GridUsedDBTableView1Column1: TcxGridDBColumn;
    GridUsedDBTableView1Column2: TcxGridDBColumn;
    GridUsedDBTableView1Column3: TcxGridDBColumn;
    GridUsedDBTableView1Column4: TcxGridDBColumn;
    GridUsedDBTableView1Column5: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    tsSequenceScripts: TcxTabSheet;
    redtDDL: TcxRichEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    edtCycleFlag: TcxTextEdit;
    edtOrderFlag: TcxTextEdit;
    cxLabel8: TcxLabel;
    edtName: TcxTextEdit;
    dxBarManager1: TdxBarManager;
    bbtnCreateSequence: TdxBarButton;
    bbtnDropSequence: TdxBarButton;
    bbtnAlterSequence: TdxBarButton;
    bbtnRefreshSequence: TdxBarButton;
    dsGrants: TDataSource;
    bbtnGrantPrivileges: TdxBarButton;
    bbtnRefreshGrant: TdxBarButton;
    dsSynonyms: TDataSource;
    bbtnCreateSynonym: TdxBarButton;
    bbtnDropSynonym: TdxBarButton;
    bbtnRefreshSynonym: TdxBarButton;
    dsUsed: TDataSource;
    vtSynonyms: TVirtualTable;
    vtGrants: TVirtualTable;
    vtUsedBy: TVirtualTable;
    procedure bbtnGrantPrivilegesClick(Sender: TObject);
    procedure bbtnRefreshGrantClick(Sender: TObject);
    procedure bbtnCreateSynonymClick(Sender: TObject);
    procedure bbtnDropSynonymClick(Sender: TObject);
    procedure bbtnRefreshSynonymClick(Sender: TObject);
    procedure bbtnCreateSequenceClick(Sender: TObject);
    procedure bbtnAlterSequenceClick(Sender: TObject);
    procedure bbtnDropSequenceClick(Sender: TObject);
    procedure bbtnRefreshSequenceClick(Sender: TObject);
    procedure pcSequencePropertiesPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
  private
    { Private declarations }
    FSequenceName, FOwner: string;
    Sequence: TSequence;
    procedure GetSequence;
    procedure GetSequenceDetail;
    procedure GetUsed;

  public
    { Public declarations }
    procedure Init(ObjName, OwnerName: string); override;
  end;

var
  SequencePropertiesFrm: TSequencePropertiesFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, Util, OraStorage, OraGrants, frmGrants, OraSynonym,
     frmSynonyms, frmSchemaPublicEvent, frmSequenceDetail, VisualOptions;

procedure TSequencePropertiesFrm.Init(ObjName, OwnerName: string);
var
  a: boolean;
begin
  inherited Show;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  top := 0;
  left := 0;
  FSequenceName := ObjName;
  FOwner := OwnerName;
  GetSequence;
  pcSequencePropertiesPageChanging(self, pcSequenceProperties.ActivePage ,a);
end;

procedure TSequencePropertiesFrm.GetSequence;
begin
  if Sequence <> nil then
     FreeAndNil(Sequence);

  Sequence := TSequence.Create;
  Sequence.OraSession := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;
  Sequence.SEQUENCE_NAME := FSequenceName;
  Sequence.OWNER := FOwner;
  Sequence.SetDDL;

  lblDescription.Caption := Sequence.Status;

  redtDDL.Text := Sequence.GetDDL;
  CodeColors(self, 'Default', redtDDL, false);

  GetSequenceDetail;

  vtSynonyms.close;
  vtSynonyms.Assign(Sequence.SynonymList.DSSynonymList);
  vtSynonyms.Open;

  vtGrants.close;
  vtGrants.Assign(Sequence.GrantList.DSGrantList);
  vtGrants.Open;    
end;

procedure TSequencePropertiesFrm.pcSequencePropertiesPageChanging(
  Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  inherited;
  if NewPage = tsSequenceUsedBy then GetUsed;
end;

procedure TSequencePropertiesFrm.GetSequenceDetail;
begin
  edtName.Text := Sequence.SEQUENCE_NAME;
  edtIncrementBy.Text := Sequence.INCREMENT_BY;
  edtLastValue.Text := Sequence.LAST_NUMBER;
  edtMinValue.Text := Sequence.MIN_VALUE;
  edtMaxValue.Text := Sequence.MAX_VALUE;
  edtCacheSize.Text := Sequence.CACHE_SIZE;
  edtCycleFlag.Text :=  BoolToStr(Sequence.CYCLE_FLAG, 'YN');
  edtOrderFlag.Text :=  BoolToStr(Sequence.ORDER_FLAG, 'YN');
end;

procedure TSequencePropertiesFrm.bbtnRefreshSequenceClick(Sender: TObject);
begin
  inherited;
  GetSequence;
end;

procedure TSequencePropertiesFrm.bbtnCreateSequenceClick(Sender: TObject);
var
  s: TSequence;
begin
  inherited;
  s := TSequence.Create;
  s.OWNER := Sequence.OWNER;
  s.SEQUENCE_NAME := '';
  s.OraSession := Sequence.OraSession;
  if SequenceDetailFrm.Init(s) then
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbSequences);
end;

procedure TSequencePropertiesFrm.bbtnAlterSequenceClick(Sender: TObject);
begin
  inherited;
  if Sequence = nil then exit;
  if Sequence.SEQUENCE_NAME = '' then exit;
  if SequenceDetailFrm.Init(Sequence) then
     GetSequence;
end;

procedure TSequencePropertiesFrm.bbtnDropSequenceClick(Sender: TObject);
begin
  inherited;
  if Sequence.SEQUENCE_NAME = '' then exit;
  if Sequence = nil then exit;
  if SchemaPublicEventFrm.Init(Sequence, oeDrop) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbSequences);
end;

{*******************************************************************************}
{                            G R A N T S                                        }
{*******************************************************************************}

procedure TSequencePropertiesFrm.bbtnGrantPrivilegesClick(Sender: TObject);
begin
  inherited;
  if GrantsFrm.Init(Sequence.GrantList) then
     GetSequence;
end;

procedure TSequencePropertiesFrm.bbtnRefreshGrantClick(Sender: TObject);
begin
  inherited;
  Sequence.GrantList.SetDDL;
  vtGrants.close;
  vtGrants.Assign(Sequence.GrantList.DSGrantList);
  vtGrants.Open;
end;

{*******************************************************************************}
{                              S Y N O N Y M S                                  }
{*******************************************************************************}

procedure TSequencePropertiesFrm.bbtnCreateSynonymClick(Sender: TObject);
begin
  inherited;
  if SynonymsFrm.Init(Sequence.SynonymList) then
     GetSequence;
end;

procedure TSequencePropertiesFrm.bbtnDropSynonymClick(Sender: TObject);
var
  SynonymList: TSynonymList;
  FSynonym: TSynonym;
begin
  inherited;
  if not vtSynonyms.Active then exit;
  new(FSynonym);
  FSynonym^.Owner := Sequence.OWNER;
  FSynonym^.SynonymName := vtSynonyms.FieldByName('SYNONYM_NAME').AsString;
  FSynonym^.TableOwner := vtSynonyms.FieldByName('TABLE_OWNER').AsString;
  FSynonym^.TableName := vtSynonyms.FieldByName('TABLE_NAME').AsString;

  SynonymList := TSynonymList.Create;
  SynonymList.OraSession := Sequence.OraSession;
  SynonymList.TableOwner := Sequence.OWNER;
  SynonymList.TableName := Sequence.SEQUENCE_NAME;
  SynonymList.SynonymAdd(FSynonym);

  if SchemaPublicEventFrm.Init(SynonymList, oeDrop) then
     GetSequence;
end;

procedure TSequencePropertiesFrm.bbtnRefreshSynonymClick(Sender: TObject);
begin
  inherited;
  Sequence.SynonymList.SetDDL;
  vtSynonyms.close;
  vtSynonyms.Assign(Sequence.SynonymList.DSSynonymList);
  vtSynonyms.Open;
end;     

{*******************************************************************************}
{                              U S E D                                          }
{*******************************************************************************}

procedure TSequencePropertiesFrm.GetUsed;
begin
  vtUsedBy.close;
  vtUsedBy.Assign(Sequence.DSUsedByList);
  vtUsedBy.Open;
end;



end.
