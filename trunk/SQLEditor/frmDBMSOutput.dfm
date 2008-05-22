object DBMSOutputFrm: TDBMSOutputFrm
  Left = 279
  Top = 224
  Width = 696
  Height = 480
  Caption = 'DBMS Output'
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
    0000010000000000000019100000000000019991000000777719999910000777
    8199999991000788111199911110078888819991000007788FF1999100000788
    FFF111110000078888887777000007788FF8877700000788FFF8877700000777
    774444470000077788F887740000077788F8877470000007774444770000FFBF
    0000FF1F0000FE0F0000C0070000800300008001000080070000800700008007
    0000800700008007000080070000800700008007000080070000E00F0000}
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object redtDBMS_output: TcxRichEdit
    Left = 0
    Top = 26
    Align = alClient
    ParentFont = False
    Properties.ScrollBars = ssBoth
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 4
    Height = 400
    Width = 688
  end
  object statusBar: TdxStatusBar
    Left = 0
    Top = 426
    Width = 688
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'DBMS_OUTPUT'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 111
        FloatClientHeight = 57
        ItemLinks = <
          item
            Item = btnClose
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnTurnOutputOn
            Visible = True
          end
          item
            Item = btnClearWindows
            Visible = True
          end
          item
            Item = btnSetBufferSize
            Visible = True
          end
          item
            Item = btnSaveToFile
            Visible = True
          end
          item
            Item = btnFrequency
            UserDefine = [udWidth]
            UserWidth = 61
            Visible = True
          end
          item
            Item = lblSeconds
            Visible = True
          end>
        Name = 'DBMS_OUTPUT'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default'
      'DBMS_OUTPUT')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    HotImages = dmGenel.imBarIcons
    Images = dmGenel.ilSQLEditor
    DisabledImages = dmGenel.imBarIcons
    PopupMenuLinks = <>
    Style = bmsStandard
    UseSystemFont = True
    Left = 32
    Top = 75
    DockControlHeights = (
      0
      0
      26
      0)
    object btnTurnOutputOn: TdxBarButton
      Caption = 'New Item'
      Category = 1
      Hint = 'Turn Output On/Off'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 9
      OnClick = btnTurnOutputOnClick
    end
    object btnClearWindows: TdxBarButton
      Caption = 'Clear the output window'
      Category = 1
      Hint = 'Clear the output window'
      Visible = ivAlways
      ImageIndex = 19
      OnClick = btnClearWindowsClick
    end
    object btnSetBufferSize: TdxBarButton
      Caption = 'Set Output buffer size'
      Category = 1
      Hint = 'Set Output buffer size'
      Visible = ivAlways
      ImageIndex = 11
      OnClick = btnSetBufferSizeClick
    end
    object btnSaveToFile: TdxBarButton
      Caption = 'Save To File'
      Category = 1
      Hint = 'Save To File'
      Visible = ivAlways
      ImageIndex = 14
      OnClick = btnSaveToFileClick
    end
    object lblSeconds: TdxBarStatic
      Caption = 'Seconds refresh rate'
      Category = 1
      Hint = 'Seconds refresh rate'
      Visible = ivAlways
      LeftIndent = 1
    end
    object btnFrequency: TdxBarSpinEdit
      Caption = 'Change interval between queries for DBMS output data '
      Category = 1
      Hint = 'Change interval between queries for DBMS output data '
      Visible = ivAlways
      MaxLength = 2
      Width = 100
      MaxValue = 12.000000000000000000
      MinValue = 2.000000000000000000
      Value = 2.000000000000000000
    end
    object btnClose: TdxBarButton
      Caption = 'Close'
      Category = 1
      Hint = 'Close'
      Visible = ivAlways
      ImageIndex = 45
      OnClick = btnCloseClick
    end
  end
  object tDbMS_output: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = tDbMS_outputTimer
    Left = 16
    Top = 32
  end
  object sdDBMS: TSaveDialog
    Filter = 'Text Files|*.txt|All Files|*.*'
    Left = 72
    Top = 280
  end
  object spDbms_output: TOraStoredProc
    StoredProcName = 'dbms_output.get_line'
    SQL.Strings = (
      'begin'
      '  dbms_output.get_line(:LINE, :STATUS);'
      'end;')
    Left = 104
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'LINE'
        ParamType = ptOutput
        Value = ''
      end
      item
        DataType = ftFloat
        Name = 'STATUS'
        ParamType = ptOutput
        Value = 1.000000000000000000
      end>
  end
end
