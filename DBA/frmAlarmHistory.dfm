object AlarmHistoryFrm: TAlarmHistoryFrm
  Left = 167
  Top = 150
  Width = 857
  Height = 548
  Caption = 'Alert History for TEST'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    000000000000CCCCCC0000000000CEEEEC0777777000CFFFFC7777777000CCCC
    CC0000000000000000000000000022222200000000002AAAA207777700002FFF
    F207777700002222220000000000000000000000000011111100000000001999
    9107777777001FFFF1077777770011111100000000000000000000000000C1FF
    000000030000000300000007000003FF0000C1FF00000007000000070000000F
    000003FF000081FF000000010000000100000003000003FF0000FFFF0000}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 473
    Width = 849
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnRefresh: TcxButton
      Left = 10
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Refresh'
      TabOrder = 0
      OnClick = btnRefreshClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnExport: TcxButton
      Left = 90
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Export...'
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
    end
    object btnClose: TcxButton
      Left = 170
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 2
      OnClick = btnCloseClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 38
    Width = 849
    Height = 435
    Align = alClient
    TabOrder = 1
    object GridDB: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = GridDBCustomDrawCell
      DataController.DataSource = dsAlertHistory
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      object GridDBEVENT_STATUS: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'EVENT_STATUS'
        Width = 64
      end
      object GridDBDATA_SOURCE: TcxGridDBColumn
        Caption = 'Datasource'
        DataBinding.FieldName = 'DATA_SOURCE'
        Width = 149
      end
      object GridDBALARM_DATE: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'ALERT_DATE'
        Width = 75
      end
      object GridDBALERT_TIME: TcxGridDBColumn
        Caption = 'Time'
        DataBinding.FieldName = 'ALERT_TIME'
        Width = 75
      end
      object GridDBALARM_TYPE: TcxGridDBColumn
        Caption = 'Type'
        DataBinding.FieldName = 'ALERT_TYPE'
        Width = 74
      end
      object GridDBEVENT_NAME: TcxGridDBColumn
        Caption = 'Alert'
        DataBinding.FieldName = 'EVENT_NAME'
        Width = 244
      end
      object GridDBEVENT_VALUE: TcxGridDBColumn
        Caption = 'Value'
        DataBinding.FieldName = 'EVENT_VALUE'
        Width = 166
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = GridDB
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 849
    Height = 38
    Align = alTop
    TabOrder = 2
    object cxLabel1: TcxLabel
      Left = 16
      Top = 10
      Caption = 'Alert From :'
    end
    object dedtFromDate: TcxDateEdit
      Left = 80
      Top = 8
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 116
    end
    object tedtFromTime: TcxTimeEdit
      Left = 200
      Top = 8
      EditValue = 0.000000000000000000
      TabOrder = 2
      Width = 73
    end
    object cxLabel2: TcxLabel
      Left = 304
      Top = 9
      Caption = 'To :'
    end
    object dedtToDate: TcxDateEdit
      Left = 328
      Top = 8
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 4
      Width = 117
    end
    object tedtToTime: TcxTimeEdit
      Left = 448
      Top = 8
      EditValue = 0.000000000000000000
      TabOrder = 5
      Width = 73
    end
    object lblLastRefreshTime: TcxLabel
      Left = 616
      Top = 10
      Caption = 'Last refresh at :'
    end
  end
  object vtAlertHistory: TVirtualTable
    FieldDefs = <
      item
        Name = 'ALERT_DATE'
        DataType = ftDate
      end
      item
        Name = 'ALERT_TIME'
        DataType = ftTime
      end
      item
        Name = 'ALERT_TYPE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'EVENT_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'EVENT_STATUS'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'EVENT_VALUE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATA_SOURCE'
        DataType = ftString
        Size = 100
      end>
    Left = 120
    Top = 184
    Data = {
      010007000A00414C4552545F44415445090000000A00414C4552545F54494D45
      0A0000000A00414C4552545F54595045010006000A004556454E545F4E414D45
      01001E000C004556454E545F53544154555301000A000B004556454E545F5641
      4C554501001E000B00444154415F534F5552434501006400000000000000}
    object vtAlertHistoryALERT_DATE: TDateField
      FieldName = 'ALERT_DATE'
    end
    object vtAlertHistoryALERT_TIME: TTimeField
      FieldName = 'ALERT_TIME'
    end
    object vtAlertHistoryALERT_TYPE: TStringField
      FieldName = 'ALERT_TYPE'
      Size = 6
    end
    object vtAlertHistoryEVENT_NAME: TStringField
      FieldName = 'EVENT_NAME'
      Size = 30
    end
    object vtAlertHistoryEVENT_STATUS: TStringField
      FieldName = 'EVENT_STATUS'
      Size = 10
    end
    object vtAlertHistoryEVENT_VALUE: TStringField
      FieldName = 'EVENT_VALUE'
      Size = 30
    end
    object vtAlertHistoryDATA_SOURCE: TStringField
      FieldName = 'DATA_SOURCE'
      Size = 100
    end
  end
  object dsAlertHistory: TDataSource
    DataSet = vtAlertHistory
    Left = 152
    Top = 184
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 24
    Top = 216
  end
  object qAlert: TOraQuery
    Left = 24
    Top = 176
  end
  object vtAlerts: TVirtualTable
    FieldDefs = <
      item
        Name = 'TYPE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRIPTION'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'CRITICAL_STATUS'
        DataType = ftSmallint
      end
      item
        Name = 'CRITICAL_IF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CRITICAL_VALUE'
        DataType = ftInteger
      end
      item
        Name = 'WARNING_STATUS'
        DataType = ftSmallint
      end
      item
        Name = 'WARNING_IF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'WARNING_VALUE'
        DataType = ftInteger
      end
      item
        Name = 'INFO_STATUS'
        DataType = ftSmallint
      end
      item
        Name = 'INFO_IF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'INFO_VALUE'
        DataType = ftInteger
      end
      item
        Name = 'SQL'
        DataType = ftString
        Size = 500
      end>
    Left = 120
    Top = 224
    Data = {
      01000D000400545950450100060004004E414D4501001E000B00444553435249
      5054494F4E0100F4010F00435249544943414C5F535441545553020000000B00
      435249544943414C5F4946010002000E00435249544943414C5F56414C554503
      0000000E005741524E494E475F535441545553020000000A005741524E494E47
      5F4946010002000D005741524E494E475F56414C5545030000000B00494E464F
      5F535441545553020000000700494E464F5F4946010002000A00494E464F5F56
      414C554503000000030053514C0100F401000000000000}
    object vtAlertsTYPE: TStringField
      FieldName = 'TYPE'
      Size = 6
    end
    object vtAlertsNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object vtAlertsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 500
    end
    object vtAlertsCRITICAL_STATUS: TSmallintField
      FieldName = 'CRITICAL_STATUS'
    end
    object vtAlertsCRITICAL_IF: TStringField
      FieldName = 'CRITICAL_IF'
      Size = 2
    end
    object vtAlertsCRITICAL_VALUE: TIntegerField
      FieldName = 'CRITICAL_VALUE'
    end
    object vtAlertsWARNING_STATUS: TSmallintField
      FieldName = 'WARNING_STATUS'
    end
    object vtAlertsWARNING_IF: TStringField
      FieldName = 'WARNING_IF'
      Size = 2
    end
    object vtAlertsWARNING_VALUE: TIntegerField
      FieldName = 'WARNING_VALUE'
    end
    object vtAlertsINFO_STATUS: TSmallintField
      FieldName = 'INFO_STATUS'
    end
    object vtAlertsINFO_IF: TStringField
      FieldName = 'INFO_IF'
      Size = 2
    end
    object vtAlertsINFO_VALUE: TIntegerField
      FieldName = 'INFO_VALUE'
    end
    object vtAlertsSQL: TStringField
      FieldName = 'SQL'
      Size = 500
    end
  end
end
