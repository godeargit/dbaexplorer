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
unit frmRollbackSegmentProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxMemo, cxRichEdit, cxLabel, cxContainer, cxEdit, cxTextEdit,
  dxBar, cxPC, cxControls, StdCtrls, ExtCtrls, cxCheckBox, cxGraphics,
  cxDropDownEdit, cxImageComboBox, cxMaskEdit, cxGroupBox, cxButtonEdit,
  cxSpinEdit, GenelDM, OraRollbackSegment, VirtualTable, frmBaseform;

type
  TRollbackSegmentPropertiesFrm = class(TBaseform)
    Panel1: TPanel;
    imgToolBar: TImage;
    lblDescription: TLabel;
    pcSequenceProperties: TcxPageControl;
    tsRollbackSegmentDetails: TcxTabSheet;
    dxBarDockControl1: TdxBarDockControl;
    edtName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel8: TcxLabel;
    edtTablespace: TcxTextEdit;
    tsSequenceScripts: TcxTabSheet;
    redtDDL: TcxRichEdit;
    dxBarManager1: TdxBarManager;
    bbtnCreateRollbackSegment: TdxBarButton;
    bbtnAlterRollbackSegment: TdxBarButton;
    bbtnDropRollbackSegment: TdxBarButton;
    bbtnRefreshRollbackSegment: TdxBarButton;
    chkOnline: TcxCheckBox;
    chkPublic: TcxCheckBox;
    gbStorageClause: TcxGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtInitialExtend: TcxButtonEdit;
    edtNextExtend: TcxButtonEdit;
    edtMinExtents: TcxSpinEdit;
    edtMaxExtents: TcxSpinEdit;
    bbtnTakeOffRollbackSegment: TdxBarButton;
    bbtnTakeOnRollbackSegment: TdxBarButton;
    procedure bbtnCreateRollbackSegmentClick(Sender: TObject);
    procedure bbtnAlterRollbackSegmentClick(Sender: TObject);
    procedure bbtnDropRollbackSegmentClick(Sender: TObject);
    procedure bbtnTakeOnRollbackSegmentClick(Sender: TObject);
    procedure bbtnTakeOffRollbackSegmentClick(Sender: TObject);
  private
    { Private declarations }
    FSegmentName : string;
    RollbackSegment: TRollbackSegment;
    procedure GetRollbackSegment;
    procedure GetRollbackSegmentDetail;
  public
    { Public declarations }
    procedure Init(ObjName, OwnerName: string); override;
  end;

var
  RollbackSegmentPropertiesFrm: TRollbackSegmentPropertiesFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, Util, OraStorage, frmSchemaPublicEvent,
     frmRollbackSegmentDetail, VisualOptions;

procedure TRollbackSegmentPropertiesFrm.Init(ObjName, OwnerName: string);
begin
  inherited Show;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  top := 0;
  left := 0;
  FSegmentName := ObjName;
  GetRollbackSegment;
end;

procedure TRollbackSegmentPropertiesFrm.GetRollbackSegment;
begin
  if RollbackSegment <> nil then
     FreeAndNil(RollbackSegment);

  RollbackSegment := TRollbackSegment.Create;
  RollbackSegment.OraSession := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;
  RollbackSegment.SEGMENT_NAME := FSegmentName;
  RollbackSegment.SetDDL;
  lblDescription.Caption := FSegmentName;

  GetRollbackSegmentDetail;

  redtDDL.Text := RollbackSegment.GetDDL;
  CodeColors(self, 'Default', redtDDL, false);
end;

procedure TRollbackSegmentPropertiesFrm.GetRollbackSegmentDetail;
begin
  with RollbackSegment do
  begin
    edtName.Text := SEGMENT_NAME;
    edtTablespace.Text := TABLESPACE_NAME;
    chkOnline.Checked := STATUS = 'ONLINE';
    chkPublic.Checked  :=  PUBLIC;
    edtInitialExtend.Text := FloatToStr(INITIAL_EXTENT);
    edtNextExtend.Text := FloatToStr(NEXT_EXTENT);
    edtMinExtents.Text := FloatToStr(MIN_EXTENTS);
    edtMaxExtents.Text := FloatToStr(MAX_EXTENTS);
  end;
end;

procedure TRollbackSegmentPropertiesFrm.bbtnCreateRollbackSegmentClick(
  Sender: TObject);
var
  FRollbackSegment : TRollbackSegment;
begin
  FRollbackSegment := TRollbackSegment.Create;
  FRollbackSegment.OraSession := RollbackSegment.OraSession;
  FRollbackSegment.Mode := InsertMode;
  if RollbackSegmentDetailFrm.Init(FRollbackSegment) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbRollbackSegments);
end;

procedure TRollbackSegmentPropertiesFrm.bbtnAlterRollbackSegmentClick(
  Sender: TObject);
begin
  if RollbackSegment = nil then exit;
  RollbackSegment.Mode := UpdateMode;  
  if RollbackSegmentDetailFrm.Init(RollbackSegment) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbRollbackSegments);
end;

procedure TRollbackSegmentPropertiesFrm.bbtnDropRollbackSegmentClick(
  Sender: TObject);
begin
  if RollbackSegment = nil then exit;
  if RollbackSegment.SEGMENT_NAME = '' then exit;
  if SchemaPublicEventFrm.Init(RollbackSegment, oeDrop) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbRollbackSegments);
end;

procedure TRollbackSegmentPropertiesFrm.bbtnTakeOnRollbackSegmentClick(
  Sender: TObject);
begin
  if RollbackSegment = nil then exit;
  if RollbackSegment.SEGMENT_NAME = '' then exit;
  if SchemaPublicEventFrm.Init(RollbackSegment, oeOnLine) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbRollbackSegments);
end;

procedure TRollbackSegmentPropertiesFrm.bbtnTakeOffRollbackSegmentClick(
  Sender: TObject);
begin
  if RollbackSegment = nil then exit;
  if RollbackSegment.SEGMENT_NAME = '' then exit;
  if SchemaPublicEventFrm.Init(RollbackSegment, oeOffLine) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbRollbackSegments);
end;

end.
