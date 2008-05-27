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
unit frmDatabaseStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, DBAccess, Ora, cxSplitter,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, MemDS, GenelDM,
  ComCtrls, cxContainer, cxListView, dxStatusBar, OraBarConn, VirtualTable,
  cxGridCardView, cxGridChartView, cxGridDBChartView;

type
  TDatabaseStatusFrm = class(TForm)
    qStatus: TOraQuery;
    cxSplitter12: TcxSplitter;
    dsStatus: TDataSource;
    dxBarManager1: TdxBarManager;
    btnRefresh: TdxBarButton;
    btnClose: TdxBarButton;
    statusBar: TdxStatusBar;
    qTemp: TOraQuery;
    dsTemp: TDataSource;
    lviewStatus: TcxListView;
    qStatusDETAIL: TStringField;
    qStatusVALUE: TFloatField;
    gridTopSessions: TcxGrid;
    gridDBChart: TcxGridDBChartView;
    gridDBChartDataGroup1: TcxGridDBChartDataGroup;
    gridDBChartSeries1: TcxGridDBChartSeries;
    gridTopSessionsLevel2: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    FOraSession: TOraSession;
    FBarConnection : TBarConnection;
    procedure FillViewHorizontal(ViewName: TcxListView; SQLText: string; OraParams: TOraParams);
    procedure GetDetail;

  public
    { Public declarations }
    procedure Init(ABarConnection : TBarConnection);
  end;

var
  DatabaseStatusFrm: TDatabaseStatusFrm;

implementation

{$R *.dfm}

uses frmMain, DBQuery, OraSessions, util, OraDBA,  VisualOptions;

procedure TDatabaseStatusFrm.Init(ABarConnection : TBarConnection);
begin
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FBarConnection := ABarConnection;
  FOraSession := ABarConnection.Session;

  Caption := FBarConnection.Session.Server+'/'+FBarConnection.Session.UserName+' - '+'Database Status';
  statusBar.Panels[0].Text := FBarConnection.Session.Server+'/'+FBarConnection.Session.UserName;
  MainFrm.dxBarListWindows.Items.AddObject(Caption, Self);

  qTemp.Session := FOraSession;
  qStatus.Session := FOraSession;

  btnRefresh.Click;
end;

procedure TDatabaseStatusFrm.FillViewHorizontal(ViewName: TcxListView; SQLText: string; OraParams: TOraParams);
var
  i: integer;
begin
  qTemp.close;
  qTemp.SQL.Text := SQLText;
  qTemp.Prepare;

  if OraParams <> nil then
     qTemp.Params.AssignValues(OraParams);

  qTemp.Open;
  ViewName.Items.Clear;
  for i := 0 to qTemp.FieldCount -1 do
  begin
    with ViewName.Items.Add do
    begin
      Caption := FormatColumnName(qTemp.Fields[i].FieldName);
      ImageIndex := -1;
    end;
    ViewName.Items[ViewName.Items.count-1].SubItems.Add(qTemp.Fields[i].Text);
  end;
  qTemp.close;
end;

procedure TDatabaseStatusFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qTemp.close;
  qStatus.close;
  with MainFrm.dxBarListWindows.Items do
       Delete(IndexOfObject(Self));
  action := caFree;
end;

procedure TDatabaseStatusFrm.GetDetail;
begin
  qStatus.close;
  qStatus.SQL.Text := GetDB_SGA_Status;
  qStatus.Open;
end;

procedure TDatabaseStatusFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TDatabaseStatusFrm.btnRefreshClick(Sender: TObject);
begin
  FillViewHorizontal(lviewStatus, GetDBStatus, nil);
  GetDetail;
  statusBar.Panels[1].Text := 'Last refreshed at '+DateTimeToStr(Now); 
end;

end.
