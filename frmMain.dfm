object MainFrm: TMainFrm
  Left = 334
  Top = 244
  Width = 638
  Height = 446
  Caption = 'DBAExplorer for Oracle - Beta v1.1'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 393
    Width = 630
    Height = 19
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.AutoHint = True
        Width = 130
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ShowHint = True
    ParentShowHint = False
  end
  object Memo1: TMemo
    Left = 216
    Top = 208
    Width = 185
    Height = 89
    Lines.Strings = (
      'kullanicilarin kendi tanimlayacagi '
      'sqller olacak,  bu sqlleri '
      'tree seklinde saklayacak'
      'mesala adminlerin devamli kullandigi '
      'sqller'
      'oracle sql developer daki reports un '
      'altinda user defined '
      'reports gibi')
    TabOrder = 5
    Visible = False
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Main Menu'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 43
        FloatTop = 96
        FloatClientWidth = 132
        FloatClientHeight = 38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        IsMainMenu = True
        ItemLinks = <
          item
            Item = dxBarSubItemFile
            Visible = True
          end
          item
            Item = dxBarSubItem1
            Visible = True
          end
          item
            Item = dxBarSubItem3
            Visible = True
          end
          item
            Item = dxBarSubItem4
            Visible = True
          end
          item
            Item = dxBarSubItem2
            Visible = True
          end
          item
            Item = dxBarSubItemHelp
            Visible = True
          end
          item
            Item = dxBarSubItemWindow
            Visible = True
          end>
        MultiLine = True
        OneOnRow = True
        Row = 0
        UseOwnFont = True
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        Caption = 'Database'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 23
        DockingStyle = dsTop
        FloatLeft = 404
        FloatTop = 341
        FloatClientWidth = 46
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = barConnectDatabase
            Visible = True
          end
          item
            Item = MI_Disconnect
            Visible = True
          end
          item
            BeginGroup = True
            Item = MI_SchemaBrowser
            Visible = True
          end
          item
            Item = MI_SQLEditor
            Visible = True
          end>
        Name = 'Database'
        OneOnRow = False
        Row = 1
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        Caption = 'Connections'
        DockedDockingStyle = dsBottom
        DockedLeft = 46
        DockedTop = 0
        DockingStyle = dsBottom
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <>
        MultiLine = True
        Name = 'ConnectionBars'
        OneOnRow = False
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'Windows'
        DockedDockingStyle = dsBottom
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsBottom
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <>
        MultiLine = True
        Name = 'Windows'
        OneOnRow = False
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        Caption = 'DBA'
        DockedDockingStyle = dsTop
        DockedLeft = 120
        DockedTop = 23
        DockingStyle = dsTop
        FloatLeft = 328
        FloatTop = 378
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnSessions
            Visible = True
          end
          item
            Item = btnDBA
            Visible = True
          end>
        Name = 'DBA'
        OneOnRow = False
        Row = 1
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'Tool'
        DockedDockingStyle = dsTop
        DockedLeft = 189
        DockedTop = 23
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <>
        Name = 'Tool'
        OneOnRow = False
        Row = 1
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Menus'
      'Database'
      'Help'
      'Windows'
      'DBA'
      'View'
      'Tool'
      'Options')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True
      True
      True)
    HotImages = dmGenel.ilMain
    Images = dmGenel.ilMain
    DisabledLargeImages = dmGenel.ilMain
    LargeImages = dmGenel.imList
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = False
    Left = 70
    Top = 112
    DockControlHeights = (
      0
      0
      49
      26)
    object dxBarSubItemFile: TdxBarSubItem
      Caption = '&Database'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = barConnectDatabase
          Visible = True
        end
        item
          Item = MI_Disconnect
          Visible = True
        end
        item
          BeginGroup = True
          Item = MI_SchemaBrowser
          Visible = True
        end
        item
          Item = MI_SQLEditor
          Visible = True
        end
        item
          BeginGroup = True
          Item = btnExit
          Visible = True
        end>
    end
    object dxBarSubItemWindow: TdxBarSubItem
      Caption = '&Window'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarLargeButton1
          Visible = True
        end
        item
          Item = dxBarListWindows
          Visible = True
        end>
    end
    object dxBarSubItemHelp: TdxBarSubItem
      Caption = '&Help'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = btnAbout
          Visible = True
        end>
    end
    object dxBarListWindows: TdxBarListItem
      Caption = 'New Item'
      Category = 3
      Visible = ivAlways
      OnClick = dxBarListWindowsClick
      OnGetData = dxBarListWindowsGetData
      ShowCheck = True
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Arrange All'
      Category = 3
      Hint = 'Arrange All'
      Visible = ivAlways
    end
    object btnSessions: TdxBarButton
      Caption = 'Sessions...'
      Category = 4
      Hint = 'Sessions'
      Visible = ivAlways
      ImageIndex = 5
      OnClick = btnSessionsClick
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'DBA'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = btnDBA
          Visible = True
        end
        item
          Item = btnSessions
          Visible = True
        end
        item
          Item = btnDBStatus
          Visible = True
        end
        item
          BeginGroup = True
          Item = btnAlertOptions
          Visible = True
        end
        item
          Item = btnViewAlarms
          Visible = True
        end>
    end
    object btnDBA: TdxBarButton
      Caption = 'DBA...'
      Category = 4
      Hint = 'DBA'
      Visible = ivAlways
      ImageIndex = 1
      OnClick = btnDBAClick
    end
    object barConnectDatabase: TdxBarButton
      Caption = 'Connect'
      Category = 1
      Hint = 'Connect'
      Visible = ivAlways
      ImageIndex = 3
      OnClick = barConnectDatabaseClick
    end
    object MI_Disconnect: TdxBarButton
      Caption = 'Disconnect'
      Category = 1
      Hint = 'Disconnect'
      Visible = ivAlways
      ImageIndex = 4
      OnClick = MI_DisconnectClick
    end
    object MI_SQLEditor: TdxBarButton
      Caption = 'SQL Editor...'
      Category = 1
      Hint = 'SQL Editor'
      Visible = ivAlways
      ImageIndex = 2
      OnClick = MI_SQLEditorClick
    end
    object MI_SchemaBrowser: TdxBarButton
      Caption = 'Schema Browser...'
      Category = 1
      Hint = 'Schema Browser'
      Visible = ivAlways
      ImageIndex = 0
      OnClick = MI_SchemaBrowserClick
    end
    object btnExit: TdxBarButton
      Caption = 'Exit'
      Category = 1
      Hint = 'Exit'
      Visible = ivAlways
      OnClick = btnExitClick
    end
    object dxBarSubItem4: TdxBarSubItem
      Caption = 'View'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = btnUserReports
          Visible = True
        end
        item
          BeginGroup = True
          Item = bbtnDBMSOutput
          Visible = True
        end>
    end
    object btnUserReports: TdxBarButton
      Caption = 'User Reports...'
      Category = 5
      Enabled = False
      Hint = 'User Reports'
      Visible = ivAlways
    end
    object btnVisualOptions: TdxBarButton
      Caption = 'Visual Options...'
      Category = 7
      Hint = 'Visual Options'
      Visible = ivAlways
      ImageIndex = 8
      OnClick = btnVisualOptionsClick
    end
    object btnDBStatus: TdxBarButton
      Caption = 'Database Status...'
      Category = 4
      Hint = 'Database Status'
      Visible = ivAlways
      ImageIndex = 12
      OnClick = btnDBStatusClick
    end
    object btnFindInFiles: TdxBarButton
      Caption = 'Find In Files'
      Category = 6
      Enabled = False
      Hint = 'Find In Files'
      Visible = ivAlways
    end
    object btnDatabaseSearch: TdxBarButton
      Caption = 'Database Search'
      Category = 6
      Hint = 'Database Search'
      Visible = ivAlways
      OnClick = btnDatabaseSearchClick
    end
    object btnVisualCompare: TdxBarButton
      Caption = 'Visual Compare'
      Category = 6
      Hint = 'Visual Compare'
      Visible = ivAlways
      ImageIndex = 6
      OnClick = btnVisualCompareClick
    end
    object btnSQLPlus: TdxBarButton
      Caption = 'SQL Plus'
      Category = 6
      Enabled = False
      Hint = 'SQL Plus'
      Visible = ivAlways
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = 'Tools'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = btnFindInFiles
          Visible = True
        end
        item
          Item = btnDatabaseSearch
          Visible = True
        end
        item
          Item = btnVisualCompare
          Visible = True
        end
        item
          BeginGroup = True
          Item = btnExport
          Visible = True
        end
        item
          Item = btnImport
          Visible = True
        end
        item
          BeginGroup = True
          Item = btnSQLPlus
          Visible = True
        end>
    end
    object btnAlertOptions: TdxBarButton
      Caption = 'Alert Options...'
      Category = 4
      Hint = 'Alert Options'
      Visible = ivAlways
      ImageIndex = 10
      OnClick = btnAlertOptionsClick
    end
    object btnViewAlarms: TdxBarButton
      Caption = 'View Alert History...'
      Category = 4
      Hint = 'View Alert History'
      Visible = ivAlways
      ImageIndex = 7
      OnClick = btnViewAlarmsClick
    end
    object btnExport: TdxBarButton
      Caption = 'Export...'
      Category = 6
      Enabled = False
      Hint = 'Export'
      Visible = ivAlways
    end
    object btnImport: TdxBarButton
      Caption = 'Import...'
      Category = 6
      Enabled = False
      Hint = 'Import'
      Visible = ivAlways
    end
    object bbtnDBMSOutput: TdxBarButton
      Caption = 'DBMS Output...'
      Category = 5
      Hint = 'DBMS Output'
      Visible = ivAlways
      ImageIndex = 11
      OnClick = bbtnDBMSOutputClick
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'Options'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = btnVisualOptions
          Visible = True
        end
        item
          Item = btnEnvironmentOptions
          Visible = True
        end>
    end
    object btnAbout: TdxBarButton
      Caption = 'About'
      Category = 2
      Hint = 'About'
      Visible = ivAlways
    end
    object btnEnvironmentOptions: TdxBarButton
      Caption = 'Environment Options...'
      Category = 7
      Hint = 'Environment Options'
      Visible = ivAlways
      ImageIndex = 9
      OnClick = btnEnvironmentOptionsClick
    end
  end
  object dxBarPopupFormType: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Item = MI_SchemaBrowser
        Visible = True
      end
      item
        Item = MI_SQLEditor
        Visible = True
      end
      item
        Item = MI_Disconnect
        Visible = True
      end>
    UseOwnFont = False
    Left = 32
    Top = 112
  end
end
