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
unit frmAddLanguage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls, cxContainer, cxEdit,
  cxLabel;

type
  TAddLanguageFrm = class(TForm)
    Panel2: TPanel;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    Panel1: TPanel;
    imgToolBar: TImage;
    lblObjectName: TcxLabel;
    Shape1: TShape;
    lblAction: TLabel;
    Label1: TLabel;
    bedtLanguageFile: TcxButtonEdit;
    edtLanguageName: TcxTextEdit;
    OpenDialog: TOpenDialog;
    procedure btnCancelClick(Sender: TObject);
    procedure bedtLanguageFilePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Init(): string;
  end;

var
  AddLanguageFrm: TAddLanguageFrm;

implementation

uses GenelDM, VisualOptions;

{$R *.dfm}

function TAddLanguageFrm.Init(): string;
begin
  AddLanguageFrm := TAddLanguageFrm.Create(Application);
  Self := AddLanguageFrm;

  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  result := '';

  ShowModal;

  result := edtLanguageName.Text+'='+bedtLanguageFile.Text;
  Free;
end;

procedure TAddLanguageFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TAddLanguageFrm.bedtLanguageFilePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if OpenDialog.Execute then
     bedtLanguageFile.Text := OpenDialog.FileName;
end;

procedure TAddLanguageFrm.btnOKClick(Sender: TObject);
begin
  if edtLanguageName.Text = '' then
  begin
    MessageDlg('Language Name must be specified', mtWarning, [mbOk], 0);
    exit;
  end;
  close;
end;

end.
