unit frmAlarmMaintenance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, MemDS,
  VirtualTable, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxGroupBox, StdCtrls, cxButtons, ExtCtrls, cxDropDownEdit,
  cxSpinEdit, cxImageComboBox, cxCheckBox, cxMaskEdit, cxLabel, cxTextEdit,
  cxMemo, cxListBox, cxDBEdit, cxRichEdit;

type
  TAlarmMaintenanceFrm = class(TForm)
    dsAlerts: TDataSource;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxGroupBox5: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxGroupBox6: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    btnAddAlert: TcxButton;
    btnDeleteAlert: TcxButton;
    GridDB: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxDBMemo1: TcxDBMemo;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBComboBox1: TcxDBComboBox;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBComboBox2: TcxDBComboBox;
    cxDBSpinEdit2: TcxDBSpinEdit;
    cxDBComboBox3: TcxDBComboBox;
    cxDBSpinEdit3: TcxDBSpinEdit;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    vtAlerts: TVirtualTable;
    vtAlertsTYPE: TStringField;
    vtAlertsNAME: TStringField;
    vtAlertsDESCRIPTION: TStringField;
    vtAlertsCRITICAL_IF: TStringField;
    vtAlertsCRITICAL_VALUE: TIntegerField;
    vtAlertsWARNING_IF: TStringField;
    vtAlertsWARNING_VALUE: TIntegerField;
    vtAlertsINFO_IF: TStringField;
    vtAlertsINFO_VALUE: TIntegerField;
    GridDBType: TcxGridDBColumn;
    GridDBName: TcxGridDBColumn;
    vtAlertsCRITICAL_STATUS: TSmallintField;
    vtAlertsWARNING_STATUS: TSmallintField;
    vtAlertsINFO_STATUS: TSmallintField;
    vtAlertsSQL: TStringField;
    cxGroupBox7: TcxGroupBox;
    cxDBMemo2: TcxDBMemo;
    cxGroupBox8: TcxGroupBox;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure vtEventsBeforePost(DataSet: TDataSet);
    procedure btnAddAlertClick(Sender: TObject);
    procedure btnDeleteAlertClick(Sender: TObject);
    procedure vtAlertsAfterPost(DataSet: TDataSet);
    procedure cxDBCheckBox1PropertiesChange(Sender: TObject);
    procedure cxDBCheckBox2PropertiesEditValueChanged(Sender: TObject);
    procedure cxDBCheckBox3PropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    procedure GetAlarms;
  public
    { Public declarations }
    procedure Init();
  end;

var
  AlarmMaintenanceFrm: TAlarmMaintenanceFrm;

implementation

{$R *.dfm}

uses VisualOptions, GenelDM;

procedure TAlarmMaintenanceFrm.Init();
begin
  AlarmMaintenanceFrm := TAlarmMaintenanceFrm.Create(Application);
  Self := AlarmMaintenanceFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);

  GetAlarms;
  
  ShowModal;

  free;
end;

procedure TAlarmMaintenanceFrm.btnOKClick(Sender: TObject);
begin
  if vtAlerts.State in [dsEdit,dsInsert] then
     vtAlerts.Post;
  vtAlerts.SaveToFile(ExtractFilePath(Application.ExeName)+'AlertEvents.vtd');
  close;
end;

procedure TAlarmMaintenanceFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TAlarmMaintenanceFrm.GetAlarms;
begin
  vtAlerts.Open;
  if FileExists(ExtractFilePath(Application.ExeName)+'AlertEvents.vtd') then
     vtAlerts.LoadFromFile(ExtractFilePath(Application.ExeName)+'AlertEvents.vtd');
  vtAlerts.First;
end;

procedure TAlarmMaintenanceFrm.vtEventsBeforePost(DataSet: TDataSet);
begin
  if vtAlerts.FieldByName('NAME').AsString = '' then
  begin
    MessageDlg('Alert Name must be specified', mtWarning, [mbOk], 0);
    Abort;
  end;

  if (vtAlerts.FieldByName('CRITICAL_IF').AsString = '') and (vtAlerts.FieldByName('CRITICAL_STATUS').AsString='1') then
  begin
    MessageDlg('Critical alert if must be specified', mtWarning, [mbOk], 0);
    Abort;
  end;

  if (vtAlerts.FieldByName('WARNING_IF').AsString = '') and (vtAlerts.FieldByName('WARNING_STATUS').AsString='1')  then
  begin
    MessageDlg('Warning alert if must be specified', mtWarning, [mbOk], 0);
    Abort;
  end;

  if (vtAlerts.FieldByName('INFO_IF').AsString = '') and (vtAlerts.FieldByName('INFO_STATUS').AsString='1')  then
  begin
    MessageDlg('Info alert if must be specified', mtWarning, [mbOk], 0);
    Abort;
  end;

  if (vtAlerts.FieldByName('SQL').AsString = '') then
  begin
    MessageDlg('SQL must be specified', mtWarning, [mbOk], 0);
    Abort;
  end;
end;

procedure TAlarmMaintenanceFrm.vtAlertsAfterPost(DataSet: TDataSet);
begin
  GridDB.OptionsSelection.CellSelect := False;
  GridDBName.Options.Editing := False;
end;

procedure TAlarmMaintenanceFrm.btnAddAlertClick(Sender: TObject);
begin
  vtAlerts.Append;
  GridDB.OptionsSelection.CellSelect := True;
  GridDBName.Options.Editing := True;
  vtAlerts.FieldByName('TYPE').AsString := 'SYSTEM';
end;

procedure TAlarmMaintenanceFrm.btnDeleteAlertClick(Sender: TObject);
begin
  if vtAlerts.FieldByName('TYPE').AsString = 'SYSTEM' then
  begin
    MessageDlg('You cannot delete this alert.', mtWarning, [mbOk], 0);
    exit;
  end;

  if MessageDlg('Are you sure you want to delete this alert ?', mtConfirmation, [mbYes, mbNo], 0) =  mrNo then exit;
   vtAlerts.Delete;
end;



procedure TAlarmMaintenanceFrm.cxDBCheckBox1PropertiesChange(
  Sender: TObject);
begin
  cxDBComboBox1.Enabled := cxDBCheckBox1.Checked;
  cxDBSpinEdit1.Enabled := cxDBCheckBox1.Checked;
end;

procedure TAlarmMaintenanceFrm.cxDBCheckBox2PropertiesEditValueChanged(
  Sender: TObject);
begin
  cxDBComboBox2.Enabled := cxDBCheckBox2.Checked;
  cxDBSpinEdit2.Enabled := cxDBCheckBox2.Checked;
end;

procedure TAlarmMaintenanceFrm.cxDBCheckBox3PropertiesEditValueChanged(
  Sender: TObject);
begin
  cxDBComboBox3.Enabled := cxDBCheckBox3.Checked;
  cxDBSpinEdit3.Enabled := cxDBCheckBox3.Checked;
end;

end.
