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
