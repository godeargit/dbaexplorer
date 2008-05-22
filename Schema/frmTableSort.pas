unit frmTableSort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxLabel, jpeg, ExtCtrls, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxGroupBox, cxRadioGroup,
  OraStorage ;

type
  TTableSortFrm = class(TForm)
    rgSort: TcxRadioGroup;
    Panel1: TPanel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    Image2: TImage;
    cxLabel1: TcxLabel;
    lblColumn: TcxLabel;
    Panel2: TPanel;
    imgToolBar: TImage;
    lblDescription: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    function Init(ColumnName: string; var ColumnSort: TSort): boolean;
  end;

var
  TableSortFrm: TTableSortFrm;

implementation

{$R *.dfm}
uses VisualOptions, GenelDM;

function TTableSortFrm.Init(ColumnName: string; var ColumnSort: TSort): boolean;
begin
  TableSortFrm := TTableSortFrm.Create(Application);
  Self := TableSortFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  rgSort.ItemIndex := Integer(Columnsort);
  lblColumn.Caption := ColumnName;

  ShowModal;

  ColumnSort := TSort(rgSort.ItemIndex);

  result := ModalResult = mrOK ;
  free;
end;

end.
