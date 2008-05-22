unit frmTablespaceProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxMemo, cxRichEdit, cxSpinEdit, cxMaskEdit,
  cxButtonEdit, cxGroupBox, cxCheckBox, cxLabel, cxContainer, cxEdit,
  cxTextEdit, dxBar, cxPC, cxControls, cxGraphics, cxDropDownEdit,
  cxImageComboBox,GenelDM, OraTablespace, VirtualTable, frmBaseform;

type
  TTablespacePropertiesFrm = class(TBaseform)
    Panel1: TPanel;
    imgToolBar: TImage;
    pcTablespaceProperties: TcxPageControl;
    tsRollbackSegmentDetails: TcxTabSheet;
    dxBarDockControl1: TdxBarDockControl;
    edtName: TcxTextEdit;
    cxLabel1: TcxLabel;
    tsSequenceScripts: TcxTabSheet;
    redtDDL: TcxRichEdit;
    dxBarManager1: TdxBarManager;
    bbtnCreateTablespace: TdxBarButton;
    bbtnAlterTablespace: TdxBarButton;
    bbtnDropTablespace: TdxBarButton;
    bbtnRefreshTablespace: TdxBarButton;
    bbtnTakeOffTablespace: TdxBarButton;
    bbtnTakeOnTablespace: TdxBarButton;
    cxLabel2: TcxLabel;
    Label11: TcxLabel;
    Label12: TcxLabel;
    Label13: TcxLabel;
    Label14: TcxLabel;
    edtInitialExtend: TcxButtonEdit;
    edtNextExtend: TcxButtonEdit;
    edtMinExtents: TcxSpinEdit;
    edtMaxExtents: TcxSpinEdit;
    Label1: TcxLabel;
    edtPctIncrease: TcxButtonEdit;
    icbStatus: TcxImageComboBox;
    Label2: TcxLabel;
    icbContents: TcxImageComboBox;
    Label3: TcxLabel;
    Label4: TcxLabel;
    icbLogging: TcxImageComboBox;
    cbForceLogging: TcxCheckBox;
    icbExtentManagement: TcxImageComboBox;
    Label5: TcxLabel;
    Label6: TcxLabel;
    icbRetention: TcxImageComboBox;
    Label7: TcxLabel;
    cbBigFile: TcxCheckBox;
    Label8: TcxLabel;
    edtMinExtlen: TcxSpinEdit;
    tsDataFile: TcxTabSheet;
    tsObjects: TcxTabSheet;
    tsFramentation: TcxTabSheet;
    edtBlockSize: TcxButtonEdit;
    icbSgmentSpaceManagement: TcxImageComboBox;
    cxLabel3: TcxLabel;
    cbCompress: TcxCheckBox;
    icbAllocationType: TcxImageComboBox;
    lblDescription: TLabel;
    procedure bbtnCreateTablespaceClick(Sender: TObject);
    procedure bbtnAlterTablespaceClick(Sender: TObject);
    procedure bbtnDropTablespaceClick(Sender: TObject);
    procedure bbtnTakeOnTablespaceClick(Sender: TObject);
    procedure bbtnTakeOffTablespaceClick(Sender: TObject);
    procedure bbtnRefreshTablespaceClick(Sender: TObject);
  private
    { Private declarations }
    FTablespaceName : string;
    Tablespace: TTablespace;
    procedure GetTablespace;
    procedure GetTablespaceDetail;
  public
    { Public declarations }
    procedure Init(ObjName, OwnerName: string); override;
  end;

var
  TablespacePropertiesFrm: TTablespacePropertiesFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, Util, OraStorage, frmSchemaPublicEvent,
     frmTablespaceDetail, VisualOptions;

procedure TTablespacePropertiesFrm.Init(ObjName, OwnerName: string);
begin
  inherited Show;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  top := 0;
  left := 0;
  FTablespaceName := ObjName;
  GetTablespace;
end;

procedure TTablespacePropertiesFrm.GetTablespace;
begin
  if Tablespace <> nil then
     FreeAndNil(Tablespace);

  Tablespace := TTablespace.Create;
  Tablespace.OraSession := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;
  Tablespace.TABLESPACE_NAME := FTablespaceName;
  Tablespace.SetDDL;
  lblDescription.Caption :=  FTablespaceName;

  GetTablespaceDetail;

  redtDDL.Text := Tablespace.GetDDL;
  CodeColors(self, 'Default', redtDDL, false);
end;

procedure TTablespacePropertiesFrm.GetTablespaceDetail;
begin
  with Tablespace do
  begin
    edtName.Text := TABLESPACE_NAME;
    edtBlockSize.Text := FloatToStr(BLOCK_SIZE);
    edtInitialExtend.Text := FloatToStr(INITIAL_EXTENT);
    edtNextExtend.Text := FloatToStr(NEXT_EXTENT);
    edtMinExtents.Text := FloatToStr(MIN_EXTENTS);
    edtMaxExtents.Text := FloatToStr(MAX_EXTENTS);
    edtPctIncrease.Text := FloatToStr(PCT_INCREASE);
    edtMinExtlen.Text := FloatToStr(MIN_EXTLEN);
    icbStatus.ItemIndex := Integer(STATUS);
    icbContents.ItemIndex := Integer(CONTENTS);
    icbLogging.ItemIndex := Integer(LOGGING);
    cbForceLogging.Checked := FORCE_LOGGING;
    icbExtentManagement.ItemIndex := Integer(EXTENT_MANAGEMENT);
    icbAllocationType.ItemIndex := Integer(ALLOCATION_TYPE);
    icbSgmentSpaceManagement.ItemIndex := integer(SEGMENT_SPACE_MANAGEMENT);
    cbCompress.Checked := DEF_TAB_COMPRESSION;
    icbRetention.ItemIndex := Integer(RETENTION);
    cbBigFile.Checked := BIGFILE;   
  end;
end;

procedure TTablespacePropertiesFrm.bbtnCreateTablespaceClick(
  Sender: TObject);
var
  FTablespace : TTablespace;
begin
  inherited;
  FTablespace := TTablespace.Create;
  FTablespace.OraSession := Tablespace.OraSession;
  FTablespace.Mode := InsertMode;
  if TablespaceDetailFrm.Init(FTablespace) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTablespaces);
end;

procedure TTablespacePropertiesFrm.bbtnAlterTablespaceClick(
  Sender: TObject);
begin
  inherited;
  if Tablespace = nil then exit;
  Tablespace.Mode := UpdateMode;
  if TablespaceDetailFrm.Init(Tablespace) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTablespaces);
end;

procedure TTablespacePropertiesFrm.bbtnDropTablespaceClick(
  Sender: TObject);
begin
  inherited;
  if Tablespace = nil then exit;
  if Tablespace.TABLESPACE_NAME = '' then exit;
  if SchemaPublicEventFrm.Init(Tablespace, oeDrop) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTablespaces);
end;

procedure TTablespacePropertiesFrm.bbtnTakeOnTablespaceClick(
  Sender: TObject);
begin
  inherited;
  if Tablespace = nil then exit;
  if Tablespace.TABLESPACE_NAME = '' then exit;
  if SchemaPublicEventFrm.Init(Tablespace, oeOnLine) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTablespaces);
end;

procedure TTablespacePropertiesFrm.bbtnTakeOffTablespaceClick(
  Sender: TObject);
begin
  inherited;
  if Tablespace = nil then exit;
  if Tablespace.TABLESPACE_NAME = '' then exit;
  if SchemaPublicEventFrm.Init(Tablespace, oeOffLine) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTablespaces);
end;

procedure TTablespacePropertiesFrm.bbtnRefreshTablespaceClick(
  Sender: TObject);
begin
  inherited;
  GetTablespace;
end;

end.
