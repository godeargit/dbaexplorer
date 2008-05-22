unit frmTablespaceDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxGraphics, cxMemo, cxRichEdit,
  cxCheckBox, cxDropDownEdit, cxImageComboBox, cxSpinEdit, cxMaskEdit,
  cxButtonEdit, cxTextEdit, cxContainer, cxEdit, cxLabel, cxPC, cxControls,
  StdCtrls, cxButtons, ExtCtrls, OraTablespace, cxGroupBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MemDS, VirtualTable;

type
  TTablespaceDetailFrm = class(TForm)
    pc: TcxPageControl;
    tsTablespace: TcxTabSheet;
    tsDataFile: TcxTabSheet;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    cxGroupBox2: TcxGroupBox;
    Label11: TcxLabel;
    Label12: TcxLabel;
    Label13: TcxLabel;
    Label14: TcxLabel;
    Label1: TcxLabel;
    Label2: TcxLabel;
    Label3: TcxLabel;
    Label4: TcxLabel;
    Label5: TcxLabel;
    Label6: TcxLabel;
    Label7: TcxLabel;
    Label8: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtInitialExtend: TcxButtonEdit;
    edtNextExtend: TcxButtonEdit;
    edtMinExtents: TcxSpinEdit;
    edtMaxExtents: TcxSpinEdit;
    edtPctIncrease: TcxButtonEdit;
    icbStatus: TcxImageComboBox;
    icbContents: TcxImageComboBox;
    icbLogging: TcxImageComboBox;
    cbForceLogging: TcxCheckBox;
    icbExtentManagement: TcxImageComboBox;
    icbRetention: TcxImageComboBox;
    cbBigFile: TcxCheckBox;
    edtMinExtlen: TcxSpinEdit;
    edtBlockSize: TcxButtonEdit;
    icbSgmentSpaceManagement: TcxImageComboBox;
    cxLabel3: TcxLabel;
    cbCompress: TcxCheckBox;
    cxGroupBox3: TcxGroupBox;
    btnExecute: TcxButton;
    btnCancel: TcxButton;
    Bevel1: TBevel;
    icbAllocationType: TcxImageComboBox;
    edtName: TcxMaskEdit;
    gridDataFileDB: TcxGridDBTableView;
    gridDataFileLevel1: TcxGridLevel;
    gridDataFile: TcxGrid;
    btnAddDataFile: TcxButton;
    btnEditDataFile: TcxButton;
    btnDeleteDataFile: TcxButton;
    vtDataFile: TVirtualTable;
    dsDataFile: TDataSource;
    vtDataFileNAME: TStringField;
    vtDataFileSIZE: TFloatField;
    vtDataFileUNITS: TStringField;
    vtDataFileREUSE: TStringField;
    vtDataFileAUTOEXTEND: TStringField;
    vtDataFileNEXT: TFloatField;
    vtDataFileNEXT_UNIT: TStringField;
    vtDataFileMAX_UNLIMITED: TStringField;
    vtDataFileMAX_SIZE: TFloatField;
    vtDataFileMAX_UNIT: TStringField;
    gridDataFileDBNAME: TcxGridDBColumn;
    gridDataFileDBSIZE: TcxGridDBColumn;
    gridDataFileDBUNITS: TcxGridDBColumn;
    gridDataFileDBREUSE: TcxGridDBColumn;
    gridDataFileDBAUTOEXTEND: TcxGridDBColumn;
    gridDataFileDBNEXT: TcxGridDBColumn;
    gridDataFileDBNEXT_UNIT: TcxGridDBColumn;
    gridDataFileDBMAX_UNLIMITED: TcxGridDBColumn;
    gridDataFileDBMAX_SIZE: TcxGridDBColumn;
    gridDataFileDBMAX_UNIT: TcxGridDBColumn;
    vtDataFileRECORD_STATUS: TStringField;
    procedure btnCancelClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure btnExecuteClick(Sender: TObject);
    procedure btnAddDataFileClick(Sender: TObject);
    procedure btnEditDataFileClick(Sender: TObject);
    procedure btnDeleteDataFileClick(Sender: TObject);
    procedure vtDataFileAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    FTablespace: TTablespace;
    FNewTablespace: TTablespace;
    procedure GetTablespaceDetail;
    function SetTablespaceDetail: boolean;
    procedure GetDataFiles;
  public
    { Public declarations }
    function Init(ATablespace: TTablespace): boolean;
  end;

var
  TablespaceDetailFrm: TTablespaceDetailFrm;

implementation

{$R *.dfm}

uses Util, frmSchemaBrowser, GenelDM, OraStorage, VisualOptions, frmDataFile;

function TTablespaceDetailFrm.Init(ATablespace: TTablespace): boolean;
begin
  TablespaceDetailFrm := TTablespaceDetailFrm.Create(Application);
  Self := TablespaceDetailFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  FTablespace := TTablespace.Create;
  FTablespace := ATablespace;

  FNewTablespace := TTablespace.Create;
  FNewTablespace.OraSession := ATablespace.OraSession;
  FNewTablespace.Mode := ATablespace.Mode;

  GetTablespaceDetail;
  pc.ActivePage := tsTablespace;
  ShowModal;
  result := ModalResult = mrOk;
  Free;
end;

procedure TTablespaceDetailFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TTablespaceDetailFrm.GetTablespaceDetail;
begin
  if FTablespace.Mode = InsertMode then Caption := 'Create Tablespace ' else Caption := 'Alter Tablespace '+FTablespace.TABLESPACE_NAME;

  with FTablespace do
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

  edtName.enabled := FTablespace.Mode = InsertMode;
  edtBlockSize.enabled := FTablespace.Mode = InsertMode;
  edtInitialExtend.enabled := FTablespace.Mode = InsertMode;
  edtNextExtend.enabled := FTablespace.Mode = InsertMode;
  edtMinExtents.enabled := FTablespace.Mode = InsertMode;
  edtMaxExtents.enabled := FTablespace.Mode = InsertMode;
  edtPctIncrease.enabled := FTablespace.Mode = InsertMode;
  edtMinExtlen.enabled := FTablespace.Mode = InsertMode;
  icbContents.enabled := FTablespace.Mode = InsertMode;
  icbExtentManagement.enabled := FTablespace.Mode = InsertMode;
  icbAllocationType.enabled := FTablespace.Mode = InsertMode;
  icbSgmentSpaceManagement.enabled := FTablespace.Mode = InsertMode;
  icbRetention.enabled := FTablespace.Mode = InsertMode;
  cbBigFile.enabled := FTablespace.Mode = InsertMode;

  vtDataFile.Open;
  GetDataFiles;
  btnEditDataFile.Enabled := FTablespace.Mode = InsertMode;
  
end; //GetTablespaceDetail;

function TTablespaceDetailFrm.SetTablespaceDetail: boolean;
begin
  result := true;
  if edtName.Text = '' then
  begin
    MessageDlg('Tablespace Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if (FNewTablespace.Mode = InsertMode) and (FNewTablespace.DataFileCount <= 0) then
  begin
    MessageDlg('Required Data File', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  with FNewTablespace do
  begin
    TABLESPACE_NAME := edtName.Text;
    BLOCK_SIZE := StrToFloat(isNull(edtBlockSize.Text));
    INITIAL_EXTENT := StrToFloat(isNull(edtInitialExtend.Text));
    NEXT_EXTENT := StrToFloat(isNull(edtNextExtend.Text));
    MIN_EXTENTS := StrToFloat(isNull(edtMinExtents.Text));
    MAX_EXTENTS := StrToFloat(isNull(edtMaxExtents.Text));
    PCT_INCREASE := StrToFloat(isNull(edtPctIncrease.Text));
    MIN_EXTLEN := StrToFloat(isNull(edtMinExtlen.Text));
    STATUS := TTablespaceStatus(icbStatus.ItemIndex);
    CONTENTS := TTablespaceContents(icbContents.ItemIndex); 
    LOGGING := TLoggingType(icbLogging.ItemIndex);
    FORCE_LOGGING := cbForceLogging.Checked;
    EXTENT_MANAGEMENT := TTablespaceExtentManagement(icbExtentManagement.ItemIndex);
    ALLOCATION_TYPE := TTablespaceAllocation(icbAllocationType.ItemIndex);
    SEGMENT_SPACE_MANAGEMENT := TSegmentSpaceManagement(icbSgmentSpaceManagement.ItemIndex);
    DEF_TAB_COMPRESSION := cbCompress.Checked;
    RETENTION := TTablespaceRetention(icbRetention.ItemIndex);
    BIGFILE := cbBigFile.Checked;
  end; //FTablespace

end; //SetTablespaceDetail


procedure TTablespaceDetailFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetTablespaceDetail then AllowChange := false
    else
    begin
      if FNewTablespace.Mode = InsertMode then
         redtDDL.Text := FNewTablespace.GetDDL
      else
         redtDDL.Text := FNewTablespace.GetAlterDDL(FTablespace);
    end;
    CodeColors(self, 'Default', redtDDL, false);
  end;
end;

procedure TTablespaceDetailFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetTablespaceDetail then exit;
  if FNewTablespace.Mode = InsertMode then
  begin
    redtDDL.Text := FNewTablespace.GetDDL;
    if FNewTablespace.CreateTablespace(redtDDL.Text) then ModalResult := mrOK;
  end else
  begin
    redtDDL.Text := FNewTablespace.GetAlterDDL(FTablespace);
    if FNewTablespace.AlterTablespace(redtDDL.Text) then ModalResult := mrOK;
  end;
end;

procedure TTablespaceDetailFrm.GetDataFiles;
var
  DataFile: TDataFile;
  i: integer;
begin
  for i:= 0 to FTablespace.DataFileCount -1 do
  begin
    DataFile := FTablespace.DatafileItems[i];
      with vtDataFile do
      begin
        Append;
        FieldByName('NAME').AsString := dataFile^.NAME;
        FieldByName('SIZE').AsFloat := dataFile^.SIZE;
        FieldByName('UNITS').AsString := dataFile^.UNITS;
        FieldByName('REUSE').asString := BoolToStr(dataFile^.REUSE, 'YN');
        FieldByName('AUTOEXTEND').asString := BoolToStr(dataFile^.AUTOEXTEND, 'YN');
        FieldByName('NEXT').AsFloat := dataFile^.NEXT;
        FieldByName('NEXT_UNIT').AsString := dataFile^.NEXT_UNITS;
        FieldByName('MAX_UNLIMITED').AsString := BoolToStr(dataFile^.MAX_UNLIMITED, 'YN');
        FieldByName('MAX_SIZE').AsFloat := dataFile^.MAX_SIZE;
        FieldByName('MAX_UNIT').AsString := dataFile^.MAX_UNITS;
        FieldByName('RECORD_STATUS').AsString := 'OLD';
        post;
      end;
  end;
end;

procedure TTablespaceDetailFrm.btnAddDataFileClick(Sender: TObject);
var
  DataFile: TDataFile;
begin
  new(DataFile);
  DataFile^.TABLESPACE_NAME := edtName.Text;
  DataFile^.NAME := '';
  DataFile^.SIZE := 0;
  DataFile^.UNITS:= '';
  DataFile^.REUSE := FALSE;
  DataFile^.AUTOEXTEND:= FALSE;
  DataFile^.NEXT := 0;
  DataFile^.NEXT_UNITS:='';
  DataFile^.MAX_UNLIMITED:=FALSE;
  DataFile^.MAX_SIZE:= 0;
  DataFile^.MAX_UNITS:='';
  if DataFileFrm.Init(DataFile) then
  begin
    with vtDataFile do
    begin
      Append;
      FieldByName('NAME').AsString := dataFile^.NAME;
      FieldByName('SIZE').AsFloat := dataFile^.SIZE;
      FieldByName('UNITS').AsString := dataFile^.UNITS;
      FieldByName('REUSE').asString := BoolToStr(dataFile^.REUSE, 'YN');
      FieldByName('AUTOEXTEND').asString := BoolToStr(dataFile^.AUTOEXTEND, 'YN');
      FieldByName('NEXT').AsFloat := dataFile^.NEXT;
      FieldByName('NEXT_UNIT').AsString := dataFile^.NEXT_UNITS;
      FieldByName('MAX_UNLIMITED').AsString := BoolToStr(dataFile^.MAX_UNLIMITED, 'YN');
      FieldByName('MAX_SIZE').AsFloat := dataFile^.MAX_SIZE;
      FieldByName('MAX_UNIT').AsString := dataFile^.MAX_UNITS;
      FieldByName('RECORD_STATUS').AsString := 'NEW';
      post;
      FNewTablespace.DataFileAdd(DataFile);
    end;
  end;
end;

procedure TTablespaceDetailFrm.btnEditDataFileClick(Sender: TObject);
var
  DataFile: TDataFile;
  index: integer;
begin
  if not vtDataFile.Active then exit;
  if vtDataFile.RecordCount <= 0 then exit;

  index := FNewTablespace.FindByDataFileId(vtDataFile.FieldByName('NAME').AsString);
  DataFile := FNewTablespace.DatafileItems[index];
  if DataFileFrm.Init(DataFile) then
  begin
    with vtDataFile do
    begin
      //locate('NAME',dataFile^.NAME, []);
      Edit;
      FieldByName('NAME').AsString := dataFile^.NAME;
      FieldByName('SIZE').AsFloat := dataFile^.SIZE;
      FieldByName('UNITS').AsString := dataFile^.UNITS;
      FieldByName('REUSE').asString := BoolToStr(dataFile^.REUSE, 'YN');
      FieldByName('AUTOEXTEND').asString := BoolToStr(dataFile^.AUTOEXTEND, 'YN');
      FieldByName('NEXT').AsFloat := dataFile^.NEXT;
      FieldByName('NEXT_UNIT').AsString := dataFile^.NEXT_UNITS;
      FieldByName('MAX_UNLIMITED').AsString := BoolToStr(dataFile^.MAX_UNLIMITED, 'YN');
      FieldByName('MAX_SIZE').AsFloat := dataFile^.MAX_SIZE;
      FieldByName('MAX_UNIT').AsString := dataFile^.MAX_UNITS;
      post;
    end;
  end;
end;

procedure TTablespaceDetailFrm.btnDeleteDataFileClick(Sender: TObject);
var
  index: integer;
begin
  if not vtDataFile.Active then exit;
  if vtDataFile.RecordCount <= 0 then exit;

  index := FNewTablespace.FindByDataFileId(vtDataFile.FieldByName('NAME').AsString);
  FNewTablespace.DataFileDelete(index);
  vtDataFile.Delete;
end;

procedure TTablespaceDetailFrm.vtDataFileAfterScroll(DataSet: TDataSet);
begin
  btnEditDataFile.Enabled := vtDataFile.FieldByName('RECORD_STATUS').AsString = 'NEW';
  btnDeleteDataFile.Enabled := vtDataFile.FieldByName('RECORD_STATUS').AsString = 'NEW';
end;

end.
