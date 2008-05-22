object SQLEditorFrm: TSQLEditorFrm
  Left = 198
  Top = 165
  Width = 836
  Height = 493
  Caption = 'SQLEditorFrm'
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
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000007
    000000000000007000000002A0000FF0770FF000A0000FF78830F2AAAAA00FFF
    3FB30222A0220FFF78FB30F2A0000FFFF78FB30222000FFFFF37FB3000000FFF
    FF438FB000000F44FF4F380880000FFF4F4F438F01000FF4FFF4FF0099100F4F
    FFFFFF0077800FF44FFFFF0000000FFFFFFFFF0000000000000000000000CFE3
    0000800300008000000080000000800000008003000080030000800F00008007
    00008003000080010000800000008020000080310000803F0000FFFF0000}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    828
    459)
  PixelsPerInch = 96
  TextHeight = 13
  object dsHost: TdxDockSite
    Left = 0
    Top = 0
    Width = 828
    Height = 459
    Align = alClient
    DockType = 0
    OriginalWidth = 828
    OriginalHeight = 459
    object dxLayoutDockSite2: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 772
      Height = 431
      DockType = 1
      OriginalWidth = 300
      OriginalHeight = 200
      object dxLayoutDockSite4: TdxLayoutDockSite
        Left = 0
        Top = 0
        Width = 772
        Height = 431
        DockType = 1
        OriginalWidth = 300
        OriginalHeight = 200
        object dxLayoutDockSite1: TdxLayoutDockSite
          Left = 0
          Top = 0
          Width = 772
          Height = 431
          DockType = 1
          OriginalWidth = 300
          OriginalHeight = 200
          object dxLayoutDockSite3: TdxLayoutDockSite
            Left = 0
            Top = 0
            Width = 772
            Height = 431
            DockType = 1
            OriginalWidth = 300
            OriginalHeight = 200
          end
          object DockObjectsPanel: TdxDockPanel
            Left = 0
            Top = 0
            Width = 772
            Height = 431
            AllowFloating = True
            AutoHide = False
            Caption = 'DockObjectsPanel'
            CaptionButtons = []
            Dockable = False
            ShowCaption = False
            DockType = 1
            OriginalWidth = 185
            OriginalHeight = 140
            object pcSQLEditor: TcxPageControl
              Left = 0
              Top = 26
              Width = 768
              Height = 381
              Align = alClient
              Style = 10
              TabOrder = 0
              ClientRectBottom = 381
              ClientRectRight = 768
              ClientRectTop = 0
            end
            object dxBarDockControl2: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 768
              Height = 26
              Align = dalTop
              BarManager = dxBarManager1
            end
            object editorStatusBar: TdxStatusBar
              Left = 0
              Top = 407
              Width = 768
              Height = 20
              Images = ilStatusBarImages
              Panels = <
                item
                  PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                  MinWidth = 20
                  Width = 130
                end
                item
                  PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                  Width = 100
                end
                item
                  PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                  Width = 100
                end
                item
                  PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                  Width = 150
                end
                item
                  PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                  Width = 100
                end
                item
                  PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
                  PanelStyle.Container = editorStatusBarContainer5
                  Width = 100
                end
                item
                  PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              object editorStatusBarContainer5: TdxStatusBarContainerControl
                Left = 601
                Top = 3
                Width = 100
                Height = 16
                object progressQueryRunning: TcxProgressBar
                  Left = 0
                  Top = 0
                  Align = alClient
                  Properties.Max = 10.000000000000000000
                  Properties.OverloadValue = 10.000000000000000000
                  Properties.PeakSize = 10
                  Properties.ShowText = False
                  Style.BorderColor = clBtnFace
                  TabOrder = 0
                  Width = 100
                end
              end
            end
          end
        end
        object dpObjectPalet: TdxDockPanel
          Left = 0
          Top = 0
          Width = 204
          Height = 0
          Visible = False
          AllowFloating = True
          AutoHide = True
          Caption = 'Object Palet'
          ImageIndex = 36
          AutoHidePosition = 2
          DockType = 4
          OriginalWidth = 204
          OriginalHeight = 261
          object cxGroupBox1: TcxGroupBox
            Left = 0
            Top = 0
            Align = alTop
            Style.BorderStyle = ebsUltraFlat
            Style.Shadow = False
            TabOrder = 0
            Transparent = True
            Height = 71
            Width = 200
            object Label4: TLabel
              Left = 4
              Top = 18
              Width = 28
              Height = 13
              Caption = 'User :'
              Transparent = True
            end
            object lcbObjectUserName: TcxLookupComboBox
              Left = 40
              Top = 14
              Properties.KeyFieldNames = 'USERNAME'
              Properties.ListColumns = <
                item
                  FieldName = 'USERNAME'
                end>
              Properties.ListSource = dmGenel.dsSchema
              TabOrder = 0
              Width = 153
            end
            object dxBarDockControl3: TdxBarDockControl
              Left = 2
              Top = 43
              Width = 196
              Height = 26
              Align = dalBottom
              BarManager = dxBarManager1
            end
          end
          object cxSplitter2: TcxSplitter
            Left = 0
            Top = -134
            Width = 200
            Height = 8
            HotZoneClassName = 'TcxXPTaskBarStyle'
            AlignSplitter = salBottom
            Control = tlObjectColumns
          end
          object tlObjectBrowser: TcxTreeList
            Left = 0
            Top = 71
            Width = 200
            Height = 78
            Align = alClient
            Bands = <
              item
              end>
            BufferedPaint = False
            DragMode = dmAutomatic
            LookAndFeel.Kind = lfOffice11
            OptionsBehavior.ConfirmDelete = False
            OptionsData.CancelOnExit = False
            OptionsData.Editing = False
            OptionsData.Deleting = False
            OptionsSelection.MultiSelect = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.Headers = False
            TabOrder = 2
            OnCanSelectNode = tlObjectBrowserCanSelectNode
            object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
              DataBinding.ValueType = 'String'
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
          end
          object tlObjectColumns: TcxTreeList
            Left = 0
            Top = -126
            Width = 200
            Height = 126
            Align = alBottom
            Bands = <
              item
              end>
            BufferedPaint = False
            DragMode = dmAutomatic
            LookAndFeel.Kind = lfOffice11
            OptionsBehavior.ConfirmDelete = False
            OptionsData.CancelOnExit = False
            OptionsData.Editing = False
            OptionsData.Deleting = False
            OptionsSelection.MultiSelect = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.ShowRoot = False
            TabOrder = 3
            object cxTreeListColumn1: TcxTreeListColumn
              Caption.Text = 'Columns'
              DataBinding.ValueType = 'String'
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
              Caption.Text = 'Data Types'
              DataBinding.ValueType = 'String'
              Position.ColIndex = 1
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
          end
        end
      end
      object dpSQLRecallList: TdxDockPanel
        Left = -241
        Top = 0
        Width = 241
        Height = 0
        Visible = False
        AllowFloating = True
        AutoHide = True
        Caption = 'SQL Recall List'
        ImageIndex = 33
        AutoHidePosition = 0
        DockType = 2
        OriginalWidth = 241
        OriginalHeight = 140
        object dxBarDockControl1: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 237
          Height = 79
          Align = dalTop
          BarManager = dxBarManager1
        end
        object pcSQLRecall: TcxPageControl
          Left = 0
          Top = 79
          Width = 237
          Height = 204
          ActivePage = tsAllSQL
          Align = alClient
          Style = 8
          TabOrder = 1
          ClientRectBottom = 204
          ClientRectRight = 237
          ClientRectTop = 24
          object tsAllSQL: TcxTabSheet
            Caption = 'All SQL'
            ImageIndex = 0
            object gridSQLRecall: TcxGrid
              Left = 0
              Top = 0
              Width = 237
              Height = 180
              Align = alClient
              TabOrder = 0
              LookAndFeel.NativeStyle = True
              object gridSQLRecallDB: TcxGridDBCardView
                DragMode = dmAutomatic
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dmGenel.dsSQLRecall
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                LayoutDirection = ldVertical
                OptionsCustomize.LayeredRows = True
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CardBorderSelection = False
                OptionsView.CardAutoWidth = True
                OptionsView.CardBorderWidth = 1
                OptionsView.CardWidth = 1000
                OptionsView.CategorySeparatorWidth = 0
                OptionsView.CellAutoHeight = True
                OptionsView.SeparatorWidth = 0
                RowLayout = rlVertical
                Styles.StyleSheet = CardsStyleSheet
                object gridSQLRecallDBLAST_EXEC: TcxGridDBCardViewRow
                  Caption = 'Last Exec'
                  DataBinding.FieldName = 'LAST_EXEC'
                  Position.BeginsLayer = True
                  SortIndex = 0
                  SortOrder = soDescending
                  Styles.Content = styleSelection
                  Styles.Caption = styleSelection
                  Styles.CaptionRow = styleSelection
                  Styles.CategoryRow = styleSelection
                end
                object gridSQLRecallDBCONNECTION: TcxGridDBCardViewRow
                  Caption = 'Connection'
                  DataBinding.FieldName = 'CONNECTION'
                  Position.BeginsLayer = False
                  Styles.Content = styleCategoryRow
                  Styles.Caption = styleCategoryRow
                  Styles.CategoryRow = styleCategoryRow
                end
                object gridSQLRecallDBHISTORY_ID: TcxGridDBCardViewRow
                  DataBinding.FieldName = 'HISTORY_ID'
                  Visible = False
                  Position.BeginsLayer = False
                end
                object gridSQLRecallDBSQL: TcxGridDBCardViewRow
                  DataBinding.FieldName = 'SQL'
                  RepositoryItem = cxEditRepositoryMemoItem1
                  Position.BeginsLayer = False
                end
              end
              object gridSQLRecallLevel2: TcxGridLevel
                Caption = 'Vertical Row Layout + Vertical Card Layout'
                GridView = gridSQLRecallDB
              end
            end
          end
          object tsSingleSQL: TcxTabSheet
            Caption = 'Single SQL'
            ImageIndex = 1
            object redtSQLRecall: TcxDBRichEdit
              Left = 0
              Top = 0
              Align = alClient
              DataBinding.DataField = 'SQL'
              DataBinding.DataSource = dmGenel.dsSQLRecall
              Properties.ReadOnly = True
              Properties.ScrollBars = ssBoth
              Properties.WordWrap = False
              TabOrder = 0
              Height = 180
              Width = 237
            end
          end
        end
      end
    end
    object dpOutput: TdxDockPanel
      Left = 0
      Top = 0
      Width = 0
      Height = 154
      Visible = False
      AllowFloating = True
      AutoHide = True
      Caption = 'Output'
      ImageIndex = 8
      AutoHidePosition = 3
      DockType = 5
      OriginalWidth = 179
      OriginalHeight = 154
      object lvOutput: TcxListView
        Left = 0
        Top = 0
        Width = 0
        Height = 150
        Align = alClient
        Columns = <
          item
            Caption = 'Connection'
            Width = 200
          end
          item
            Caption = 'Time'
            Width = 100
          end
          item
            AutoSize = True
            Caption = 'Description'
            WidthType = (
              -300)
          end>
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
  object dxDockingManager1: TdxDockingManager
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Images = dmGenel.ilSQLEditor
    Options = [doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doTabContainerHasCaption, doTabContainerCanAutoHide, doSideContainerCanClose, doSideContainerCanAutoHide, doTabContainerCanInSideContainer]
    ViewStyle = vsStandard
    Left = 320
    Top = 104
  end
  object TimerConnected: TTimer
    Enabled = False
    OnTimer = TimerConnectedTimer
    Left = 295
    Top = 213
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'FileBar'
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 334
        FloatTop = 278
        FloatClientWidth = 23
        FloatClientHeight = 88
        ItemLinks = <
          item
            Item = btnNewQuery
            Visible = True
          end
          item
            Item = btnOpenQuery
            Visible = True
          end
          item
            Item = btnDeleteQuery
            Visible = True
          end
          item
            Item = btnSaveQuery
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnPrint
            Visible = True
          end>
        Name = 'FileBar'
        OneOnRow = False
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'SQLBar'
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 134
        DockedTop = 0
        FloatLeft = 378
        FloatTop = 378
        FloatClientWidth = 23
        FloatClientHeight = 154
        ItemLinks = <
          item
            Item = btnExecute
            Visible = True
          end
          item
            Item = btnStop
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnCommit
            Visible = True
          end
          item
            Item = btnRollback
            Visible = True
          end
          item
            Item = btnExplainPlan
            Visible = True
          end
          item
            Item = btnQueryBuilder
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnPriorSQL
            Visible = True
          end
          item
            Item = btnNextSQL
            Visible = True
          end>
        Name = 'SQLBar'
        OneOnRow = False
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'FortmatBar'
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 343
        DockedTop = 0
        FloatLeft = 378
        FloatTop = 378
        FloatClientWidth = 67
        FloatClientHeight = 110
        ItemLinks = <
          item
            Item = btnUndo
            Visible = True
          end
          item
            Item = btnRedo
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnBullet
            Visible = True
          end
          item
            Item = btnAlignLeft
            Visible = True
          end
          item
            Item = btnAlignCenter
            Visible = True
          end
          item
            Item = btnAlignRight
            Visible = True
          end
          item
            Item = btnUnIndent
            Visible = True
          end
          item
            Item = btnIndent
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnCut
            Visible = True
          end
          item
            Item = btnCopy
            Visible = True
          end
          item
            Item = btnPaste
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnClear
            Visible = True
          end
          item
            Item = btnSelectAll
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnFindText
            Visible = True
          end
          item
            Item = btnReplace
            Visible = True
          end>
        Name = 'FortmatBar'
        OneOnRow = False
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'ObjectPalet'
        DockControl = dxBarDockControl3
        DockedDockControl = dxBarDockControl3
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 66
        ItemLinks = <
          item
            Item = btnObjectRefresh
            Visible = True
          end
          item
            Item = btnObjectShowColumns
            Visible = True
          end
          item
            Item = edtObjectFilter
            UserDefine = [udWidth]
            UserWidth = 120
            Visible = True
          end>
        Name = 'ObjectPalet'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'SQLRecallList'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnSQLRecallSave
            Visible = True
          end
          item
            Item = btnSQLRecallOpen
            Visible = True
          end
          item
            Item = btnSQLRecallToSQLEditor
            Visible = True
          end
          item
            Item = btnSQLRecallDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnSQLRecallFirst
            Visible = True
          end
          item
            Item = btnSQLRecallPrior
            Visible = True
          end
          item
            Item = btnSQLRecallNext
            Visible = True
          end
          item
            Item = btnSQLRecallLast
            Visible = True
          end
          item
            Item = btnSQLRecalType
            Visible = True
          end
          item
            BeginGroup = True
            Item = edtSQLRecallFilter
            UserDefine = [udWidth]
            UserWidth = 137
            Visible = True
          end>
        MultiLine = True
        Name = 'SQLRecallList'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default'
      'FormatBar'
      'FileBar'
      'ObjectPalet'
      'SQLRecallList')
    Categories.ItemsVisibles = (
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
      True)
    HotImages = dmGenel.ilSQLEditor
    Images = dmGenel.ilSQLEditor
    LargeImages = dmGenel.ilSQLEditor
    NotDocking = [dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsStandard
    UseSystemFont = True
    Left = 288
    Top = 104
    DockControlHeights = (
      0
      0
      0
      0)
    object btnSaveQuery: TdxBarButton
      Caption = 'Save Query'
      Category = 2
      Hint = 'Save Query'
      Visible = ivAlways
      ImageIndex = 14
      ShortCut = 16467
      OnClick = btnSaveQueryClick
    end
    object btnExecute: TdxBarButton
      Caption = 'Execute'
      Category = 0
      Hint = 'Execute'
      Visible = ivAlways
      ImageIndex = 23
      ShortCut = 120
      OnClick = btnExecuteClick
    end
    object btnNewQuery: TdxBarButton
      Caption = 'New Query'
      Category = 2
      Hint = 'New Query'
      Visible = ivAlways
      ImageIndex = 15
      OnClick = btnNewQueryClick
    end
    object btnOpenQuery: TdxBarButton
      Caption = 'Open Query'
      Category = 2
      Hint = 'Open Query'
      Visible = ivAlways
      ImageIndex = 16
      ShortCut = 16463
      OnClick = btnOpenQueryClick
    end
    object btnDeleteQuery: TdxBarButton
      Caption = 'Delete Query'
      Category = 2
      Hint = 'Delete Query'
      Visible = ivAlways
      ImageIndex = 35
      OnClick = btnDeleteQueryClick
    end
    object btnCommit: TdxBarButton
      Caption = 'Commit'
      Category = 0
      Hint = 'Commit'
      Visible = ivAlways
      ImageIndex = 20
      OnClick = btnCommitClick
    end
    object btnRollback: TdxBarButton
      Caption = 'Rollback'
      Category = 0
      Hint = 'Rollback'
      Visible = ivAlways
      ImageIndex = 21
      OnClick = btnRollbackClick
    end
    object btnExplainPlan: TdxBarButton
      Caption = 'Explain Plan'
      Category = 0
      Hint = 'Explain Plan'
      Visible = ivAlways
      ImageIndex = 25
      OnClick = btnExplainPlanClick
    end
    object btnNextSQL: TdxBarButton
      Caption = 'Next SQL'
      Category = 0
      Hint = 'Next SQL'
      Visible = ivAlways
      ImageIndex = 44
      OnClick = btnNextSQLClick
    end
    object btnPriorSQL: TdxBarButton
      Caption = 'Prior SQL'
      Category = 0
      Hint = 'Prior SQL'
      Visible = ivAlways
      ImageIndex = 43
      OnClick = btnPriorSQLClick
    end
    object btnQueryBuilder: TdxBarButton
      Caption = 'Query Builder'
      Category = 0
      Hint = 'Query Builder'
      Visible = ivAlways
      ImageIndex = 9
    end
    object btnUndo: TdxBarButton
      Caption = 'Undo'
      Category = 1
      Hint = 'Undo'
      Visible = ivAlways
      ImageIndex = 4
      OnClick = btnUndoClick
    end
    object btnRedo: TdxBarButton
      Caption = 'Redo'
      Category = 1
      Hint = 'Redo'
      Visible = ivAlways
      ImageIndex = 5
      OnClick = btnRedoClick
    end
    object btnFindText: TdxBarButton
      Caption = 'Find Text'
      Category = 1
      Hint = 'Find Text'
      Visible = ivAlways
      ImageIndex = 12
      OnClick = btnFindTextClick
    end
    object btnBullet: TdxBarButton
      Caption = 'Bullet'
      Category = 1
      Hint = 'Bullet'
      Visible = ivAlways
      ImageIndex = 0
    end
    object btnAlignLeft: TdxBarButton
      Caption = 'Align Left'
      Category = 1
      Hint = 'Align Left'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      ImageIndex = 28
      OnClick = btnAlignLeftClick
    end
    object btnAlignCenter: TdxBarButton
      Tag = 2
      Caption = 'Align Center'
      Category = 1
      Hint = 'Align Center'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      ImageIndex = 29
      OnClick = btnAlignLeftClick
    end
    object btnAlignRight: TdxBarButton
      Tag = 1
      Caption = 'Align Right'
      Category = 1
      Hint = 'Align Right'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      ImageIndex = 30
      OnClick = btnAlignLeftClick
    end
    object btnPrint: TdxBarButton
      Caption = 'Print'
      Category = 2
      Hint = 'Print'
      Visible = ivAlways
      ImageIndex = 13
      OnClick = btnPrintClick
    end
    object btnCut: TdxBarButton
      Caption = 'Cut'
      Category = 1
      Hint = 'Cut'
      Visible = ivAlways
      ImageIndex = 1
      ShortCut = 16472
      OnClick = btnCutClick
    end
    object btnCopy: TdxBarButton
      Caption = 'Copy'
      Category = 1
      Hint = 'Copy'
      Visible = ivAlways
      ImageIndex = 3
      ShortCut = 16451
      OnClick = btnCopyClick
    end
    object btnPaste: TdxBarButton
      Caption = 'Paste'
      Category = 1
      Hint = 'Paste'
      Visible = ivAlways
      ImageIndex = 2
      ShortCut = 16470
      OnClick = btnPasteClick
    end
    object btnClear: TdxBarButton
      Caption = 'Clear'
      Category = 1
      Hint = 'Clear'
      Visible = ivAlways
      ImageIndex = 19
      OnClick = btnClearClick
    end
    object btnSelectAll: TdxBarButton
      Caption = 'Select All'
      Category = 1
      Hint = 'Select All'
      Visible = ivAlways
      ImageIndex = 31
      OnClick = btnSelectAllClick
    end
    object btnReplace: TdxBarButton
      Caption = 'Replace'
      Category = 1
      Hint = 'Replace'
      Visible = ivAlways
      ImageIndex = 32
      OnClick = btnReplaceClick
    end
    object btnStop: TdxBarButton
      Caption = 'Stop'
      Category = 0
      Hint = 'Stop'
      Visible = ivAlways
      ImageIndex = 22
      OnClick = btnStopClick
    end
    object btnObjectRefresh: TdxBarButton
      Caption = 'New Item'
      Category = 3
      Hint = 'Refresh Object List'
      Visible = ivAlways
      ImageIndex = 10
      OnClick = btnObjectRefreshClick
    end
    object btnObjectFilter: TdxBarButton
      Caption = 'New Item'
      Category = 3
      Hint = 'Find Objects'
      Visible = ivAlways
      ImageIndex = 33
    end
    object btnObjectShowColumns: TdxBarButton
      Caption = 'Show/Hide Columns'
      Category = 3
      Hint = 'Show/Hide Columns'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 39
      OnClick = btnObjectShowColumnsClick
    end
    object edtObjectFilter: TdxBarEdit
      Caption = 'Object Filter'
      Category = 3
      Hint = 'Object Filter in Tables/Views'
      Visible = ivAlways
      OnKeyDown = edtObjectFilterKeyDown
      Width = 100
    end
    object btnUnIndent: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'UnIndent'
      Visible = ivAlways
      ImageIndex = 17
      OnClick = btnUnIndentClick
    end
    object btnIndent: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'Indent'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnIndentClick
    end
    object btnSQLRecallSave: TdxBarButton
      Caption = 'Save'
      Category = 4
      Hint = 'Save'
      Visible = ivAlways
      ImageIndex = 14
      OnClick = btnSQLRecallSaveClick
    end
    object btnSQLRecallOpen: TdxBarButton
      Caption = 'Open'
      Category = 4
      Hint = 'Open'
      Visible = ivAlways
      ImageIndex = 16
      OnClick = btnSQLRecallOpenClick
    end
    object btnSQLRecallToSQLEditor: TdxBarButton
      Caption = 'Load in SQL Editor'
      Category = 4
      Hint = 'Load in SQL Editor'
      Visible = ivAlways
      ImageIndex = 34
      OnClick = btnSQLRecallToSQLEditorClick
    end
    object btnSQLRecallFirst: TdxBarButton
      Caption = 'First'
      Category = 4
      Hint = 'First'
      Visible = ivAlways
      ImageIndex = 42
      OnClick = btnSQLRecallFirstClick
    end
    object btnSQLRecallPrior: TdxBarButton
      Caption = 'Prior'
      Category = 4
      Hint = 'Prior'
      Visible = ivAlways
      ImageIndex = 43
      OnClick = btnSQLRecallPriorClick
    end
    object btnSQLRecallNext: TdxBarButton
      Caption = 'Next'
      Category = 4
      Hint = 'Next'
      Visible = ivAlways
      ImageIndex = 44
      OnClick = btnSQLRecallNextClick
    end
    object btnSQLRecallLast: TdxBarButton
      Caption = 'Last'
      Category = 4
      Hint = 'Last'
      Visible = ivAlways
      ImageIndex = 41
      OnClick = btnSQLRecallLastClick
    end
    object edtSQLRecallFilter: TdxBarEdit
      Caption = 'Filter in SQLS'
      Category = 4
      Description = 'Filter'
      Hint = 'Filter in SQLS'
      Visible = ivAlways
      OnKeyDown = edtSQLRecallFilterKeyDown
      ShowCaption = True
      Width = 100
    end
    object btnSQLRecallDelete: TdxBarButton
      Caption = 'Delete'
      Category = 4
      Hint = 'Delete in SQL Recall List'
      Visible = ivAlways
      ImageIndex = 35
      OnClick = btnSQLRecallDeleteClick
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object btnSQLRecalType: TdxBarButton
      Caption = 'Current/All SQL'
      Category = 0
      Hint = 'Current/All SQL'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 48
      OnClick = btnSQLRecalTypeClick
    end
    object btnSQLRecallRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 0
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 31
    end
  end
  object SQLEditorPopupMenu: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
      end
      item
        Visible = True
      end
      item
        Visible = True
      end
      item
        BeginGroup = True
        Visible = True
      end
      item
        Visible = True
      end>
    UseOwnFont = False
    Left = 254
    Top = 100
  end
  object ilStatusBarImages: TImageList
    Left = 288
    Top = 136
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B9B9B900808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A006A6A6A006A6A6A006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9B9B900E3E3E3009D9D9D009D9D9D0080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A008E8E8E00AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9B9B900FFFFFF00DFDFDF00CCCCCC009D9D9D00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A0091919100AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9B9B900FFFFFF00E1E1E100CFCFCF009D9D9D00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A0096969600AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9B9B900FFFFFF00E1E1E100CFCFCF009D9D9D00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A009A9A9A00AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9B9B900C6C6C600C6C6C600C6C6C6009D9D9D00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A009F9F9F00AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8B8B800D3D3D300DADADA00E0E0E000CECECE00C1C1C100B8B8B8000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00A4A4A400AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B8B8
      B800E5E5E500ECECEC00DADADA00EBEBEB00D9D9D900E8E8E800E5E5E500B8B8
      B800000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A006A6A6A008E8E8E006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CACACA00DEDE
      DE00EFEFEF00EEEEEE00DEDEDE00ECECEC00E5E5E500E1E1E100E8E8E800DCDC
      DC00CACACA000000000000000000000000000000000000000000000000000000
      000000000000C9C9C90098989800989898009898980098989800989898000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCBCBC00F1F1
      F100F1F1F100F0F0F000DFDFDF00ECECEC00E7E7E700DFDFDF00E8E8E800E8E8
      E800BCBCBC00000000000000000000000000000000006C6C6C006C6C6C006C6C
      6C0000000000C9C9C900EDEDED00EDEDED00EDEDED00EDEDED00989898000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8B8B800F5F5
      F500F2F2F200F2F2F200EFEFEF00E8E8E800ECECEC00EAEAEA00EBEBEB00E8E8
      E800B8B8B8000000000000000000000000000000000000000000000000000000
      000000000000C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCBCBC00F6F6
      F600FCFCFC00FFFFFF00FEFEFE00F5F5F500EFEFEF00EDEDED00ECECEC00EAEA
      EA00BCBCBC000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00A5A5A500AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CACACA00EBEB
      EB00FFFFFF00FFFFFF00FFFFFF00FCFCFC00EFEFEF00EEEEEE00ECECEC00E3E3
      E300CACACA000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00A5A5A500AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B8B8
      B800F5F5F500FFFFFF00FEFEFE00F8F8F800F1F1F100EFEFEF00E3E3E300B8B8
      B800000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00A5A5A500AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8B8B800EBEBEB00F7F7F700F4F4F400F2F2F200EBEBEB00B8B8B8000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00A5A5A500AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CACACA00BCBCBC00B8B8B800BCBCBC00CACACA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A006A6A6A006A6A6A006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010151000101510001015
      1000101510001015100010151000101510001015100010151000101510001015
      1000101510001015100010151000000000000000000000000000000000000000
      00000000000000000000A08C7D00694731006947310069473100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000983000009830000098300000000000000000
      0000000000000000000000000000000000000000000040404000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040004040400040404000000000005593560099D6A8003D6F3E003D6F
      3E003D6F3E003D6F3E003D6F3E003D6F3E003D6F3E003D6F3E003D6F3E003D6F
      3E003D6F3E003D6F3E003D6F3E00101510000000000000000000000000000000
      000000000000A08C7D00D5CDC800856757008567570069473100694731000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000C8600000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00DDDDDD00959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      95009595950095959500959595004040400055935600A2D9AE0099D6A80090D3
      A10087D09A007ECE940074CB8D006BC8860061C57F0058C278004EBF71004ABE
      6D0040BB66003CBA63003D6F3E00101510000000000000000000000000000000
      000000000000A08C7D00FFFFFF00D7C3C300C2A6A40085675700694731000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000CC640000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00DFDFDF00DDDDDD00DADA
      DA00D7D7D700D5D5D500D2D2D200CFCFCF00CCCCCC00C8C8C800C5C5C500C3C3
      C300C0C0C000C0C0C000959595004040400055935600ABDCB500A2D9AE00B7A2
      9300694731006947310069473100694731006947310069473100694731006947
      31004ABE6D0040BB66003D6F3E00101510000000000000000000000000000000
      000000000000A08C7D00FFFFFF00DAC6C600C4A9A80085675700694731000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000D26C0000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E2E2E200DFDFDF00C8C8
      C800808080008080800080808000808080008080800080808000808080008080
      8000C3C3C300C0C0C000959595004040400055935600B4DFBC00ABDCB500B7A2
      9300FFF0E900FFECE300FFE9DE00FFE5D800FFE1D200FFDECD00FFDECD006947
      310053C174004ABE6D003D6F3E00101510000000000000000000000000000000
      000000000000A08C7D00FFFFFF00DAC6C600C4A9A80085675700694731000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000D8730000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E5E5E500E2E2E200C8C8
      C800F7F7F700F5F5F500F3F3F300F1F1F100EFEFEF00EDEDED00EDEDED008080
      8000C7C7C700C3C3C300959595004040400055935600BDE1C200B8E0BF00B7A2
      9300FFF4EF00BE927E00BE927E00BE927E00BE927E00BE927E00FFDFCF006947
      31005DC47B0053C174003D6F3E00101510000000000000000000000000000000
      000000000000A08C7D00BA9B9800BA9B9800BA9B980085675700694731000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000DF7B0000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E6E6E600C8C8
      C800F9F9F900BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00EDEDED008080
      8000CACACA00C7C7C700959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFF9F600FFF4EF00FFF2EC00FFEEE600FFEAE000FFE7DB00FFE3D5006947
      310066C782005DC47B003D6F3E00101510000000000000000000000000000000
      0000A9878300C7B3A700D5BDB400DFC7C000C5AAA100B4978A00A98783000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000E7830000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FCFCFC00F9F9F900F8F8F800F6F6F600F4F4F400F2F2F200EFEFEF008080
      8000CDCDCD00CACACA00959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFFFFF00BE927E00BE927E00BE927E00BE927E00BE927E00FFE7DB006947
      310070CA8A0066C782003D6F3E0010151000000000000000000000000000A987
      8300E5D1C200F3DECE00D4BEAF00F4DCCB00D5BDAD00F2D7C400EBD1BE00A987
      8300000000000000000000000000000000000000000000000000000000000000
      000000000000000000009830000098300000C860000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FFFFFF00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00F2F2F2008080
      8000D1D1D100CDCDCD00959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFFFFF00FFFFFF00FFFBF900FFF6F200FFF2EC00FFEEE600FFEAE0006947
      310079CC910070CA8A003D6F3E00101510000000000000000000A4A6A100D3C6
      B800F5E2D500F5E1D400DAC6B800F3DECE00E9D2C200E4CBBB00F1D6C300DBC3
      B100A4A6A1000000000000000000000000000000000000000000000000000000
      0000000000003098F80000609000006090000060900000609000006090000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FFFFFF00FFFFFF00FDFDFD00FAFAFA00F8F8F800F6F6F600F4F4F4008080
      8000D3D3D300D1D1D100959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFFFFF00BE927E00BE927E00BE927E00BE927E00BE927E00FFEEE6006947
      310082CF970079CC91003D6F3E0010151000000000000000000099918900F6E6
      DB00F6E6DA00F6E5D900DBC8BC00EFDED000E5D5C900DFC7B800F2D8C700F4D8
      C500999189000000000000000000000000000000000033333300333333003333
      3300000000003098F80001FFFF0001FFFF0001FFFF0001FFFF00006090000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FFFFFF00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00F6F6F6008080
      8000D6D6D600D3D3D300959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF900FFF6F200FFF2EC006947
      31008BD29E0082CF97003D6F3E00101510000000000000000000A9878300F9EE
      E400F6E8DE00F7E9DF00F2E3D800E5D6CB00EFDDD000EFDACA00F2DBCA00F1D7
      C500A98783000000000000000000000000000000000000000000000000000000
      0000000000003098F8003098F8003098F8003098F8003098F8003098F8000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FAFAFA00F8F8F8008080
      8000D9D9D900D6D6D600959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFFFFF00BE927E00BE927E00BE927E00BE927E00BE927E00FFF6F2006947
      310099D6A80090D3A1003D6F3E0010151000000000000000000099918900FAEF
      E800FCF9F700FFFFFF00FEFEFD00F8EDE500F5E3D600F4E0D100F3DDCC00F3DA
      C900999189000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000E8860000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FFFFFF00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00FAFAFA008080
      8000DDDDDD00DADADA00959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF9006947
      3100A2D9AE0099D6A8003D6F3E00101510000000000000000000A4A6A100F2DB
      CB00FFFFFF00FFFFFF00FFFFFF00FDFAF800F5E4D800F4E1D400F3DECF00E6CE
      BD00A4A6A1000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000E8860000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD008080
      8000DFDFDF00DDDDDD00959595004040400055935600C1E3C500C1E3C500B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300ABDCB500A2D9AE003D6F3E0010151000000000000000000000000000A987
      8300F9EEE400FFFFFF00FEFEFE00FAF1EB00F6E6DB00F5E3D600E6CEBD00A987
      8300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000E8860000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800E2E2E200DFDFDF00959595004040400055935600C1E3C500C1E3C500C1E3
      C500C1E3C500C1E3C500C1E3C500C1E3C500C1E3C500C1E3C500C1E3C500BDE1
      C200B4DFBC00ABDCB500A2D9AE00101510000000000000000000000000000000
      0000A9878300F2DBCB00FAF0EA00F7EBE100F7E8DD00F2DBCB00A98783000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000E8860000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E5E5E500E2E2E200DFDFDF00404040000000000055935600559356005593
      5600559356005593560055935600559356005593560055935600559356005593
      5600559356005593560055935600000000000000000000000000000000000000
      000000000000A4A6A10099918900A987830099918900A4A6A100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000983000009830000098300000000000000000
      00000000000000000000000000000000000000000000ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD0000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FC3FFC3F00000000F81FEC3700000000
      F81FFC3F00000000F81FFC3F00000000F81FFC3F00000000F81FCC3300000000
      F01FFC3F00000000E00FFC3F00000000C007F81F00000000C007881100000000
      C007F81F00000000C007FC3F00000000C007FC3F00000000E00F0C3000000000
      F01FFC3F00000000F83FFC3F000000008001FC3FFC3F80010000F81FEC370000
      0000F81FFC3F00000000F81FFC3F00000000F81FFC3F00000000F81FCC330000
      0000F01FFC3F00000000E00FFC3F00000000C007F81F00000000C00788110000
      0000C007F81F00000000C007FC3F00000000C007FC3F00000000E00F0C300000
      0000F01FFC3F00008001F83FFC3F800100000000000000000000000000000000
      000000000000}
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'SQL'
    Filter = 'SQL|*.SQL|TXT|*.TXT|Any File (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist]
    Left = 372
    Top = 164
  end
  object PrintDialog: TPrintDialog
    Left = 372
    Top = 132
  end
  object FindDialog: TFindDialog
    Options = [frHideUpDown]
    OnFind = FindDialogFind
    Left = 408
    Top = 128
  end
  object ReplaceDialog: TReplaceDialog
    OnFind = FindDialogFind
    OnReplace = ReplaceDialogReplace
    Left = 400
    Top = 160
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'SQL'
    Filter = 'SQL|*.SQL|TXT|*.TXT|Any File (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist]
    Left = 360
    Top = 100
  end
  object ds: TDataSource
    Left = 264
    Top = 216
  end
  object cxEditRepository: TcxEditRepository
    Left = 73
    Top = 242
    object cxEditRepositoryBlobItem1: TcxEditRepositoryBlobItem
      Properties.BlobEditKind = bekMemo
    end
    object cxEditRepositoryMemoItem1: TcxEditRepositoryMemoItem
      Properties.VisibleLineCount = 5
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 108
    Top = 244
    object styleSelection: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 5228795
      TextColor = clBlack
    end
    object styleCardHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object styleCardBorder: TcxStyle
      AssignedValues = [svColor]
      Color = 13603685
    end
    object styleBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 15918293
    end
    object styleCategoryRow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16766389
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object stylePrice: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
    object CardsStyleSheet: TcxGridCardViewStyleSheet
      Styles.Background = styleBackground
      Styles.Selection = styleSelection
      Styles.CardBorder = styleCardBorder
      Styles.CategoryRow = styleCategoryRow
      Styles.CategorySeparator = styleCardBorder
      Styles.LayerSeparator = styleCardBorder
      BuiltIn = True
    end
  end
  object timerQueryRunning: TTimer
    Enabled = False
    Interval = 100
    OnTimer = timerQueryRunningTimer
    Left = 272
    Top = 306
  end
end
