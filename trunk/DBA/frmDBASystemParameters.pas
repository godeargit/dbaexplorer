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
unit frmDBASystemParameters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, jpeg, ExtCtrls, StdCtrls,
  cxButtons, cxCheckBox, cxGroupBox, cxRadioGroup, cxTextEdit, cxMemo,
  cxControls, cxContainer, cxEdit, cxPC, Ora;

type
  TDBASystemParametersFrm = class(TForm)
    Panel1: TPanel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    pc: TcxPageControl;
    tsParameters: TcxTabSheet;
    tsNLSParameters: TcxTabSheet;
    Image1: TImage;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    memCurrent: TcxMemo;
    memNew: TcxMemo;
    edtComment: TcxTextEdit;
    rgrpApplay: TcxRadioGroup;
    cxGroupBox2: TcxGroupBox;
    cboxSession: TcxCheckBox;
    cboxSystem: TcxCheckBox;
    cxGroupBox3: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    memCurrent2: TcxMemo;
    memNew2: TcxMemo;
    procedure cboxSystemPropertiesChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FParamType: integer;
    FOraSession: TOraSession;
    procedure SetType;
  public
    { Public declarations }
    procedure Init(ParamType: integer; Name, CurrentSetting, NewSetting, Comment,
                   Session, System: string;
                   AOraSession: TOraSession);
  end;

var
  DBASystemParametersFrm: TDBASystemParametersFrm;

implementation

{$R *.dfm}

uses frmDBA, util, VisualOptions, DBQuery, GenelDM;

procedure TDBASystemParametersFrm.Init(ParamType: integer; Name, CurrentSetting,
                                       NewSetting, Comment, Session, System: string;
                                       AOraSession: TOraSession);
begin
  DBASystemParametersFrm := TDBASystemParametersFrm.Create(Application);
  Self := DBASystemParametersFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  FOraSession := AOraSession;
  caption := Name;
  FParamType := ParamType;
  if ParamType = 1 then //Parameters
  begin
    pc.ActivePage := tsParameters;
    memCurrent.Text := CurrentSetting;
    memNew.Text := NewSetting;
    edtComment.Text := Comment;
    cboxSession.Checked := Session = 'YES';
    cboxSystem.Checked := System = 'YES';
    cboxSession.Enabled := Session = 'YES';
    cboxSystem.Enabled := System = 'YES';
    SetType;
  end;
  if ParamType = 2 then //NLSParameters
  begin
    pc.ActivePage := tsNLSParameters;
    memCurrent2.Text := CurrentSetting;
    memNew2.Text := NewSetting;
  end;

  ShowModal;
  Free;
end;

procedure TDBASystemParametersFrm.SetType;
begin
  rgrpApplay.Enabled := cboxSystem.Checked;
end; 

procedure TDBASystemParametersFrm.cboxSystemPropertiesChange(
  Sender: TObject);
begin
  SetType;
end;

procedure TDBASystemParametersFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TDBASystemParametersFrm.btnOKClick(Sender: TObject);
var
  s: string;
begin
  if FParamType = 1 then
  begin
    if memNew.Text = '' then
    begin
      MessageDlg('You must be enter New Setting', mtWarning, [mbOk], 0);
      Abort;
    end;

    if cboxSession.Checked then
       s := 'ALTER SESSION SET '+caption + ' = ' +memNew.Text;

    if cboxSystem.Checked then
       s := 'ALTER SYSTEM SET '+caption + ' = ' +memNew.Text;

    if cboxSystem.Checked then
    begin
      if edtComment.Text <> '' then
         s := s + ' Comment = '+Str(edtComment.Text);

      if rgrpApplay.ItemIndex = 0 then
         s := s + ' SCOPE = MEMORY ';
      if rgrpApplay.ItemIndex = 1 then
         s := s + ' SCOPE = spfile ';
      if rgrpApplay.ItemIndex = 2 then
         s := s + ' SCOPE = both ';

      s := s + ' sid=''*'' ';
    end;
  end; //FParamType

  if FParamType = 2 then
  begin
    if memNew2.Text = '' then
    begin
      MessageDlg('You must be enter New Setting', mtWarning, [mbOk], 0);
      Abort;
    end;
    s := 'ALTER SESSION SET '+caption + ' = '+memNew2.Text;
  end; //FParamType

  ExecSQL(s, 'System Altered', FOraSession);
  close;
end;

end.
