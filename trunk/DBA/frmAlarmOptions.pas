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
unit frmAlarmOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLabel, cxRadioGroup, cxControls, cxContainer,
  cxEdit, cxGroupBox, cxCheckBox, cxSpinEdit, ExtCtrls, cxPC, cxMemo;

type
  TAlarmOptionsFrm = class(TForm)
    Panel2: TPanel;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    btnAlarmMaintence: TcxButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    cxLabel2: TcxLabel;
    sedtRefreshInterval: TcxSpinEdit;
    chkIconInSystemTray: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    rbDoNotLogAlarm: TcxRadioButton;
    rbLogAlarms: TcxRadioButton;
    cxLabel1: TcxLabel;
    bedtLogFileName: TcxButtonEdit;
    btnClearAlarmLog: TcxButton;
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxGroupBox4: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxGroupBox5: TcxGroupBox;
    cxMemo1: TcxMemo;
    chkSentToMail: TcxCheckBox;
    chkSentToSMS: TcxCheckBox;
    OpenDialog: TOpenDialog;
    cxLabel7: TcxLabel;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAlarmMaintenceClick(Sender: TObject);
    procedure rbDoNotLogAlarmClick(Sender: TObject);
    procedure rbLogAlarmsClick(Sender: TObject);
    procedure bedtLogFileNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnClearAlarmLogClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init();
  end;

var
  AlarmOptionsFrm: TAlarmOptionsFrm;

implementation

{$R *.dfm}

uses VisualOptions, frmAlarmMaintenance, AlarmOptions, GenelDM;

procedure TAlarmOptionsFrm.Init();
begin
  AlarmOptionsFrm := TAlarmOptionsFrm.Create(Application);
  Self := AlarmOptionsFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  AlertOptionsLoadFromIni;
  rbLogAlarms.Checked := AlertUseLogFile;
  bedtLogFileName.Text := AlertLogFileName;
  sedtRefreshInterval.Value := AlertRefreshInterval;
  chkIconInSystemTray.Checked := AlertShowSystemTrayIcon;
  chkSentToMail.Checked := AlertSentToMail;
  chkSentToSMS.Checked := AlertSentToSMS;

  ShowModal;

  free;
end;

procedure TAlarmOptionsFrm.btnOKClick(Sender: TObject);
begin
  AlertUseLogFile := rbLogAlarms.Checked;
  AlertLogFileName := bedtLogFileName.Text;
  AlertRefreshInterval := sedtRefreshInterval.Value;
  AlertShowSystemTrayIcon := chkIconInSystemTray.Checked;
  AlertSentToMail := chkSentToMail.Checked;
  AlertSentToSMS := chkSentToSMS.Checked;

  AlertOptionsSaveToIni;
  close;
end;

procedure TAlarmOptionsFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TAlarmOptionsFrm.btnAlarmMaintenceClick(Sender: TObject);
begin
  AlarmMaintenanceFrm.Init();
end;

procedure TAlarmOptionsFrm.rbDoNotLogAlarmClick(Sender: TObject);
begin
  bedtLogFileName.Enabled := False;
end;

procedure TAlarmOptionsFrm.rbLogAlarmsClick(Sender: TObject);
begin
  bedtLogFileName.Enabled := True;
end;

procedure TAlarmOptionsFrm.bedtLogFileNamePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  OpenDialog.FileName := bedtLogFileName.Text;
  if OpenDialog.Execute then
     bedtLogFileName.Text := OpenDialog.FileName;
end;

procedure TAlarmOptionsFrm.btnClearAlarmLogClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to clear alert logs ?', mtConfirmation, [mbYes, mbNo], 0) =  mrNo then exit;
   if DeleteFile(bedtLogFileName.Text) then
      MessageDlg('Alert Log file has been cleared', mtInformation, [mbOk], 0);
end;

end.
