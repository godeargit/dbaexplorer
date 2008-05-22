unit frmDirectoryProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GenelDM, OraDirectory, VirtualTable, frmBaseform, dxBar, cxMemo,
  cxRichEdit, cxLabel, cxContainer, cxEdit, cxTextEdit, cxPC, cxControls,
  StdCtrls, ExtCtrls;

type
  TDirectoryPropertiesFrm = class(TBaseform)
    Panel1: TPanel;
    imgToolBar: TImage;
    lblDescription: TLabel;
    pcSequenceProperties: TcxPageControl;
    tsDirectoryDetails: TcxTabSheet;
    dxBarDockControl1: TdxBarDockControl;
    edtName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel8: TcxLabel;
    edtPath: TcxTextEdit;
    tsSequenceScripts: TcxTabSheet;
    redtDDL: TcxRichEdit;
    dxBarManager1: TdxBarManager;
    bbtnCreateDirectory: TdxBarButton;
    bbtnAlterDirectory: TdxBarButton;
    bbtnDropDirectory: TdxBarButton;
    bbtnRefreshDirectory: TdxBarButton;
    procedure bbtnCreateDirectoryClick(Sender: TObject);
    procedure bbtnAlterDirectoryClick(Sender: TObject);
    procedure bbtnRefreshDirectoryClick(Sender: TObject);
    procedure bbtnDropDirectoryClick(Sender: TObject);
  private
    { Private declarations }
    FDirectoryName, FOwner: string;
    DBDirectory: TDBDirectory;
    procedure GetDBDirectory;
    procedure GetDBDirectoryDetail;
  public
    { Public declarations }
    procedure Init(ObjName, OwnerName: string); override;
  end;

var
  DirectoryPropertiesFrm: TDirectoryPropertiesFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, Util, OraStorage, frmSchemaPublicEvent,
     VisualOptions, frmDirectoryDetail;

procedure TDirectoryPropertiesFrm.Init(ObjName, OwnerName: string);
begin
  inherited Show;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  top := 0;
  left := 0;
  FDirectoryName := ObjName;
  FOwner := OwnerName;
  GetDBDirectory;
end;

procedure TDirectoryPropertiesFrm.GetDBDirectory;
begin
  if DBDirectory <> nil then
     FreeAndNil(DBDirectory);

  DBDirectory := TDBDirectory.Create;
  DBDirectory.OraSession := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;
  DBDirectory.DIRECTORY_NAME := FDirectoryName;
  DBDirectory.OWNER := FOwner;
  DBDirectory.SetDDL;
  lblDescription.Caption := DBDirectory. Status;

  GetDBDirectoryDetail;

  redtDDL.Text := DBDirectory.GetDDL;
  CodeColors(self, 'Default', redtDDL, false);
end;

procedure TDirectoryPropertiesFrm.GetDBDirectoryDetail;
begin
  edtName.Text := DBDirectory.DIRECTORY_NAME;
  edtPath.Text := DBDirectory.DIRECTORY_PATH;
end;


procedure TDirectoryPropertiesFrm.bbtnCreateDirectoryClick(
  Sender: TObject);
var
  FDBDirectory : TDBDirectory;
begin
  FDBDirectory := TDBDirectory.Create;
  FDBDirectory.OraSession := DBDirectory.OraSession;
  if DirectoryDetailFrm.Init(FDBDirectory) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbDirectories);
end;

procedure TDirectoryPropertiesFrm.bbtnAlterDirectoryClick(Sender: TObject);
begin
  if DBDirectory = nil then exit;
  if DBDirectory.DIRECTORY_NAME = '' then exit;
  if DirectoryDetailFrm.Init(DBDirectory) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbDirectories);
end;

procedure TDirectoryPropertiesFrm.bbtnRefreshDirectoryClick(
  Sender: TObject);
begin
  GetDBDirectory;
end;

procedure TDirectoryPropertiesFrm.bbtnDropDirectoryClick(Sender: TObject);
begin
  if DBDirectory = nil then exit;
  if DBDirectory.DIRECTORY_NAME = '' then exit;
  if SchemaPublicEventFrm.Init(DBDirectory, oeDrop) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbDirectories);
end;

end.
