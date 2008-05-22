unit frmFindInDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxListBox, cxDropDownEdit, cxCheckBox, ExtCtrls,
  cxTextEdit, cxMaskEdit, cxLabel, cxControls, cxContainer, cxEdit,
  cxGroupBox, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  dxStatusBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  MemDS, DBAccess, Ora, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  GenelDM, OraBarConn;

type
  TFindInDBFrm = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edtSearchText: TcxMaskEdit;
    Bevel1: TBevel;
    cxGroupBox2: TcxGroupBox;
    chkObjectNames: TcxCheckBox;
    chkColomnNames: TcxCheckBox;
    chkProcedureSource: TcxCheckBox;
    chkTriggerSource: TcxCheckBox;
    chkViewSource: TcxCheckBox;
    cxLabel2: TcxLabel;
    cbTextPositions: TcxComboBox;
    cxLabel3: TcxLabel;
    lboxSchema: TcxListBox;
    btnSearch: TcxButton;
    btnClose: TcxButton;
    cxGroupBox3: TcxGroupBox;
    statusBar: TdxStatusBar;
    gridResultDBTableView1: TcxGridDBTableView;
    gridResultLevel1: TcxGridLevel;
    gridResult: TcxGrid;
    qSearch: TOraQuery;
    dsSearch: TDataSource;
    qSearchRESULT_TYPE: TStringField;
    qSearchOBJECT_TYPE: TStringField;
    qSearchOBJECT_NAME: TStringField;
    qSearchOWNER: TStringField;
    gridResultDBTableView1OBJECT_NAME: TcxGridDBColumn;
    gridResultDBTableView1OBJECT_TYPE: TcxGridDBColumn;
    gridResultDBTableView1PARENT: TcxGridDBColumn;
    gridResultDBTableView1OWNER: TcxGridDBColumn;
    qTemp: TOraQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    FOraSession: TOraSession;
    FBarConnection : TBarConnection;
    procedure GetSchemaList;
  public
    { Public declarations }
    procedure Init(ABarConnection : TBarConnection);
  end;

var
  FindInDBFrm: TFindInDBFrm;

implementation

{$R *.dfm}

uses frmMain, DBQuery, OraSessions, util, OraScripts, OraUser, VisualOptions;

procedure TFindInDBFrm.Init(ABarConnection : TBarConnection);
begin
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FBarConnection := ABarConnection;
  FOraSession := ABarConnection.Session;

  Caption := FBarConnection.Session.Server+'/'+FBarConnection.Session.UserName+' - '+'Find in DB';
  statusBar.Panels[0].Text := FBarConnection.Session.Server+'/'+FBarConnection.Session.UserName;
  MainFrm.dxBarListWindows.Items.AddObject(Caption, Self);

  qTemp.Session := FOraSession;
  qSearch.Session := FOraSession;

  GetSchemaList;
end;

procedure TFindInDBFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qTemp.close;
  qSearch.close;
  with MainFrm.dxBarListWindows.Items do
       Delete(IndexOfObject(Self));
  action := caFree;
end;

procedure TFindInDBFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TFindInDBFrm.GetSchemaList;
begin
  qTemp.close;
  qTemp.sql.Text := GetUsers;
  qTemp.open;
  while not qTemp.Eof do
  begin
    lboxSchema.Items.Add(qTemp.FieldByName('USERNAME').AsString);
    qTemp.Next;
  end;
  qTemp.close;
end;

procedure TFindInDBFrm.btnSearchClick(Sender: TObject);
var
  ownerList: string;
  i: integer;
begin
  if edtSearchText.Text = '' then
  begin
    MessageDlg('No search text specified.', mtWarning, [mbOk], 0);
    exit;
  end;

  if not (chkObjectNames.Checked or chkColomnNames.Checked or chkProcedureSource.Checked) then
  begin
    MessageDlg('You must select one Object Options.', mtWarning, [mbOk], 0);
    exit;
  end;

  if lboxSchema.SelCount <= 0 then
  begin
    MessageDlg('You must select one Schema Name.', mtWarning, [mbOk], 0);
    exit;
  end;

  for i := 0 to lboxSchema.Count -1 do
  begin
    if lboxSchema.Selected[i] then
       ownerList := ownerList + str(lboxSchema.Items[i])+',';
  end;

  delete(ownerList,length(ownerList),1);

  qSearch.close;
  qSearch.SQL.Text := FindInDB(edtSearchText.Text,
                               chkObjectNames.Checked,
                               chkColomnNames.Checked,
                               chkProcedureSource.Checked,
                               ownerList,
                               cbTextPositions.Text);
  qSearch.Open;               
end;


end.
