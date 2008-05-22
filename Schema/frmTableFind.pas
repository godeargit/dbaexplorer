unit frmTableFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxLabel, cxEdit, cxTextEdit,
  StdCtrls, cxButtons, ExtCtrls, cxControls, cxContainer, cxListBox, jpeg, DB,
  MemDS, DBAccess, Ora, cxCheckBox, cxGroupBox, cxPC;

type
  TTableFindFrm = class(TForm)
    cxGroupBox2: TcxGroupBox;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    lbFields: TcxListBox;
    edtValue: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lbFilter: TcxListBox;
    btnAdd: TcxButton;
    btnDelete: TcxButton;
    cbCaseInsensitive: TcxCheckBox;
    cbPartialKey: TcxCheckBox;
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(QTable: TOraQuery; ActiveColumn: string);
  end;

var
  TableFindFrm: TTableFindFrm;

implementation

{$R *.dfm}

uses Util, Provider, VisualOptions, GenelDM;

procedure TTableFindFrm.Init(QTable: TOraQuery; ActiveColumn: string);
var
  i: integer;
  val: TStrings;
  field: string;
  Options: TLocateOptions;
begin
  TableFindFrm := TTableFindFrm.Create(Application);
  Self := TableFindFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  for i := 0 to QTable.FieldList.Count -1 do
  begin
    lbFields.Items.Add(QTable.FieldList[i].FieldName);
    if QTable.FieldList[i].FieldName = ActiveColumn then
       lbFields.ItemIndex := i;
  end;

  ShowModal;

  if ModalResult = mrOK then
  begin
    for i := 0 to lbFilter.Count -1 do
    begin
      field := field + copy( lbFilter.Items[i], 1, pos('=',lbFilter.Items[i])-1 );
      if i <> lbFilter.Count -1 then field := field + ';';
    end;

    val := TStringList.Create;
    for i := 0 to lbFilter.Count -1 do
      val.Add(copy( lbFilter.Items[i], pos('=',lbFilter.Items[i])+1, length(lbFilter.Items[i])));

    if cbCaseInsensitive.Checked then Options := Options + [loCaseInsensitive];
    if cbPartialKey.Checked then Options := Options + [loPartialKey];

    if not QTable.Locate(Field,VarArrayFromStrings(val),Options) then
       MessageDlg('No records match your search criteria.', mtInformation, [mbOK], 0);
  end;

  free;
end;

procedure TTableFindFrm.btnAddClick(Sender: TObject);
var
  i: integer;
begin
  if edtValue.Text = '' then
  begin
    MessageDlg('You must enter Field Value', mtInformation, [mbOK], 0);
    exit;
  end;

  for i := 0 to lbFields.Count-1 do
  begin
   if lbFields.Selected[i] then
      lbFilter.Items.Add(lbFields.Items[i]+'='+edtValue.Text);
  end;
  edtValue.Text := '';
end;

procedure TTableFindFrm.btnDeleteClick(Sender: TObject);
begin
  if lbFilter.Count < 1 then exit;
  lbFilter.DeleteSelected;
end;

end.
