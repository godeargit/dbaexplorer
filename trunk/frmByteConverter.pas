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
unit frmByteConverter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxTextEdit, ExtCtrls, StdCtrls,
  cxMaskEdit, cxSpinEdit, cxButtons, cxControls, cxContainer, cxEdit,
  cxGroupBox;

type
  TByteConverterFrm = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxSpinEdit1: TcxSpinEdit;
    Label1: TLabel;
    cxSpinEdit2: TcxSpinEdit;
    Label2: TLabel;
    cxSpinEdit3: TcxSpinEdit;
    Label3: TLabel;
    cxSpinEdit4: TcxSpinEdit;
    Label4: TLabel;
    Shape1: TShape;
    Label5: TLabel;
    cxTextEdit1: TcxTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ByteConverterFrm: TByteConverterFrm;

implementation

{$R *.dfm}


{
1024 byte = 1 kilobyte
1024 kilobyte = 1 megabyte

1073741824 byte = 1 gigabyte

1 gigabyte = 1024 megabyte
}
end.
