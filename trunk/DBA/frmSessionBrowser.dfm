object SessionBrowserFrm: TSessionBrowserFrm
  Left = 48
  Top = 87
  Width = 926
  Height = 622
  Caption = 'SessionBrowserFrm'
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000044040000000000004646400000000000477777777777700047
    8888888887700047F7777777787001133FF88888887001833777777778700187
    FFFFF88888700177F777777778700117FFFFFFFF887000077777733777700033
    331003300000001888100000000000378730000000000033133000000000FFFF
    0000C1FF0000C1FF0000C0010000C0010000C001000080010000800100008001
    00008001000080010000E0010000C19F0000C1FF0000C1FF0000C1FF0000}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxSplitter1: TcxSplitter
    Left = 281
    Top = 26
    Width = 8
    Height = 542
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 31
    Control = gridUser
  end
  object pc: TcxPageControl
    Left = 289
    Top = 26
    Width = 629
    Height = 542
    ActivePage = tsGeneral
    Align = alClient
    Color = clBtnFace
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    ParentColor = False
    ShowFrame = True
    Style = 9
    TabOrder = 2
    TabSlants.Kind = skCutCorner
    OnPageChanging = pcPageChanging
    ClientRectBottom = 541
    ClientRectLeft = 1
    ClientRectRight = 628
    ClientRectTop = 20
    object tsGeneral: TcxTabSheet
      Caption = 'General'
      ImageIndex = 0
      DesignSize = (
        627
        521)
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          609
          505)
        Height = 505
        Width = 609
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 57
          Height = 13
          Caption = 'Session ID :'
          Transparent = True
        end
        object Label2: TLabel
          Left = 16
          Top = 40
          Width = 44
          Height = 13
          Caption = 'Serial # :'
          Transparent = True
        end
        object Label3: TLabel
          Left = 16
          Top = 64
          Width = 38
          Height = 13
          Caption = 'Status :'
          Transparent = True
        end
        object Label4: TLabel
          Left = 16
          Top = 88
          Width = 59
          Height = 13
          Caption = 'User Name :'
          Transparent = True
        end
        object Label5: TLabel
          Left = 16
          Top = 112
          Width = 74
          Height = 13
          Caption = 'Schema Name :'
          Transparent = True
        end
        object Label6: TLabel
          Left = 16
          Top = 136
          Width = 84
          Height = 13
          Caption = 'Logged on since :'
          Transparent = True
        end
        object Label7: TLabel
          Left = 16
          Top = 160
          Width = 81
          Height = 13
          Caption = 'Last Activity on :'
          Transparent = True
        end
        object Label8: TLabel
          Left = 16
          Top = 184
          Width = 47
          Height = 13
          Caption = 'Program :'
          Transparent = True
        end
        object Label9: TLabel
          Left = 16
          Top = 208
          Width = 135
          Height = 13
          Caption = 'Resource Consumer Group :'
          Transparent = True
        end
        object cxGroupBox2: TcxGroupBox
          Left = 11
          Top = 227
          Anchors = [akLeft, akTop, akRight]
          Caption = 'OS Information'
          TabOrder = 0
          Transparent = True
          Height = 81
          Width = 582
          object Label10: TLabel
            Left = 16
            Top = 16
            Width = 76
            Height = 13
            Caption = 'OS User Name :'
            Transparent = True
          end
          object Label11: TLabel
            Left = 16
            Top = 60
            Width = 46
            Height = 13
            Caption = 'Machine :'
            Transparent = True
          end
          object Label12: TLabel
            Left = 16
            Top = 36
            Width = 47
            Height = 13
            Caption = 'Terminal :'
            Transparent = True
          end
          object cxDBLabel10: TcxDBLabel
            Left = 144
            Top = 16
            AutoSize = True
            DataBinding.DataField = 'OSUSER'
            DataBinding.DataSource = dsUsers
            Transparent = True
          end
          object cxDBLabel11: TcxDBLabel
            Left = 144
            Top = 36
            AutoSize = True
            DataBinding.DataField = 'TERMINAL'
            DataBinding.DataSource = dsUsers
            Transparent = True
          end
          object cxDBLabel12: TcxDBLabel
            Left = 144
            Top = 56
            AutoSize = True
            DataBinding.DataField = 'MACHINE'
            DataBinding.DataSource = dsUsers
            Transparent = True
          end
        end
        object cxDBLabel1: TcxDBLabel
          Left = 159
          Top = 16
          AutoSize = True
          DataBinding.DataField = 'SID'
          DataBinding.DataSource = dsUsers
          Transparent = True
        end
        object cxDBLabel2: TcxDBLabel
          Left = 159
          Top = 40
          AutoSize = True
          DataBinding.DataField = 'SERIAL#'
          DataBinding.DataSource = dsUsers
          Transparent = True
        end
        object cxDBLabel3: TcxDBLabel
          Left = 159
          Top = 64
          AutoSize = True
          DataBinding.DataField = 'STATUS'
          DataBinding.DataSource = dsUsers
          Transparent = True
        end
        object cxDBLabel4: TcxDBLabel
          Left = 159
          Top = 88
          AutoSize = True
          DataBinding.DataField = 'USERNAME'
          DataBinding.DataSource = dsUsers
          Transparent = True
        end
        object cxDBLabel5: TcxDBLabel
          Left = 159
          Top = 112
          AutoSize = True
          DataBinding.DataField = 'SCHEMANAME'
          DataBinding.DataSource = dsUsers
          Transparent = True
        end
        object cxDBLabel6: TcxDBLabel
          Left = 159
          Top = 136
          AutoSize = True
          DataBinding.DataField = 'LOGON_TIME'
          DataBinding.DataSource = dsUsers
          Transparent = True
        end
        object cxDBLabel7: TcxDBLabel
          Left = 159
          Top = 160
          AutoSize = True
          DataBinding.DataSource = dsUsers
          Transparent = True
        end
        object cxDBLabel8: TcxDBLabel
          Left = 159
          Top = 184
          AutoSize = True
          DataBinding.DataField = 'PROGRAM'
          DataBinding.DataSource = dsUsers
          Transparent = True
        end
        object cxDBLabel9: TcxDBLabel
          Left = 159
          Top = 206
          AutoSize = True
          DataBinding.DataField = 'RESOURCE_CONSUMER_GROUP'
          DataBinding.DataSource = dsUsers
          Transparent = True
        end
        object lviewUserDetail: TcxListView
          Left = 11
          Top = 311
          Width = 583
          Height = 179
          Anchors = [akLeft, akTop, akRight, akBottom]
          Columns = <
            item
              Caption = 'Session Details'
              Width = 200
            end
            item
              Caption = 'Value'
              Width = 200
            end>
          ReadOnly = True
          RowSelect = True
          Style.BorderStyle = cbsUltraFlat
          Style.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.Kind = lfOffice11
          TabOrder = 10
          ViewStyle = vsReport
        end
      end
    end
    object tsCurrentStatement: TcxTabSheet
      Caption = 'Current Statement'
      ImageIndex = 1
      object pcCurrentStatement: TcxPageControl
        Left = 0
        Top = 0
        Width = 627
        Height = 521
        ActivePage = tsCurrentSQL
        Align = alClient
        Style = 10
        TabOrder = 0
        OnPageChanging = pcCurrentStatementPageChanging
        ClientRectBottom = 521
        ClientRectRight = 627
        ClientRectTop = 19
        object tsCurrentSQL: TcxTabSheet
          Caption = 'SQL Text'
          ImageIndex = 0
          object SQLEditor: TRichEdit
            Left = 0
            Top = 0
            Width = 627
            Height = 502
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
          end
        end
        object tsCurrentExplain: TcxTabSheet
          Caption = 'Explain Plan'
          ImageIndex = 1
          object treeListExplain: TcxDBTreeList
            Left = 0
            Top = 0
            Width = 627
            Height = 502
            Align = alClient
            Bands = <
              item
              end>
            BufferedPaint = False
            DataController.DataSource = dsPlanTable
            DataController.ParentField = 'PARENT_ID'
            DataController.KeyField = 'ID'
            LookAndFeel.Kind = lfOffice11
            OptionsBehavior.ConfirmDelete = False
            OptionsData.Editing = False
            OptionsData.Deleting = False
            OptionsView.ColumnAutoWidth = True
            RootValue = -1
            TabOrder = 0
            object cxDBTreeList1STEP_NAME: TcxDBTreeListColumn
              Caption.Text = 'STEP NAME'
              DataBinding.FieldName = 'STEP_NAME'
              Width = 201
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxDBTreeList1POSITION: TcxDBTreeListColumn
              DataBinding.FieldName = 'POSITION'
              Width = 120
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxDBTreeList1COST: TcxDBTreeListColumn
              DataBinding.FieldName = 'COST'
              Width = 120
              Position.ColIndex = 1
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxDBTreeList1CARDINALITY: TcxDBTreeListColumn
              DataBinding.FieldName = 'CARDINALITY'
              Width = 119
              Position.ColIndex = 2
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxDBTreeList1BYTES: TcxDBTreeListColumn
              DataBinding.FieldName = 'BYTES'
              Width = 119
              Position.ColIndex = 3
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
          end
        end
        object tsCurrentInformation: TcxTabSheet
          Caption = 'Information'
          ImageIndex = 2
          object lviewCurrentInformation: TcxListView
            Left = 0
            Top = 0
            Width = 627
            Height = 502
            Align = alClient
            Columns = <
              item
                Caption = 'Details'
                Width = 200
              end
              item
                Caption = 'Value'
                Width = 200
              end>
            ReadOnly = True
            RowSelect = True
            Style.BorderStyle = cbsUltraFlat
            Style.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.Kind = lfOffice11
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
      end
    end
    object tsOpenCursor: TcxTabSheet
      Caption = 'Open Cursors'
      ImageIndex = 9
      object pcOpenCursor: TcxPageControl
        Left = 0
        Top = 240
        Width = 627
        Height = 281
        ActivePage = tsCursorInformation
        Align = alBottom
        Style = 9
        TabOrder = 0
        OnPageChanging = pcOpenCursorPageChanging
        ClientRectBottom = 281
        ClientRectRight = 627
        ClientRectTop = 20
        object tsCursorInformation: TcxTabSheet
          Caption = 'Information'
          ImageIndex = 2
          object lviewCursorInformation: TcxListView
            Left = 0
            Top = 0
            Width = 627
            Height = 261
            Align = alClient
            Columns = <
              item
                Caption = 'Details'
                Width = 200
              end
              item
                Caption = 'Value'
                Width = 200
              end>
            ReadOnly = True
            RowSelect = True
            Style.BorderStyle = cbsUltraFlat
            Style.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.Kind = lfOffice11
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object tsCursorExplain: TcxTabSheet
          Caption = 'Explain Plan'
          ImageIndex = 1
          object treeListCursorExplain: TcxDBTreeList
            Left = 0
            Top = 0
            Width = 627
            Height = 261
            Align = alClient
            Bands = <
              item
              end>
            BufferedPaint = False
            DataController.DataSource = dsPlanTable
            DataController.ParentField = 'PARENT_ID'
            DataController.KeyField = 'ID'
            LookAndFeel.Kind = lfOffice11
            OptionsBehavior.ConfirmDelete = False
            OptionsData.Editing = False
            OptionsData.Deleting = False
            OptionsView.ColumnAutoWidth = True
            RootValue = -1
            TabOrder = 0
            object cxDBTreeListColumn1: TcxDBTreeListColumn
              Caption.Text = 'STEP NAME'
              DataBinding.FieldName = 'STEP_NAME'
              Width = 201
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxDBTreeListColumn2: TcxDBTreeListColumn
              DataBinding.FieldName = 'POSITION'
              Width = 120
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxDBTreeListColumn3: TcxDBTreeListColumn
              DataBinding.FieldName = 'COST'
              Width = 120
              Position.ColIndex = 1
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxDBTreeListColumn4: TcxDBTreeListColumn
              DataBinding.FieldName = 'CARDINALITY'
              Width = 119
              Position.ColIndex = 2
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxDBTreeListColumn5: TcxDBTreeListColumn
              DataBinding.FieldName = 'BYTES'
              Width = 119
              Position.ColIndex = 3
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
          end
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 0
        Top = 232
        Width = 627
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = pcOpenCursor
      end
      object cxPageControl1: TcxPageControl
        Left = 0
        Top = 0
        Width = 627
        Height = 232
        ActivePage = cxTabSheet1
        Align = alClient
        Style = 9
        TabOrder = 2
        ClientRectBottom = 232
        ClientRectRight = 627
        ClientRectTop = 20
        object cxTabSheet1: TcxTabSheet
          Caption = 'Open Cursors'
          ImageIndex = 0
          object gridOpenCursor: TcxGrid
            Left = 0
            Top = 0
            Width = 627
            Height = 192
            Align = alClient
            TabOrder = 0
            LookAndFeel.NativeStyle = True
            object gridDBOpenCursor: TcxGridDBCardView
              DragMode = dmAutomatic
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsOpenCursor
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
              object gridDBOpenCursorSQL: TcxGridDBCardViewRow
                Caption = 'SQL'
                DataBinding.FieldName = 'SQL_TEXT'
                RepositoryItem = cxEditRepositoryMemoItem1
                Position.BeginsLayer = True
              end
            end
            object gridOpenCursorLevel2: TcxGridLevel
              Caption = 'Vertical Row Layout + Vertical Card Layout'
              GridView = gridDBOpenCursor
            end
          end
          object statusBarCursor: TdxStatusBar
            Left = 0
            Top = 192
            Width = 627
            Height = 20
            Panels = <
              item
                PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
        end
        object cxTabSheet2: TcxTabSheet
          Caption = 'Detail'
          ImageIndex = 1
          object redtOpenCursorDetail: TcxDBRichEdit
            Left = 0
            Top = 0
            Align = alClient
            DataBinding.DataField = 'SQL'
            DataBinding.DataSource = dmGenel.dsSQLRecall
            Properties.ReadOnly = True
            Properties.ScrollBars = ssBoth
            TabOrder = 0
            Height = 212
            Width = 627
          end
        end
      end
    end
    object tsStatistics: TcxTabSheet
      Caption = 'Statistics'
      ImageIndex = 2
      object gridStatistics: TcxGrid
        Left = 0
        Top = 0
        Width = 627
        Height = 521
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object gridDBStatistics: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsStatistics
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object gridDBStatisticsColumn1: TcxGridDBColumn
            Caption = 'Category'
            DataBinding.FieldName = 'class'
            Width = 124
          end
          object gridDBStatisticsColumn2: TcxGridDBColumn
            Caption = 'Statistic'
            DataBinding.FieldName = 'name'
            Width = 350
          end
          object gridDBStatisticsColumn3: TcxGridDBColumn
            Caption = 'Value'
            DataBinding.FieldName = 'value'
            Width = 135
          end
        end
        object gridStatisticsLevel1: TcxGridLevel
          GridView = gridDBStatistics
        end
      end
    end
    object tsWaits: TcxTabSheet
      Caption = 'Waits'
      ImageIndex = 6
      object gridWaits: TcxGrid
        Left = 0
        Top = 0
        Width = 627
        Height = 521
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object gridDBWaits: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsWaits
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object gridDBWaitsColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'SID'
          end
          object gridDBWaitsColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'SEQ#'
          end
          object gridDBWaitsColumn3: TcxGridDBColumn
            Caption = 'Event'
            DataBinding.FieldName = 'EVENT'
          end
          object gridDBWaitsColumn4: TcxGridDBColumn
            Caption = 'Wait Time'
            DataBinding.FieldName = 'WAIT_TIME'
          end
          object gridDBWaitsColumn5: TcxGridDBColumn
            Caption = 'Seconds In Wait'
            DataBinding.FieldName = 'SECONDS_IN_WAIT'
          end
          object gridDBWaitsColumn6: TcxGridDBColumn
            Caption = 'State'
            DataBinding.FieldName = 'STATE'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = gridDBWaits
        end
      end
    end
    object tsEvents: TcxTabSheet
      Caption = 'Events'
      ImageIndex = 10
      object gridEvents: TcxGrid
        Left = 0
        Top = 0
        Width = 627
        Height = 521
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object gridDBEvents: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsEvents
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object gridDBEventsColumn1: TcxGridDBColumn
            Caption = 'Event'
            DataBinding.FieldName = 'EVENT'
          end
          object gridDBEventsColumn2: TcxGridDBColumn
            Caption = 'Total Waits'
            DataBinding.FieldName = 'TOTAL_WAITS'
          end
          object gridDBEventsColumn3: TcxGridDBColumn
            Caption = 'Total Timeouts'
            DataBinding.FieldName = 'TOTAL_TIMEOUTS'
          end
          object gridDBEventsColumn4: TcxGridDBColumn
            Caption = 'Time Waited'
            DataBinding.FieldName = 'TIME_WAITED'
          end
          object gridDBEventsColumn5: TcxGridDBColumn
            Caption = 'Average Wait'
            DataBinding.FieldName = 'AVERAGE_WAIT'
          end
          object gridDBEventsColumn6: TcxGridDBColumn
            Caption = 'Max Wait'
            DataBinding.FieldName = 'MAX_WAIT'
          end
          object gridDBEventsColumn7: TcxGridDBColumn
            Caption = 'Time Waited Micro'
            DataBinding.FieldName = 'TIME_WAITED_MICRO'
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = gridDBEvents
        end
      end
    end
    object tsIO: TcxTabSheet
      Caption = 'IO'
      ImageIndex = 5
      object gridIO: TcxGrid
        Left = 0
        Top = 0
        Width = 627
        Height = 521
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object gridDBIO: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsIO
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object gridDBIOColumn1: TcxGridDBColumn
            Caption = 'Block Gets'
            DataBinding.FieldName = 'BLOCK_GETS'
          end
          object gridDBIOColumn2: TcxGridDBColumn
            Caption = 'Consistent Gets'
            DataBinding.FieldName = 'CONSISTENT_GETS'
          end
          object gridDBIOColumn3: TcxGridDBColumn
            Caption = 'Physical Reads'
            DataBinding.FieldName = 'PHYSICAL_READS'
          end
          object gridDBIOColumn4: TcxGridDBColumn
            Caption = 'Block Changes'
            DataBinding.FieldName = 'BLOCK_CHANGES'
          end
          object gridDBIOColumn5: TcxGridDBColumn
            Caption = 'Consistent Changes'
            DataBinding.FieldName = 'CONSISTENT_CHANGES'
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = gridDBIO
        end
      end
    end
    object tsProcess: TcxTabSheet
      Caption = 'Process'
      ImageIndex = 4
      object gridProcess: TcxGrid
        Left = 0
        Top = 0
        Width = 627
        Height = 521
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object gridDBProcess: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsProcess
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object gridDBProcessColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'ADDR'
            Width = 75
          end
          object gridDBProcessColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'PID'
            Width = 75
          end
          object gridDBProcessColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'SPID'
            Width = 75
          end
          object gridDBProcessColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'USERNAME'
            Width = 75
          end
          object gridDBProcessColumn5: TcxGridDBColumn
            DataBinding.FieldName = 'SERIAL#'
            Width = 75
          end
          object gridDBProcessColumn6: TcxGridDBColumn
            DataBinding.FieldName = 'TERMINAL'
            Width = 75
          end
          object gridDBProcessColumn7: TcxGridDBColumn
            DataBinding.FieldName = 'PROGRAM'
            Width = 75
          end
          object gridDBProcessColumn8: TcxGridDBColumn
            DataBinding.FieldName = 'TRACEID'
            Width = 75
          end
          object gridDBProcessColumn9: TcxGridDBColumn
            DataBinding.FieldName = 'BACKGROUND'
            Width = 75
          end
          object gridDBProcessColumn10: TcxGridDBColumn
            DataBinding.FieldName = 'LATCHWAIT'
            Width = 75
          end
          object gridDBProcessColumn11: TcxGridDBColumn
            DataBinding.FieldName = 'LATCHSPIN'
            Width = 75
          end
          object gridDBProcessColumn12: TcxGridDBColumn
            DataBinding.FieldName = 'PGA_USED_MEM'
            Width = 85
          end
          object gridDBProcessColumn13: TcxGridDBColumn
            DataBinding.FieldName = 'PGA_ALLOC_MEM'
            Width = 108
          end
          object gridDBProcessColumn14: TcxGridDBColumn
            DataBinding.FieldName = 'PGA_FREEABLE_MEM'
            Width = 108
          end
          object gridDBProcessColumn15: TcxGridDBColumn
            DataBinding.FieldName = 'PGA_MAX_MEM'
            Width = 102
          end
        end
        object cxGridLevel4: TcxGridLevel
          GridView = gridDBProcess
        end
      end
    end
    object tsLocks: TcxTabSheet
      Caption = 'Locks'
      ImageIndex = 3
      object gridLocks: TcxGrid
        Left = 0
        Top = 0
        Width = 627
        Height = 521
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object gridDBLocks: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsLocks
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object gridDBLocksColumn1: TcxGridDBColumn
            Caption = 'User Name'
            DataBinding.FieldName = 'USERNAME'
            Width = 102
          end
          object gridDBLocksColumn2: TcxGridDBColumn
            Caption = 'OS User'
            DataBinding.FieldName = 'osuser'
            Width = 93
          end
          object gridDBLocksColumn3: TcxGridDBColumn
            Caption = 'Machine'
            DataBinding.FieldName = 'machine'
            Width = 98
          end
          object gridDBLocksColumn4: TcxGridDBColumn
            Caption = 'Lock Type'
            DataBinding.FieldName = 'lock_type'
            Width = 87
          end
          object gridDBLocksColumn5: TcxGridDBColumn
            Caption = 'Mode Held'
            DataBinding.FieldName = 'mode_held'
            Width = 89
          end
          object gridDBLocksColumn6: TcxGridDBColumn
            Caption = 'Mode Requested'
            DataBinding.FieldName = 'mode_requested'
            Width = 100
          end
          object gridDBLocksColumn7: TcxGridDBColumn
            Caption = 'Lock ID1'
            DataBinding.FieldName = 'lock_id1'
          end
          object gridDBLocksColumn8: TcxGridDBColumn
            Caption = 'Lock ID2'
            DataBinding.FieldName = 'lock_id2'
          end
          object gridDBLocksColumn9: TcxGridDBColumn
            Caption = 'Owner'
            DataBinding.FieldName = 'owner'
            Width = 99
          end
          object gridDBLocksColumn10: TcxGridDBColumn
            Caption = 'Object Type'
            DataBinding.FieldName = 'object_type'
            Width = 95
          end
          object gridDBLocksColumn11: TcxGridDBColumn
            Caption = 'Object Name'
            DataBinding.FieldName = 'object_name'
            Width = 99
          end
          object gridDBLocksColumn12: TcxGridDBColumn
            Caption = 'Block'
            DataBinding.FieldName = 'BLOCK'
            Width = 89
          end
          object gridDBLocksColumn13: TcxGridDBColumn
            Caption = 'Lock Wait'
            DataBinding.FieldName = 'lockwait'
            Width = 93
          end
        end
        object cxGridLevel5: TcxGridLevel
          GridView = gridDBLocks
        end
      end
    end
    object tsAccess: TcxTabSheet
      Caption = 'Access'
      ImageIndex = 10
      object gridAccess: TcxGrid
        Left = 0
        Top = 0
        Width = 627
        Height = 521
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object gridDBAccess: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsAccess
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object gridDBAccessColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'SID'
            Width = 57
          end
          object gridDBAccessColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'OWNER'
            Width = 145
          end
          object gridDBAccessColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'OBJECT'
            Width = 211
          end
          object gridDBAccessColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'TYPE'
            Width = 182
          end
        end
        object cxGridLevel6: TcxGridLevel
          GridView = gridDBAccess
        end
      end
    end
  end
  object statusBar: TdxStatusBar
    Left = 0
    Top = 568
    Width = 918
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 250
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object gridUser: TcxGrid
    Left = 0
    Top = 26
    Width = 281
    Height = 542
    Align = alLeft
    TabOrder = 7
    LookAndFeel.Kind = lfOffice11
    object gridDBUser: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsUsers
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      object gridDBUserSADDR: TcxGridDBColumn
        DataBinding.FieldName = 'SADDR'
        Visible = False
      end
      object gridDBUserSID: TcxGridDBColumn
        DataBinding.FieldName = 'SID'
        Width = 30
      end
      object gridDBUserSERIAL: TcxGridDBColumn
        DataBinding.FieldName = 'SERIAL#'
        Visible = False
      end
      object gridDBUserAUDSID: TcxGridDBColumn
        DataBinding.FieldName = 'AUDSID'
        Visible = False
      end
      object gridDBUserPADDR: TcxGridDBColumn
        DataBinding.FieldName = 'PADDR'
        Visible = False
      end
      object gridDBUserUSER: TcxGridDBColumn
        DataBinding.FieldName = 'USER#'
        Visible = False
      end
      object gridDBUserMACHINE: TcxGridDBColumn
        DataBinding.FieldName = 'MACHINE'
        Width = 100
      end
      object gridDBUserPROGRAM: TcxGridDBColumn
        DataBinding.FieldName = 'PROGRAM'
        Width = 100
      end
      object gridDBUserUSERNAME: TcxGridDBColumn
        DataBinding.FieldName = 'USERNAME'
        Visible = False
        GroupIndex = 0
      end
      object gridDBUserCOMMAND: TcxGridDBColumn
        DataBinding.FieldName = 'COMMAND'
        Visible = False
      end
      object gridDBUserOWNERID: TcxGridDBColumn
        DataBinding.FieldName = 'OWNERID'
        Visible = False
      end
      object gridDBUserTADDR: TcxGridDBColumn
        DataBinding.FieldName = 'TADDR'
        Visible = False
      end
      object gridDBUserLOCKWAIT: TcxGridDBColumn
        DataBinding.FieldName = 'LOCKWAIT'
        Visible = False
      end
      object gridDBUserSTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'STATUS'
        Visible = False
      end
      object gridDBUserSERVER: TcxGridDBColumn
        DataBinding.FieldName = 'SERVER'
        Visible = False
      end
      object gridDBUserSCHEMA: TcxGridDBColumn
        DataBinding.FieldName = 'SCHEMA#'
        Visible = False
      end
      object gridDBUserSCHEMANAME: TcxGridDBColumn
        DataBinding.FieldName = 'SCHEMANAME'
        Width = 88
      end
      object gridDBUserOSUSER: TcxGridDBColumn
        DataBinding.FieldName = 'OSUSER'
      end
      object gridDBUserPROCESS: TcxGridDBColumn
        DataBinding.FieldName = 'PROCESS'
      end
      object gridDBUserTERMINAL: TcxGridDBColumn
        DataBinding.FieldName = 'TERMINAL'
      end
      object gridDBUserTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'TYPE'
        Visible = False
      end
      object gridDBUserSQL_ADDRESS: TcxGridDBColumn
        DataBinding.FieldName = 'SQL_ADDRESS'
        Visible = False
      end
      object gridDBUserSQL_HASH_VALUE: TcxGridDBColumn
        DataBinding.FieldName = 'SQL_HASH_VALUE'
        Visible = False
      end
      object gridDBUserPREV_SQL_ADDR: TcxGridDBColumn
        DataBinding.FieldName = 'PREV_SQL_ADDR'
        Visible = False
      end
      object gridDBUserPREV_HASH_VALUE: TcxGridDBColumn
        DataBinding.FieldName = 'PREV_HASH_VALUE'
        Visible = False
      end
      object gridDBUserMODULE: TcxGridDBColumn
        DataBinding.FieldName = 'MODULE'
      end
      object gridDBUserMODULE_HASH: TcxGridDBColumn
        DataBinding.FieldName = 'MODULE_HASH'
        Visible = False
      end
      object gridDBUserACTION: TcxGridDBColumn
        DataBinding.FieldName = 'ACTION'
        Visible = False
      end
      object gridDBUserACTION_HASH: TcxGridDBColumn
        DataBinding.FieldName = 'ACTION_HASH'
        Visible = False
      end
      object gridDBUserCLIENT_INFO: TcxGridDBColumn
        DataBinding.FieldName = 'CLIENT_INFO'
        Visible = False
      end
      object gridDBUserFIXED_TABLE_SEQUENCE: TcxGridDBColumn
        DataBinding.FieldName = 'FIXED_TABLE_SEQUENCE'
        Visible = False
      end
      object gridDBUserROW_WAIT_OBJ: TcxGridDBColumn
        DataBinding.FieldName = 'ROW_WAIT_OBJ#'
        Visible = False
      end
      object gridDBUserROW_WAIT_FILE: TcxGridDBColumn
        DataBinding.FieldName = 'ROW_WAIT_FILE#'
        Visible = False
      end
      object gridDBUserROW_WAIT_BLOCK: TcxGridDBColumn
        DataBinding.FieldName = 'ROW_WAIT_BLOCK#'
        Visible = False
      end
      object gridDBUserROW_WAIT_ROW: TcxGridDBColumn
        DataBinding.FieldName = 'ROW_WAIT_ROW#'
        Visible = False
      end
      object gridDBUserLOGON_TIME: TcxGridDBColumn
        DataBinding.FieldName = 'LOGON_TIME'
      end
      object gridDBUserLAST_CALL_ET: TcxGridDBColumn
        DataBinding.FieldName = 'LAST_CALL_ET'
        Visible = False
      end
      object gridDBUserPDML_ENABLED: TcxGridDBColumn
        DataBinding.FieldName = 'PDML_ENABLED'
        Visible = False
      end
      object gridDBUserFAILOVER_TYPE: TcxGridDBColumn
        DataBinding.FieldName = 'FAILOVER_TYPE'
        Visible = False
      end
      object gridDBUserFAILOVER_METHOD: TcxGridDBColumn
        DataBinding.FieldName = 'FAILOVER_METHOD'
        Visible = False
      end
      object gridDBUserFAILED_OVER: TcxGridDBColumn
        DataBinding.FieldName = 'FAILED_OVER'
        Visible = False
      end
      object gridDBUserRESOURCE_CONSUMER_GROUP: TcxGridDBColumn
        DataBinding.FieldName = 'RESOURCE_CONSUMER_GROUP'
        Visible = False
      end
      object gridDBUserPDML_STATUS: TcxGridDBColumn
        DataBinding.FieldName = 'PDML_STATUS'
        Visible = False
      end
      object gridDBUserPDDL_STATUS: TcxGridDBColumn
        DataBinding.FieldName = 'PDDL_STATUS'
        Visible = False
      end
      object gridDBUserPQ_STATUS: TcxGridDBColumn
        DataBinding.FieldName = 'PQ_STATUS'
        Visible = False
      end
      object gridDBUserCURRENT_QUEUE_DURATION: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENT_QUEUE_DURATION'
        Visible = False
      end
      object gridDBUserCLIENT_IDENTIFIER: TcxGridDBColumn
        DataBinding.FieldName = 'CLIENT_IDENTIFIER'
        Visible = False
      end
    end
    object gridUserLevel1: TcxGridLevel
      GridView = gridDBUser
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'SessionBar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 212
        FloatTop = 250
        FloatClientWidth = 0
        FloatClientHeight = 0
        ItemLinks = <
          item
            Item = btnKillSession
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnListFields
            Visible = True
          end
          item
            Item = lblRefresh
            Visible = True
          end
          item
            Item = sbtnRefresh
            UserDefine = [udWidth]
            UserWidth = 49
            Visible = True
          end
          item
            Item = btnAutoRefresh
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = dmGenel.imList
    LookAndFeel.Kind = lfStandard
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 56
    Top = 288
    DockControlHeights = (
      0
      0
      26
      0)
    object btnRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 0
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnRefreshClick
    end
    object btnListFields: TdxBarButton
      Caption = 'List Fields'
      Category = 0
      Hint = 'List Fields'
      Visible = ivAlways
      ImageIndex = 36
      OnClick = btnListFieldsClick
    end
    object lblRefresh: TdxBarStatic
      Caption = 'Refresh (secs)'
      Category = 0
      Hint = 'Refresh (secs)'
      Visible = ivAlways
    end
    object sbtnRefresh: TdxBarSpinEdit
      Caption = 'Refresh'
      Category = 0
      Hint = 'Refresh'
      Visible = ivAlways
      Width = 100
    end
    object btnAutoRefresh: TdxBarButton
      Caption = 'Auto Refresh'
      Category = 0
      Hint = 'Auto Refresh'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = btnAutoRefreshClick
    end
    object btnKillSession: TdxBarButton
      Caption = 'Session'
      Category = 0
      Hint = 'Kill Session'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu1
      ImageIndex = 23
      PaintStyle = psCaptionGlyph
    end
    object btnSessionImmediate: TdxBarButton
      Caption = 'Kill Session (Immediate)'
      Category = 0
      Hint = 'Kill Session (Immediate)'
      Visible = ivAlways
      OnClick = btnSessionImmediateClick
    end
    object btnSessionPost: TdxBarButton
      Caption = 'Kill Session (Post Transactional)'
      Category = 0
      Hint = 'Kill Session (Post Transactional)'
      Visible = ivAlways
      OnClick = btnSessionPostClick
    end
  end
  object dsUsers: TDataSource
    DataSet = qUsers
    OnStateChange = dsUsersStateChange
    OnDataChange = dsUsersDataChange
    Left = 232
    Top = 120
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 144
    Top = 88
  end
  object vtPlanTable: TVirtualTable
    IndexFieldNames = 'ID;PARENT_ID'
    Left = 168
    Top = 152
    Data = {01000000000000000000}
    object vtPlanTableID: TIntegerField
      FieldName = 'ID'
    end
    object vtPlanTablePARENT_ID: TIntegerField
      FieldName = 'PARENT_ID'
    end
    object vtPlanTablePOSITION: TIntegerField
      FieldName = 'POSITION'
    end
    object vtPlanTableOPERATION: TStringField
      FieldName = 'OPERATION'
      Size = 30
    end
    object vtPlanTableOPTIONS: TStringField
      FieldName = 'OPTIONS'
      Size = 255
    end
    object vtPlanTableOPTIMIZER: TStringField
      FieldName = 'OPTIMIZER'
      Size = 255
    end
    object vtPlanTableOBJECT_NAME: TStringField
      FieldName = 'OBJECT_NAME'
      Size = 30
    end
    object vtPlanTableCARDINALITY: TFloatField
      FieldName = 'CARDINALITY'
    end
    object vtPlanTableBYTES: TFloatField
      FieldName = 'BYTES'
    end
    object vtPlanTableCOST: TFloatField
      FieldName = 'COST'
    end
    object vtPlanTableOBJECT_NODE: TStringField
      FieldName = 'OBJECT_NODE'
      Size = 128
    end
    object vtPlanTableOTHER_TAG: TStringField
      FieldName = 'OTHER_TAG'
      Size = 255
    end
    object vtPlanTableDISTRIBUTION: TStringField
      FieldName = 'DISTRIBUTION'
      Size = 30
    end
    object vtPlanTablePARTITION_START: TStringField
      FieldName = 'PARTITION_START'
      Size = 255
    end
    object vtPlanTablePARTITION_STOP: TStringField
      FieldName = 'PARTITION_STOP'
      Size = 255
    end
    object vtPlanTableSTEP_NAME: TStringField
      FieldName = 'STEP_NAME'
      Size = 100
    end
  end
  object dsPlanTable: TDataSource
    DataSet = vtPlanTable
    Left = 136
    Top = 152
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
      Color = clBtnFace
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
  object qUsers: TOraQuery
    Left = 200
    Top = 120
  end
  object qCurrentSQL: TOraQuery
    Left = 200
    Top = 152
  end
  object qStatistics: TOraQuery
    Left = 200
    Top = 216
  end
  object qWaits: TOraQuery
    Left = 200
    Top = 248
  end
  object qEvents: TOraQuery
    Left = 200
    Top = 280
  end
  object qIO: TOraQuery
    Left = 200
    Top = 312
  end
  object qProcess: TOraQuery
    Left = 200
    Top = 344
  end
  object qLocks: TOraQuery
    Left = 200
    Top = 376
  end
  object dsCurrentSQL: TDataSource
    DataSet = qCurrentSQL
    Left = 232
    Top = 152
  end
  object dsStatistics: TDataSource
    DataSet = qStatistics
    Left = 232
    Top = 216
  end
  object dsWaits: TDataSource
    DataSet = qWaits
    Left = 232
    Top = 248
  end
  object dsEvents: TDataSource
    DataSet = qEvents
    Left = 232
    Top = 280
  end
  object dsIO: TDataSource
    DataSet = qIO
    Left = 232
    Top = 312
  end
  object dsProcess: TDataSource
    DataSet = qProcess
    Left = 232
    Top = 344
  end
  object dsLocks: TDataSource
    DataSet = qLocks
    Left = 232
    Top = 376
  end
  object qOpenCursor: TOraQuery
    AfterScroll = qOpenCursorAfterScroll
    Left = 200
    Top = 184
  end
  object dsOpenCursor: TDataSource
    DataSet = qOpenCursor
    Left = 232
    Top = 184
  end
  object qTemp: TOraQuery
    Left = 104
    Top = 88
  end
  object qAccess: TOraQuery
    Left = 200
    Top = 408
  end
  object dsAccess: TDataSource
    DataSet = qAccess
    Left = 232
    Top = 408
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Item = btnSessionImmediate
        Visible = True
      end
      item
        Item = btnSessionPost
        Visible = True
      end>
    UseOwnFont = False
    Left = 97
    Top = 290
  end
end
