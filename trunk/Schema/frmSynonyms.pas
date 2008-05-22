unit frmSynonyms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxGraphics, cxGroupBox,
  cxRadioGroup, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, StdCtrls, cxPC, cxButtons, cxControls,
  cxContainer, cxEdit, ora, cxListBox, cxImageComboBox, ExtCtrls, cxMemo,
  cxRichEdit, OraSynonym, GenelDM, DB, DBQuery, MemDS, DBAccess, cxCheckBox;

type
  TSynonymsFrm = class(TForm)
    pc: TcxPageControl;
    tsSynonym: TcxTabSheet;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    ds: TDataSource;
    query: TOraQuery;
    cxGroupBox1: TcxGroupBox;
    btnCancel: TcxButton;
    btnExecute: TcxButton;
    cxGroupBox2: TcxGroupBox;
    Label2: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtName: TcxTextEdit;
    lcObjectSchema: TcxLookupComboBox;
    icbType: TcxImageComboBox;
    lbObject: TcxListBox;
    edtDBLink: TcxTextEdit;
    cbPublic: TcxCheckBox;
    cbDBLink: TcxComboBox;
    Bevel2: TBevel;
    procedure btnCancelClick(Sender: TObject);
    procedure icbTypePropertiesEditValueChanged(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure cbDBLinkClick(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
  private
    { Private declarations }
    FSynonymList : TSynonymList;
    FResult : boolean;
    function SetSynonymsDetail: boolean;
  public
    { Public declarations }
    function Init(ASynonymList : TSynonymList): boolean;

  end;

var
  SynonymsFrm: TSynonymsFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, OraScripts, Util,
     OraTable, OraStorage, OraView, VisualOptions;


function TSynonymsFrm.Init(ASynonymList : TSynonymList): boolean;
begin
  SynonymsFrm := TSynonymsFrm.Create(Application);
  Self := SynonymsFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FResult := false;
  FSynonymList := TSynonymList.Create;
  FSynonymList := ASynonymList;
  query.Session := FSynonymList.OraSession;

  dmGenel.ReLoad(FSynonymList.OraSession);

  lcObjectSchema.Text := FSynonymList.TableOwner;
  caption := 'Create Synonym for '+ FSynonymList.TableName;

  if FSynonymList.ObjectType = dbTable then
     icbType.ItemIndex := 0;

  if FSynonymList.ObjectType = dbView then
     icbType.ItemIndex := 1;

  if FSynonymList.ObjectType = dbFunctions then
     icbType.ItemIndex := 2;

  if FSynonymList.ObjectType = dbTypes then
     icbType.ItemIndex := 3;

  if FSynonymList.ObjectType = dbPackages then
     icbType.ItemIndex := 4;

  if FSynonymList.ObjectType = dbProcedures then
     icbType.ItemIndex := 5;

  if FSynonymList.ObjectType = dbSequences then
     icbType.ItemIndex := 6;

  ShowModal;
  result := FResult;
  Free;
end;

procedure TSynonymsFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TSynonymsFrm.icbTypePropertiesEditValueChanged(Sender: TObject);
var
  key: string;
begin
  query.Close;
  lbObject.Items.Clear;
  if icbType.Text = 'Table' then
  begin
    query.SQL.Text := GetTables(lcObjectSchema.Text);
    key := 'TABLE_NAME';
  end;

  if icbType.Text = 'View' then
  begin
    query.SQL.Text := GetViews(lcObjectSchema.Text);
    key := 'VIEW_NAME';
  end;
  if key = '' then exit;
  query.Open;
  while not query.Eof do
  begin
   lbObject.Items.Add(query.FieldByName(key).AsString);
   query.Next;
  end;

end;

function TSynonymsFrm.SetSynonymsDetail: boolean;
var
  FSynonym : TSynonym;
  i: integer;
  table: string;
begin
  result := true;
  while FSynonymList.SynonymCount > 0 do
     FSynonymList.SynonymDelete(0);
     
  if edtName.Text = '' then
  begin
    MessageDlg('Synonym Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  for i := 0 to lbObject.Count -1 do
    if lbObject.Selected[i] then
       table := lbObject.Items[i];

  if (table = '') and ((icbType.Text = 'Table') or (icbType.Text = 'View')) then
  begin
    MessageDlg('You must select a object', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;

  if FSynonymList.ObjectType in [dbSequences,dbProcedures,dbFunctions,dbTypes,dbPackages] then
     table := FSynonymList.TableName;

  if FSynonymList.TableOwner = '' then
     FSynonymList.TableOwner := lcObjectSchema.Text;

  if FSynonymList.TableName = '' then
     FSynonymList.TableName := table;
     
  new(FSynonym);
  FSynonym^.Owner := FSynonymList.TableOwner;
  FSynonym^.SynonymName := edtName.Text;
  FSynonym^.TableOwner := lcObjectSchema.Text;
  FSynonym^.TableName := table;
  if cbDBLink.Text = 'Remote' then
     FSynonym^.DDLink := edtDBLink.Text
  else
     FSynonym^.DDLink := '';
  FSynonym^.isPublic := cbPublic.Checked;

  FSynonymList.SynonymAdd(FSynonym);
end;


procedure TSynonymsFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetSynonymsDetail then AllowChange := false
       else redtDDL.Text := FSynonymList.GetDDL;
  end;
end;

procedure TSynonymsFrm.cbDBLinkClick(Sender: TObject);
begin
  edtDBLink.Enabled := cbDBLink.Text = 'Remote';
end;

procedure TSynonymsFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetSynonymsDetail then exit;
  redtDDL.Text := FSynonymList.GetDDL;
  if FSynonymList.CreateSynonym(redtDDL.Text) then
  begin
    FResult := true;
    close;
  end;
end;

end.
