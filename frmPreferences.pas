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
unit frmPreferences;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxLabel, ExtCtrls, ComCtrls, StdCtrls, cxButtons, cxTreeView;

type
  TPreferencesFrm = class(TForm)
    Panel1: TPanel;
    pc: TPageControl;
    Panel2: TPanel;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    tsVisiual: TTabSheet;
    Panel3: TPanel;
    imgToolBar: TImage;
    imgObject: TImage;
    lblObjectName: TcxLabel;
    cxTreeView1: TcxTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreferencesFrm: TPreferencesFrm;

implementation

{$R *.dfm}

end.
