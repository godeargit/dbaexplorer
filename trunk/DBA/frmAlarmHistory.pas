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
unit frmAlarmHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, cxButtons, ExtCtrls, MemDS, VirtualTable, DBAccess, Ora,
  OraBarConn, cxSpinEdit, cxTimeEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxContainer, cxLabel;

type
  TAlarmHistoryFrm = class(TForm)
    Panel2: TPanel;
    btnRefresh: TcxButton;
    GridDB: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    vtAlertHistory: TVirtualTable;
    dsAlertHistory: TDataSource;
    GridDBALARM_DATE: TcxGridDBColumn;
    GridDBALARM_TYPE: TcxGridDBColumn;
    GridDBEVENT_NAME: TcxGridDBColumn;
    GridDBEVENT_STATUS: TcxGridDBColumn;
    GridDBEVENT_VALUE: TcxGridDBColumn;
    GridDBDATA_SOURCE: TcxGridDBColumn;
    Timer: TTimer;
    qAlert: TOraQuery;
    btnExport: TcxButton;
    btnClose: TcxButton;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    dedtFromDate: TcxDateEdit;
    tedtFromTime: TcxTimeEdit;
    cxLabel2: TcxLabel;
    dedtToDate: TcxDateEdit;
    tedtToTime: TcxTimeEdit;
    GridDBALERT_TIME: TcxGridDBColumn;
    vtAlerts: TVirtualTable;
    vtAlertsTYPE: TStringField;
    vtAlertsNAME: TStringField;
    vtAlertsDESCRIPTION: TStringField;
    vtAlertsCRITICAL_STATUS: TSmallintField;
    vtAlertsCRITICAL_IF: TStringField;
    vtAlertsCRITICAL_VALUE: TIntegerField;
    vtAlertsWARNING_STATUS: TSmallintField;
    vtAlertsWARNING_IF: TStringField;
    vtAlertsWARNING_VALUE: TIntegerField;
    vtAlertsINFO_STATUS: TSmallintField;
    vtAlertsINFO_IF: TStringField;
    vtAlertsINFO_VALUE: TIntegerField;
    vtAlertsSQL: TStringField;
    vtAlertHistoryALERT_DATE: TDateField;
    vtAlertHistoryALERT_TIME: TTimeField;
    vtAlertHistoryALERT_TYPE: TStringField;
    vtAlertHistoryEVENT_NAME: TStringField;
    vtAlertHistoryEVENT_STATUS: TStringField;
    vtAlertHistoryEVENT_VALUE: TStringField;
    vtAlertHistoryDATA_SOURCE: TStringField;
    lblLastRefreshTime: TcxLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRefreshClick(Sender: TObject);
    procedure GridDBCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    FOraSession: TOraSession;
    FBarConnection : TBarConnection;
    procedure ControlAlertEvents;
    procedure ControlEvent(sql, AlertType, EventName, EventStatus, EventIf: string; EventValue: integer);
    procedure AddEvent(AlertType, EventName, EventValue, EventStatus: string);
  public
    { Public declarations }
    procedure Init(ABarConnection : TBarConnection);
  end;

var
  AlarmHistoryFrm: TAlarmHistoryFrm;

implementation

{$R *.dfm}

uses frmMain, DBQuery, OraSessions, util, AlarmOptions,  VisualOptions,
  GenelDM;

procedure TAlarmHistoryFrm.Init(ABarConnection : TBarConnection);
begin
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FBarConnection := ABarConnection;
  FOraSession := ABarConnection.Session;
  Caption := 'Alert History for '+ FBarConnection.Session.Server;
  MainFrm.dxBarListWindows.Items.AddObject(Caption, Self);

  dedtFromDate.Date := Now; tedtFromTime.Time := StrToTime('00:00:00');
  dedtToDate.Date := Now; tedtToTime.Time := now;

  AlertOptionsLoadFromIni;
  vtAlertHistory.Open;
  AlertLogLoadFromFile(vtAlertHistory);

  Timer.Interval := AlertRefreshInterval * 1000;
  Timer.Enabled := True;

  qAlert.Session := FOraSession;

  btnRefresh.Click;
end;

procedure TAlarmHistoryFrm.TimerTimer(Sender: TObject);
begin
  ControlAlertEvents;
  lblLastRefreshTime.Caption := 'Last refresh at : '+DateTimeToStr(now);
end;

procedure TAlarmHistoryFrm.btnCloseClick(Sender: TObject);
begin
  AlertLogSaveToFile(vtAlertHistory);
  close;
end;

procedure TAlarmHistoryFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qAlert.close;
  with MainFrm.dxBarListWindows.Items do
       Delete(IndexOfObject(Self));
  Action := caFree;
end;

procedure TAlarmHistoryFrm.ControlAlertEvents;
begin
  vtAlerts.Open;
  if FileExists(ExtractFilePath(Application.ExeName)+'AlertEvents.vtd') then
     vtAlerts.LoadFromFile(ExtractFilePath(Application.ExeName)+'AlertEvents.vtd');
  vtAlerts.First;

  while not vtAlerts.Eof do
  begin
    if vtAlerts.FieldByName('CRITICAL_STATUS').AsString = '1' then
    begin
      ControlEvent(vtAlerts.FieldByName('SQL').AsString,
                   vtAlerts.FieldByName('TYPE').AsString,
                   vtAlerts.FieldByName('NAME').AsString,
                   'Critical',
                   vtAlerts.FieldByName('CRITICAL_IF').AsString,
                   vtAlerts.FieldByName('CRITICAL_VALUE').AsInteger);
    end;
    if vtAlerts.FieldByName('WARNING_STATUS').AsString = '1' then
    begin
      ControlEvent(vtAlerts.FieldByName('SQL').AsString,
                   vtAlerts.FieldByName('TYPE').AsString,
                   vtAlerts.FieldByName('NAME').AsString,
                   'Warning',
                   vtAlerts.FieldByName('WARNING_IF').AsString,
                   vtAlerts.FieldByName('WARNING_VALUE').AsInteger);
    end;
    if vtAlerts.FieldByName('INFO_STATUS').AsString = '1' then
    begin
      ControlEvent(vtAlerts.FieldByName('SQL').AsString,
                   vtAlerts.FieldByName('TYPE').AsString,
                   vtAlerts.FieldByName('NAME').AsString,
                   'Info',
                   vtAlerts.FieldByName('INFO_IF').AsString,
                   vtAlerts.FieldByName('INFO_VALUE').AsInteger);
    end;

    vtAlerts.next;
  end; //while
end;

procedure TAlarmHistoryFrm.ControlEvent(sql, AlertType, EventName, EventStatus, EventIf: string; EventValue: integer);
var
  ShowAlert: boolean;
begin
  ShowAlert := False;
  qAlert.close;
  qAlert.SQL.Text := SQL;
  try
    qAlert.Open;
    if EventIf = '>' then
       if qAlert.Fields[0].Value > EventValue then ShowAlert := True;
    if EventIf = '<' then
       if qAlert.Fields[0].Value < EventValue then ShowAlert := True;
    if EventIf = '>=' then
       if qAlert.Fields[0].Value >= EventValue then ShowAlert := True;
    if EventIf = '<=' then
       if qAlert.Fields[0].Value <= EventValue then ShowAlert := True;
    if EventIf = '=' then
       if qAlert.Fields[0].Value = EventValue then ShowAlert := True;
    if EventIf = '<>' then
       if qAlert.Fields[0].Value <> EventValue then ShowAlert := True;

  except
  end;  
  if ShowAlert then
    AddEvent(AlertType,
             EventName +' '+EventIf+' '+IntToStr(EventValue),
             IntToStr(qAlert.Fields[0].Value),
             EventStatus);
  qAlert.Close;           
end;

procedure TAlarmHistoryFrm.AddEvent(AlertType, EventName, EventValue, EventStatus: string);
begin
  if vtAlertHistory.Locate('EVENT_NAME;EVENT_VALUE',VarArrayOf([EventName,EventValue]), []) then exit;
  vtAlertHistory.Append;
  vtAlertHistory.FieldByName('ALERT_DATE').AsDateTime := Now;
  vtAlertHistory.FieldByName('ALERT_TIME').AsDateTime := Now;
  vtAlertHistory.FieldByName('ALERT_TYPE').AsString := AlertType; //System, User
  vtAlertHistory.FieldByName('EVENT_NAME').AsString := EventName;
  vtAlertHistory.FieldByName('EVENT_STATUS').AsString := EventStatus; //Critical, Warning, Info
  vtAlertHistory.FieldByName('EVENT_VALUE').AsString := EventValue;
  vtAlertHistory.FieldByName('DATA_SOURCE').AsString := FBarConnection.Session.Server;
  vtAlertHistory.Post;
  Beep;
end;  

procedure TAlarmHistoryFrm.btnRefreshClick(Sender: TObject);
begin
  vtAlertHistory.Filtered := false;
  vtAlertHistory.Filter := '(ALERT_DATE >= '+QuotedStr(dedtFromDate.Text)+') and (ALERT_TIME >= '+QuotedStr(tedtFromTime.Text)
                          +') and (ALERT_DATE <= '+QuotedStr(dedtToDate.Text)+') and (ALERT_TIME <= '+QuotedStr(tedtToTime.Text)+')';
  vtAlertHistory.Filtered := True;
end;

procedure TAlarmHistoryFrm.GridDBCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[0] = 'Critical' then
    ACanvas.Canvas.Brush.Color := clRed;
  if AViewInfo.GridRecord.Values[0] = 'Warning' then
    ACanvas.Canvas.Brush.Color := clYellow;
  if AViewInfo.GridRecord.Values[0] = 'Info' then
    ACanvas.Canvas.Brush.Color := clGreen;

  ACanvas.Canvas.FillRect(AViewInfo.Bounds);
end;




end.
