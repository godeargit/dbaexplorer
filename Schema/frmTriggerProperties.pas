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
unit frmTriggerProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmBaseForm, OraBarConn, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxMemo,
  cxRichEdit, cxSplitter, dxStatusBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxLabel, cxContainer, cxTextEdit, dxBar, jpeg,
  cxPC, StdCtrls, ExtCtrls, ora, OraTriger, MemDS, DBAccess, VirtualTable, GenelDM,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxGroupBox, cxRadioGroup, cxCheckBox, ComCtrls,
  cxListView;

type
  TTriggerPropertiesFrm = class(TBaseform)
    Panel1: TPanel;
    imgToolBar: TImage;
    lblDescription: TLabel;
    pcTriggerProperties: TcxPageControl;
    tsTriggerSource: TcxTabSheet;
    dxBarDockControl1: TdxBarDockControl;
    tsTriggerProperties: TcxTabSheet;
    tsViewScripts: TcxTabSheet;
    redtSource: TcxRichEdit;
    cxSplitter1: TcxSplitter;
    redtDDL: TcxRichEdit;
    dxBarManager1: TdxBarManager;
    bbtnCreateTrigger: TdxBarButton;
    bbtnAlterTrigger: TdxBarButton;
    bbtnDropTrigger: TdxBarButton;
    bbtnEnableTrigger: TdxBarButton;
    bbtnDisableTrgger: TdxBarButton;
    bbtnCompileTrigger: TdxBarButton;
    bbtnRefreshTrigger: TdxBarButton;
    gboxFireOnDatabase: TcxGroupBox;
    cbServerError: TcxCheckBox;
    cbLoggon: TcxCheckBox;
    cbStartup: TcxCheckBox;
    cbLoggof: TcxCheckBox;
    cbShotdown: TcxCheckBox;
    cbsuspend: TcxCheckBox;
    gboxFireOnDDL: TcxGroupBox;
    cbAlter: TcxCheckBox;
    cbAnalyze: TcxCheckBox;
    cbAssocStats: TcxCheckBox;
    cbAudit: TcxCheckBox;
    cbComment: TcxCheckBox;
    cbCreate: TcxCheckBox;
    cbDisassocStats: TcxCheckBox;
    cbDrop: TcxCheckBox;
    cbGrant: TcxCheckBox;
    cbNoAudit: TcxCheckBox;
    cbRename: TcxCheckBox;
    cbRevoke: TcxCheckBox;
    cbTruncate: TcxCheckBox;
    cbDDL: TcxCheckBox;
    gbReferencing: TcxGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    lblParent: TLabel;
    edtNewAs: TcxTextEdit;
    edtOldAs: TcxTextEdit;
    edtParent: TcxTextEdit;
    cxGroupBox5: TcxGroupBox;
    rgFireWhen: TcxRadioGroup;
    rgForEach: TcxRadioGroup;
    rgStatus: TcxRadioGroup;
    rgEventType: TcxRadioGroup;
    cgOnEvent: TcxGroupBox;
    cbInsert: TcxCheckBox;
    cbUpdate: TcxCheckBox;
    cbDelete: TcxCheckBox;
    gbObject: TcxGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    lblNestedTable: TLabel;
    lcbNestedTable: TcxTextEdit;
    gbDescription: TcxGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edtTriggerName: TcxTextEdit;
    rgTriggerOn: TcxRadioGroup;
    edtTriggerSchema: TcxTextEdit;
    Label2: TLabel;
    edtSourceName: TcxTextEdit;
    Label4: TLabel;
    edtSourceOwner: TcxTextEdit;
    edtObjectSchema: TcxTextEdit;
    edtObjectName: TcxTextEdit;
    lviewError: TcxListView;
    dsUsed: TDataSource;
    dsUses: TDataSource;
    tsUsedBy: TcxTabSheet;
    tsUses: TcxTabSheet;
    GridUsed: TcxGrid;
    GridUsedDBTableView1: TcxGridDBTableView;
    GridUsedDBTableView1Column1: TcxGridDBColumn;
    GridUsedDBTableView1Column2: TcxGridDBColumn;
    GridUsedDBTableView1Column3: TcxGridDBColumn;
    GridUsedDBTableView1Column4: TcxGridDBColumn;
    GridUsedDBTableView1Column5: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    GridUses: TcxGrid;
    GridUsesDBTableView1: TcxGridDBTableView;
    GridUsesDBTableView1Column1: TcxGridDBColumn;
    GridUsesDBTableView1Column2: TcxGridDBColumn;
    GridUsesDBTableView1Column3: TcxGridDBColumn;
    GridUsesDBTableView1Column4: TcxGridDBColumn;
    GridUsesDBTableView1Column5: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    gbSchema: TcxGroupBox;
    Label7: TLabel;
    edtSchema: TcxTextEdit;
    vtUsedBy: TVirtualTable;
    vtUses: TVirtualTable;
    procedure pcTriggerPropertiesPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure bbtnCreateTriggerClick(Sender: TObject);
    procedure bbtnAlterTriggerClick(Sender: TObject);
    procedure bbtnDropTriggerClick(Sender: TObject);
    procedure bbtnEnableTriggerClick(Sender: TObject);
    procedure bbtnDisableTrggerClick(Sender: TObject);
    procedure bbtnCompileTriggerClick(Sender: TObject);
    procedure bbtnRefreshTriggerClick(Sender: TObject);
  private
    { Private declarations }
    FTriggerName, FOwner: string;
    Trigger : TTrigger;
    procedure GetTrigger;
    procedure GetTriggerDetail;
    procedure SetProperties;
    procedure GetUsed;
    procedure GetUses;
    procedure GetErrors;
  public
    { Public declarations }
    procedure Init(ObjName, OwnerName: string); override;
  end;

var
  TriggerPropertiesFrm: TTriggerPropertiesFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, Util, OraStorage, frmTrigerDetail, frmTableEvents,
     frmSchemaPublicEvent, VisualOptions;

procedure TTriggerPropertiesFrm.Init(ObjName, OwnerName: string);
var
  a: boolean;
begin
  inherited Show;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  top := 0;
  left := 0;

  FTriggerName := ObjName;
  FOwner := OwnerName;

  GetTrigger;
  pcTriggerPropertiesPageChanging(self, pcTriggerProperties.ActivePage ,a);
end;

{*******************************************************************************}
{                         I N D E X                                             }
{*******************************************************************************}
procedure TTriggerPropertiesFrm.GetTrigger;
begin
  if Trigger <> nil then
     FreeAndNil(Trigger);

  Trigger := TTrigger.Create;
  Trigger.OraSession := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;
  Trigger.TRIGGER_NAME := FTriggerName;
  Trigger.OWNER := FOwner;
  Trigger.TABLE_OWNER := FOwner;    
  Trigger.SetDDL;
  lblDescription.Caption := Trigger.TriggerStatus;

  GetTriggerDetail;
end; //GetTrigger

procedure TTriggerPropertiesFrm.GetTriggerDetail;
var
 n,o,p: integer;
begin
  redtSource.Text := '';
  lviewError.Items.Clear;
  
  if Trigger.TRIGGER_NAME = '' then exit;
  if Trigger = nil then exit;

  redtSource.Text := Trigger.TRIGGER_BODY;
  CodeColors(self, 'Default', redtSource, false);

  edtTriggerName.Text := Trigger.TRIGGER_NAME;
  edtTriggerSchema.Text := Trigger.OWNER;
  edtSourceName.Text := Trigger.TABLE_NAME;
  edtSourceOwner.Text := Trigger.TABLE_OWNER;

  if pos('BEFORE', Trigger.TRIGGER_TYPE) > 0 then rgFireWhen.ItemIndex := 0;
  if pos('AFTER', Trigger.TRIGGER_TYPE) > 0 then rgFireWhen.ItemIndex := 1;

  cbInsert.Checked := pos('INSERT', Trigger.TRIGGERING_EVENT) > 0;
  cbUpdate.Checked := pos('UPDATE', Trigger.TRIGGERING_EVENT) > 0;
  cbDelete.Checked := pos('DELETE', Trigger.TRIGGERING_EVENT) > 0;

  cbLoggof.Checked := pos('LOGOFF', Trigger.TRIGGERING_EVENT) > 0;
  cbShotdown.Checked := pos('SHUTDOWN', Trigger.TRIGGERING_EVENT) > 0;
  cbServerError.Checked := pos('SERVERERROR', Trigger.TRIGGERING_EVENT) > 0;
  cbLoggon.Checked := pos('LOGON', Trigger.TRIGGERING_EVENT) > 0;
  cbStartup.Checked := pos('STARTUP', Trigger.TRIGGERING_EVENT) > 0;
  cbsuspend.Checked := pos('SUSPEND', Trigger.TRIGGERING_EVENT) > 0;
  cbAlter.Checked := pos('ALTER', Trigger.TRIGGERING_EVENT) > 0;
  cbAudit.Checked := pos('AUDIT', Trigger.TRIGGERING_EVENT) > 0;
  cbDisassocStats.Checked := pos('DISASSOCIATE STATISTICS', Trigger.TRIGGERING_EVENT) > 0;
  cbNoAudit.Checked := pos('NOAUDIT', Trigger.TRIGGERING_EVENT) > 0;
  cbTruncate.Checked := pos('TRUNCATE', Trigger.TRIGGERING_EVENT) > 0;
  cbAnalyze.Checked := pos('ANALYZE', Trigger.TRIGGERING_EVENT) > 0;
  cbComment.Checked := pos('COMMENT', Trigger.TRIGGERING_EVENT) > 0;
  cbDrop.Checked := pos('DROP', Trigger.TRIGGERING_EVENT) > 0;
  cbRename.Checked := pos('RENAME', Trigger.TRIGGERING_EVENT) > 0;
  cbDDL.Checked := pos('DDL', Trigger.TRIGGERING_EVENT) > 0;
  cbAssocStats.Checked := pos('ASSOCIATE STATISTICS', Trigger.TRIGGERING_EVENT) > 0;
  cbCreate.Checked := pos('CREATE', Trigger.TRIGGERING_EVENT) > 0;
  cbGrant.Checked := pos('GRANT', Trigger.TRIGGERING_EVENT) > 0;
  cbRevoke.Checked := pos('REVOKE', Trigger.TRIGGERING_EVENT) > 0;

  if trim(Trigger.BASE_OBJECT_TYPE) = 'TABLE' then rgTriggerOn.ItemIndex := 0;
  if trim(Trigger.BASE_OBJECT_TYPE) = 'VIEW' then rgTriggerOn.ItemIndex := 1;
  if trim(Trigger.BASE_OBJECT_TYPE) = 'SCHEMA' then rgTriggerOn.ItemIndex := 2;
  if (trim(Trigger.BASE_OBJECT_TYPE) = 'VIEW') and (length(Trigger.COLUMN_NAME)>0) then rgTriggerOn.ItemIndex := 3;
  if trim(Trigger.BASE_OBJECT_TYPE) = 'DATABASE' then rgTriggerOn.ItemIndex := 4;

  edtObjectName.Text := Trigger.TABLE_NAME;
  lcbNestedTable.Text := Trigger.COLUMN_NAME;
  edtObjectSchema.Text := Trigger.TABLE_OWNER;

  edtSchema.Text := Trigger.TABLE_OWNER;

  n := pos('NEW AS ', Trigger.REFERENCING_NAMES)+7;
  o := pos('OLD AS ', Trigger.REFERENCING_NAMES)+7;
  p := pos('PARENT AS ',Trigger.REFERENCING_NAMES);
  if p <= 0 then p := length(Trigger.REFERENCING_NAMES)+1;
  edtNewAs.Text := copy(Trigger.REFERENCING_NAMES,n,o-n-8);
  edtOldAs.Text := copy(Trigger.REFERENCING_NAMES,o,p-o);
  edtParent.Text := copy(Trigger.REFERENCING_NAMES,p+10, length(Trigger.REFERENCING_NAMES));

  if Trigger.STATUS = 'ENABLED' then rgStatus.ItemIndex := 0
     else rgStatus.ItemIndex := 1;

  redtDDL.Text := Trigger.GetDDL;
  CodeColors(self, 'Default', redtDDL, false);
  SetProperties;
end;

procedure TTriggerPropertiesFrm.SetProperties;
begin
  if rgTriggerOn.ItemIndex = 0 then //table
  begin
    rgForEach.Enabled := True;
    rgForEach.Visible := True;
    rgFireWhen.Enabled := true;
    cgOnEvent.Visible := true;
    cgOnEvent.Enabled := true;
    gbReferencing.Visible := true;
    lblParent.Visible := false;
    edtParent.Visible := false;
    lblNestedTable.Visible := false;
    lcbNestedTable.Visible := false;
    gboxFireOnDDL.Visible := false;
    gboxFireOnDatabase.Visible := false;
    gbSchema.Visible := false;
    rgEventType.Visible := False;
    gbObject.Visible := true;
  end;

  if rgTriggerOn.ItemIndex = 1 then //View
  begin
    rgFireWhen.Enabled := false;
    rgForEach.Enabled := False;
    rgForEach.Visible := True;
    rgForEach.ItemIndex := 0;
    cgOnEvent.Visible := true;
    cgOnEvent.Enabled := true;
    gbReferencing.Visible := true;
    lblParent.Visible := false;
    edtParent.Visible := false;
    lblNestedTable.Visible := false;
    lcbNestedTable.Visible := false;
    gboxFireOnDDL.Visible := false;
    gboxFireOnDatabase.Visible := false;
    gbSchema.Visible := false;
    rgEventType.Visible := False;
    gbObject.Visible := true;
  end;

  if rgTriggerOn.ItemIndex = 3 then //Nested of
  begin
    rgFireWhen.Enabled := false;
    rgForEach.Enabled := False;
    rgForEach.Visible := True;
    rgForEach.ItemIndex := 0;
    cgOnEvent.Visible := true;
    cgOnEvent.Enabled := true;
    gbReferencing.Visible := true;
    lblParent.Visible := True;
    edtParent.Visible := True;
    lblNestedTable.Visible := True;
    lcbNestedTable.Visible := True;
    gboxFireOnDDL.Visible := false;
    gboxFireOnDatabase.Visible := false;
    gbSchema.Visible := false;
    rgEventType.Visible := False;
    gbObject.Visible := true;
  end;

  if rgTriggerOn.ItemIndex = 2 then //Schema
  begin
    gbObject.Visible := false;
    rgFireWhen.Enabled := True;
    rgForEach.Visible := false;
    cgOnEvent.Visible := False;
    gbReferencing.Visible := false;
    lblNestedTable.Visible := false;
    lcbNestedTable.Visible := false;
    rgEventType.Visible := True;   
    gboxFireOnDDL.Visible := rgEventType.ItemIndex = 1;
    gboxFireOnDatabase.Visible := rgEventType.ItemIndex = 0;
    gbSchema.Visible := True;

    cbServerError.Enabled := rgFireWhen.ItemIndex = 1;
    cbLoggon.Enabled := rgFireWhen.ItemIndex = 1;
    cbStartup.Enabled := rgFireWhen.ItemIndex = 1;
    cbLoggof.Enabled := rgFireWhen.ItemIndex = 0;
    cbShotdown.Enabled := rgFireWhen.ItemIndex = 0;
  end;

  if rgTriggerOn.ItemIndex = 4 then //Database
  begin
    gbObject.Visible := false;
    rgFireWhen.Enabled := True;
    rgForEach.Visible := false;
    cgOnEvent.Visible := False;
    gbReferencing.Visible := false;
    lblNestedTable.Visible := false;
    lcbNestedTable.Visible := false;
    rgEventType.Visible := True;   
    gboxFireOnDDL.Visible := rgEventType.ItemIndex = 1;
    gboxFireOnDatabase.Visible := rgEventType.ItemIndex = 0;
    gbSchema.Visible := false;

    cbServerError.Enabled := rgFireWhen.ItemIndex = 1;
    cbLoggon.Enabled := rgFireWhen.ItemIndex = 1;
    cbStartup.Enabled := rgFireWhen.ItemIndex = 1;
    cbLoggof.Enabled := rgFireWhen.ItemIndex = 0;
    cbShotdown.Enabled := rgFireWhen.ItemIndex = 0;
  end;
end;

procedure TTriggerPropertiesFrm.pcTriggerPropertiesPageChanging(
  Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  inherited;
  if NewPage = tsTriggerSource then GetErrors;
  if NewPage = tsUsedBy then GetUsed;
  if NewPage = tsUses then GetUses;
end;


{*******************************************************************************}
{                              Dependencies                                     }
{*******************************************************************************}

procedure TTriggerPropertiesFrm.GetErrors;
begin
  FillViewHorizontal(Trigger.TriggerErrors, lviewError);
end;


{*******************************************************************************}
{                              U S E D                                          }
{*******************************************************************************}

procedure TTriggerPropertiesFrm.GetUsed;
begin
  vtUsedBy.close;
  vtUsedBy.Assign(Trigger.UsedByList);
  vtUsedBy.Open;
end;

{*******************************************************************************}
{                              U S E S                                          }
{*******************************************************************************}

procedure TTriggerPropertiesFrm.GetUses;
begin
  vtUses.close;
  vtUses.Assign(Trigger.UsesList);
  vtUses.Open;
end;


procedure TTriggerPropertiesFrm.bbtnCreateTriggerClick(Sender: TObject);
var
  t: TTrigger;
begin
  inherited;
  t := TTrigger.Create;
  t.OraSession := Trigger.OraSession;
  t.TRIGGER_NAME := '';
  t.Owner := Trigger.OWNER;
  t.TABLE_NAME := '';
  t.TABLE_OWNER := Trigger.OWNER;
  t.BASE_OBJECT_TYPE := 'TABLE';
  if TriggerDetailFrm.Init(t) then
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
end;

procedure TTriggerPropertiesFrm.bbtnAlterTriggerClick(Sender: TObject);
begin
  inherited;
  if Trigger.TRIGGER_NAME = '' then exit;
  if Trigger = nil then exit;   
  if TriggerDetailFrm.Init(Trigger) then
  begin
    GetTrigger;
    GetErrors;
  end;  
end;

procedure TTriggerPropertiesFrm.bbtnDropTriggerClick(Sender: TObject);
begin
  inherited;
  if Trigger.TRIGGER_NAME = '' then exit;
  if Trigger = nil then exit;
  if SchemaPublicEventFrm.Init(Trigger, oeDrop) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
end;

procedure TTriggerPropertiesFrm.bbtnEnableTriggerClick(Sender: TObject);
begin
  inherited;
  if Trigger.TRIGGER_NAME = '' then exit;
  if Trigger = nil then exit;
  if SchemaPublicEventFrm.Init(Trigger, oeEnable) then
  begin
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
     GetTrigger;
  end;
end;

procedure TTriggerPropertiesFrm.bbtnDisableTrggerClick(Sender: TObject);
begin
  inherited;
  if Trigger.TRIGGER_NAME = '' then exit;
  if Trigger = nil then exit;
  if SchemaPublicEventFrm.Init(Trigger, oeDisable) then
  begin
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
     GetTrigger;
  end;
end;

procedure TTriggerPropertiesFrm.bbtnCompileTriggerClick(Sender: TObject);
begin
  inherited;
  if Trigger.TRIGGER_NAME = '' then exit;
  if Trigger = nil then exit;
  if SchemaPublicEventFrm.Init(Trigger, oeCompile) then
  begin
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
     GetTrigger;
     GetErrors;
  end;
end;

procedure TTriggerPropertiesFrm.bbtnRefreshTriggerClick(Sender: TObject);
begin
  inherited;
  GetTrigger;
end;

end.
