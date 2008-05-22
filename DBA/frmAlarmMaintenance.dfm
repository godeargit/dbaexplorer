object AlarmMaintenanceFrm: TAlarmMaintenanceFrm
  Left = 212
  Top = 94
  Width = 667
  Height = 564
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Alert Maintenance'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Caption = 'Alert Type'
    TabOrder = 0
    Height = 456
    Width = 281
    object btnAddAlert: TcxButton
      Left = 9
      Top = 424
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 0
      OnClick = btnAddAlertClick
    end
    object btnDeleteAlert: TcxButton
      Left = 89
      Top = 424
      Width = 75
      Height = 25
      Caption = 'Delete'
      TabOrder = 1
      OnClick = btnDeleteAlertClick
    end
    object cxGrid1: TcxGrid
      Left = 8
      Top = 16
      Width = 265
      Height = 401
      TabOrder = 2
      object GridDB: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsAlerts
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object GridDBType: TcxGridDBColumn
          DataBinding.FieldName = 'TYPE'
          Options.Editing = False
          Width = 47
        end
        object GridDBName: TcxGridDBColumn
          DataBinding.FieldName = 'NAME'
          Options.Editing = False
          Width = 202
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = GridDB
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 296
    Top = 228
    Caption = 'Alert Properties'
    TabOrder = 1
    Height = 237
    Width = 353
    object cxGroupBox4: TcxGroupBox
      Left = 8
      Top = 16
      Caption = 'Critical'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Height = 67
      Width = 337
      object cxLabel1: TcxLabel
        Left = 21
        Top = 39
        Caption = 'Alarm If'
      end
      object cxLabel2: TcxLabel
        Left = 136
        Top = 40
        Caption = 'Value'
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 18
        Top = 14
        Caption = 'Active Critical alert when'
        DataBinding.DataField = 'CRITICAL_STATUS'
        DataBinding.DataSource = dsAlerts
        Properties.Alignment = taLeftJustify
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Properties.OnChange = cxDBCheckBox1PropertiesChange
        TabOrder = 2
        Width = 185
      end
      object cxDBComboBox1: TcxDBComboBox
        Left = 64
        Top = 38
        DataBinding.DataField = 'CRITICAL_IF'
        DataBinding.DataSource = dsAlerts
        Enabled = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '>'
          '<'
          '>='
          '<='
          '='
          '<>')
        TabOrder = 3
        Width = 65
      end
      object cxDBSpinEdit1: TcxDBSpinEdit
        Left = 171
        Top = 38
        DataBinding.DataField = 'CRITICAL_VALUE'
        DataBinding.DataSource = dsAlerts
        Enabled = False
        TabOrder = 4
        Width = 81
      end
    end
    object cxGroupBox5: TcxGroupBox
      Left = 8
      Top = 88
      Caption = 'Warning'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Height = 67
      Width = 337
      object cxLabel3: TcxLabel
        Left = 21
        Top = 39
        Caption = 'Alarm If'
      end
      object cxLabel4: TcxLabel
        Left = 136
        Top = 40
        Caption = 'Value'
      end
      object cxDBComboBox2: TcxDBComboBox
        Left = 64
        Top = 38
        DataBinding.DataField = 'WARNING_IF'
        DataBinding.DataSource = dsAlerts
        Enabled = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '>'
          '<'
          '>='
          '<='
          '='
          '<>')
        TabOrder = 2
        Width = 65
      end
      object cxDBSpinEdit2: TcxDBSpinEdit
        Left = 171
        Top = 38
        DataBinding.DataField = 'WARNING_VALUE'
        DataBinding.DataSource = dsAlerts
        Enabled = False
        TabOrder = 3
        Width = 81
      end
      object cxDBCheckBox2: TcxDBCheckBox
        Left = 18
        Top = 14
        Caption = 'Active Warning alert when'
        DataBinding.DataField = 'WARNING_STATUS'
        DataBinding.DataSource = dsAlerts
        Properties.Alignment = taLeftJustify
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Properties.OnEditValueChanged = cxDBCheckBox2PropertiesEditValueChanged
        TabOrder = 4
        Width = 185
      end
    end
    object cxGroupBox6: TcxGroupBox
      Left = 8
      Top = 160
      Caption = 'Info'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Height = 67
      Width = 337
      object cxLabel5: TcxLabel
        Left = 21
        Top = 39
        Caption = 'Alarm If'
      end
      object cxLabel6: TcxLabel
        Left = 136
        Top = 40
        Caption = 'Value'
      end
      object cxDBComboBox3: TcxDBComboBox
        Left = 64
        Top = 38
        DataBinding.DataField = 'INFO_IF'
        DataBinding.DataSource = dsAlerts
        Enabled = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '>'
          '<'
          '>='
          '<='
          '='
          '<>')
        TabOrder = 2
        Width = 65
      end
      object cxDBSpinEdit3: TcxDBSpinEdit
        Left = 171
        Top = 38
        DataBinding.DataField = 'INFO_VALUE'
        DataBinding.DataSource = dsAlerts
        Enabled = False
        TabOrder = 3
        Width = 81
      end
      object cxDBCheckBox3: TcxDBCheckBox
        Left = 18
        Top = 14
        Caption = 'Active Info alert when'
        DataBinding.DataField = 'INFO_STATUS'
        DataBinding.DataSource = dsAlerts
        Properties.Alignment = taLeftJustify
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Properties.OnEditValueChanged = cxDBCheckBox3PropertiesEditValueChanged
        TabOrder = 4
        Width = 185
      end
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 295
    Top = 8
    Caption = 'Alert Description'
    TabOrder = 2
    Height = 105
    Width = 354
    object cxDBMemo1: TcxDBMemo
      Left = 8
      Top = 16
      DataBinding.DataField = 'DESCRIPTION'
      DataBinding.DataSource = dsAlerts
      TabOrder = 0
      Height = 81
      Width = 337
    end
  end
  object cxGroupBox7: TcxGroupBox
    Left = 295
    Top = 119
    Caption = 'SQL'
    TabOrder = 3
    Height = 105
    Width = 354
    object cxDBMemo2: TcxDBMemo
      Left = 8
      Top = 16
      DataBinding.DataField = 'SQL'
      DataBinding.DataSource = dsAlerts
      TabOrder = 0
      Height = 81
      Width = 337
    end
  end
  object cxGroupBox8: TcxGroupBox
    Left = 8
    Top = 469
    TabOrder = 4
    Height = 52
    Width = 643
    object btnCancel: TcxButton
      Left = 90
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnOK: TcxButton
      Left = 10
      Top = 14
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object dsAlerts: TDataSource
    DataSet = vtAlerts
    Left = 32
    Top = 264
  end
  object vtAlerts: TVirtualTable
    BeforePost = vtEventsBeforePost
    AfterPost = vtAlertsAfterPost
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
    Left = 64
    Top = 264
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
