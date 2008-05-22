object DBAfrm: TDBAfrm
  Left = 197
  Top = 111
  Width = 812
  Height = 603
  Caption = 'DBA Browser'
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 549
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object pcMain: TcxPageControl
      Left = 0
      Top = 0
      Width = 804
      Height = 549
      ActivePage = tsTop
      Align = alClient
      Images = dmGenel.ilHotImages
      Rotate = True
      ShowFrame = True
      Style = 8
      TabOrder = 0
      TabPosition = tpLeft
      TabWidth = 90
      OnPageChanging = pcMainPageChanging
      ClientRectBottom = 548
      ClientRectLeft = 98
      ClientRectRight = 803
      ClientRectTop = 1
      object tsSystem: TcxTabSheet
        Caption = 'System'
        ImageIndex = 0
        object pcSystem: TcxPageControl
          Left = 0
          Top = 26
          Width = 705
          Height = 521
          ActivePage = tsInstance
          Align = alClient
          Style = 8
          TabOrder = 0
          OnPageChanging = pcSystemPageChanging
          ClientRectBottom = 521
          ClientRectRight = 705
          ClientRectTop = 24
          object tsInstance: TcxTabSheet
            Caption = 'Instance'
            ImageIndex = 7
            object lviewInstance: TcxListView
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Details'
                end
                item
                  AutoSize = True
                  Caption = 'Value'
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
          object tsParameters: TcxTabSheet
            Caption = 'Parameters'
            ImageIndex = 0
            object cxGrid1: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object gridDBParameters: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsParameters
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsBehavior.IncSearch = True
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                object gridDBParametersINSTANCE: TcxGridDBColumn
                  DataBinding.FieldName = 'INSTANCE'
                  Width = 118
                end
                object gridDBParametersNAME: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                  Width = 189
                end
                object gridDBParametersVALUE: TcxGridDBColumn
                  DataBinding.FieldName = 'VALUE'
                  Width = 93
                end
                object gridDBParametersDEFAULT: TcxGridDBColumn
                  DataBinding.FieldName = 'DEFAULT'
                  Width = 105
                end
                object gridDBParametersSES_MODIFIABLE: TcxGridDBColumn
                  DataBinding.FieldName = 'SES_MODIFIABLE'
                  Width = 148
                end
                object gridDBParametersISSES_MODIFIABLE: TcxGridDBColumn
                  DataBinding.FieldName = 'ISSES_MODIFIABLE'
                  Width = 123
                end
                object gridDBParametersSYS_MODIFIABLE: TcxGridDBColumn
                  DataBinding.FieldName = 'SYS_MODIFIABLE'
                  Width = 146
                end
                object gridDBParametersDESCRIPTION: TcxGridDBColumn
                  DataBinding.FieldName = 'DESCRIPTION'
                  Width = 328
                end
                object gridDBParametersUPDATE_COMMENT: TcxGridDBColumn
                  DataBinding.FieldName = 'UPDATE_COMMENT'
                  Width = 143
                end
              end
              object cxGrid1Level1: TcxGridLevel
                GridView = gridDBParameters
              end
            end
          end
          object tsSystemStatistics: TcxTabSheet
            Caption = 'System Statistics'
            ImageIndex = 2
            object gridStatistics: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object gridDBStatistics: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object gridDBStatisticsColumn1: TcxGridDBColumn
                  DataBinding.FieldName = 'STATISTIC#'
                  Width = 94
                end
                object gridDBStatisticsColumn2: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                  Width = 150
                end
                object gridDBStatisticsColumn3: TcxGridDBColumn
                  DataBinding.FieldName = 'CLASS'
                  Width = 165
                end
                object gridDBStatisticsColumn4: TcxGridDBColumn
                  DataBinding.FieldName = 'VALUE'
                  Width = 485
                end
              end
              object gridStatisticsLevel1: TcxGridLevel
                GridView = gridDBStatistics
              end
            end
          end
          object tsNLSParameters: TcxTabSheet
            Caption = 'NLS Parameters'
            ImageIndex = 4
            object lviewNLSDatabase: TcxListView
              Left = 464
              Top = 0
              Width = 241
              Height = 497
              Align = alRight
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Database Parameters'
                end
                item
                  AutoSize = True
                  Caption = 'Value'
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
              OnClick = lviewNLSDatabaseClick
            end
            object cxSplitter2: TcxSplitter
              Left = 241
              Top = 0
              Width = 8
              Height = 497
              HotZoneClassName = 'TcxMediaPlayer9Style'
              Control = lviewNLSInstance
            end
            object lviewNLSSession: TcxListView
              Left = 249
              Top = 0
              Width = 207
              Height = 497
              Align = alClient
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Session Parameters'
                end
                item
                  AutoSize = True
                  Caption = 'Value'
                end>
              ReadOnly = True
              RowSelect = True
              Style.BorderStyle = cbsUltraFlat
              Style.LookAndFeel.Kind = lfOffice11
              StyleDisabled.LookAndFeel.Kind = lfOffice11
              StyleFocused.LookAndFeel.Kind = lfOffice11
              StyleHot.LookAndFeel.Kind = lfOffice11
              TabOrder = 2
              ViewStyle = vsReport
              OnClick = lviewNLSSessionClick
            end
            object lviewNLSInstance: TcxListView
              Left = 0
              Top = 0
              Width = 241
              Height = 497
              Align = alLeft
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Instance Parameters'
                end
                item
                  AutoSize = True
                  Caption = 'Value'
                end>
              ReadOnly = True
              RowSelect = True
              Style.BorderStyle = cbsUltraFlat
              Style.LookAndFeel.Kind = lfOffice11
              StyleDisabled.LookAndFeel.Kind = lfOffice11
              StyleFocused.LookAndFeel.Kind = lfOffice11
              StyleHot.LookAndFeel.Kind = lfOffice11
              TabOrder = 3
              ViewStyle = vsReport
              OnClick = lviewNLSInstanceClick
            end
            object cxSplitter3: TcxSplitter
              Left = 456
              Top = 0
              Width = 8
              Height = 497
              HotZoneClassName = 'TcxMediaPlayer9Style'
              AlignSplitter = salRight
              Control = lviewNLSDatabase
            end
          end
          object tsDatabase: TcxTabSheet
            Caption = 'Database'
            ImageIndex = 5
            object lviewDatabase: TcxListView
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Details'
                end
                item
                  AutoSize = True
                  Caption = 'Value'
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
          object tsOptions: TcxTabSheet
            Caption = 'Options'
            ImageIndex = 6
            object lviewOption: TcxListView
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Details'
                end
                item
                  AutoSize = True
                  Caption = 'Value'
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
          object tsVersion: TcxTabSheet
            Caption = 'Version'
            ImageIndex = 8
            object lviewVersion: TcxListView
              Left = 369
              Top = 0
              Width = 336
              Height = 497
              Align = alClient
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Version Parameters'
                end
                item
                  AutoSize = True
                  Caption = 'Value'
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
            object lviewLicense: TcxListView
              Left = 0
              Top = 0
              Width = 361
              Height = 497
              Align = alLeft
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Lisance Parameters'
                end
                item
                  AutoSize = True
                  Caption = 'Value'
                end>
              ReadOnly = True
              RowSelect = True
              Style.BorderStyle = cbsUltraFlat
              Style.LookAndFeel.Kind = lfOffice11
              StyleDisabled.LookAndFeel.Kind = lfOffice11
              StyleFocused.LookAndFeel.Kind = lfOffice11
              StyleHot.LookAndFeel.Kind = lfOffice11
              TabOrder = 1
              ViewStyle = vsReport
            end
            object cxSplitter1: TcxSplitter
              Left = 361
              Top = 0
              Width = 8
              Height = 497
              HotZoneClassName = 'TcxSimpleStyle'
              Control = lviewLicense
            end
          end
        end
        object dxBarDockControl1: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 705
          Height = 26
          Align = dalTop
          BarManager = barDBAManager
        end
      end
      object tsTop: TcxTabSheet
        Caption = 'Top'
        ImageIndex = 33
        object pcTop: TcxPageControl
          Left = 0
          Top = 0
          Width = 705
          Height = 547
          ActivePage = tsTopSql
          Align = alClient
          Style = 8
          TabOrder = 0
          OnPageChanging = pcTopPageChanging
          ClientRectBottom = 547
          ClientRectRight = 705
          ClientRectTop = 24
          object tsTopSql: TcxTabSheet
            Caption = 'Top Sql'
            ImageIndex = 0
            object pcTopSQL: TcxPageControl
              Left = 0
              Top = 205
              Width = 705
              Height = 318
              ActivePage = tsTopSQLExplainPlan
              Align = alBottom
              Style = 8
              TabOrder = 0
              OnPageChanging = pcTopSQLPageChanging
              ClientRectBottom = 318
              ClientRectRight = 705
              ClientRectTop = 24
              object tsTopSQLInformation: TcxTabSheet
                Caption = 'Information'
                ImageIndex = 2
                object lviewTopSQLInformation: TcxListView
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 294
                  Align = alClient
                  Columns = <
                    item
                      Caption = 'Details'
                      Width = 200
                    end
                    item
                      AutoSize = True
                      Caption = 'Value'
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
              object tsTopSQLSQL: TcxTabSheet
                Caption = 'SQL'
                ImageIndex = 2
                object redtTopSQL: TcxDBRichEdit
                  Left = 0
                  Top = 0
                  Align = alClient
                  DataBinding.DataField = 'SQL'
                  DataBinding.DataSource = dmGenel.dsSQLRecall
                  ParentFont = False
                  Properties.ReadOnly = True
                  Properties.ScrollBars = ssBoth
                  Properties.WordWrap = False
                  Style.Font.Charset = TURKISH_CHARSET
                  Style.Font.Color = clBlue
                  Style.Font.Height = -13
                  Style.Font.Name = 'Courier New'
                  Style.Font.Style = []
                  Style.IsFontAssigned = True
                  TabOrder = 0
                  Height = 294
                  Width = 705
                end
              end
              object tsTopSQLExplainPlan: TcxTabSheet
                Caption = 'Explain Plan'
                ImageIndex = 1
                object treeListCursorExplain: TcxDBTreeList
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 294
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
                  RootValue = -1
                  TabOrder = 0
                  object cxDBTreeListColumn1: TcxDBTreeListColumn
                    Caption.Text = 'STEP NAME'
                    DataBinding.FieldName = 'STEP_NAME'
                    Width = 297
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                  object cxDBTreeListColumn2: TcxDBTreeListColumn
                    DataBinding.FieldName = 'POSITION'
                    Width = 75
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                  object cxDBTreeListColumn3: TcxDBTreeListColumn
                    DataBinding.FieldName = 'COST'
                    Width = 75
                    Position.ColIndex = 1
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                  object cxDBTreeListColumn4: TcxDBTreeListColumn
                    DataBinding.FieldName = 'CARDINALITY'
                    Width = 90
                    Position.ColIndex = 2
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                  object cxDBTreeListColumn5: TcxDBTreeListColumn
                    DataBinding.FieldName = 'BYTES'
                    Width = 67
                    Position.ColIndex = 3
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                  object treeListCursorExplaincxDBTreeListColumn1: TcxDBTreeListColumn
                    Caption.Text = 'CPU Cost'
                    DataBinding.FieldName = 'CPU_COST'
                    Width = 71
                    Position.ColIndex = 5
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                  object treeListCursorExplaincxDBTreeListColumn2: TcxDBTreeListColumn
                    Caption.Text = 'I/O Cost'
                    DataBinding.FieldName = 'IO_COST'
                    Width = 59
                    Position.ColIndex = 6
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                  object treeListCursorExplaincxDBTreeListColumn3: TcxDBTreeListColumn
                    Caption.Text = 'ACCESS PREDICATES'
                    DataBinding.FieldName = 'ACCESS_PREDICATES'
                    Width = 164
                    Position.ColIndex = 7
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                  object treeListCursorExplaincxDBTreeListColumn4: TcxDBTreeListColumn
                    Caption.Text = 'FILTER PREDICATES'
                    DataBinding.FieldName = 'FILTER_PREDICATES'
                    Width = 154
                    Position.ColIndex = 8
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                end
              end
              object tsTopSQLStats: TcxTabSheet
                Caption = 'SQL Stats'
                ImageIndex = 3
                object lvSQLStat: TcxListView
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 294
                  Align = alClient
                  Columns = <
                    item
                      Caption = 'Details'
                      Width = 200
                    end
                    item
                      AutoSize = True
                      Caption = 'Value'
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
            object cxSplitter4: TcxSplitter
              Left = 0
              Top = 197
              Width = 705
              Height = 8
              HotZoneClassName = 'TcxMediaPlayer9Style'
              AlignSplitter = salBottom
              Control = pcTopSQL
            end
            object gridTopSQL: TcxGrid
              Left = 0
              Top = 26
              Width = 705
              Height = 171
              Align = alClient
              TabOrder = 2
              LevelTabs.Style = 8
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
              RootLevelOptions.DetailTabsPosition = dtpTop
              object gridDBTopSQL: TcxGridDBCardView
                DragMode = dmAutomatic
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsTopSQL
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
                object gridDBTopSQLSQL: TcxGridDBCardViewRow
                  DataBinding.FieldName = 'SQL_TEXT'
                  RepositoryItem = cxEditRepositoryMemoItem1
                  Position.BeginsLayer = True
                  Styles.Caption = styleCategoryRow
                end
                object gridDBTopSQLRow1: TcxGridDBCardViewRow
                  DataBinding.FieldName = 'BUFFER_GETS_PER_EXECUTIONS'
                  Position.BeginsLayer = True
                  Styles.Caption = styleCategoryRow
                end
                object gridDBTopSQLRow2: TcxGridDBCardViewRow
                  DataBinding.FieldName = 'DISK_READS_PER_EXECUTIONS'
                  Position.BeginsLayer = False
                  Styles.Caption = styleCategoryRow
                end
                object gridDBTopSQLRow3: TcxGridDBCardViewRow
                  DataBinding.FieldName = 'ROWS_PROCESSED_PER_EXECUTIONS'
                  Position.BeginsLayer = False
                  Styles.Caption = styleCategoryRow
                end
                object gridDBTopSQLRow4: TcxGridDBCardViewRow
                  DataBinding.FieldName = 'HIT_RATIO'
                  Position.BeginsLayer = False
                  Styles.Caption = styleCategoryRow
                end
              end
              object gridTopSQLDBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsTopSQL
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.GroupByBox = False
                object gridTopSQLDBTableView1SQL_TEXT: TcxGridDBColumn
                  DataBinding.FieldName = 'SQL_TEXT'
                  Width = 292
                end
                object gridTopSQLDBTableView1BUFFER_GETS: TcxGridDBColumn
                  DataBinding.FieldName = 'BUFFER_GETS'
                  Width = 75
                end
                object gridTopSQLDBTableView1ROWS_PROCESSED: TcxGridDBColumn
                  DataBinding.FieldName = 'ROWS_PROCESSED'
                  Width = 102
                end
                object gridTopSQLDBTableView1DISK_READS: TcxGridDBColumn
                  DataBinding.FieldName = 'DISK_READS'
                  Width = 68
                end
                object gridTopSQLDBTableView1EXECUTIONS: TcxGridDBColumn
                  DataBinding.FieldName = 'EXECUTIONS'
                  Width = 69
                end
                object gridTopSQLDBTableView1SHARABLE_MEM: TcxGridDBColumn
                  DataBinding.FieldName = 'SHARABLE_MEM'
                  Width = 85
                end
                object gridTopSQLDBTableView1PERSISTENT_MEM: TcxGridDBColumn
                  DataBinding.FieldName = 'PERSISTENT_MEM'
                  Width = 111
                end
                object gridTopSQLDBTableView1RUNTIME_MEM: TcxGridDBColumn
                  DataBinding.FieldName = 'RUNTIME_MEM'
                  Width = 79
                end
                object gridTopSQLDBTableView1SORTS: TcxGridDBColumn
                  DataBinding.FieldName = 'SORTS'
                  Width = 39
                end
                object gridTopSQLDBTableView1PARSE_CALLS: TcxGridDBColumn
                  DataBinding.FieldName = 'PARSE_CALLS'
                  Width = 74
                end
                object gridTopSQLDBTableView1INVALIDATIONS: TcxGridDBColumn
                  DataBinding.FieldName = 'INVALIDATIONS'
                  Width = 84
                end
                object gridTopSQLDBTableView1FIRST_LOAD_TIME: TcxGridDBColumn
                  DataBinding.FieldName = 'FIRST_LOAD_TIME'
                  Width = 98
                end
                object gridTopSQLDBTableView1BUFFER_GETS_PER_EXECUTIONS: TcxGridDBColumn
                  DataBinding.FieldName = 'BUFFER_GETS_PER_EXECUTIONS'
                  Width = 169
                end
                object gridTopSQLDBTableView1DISK_READS_PER_EXECUTIONS: TcxGridDBColumn
                  DataBinding.FieldName = 'DISK_READS_PER_EXECUTIONS'
                  Width = 162
                end
                object gridTopSQLDBTableView1ROWS_PROCESSED_PER_EXECUTIONS: TcxGridDBColumn
                  DataBinding.FieldName = 'ROWS_PROCESSED_PER_EXECUTIONS'
                  Width = 196
                end
                object gridTopSQLDBTableView1HIT_RATIO: TcxGridDBColumn
                  DataBinding.FieldName = 'HIT_RATIO'
                  Width = 61
                end
              end
              object gridTopSQLLevel2: TcxGridLevel
                Caption = 'Table'
                GridView = gridTopSQLDBTableView1
              end
              object gridTopSQLLevel1: TcxGridLevel
                Caption = 'Detail'
                GridView = gridDBTopSQL
              end
            end
            object dxBarDockControl4: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 705
              Height = 26
              Align = dalTop
              BarManager = barDBAManager
            end
          end
          object tsTopSegments: TcxTabSheet
            Caption = 'Top Segments'
            ImageIndex = 1
            object cxSplitter5: TcxSplitter
              Left = 0
              Top = 361
              Width = 705
              Height = 8
              HotZoneClassName = 'TcxMediaPlayer9Style'
              AlignSplitter = salBottom
              Control = lviewTopSegments
            end
            object lviewTopSegments: TcxListView
              Left = 0
              Top = 369
              Width = 705
              Height = 154
              Align = alBottom
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Statistic'
                end
                item
                  AutoSize = True
                  Caption = 'Value'
                end>
              ReadOnly = True
              RowSelect = True
              Style.BorderStyle = cbsUltraFlat
              Style.LookAndFeel.Kind = lfOffice11
              StyleDisabled.LookAndFeel.Kind = lfOffice11
              StyleFocused.LookAndFeel.Kind = lfOffice11
              StyleHot.LookAndFeel.Kind = lfOffice11
              TabOrder = 1
              ViewStyle = vsReport
            end
            object cxGrid2: TcxGrid
              Left = 0
              Top = 26
              Width = 705
              Height = 335
              Align = alClient
              TabOrder = 2
              LevelTabs.Style = 8
              LookAndFeel.Kind = lfOffice11
              RootLevelOptions.DetailTabsPosition = dtpTop
              object cxGridDBChartView1: TcxGridDBChartView
                DataController.DataSource = dsTopSegment
                DiagramArea.AxisCategory.TickMarkLabels = False
                DiagramArea.Values.VaryColorsByCategory = True
                DiagramArea.Values.CaptionPosition = ldvcpAbove
                DiagramArea.Values.MarkerStyle = cmsDiamond
                DiagramBar.AxisCategory.TickMarkLabels = False
                DiagramBar.Values.VaryColorsByCategory = True
                DiagramBar.Values.CaptionPosition = cdvcpOutsideEnd
                DiagramColumn.Active = True
                DiagramColumn.Legend.Orientation = cpoVertical
                DiagramColumn.AxisCategory.TickMarkLabels = False
                DiagramColumn.AxisValue.MinMaxValues = mmvAuto
                DiagramColumn.Values.VaryColorsByCategory = True
                DiagramColumn.Values.CaptionPosition = cdvcpOutsideEnd
                DiagramLine.AxisCategory.TickMarkLabels = False
                DiagramLine.Values.VaryColorsByCategory = True
                DiagramLine.Values.CaptionPosition = ldvcpCenter
                DiagramLine.Values.MarkerStyle = cmsDiamond
                DiagramPie.SeriesSites = True
                DiagramPie.Values.CaptionPosition = pdvcpOutsideEndWithLeaderLines
                OptionsBehavior.ValueHotTrack = vhAlways
                OptionsCustomize.DataDrillDown = False
                OptionsCustomize.DataGroupMoving = False
                OptionsCustomize.OptionsCustomization = False
                OptionsCustomize.SeriesCustomization = False
                ToolBox.DataLevelsInfoVisible = dlivNever
                ToolBox.DiagramSelector = True
                OnValueClick = cxGridDBChartView1ValueClick
                object cxGridDBChartDataGroup1: TcxGridDBChartDataGroup
                  DataBinding.FieldName = 'FULL_OBJECT_NAME'
                end
                object cxGridDBChartSeries1: TcxGridDBChartSeries
                  DataBinding.FieldName = 'VALUE'
                end
              end
              object cxGridDBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsTopSegment
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.GroupByBox = False
                object cxGridDBTableView1OWNER: TcxGridDBColumn
                  DataBinding.FieldName = 'OWNER'
                end
                object cxGridDBTableView1FULL_OBJECT_NAME: TcxGridDBColumn
                  DataBinding.FieldName = 'FULL_OBJECT_NAME'
                end
                object cxGridDBTableView1OBJECT_TYPE: TcxGridDBColumn
                  DataBinding.FieldName = 'OBJECT_TYPE'
                end
                object cxGridDBTableView1VALUE: TcxGridDBColumn
                  DataBinding.FieldName = 'VALUE'
                end
                object cxGridDBTableView1TABLESPACE_NAME: TcxGridDBColumn
                  DataBinding.FieldName = 'TABLESPACE_NAME'
                end
                object cxGridDBTableView1STATISTIC_NAME: TcxGridDBColumn
                  DataBinding.FieldName = 'STATISTIC_NAME'
                end
                object cxGridDBTableView1OBJ: TcxGridDBColumn
                  DataBinding.FieldName = 'OBJ#'
                end
                object cxGridDBTableView1DATAOBJ: TcxGridDBColumn
                  DataBinding.FieldName = 'DATAOBJ#'
                end
              end
              object cxGridLevel1: TcxGridLevel
                Caption = 'Table'
                GridView = cxGridDBTableView1
              end
              object cxGridLevel2: TcxGridLevel
                Caption = 'Chart'
                GridView = cxGridDBChartView1
              end
            end
            object dxBarDockControl3: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 705
              Height = 26
              Align = dalTop
              BarManager = barDBAManager
            end
          end
          object tsTopSessions: TcxTabSheet
            Caption = 'Top Sessions'
            ImageIndex = 2
            object gridTopSessions: TcxGrid
              Left = 0
              Top = 26
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LevelTabs.Style = 8
              LookAndFeel.Kind = lfFlat
              LookAndFeel.NativeStyle = False
              RootLevelOptions.DetailTabsPosition = dtpTop
              object gridDBTopSessions: TcxGridDBChartView
                DataController.DataSource = dsTopSession
                DiagramArea.AxisCategory.TickMarkLabels = False
                DiagramArea.Values.VaryColorsByCategory = True
                DiagramArea.Values.CaptionPosition = ldvcpAbove
                DiagramArea.Values.MarkerStyle = cmsDiamond
                DiagramBar.AxisCategory.TickMarkLabels = False
                DiagramBar.Values.VaryColorsByCategory = True
                DiagramBar.Values.CaptionPosition = cdvcpOutsideEnd
                DiagramColumn.Active = True
                DiagramColumn.Legend.Orientation = cpoVertical
                DiagramColumn.AxisCategory.TickMarkLabels = False
                DiagramColumn.AxisValue.MinMaxValues = mmvAuto
                DiagramColumn.Values.VaryColorsByCategory = True
                DiagramColumn.Values.CaptionPosition = cdvcpOutsideEnd
                DiagramLine.AxisCategory.TickMarkLabels = False
                DiagramLine.Values.VaryColorsByCategory = True
                DiagramLine.Values.CaptionPosition = ldvcpCenter
                DiagramLine.Values.MarkerStyle = cmsDiamond
                DiagramPie.SeriesSites = True
                DiagramPie.Values.CaptionPosition = pdvcpOutsideEndWithLeaderLines
                OptionsBehavior.ValueHotTrack = vhAlways
                OptionsCustomize.DataDrillDown = False
                OptionsCustomize.DataGroupMoving = False
                OptionsCustomize.OptionsCustomization = False
                OptionsCustomize.SeriesCustomization = False
                ToolBox.DataLevelsInfoVisible = dlivNever
                ToolBox.DiagramSelector = True
                object gridDBTopSessionsDataGroup1: TcxGridDBChartDataGroup
                  DataBinding.FieldName = 'SESSIONS'
                end
                object gridDBTopSessionsSeries1: TcxGridDBChartSeries
                  DataBinding.FieldName = 'VALUE'
                end
              end
              object gridTopSessionsDBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsTopSession
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.GroupByBox = False
                object gridTopSessionsDBTableView1SID: TcxGridDBColumn
                  DataBinding.FieldName = 'SID'
                  Width = 45
                end
                object gridTopSessionsDBTableView1SESSIONS: TcxGridDBColumn
                  DataBinding.FieldName = 'SESSIONS'
                  Width = 234
                end
                object gridTopSessionsDBTableView1STATUS: TcxGridDBColumn
                  DataBinding.FieldName = 'STATUS'
                  Width = 60
                end
                object gridTopSessionsDBTableView1OSUSER: TcxGridDBColumn
                  DataBinding.FieldName = 'OSUSER'
                  Width = 64
                end
                object gridTopSessionsDBTableView1MACHINE: TcxGridDBColumn
                  DataBinding.FieldName = 'MACHINE'
                  Width = 139
                end
                object gridTopSessionsDBTableView1TERMINAL: TcxGridDBColumn
                  DataBinding.FieldName = 'TERMINAL'
                end
                object gridTopSessionsDBTableView1PROGRAM: TcxGridDBColumn
                  DataBinding.FieldName = 'PROGRAM'
                  Width = 200
                end
                object gridTopSessionsDBTableView1NAME: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                  Width = 160
                end
                object gridTopSessionsDBTableView1VALUE: TcxGridDBColumn
                  DataBinding.FieldName = 'VALUE'
                end
                object gridTopSessionsDBTableView1MODULE: TcxGridDBColumn
                  DataBinding.FieldName = 'MODULE'
                  Width = 191
                end
                object gridTopSessionsDBTableView1ACTION: TcxGridDBColumn
                  DataBinding.FieldName = 'ACTION'
                  Width = 105
                end
                object gridTopSessionsDBTableView1CLIENT_INFO: TcxGridDBColumn
                  DataBinding.FieldName = 'CLIENT_INFO'
                  Width = 203
                end
              end
              object gridTopSessionsLevel1: TcxGridLevel
                Caption = 'Table'
                GridView = gridTopSessionsDBTableView1
              end
              object gridTopSessionsLevel2: TcxGridLevel
                Caption = 'Chart'
                GridView = gridDBTopSessions
              end
            end
            object dxBarDockControl2: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 705
              Height = 26
              Align = dalTop
              BarManager = barDBAManager
            end
          end
        end
      end
      object tsMemory: TcxTabSheet
        Caption = 'Memory'
        ImageIndex = 13
        object pcMemory: TcxPageControl
          Left = 0
          Top = 26
          Width = 705
          Height = 521
          ActivePage = tsBufferPools
          Align = alClient
          LookAndFeel.Kind = lfOffice11
          TabOrder = 0
          OnPageChanging = pcMemoryPageChanging
          ClientRectBottom = 521
          ClientRectRight = 705
          ClientRectTop = 24
          object tsBufferPools: TcxTabSheet
            Hint = 'Last resfresh'
            Caption = 'Buffer Pools'
            ImageIndex = 0
            object cxGrid3: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 171
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object gridDBBufferPool: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsBufferPool
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object gridDBBufferPoolID: TcxGridDBColumn
                  DataBinding.FieldName = 'ID'
                  Width = 48
                end
                object gridDBBufferPoolNAME: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                  Width = 195
                end
                object gridDBBufferPoolBLOCK_SIZE: TcxGridDBColumn
                  DataBinding.FieldName = 'BLOCK_SIZE'
                  Width = 101
                end
                object gridDBBufferPoolRESIZE_STATE: TcxGridDBColumn
                  DataBinding.FieldName = 'RESIZE_STATE'
                  Width = 108
                end
                object gridDBBufferPoolCURRENT_SIZE: TcxGridDBColumn
                  DataBinding.FieldName = 'CURRENT_SIZE'
                  Width = 137
                end
                object gridDBBufferPoolBUFFERS: TcxGridDBColumn
                  DataBinding.FieldName = 'BUFFERS'
                  Width = 69
                end
                object gridDBBufferPoolTARGET_SIZE: TcxGridDBColumn
                  DataBinding.FieldName = 'TARGET_SIZE'
                  Width = 133
                end
                object gridDBBufferPoolTARGET_BUFFERS: TcxGridDBColumn
                  DataBinding.FieldName = 'TARGET_BUFFERS'
                  Width = 112
                end
                object gridDBBufferPoolPREV_SIZE: TcxGridDBColumn
                  DataBinding.FieldName = 'PREV_SIZE'
                  Width = 74
                end
                object gridDBBufferPoolPREV_BUFFERS: TcxGridDBColumn
                  DataBinding.FieldName = 'PREV_BUFFERS'
                  Width = 74
                end
              end
              object cxGridLevel3: TcxGridLevel
                GridView = gridDBBufferPool
              end
            end
            object lvBufferPool: TcxListView
              Left = 0
              Top = 179
              Width = 705
              Height = 318
              Align = alBottom
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Details'
                end
                item
                  AutoSize = True
                  Caption = 'Value'
                end>
              ReadOnly = True
              RowSelect = True
              Style.BorderStyle = cbsUltraFlat
              Style.LookAndFeel.Kind = lfOffice11
              StyleDisabled.LookAndFeel.Kind = lfOffice11
              StyleFocused.LookAndFeel.Kind = lfOffice11
              StyleHot.LookAndFeel.Kind = lfOffice11
              TabOrder = 1
              ViewStyle = vsReport
            end
            object cxSplitter6: TcxSplitter
              Left = 0
              Top = 171
              Width = 705
              Height = 8
              HotZoneClassName = 'TcxMediaPlayer9Style'
              AlignSplitter = salBottom
              Control = lvBufferPool
            end
          end
          object tsBufferWaitStats: TcxTabSheet
            Caption = 'Buffer Wait Stats'
            ImageIndex = 1
            object cxGrid4: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LevelTabs.Style = 8
              LookAndFeel.Kind = lfOffice11
              RootLevelOptions.DetailTabsPosition = dtpTop
              object cxGridDBChartView2: TcxGridDBChartView
                DataController.DataSource = dsBufferWait
                DiagramArea.AxisCategory.TickMarkLabels = False
                DiagramArea.Values.VaryColorsByCategory = True
                DiagramArea.Values.CaptionPosition = ldvcpAbove
                DiagramArea.Values.MarkerStyle = cmsDiamond
                DiagramBar.AxisCategory.TickMarkLabels = False
                DiagramBar.Values.VaryColorsByCategory = True
                DiagramBar.Values.CaptionPosition = cdvcpOutsideEnd
                DiagramColumn.Active = True
                DiagramColumn.Legend.Orientation = cpoVertical
                DiagramColumn.AxisCategory.TickMarkLabels = False
                DiagramColumn.AxisValue.MinMaxValues = mmvAuto
                DiagramColumn.Values.VaryColorsByCategory = True
                DiagramColumn.Values.CaptionPosition = cdvcpOutsideEnd
                DiagramLine.AxisCategory.TickMarkLabels = False
                DiagramLine.Values.VaryColorsByCategory = True
                DiagramLine.Values.CaptionPosition = ldvcpCenter
                DiagramLine.Values.MarkerStyle = cmsDiamond
                DiagramPie.SeriesSites = True
                DiagramPie.Values.CaptionPosition = pdvcpOutsideEndWithLeaderLines
                OptionsBehavior.ValueHotTrack = vhAlways
                OptionsCustomize.DataDrillDown = False
                OptionsCustomize.DataGroupMoving = False
                OptionsCustomize.OptionsCustomization = False
                OptionsCustomize.SeriesCustomization = False
                ToolBox.DataLevelsInfoVisible = dlivNever
                ToolBox.DiagramSelector = True
                object cxGridDBChartDataGroup2: TcxGridDBChartDataGroup
                  DataBinding.FieldName = 'CLASS'
                end
                object cxGridDBChartView2Series1: TcxGridDBChartSeries
                  DataBinding.FieldName = 'TIME'
                end
              end
              object cxGridDBTableView2: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsBufferWait
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.GroupByBox = False
                object cxGridDBTableView2CLASS: TcxGridDBColumn
                  DataBinding.FieldName = 'CLASS'
                  Width = 228
                end
                object cxGridDBTableView2COUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'COUNT'
                  Width = 105
                end
                object cxGridDBTableView2TIME: TcxGridDBColumn
                  DataBinding.FieldName = 'TIME'
                  Width = 153
                end
              end
              object cxGridLevel4: TcxGridLevel
                Caption = 'Table'
                GridView = cxGridDBTableView2
              end
              object cxGridLevel5: TcxGridLevel
                Caption = 'Chart'
                GridView = cxGridDBChartView2
              end
            end
          end
          object tsSharedPoolAdvice: TcxTabSheet
            Caption = 'Shared Pool Advice'
            ImageIndex = 2
            object cxGrid7: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView5: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsSharedPoolAdvice
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView5SHARED_POOL_SIZE_FOR_ESTIMATE: TcxGridDBColumn
                  DataBinding.FieldName = 'SHARED_POOL_SIZE_FOR_ESTIMATE'
                  Width = 189
                end
                object cxGridDBTableView5SHARED_POOL_SIZE_FACTOR: TcxGridDBColumn
                  DataBinding.FieldName = 'SHARED_POOL_SIZE_FACTOR'
                  Width = 154
                end
                object cxGridDBTableView5ESTD_LC_SIZE: TcxGridDBColumn
                  DataBinding.FieldName = 'ESTD_LC_SIZE'
                  Width = 91
                end
                object cxGridDBTableView5ESTD_LC_MEMORY_OBJECTS: TcxGridDBColumn
                  DataBinding.FieldName = 'ESTD_LC_MEMORY_OBJECTS'
                  Width = 91
                end
                object cxGridDBTableView5ESTD_LC_TIME_SAVED: TcxGridDBColumn
                  DataBinding.FieldName = 'ESTD_LC_TIME_SAVED'
                  Width = 90
                end
                object cxGridDBTableView5ESTD_LC_TIME_SAVED_FACTOR: TcxGridDBColumn
                  DataBinding.FieldName = 'ESTD_LC_TIME_SAVED_FACTOR'
                  Width = 92
                end
                object cxGridDBTableView5ESTD_LC_MEMORY_OBJECT_HITS: TcxGridDBColumn
                  DataBinding.FieldName = 'ESTD_LC_MEMORY_OBJECT_HITS'
                  Width = 90
                end
              end
              object cxGridLevel8: TcxGridLevel
                GridView = cxGridDBTableView5
              end
            end
          end
          object tsPGAAdvice: TcxTabSheet
            Caption = 'PGA Advice'
            ImageIndex = 4
            object cxGrid5: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView3: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsPGAAdvice
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView3PGA_TARGET_FOR_ESTIMATE: TcxGridDBColumn
                  DataBinding.FieldName = 'PGA_TARGET_FOR_ESTIMATE'
                  Width = 167
                end
                object cxGridDBTableView3PGA_TARGET_FACTOR: TcxGridDBColumn
                  DataBinding.FieldName = 'PGA_TARGET_FACTOR'
                  Width = 135
                end
                object cxGridDBTableView3BYTES_PROCESSED: TcxGridDBColumn
                  DataBinding.FieldName = 'BYTES_PROCESSED'
                  Width = 101
                end
                object cxGridDBTableView3ESTD_EXTRA_BYTES_RW: TcxGridDBColumn
                  DataBinding.FieldName = 'ESTD_EXTRA_BYTES_RW'
                  Width = 156
                end
                object cxGridDBTableView3ESTD_PGA_CACHE_HIT_PERCENTAGE: TcxGridDBColumn
                  DataBinding.FieldName = 'ESTD_PGA_CACHE_HIT_PERCENTAGE'
                  Width = 191
                end
                object cxGridDBTableView3ESTD_OVERALLOC_COUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'ESTD_OVERALLOC_COUNT'
                  Width = 47
                end
              end
              object cxGridLevel6: TcxGridLevel
                GridView = cxGridDBTableView3
              end
            end
          end
          object tsPGAStats: TcxTabSheet
            Caption = 'PGA Stats'
            ImageIndex = 5
            object cxGrid6: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView4: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsPGAStat
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView4NAME: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                  Width = 238
                end
                object cxGridDBTableView4VALUE: TcxGridDBColumn
                  DataBinding.FieldName = 'VALUE'
                  Width = 118
                end
                object cxGridDBTableView4UNIT: TcxGridDBColumn
                  DataBinding.FieldName = 'UNIT'
                  Width = 441
                end
              end
              object cxGridLevel7: TcxGridLevel
                GridView = cxGridDBTableView4
              end
            end
          end
          object tsDataCacheAdvice: TcxTabSheet
            Caption = 'Data Cache Advice'
            ImageIndex = 6
            object cxGrid8: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView6: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsDataCacheAdvice
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView6ID: TcxGridDBColumn
                  DataBinding.FieldName = 'ID'
                  Width = 52
                end
                object cxGridDBTableView6NAME: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                  Width = 119
                end
                object cxGridDBTableView6BLOCK_SIZE: TcxGridDBColumn
                  DataBinding.FieldName = 'BLOCK_SIZE'
                  Width = 99
                end
                object cxGridDBTableView6ADVICE_STATUS: TcxGridDBColumn
                  DataBinding.FieldName = 'ADVICE_STATUS'
                  Width = 34
                end
                object cxGridDBTableView6SIZE_FOR_ESTIMATE: TcxGridDBColumn
                  DataBinding.FieldName = 'SIZE_FOR_ESTIMATE'
                  Width = 99
                end
                object cxGridDBTableView6SIZE_FACTOR: TcxGridDBColumn
                  DataBinding.FieldName = 'SIZE_FACTOR'
                  Width = 98
                end
                object cxGridDBTableView6BUFFERS_FOR_ESTIMATE: TcxGridDBColumn
                  DataBinding.FieldName = 'BUFFERS_FOR_ESTIMATE'
                  Width = 99
                end
                object cxGridDBTableView6ESTD_PHYSICAL_READ_FACTOR: TcxGridDBColumn
                  DataBinding.FieldName = 'ESTD_PHYSICAL_READ_FACTOR'
                  Width = 98
                end
                object cxGridDBTableView6ESTD_PHYSICAL_READS: TcxGridDBColumn
                  DataBinding.FieldName = 'ESTD_PHYSICAL_READS'
                  Width = 99
                end
              end
              object cxGridLevel9: TcxGridLevel
                GridView = cxGridDBTableView6
              end
            end
          end
        end
        object dxBarDockControl5: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 705
          Height = 26
          Align = dalTop
          BarManager = barDBAManager
        end
      end
      object tsWaits: TcxTabSheet
        Caption = 'Waits'
        ImageIndex = 4
        object pcWaits: TcxPageControl
          Left = 0
          Top = 26
          Width = 705
          Height = 521
          ActivePage = tsEvents
          Align = alClient
          Style = 8
          TabOrder = 0
          OnPageChanging = pcWaitsPageChanging
          ClientRectBottom = 521
          ClientRectRight = 705
          ClientRectTop = 24
          object tsEvents: TcxTabSheet
            Caption = 'Events'
            ImageIndex = 0
            object cxGrid9: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView7: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsEvent
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView7EVENT: TcxGridDBColumn
                  DataBinding.FieldName = 'EVENT'
                  Width = 265
                end
                object cxGridDBTableView7Totalwaits: TcxGridDBColumn
                  DataBinding.FieldName = 'Total waits'
                  Width = 133
                end
                object cxGridDBTableView7Totaltimeouts: TcxGridDBColumn
                  DataBinding.FieldName = 'Total timeouts'
                  Width = 134
                end
                object cxGridDBTableView7Timewaited: TcxGridDBColumn
                  DataBinding.FieldName = 'Time waited'
                  Width = 132
                end
                object cxGridDBTableView7Averagewait: TcxGridDBColumn
                  DataBinding.FieldName = 'Average wait'
                  Width = 133
                end
              end
              object cxGridLevel10: TcxGridLevel
                GridView = cxGridDBTableView7
              end
            end
          end
          object tsLocks: TcxTabSheet
            Caption = 'Locks'
            ImageIndex = 1
            object cxGrid10: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 171
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView8: TcxGridDBTableView
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
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView8SID: TcxGridDBColumn
                  DataBinding.FieldName = 'SID'
                end
                object cxGridDBTableView8USERNAME: TcxGridDBColumn
                  DataBinding.FieldName = 'USERNAME'
                end
                object cxGridDBTableView8STATUS: TcxGridDBColumn
                  DataBinding.FieldName = 'STATUS'
                end
                object cxGridDBTableView8TYPE: TcxGridDBColumn
                  DataBinding.FieldName = 'TYPE'
                end
                object cxGridDBTableView8OSUSER: TcxGridDBColumn
                  DataBinding.FieldName = 'OSUSER'
                end
                object cxGridDBTableView8SERVER: TcxGridDBColumn
                  DataBinding.FieldName = 'SERVER'
                end
                object cxGridDBTableView8SERIAL: TcxGridDBColumn
                  DataBinding.FieldName = 'SERIAL#'
                end
                object cxGridDBTableView8SQL_ADDRESS: TcxGridDBColumn
                  DataBinding.FieldName = 'SQL_ADDRESS'
                  Visible = False
                end
                object cxGridDBTableView8SQL_HASH_VALUE: TcxGridDBColumn
                  DataBinding.FieldName = 'SQL_HASH_VALUE'
                  Visible = False
                end
                object cxGridDBTableView8PREV_SQL_ADDR: TcxGridDBColumn
                  DataBinding.FieldName = 'PREV_SQL_ADDR'
                  Visible = False
                end
                object cxGridDBTableView8PREV_HASH_VALUE: TcxGridDBColumn
                  DataBinding.FieldName = 'PREV_HASH_VALUE'
                  Visible = False
                end
              end
              object cxGridLevel11: TcxGridLevel
                GridView = cxGridDBTableView8
              end
            end
            object pcLock: TcxPageControl
              Left = 0
              Top = 179
              Width = 705
              Height = 318
              ActivePage = tsLockedObjects
              Align = alBottom
              Style = 8
              TabOrder = 1
              OnPageChanging = pcLockPageChanging
              ClientRectBottom = 318
              ClientRectRight = 705
              ClientRectTop = 24
              object tsLockedObjects: TcxTabSheet
                Caption = 'Locked Objects'
                ImageIndex = 0
                object cxGrid11: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 294
                  Align = alClient
                  TabOrder = 0
                  LookAndFeel.Kind = lfOffice11
                  object griDBLockObjects: TcxGridDBTableView
                    NavigatorButtons.ConfirmDelete = False
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsData.CancelOnExit = False
                    OptionsData.Deleting = False
                    OptionsData.DeletingConfirmation = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsSelection.CellSelect = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.GroupByBox = False
                    object griDBLockObjectsTYPE: TcxGridDBColumn
                      Caption = 'Lock Type'
                      DataBinding.FieldName = 'TYPE'
                      Width = 102
                    end
                    object griDBLockObjectsCTIME: TcxGridDBColumn
                      Caption = 'Time holding (sec)'
                      DataBinding.FieldName = 'CTIME'
                      Width = 106
                    end
                    object griDBLockObjectsOBJECT_TYPE: TcxGridDBColumn
                      Caption = 'Object type'
                      DataBinding.FieldName = 'OBJECT_TYPE'
                      Width = 120
                    end
                    object griDBLockObjectsOWNER: TcxGridDBColumn
                      Caption = 'Owner'
                      DataBinding.FieldName = 'OWNER'
                      Width = 104
                    end
                    object griDBLockObjectsOBJECT_NAME: TcxGridDBColumn
                      Caption = 'Object'
                      DataBinding.FieldName = 'OBJECT_NAME'
                      Width = 168
                    end
                    object griDBLockObjectsLOCKED_MODE: TcxGridDBColumn
                      Caption = 'Locked Mode'
                      DataBinding.FieldName = 'LOCKED_MODE'
                      Width = 197
                    end
                  end
                  object cxGridLevel12: TcxGridLevel
                    GridView = griDBLockObjects
                  end
                end
              end
              object tsLockSession: TcxTabSheet
                Caption = 'Session'
                ImageIndex = 1
                object lvLockSession: TcxListView
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 294
                  Align = alClient
                  Columns = <
                    item
                      Caption = 'Details'
                      Width = 200
                    end
                    item
                      AutoSize = True
                      Caption = 'Value'
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
              object tsLockSQL: TcxTabSheet
                Caption = 'SQL'
                ImageIndex = 2
                object redtWaitLockSQL: TcxDBRichEdit
                  Left = 0
                  Top = 0
                  Align = alClient
                  DataBinding.DataField = 'SQL'
                  DataBinding.DataSource = dmGenel.dsSQLRecall
                  ParentFont = False
                  Properties.ReadOnly = True
                  Properties.ScrollBars = ssBoth
                  Properties.WordWrap = False
                  Style.Font.Charset = TURKISH_CHARSET
                  Style.Font.Color = clBlue
                  Style.Font.Height = -13
                  Style.Font.Name = 'Courier New'
                  Style.Font.Style = []
                  Style.IsFontAssigned = True
                  TabOrder = 0
                  Height = 294
                  Width = 705
                end
              end
              object tsLockSQLStat: TcxTabSheet
                Caption = 'SQL Stat'
                ImageIndex = 3
                object lvLockSQLStat: TcxListView
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 294
                  Align = alClient
                  Columns = <
                    item
                      Caption = 'Details'
                      Width = 200
                    end
                    item
                      AutoSize = True
                      Caption = 'Value'
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
              object tsLocksSessionStat: TcxTabSheet
                Caption = 'Session Stats'
                ImageIndex = 4
                object lvWaitSessionStat: TcxListView
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 294
                  Align = alClient
                  Columns = <
                    item
                      Caption = 'Statistic'
                      Width = 200
                    end
                    item
                      AutoSize = True
                      Caption = 'Value'
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
              object tsLockWaits: TcxTabSheet
                Caption = 'Lock Waits'
                ImageIndex = 5
                object cxGrid12: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 294
                  Align = alClient
                  TabOrder = 0
                  LookAndFeel.Kind = lfOffice11
                  object gridDBLockWait: TcxGridDBTableView
                    NavigatorButtons.ConfirmDelete = False
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsData.CancelOnExit = False
                    OptionsData.Deleting = False
                    OptionsData.DeletingConfirmation = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsSelection.CellSelect = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.GroupByBox = False
                    object gridDBLockWaitEVENT: TcxGridDBColumn
                      DataBinding.FieldName = 'EVENT'
                      Width = 271
                    end
                    object gridDBLockWaitTIME_WAITED: TcxGridDBColumn
                      DataBinding.FieldName = 'TIME_WAITED'
                      Width = 105
                    end
                    object gridDBLockWaitTOTAL_WAITS: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_WAITS'
                      Width = 105
                    end
                    object gridDBLockWaitTOTAL_TIMEOUTS: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_TIMEOUTS'
                      Width = 106
                    end
                    object gridDBLockWaitAVERAGE_WAIT: TcxGridDBColumn
                      DataBinding.FieldName = 'AVERAGE_WAIT'
                      Width = 105
                    end
                    object gridDBLockWaitMAX_WAIT: TcxGridDBColumn
                      DataBinding.FieldName = 'MAX_WAIT'
                      Width = 105
                    end
                  end
                  object cxGridLevel13: TcxGridLevel
                    GridView = gridDBLockWait
                  end
                end
              end
            end
            object cxSplitter7: TcxSplitter
              Left = 0
              Top = 171
              Width = 705
              Height = 8
              HotZoneClassName = 'TcxMediaPlayer9Style'
              AlignSplitter = salBottom
              Control = pcLock
            end
          end
          object tsLatches: TcxTabSheet
            Caption = 'Latches'
            ImageIndex = 2
            object cxGrid13: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView9: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsLatches
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView9LATCH: TcxGridDBColumn
                  DataBinding.FieldName = 'LATCH#'
                  Width = 59
                end
                object cxGridDBTableView9LEVEL: TcxGridDBColumn
                  DataBinding.FieldName = 'LEVEL#'
                  Width = 53
                end
                object cxGridDBTableView9NAME: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                  Width = 243
                end
                object cxGridDBTableView9WAIT_TIME: TcxGridDBColumn
                  DataBinding.FieldName = 'WAIT_TIME'
                  Width = 66
                end
                object cxGridDBTableView9HIT_RATE: TcxGridDBColumn
                  DataBinding.FieldName = 'HIT_RATE'
                  Width = 58
                end
                object cxGridDBTableView9GETS: TcxGridDBColumn
                  DataBinding.FieldName = 'GETS'
                  Width = 52
                end
                object cxGridDBTableView9MISSES: TcxGridDBColumn
                  DataBinding.FieldName = 'MISSES'
                  Width = 55
                end
                object cxGridDBTableView9SLEEPS: TcxGridDBColumn
                  DataBinding.FieldName = 'SLEEPS'
                  Width = 51
                end
                object cxGridDBTableView9IMMEDIATE_GETS: TcxGridDBColumn
                  DataBinding.FieldName = 'IMMEDIATE_GETS'
                  Width = 97
                end
                object cxGridDBTableView9IMMEDIATE_MISSES: TcxGridDBColumn
                  DataBinding.FieldName = 'IMMEDIATE_MISSES'
                  Width = 106
                end
                object cxGridDBTableView9SPIN_GETS: TcxGridDBColumn
                  DataBinding.FieldName = 'SPIN_GETS'
                  Width = 63
                end
                object cxGridDBTableView9SLEEP1: TcxGridDBColumn
                  DataBinding.FieldName = 'SLEEP1'
                  Width = 31
                end
                object cxGridDBTableView9SLEEP2: TcxGridDBColumn
                  DataBinding.FieldName = 'SLEEP2'
                  Width = 35
                end
                object cxGridDBTableView9SLEEP3: TcxGridDBColumn
                  DataBinding.FieldName = 'SLEEP3'
                  Width = 41
                end
                object cxGridDBTableView9SLEEP4: TcxGridDBColumn
                  DataBinding.FieldName = 'SLEEP4'
                  Width = 41
                end
              end
              object cxGridLevel14: TcxGridLevel
                GridView = cxGridDBTableView9
              end
            end
          end
          object tsChildLatches: TcxTabSheet
            Caption = 'Child Latches'
            ImageIndex = 3
            object cxGrid14: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView10: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsChildLatches
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView10NAME: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                  Visible = False
                  GroupIndex = 0
                  Width = 187
                end
                object cxGridDBTableView10LATCH: TcxGridDBColumn
                  DataBinding.FieldName = 'LATCH#'
                  Width = 59
                end
                object cxGridDBTableView10CHILD: TcxGridDBColumn
                  DataBinding.FieldName = 'CHILD#'
                  Width = 46
                end
                object cxGridDBTableView10LEVEL: TcxGridDBColumn
                  DataBinding.FieldName = 'LEVEL#'
                  Width = 46
                end
                object cxGridDBTableView10GETS: TcxGridDBColumn
                  DataBinding.FieldName = 'GETS'
                  Width = 46
                end
                object cxGridDBTableView10MISSES: TcxGridDBColumn
                  DataBinding.FieldName = 'MISSES'
                  Width = 46
                end
                object cxGridDBTableView10SLEEPS: TcxGridDBColumn
                  DataBinding.FieldName = 'SLEEPS'
                  Width = 45
                end
                object cxGridDBTableView10IMMEDIATE_GETS: TcxGridDBColumn
                  DataBinding.FieldName = 'IMMEDIATE_GETS'
                  Width = 47
                end
                object cxGridDBTableView10IMMEDIATE_MISSES: TcxGridDBColumn
                  DataBinding.FieldName = 'IMMEDIATE_MISSES'
                  Width = 46
                end
                object cxGridDBTableView10SPIN_GETS: TcxGridDBColumn
                  DataBinding.FieldName = 'SPIN_GETS'
                  Width = 46
                end
                object cxGridDBTableView10SLEEP1: TcxGridDBColumn
                  DataBinding.FieldName = 'SLEEP1'
                  Width = 46
                end
                object cxGridDBTableView10SLEEP2: TcxGridDBColumn
                  DataBinding.FieldName = 'SLEEP2'
                  Width = 45
                end
                object cxGridDBTableView10SLEEP3: TcxGridDBColumn
                  DataBinding.FieldName = 'SLEEP3'
                  Width = 46
                end
                object cxGridDBTableView10SLEEP4: TcxGridDBColumn
                  DataBinding.FieldName = 'SLEEP4'
                  Width = 46
                end
              end
              object cxGridLevel15: TcxGridLevel
                GridView = cxGridDBTableView10
              end
            end
          end
          object tsLatchHolders: TcxTabSheet
            Caption = 'Latch Holders'
            ImageIndex = 4
            object cxGrid15: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView11: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsLatchHolders
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView11NAME: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                end
                object cxGridDBTableView11SID: TcxGridDBColumn
                  DataBinding.FieldName = 'SID'
                end
                object cxGridDBTableView11SERIAL: TcxGridDBColumn
                  DataBinding.FieldName = 'SERIAL#'
                end
                object cxGridDBTableView11USERNAME: TcxGridDBColumn
                  DataBinding.FieldName = 'USERNAME'
                end
                object cxGridDBTableView11OSUSER: TcxGridDBColumn
                  DataBinding.FieldName = 'OSUSER'
                end
                object cxGridDBTableView11MACHINE: TcxGridDBColumn
                  DataBinding.FieldName = 'MACHINE'
                end
                object cxGridDBTableView11TERMINAL: TcxGridDBColumn
                  DataBinding.FieldName = 'TERMINAL'
                end
                object cxGridDBTableView11PROGRAM: TcxGridDBColumn
                  DataBinding.FieldName = 'PROGRAM'
                end
              end
              object cxGridLevel16: TcxGridLevel
                GridView = cxGridDBTableView11
              end
            end
          end
        end
        object dxBarDockControl6: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 705
          Height = 26
          Align = dalTop
          BarManager = barDBAManager
        end
      end
      object tsStorage: TcxTabSheet
        Caption = 'Storage'
        ImageIndex = 5
        object pcStorage: TcxPageControl
          Left = 0
          Top = 26
          Width = 705
          Height = 521
          ActivePage = tsTablespace
          Align = alClient
          Style = 8
          TabOrder = 0
          OnPageChanging = pcStoragePageChanging
          ClientRectBottom = 521
          ClientRectRight = 705
          ClientRectTop = 24
          object tsTablespace: TcxTabSheet
            Caption = 'Tablespace'
            ImageIndex = 0
            object cxGrid16: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 219
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              RootLevelOptions.DetailTabsPosition = dtpTop
              object cxGridDBTableView12: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsTablespace
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView12TABLESPACE_NAME: TcxGridDBColumn
                  Caption = 'Tablespace Name'
                  DataBinding.FieldName = 'TABLESPACE_NAME'
                  Width = 179
                end
                object cxGridDBTableView12PERCENT_USED: TcxGridDBColumn
                  Caption = 'Percent Used'
                  DataBinding.FieldName = 'PERCENT_USED'
                  PropertiesClassName = 'TcxProgressBarProperties'
                  Properties.BarStyle = cxbsGradient
                  Properties.BeginColor = clPurple
                  Properties.PeakValue = 99.830000000000000000
                  Properties.SolidTextColor = True
                  Width = 112
                end
                object cxGridDBTableView12BYTES: TcxGridDBColumn
                  Caption = 'Size (Mb)'
                  DataBinding.FieldName = 'BYTES'
                  Width = 56
                end
                object cxGridDBTableView12MAXBYTES: TcxGridDBColumn
                  Caption = 'Max (Mb)'
                  DataBinding.FieldName = 'MAXBYTES'
                  Width = 58
                end
                object cxGridDBTableView12BYTES_FREE: TcxGridDBColumn
                  Caption = 'Free (Mb)'
                  DataBinding.FieldName = 'BYTES_FREE'
                  Width = 56
                end
                object cxGridDBTableView12TABLESPACE_TYPE: TcxGridDBColumn
                  Caption = 'Type'
                  DataBinding.FieldName = 'TABLESPACE_TYPE'
                  Width = 56
                end
                object cxGridDBTableView12STATUS: TcxGridDBColumn
                  Caption = 'Status'
                  DataBinding.FieldName = 'STATUS'
                  Width = 52
                end
                object cxGridDBTableView12CONTENTS: TcxGridDBColumn
                  Caption = 'Contents'
                  DataBinding.FieldName = 'CONTENTS'
                  Width = 52
                end
                object cxGridDBTableView12LOGGING: TcxGridDBColumn
                  Caption = 'Logging'
                  DataBinding.FieldName = 'LOGGING'
                  Width = 51
                end
                object cxGridDBTableView12EXTENT_MANAGEMENT: TcxGridDBColumn
                  Caption = 'Extent Management'
                  DataBinding.FieldName = 'EXTENT_MANAGEMENT'
                  Width = 56
                end
                object cxGridDBTableView12ALLOCATION_TYPE: TcxGridDBColumn
                  Caption = 'Allocation Type'
                  DataBinding.FieldName = 'ALLOCATION_TYPE'
                  Width = 52
                end
              end
              object cxGrid16DBChartView1: TcxGridDBChartView
                DataController.DataSource = dsTablespace
                DiagramColumn.Active = True
                OptionsCustomize.DataDrillDown = False
                OptionsCustomize.DataDrillUpMethod = ddumNone
                OptionsCustomize.DataGroupMoving = False
                OptionsCustomize.OptionsCustomization = False
                OptionsCustomize.SeriesCustomization = False
                Title.Text = 'Total Space (MB)'
                Title.Position = cppTop
                ToolBox.DataLevelsInfoVisible = dlivNever
                ToolBox.DiagramSelector = True
                OnValueClick = cxGrid16DBChartView1ValueClick
                object cxGrid16DBChartView1DataGroup1: TcxGridDBChartDataGroup
                  DataBinding.FieldName = 'TABLESPACE_NAME'
                end
                object cxGrid16DBChartView1Series1: TcxGridDBChartSeries
                  DataBinding.FieldName = 'BYTES'
                  DisplayText = 'Size (Mb)'
                end
                object cxGrid16DBChartView1Series2: TcxGridDBChartSeries
                  DataBinding.FieldName = 'BYTES_FREE'
                  DisplayText = 'Free (Mb)'
                end
              end
              object cxGridLevel17: TcxGridLevel
                Caption = 'Table'
                GridView = cxGridDBTableView12
              end
              object cxGrid16Level1: TcxGridLevel
                Caption = 'Chart'
                GridView = cxGrid16DBChartView1
              end
            end
            object pcTablespace: TcxPageControl
              Left = 0
              Top = 227
              Width = 705
              Height = 270
              ActivePage = tsTablespaceFiles
              Align = alBottom
              Style = 8
              TabOrder = 1
              OnPageChanging = pcTablespacePageChanging
              ClientRectBottom = 270
              ClientRectRight = 705
              ClientRectTop = 24
              object tsTablespaceFiles: TcxTabSheet
                Caption = 'Files'
                ImageIndex = 0
                object cxGrid17: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 246
                  Align = alClient
                  TabOrder = 0
                  LookAndFeel.Kind = lfOffice11
                  object gridDBTablespaceFile: TcxGridDBTableView
                    NavigatorButtons.ConfirmDelete = False
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsData.CancelOnExit = False
                    OptionsData.Deleting = False
                    OptionsData.DeletingConfirmation = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsSelection.CellSelect = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.GroupByBox = False
                    object gridDBTablespaceFileFILE_NAME: TcxGridDBColumn
                      Caption = 'File Name'
                      DataBinding.FieldName = 'FILE_NAME'
                      Width = 192
                    end
                    object gridDBTablespaceFileBYTES: TcxGridDBColumn
                      Caption = 'Size (Mb)'
                      DataBinding.FieldName = 'BYTES'
                      Width = 76
                    end
                    object gridDBTablespaceFileBYTES_FREE: TcxGridDBColumn
                      Caption = 'Free (Mb)'
                      DataBinding.FieldName = 'BYTES_FREE'
                      Width = 75
                    end
                    object gridDBTablespaceFileSTATUS: TcxGridDBColumn
                      Caption = 'Status'
                      DataBinding.FieldName = 'STATUS'
                      Width = 76
                    end
                    object gridDBTablespaceFileBLOCKS: TcxGridDBColumn
                      Caption = 'Blocks'
                      DataBinding.FieldName = 'BLOCKS'
                      Width = 76
                    end
                    object gridDBTablespaceFileAUTOEXTENSIBLE: TcxGridDBColumn
                      Caption = 'Autoextensible'
                      DataBinding.FieldName = 'AUTOEXTENSIBLE'
                      Width = 75
                    end
                    object gridDBTablespaceFileINCREMENT_BY: TcxGridDBColumn
                      Caption = 'Increment by'
                      DataBinding.FieldName = 'INCREMENT_BY'
                      Width = 76
                    end
                    object gridDBTablespaceFileMAXBYTES: TcxGridDBColumn
                      Caption = 'Max bytes'
                      DataBinding.FieldName = 'MAXBYTES'
                      Width = 75
                    end
                    object gridDBTablespaceFileMAXBLOCKS: TcxGridDBColumn
                      Caption = 'Max blocks'
                      DataBinding.FieldName = 'MAXBLOCKS'
                      Width = 76
                    end
                  end
                  object cxGridLevel18: TcxGridLevel
                    GridView = gridDBTablespaceFile
                  end
                end
              end
              object tsTablespaceObject: TcxTabSheet
                Caption = 'Objects'
                ImageIndex = 1
                object cxGrid18: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 246
                  Align = alClient
                  TabOrder = 0
                  LookAndFeel.Kind = lfOffice11
                  object gridDBTablespaceObject: TcxGridDBTableView
                    NavigatorButtons.ConfirmDelete = False
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsData.CancelOnExit = False
                    OptionsData.Deleting = False
                    OptionsData.DeletingConfirmation = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsSelection.CellSelect = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.GroupByBox = False
                    object gridDBTablespaceObjectOWNER: TcxGridDBColumn
                      DataBinding.FieldName = 'OWNER'
                      Width = 95
                    end
                    object gridDBTablespaceObjectOBJECTNAME: TcxGridDBColumn
                      DataBinding.FieldName = 'OBJECTNAME'
                      Width = 81
                    end
                    object gridDBTablespaceObjectOBJECT_TYPE: TcxGridDBColumn
                      DataBinding.FieldName = 'OBJECT_TYPE'
                      Width = 120
                    end
                    object gridDBTablespaceObjectOBJECT_SIZE: TcxGridDBColumn
                      DataBinding.FieldName = 'OBJECT_SIZE'
                      Width = 139
                    end
                    object gridDBTablespaceObjectINITIAL_EX: TcxGridDBColumn
                      DataBinding.FieldName = 'INITIAL_EX'
                      Width = 124
                    end
                    object gridDBTablespaceObjectNEXT_EX: TcxGridDBColumn
                      DataBinding.FieldName = 'NEXT_EX'
                      Width = 76
                    end
                    object gridDBTablespaceObjectEXTENTS: TcxGridDBColumn
                      DataBinding.FieldName = 'EXTENTS'
                      Width = 45
                    end
                    object gridDBTablespaceObjectTTLSIZE: TcxGridDBColumn
                      DataBinding.FieldName = 'TTLSIZE'
                      Width = 41
                    end
                    object gridDBTablespaceObjectMAX_EXTENTS: TcxGridDBColumn
                      DataBinding.FieldName = 'MAX_EXTENTS'
                      Width = 76
                    end
                  end
                  object cxGridLevel19: TcxGridLevel
                    GridView = gridDBTablespaceObject
                  end
                end
              end
              object tsTablespaceQuotas: TcxTabSheet
                Caption = 'Quotas'
                ImageIndex = 2
                object cxGrid19: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 246
                  Align = alClient
                  TabOrder = 0
                  LookAndFeel.Kind = lfOffice11
                  object gridDBQuotas: TcxGridDBTableView
                    NavigatorButtons.ConfirmDelete = False
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsData.CancelOnExit = False
                    OptionsData.Deleting = False
                    OptionsData.DeletingConfirmation = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsSelection.CellSelect = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.GroupByBox = False
                    object gridDBQuotasUSERNAME: TcxGridDBColumn
                      Caption = 'User name'
                      DataBinding.FieldName = 'USERNAME'
                    end
                    object gridDBQuotasDECODEMAX_BYTES1UNLIMITEDMAX_BYTES1024: TcxGridDBColumn
                      Caption = 'Quota (KB)'
                      DataBinding.FieldName = 'DECODE(MAX_BYTES,-1,'#39'UNLIMITED'#39',MAX_BYTES/1024)'
                    end
                    object gridDBQuotasBYTES1024: TcxGridDBColumn
                      Caption = 'Used (Kb)'
                      DataBinding.FieldName = 'BYTES/1024'
                    end
                    object gridDBQuotasDECODEMAX_BYTES1000ROUNDBYTESMAX_BYTES1002: TcxGridDBColumn
                      Caption = 'Percent Used'
                      DataBinding.FieldName = 'DECODE(MAX_BYTES,-1,0,0,0,ROUND((BYTES/MAX_BYTES)*100,2))'
                    end
                  end
                  object cxGridLevel20: TcxGridLevel
                    GridView = gridDBQuotas
                  end
                end
              end
            end
            object cxSplitter8: TcxSplitter
              Left = 0
              Top = 219
              Width = 705
              Height = 8
              HotZoneClassName = 'TcxMediaPlayer9Style'
              AlignSplitter = salBottom
              Control = pcTablespace
            end
          end
          object tsTablespaceFragmentation: TcxTabSheet
            Caption = 'Fragmentation'
            ImageIndex = 1
            object cxGrid32: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView19: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsFragmentations
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView19TABLESPACE_NAME: TcxGridDBColumn
                  Caption = 'Tablespace Name'
                  DataBinding.FieldName = 'TABLESPACE_NAME'
                  Width = 188
                end
                object cxGridDBTableView19FRAGMENTATION_INDEX: TcxGridDBColumn
                  Caption = 'Fragmentation Index'
                  DataBinding.FieldName = 'FRAGMENTATION_INDEX'
                  Width = 172
                end
                object cxGridDBTableView19FREE_CHUNKS: TcxGridDBColumn
                  Caption = 'Free Chunks'
                  DataBinding.FieldName = 'FREE_CHUNKS'
                  Width = 171
                end
                object cxGridDBTableView19LARGEST_CHUNK: TcxGridDBColumn
                  Caption = 'Largest Chunk'
                  DataBinding.FieldName = 'LARGEST_CHUNK'
                  Width = 172
                end
              end
              object cxGridLevel32: TcxGridLevel
                GridView = cxGridDBTableView19
              end
            end
          end
          object tsTablespaceObjects: TcxTabSheet
            Caption = 'Objects'
            ImageIndex = 2
            object cxGrid36: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView23: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsTablespaceObject
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView23TABLESPACE_NAME: TcxGridDBColumn
                  Caption = 'Tablespace Name'
                  DataBinding.FieldName = 'TABLESPACE_NAME'
                  Width = 166
                end
                object cxGridDBTableView23TABLE_MB: TcxGridDBColumn
                  Caption = 'Table (MB)'
                  DataBinding.FieldName = 'TABLE_MB'
                  Width = 107
                end
                object cxGridDBTableView23INDEX_MB: TcxGridDBColumn
                  Caption = 'Index (MB)'
                  DataBinding.FieldName = 'INDEX_MB'
                  Width = 107
                end
                object cxGridDBTableView23CLUSTER_MB: TcxGridDBColumn
                  Caption = 'Cluster (MB)'
                  DataBinding.FieldName = 'CLUSTER_MB'
                  Width = 107
                end
                object cxGridDBTableView23ROLLBACK_MB: TcxGridDBColumn
                  Caption = 'Rollback (MB)'
                  DataBinding.FieldName = 'ROLLBACK_MB'
                  Width = 109
                end
                object cxGridDBTableView23LOB_MB: TcxGridDBColumn
                  Caption = 'Lob (MB)'
                  DataBinding.FieldName = 'LOB_MB'
                  Width = 107
                end
              end
              object cxGridLevel36: TcxGridLevel
                GridView = cxGridDBTableView23
              end
            end
          end
        end
        object dxBarDockControl7: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 705
          Height = 26
          Align = dalTop
          BarManager = barDBAManager
        end
      end
      object tsIO: TcxTabSheet
        Caption = 'I/O'
        ImageIndex = 6
        object pcIO: TcxPageControl
          Left = 0
          Top = 26
          Width = 705
          Height = 521
          ActivePage = tsFiles
          Align = alClient
          Style = 8
          TabOrder = 0
          OnPageChanging = pcIOPageChanging
          ClientRectBottom = 521
          ClientRectRight = 705
          ClientRectTop = 24
          object tsFiles: TcxTabSheet
            Caption = 'Data Files'
            ImageIndex = 0
            object cxGrid20: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView13: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsIOFiles
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.GroupByBox = False
                object cxGridDBTableView13FILE: TcxGridDBColumn
                  Caption = 'File#'
                  DataBinding.FieldName = 'FILE#'
                  Width = 33
                end
                object cxGridDBTableView13NAME: TcxGridDBColumn
                  Caption = 'Name'
                  DataBinding.FieldName = 'NAME'
                  Width = 220
                end
                object cxGridDBTableView13PHYRDS: TcxGridDBColumn
                  Caption = 'Reads'
                  DataBinding.FieldName = 'PHYRDS'
                  Width = 52
                end
                object cxGridDBTableView13PHYWRTS: TcxGridDBColumn
                  Caption = 'Writes'
                  DataBinding.FieldName = 'PHYWRTS'
                  Width = 54
                end
                object cxGridDBTableView13PHYBLKRD: TcxGridDBColumn
                  Caption = 'Blocks Read'
                  DataBinding.FieldName = 'PHYBLKRD'
                  Width = 80
                end
                object cxGridDBTableView13PHYBLKWRT: TcxGridDBColumn
                  Caption = 'Blocks Writetten'
                  DataBinding.FieldName = 'PHYBLKWRT'
                  Width = 101
                end
                object cxGridDBTableView13SINGLEBLKRDS: TcxGridDBColumn
                  Caption = 'Single Block Reads'
                  DataBinding.FieldName = 'SINGLEBLKRDS'
                  Width = 94
                end
                object cxGridDBTableView13READTIM: TcxGridDBColumn
                  Caption = 'Time Reading (1/100s)'
                  DataBinding.FieldName = 'READTIM'
                  Width = 114
                end
                object cxGridDBTableView13WRITETIM: TcxGridDBColumn
                  Caption = 'Time Writing (1/100s)'
                  DataBinding.FieldName = 'WRITETIM'
                  Width = 126
                end
                object cxGridDBTableView13SINGLEBLKRDTIM: TcxGridDBColumn
                  Caption = 'Cumulative Single Block Read Time '
                  DataBinding.FieldName = 'SINGLEBLKRDTIM'
                  Width = 173
                end
                object cxGridDBTableView13AVGIOTIM: TcxGridDBColumn
                  Caption = 'Average I/O Time (1/100s)'
                  DataBinding.FieldName = 'AVGIOTIM'
                  Width = 135
                end
                object cxGridDBTableView13LSTIOTIM: TcxGridDBColumn
                  Caption = 'Last I/O Time (1/100s)'
                  DataBinding.FieldName = 'LSTIOTIM'
                  Width = 114
                end
                object cxGridDBTableView13MINIOTIM: TcxGridDBColumn
                  Caption = 'Single I/O Min Time'
                  DataBinding.FieldName = 'MINIOTIM'
                  Width = 97
                end
                object cxGridDBTableView13MAXIORTM: TcxGridDBColumn
                  Caption = 'Max Time Single Read'
                  DataBinding.FieldName = 'MAXIORTM'
                  Width = 110
                end
                object cxGridDBTableView13MAXIOWTM: TcxGridDBColumn
                  Caption = 'Max Time Single write'
                  DataBinding.FieldName = 'MAXIOWTM'
                  Width = 126
                end
              end
              object cxGridLevel21: TcxGridLevel
                GridView = cxGridDBTableView13
              end
            end
          end
          object tsSGAStat: TcxTabSheet
            Caption = 'SGA Stats'
            ImageIndex = 1
            object cxGrid35: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView22: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsSGAStats
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView22POOL: TcxGridDBColumn
                  DataBinding.FieldName = 'POOL'
                  Width = 156
                end
                object cxGridDBTableView22NAME: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                  Width = 275
                end
                object cxGridDBTableView22BYTES: TcxGridDBColumn
                  DataBinding.FieldName = 'BYTES'
                  Width = 366
                end
              end
              object cxGridLevel35: TcxGridLevel
                GridView = cxGridDBTableView22
              end
            end
          end
        end
        object dxBarDockControl8: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 705
          Height = 26
          Align = dalTop
          BarManager = barDBAManager
        end
      end
      object tsUndo: TcxTabSheet
        Caption = 'Undo'
        ImageIndex = 7
        object pcUndo: TcxPageControl
          Left = 0
          Top = 26
          Width = 705
          Height = 521
          ActivePage = tsTablespaces
          Align = alClient
          Style = 8
          TabOrder = 0
          OnPageChanging = pcUndoPageChanging
          ClientRectBottom = 521
          ClientRectRight = 705
          ClientRectTop = 24
          object tsTablespaces: TcxTabSheet
            Caption = 'Tablespaces'
            ImageIndex = 0
            object cxGrid22: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 169
              Align = alTop
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView14: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsUndoTablespace
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView14TABLESPACE_NAME: TcxGridDBColumn
                  Caption = 'Name'
                  DataBinding.FieldName = 'TABLESPACE_NAME'
                end
                object cxGridDBTableView14PERCENT_USED: TcxGridDBColumn
                  Caption = 'Percent Used'
                  DataBinding.FieldName = 'PERCENT_USED'
                  PropertiesClassName = 'TcxProgressBarProperties'
                  Properties.BarStyle = cxbsGradient
                  Properties.BeginColor = clPurple
                end
                object cxGridDBTableView14BYTES: TcxGridDBColumn
                  Caption = 'Size (Mb)'
                  DataBinding.FieldName = 'BYTES'
                end
                object cxGridDBTableView14MAXBYTES: TcxGridDBColumn
                  Caption = 'Max (Mb)'
                  DataBinding.FieldName = 'MAXBYTES'
                end
                object cxGridDBTableView14BYTES_FREE: TcxGridDBColumn
                  Caption = 'Free (Mb)'
                  DataBinding.FieldName = 'BYTES_FREE'
                end
                object cxGridDBTableView14STATUS: TcxGridDBColumn
                  Caption = 'Status'
                  DataBinding.FieldName = 'STATUS'
                end
                object cxGridDBTableView14TABLESPACE_TYPE: TcxGridDBColumn
                  Caption = 'Type'
                  DataBinding.FieldName = 'TABLESPACE_TYPE'
                end
              end
              object cxGridLevel22: TcxGridLevel
                GridView = cxGridDBTableView14
              end
            end
            object cxSplitter9: TcxSplitter
              Left = 0
              Top = 169
              Width = 705
              Height = 8
              HotZoneClassName = 'TcxMediaPlayer9Style'
              AlignSplitter = salTop
              Control = cxGrid22
            end
            object pcTablespaces: TcxPageControl
              Left = 0
              Top = 177
              Width = 705
              Height = 320
              ActivePage = tsTablespacesFiles
              Align = alClient
              Style = 8
              TabOrder = 2
              OnPageChanging = pcTablespacesPageChanging
              ClientRectBottom = 320
              ClientRectRight = 705
              ClientRectTop = 24
              object tsTablespacesFiles: TcxTabSheet
                Caption = 'Files'
                ImageIndex = 0
                object cxGrid23: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 296
                  Align = alClient
                  TabOrder = 0
                  LookAndFeel.Kind = lfOffice11
                  object gridDBUndoTablespaceFile: TcxGridDBTableView
                    NavigatorButtons.ConfirmDelete = False
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsData.CancelOnExit = False
                    OptionsData.Deleting = False
                    OptionsData.DeletingConfirmation = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsSelection.CellSelect = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.GroupByBox = False
                    object cxGridDBColumn1: TcxGridDBColumn
                      Caption = 'File Name'
                      DataBinding.FieldName = 'FILE_NAME'
                      Width = 192
                    end
                    object cxGridDBColumn2: TcxGridDBColumn
                      Caption = 'Size (Mb)'
                      DataBinding.FieldName = 'BYTES'
                      Width = 76
                    end
                    object cxGridDBColumn3: TcxGridDBColumn
                      Caption = 'Free (Mb)'
                      DataBinding.FieldName = 'BYTES_FREE'
                      Width = 75
                    end
                    object cxGridDBColumn4: TcxGridDBColumn
                      Caption = 'Status'
                      DataBinding.FieldName = 'STATUS'
                      Width = 76
                    end
                    object cxGridDBColumn5: TcxGridDBColumn
                      Caption = 'Blocks'
                      DataBinding.FieldName = 'BLOCKS'
                      Width = 76
                    end
                    object cxGridDBColumn6: TcxGridDBColumn
                      Caption = 'Autoextensible'
                      DataBinding.FieldName = 'AUTOEXTENSIBLE'
                      Width = 75
                    end
                    object cxGridDBColumn7: TcxGridDBColumn
                      Caption = 'Increment by'
                      DataBinding.FieldName = 'INCREMENT_BY'
                      Width = 76
                    end
                    object cxGridDBColumn8: TcxGridDBColumn
                      Caption = 'Max bytes'
                      DataBinding.FieldName = 'MAXBYTES'
                      Width = 75
                    end
                    object cxGridDBColumn9: TcxGridDBColumn
                      Caption = 'Max blocks'
                      DataBinding.FieldName = 'MAXBLOCKS'
                      Width = 76
                    end
                  end
                  object cxGridLevel23: TcxGridLevel
                    GridView = gridDBUndoTablespaceFile
                  end
                end
              end
              object tsTablespacesRollbackSegments: TcxTabSheet
                Caption = 'Rollback Segments'
                ImageIndex = 1
                object cxGrid24: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 296
                  Align = alClient
                  TabOrder = 0
                  LookAndFeel.Kind = lfOffice11
                  object gridDBTablespacesRollbackSegment: TcxGridDBTableView
                    NavigatorButtons.ConfirmDelete = False
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsData.CancelOnExit = False
                    OptionsData.Deleting = False
                    OptionsData.DeletingConfirmation = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsSelection.CellSelect = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.GroupByBox = False
                    object gridDBTablespacesRollbackSegmentSEGMENT_ID: TcxGridDBColumn
                      Caption = 'Segment ID'
                      DataBinding.FieldName = 'SEGMENT_ID'
                      Width = 62
                    end
                    object gridDBTablespacesRollbackSegmentSEGMENT_NAME: TcxGridDBColumn
                      Caption = 'Segment Name'
                      DataBinding.FieldName = 'SEGMENT_NAME'
                      Width = 135
                    end
                    object gridDBTablespacesRollbackSegmentOWNER: TcxGridDBColumn
                      Caption = 'Owner'
                      DataBinding.FieldName = 'OWNER'
                      Width = 85
                    end
                    object gridDBTablespacesRollbackSegmentSTATUS: TcxGridDBColumn
                      Caption = 'Status'
                      DataBinding.FieldName = 'STATUS'
                      Width = 78
                    end
                    object gridDBTablespacesRollbackSegmentINSTANCE_NUM: TcxGridDBColumn
                      Caption = 'Instance Num'
                      DataBinding.FieldName = 'INSTANCE_NUM'
                      Width = 76
                    end
                    object gridDBTablespacesRollbackSegmentINITIAL_EXTENT: TcxGridDBColumn
                      Caption = 'Initial Extent'
                      DataBinding.FieldName = 'INITIAL_EXTENT'
                      Width = 74
                    end
                    object gridDBTablespacesRollbackSegmentNEXT_EXTENT: TcxGridDBColumn
                      Caption = 'Next Extent'
                      DataBinding.FieldName = 'NEXT_EXTENT'
                      Width = 71
                    end
                    object gridDBTablespacesRollbackSegmentMIN_EXTENTS: TcxGridDBColumn
                      Caption = 'Min Extents'
                      DataBinding.FieldName = 'MIN_EXTENTS'
                      Width = 72
                    end
                    object gridDBTablespacesRollbackSegmentMAX_EXTENTS: TcxGridDBColumn
                      Caption = 'Max Extents'
                      DataBinding.FieldName = 'MAX_EXTENTS'
                      Width = 71
                    end
                    object gridDBTablespacesRollbackSegmentPCT_INCREASE: TcxGridDBColumn
                      Caption = 'PCT Increase'
                      DataBinding.FieldName = 'PCT_INCREASE'
                      Width = 73
                    end
                  end
                  object cxGridLevel24: TcxGridLevel
                    GridView = gridDBTablespacesRollbackSegment
                  end
                end
              end
              object tsTablespacesRollbackStats: TcxTabSheet
                Caption = 'Rollback Stats'
                ImageIndex = 2
                object cxGrid25: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 296
                  Align = alClient
                  TabOrder = 0
                  LookAndFeel.Kind = lfOffice11
                  object gridDBTablespacesRollbackSegmentStat: TcxGridDBTableView
                    NavigatorButtons.ConfirmDelete = False
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsData.CancelOnExit = False
                    OptionsData.Deleting = False
                    OptionsData.DeletingConfirmation = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsSelection.CellSelect = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.GroupByBox = False
                    object gridDBTablespacesRollbackSegmentStatUSN: TcxGridDBColumn
                      Caption = 'Segment Number'
                      DataBinding.FieldName = 'USN'
                      Width = 66
                    end
                    object gridDBTablespacesRollbackSegmentStatEXTENTS: TcxGridDBColumn
                      Caption = 'Extents'
                      DataBinding.FieldName = 'EXTENTS'
                      Width = 67
                    end
                    object gridDBTablespacesRollbackSegmentStatRSSIZE: TcxGridDBColumn
                      Caption = 'Size (bytes)'
                      DataBinding.FieldName = 'RSSIZE'
                      Width = 66
                    end
                    object gridDBTablespacesRollbackSegmentStatWRITES: TcxGridDBColumn
                      Caption = 'Bytes written'
                      DataBinding.FieldName = 'WRITES'
                      Width = 67
                    end
                    object gridDBTablespacesRollbackSegmentStatXACTS: TcxGridDBColumn
                      Caption = 'Active transactions'
                      DataBinding.FieldName = 'XACTS'
                      Width = 66
                    end
                    object gridDBTablespacesRollbackSegmentStatGETS: TcxGridDBColumn
                      Caption = 'Header Gets'
                      DataBinding.FieldName = 'GETS'
                      Width = 67
                    end
                    object gridDBTablespacesRollbackSegmentStatWAITS: TcxGridDBColumn
                      Caption = 'Header Waits'
                      DataBinding.FieldName = 'WAITS'
                      Width = 66
                    end
                    object gridDBTablespacesRollbackSegmentStatOPTSIZE: TcxGridDBColumn
                      Caption = 'Optimal Size'
                      DataBinding.FieldName = 'OPTSIZE'
                      Width = 66
                    end
                    object gridDBTablespacesRollbackSegmentStatHWMSIZE: TcxGridDBColumn
                      Caption = 'High Water Mark'
                      DataBinding.FieldName = 'HWMSIZE'
                      Width = 86
                    end
                    object gridDBTablespacesRollbackSegmentStatSHRINKS: TcxGridDBColumn
                      Caption = 'Shrinks'
                      DataBinding.FieldName = 'SHRINKS'
                      Width = 60
                    end
                    object gridDBTablespacesRollbackSegmentStatWRAPS: TcxGridDBColumn
                      Caption = 'Wraps'
                      DataBinding.FieldName = 'WRAPS'
                      Width = 60
                    end
                    object gridDBTablespacesRollbackSegmentStatEXTENDS: TcxGridDBColumn
                      Caption = 'Extents'
                      DataBinding.FieldName = 'EXTENDS'
                      Width = 60
                    end
                  end
                  object cxGridLevel25: TcxGridLevel
                    GridView = gridDBTablespacesRollbackSegmentStat
                  end
                end
              end
              object tsTablespacesCurrentTransaction: TcxTabSheet
                Caption = 'Current Transaction'
                ImageIndex = 3
                object cxGrid26: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 705
                  Height = 296
                  Align = alClient
                  TabOrder = 0
                  LookAndFeel.Kind = lfOffice11
                  object gridDBTablespacesCurrentTrans: TcxGridDBTableView
                    NavigatorButtons.ConfirmDelete = False
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsData.CancelOnExit = False
                    OptionsData.Deleting = False
                    OptionsData.DeletingConfirmation = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsSelection.CellSelect = False
                    OptionsView.GroupByBox = False
                    object gridDBTablespacesCurrentTransSEGMENT_NAME: TcxGridDBColumn
                      Caption = 'Segment Name'
                      DataBinding.FieldName = 'SEGMENT_NAME'
                      Width = 78
                    end
                    object gridDBTablespacesCurrentTransXIDUSN: TcxGridDBColumn
                      Caption = 'Segment Number'
                      DataBinding.FieldName = 'XIDUSN'
                      Width = 88
                    end
                    object gridDBTablespacesCurrentTransXACT_STATUS: TcxGridDBColumn
                      Caption = 'Status'
                      DataBinding.FieldName = 'XACT_STATUS'
                      Width = 37
                    end
                    object gridDBTablespacesCurrentTransSTART_TIME: TcxGridDBColumn
                      Caption = 'Start Time'
                      DataBinding.FieldName = 'START_TIME'
                      Width = 55
                    end
                    object gridDBTablespacesCurrentTransUSED_UBLK: TcxGridDBColumn
                      Caption = 'Undo Blocks Used'
                      DataBinding.FieldName = 'USED_UBLK'
                    end
                    object gridDBTablespacesCurrentTransLOG_IO: TcxGridDBColumn
                      Caption = 'Logical I/O'
                      DataBinding.FieldName = 'LOG_IO'
                    end
                    object gridDBTablespacesCurrentTransPHY_IO: TcxGridDBColumn
                      Caption = 'Physical I/O'
                      DataBinding.FieldName = 'PHY_IO'
                    end
                    object gridDBTablespacesCurrentTransCR_GET: TcxGridDBColumn
                      Caption = 'Consistent Gets'
                      DataBinding.FieldName = 'CR_GET'
                      Width = 82
                    end
                    object gridDBTablespacesCurrentTransCR_CHANGE: TcxGridDBColumn
                      Caption = 'Consistent Changes'
                      DataBinding.FieldName = 'CR_CHANGE'
                      Width = 102
                    end
                    object gridDBTablespacesCurrentTransSID: TcxGridDBColumn
                      DataBinding.FieldName = 'SID'
                    end
                    object gridDBTablespacesCurrentTransSERIAL: TcxGridDBColumn
                      Caption = 'Serial #'
                      DataBinding.FieldName = 'SERIAL#'
                    end
                    object gridDBTablespacesCurrentTransUSERNAME: TcxGridDBColumn
                      Caption = 'User Name'
                      DataBinding.FieldName = 'USERNAME'
                      Width = 107
                    end
                    object gridDBTablespacesCurrentTransOSUSER: TcxGridDBColumn
                      Caption = 'OS User'
                      DataBinding.FieldName = 'OSUSER'
                      Width = 90
                    end
                    object gridDBTablespacesCurrentTransMACHINE: TcxGridDBColumn
                      Caption = 'Machine'
                      DataBinding.FieldName = 'MACHINE'
                      Width = 129
                    end
                    object gridDBTablespacesCurrentTransTERMINAL: TcxGridDBColumn
                      Caption = 'Terminal'
                      DataBinding.FieldName = 'TERMINAL'
                    end
                    object gridDBTablespacesCurrentTransPROGRAM: TcxGridDBColumn
                      Caption = 'Program'
                      DataBinding.FieldName = 'PROGRAM'
                      Width = 197
                    end
                  end
                  object cxGridLevel26: TcxGridLevel
                    GridView = gridDBTablespacesCurrentTrans
                  end
                end
              end
            end
          end
          object tsUndoStats: TcxTabSheet
            Caption = 'Undo Stats'
            ImageIndex = 1
            object cxGrid27: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LevelTabs.Style = 8
              LookAndFeel.Kind = lfOffice11
              RootLevelOptions.DetailTabsPosition = dtpTop
              object cxGrid27DBChartView1: TcxGridDBChartView
                DataController.DataSource = dsUndoStat
                DiagramColumn.Legend.Position = cppNone
                DiagramColumn.AxisCategory.CategoriesInReverseOrder = True
                DiagramColumn.AxisCategory.ValueAxisAtMaxCategory = True
                DiagramColumn.AxisValue.MinMaxValues = mmvCustom
                DiagramColumn.Values.VaryColorsByCategory = True
                DiagramColumn.Values.CaptionPosition = cdvcpOutsideEnd
                DiagramLine.Active = True
                DiagramLine.Values.VaryColorsByCategory = True
                DiagramLine.Values.CaptionPosition = ldvcpRight
                DiagramLine.Values.MarkerSize = 4
                DiagramLine.Values.MarkerStyle = cmsCircle
                OptionsCustomize.DataDrillDown = False
                OptionsCustomize.DataGroupMoving = False
                OptionsCustomize.OptionsCustomization = False
                OptionsCustomize.SeriesCustomization = False
                ToolBox.Border = tbNone
                ToolBox.DataLevelActiveValueDropDownCount = 0
                ToolBox.DataLevelsInfoVisible = dlivNever
                ToolBox.Visible = tvNever
                object cxGrid27DBChartView1DataGroup1: TcxGridDBChartDataGroup
                  DataBinding.FieldName = 'THEDATE'
                end
                object cxGrid27DBChartView1Series2: TcxGridDBChartSeries
                  DataBinding.FieldName = 'SUM_TNXCOUNT'
                  GroupSummaryKind = skMax
                end
              end
              object cxGrid27DBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsUndoStat
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGrid27DBTableView1THEDATE: TcxGridDBColumn
                  DataBinding.FieldName = 'THEDATE'
                end
                object cxGrid27DBTableView1THEHOUR: TcxGridDBColumn
                  DataBinding.FieldName = 'THEHOUR'
                end
                object cxGrid27DBTableView1SUM_UNDOBLKS: TcxGridDBColumn
                  DataBinding.FieldName = 'SUM_UNDOBLKS'
                  Width = 102
                end
                object cxGrid27DBTableView1SUM_TNXCOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'SUM_TNXCOUNT'
                  Width = 87
                end
                object cxGrid27DBTableView1MAX_QUERYLEN: TcxGridDBColumn
                  DataBinding.FieldName = 'MAX_QUERYLEN'
                  Width = 102
                end
              end
              object cxGrid27Level1: TcxGridLevel
                Caption = 'Table'
                GridView = cxGrid27DBTableView1
              end
              object cxGrid27Level2: TcxGridLevel
                Caption = 'Chart'
                GridView = cxGrid27DBChartView1
              end
            end
          end
        end
        object dxBarDockControl9: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 705
          Height = 26
          Align = dalTop
          BarManager = barDBAManager
        end
      end
      object tsRedo: TcxTabSheet
        Caption = 'Redo'
        ImageIndex = 8
        object pcRedo: TcxPageControl
          Left = 0
          Top = 26
          Width = 705
          Height = 521
          ActivePage = tsGroups
          Align = alClient
          Style = 8
          TabOrder = 0
          OnPageChanging = pcRedoPageChanging
          ClientRectBottom = 521
          ClientRectRight = 705
          ClientRectTop = 24
          object tsGroups: TcxTabSheet
            Caption = 'Groups'
            ImageIndex = 0
            object cxGrid21: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 335
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView15: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsRedoGroups
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView15GROUP: TcxGridDBColumn
                  DataBinding.FieldName = 'GROUP#'
                end
                object cxGridDBTableView15THREAD: TcxGridDBColumn
                  DataBinding.FieldName = 'THREAD#'
                end
                object cxGridDBTableView15SEQUENCE: TcxGridDBColumn
                  DataBinding.FieldName = 'SEQUENCE#'
                end
                object cxGridDBTableView15BYTES: TcxGridDBColumn
                  DataBinding.FieldName = 'BYTES'
                end
                object cxGridDBTableView15MEMBERS: TcxGridDBColumn
                  DataBinding.FieldName = 'MEMBERS'
                end
                object cxGridDBTableView15ARCHIVED: TcxGridDBColumn
                  DataBinding.FieldName = 'ARCHIVED'
                end
                object cxGridDBTableView15STATUS: TcxGridDBColumn
                  DataBinding.FieldName = 'STATUS'
                end
                object cxGridDBTableView15FIRST_CHANGE: TcxGridDBColumn
                  DataBinding.FieldName = 'FIRST_CHANGE#'
                end
                object cxGridDBTableView15FIRST_TIME: TcxGridDBColumn
                  DataBinding.FieldName = 'FIRST_TIME'
                end
              end
              object cxGridLevel27: TcxGridLevel
                GridView = cxGridDBTableView15
              end
            end
            object cxSplitter10: TcxSplitter
              Left = 0
              Top = 335
              Width = 705
              Height = 8
              HotZoneClassName = 'TcxMediaPlayer9Style'
              AlignSplitter = salBottom
              Control = lvRedoGroups
            end
            object lvRedoGroups: TcxListView
              Left = 0
              Top = 343
              Width = 705
              Height = 154
              Align = alBottom
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Statistic'
                end
                item
                  AutoSize = True
                  Caption = 'Value'
                end>
              ReadOnly = True
              RowSelect = True
              Style.BorderStyle = cbsUltraFlat
              Style.LookAndFeel.Kind = lfOffice11
              StyleDisabled.LookAndFeel.Kind = lfOffice11
              StyleFocused.LookAndFeel.Kind = lfOffice11
              StyleHot.LookAndFeel.Kind = lfOffice11
              TabOrder = 2
              ViewStyle = vsReport
            end
          end
          object tsLogSwitchHistory: TcxTabSheet
            Caption = 'Log Switch History'
            ImageIndex = 1
            object cxGrid28: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView16: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsLogSwitchHistory
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView16THEYEAR: TcxGridDBColumn
                  DataBinding.FieldName = 'THEYEAR'
                end
                object cxGridDBTableView16THEMONTH: TcxGridDBColumn
                  DataBinding.FieldName = 'THEMONTH'
                end
                object cxGridDBTableView16THEDAY: TcxGridDBColumn
                  DataBinding.FieldName = 'THEDAY'
                end
                object cxGridDBTableView16H0: TcxGridDBColumn
                  DataBinding.FieldName = 'H0'
                end
                object cxGridDBTableView16H1: TcxGridDBColumn
                  DataBinding.FieldName = 'H1'
                end
                object cxGridDBTableView16H2: TcxGridDBColumn
                  DataBinding.FieldName = 'H2'
                end
                object cxGridDBTableView16H3: TcxGridDBColumn
                  DataBinding.FieldName = 'H3'
                end
                object cxGridDBTableView16H4: TcxGridDBColumn
                  DataBinding.FieldName = 'H4'
                end
                object cxGridDBTableView16H5: TcxGridDBColumn
                  DataBinding.FieldName = 'H5'
                end
                object cxGridDBTableView16H6: TcxGridDBColumn
                  DataBinding.FieldName = 'H6'
                end
                object cxGridDBTableView16H7: TcxGridDBColumn
                  DataBinding.FieldName = 'H7'
                end
                object cxGridDBTableView16H8: TcxGridDBColumn
                  DataBinding.FieldName = 'H8'
                end
                object cxGridDBTableView16H9: TcxGridDBColumn
                  DataBinding.FieldName = 'H9'
                end
                object cxGridDBTableView16H10: TcxGridDBColumn
                  DataBinding.FieldName = 'H10'
                end
                object cxGridDBTableView16H11: TcxGridDBColumn
                  DataBinding.FieldName = 'H11'
                end
                object cxGridDBTableView16H12: TcxGridDBColumn
                  DataBinding.FieldName = 'H12'
                end
                object cxGridDBTableView16H13: TcxGridDBColumn
                  DataBinding.FieldName = 'H13'
                end
                object cxGridDBTableView16H14: TcxGridDBColumn
                  DataBinding.FieldName = 'H14'
                end
                object cxGridDBTableView16H15: TcxGridDBColumn
                  DataBinding.FieldName = 'H15'
                end
                object cxGridDBTableView16H16: TcxGridDBColumn
                  DataBinding.FieldName = 'H16'
                end
                object cxGridDBTableView16H17: TcxGridDBColumn
                  DataBinding.FieldName = 'H17'
                end
                object cxGridDBTableView16H18: TcxGridDBColumn
                  DataBinding.FieldName = 'H18'
                end
                object cxGridDBTableView16H19: TcxGridDBColumn
                  DataBinding.FieldName = 'H19'
                end
                object cxGridDBTableView16H20: TcxGridDBColumn
                  DataBinding.FieldName = 'H20'
                end
                object cxGridDBTableView16H21: TcxGridDBColumn
                  DataBinding.FieldName = 'H21'
                end
                object cxGridDBTableView16H22: TcxGridDBColumn
                  DataBinding.FieldName = 'H22'
                end
                object cxGridDBTableView16H23: TcxGridDBColumn
                  DataBinding.FieldName = 'H23'
                end
              end
              object cxGridLevel28: TcxGridLevel
                GridView = cxGridDBTableView16
              end
            end
          end
          object tsArchivedLogs: TcxTabSheet
            Caption = 'Archived Logs'
            ImageIndex = 3
            object cxGrid29: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 211
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView17: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsArchivedLogs
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView17DEST_ID: TcxGridDBColumn
                  DataBinding.FieldName = 'DEST_ID'
                  Width = 53
                end
                object cxGridDBTableView17STATUS: TcxGridDBColumn
                  DataBinding.FieldName = 'STATUS'
                  Width = 54
                end
                object cxGridDBTableView17BINDING: TcxGridDBColumn
                  DataBinding.FieldName = 'BINDING'
                  Width = 56
                end
                object cxGridDBTableView17NAME_SPACE: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME_SPACE'
                  Width = 87
                end
                object cxGridDBTableView17TARGET: TcxGridDBColumn
                  DataBinding.FieldName = 'TARGET'
                  Width = 59
                end
                object cxGridDBTableView17REOPEN_SECS: TcxGridDBColumn
                  DataBinding.FieldName = 'REOPEN_SECS'
                  Width = 91
                end
                object cxGridDBTableView17DESTINATION: TcxGridDBColumn
                  DataBinding.FieldName = 'DESTINATION'
                  Width = 82
                end
                object cxGridDBTableView17FAIL_DATE: TcxGridDBColumn
                  DataBinding.FieldName = 'FAIL_DATE'
                  Width = 67
                end
                object cxGridDBTableView17FAIL_SEQUENCE: TcxGridDBColumn
                  DataBinding.FieldName = 'FAIL_SEQUENCE'
                  Width = 91
                end
                object cxGridDBTableView17FAIL_BLOCK: TcxGridDBColumn
                  DataBinding.FieldName = 'FAIL_BLOCK'
                  Width = 72
                end
                object cxGridDBTableView17ERROR: TcxGridDBColumn
                  DataBinding.FieldName = 'ERROR'
                  Width = 85
                end
              end
              object cxGridLevel29: TcxGridLevel
                GridView = cxGridDBTableView17
              end
            end
            object cxSplitter11: TcxSplitter
              Left = 0
              Top = 211
              Width = 705
              Height = 8
              HotZoneClassName = 'TcxMediaPlayer9Style'
              AlignSplitter = salBottom
              Control = cxGrid30
            end
            object cxGrid30: TcxGrid
              Left = 0
              Top = 219
              Width = 705
              Height = 278
              Align = alBottom
              TabOrder = 2
              LookAndFeel.Kind = lfOffice11
              object gridDBArchivedLogDetail: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.GroupByBox = False
                object gridDBArchivedLogDetailNAME: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                  Width = 51
                end
                object gridDBArchivedLogDetailTHREAD: TcxGridDBColumn
                  DataBinding.FieldName = 'THREAD#'
                  Width = 71
                end
                object gridDBArchivedLogDetailSEQUENCE: TcxGridDBColumn
                  DataBinding.FieldName = 'SEQUENCE#'
                  Width = 84
                end
                object gridDBArchivedLogDetailRESETLOGS_CHANGE: TcxGridDBColumn
                  DataBinding.FieldName = 'RESETLOGS_CHANGE#'
                  Width = 135
                end
                object gridDBArchivedLogDetailRESETLOGS_TIME: TcxGridDBColumn
                  DataBinding.FieldName = 'RESETLOGS_TIME'
                  Width = 93
                end
                object gridDBArchivedLogDetailFIRST_CHANGE: TcxGridDBColumn
                  DataBinding.FieldName = 'FIRST_CHANGE#'
                  Width = 90
                end
                object gridDBArchivedLogDetailFIRST_TIME: TcxGridDBColumn
                  DataBinding.FieldName = 'FIRST_TIME'
                  Width = 65
                end
                object gridDBArchivedLogDetailNEXT_CHANGE: TcxGridDBColumn
                  DataBinding.FieldName = 'NEXT_CHANGE#'
                  Width = 86
                end
                object gridDBArchivedLogDetailNEXT_TIME: TcxGridDBColumn
                  DataBinding.FieldName = 'NEXT_TIME'
                  Width = 78
                end
                object gridDBArchivedLogDetailBLOCKS: TcxGridDBColumn
                  DataBinding.FieldName = 'BLOCKS'
                  Width = 44
                end
                object gridDBArchivedLogDetailBLOCK_SIZE: TcxGridDBColumn
                  DataBinding.FieldName = 'BLOCK_SIZE'
                  Width = 66
                end
                object gridDBArchivedLogDetailCREATOR: TcxGridDBColumn
                  DataBinding.FieldName = 'CREATOR'
                  Width = 71
                end
                object gridDBArchivedLogDetailREGISTRAR: TcxGridDBColumn
                  DataBinding.FieldName = 'REGISTRAR'
                  Width = 80
                end
                object gridDBArchivedLogDetailSTANDBY_DEST: TcxGridDBColumn
                  DataBinding.FieldName = 'STANDBY_DEST'
                  Width = 99
                end
                object gridDBArchivedLogDetailARCHIVED: TcxGridDBColumn
                  DataBinding.FieldName = 'ARCHIVED'
                  Width = 57
                end
                object gridDBArchivedLogDetailAPPLIED: TcxGridDBColumn
                  DataBinding.FieldName = 'APPLIED'
                  Width = 47
                end
                object gridDBArchivedLogDetailDELETED: TcxGridDBColumn
                  DataBinding.FieldName = 'DELETED'
                  Width = 49
                end
                object gridDBArchivedLogDetailSTATUS: TcxGridDBColumn
                  DataBinding.FieldName = 'STATUS'
                  Width = 44
                end
                object gridDBArchivedLogDetailCOMPLETION_TIME: TcxGridDBColumn
                  DataBinding.FieldName = 'COMPLETION_TIME'
                  Width = 101
                end
                object gridDBArchivedLogDetailDICTIONARY_BEGIN: TcxGridDBColumn
                  DataBinding.FieldName = 'DICTIONARY_BEGIN'
                  Width = 105
                end
                object gridDBArchivedLogDetailDICTIONARY_END: TcxGridDBColumn
                  DataBinding.FieldName = 'DICTIONARY_END'
                  Width = 95
                end
              end
              object cxGridLevel30: TcxGridLevel
                GridView = gridDBArchivedLogDetail
              end
            end
          end
        end
        object dxBarDockControl10: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 705
          Height = 26
          Align = dalTop
          BarManager = barDBAManager
        end
      end
      object tsTemp: TcxTabSheet
        Caption = 'Temp'
        ImageIndex = 9
        object pcTemp: TcxPageControl
          Left = 0
          Top = 26
          Width = 705
          Height = 521
          ActivePage = tsTempFiles
          Align = alClient
          Style = 8
          TabOrder = 0
          OnPageChanging = pcTempPageChanging
          ClientRectBottom = 521
          ClientRectRight = 705
          ClientRectTop = 24
          object tsTempFiles: TcxTabSheet
            Caption = 'Temp Files'
            ImageIndex = 0
            object cxGrid31: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 497
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView18: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsTempfiles
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.GroupByBox = False
                object cxGridDBTableView18FILE: TcxGridDBColumn
                  DataBinding.FieldName = 'FILE#'
                end
                object cxGridDBTableView18NAME: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                  Width = 279
                end
                object cxGridDBTableView18PHYRDS: TcxGridDBColumn
                  DataBinding.FieldName = 'PHYRDS'
                end
                object cxGridDBTableView18PHYWRTS: TcxGridDBColumn
                  DataBinding.FieldName = 'PHYWRTS'
                end
                object cxGridDBTableView18PHYBLKRD: TcxGridDBColumn
                  DataBinding.FieldName = 'PHYBLKRD'
                end
                object cxGridDBTableView18PHYBLKWRT: TcxGridDBColumn
                  DataBinding.FieldName = 'PHYBLKWRT'
                end
                object cxGridDBTableView18SINGLEBLKRDS: TcxGridDBColumn
                  DataBinding.FieldName = 'SINGLEBLKRDS'
                end
                object cxGridDBTableView18READTIM: TcxGridDBColumn
                  DataBinding.FieldName = 'READTIM'
                end
                object cxGridDBTableView18WRITETIM: TcxGridDBColumn
                  DataBinding.FieldName = 'WRITETIM'
                end
                object cxGridDBTableView18SINGLEBLKRDTIM: TcxGridDBColumn
                  DataBinding.FieldName = 'SINGLEBLKRDTIM'
                end
                object cxGridDBTableView18AVGIOTIM: TcxGridDBColumn
                  DataBinding.FieldName = 'AVGIOTIM'
                end
                object cxGridDBTableView18LSTIOTIM: TcxGridDBColumn
                  DataBinding.FieldName = 'LSTIOTIM'
                end
                object cxGridDBTableView18MINIOTIM: TcxGridDBColumn
                  DataBinding.FieldName = 'MINIOTIM'
                end
                object cxGridDBTableView18MAXIORTM: TcxGridDBColumn
                  DataBinding.FieldName = 'MAXIORTM'
                end
                object cxGridDBTableView18MAXIOWTM: TcxGridDBColumn
                  DataBinding.FieldName = 'MAXIOWTM'
                end
              end
              object cxGridLevel31: TcxGridLevel
                GridView = cxGridDBTableView18
              end
            end
          end
        end
        object dxBarDockControl11: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 705
          Height = 26
          Align = dalTop
          BarManager = barDBAManager
        end
      end
      object tsControlFiles: TcxTabSheet
        Caption = 'Control'
        ImageIndex = 30
        object pcControlFiles: TcxPageControl
          Left = 0
          Top = 26
          Width = 705
          Height = 521
          ActivePage = tsControlFile
          Align = alClient
          Style = 8
          TabOrder = 0
          OnPageChanging = pcControlFilesPageChanging
          ClientRectBottom = 521
          ClientRectRight = 705
          ClientRectTop = 24
          object tsControlFile: TcxTabSheet
            Caption = 'Control Files'
            ImageIndex = 0
            object cxGrid33: TcxGrid
              Left = 0
              Top = 0
              Width = 705
              Height = 257
              Align = alTop
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView20: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsControlFiles
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView20STATUS: TcxGridDBColumn
                  DataBinding.FieldName = 'STATUS'
                  Width = 80
                end
                object cxGridDBTableView20NAME: TcxGridDBColumn
                  DataBinding.FieldName = 'NAME'
                  Width = 717
                end
              end
              object cxGridLevel33: TcxGridLevel
                GridView = cxGridDBTableView20
              end
            end
            object cxSplitter12: TcxSplitter
              Left = 0
              Top = 257
              Width = 705
              Height = 8
              HotZoneClassName = 'TcxMediaPlayer9Style'
              AlignSplitter = salTop
              Control = cxGrid33
            end
            object cxGrid34: TcxGrid
              Left = 0
              Top = 265
              Width = 705
              Height = 232
              Align = alClient
              TabOrder = 2
              LookAndFeel.Kind = lfOffice11
              object cxGridDBTableView21: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsControlFileStatistic
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView21INITCAPTYPE: TcxGridDBColumn
                  DataBinding.FieldName = 'INITCAP(TYPE)'
                  Width = 113
                end
                object cxGridDBTableView21RECORD_SIZE: TcxGridDBColumn
                  Caption = 'Record Size'
                  DataBinding.FieldName = 'RECORD_SIZE'
                  Width = 136
                end
                object cxGridDBTableView21RECORDS_TOTAL: TcxGridDBColumn
                  Caption = 'Records Total'
                  DataBinding.FieldName = 'RECORDS_TOTAL'
                  Width = 137
                end
                object cxGridDBTableView21RECORDS_USED: TcxGridDBColumn
                  Caption = 'Records Used'
                  DataBinding.FieldName = 'RECORDS_USED'
                  Width = 137
                end
                object cxGridDBTableView21Used: TcxGridDBColumn
                  DataBinding.FieldName = 'Used'
                  Width = 137
                end
                object cxGridDBTableView21Free: TcxGridDBColumn
                  DataBinding.FieldName = 'Free'
                  Width = 137
                end
              end
              object cxGridLevel34: TcxGridLevel
                GridView = cxGridDBTableView21
              end
            end
          end
        end
        object dxBarDockControl12: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 705
          Height = 26
          Align = dalTop
          BarManager = barDBAManager
        end
      end
    end
  end
  object statusBar: TdxStatusBar
    Left = 0
    Top = 549
    Width = 804
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
  object barDBAManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'TopSessions'
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 0
        FloatTop = 0
        FloatClientWidth = 0
        FloatClientHeight = 0
        ItemLinks = <
          item
            Item = btnTopSessionRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = icShowTopSessions
            UserDefine = [udWidth]
            UserWidth = 45
            Visible = True
          end
          item
            Item = icShowToSessionBy
            UserDefine = [udWidth]
            UserWidth = 212
            Visible = True
          end
          item
            BeginGroup = True
            Item = lblTopSessionLastRefreshed
            Visible = True
          end>
        Name = 'barTopSessions'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'TopSQL'
        DockControl = dxBarDockControl4
        DockedDockControl = dxBarDockControl4
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 0
        FloatTop = 0
        FloatClientWidth = 0
        FloatClientHeight = 0
        ItemLinks = <
          item
            Item = btnTopSQLRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = icTopSQLSortBy
            UserDefine = [udWidth]
            UserWidth = 203
            Visible = True
          end
          item
            Item = icTopSQLTop
            UserDefine = [udWidth]
            UserWidth = 60
            Visible = True
          end
          item
            BeginGroup = True
            Item = lblTopSQLLastRefreshed
            Visible = True
          end>
        Name = 'barTopSQL'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'TopSegments'
        DockControl = dxBarDockControl3
        DockedDockControl = dxBarDockControl3
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 0
        FloatTop = 0
        FloatClientWidth = 0
        FloatClientHeight = 0
        ItemLinks = <
          item
            Item = btnTopSegmentRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnShowTopSegment
            UserDefine = [udWidth]
            UserWidth = 74
            Visible = True
          end
          item
            Item = icSortSegmentBy
            UserDefine = [udWidth]
            UserWidth = 239
            Visible = True
          end
          item
            BeginGroup = True
            Item = lblTopSegmentLastRefreshed
            Visible = True
          end>
        Name = 'barTopSegments'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barSystem'
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
            Item = btnSystemRefresh
            Visible = True
          end
          item
            Item = btnChangeParam
            Visible = True
          end
          item
            BeginGroup = True
            Item = lblSystemRefreshTime
            Visible = True
          end>
        Name = 'barSystem'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barMemory'
        DockControl = dxBarDockControl5
        DockedDockControl = dxBarDockControl5
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnRefreshMemory
            Visible = True
          end
          item
            BeginGroup = True
            Item = lblMemoryLastRefreshed
            Visible = True
          end>
        Name = 'barMemory'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barWait'
        DockControl = dxBarDockControl6
        DockedDockControl = dxBarDockControl6
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnWaitRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = lblWaitLastRefreshed
            Visible = True
          end>
        Name = 'barWait'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'barStorage'
        DockControl = dxBarDockControl7
        DockedDockControl = dxBarDockControl7
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnStorageRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = lblStorageLastRefreshed
            Visible = True
          end>
        Name = 'barStorage'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barIO'
        DockControl = dxBarDockControl8
        DockedDockControl = dxBarDockControl8
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnIORefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = lblIORefreshedTime
            Visible = True
          end>
        Name = 'barIO'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barUndo'
        DockControl = dxBarDockControl9
        DockedDockControl = dxBarDockControl9
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnUndoRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = lblUndoLastRefresh
            Visible = True
          end>
        Name = 'barUndo'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barRedo'
        DockControl = dxBarDockControl10
        DockedDockControl = dxBarDockControl10
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnRedoRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = lblRedoLastRefreshed
            Visible = True
          end>
        Name = 'barRedo'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barTemp'
        DockControl = dxBarDockControl11
        DockedDockControl = dxBarDockControl11
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnTempRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = lblTempLastRefresh
            Visible = True
          end>
        Name = 'barTemp'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barControl'
        DockControl = dxBarDockControl12
        DockedDockControl = dxBarDockControl12
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnControlRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = lblControlLastRefreshed
            Visible = True
          end>
        Name = 'barControl'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'AllSessions'
      'TopSessions'
      'Top'
      'TopSegments'
      'System'
      'Memory'
      'Wait'
      'Storage'
      'IO'
      'Undo'
      'Redo'
      'Temp'
      'Control')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
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
      True
      True
      True
      True
      True
      True)
    Images = dmGenel.imList
    LookAndFeel.Kind = lfStandard
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 124
    Top = 176
    DockControlHeights = (
      0
      0
      0
      0)
    object btnKillSelectedSession: TdxBarButton
      Caption = 'Kill Selected Session'
      Category = 0
      Hint = 'Kill Selected Session'
      Visible = ivAlways
      ImageIndex = 32
    end
    object btnStartTraceforSession: TdxBarButton
      Caption = 'Start trace for session'
      Category = 0
      Hint = 'Start trace for session'
      Visible = ivAlways
      ImageIndex = 82
    end
    object btnStopTraceForSession: TdxBarButton
      Caption = 'Stop trace for session'
      Category = 0
      Hint = 'Stop trace for session'
      Visible = ivAlways
      ImageIndex = 83
    end
    object icShowToSessionBy: TdxBarImageCombo
      Caption = 'Show to session by :'
      Category = 1
      Description = 'Show to session by :'
      Hint = 'Show to session by :'
      Visible = ivAlways
      Text = 'physical reads'
      OnChange = icShowToSessionByChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000000000000080FFFFFFFFFFFFF080FDEBFFFFFFFFF080FB6DF00F00F
        0F080F9ACFFFFFFFFF080FFFFFFFFFFFFF080C9D6CCCCCCCCC080C46BCFFFFCF
        FC080CBAECCCCCCCCC080FFFFFFFFFFFFF080F64AFFFFFFFFF080F496F00F000
        0F080F94BFFFFFFFFF080FFFFFFFFFFFFF080000000000000008}
      ShowCaption = True
      Width = 100
      Items.Strings = (
        'physical reads'
        'physical writes'
        'session logical reads'
        'bytes sent via SQL*Net to client'
        'bytes received via SQL*Net from client'
        'redo size'
        'session uga memory'
        'session pga memory'
        'CPU used by this session'
        'sorts (rows)')
      ItemIndex = 0
      ImageIndexes = (
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1)
    end
    object icShowTopSessions: TdxBarImageCombo
      Caption = 'Show top sessions :'
      Category = 1
      Hint = 'Show top sessions :'
      Visible = ivAlways
      Text = '10'
      OnChange = icShowTopSessionsChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000000000000080FFFFFFFFFFFFF080FDEBFFFFFFFFF080FB6DF00F00F
        0F080F9ACFFFFFFFFF080FFFFFFFFFFFFF080C9D6CCCCCCCCC080C46BCFFFFCF
        FC080CBAECCCCCCCCC080FFFFFFFFFFFFF080F64AFFFFFFFFF080F496F00F000
        0F080F94BFFFFFFFFF080FFFFFFFFFFFFF080000000000000008}
      ShowCaption = True
      Width = 100
      Items.Strings = (
        '10'
        '8'
        '5')
      ItemIndex = 0
      ImageIndexes = (
        -1
        -1
        -1)
    end
    object btnShowTopSegment: TdxBarImageCombo
      Caption = 'Show top segment :'
      Category = 3
      Hint = 'Show top segment :'
      Visible = ivAlways
      Text = '10'
      OnChange = btnShowTopSegmentChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000000000000080FFFFFFFFFFFFF080FDEBFFFFFFFFF080FB6DF00F00F
        0F080F9ACFFFFFFFFF080FFFFFFFFFFFFF080C9D6CCCCCCCCC080C46BCFFFFCF
        FC080CBAECCCCCCCCC080FFFFFFFFFFFFF080F64AFFFFFFFFF080F496F00F000
        0F080F94BFFFFFFFFF080FFFFFFFFFFFFF080000000000000008}
      ShowCaption = True
      Width = 100
      Items.Strings = (
        '10'
        '25'
        '50'
        '100')
      ItemIndex = 0
      ImageIndexes = (
        -1
        -1
        -1
        -1)
    end
    object icSortSegmentBy: TdxBarImageCombo
      Caption = 'Sort by :'
      Category = 3
      Hint = 'Sort by :'
      Visible = ivAlways
      Text = 'logical reads'
      OnChange = icSortSegmentByChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000000000000080FFFFFFFFFFFFF080FDEBFFFFFFFFF080FB6DF00F00F
        0F080F9ACFFFFFFFFF080FFFFFFFFFFFFF080C9D6CCCCCCCCC080C46BCFFFFCF
        FC080CBAECCCCCCCCC080FFFFFFFFFFFFF080F64AFFFFFFFFF080F496F00F000
        0F080F94BFFFFFFFFF080FFFFFFFFFFFFF080000000000000008}
      ShowCaption = True
      Width = 100
      Items.Strings = (
        'logical reads'
        'buffer busy waits'
        'db block changes'
        'physical reads'
        'physical writes'
        'physical reads direct'
        'physical writes direct'
        'global cache cr blocks served'
        'global cache current blocks served'
        'ITL waits')
      ItemIndex = 0
      ImageIndexes = (
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1)
    end
    object icTopSQLSortBy: TdxBarImageCombo
      Caption = 'Sort by :'
      Category = 2
      Hint = 'Sort by :'
      Visible = ivAlways
      Text = 'Buffer gets'
      OnChange = icTopSQLSortByChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000000000000080FFFFFFFFFFFFF080FDEBFFFFFFFFF080FB6DF00F00F
        0F080F9ACFFFFFFFFF080FFFFFFFFFFFFF080C9D6CCCCCCCCC080C46BCFFFFCF
        FC080CBAECCCCCCCCC080FFFFFFFFFFFFF080F64AFFFFFFFFF080F496F00F000
        0F080F94BFFFFFFFFF080FFFFFFFFFFFFF080000000000000008}
      ShowCaption = True
      Width = 100
      Items.Strings = (
        'Buffer gets'
        'Disk reads'
        'Row processed'
        'Executions'
        'Sharable memory'
        'Persistent memory'
        'Runtime memory'
        'Sorts'
        'Parse calls'
        'Invalidations'
        'First load time'
        'Bufferr gets/execution'
        'Disk reads/execution'
        'Rows processed/execution'
        'Hit ratio')
      ItemIndex = 0
      ImageIndexes = (
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1
        -1)
    end
    object icTopSQLTop: TdxBarImageCombo
      Caption = 'Show top sql :'
      Category = 2
      Hint = 'Show top sql :'
      Visible = ivAlways
      Text = '10'
      OnChange = icTopSQLTopChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000000000000080FFFFFFFFFFFFF080FDEBFFFFFFFFF080FB6DF00F00F
        0F080F9ACFFFFFFFFF080FFFFFFFFFFFFF080C9D6CCCCCCCCC080C46BCFFFFCF
        FC080CBAECCCCCCCCC080FFFFFFFFFFFFF080F64AFFFFFFFFF080F496F00F000
        0F080F94BFFFFFFFFF080FFFFFFFFFFFFF080000000000000008}
      ShowCaption = True
      Width = 100
      Items.Strings = (
        '10'
        '25'
        '50'
        '100')
      ItemIndex = 0
      ImageIndexes = (
        -1
        -1
        -1
        -1)
    end
    object lblTopSQLLastRefreshed: TdxBarStatic
      Align = iaRight
      Caption = 'Last refreshed at'
      Category = 2
      Hint = 'Last refreshed at'
      Visible = ivAlways
    end
    object lblTopSegmentLastRefreshed: TdxBarStatic
      Align = iaRight
      Caption = 'Last refreshed at'
      Category = 3
      Hint = 'Last refreshed at'
      Visible = ivAlways
    end
    object lblTopSessionLastRefreshed: TdxBarStatic
      Align = iaRight
      Caption = 'Last refreshed at'
      Category = 1
      Hint = 'Last refreshed at'
      Visible = ivAlways
    end
    object btnSystemRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 4
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnSystemRefreshClick
    end
    object lblSystemRefreshTime: TdxBarStatic
      Align = iaRight
      Caption = 'Last refreshed at '
      Category = 4
      Hint = 'Last refreshed at '
      Visible = ivAlways
    end
    object btnChangeParam: TdxBarButton
      Caption = 'Change Parameter'
      Category = 4
      Hint = 'Change Parameter'
      Visible = ivAlways
      ImageIndex = 85
      OnClick = btnChangeParamClick
    end
    object btnTopSQLRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 2
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnTopSQLRefreshClick
    end
    object btnTopSegmentRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 3
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnTopSegmentRefreshClick
    end
    object btnTopSessionRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 1
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnTopSessionRefreshClick
    end
    object btnRefreshMemory: TdxBarButton
      Caption = 'Refresh'
      Category = 5
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnRefreshMemoryClick
    end
    object btnWaitRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 6
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnWaitRefreshClick
    end
    object lblWaitLastRefreshed: TdxBarStatic
      Align = iaRight
      Caption = 'Last refreshed at'
      Category = 6
      Hint = 'Last refreshed at'
      Visible = ivAlways
    end
    object lblMemoryLastRefreshed: TdxBarStatic
      Align = iaRight
      Caption = 'Last refreshed at'
      Category = 5
      Hint = 'Last refreshed at'
      Visible = ivAlways
    end
    object btnStorageRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 7
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnStorageRefreshClick
    end
    object lblStorageLastRefreshed: TdxBarStatic
      Align = iaRight
      Caption = 'Last refreshed at'
      Category = 7
      Hint = 'Last refreshed at'
      Visible = ivAlways
    end
    object btnIORefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 8
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnIORefreshClick
    end
    object lblIORefreshedTime: TdxBarStatic
      Align = iaRight
      Caption = 'Last refreshed at'
      Category = 8
      Hint = 'Last refreshed at'
      Visible = ivAlways
    end
    object btnUndoRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 9
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnUndoRefreshClick
    end
    object lblUndoLastRefresh: TdxBarStatic
      Align = iaRight
      Caption = 'Last refreshed'
      Category = 9
      Hint = 'Last refreshed'
      Visible = ivAlways
    end
    object btnRedoRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 10
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnRedoRefreshClick
    end
    object lblRedoLastRefreshed: TdxBarStatic
      Align = iaRight
      Caption = 'Last refreshed at'
      Category = 10
      Hint = 'Last refreshed at'
      Visible = ivAlways
    end
    object btnTempRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 11
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnTempRefreshClick
    end
    object lblTempLastRefresh: TdxBarStatic
      Align = iaRight
      Caption = 'Last refreshed at'
      Category = 11
      Hint = 'Last refreshed at'
      Visible = ivAlways
    end
    object btnControlRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 12
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnControlRefreshClick
    end
    object lblControlLastRefreshed: TdxBarStatic
      Align = iaRight
      Caption = 'Last refreshed at'
      Category = 12
      Hint = 'Last refreshed at'
      Visible = ivAlways
    end
  end
  object dsTopSQL: TDataSource
    DataSet = qTopSQL
    Left = 120
    Top = 400
  end
  object dsDetail: TDataSource
    DataSet = qDetail
    Left = 144
    Top = 256
  end
  object qTopSQL: TOraQuery
    SQL.Strings = (
      '/* Formatted on 2007/08/29 15:08 (Formatter Plus v4.8.7) */'
      
        'SELECT sql_text, sharable_mem, persistent_mem, runtime_mem, sort' +
        's,'
      
        '       loaded_versions, open_versions, users_opening, executions' +
        ','
      
        '       users_executing, loads, first_load_time, invalidations, p' +
        'arse_calls,'
      '       disk_reads, buffer_gets, rows_processed,'
      '       DECODE (executions,'
      '               0, 0,'
      '               buffer_gets / executions'
      '              ) buffer_gets_per_executions,'
      '       DECODE (executions,'
      '               0, 0,'
      '               disk_reads / executions'
      '              ) disk_reads_per_executions,'
      '       DECODE (executions,'
      '               0, 0,'
      '               rows_processed / executions'
      '              ) rows_processed_per_executions,'
      '       DECODE (buffer_gets,'
      '               0, 100,'
      '               ((buffer_gets - disk_reads) / buffer_gets) * 100'
      '              ) hit_ratio,'
      '       address, hash_value'
      '  FROM (SELECT   *'
      '            FROM v$sql'
      '        ORDER BY buffer_gets DESC)'
      ' WHERE ROWNUM < 10')
    AfterScroll = qTopSQLAfterScroll
    Left = 152
    Top = 400
    object qTopSQLSQL_TEXT: TStringField
      FieldName = 'SQL_TEXT'
      Size = 1000
    end
    object qTopSQLSHARABLE_MEM: TFloatField
      FieldName = 'SHARABLE_MEM'
    end
    object qTopSQLPERSISTENT_MEM: TFloatField
      FieldName = 'PERSISTENT_MEM'
    end
    object qTopSQLRUNTIME_MEM: TFloatField
      FieldName = 'RUNTIME_MEM'
    end
    object qTopSQLSORTS: TFloatField
      FieldName = 'SORTS'
    end
    object qTopSQLLOADED_VERSIONS: TFloatField
      FieldName = 'LOADED_VERSIONS'
    end
    object qTopSQLOPEN_VERSIONS: TFloatField
      FieldName = 'OPEN_VERSIONS'
    end
    object qTopSQLUSERS_OPENING: TFloatField
      FieldName = 'USERS_OPENING'
    end
    object qTopSQLEXECUTIONS: TFloatField
      FieldName = 'EXECUTIONS'
    end
    object qTopSQLUSERS_EXECUTING: TFloatField
      FieldName = 'USERS_EXECUTING'
    end
    object qTopSQLLOADS: TFloatField
      FieldName = 'LOADS'
    end
    object qTopSQLFIRST_LOAD_TIME: TStringField
      FieldName = 'FIRST_LOAD_TIME'
      Size = 19
    end
    object qTopSQLINVALIDATIONS: TFloatField
      FieldName = 'INVALIDATIONS'
    end
    object qTopSQLPARSE_CALLS: TFloatField
      FieldName = 'PARSE_CALLS'
    end
    object qTopSQLDISK_READS: TFloatField
      FieldName = 'DISK_READS'
    end
    object qTopSQLBUFFER_GETS: TFloatField
      FieldName = 'BUFFER_GETS'
    end
    object qTopSQLROWS_PROCESSED: TFloatField
      FieldName = 'ROWS_PROCESSED'
    end
    object qTopSQLBUFFER_GETS_PER_EXECUTIONS: TFloatField
      FieldName = 'BUFFER_GETS_PER_EXECUTIONS'
    end
    object qTopSQLDISK_READS_PER_EXECUTIONS: TFloatField
      FieldName = 'DISK_READS_PER_EXECUTIONS'
    end
    object qTopSQLROWS_PROCESSED_PER_EXECUTIONS: TFloatField
      FieldName = 'ROWS_PROCESSED_PER_EXECUTIONS'
    end
    object qTopSQLHIT_RATIO: TFloatField
      FieldName = 'HIT_RATIO'
    end
    object qTopSQLADDRESS: TVarBytesField
      FieldName = 'ADDRESS'
      Size = 4
    end
    object qTopSQLHASH_VALUE: TFloatField
      FieldName = 'HASH_VALUE'
    end
  end
  object qDetail: TOraQuery
    Left = 176
    Top = 256
  end
  object qTemp: TOraQuery
    Left = 176
    Top = 224
  end
  object dsTemp: TDataSource
    DataSet = qTemp
    Left = 144
    Top = 224
  end
  object StyleRepository: TcxStyleRepository
    Left = 188
    Top = 180
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
  object cxEditRepository: TcxEditRepository
    Left = 153
    Top = 178
    object cxEditRepositoryBlobItem1: TcxEditRepositoryBlobItem
      Properties.BlobEditKind = bekMemo
    end
    object cxEditRepositoryMemoItem1: TcxEditRepositoryMemoItem
      Properties.VisibleLineCount = 5
    end
  end
  object dsPlanTable: TDataSource
    DataSet = vtPlanTable
    Left = 120
    Top = 368
  end
  object qTopSegment: TOraQuery
    SQL.Strings = (
      'SELECT owner,'
      '          object_name'
      
        '       || DECODE (subobject_name, NULL, NULL, '#39'.'#39' || subobject_n' +
        'ame)'
      
        '                                                             ful' +
        'l_object_name,'
      
        '       object_type, VALUE, tablespace_name, statistic_name, obj#' +
        ', dataobj#'
      '  FROM (SELECT   *'
      '            FROM v$segment_statistics'
      '           WHERE statistic_name = '#39'logical reads'#39' AND VALUE <> 0'
      '        ORDER BY VALUE DESC)'
      ' WHERE ROWNUM < 10')
    AfterScroll = qTopSegmentAfterScroll
    Left = 152
    Top = 434
    object qTopSegmentOWNER: TStringField
      FieldName = 'OWNER'
      Required = True
      Size = 30
    end
    object qTopSegmentFULL_OBJECT_NAME: TStringField
      FieldName = 'FULL_OBJECT_NAME'
      Size = 61
    end
    object qTopSegmentOBJECT_TYPE: TStringField
      FieldName = 'OBJECT_TYPE'
      Size = 18
    end
    object qTopSegmentVALUE: TFloatField
      FieldName = 'VALUE'
    end
    object qTopSegmentTABLESPACE_NAME: TStringField
      FieldName = 'TABLESPACE_NAME'
      Required = True
      Size = 30
    end
    object qTopSegmentSTATISTIC_NAME: TStringField
      FieldName = 'STATISTIC_NAME'
      Size = 64
    end
    object qTopSegmentOBJ: TFloatField
      FieldName = 'OBJ#'
      Required = True
    end
    object qTopSegmentDATAOBJ: TFloatField
      FieldName = 'DATAOBJ#'
    end
  end
  object dsTopSegment: TDataSource
    DataSet = qTopSegment
    Left = 120
    Top = 432
  end
  object qTopSession: TOraQuery
    AfterScroll = qTopSegmentAfterScroll
    Left = 152
    Top = 466
    object qTopSessionSID: TFloatField
      FieldName = 'SID'
    end
    object qTopSessionSESSIONS: TStringField
      FieldName = 'SESSIONS'
      Size = 136
    end
    object qTopSessionSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 8
    end
    object qTopSessionOSUSER: TStringField
      FieldName = 'OSUSER'
      Size = 30
    end
    object qTopSessionMACHINE: TStringField
      FieldName = 'MACHINE'
      Size = 64
    end
    object qTopSessionTERMINAL: TStringField
      FieldName = 'TERMINAL'
      Size = 16
    end
    object qTopSessionPROGRAM: TStringField
      FieldName = 'PROGRAM'
      Size = 64
    end
    object qTopSessionMODULE: TStringField
      FieldName = 'MODULE'
      Size = 48
    end
    object qTopSessionACTION: TStringField
      FieldName = 'ACTION'
      Size = 32
    end
    object qTopSessionCLIENT_INFO: TStringField
      FieldName = 'CLIENT_INFO'
      Size = 64
    end
    object qTopSessionNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object qTopSessionVALUE: TFloatField
      FieldName = 'VALUE'
    end
    object qTopSessionSQL_ADDRESS: TVarBytesField
      FieldName = 'SQL_ADDRESS'
      Size = 4
    end
    object qTopSessionSQL_HASH_VALUE: TFloatField
      FieldName = 'SQL_HASH_VALUE'
    end
    object qTopSessionPREV_SQL_ADDR: TVarBytesField
      FieldName = 'PREV_SQL_ADDR'
      Size = 4
    end
    object qTopSessionPREV_HASH_VALUE: TFloatField
      FieldName = 'PREV_HASH_VALUE'
    end
  end
  object dsTopSession: TDataSource
    DataSet = qTopSession
    Left = 120
    Top = 464
  end
  object qBufferPool: TOraQuery
    SQL.Strings = (
      
        'SELECT ID, NAME, block_size, resize_state, current_size, buffers' +
        ', target_size,'
      '       target_buffers, prev_size, prev_buffers'
      '  FROM v$buffer_pool')
    AfterScroll = qBufferPoolAfterScroll
    Left = 224
    Top = 370
    object qBufferPoolID: TFloatField
      FieldName = 'ID'
    end
    object qBufferPoolNAME: TStringField
      FieldName = 'NAME'
    end
    object qBufferPoolBLOCK_SIZE: TFloatField
      FieldName = 'BLOCK_SIZE'
    end
    object qBufferPoolRESIZE_STATE: TStringField
      FieldName = 'RESIZE_STATE'
      Size = 10
    end
    object qBufferPoolCURRENT_SIZE: TFloatField
      FieldName = 'CURRENT_SIZE'
    end
    object qBufferPoolBUFFERS: TFloatField
      FieldName = 'BUFFERS'
    end
    object qBufferPoolTARGET_SIZE: TFloatField
      FieldName = 'TARGET_SIZE'
    end
    object qBufferPoolTARGET_BUFFERS: TFloatField
      FieldName = 'TARGET_BUFFERS'
    end
    object qBufferPoolPREV_SIZE: TFloatField
      FieldName = 'PREV_SIZE'
    end
    object qBufferPoolPREV_BUFFERS: TFloatField
      FieldName = 'PREV_BUFFERS'
    end
  end
  object dsBufferPool: TDataSource
    DataSet = qBufferPool
    Left = 192
    Top = 368
  end
  object qBufferWait: TOraQuery
    SQL.Strings = (
      'select class,count,time from v$waitstat')
    Left = 224
    Top = 402
    object qBufferWaitCLASS: TStringField
      FieldName = 'CLASS'
      Size = 18
    end
    object qBufferWaitCOUNT: TFloatField
      FieldName = 'COUNT'
    end
    object qBufferWaitTIME: TFloatField
      FieldName = 'TIME'
    end
  end
  object dsBufferWait: TDataSource
    DataSet = qBufferWait
    Left = 192
    Top = 400
  end
  object qPGAAdvice: TOraQuery
    SQL.Strings = (
      
        'select trunc(pga_target_for_estimate/1024/1024) pga_target_for_e' +
        'stimate, '
      
        '      to_char(pga_target_factor * 100,'#39'999.9'#39') ||'#39'%'#39' pga_target_' +
        'factor, '
      '      trunc(bytes_processed/1024/1024) bytes_processed,'
      '      trunc(estd_extra_bytes_rw/1024/1024) estd_extra_bytes_rw,'
      
        '      to_char(estd_pga_cache_hit_percentage,'#39'999'#39') || '#39'%'#39' estd_p' +
        'ga_cache_hit_percentage,'
      '      estd_overalloc_count'
      '    from v$pga_target_advice')
    Left = 224
    Top = 432
    object qPGAAdvicePGA_TARGET_FOR_ESTIMATE: TFloatField
      FieldName = 'PGA_TARGET_FOR_ESTIMATE'
    end
    object qPGAAdvicePGA_TARGET_FACTOR: TStringField
      FieldName = 'PGA_TARGET_FACTOR'
      Size = 7
    end
    object qPGAAdviceBYTES_PROCESSED: TFloatField
      FieldName = 'BYTES_PROCESSED'
    end
    object qPGAAdviceESTD_EXTRA_BYTES_RW: TFloatField
      FieldName = 'ESTD_EXTRA_BYTES_RW'
    end
    object qPGAAdviceESTD_PGA_CACHE_HIT_PERCENTAGE: TStringField
      FieldName = 'ESTD_PGA_CACHE_HIT_PERCENTAGE'
      Size = 5
    end
    object qPGAAdviceESTD_OVERALLOC_COUNT: TFloatField
      FieldName = 'ESTD_OVERALLOC_COUNT'
    end
  end
  object dsPGAAdvice: TDataSource
    DataSet = qPGAAdvice
    Left = 192
    Top = 432
  end
  object qPGAStat: TOraQuery
    SQL.Strings = (
      'select * from v$pgastat ')
    Left = 224
    Top = 464
    object qPGAStatNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object qPGAStatVALUE: TFloatField
      FieldName = 'VALUE'
    end
    object qPGAStatUNIT: TStringField
      FieldName = 'UNIT'
      Size = 12
    end
  end
  object dsPGAStat: TDataSource
    DataSet = qPGAStat
    Left = 192
    Top = 464
  end
  object qSharedPoolAdvice: TOraQuery
    SQL.Strings = (
      'select * from v$shared_pool_advice')
    Left = 224
    Top = 496
    object qSharedPoolAdviceSHARED_POOL_SIZE_FOR_ESTIMATE: TFloatField
      FieldName = 'SHARED_POOL_SIZE_FOR_ESTIMATE'
    end
    object qSharedPoolAdviceSHARED_POOL_SIZE_FACTOR: TFloatField
      FieldName = 'SHARED_POOL_SIZE_FACTOR'
    end
    object qSharedPoolAdviceESTD_LC_SIZE: TFloatField
      FieldName = 'ESTD_LC_SIZE'
    end
    object qSharedPoolAdviceESTD_LC_MEMORY_OBJECTS: TFloatField
      FieldName = 'ESTD_LC_MEMORY_OBJECTS'
    end
    object qSharedPoolAdviceESTD_LC_TIME_SAVED: TFloatField
      FieldName = 'ESTD_LC_TIME_SAVED'
    end
    object qSharedPoolAdviceESTD_LC_TIME_SAVED_FACTOR: TFloatField
      FieldName = 'ESTD_LC_TIME_SAVED_FACTOR'
    end
    object qSharedPoolAdviceESTD_LC_MEMORY_OBJECT_HITS: TFloatField
      FieldName = 'ESTD_LC_MEMORY_OBJECT_HITS'
    end
  end
  object dsSharedPoolAdvice: TDataSource
    DataSet = qSharedPoolAdvice
    Left = 192
    Top = 496
  end
  object qDataCacheAdvice: TOraQuery
    SQL.Strings = (
      'select * from v$db_cache_advice ')
    Left = 224
    Top = 528
    object qDataCacheAdviceID: TFloatField
      FieldName = 'ID'
    end
    object qDataCacheAdviceNAME: TStringField
      FieldName = 'NAME'
    end
    object qDataCacheAdviceBLOCK_SIZE: TFloatField
      FieldName = 'BLOCK_SIZE'
    end
    object qDataCacheAdviceADVICE_STATUS: TStringField
      FieldName = 'ADVICE_STATUS'
      Size = 3
    end
    object qDataCacheAdviceSIZE_FOR_ESTIMATE: TFloatField
      FieldName = 'SIZE_FOR_ESTIMATE'
    end
    object qDataCacheAdviceSIZE_FACTOR: TFloatField
      FieldName = 'SIZE_FACTOR'
    end
    object qDataCacheAdviceBUFFERS_FOR_ESTIMATE: TFloatField
      FieldName = 'BUFFERS_FOR_ESTIMATE'
    end
    object qDataCacheAdviceESTD_PHYSICAL_READ_FACTOR: TFloatField
      FieldName = 'ESTD_PHYSICAL_READ_FACTOR'
    end
    object qDataCacheAdviceESTD_PHYSICAL_READS: TFloatField
      FieldName = 'ESTD_PHYSICAL_READS'
    end
  end
  object dsDataCacheAdvice: TDataSource
    DataSet = qDataCacheAdvice
    Left = 192
    Top = 528
  end
  object qEvent: TOraQuery
    SQL.Strings = (
      'SELECT a.event, a.total_waits AS "Total waits",'
      
        '       a.total_timeouts AS "Total timeouts", a.time_waited AS "T' +
        'ime waited",'
      '       a.average_wait AS "Average wait"'
      '  FROM v$system_event a'
      ' WHERE event NOT IN'
      '          ('#39'Null event'#39','
      '           '#39'PX Deq: Execution Msg'#39','
      '           '#39'PX Deq: Table Q Normal'#39','
      '           '#39'PX Idle Wait'#39','
      '           '#39'SQL*Net message from client'#39','
      '           '#39'SQL*Net message to client'#39','
      '           '#39'SQL*Net more data from client'#39','
      '           '#39'client message'#39','
      '           '#39'dispatcher timer'#39','
      '           '#39'gcs for action'#39','
      '           '#39'gcs remote message'#39','
      '           '#39'ges remote message'#39','
      '           '#39'i/o slave wait'#39','
      '           '#39'jobq slave wait'#39','
      '           '#39'lock manager wait for remote message'#39','
      '           '#39'null event'#39','
      '           '#39'parallel query dequeue'#39','
      '           '#39'pipe get'#39','
      '           '#39'pmon timer'#39','
      '           '#39'queue messages'#39','
      '           '#39'rdbms ipc message'#39','
      '           '#39'slave wait'#39','
      '           '#39'smon timer'#39','
      '           '#39'virtual circuit status'#39','
      '           '#39'wakeup time manager'#39
      '          )')
    Left = 293
    Top = 369
    object qEventEVENT: TStringField
      FieldName = 'EVENT'
      Size = 64
    end
    object qEventTotalwaits: TFloatField
      FieldName = 'Total waits'
    end
    object qEventTotaltimeouts: TFloatField
      FieldName = 'Total timeouts'
    end
    object qEventTimewaited: TFloatField
      FieldName = 'Time waited'
    end
    object qEventAveragewait: TFloatField
      FieldName = 'Average wait'
    end
  end
  object dsEvent: TDataSource
    DataSet = qEvent
    Left = 264
    Top = 368
  end
  object qLocks: TOraQuery
    SQL.Strings = (
      'SELECT /*+ ordered */'
      's.SID, s.username, s.status, s.TYPE, s.osuser , s.server,'
      
        #9'    s.serial# , s.sql_address, s.sql_hash_value, s.prev_sql_add' +
        'r,'
      '       s.prev_hash_value'
      'from v$lock l,  v$session s'
      'where l.sid = s.sid'
      'AND l.TYPE IN ('#39'TX'#39', '#39'TM'#39', '#39'UL'#39')')
    AfterScroll = qLocksAfterScroll
    Left = 293
    Top = 403
    object qLocksSID: TFloatField
      FieldName = 'SID'
    end
    object qLocksUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 30
    end
    object qLocksSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 8
    end
    object qLocksTYPE: TStringField
      FieldName = 'TYPE'
      Size = 10
    end
    object qLocksOSUSER: TStringField
      FieldName = 'OSUSER'
      Size = 30
    end
    object qLocksSERVER: TStringField
      FieldName = 'SERVER'
      Size = 9
    end
    object qLocksSERIAL: TFloatField
      FieldName = 'SERIAL#'
    end
    object qLocksSQL_ADDRESS: TVarBytesField
      FieldName = 'SQL_ADDRESS'
      Size = 4
    end
    object qLocksSQL_HASH_VALUE: TFloatField
      FieldName = 'SQL_HASH_VALUE'
    end
    object qLocksPREV_SQL_ADDR: TVarBytesField
      FieldName = 'PREV_SQL_ADDR'
      Size = 4
    end
    object qLocksPREV_HASH_VALUE: TFloatField
      FieldName = 'PREV_HASH_VALUE'
    end
  end
  object dsLocks: TDataSource
    DataSet = qLocks
    Left = 263
    Top = 403
  end
  object dsLatches: TDataSource
    DataSet = qLatches
    Left = 263
    Top = 435
  end
  object qLatches: TOraQuery
    SQL.Strings = (
      'SELECT latch#, level#, NAME, wait_time,'
      
        '       DECODE (misses, 0, 100, 100 * spin_gets / misses) hit_rat' +
        'e, gets,'
      
        '       misses, sleeps, immediate_gets, immediate_misses, spin_ge' +
        'ts, sleep1,'
      '       sleep2, sleep3, sleep4'
      '  FROM v$latch')
    Left = 294
    Top = 435
    object qLatchesLATCH: TFloatField
      FieldName = 'LATCH#'
    end
    object qLatchesLEVEL: TFloatField
      FieldName = 'LEVEL#'
    end
    object qLatchesNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object qLatchesWAIT_TIME: TFloatField
      FieldName = 'WAIT_TIME'
    end
    object qLatchesHIT_RATE: TFloatField
      FieldName = 'HIT_RATE'
    end
    object qLatchesGETS: TFloatField
      FieldName = 'GETS'
    end
    object qLatchesMISSES: TFloatField
      FieldName = 'MISSES'
    end
    object qLatchesSLEEPS: TFloatField
      FieldName = 'SLEEPS'
    end
    object qLatchesIMMEDIATE_GETS: TFloatField
      FieldName = 'IMMEDIATE_GETS'
    end
    object qLatchesIMMEDIATE_MISSES: TFloatField
      FieldName = 'IMMEDIATE_MISSES'
    end
    object qLatchesSPIN_GETS: TFloatField
      FieldName = 'SPIN_GETS'
    end
    object qLatchesSLEEP1: TFloatField
      FieldName = 'SLEEP1'
    end
    object qLatchesSLEEP2: TFloatField
      FieldName = 'SLEEP2'
    end
    object qLatchesSLEEP3: TFloatField
      FieldName = 'SLEEP3'
    end
    object qLatchesSLEEP4: TFloatField
      FieldName = 'SLEEP4'
    end
  end
  object qChildLatches: TOraQuery
    SQL.Strings = (
      
        'SELECT   lp.NAME, lp.latch#, lc.child#, lc.level#, lc.gets, lc.m' +
        'isses,'
      
        '         lc.sleeps, lc.immediate_gets, lc.immediate_misses, lc.s' +
        'pin_gets,'
      '         lc.sleep1, lc.sleep2, lc.sleep3, lc.sleep4'
      '    FROM v$latch_parent lp, v$latch_children lc'
      '   WHERE lp.latch# = lc.latch#'
      'ORDER BY lp.latch#, lc.child#')
    Left = 294
    Top = 467
    object qChildLatchesNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object qChildLatchesLATCH: TFloatField
      FieldName = 'LATCH#'
    end
    object qChildLatchesCHILD: TFloatField
      FieldName = 'CHILD#'
    end
    object qChildLatchesLEVEL: TFloatField
      FieldName = 'LEVEL#'
    end
    object qChildLatchesGETS: TFloatField
      FieldName = 'GETS'
    end
    object qChildLatchesMISSES: TFloatField
      FieldName = 'MISSES'
    end
    object qChildLatchesSLEEPS: TFloatField
      FieldName = 'SLEEPS'
    end
    object qChildLatchesIMMEDIATE_GETS: TFloatField
      FieldName = 'IMMEDIATE_GETS'
    end
    object qChildLatchesIMMEDIATE_MISSES: TFloatField
      FieldName = 'IMMEDIATE_MISSES'
    end
    object qChildLatchesSPIN_GETS: TFloatField
      FieldName = 'SPIN_GETS'
    end
    object qChildLatchesSLEEP1: TFloatField
      FieldName = 'SLEEP1'
    end
    object qChildLatchesSLEEP2: TFloatField
      FieldName = 'SLEEP2'
    end
    object qChildLatchesSLEEP3: TFloatField
      FieldName = 'SLEEP3'
    end
    object qChildLatchesSLEEP4: TFloatField
      FieldName = 'SLEEP4'
    end
  end
  object dsChildLatches: TDataSource
    DataSet = qChildLatches
    Left = 263
    Top = 467
  end
  object qLatchHolders: TOraQuery
    SQL.Strings = (
      
        'select lh.name,s.SID,s.serial#,s.username,s.osuser,s.machine,s.t' +
        'erminal,s.program from v$latchholder lh, v$session s where '
      'lh.sid = s.sid')
    Left = 294
    Top = 499
    object qLatchHoldersNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object qLatchHoldersSID: TFloatField
      FieldName = 'SID'
    end
    object qLatchHoldersSERIAL: TFloatField
      FieldName = 'SERIAL#'
    end
    object qLatchHoldersUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 30
    end
    object qLatchHoldersOSUSER: TStringField
      FieldName = 'OSUSER'
      Size = 30
    end
    object qLatchHoldersMACHINE: TStringField
      FieldName = 'MACHINE'
      Size = 64
    end
    object qLatchHoldersTERMINAL: TStringField
      FieldName = 'TERMINAL'
      Size = 16
    end
    object qLatchHoldersPROGRAM: TStringField
      FieldName = 'PROGRAM'
      Size = 64
    end
  end
  object dsLatchHolders: TDataSource
    DataSet = qLatchHolders
    Left = 263
    Top = 499
  end
  object qTablespace: TOraQuery
    SQL.Strings = (
      'select '
      'TABLESPACE_NAME,'
      'ROUND((100*(BYTES-BYTES_FREE))/BYTES,2) PERCENT_USED, '
      'ROUND(BYTES/1024/1024,2) BYTES,'
      'ROUND(MAXBYTES/1024/1024,2) MAXBYTES,'
      'ROUND(BYTES_FREE/1024/1024,2) BYTES_FREE,'
      
        'TABLESPACE_TYPE, STATUS, CONTENTS, LOGGING, EXTENT_MANAGEMENT, A' +
        'LLOCATION_TYPE'
      'from '
      '('
      
        'SELECT a.*, dt.status, dt.CONTENTS, dt.LOGGING, dt.extent_manage' +
        'ment,'
      '       dt.allocation_type'
      '  FROM (SELECT   dt.tablespace_name, ddf.BYTES, ddf.maxbytes,'
      
        '                 NVL (dfs.bytes_free, 0) bytes_free, '#39'DATA'#39' tabl' +
        'espace_type'
      '            FROM (SELECT   tablespace_name, SUM (BYTES) BYTES,'
      '                           SUM (DECODE (autoextensible,'
      '                                        '#39'YES'#39', maxbytes,'
      '                                        '#39'NO'#39', BYTES'
      '                                       )'
      '                               ) maxbytes'
      '                      FROM dba_data_files'
      '                  GROUP BY tablespace_name) ddf,'
      
        '                 (SELECT   tablespace_name, SUM (BYTES) bytes_fr' +
        'ee'
      '                      FROM dba_free_space'
      '                  GROUP BY tablespace_name) dfs,'
      '                 dba_tablespaces dt'
      '           WHERE dt.tablespace_name = ddf.tablespace_name'
      '             AND ddf.tablespace_name = dfs.tablespace_name(+)'
      '             AND dt.CONTENTS <> '#39'TEMPORARY'#39
      '        UNION ALL'
      '        SELECT   dt.tablespace_name, ddf.BYTES, ddf.maxbytes,'
      '                 ddf.BYTES - NVL (dfs.bytes_used, 0) bytes_free,'
      '                 '#39'TEMP-DICT'#39' tablespace_type'
      '            FROM (SELECT   tablespace_name, SUM (BYTES) BYTES,'
      '                           SUM (DECODE (autoextensible,'
      '                                        '#39'YES'#39', maxbytes,'
      '                                        '#39'NO'#39', BYTES'
      '                                       )'
      '                               ) maxbytes'
      '                      FROM dba_data_files'
      '                  GROUP BY tablespace_name) ddf,'
      '                 (SELECT   NVL (SUM (tu.blocks * bs.block_size),'
      '                                0) bytes_used, t.tablespace_name'
      '                      FROM v$sort_usage tu,'
      '                           dba_tablespaces t,'
      '                           (SELECT VALUE block_size'
      '                              FROM v$parameter2'
      '                             WHERE NAME = '#39'db_block_size'#39') bs'
      '                     WHERE tu.CONTENTS = '#39'TEMPORARY'#39
      '                       AND tu.TABLESPACE = t.tablespace_name'
      '                       AND t.extent_management = '#39'DICTIONARY'#39
      '                  GROUP BY t.tablespace_name) dfs,'
      '                 dba_tablespaces dt'
      '           WHERE dt.tablespace_name = ddf.tablespace_name'
      '             AND ddf.tablespace_name = dfs.tablespace_name(+)'
      '             AND dt.CONTENTS = '#39'TEMPORARY'#39
      '        UNION ALL'
      '        SELECT   tsh.tablespace_name,'
      
        '                 SUM (tsh.bytes_free + tsh.bytes_used) BYTES, dt' +
        'f.maxbytes,'
      '                 SUM (tsh.bytes_free + tsh.bytes_used'
      '                      - NVL (tep.bytes_used, 0)'
      '                     ) bytes_free,'
      '                 '#39'TEMP-LOCAL'#39' tablespace_type'
      '            FROM v$temp_space_header tsh,'
      '                 v$temp_extent_pool tep,'
      '                 dba_temp_files dtf'
      '           WHERE tsh.file_id = tep.file_id(+)'
      '             AND tsh.tablespace_name = tep.tablespace_name(+)'
      '             AND tsh.file_id = dtf.file_id'
      '        GROUP BY tsh.tablespace_name, dtf.maxbytes'
      '        ORDER BY 1) a,'
      '       dba_tablespaces dt'
      ' WHERE a.tablespace_name = dt.tablespace_name'
      ') x')
    AfterScroll = qTablespaceAfterScroll
    Left = 362
    Top = 368
    object qTablespacePERCENT_USED: TFloatField
      FieldName = 'PERCENT_USED'
    end
    object qTablespaceTABLESPACE_NAME: TStringField
      FieldName = 'TABLESPACE_NAME'
      Size = 30
    end
    object qTablespaceBYTES: TFloatField
      FieldName = 'BYTES'
    end
    object qTablespaceMAXBYTES: TFloatField
      FieldName = 'MAXBYTES'
    end
    object qTablespaceBYTES_FREE: TFloatField
      FieldName = 'BYTES_FREE'
    end
    object qTablespaceTABLESPACE_TYPE: TStringField
      FieldName = 'TABLESPACE_TYPE'
      Size = 10
    end
    object qTablespaceSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 9
    end
    object qTablespaceCONTENTS: TStringField
      FieldName = 'CONTENTS'
      Size = 9
    end
    object qTablespaceLOGGING: TStringField
      FieldName = 'LOGGING'
      Size = 9
    end
    object qTablespaceEXTENT_MANAGEMENT: TStringField
      FieldName = 'EXTENT_MANAGEMENT'
      Size = 10
    end
    object qTablespaceALLOCATION_TYPE: TStringField
      FieldName = 'ALLOCATION_TYPE'
      Size = 9
    end
  end
  object dsTablespace: TDataSource
    DataSet = qTablespace
    Left = 328
    Top = 368
  end
  object qIOFiles: TOraQuery
    SQL.Strings = (
      
        'SELECT fs.file#, NAME, phyrds, phywrts, phyblkrd, phyblkwrt, sin' +
        'gleblkrds,'
      
        '       readtim, writetim, singleblkrdtim, avgiotim, lstiotim, mi' +
        'niotim, '
      '       maxiortm, maxiowtm '
      '  FROM v$filestat fs, v$datafile df '
      ' WHERE fs.file# = df.file# '
      'UNION '
      
        'SELECT ts.file#, NAME, phyrds, phywrts, phyblkrd, phyblkwrt, sin' +
        'gleblkrds,'
      
        '       readtim, writetim, singleblkrdtim, avgiotim, lstiotim, mi' +
        'niotim, '
      '       maxiortm, maxiowtm '
      '  FROM v$tempstat ts, v$tempfile tf '
      ' WHERE ts.file# = tf.file# ')
    Left = 434
    Top = 369
    object qIOFilesFILE: TFloatField
      FieldName = 'FILE#'
    end
    object qIOFilesNAME: TStringField
      FieldName = 'NAME'
      Size = 513
    end
    object qIOFilesPHYRDS: TFloatField
      FieldName = 'PHYRDS'
    end
    object qIOFilesPHYWRTS: TFloatField
      FieldName = 'PHYWRTS'
    end
    object qIOFilesPHYBLKRD: TFloatField
      FieldName = 'PHYBLKRD'
    end
    object qIOFilesPHYBLKWRT: TFloatField
      FieldName = 'PHYBLKWRT'
    end
    object qIOFilesSINGLEBLKRDS: TFloatField
      FieldName = 'SINGLEBLKRDS'
    end
    object qIOFilesREADTIM: TFloatField
      FieldName = 'READTIM'
    end
    object qIOFilesWRITETIM: TFloatField
      FieldName = 'WRITETIM'
    end
    object qIOFilesSINGLEBLKRDTIM: TFloatField
      FieldName = 'SINGLEBLKRDTIM'
    end
    object qIOFilesAVGIOTIM: TFloatField
      FieldName = 'AVGIOTIM'
    end
    object qIOFilesLSTIOTIM: TFloatField
      FieldName = 'LSTIOTIM'
    end
    object qIOFilesMINIOTIM: TFloatField
      FieldName = 'MINIOTIM'
    end
    object qIOFilesMAXIORTM: TFloatField
      FieldName = 'MAXIORTM'
    end
    object qIOFilesMAXIOWTM: TFloatField
      FieldName = 'MAXIOWTM'
    end
  end
  object dsIOFiles: TDataSource
    DataSet = qIOFiles
    Left = 400
    Top = 368
  end
  object qSysStat: TOraQuery
    SQL.Strings = (
      'SELECT NAME, VALUE, sysdate'
      '  FROM v$sysstat'
      ' WHERE NAME IN'
      '          ('#39'bytes received via SQL*Net from client'#39','
      '           '#39'bytes received via SQL*Net from dblink'#39','
      '           '#39'bytes sent via SQL*Net to client'#39','
      '           '#39'bytes sent via SQL*Net to dblink'#39','
      '           '#39'consistent changes'#39','
      '           '#39'consistent gets'#39','
      '           '#39'CPU used by this session'#39','
      '           '#39'db block changes'#39','
      '           '#39'db block gets'#39','
      '           '#39'execute count'#39','
      '           '#39'logons cumulative'#39','
      '           '#39'parse count (hard)'#39','
      '           '#39'parse count (total)'#39','
      '           '#39'parse time cpu'#39','
      '           '#39'parse time elapsed'#39','
      '           '#39'physical reads'#39','
      '           '#39'physical reads direct'#39','
      '           '#39'physical reads direct (lob)'#39','
      '           '#39'physical writes'#39','
      '           '#39'physical writes direct'#39','
      '           '#39'redo blocks written'#39','
      '           '#39'redo buffer allocation retries'#39','
      '           '#39'redo entries'#39','
      '           '#39'redo size'#39','
      '           '#39'redo wastage'#39','
      '           '#39'session logical reads'#39','
      '           '#39'session pga memory'#39','
      '           '#39'session uga memory'#39','
      '           '#39'sorts (disk)'#39','
      '           '#39'sorts (memory)'#39','
      '           '#39'sorts (rows)'#39','
      '           '#39'SQL*Net roundtrips to/from client'#39','
      '           '#39'SQL*Net roundtrips to/from dblink'#39','
      '           '#39'table fetch by rowid'#39','
      '           '#39'table fetch continued row'#39','
      '           '#39'table scans (long tables)'#39','
      '           '#39'table scans (short tables)'#39','
      '           '#39'table scan blocks gotten'#39','
      '           '#39'table scan rows gotten'#39','
      '           '#39'user calls'#39','
      '           '#39'user commits'#39','
      '           '#39'user rollbacks'#39','
      '           '#39'workarea executions - multipass'#39','
      '           '#39'workarea executions - onepass'#39','
      '           '#39'workarea executions - optimal'#39','
      '           '#39'workarea memory allocated'#39
      '          )')
    Left = 434
    Top = 435
    object qSysStatNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object qSysStatVALUE: TFloatField
      FieldName = 'VALUE'
    end
    object qSysStatSYSDATE: TDateTimeField
      FieldName = 'SYSDATE'
    end
  end
  object dsConsistentChange: TDataSource
    DataSet = vtConsistentChange
    Left = 400
    Top = 400
  end
  object vtConsistentChange: TVirtualTable
    FieldDefs = <
      item
        Name = 'NAME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALUE'
        DataType = ftFloat
      end
      item
        Name = 'TIME'
        DataType = ftString
        Size = 20
      end>
    Left = 434
    Top = 404
    Data = {
      0100030004004E414D4501001400050056414C554506000000040054494D4501
      001400000018000000020041410800000000000000F03F010032020041410800
      0000000000000040010033020041410800000000000000084002003435020041
      4108000000000000001040010036020042420800000000000000F03F01003102
      0042420800000000000000F03F01003102004242080000000000000000400100
      3102004242080000000000000000400100320200424208000000000000000840
      0100310200424208000000000000001040020034340200424208000000000000
      0010400100350200424208000000000000001440010034020043430800000000
      0000002040020036350200434308000000000000002240010031020043430800
      0000000000002440010031020043430800000000000000264001003102004343
      0800000000000000284001003102004343080000000000000028400100310200
      434308000000000000002C400100310200434308000000000000003140020033
      3402004343080000000000000031400100310200434308000000000000003340
      0100330200434308000000000000003440010031020043430800000000000000
      354002003433}
    object TStringField
      FieldName = 'NAME'
    end
    object TFloatField
      FieldName = 'VALUE'
    end
    object TStringField
      FieldName = 'TIME'
    end
  end
  object qUndoTablespace: TOraQuery
    SQL.Strings = (
      'SELECT dt.tablespace_name, ddf.BYTES, ddf.maxbytes,'
      
        '       NVL (dfs.bytes_free, 0) bytes_free, dt.status, '#39'DATA'#39' tab' +
        'lespace_type,    '
      '   '#9'   ROUND((100*(BYTES-BYTES_FREE))/BYTES,2) PERCENT_USED'#9'   '
      '  FROM (SELECT   tablespace_name, SUM (BYTES) BYTES,'
      
        '                 SUM (DECODE (autoextensible, '#39'YES'#39', maxbytes, '#39 +
        'NO'#39', BYTES)'
      '                     ) maxbytes'
      '            FROM dba_data_files'
      '        GROUP BY tablespace_name) ddf,'
      '       (SELECT   tablespace_name, SUM (BYTES) bytes_free'
      '            FROM dba_free_space'
      '        GROUP BY tablespace_name) dfs,'
      '       dba_tablespaces dt'
      ' WHERE dt.tablespace_name = ddf.tablespace_name'
      '   AND ddf.tablespace_name = dfs.tablespace_name(+)'
      '   AND dt.CONTENTS = '#39'UNDO'#39)
    AfterScroll = qUndoTablespaceAfterScroll
    Left = 506
    Top = 367
    object qUndoTablespaceTABLESPACE_NAME: TStringField
      FieldName = 'TABLESPACE_NAME'
      Required = True
      Size = 30
    end
    object qUndoTablespaceBYTES: TFloatField
      FieldName = 'BYTES'
    end
    object qUndoTablespaceMAXBYTES: TFloatField
      FieldName = 'MAXBYTES'
    end
    object qUndoTablespaceBYTES_FREE: TFloatField
      FieldName = 'BYTES_FREE'
    end
    object qUndoTablespaceSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 9
    end
    object qUndoTablespaceTABLESPACE_TYPE: TStringField
      FieldName = 'TABLESPACE_TYPE'
      FixedChar = True
      Size = 4
    end
    object qUndoTablespacePERCENT_USED: TFloatField
      FieldName = 'PERCENT_USED'
    end
  end
  object dsUndoTablespace: TDataSource
    DataSet = qUndoTablespace
    Left = 474
    Top = 400
  end
  object qUndoStat: TOraQuery
    SQL.Strings = (
      'SELECT   to_date(begin_time,'#39'dd.mm.yyyy'#39') thedate,'
      '         TO_NUMBER (TO_CHAR (begin_time, '#39'hh24'#39')) thehour,'
      
        '         SUM (undoblks) sum_undoblks, SUM (txncount) sum_tnxcoun' +
        't,'
      '         MAX (maxquerylen) max_querylen'
      '    FROM v$undostat'
      'GROUP BY to_date(begin_time,'#39'dd.mm.yyyy'#39'),'
      '         TO_CHAR (begin_time, '#39'hh24'#39')'
      'ORDER BY 1 DESC, 2 DESC, 3 DESC, 4 DESC')
    Left = 506
    Top = 403
    object qUndoStatTHEDATE: TDateTimeField
      FieldName = 'THEDATE'
    end
    object qUndoStatTHEHOUR: TFloatField
      FieldName = 'THEHOUR'
    end
    object qUndoStatSUM_UNDOBLKS: TFloatField
      FieldName = 'SUM_UNDOBLKS'
    end
    object qUndoStatSUM_TNXCOUNT: TFloatField
      FieldName = 'SUM_TNXCOUNT'
    end
    object qUndoStatMAX_QUERYLEN: TFloatField
      FieldName = 'MAX_QUERYLEN'
    end
  end
  object dsUndoStat: TDataSource
    DataSet = qUndoStat
    Left = 474
    Top = 368
  end
  object qRedoGroups: TOraQuery
    SQL.Strings = (
      
        'SELECT group#, thread#, sequence#, BYTES, members, archived, sta' +
        'tus,'
      '       first_change#, first_time'
      '  FROM v$log')
    AfterScroll = qRedoGroupsAfterScroll
    Left = 578
    Top = 371
    object qRedoGroupsGROUP: TFloatField
      FieldName = 'GROUP#'
    end
    object qRedoGroupsTHREAD: TFloatField
      FieldName = 'THREAD#'
    end
    object qRedoGroupsSEQUENCE: TFloatField
      FieldName = 'SEQUENCE#'
    end
    object qRedoGroupsBYTES: TFloatField
      FieldName = 'BYTES'
    end
    object qRedoGroupsMEMBERS: TFloatField
      FieldName = 'MEMBERS'
    end
    object qRedoGroupsARCHIVED: TStringField
      FieldName = 'ARCHIVED'
      Size = 3
    end
    object qRedoGroupsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 16
    end
    object qRedoGroupsFIRST_CHANGE: TFloatField
      FieldName = 'FIRST_CHANGE#'
    end
    object qRedoGroupsFIRST_TIME: TDateTimeField
      FieldName = 'FIRST_TIME'
    end
  end
  object dsRedoGroups: TDataSource
    DataSet = qRedoGroups
    Left = 546
    Top = 371
  end
  object dsLogSwitchHistory: TDataSource
    DataSet = qLogSwitchHistory
    Left = 546
    Top = 403
  end
  object qLogSwitchHistory: TOraQuery
    SQL.Strings = (
      'SELECT   TO_NUMBER (TO_CHAR (first_time, '#39'YYYY'#39')) theyear,'
      '         TO_NUMBER (TO_CHAR (first_time, '#39'MM'#39')) themonth,'
      '         TO_NUMBER (TO_CHAR (first_time, '#39'DD'#39')) theday,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'00'#39', 1, 0))' +
        ' h0,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'01'#39', 1, 0))' +
        ' h1,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'02'#39', 1, 0))' +
        ' h2,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'03'#39', 1, 0))' +
        ' h3,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'04'#39', 1, 0))' +
        ' h4,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'05'#39', 1, 0))' +
        ' h5,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'06'#39', 1, 0))' +
        ' h6,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'07'#39', 1, 0))' +
        ' h7,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'08'#39', 1, 0))' +
        ' h8,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'09'#39', 1, 0))' +
        ' h9,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'10'#39', 1, 0))' +
        ' h10,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'11'#39', 1, 0))' +
        ' h11,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'12'#39', 1, 0))' +
        ' h12,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'13'#39', 1, 0))' +
        ' h13,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'14'#39', 1, 0))' +
        ' h14,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'15'#39', 1, 0))' +
        ' h15,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'16'#39', 1, 0))' +
        ' h16,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'17'#39', 1, 0))' +
        ' h17,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'18'#39', 1, 0))' +
        ' h18,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'19'#39', 1, 0))' +
        ' h19,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'20'#39', 1, 0))' +
        ' h20,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'21'#39', 1, 0))' +
        ' h21,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'22'#39', 1, 0))' +
        ' h22,'
      
        '         SUM (DECODE (TO_CHAR (first_time, '#39'hh24'#39'), '#39'23'#39', 1, 0))' +
        ' h23'
      '    FROM v$archived_log'
      '   WHERE TRUNC (SYSDATE) - TRUNC (first_time) < 14'
      'GROUP BY TO_NUMBER (TO_CHAR (first_time, '#39'YYYY'#39')),'
      '         TO_NUMBER (TO_CHAR (first_time, '#39'MM'#39')),'
      '         TO_NUMBER (TO_CHAR (first_time, '#39'DD'#39'))'
      'ORDER BY 1, 2, 3')
    Left = 578
    Top = 403
    object qLogSwitchHistoryTHEYEAR: TFloatField
      FieldName = 'THEYEAR'
    end
    object qLogSwitchHistoryTHEMONTH: TFloatField
      FieldName = 'THEMONTH'
    end
    object qLogSwitchHistoryTHEDAY: TFloatField
      FieldName = 'THEDAY'
    end
    object qLogSwitchHistoryH0: TFloatField
      FieldName = 'H0'
    end
    object qLogSwitchHistoryH1: TFloatField
      FieldName = 'H1'
    end
    object qLogSwitchHistoryH2: TFloatField
      FieldName = 'H2'
    end
    object qLogSwitchHistoryH3: TFloatField
      FieldName = 'H3'
    end
    object qLogSwitchHistoryH4: TFloatField
      FieldName = 'H4'
    end
    object qLogSwitchHistoryH5: TFloatField
      FieldName = 'H5'
    end
    object qLogSwitchHistoryH6: TFloatField
      FieldName = 'H6'
    end
    object qLogSwitchHistoryH7: TFloatField
      FieldName = 'H7'
    end
    object qLogSwitchHistoryH8: TFloatField
      FieldName = 'H8'
    end
    object qLogSwitchHistoryH9: TFloatField
      FieldName = 'H9'
    end
    object qLogSwitchHistoryH10: TFloatField
      FieldName = 'H10'
    end
    object qLogSwitchHistoryH11: TFloatField
      FieldName = 'H11'
    end
    object qLogSwitchHistoryH12: TFloatField
      FieldName = 'H12'
    end
    object qLogSwitchHistoryH13: TFloatField
      FieldName = 'H13'
    end
    object qLogSwitchHistoryH14: TFloatField
      FieldName = 'H14'
    end
    object qLogSwitchHistoryH15: TFloatField
      FieldName = 'H15'
    end
    object qLogSwitchHistoryH16: TFloatField
      FieldName = 'H16'
    end
    object qLogSwitchHistoryH17: TFloatField
      FieldName = 'H17'
    end
    object qLogSwitchHistoryH18: TFloatField
      FieldName = 'H18'
    end
    object qLogSwitchHistoryH19: TFloatField
      FieldName = 'H19'
    end
    object qLogSwitchHistoryH20: TFloatField
      FieldName = 'H20'
    end
    object qLogSwitchHistoryH21: TFloatField
      FieldName = 'H21'
    end
    object qLogSwitchHistoryH22: TFloatField
      FieldName = 'H22'
    end
    object qLogSwitchHistoryH23: TFloatField
      FieldName = 'H23'
    end
  end
  object qArchivedLogs: TOraQuery
    SQL.Strings = (
      
        'SELECT dest_id, status, BINDING, name_space, target, reopen_secs' +
        ', destination,'
      '       fail_date, fail_sequence, fail_block, error'
      '  FROM v$archive_dest')
    AfterScroll = qArchivedLogsAfterScroll
    Left = 578
    Top = 435
    object qArchivedLogsDEST_ID: TFloatField
      FieldName = 'DEST_ID'
    end
    object qArchivedLogsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 9
    end
    object qArchivedLogsBINDING: TStringField
      FieldName = 'BINDING'
      Size = 9
    end
    object qArchivedLogsNAME_SPACE: TStringField
      FieldName = 'NAME_SPACE'
      Size = 7
    end
    object qArchivedLogsTARGET: TStringField
      FieldName = 'TARGET'
      Size = 7
    end
    object qArchivedLogsREOPEN_SECS: TFloatField
      FieldName = 'REOPEN_SECS'
    end
    object qArchivedLogsDESTINATION: TStringField
      FieldName = 'DESTINATION'
      Size = 256
    end
    object qArchivedLogsFAIL_DATE: TDateTimeField
      FieldName = 'FAIL_DATE'
    end
    object qArchivedLogsFAIL_SEQUENCE: TFloatField
      FieldName = 'FAIL_SEQUENCE'
    end
    object qArchivedLogsFAIL_BLOCK: TFloatField
      FieldName = 'FAIL_BLOCK'
    end
    object qArchivedLogsERROR: TStringField
      FieldName = 'ERROR'
      Size = 256
    end
  end
  object dsArchivedLogs: TDataSource
    DataSet = qArchivedLogs
    Left = 546
    Top = 435
  end
  object qTempfiles: TOraQuery
    SQL.Strings = (
      
        'SELECT ts.file#, NAME, phyrds, phywrts, phyblkrd, phyblkwrt, sin' +
        'gleblkrds,'
      
        '       readtim, writetim, singleblkrdtim, avgiotim, lstiotim, mi' +
        'niotim,'
      '       maxiortm, maxiowtm'
      '  FROM v$tempstat ts, v$tempfile tf'
      ' WHERE ts.file# = tf.file#')
    Left = 650
    Top = 371
    object qTempfilesFILE: TFloatField
      FieldName = 'FILE#'
    end
    object qTempfilesNAME: TStringField
      FieldName = 'NAME'
      Size = 513
    end
    object qTempfilesPHYRDS: TFloatField
      FieldName = 'PHYRDS'
    end
    object qTempfilesPHYWRTS: TFloatField
      FieldName = 'PHYWRTS'
    end
    object qTempfilesPHYBLKRD: TFloatField
      FieldName = 'PHYBLKRD'
    end
    object qTempfilesPHYBLKWRT: TFloatField
      FieldName = 'PHYBLKWRT'
    end
    object qTempfilesSINGLEBLKRDS: TFloatField
      FieldName = 'SINGLEBLKRDS'
    end
    object qTempfilesREADTIM: TFloatField
      FieldName = 'READTIM'
    end
    object qTempfilesWRITETIM: TFloatField
      FieldName = 'WRITETIM'
    end
    object qTempfilesSINGLEBLKRDTIM: TFloatField
      FieldName = 'SINGLEBLKRDTIM'
    end
    object qTempfilesAVGIOTIM: TFloatField
      FieldName = 'AVGIOTIM'
    end
    object qTempfilesLSTIOTIM: TFloatField
      FieldName = 'LSTIOTIM'
    end
    object qTempfilesMINIOTIM: TFloatField
      FieldName = 'MINIOTIM'
    end
    object qTempfilesMAXIORTM: TFloatField
      FieldName = 'MAXIORTM'
    end
    object qTempfilesMAXIOWTM: TFloatField
      FieldName = 'MAXIOWTM'
    end
  end
  object dsTempfiles: TDataSource
    DataSet = qTempfiles
    Left = 618
    Top = 371
  end
  object dsParameters: TDataSource
    DataSet = qParameters
    Left = 16
    Top = 376
  end
  object qParameters: TOraQuery
    AfterScroll = qParametersAfterScroll
    Left = 48
    Top = 376
  end
  object vtPlanTable: TVirtualTable
    IndexFieldNames = 'ID;PARENT_ID'
    Left = 152
    Top = 368
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
    object vtPlanTableCPU_COST: TFloatField
      FieldName = 'CPU_COST'
    end
    object vtPlanTableIO_COST: TFloatField
      FieldName = 'IO_COST'
    end
    object vtPlanTableACCESS_PREDICATES: TStringField
      FieldName = 'ACCESS_PREDICATES'
      Size = 500
    end
    object vtPlanTableFILTER_PREDICATES: TStringField
      FieldName = 'FILTER_PREDICATES'
      Size = 500
    end
  end
  object qControlFiles: TOraQuery
    SQL.Strings = (
      'SELECT * from v$ControlFile')
    Left = 730
    Top = 369
    object qControlFilesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 7
    end
    object qControlFilesNAME: TStringField
      FieldName = 'NAME'
      Size = 513
    end
  end
  object qControlFileStatistic: TOraQuery
    SQL.Strings = (
      'SELECT INITCAP(TYPE), record_size, records_total, records_used, '
      '(record_size*records_used) "Used", '
      'record_size*(records_total-records_used) "Free" '
      ' FROM V$CONTROLFILE_RECORD_SECTION ORDER BY 1')
    Left = 730
    Top = 401
    object qControlFileStatisticINITCAPTYPE: TStringField
      FieldName = 'INITCAP(TYPE)'
    end
    object qControlFileStatisticRECORD_SIZE: TFloatField
      FieldName = 'RECORD_SIZE'
    end
    object qControlFileStatisticRECORDS_TOTAL: TFloatField
      FieldName = 'RECORDS_TOTAL'
    end
    object qControlFileStatisticRECORDS_USED: TFloatField
      FieldName = 'RECORDS_USED'
    end
    object qControlFileStatisticUsed: TFloatField
      FieldName = 'Used'
    end
    object qControlFileStatisticFree: TFloatField
      FieldName = 'Free'
    end
  end
  object dsControlFiles: TDataSource
    DataSet = qControlFiles
    Left = 698
    Top = 371
  end
  object dsControlFileStatistic: TDataSource
    DataSet = qControlFileStatistic
    Left = 698
    Top = 403
  end
  object qSGAStats: TOraQuery
    SQL.Strings = (
      'select '#9'*'
      'from '#9'v$sgastat'
      'order'#9'by NAME')
    Left = 434
    Top = 467
    object qSGAStatsPOOL: TStringField
      FieldName = 'POOL'
      Size = 11
    end
    object qSGAStatsNAME: TStringField
      FieldName = 'NAME'
      Size = 26
    end
    object qSGAStatsBYTES: TFloatField
      FieldName = 'BYTES'
    end
  end
  object dsSGAStats: TDataSource
    DataSet = qSGAStats
    Left = 401
    Top = 468
  end
  object qFragmentations: TOraQuery
    SQL.Strings = (
      ''
      'SELECT   tablespace_name,'
      '         ROUND (  SQRT (MAX (blocks) / SUM (blocks))'
      '                * (100 / SQRT (SQRT (COUNT (blocks)))),'
      '                2'
      '               ) fragmentation_index,'
      '         COUNT (*) free_chunks,'
      '         DECODE (ROUND ((MAX (BYTES) / 1024000), 2),'
      '                 NULL, 0,'
      '                 ROUND ((MAX (BYTES) / 1024000), 2)'
      '                ) largest_chunk'
      '    FROM SYS.dba_free_space'
      'GROUP BY tablespace_name'
      'ORDER BY 2 DESC, 1')
    Left = 362
    Top = 403
    object qFragmentationsTABLESPACE_NAME: TStringField
      FieldName = 'TABLESPACE_NAME'
      Size = 30
    end
    object qFragmentationsFRAGMENTATION_INDEX: TFloatField
      FieldName = 'FRAGMENTATION_INDEX'
    end
    object qFragmentationsFREE_CHUNKS: TFloatField
      FieldName = 'FREE_CHUNKS'
    end
    object qFragmentationsLARGEST_CHUNK: TFloatField
      FieldName = 'LARGEST_CHUNK'
    end
  end
  object dsFragmentations: TDataSource
    DataSet = qFragmentations
    Left = 328
    Top = 400
  end
  object qTablespaceObject: TOraQuery
    SQL.Strings = (
      '/* Formatted on 2007/12/23 16:47 (Formatter Plus v4.8.5) */'
      'SELECT   /*+ RULE */'
      
        '         s_name tablespace_name, ROUND (NVL (table_space, 0), 2)' +
        ' table_mb,'
      '         ROUND (NVL (index_space, 0), 2) index_mb,'
      '         ROUND (NVL (cluster_space, 0), 2) cluster_mb,'
      '         ROUND (NVL (rollback_space, 0), 2) rollback_mb,'
      '         ROUND (NVL (lob_space, 0), 2) lob_mb'
      '    FROM (SELECT NAME s_name'
      '            FROM SYS.ts$'
      '           WHERE online$ <> 3),'
      '         (SELECT   tablespace_name t_name,'
      '                   (    SUM (DECODE (segment_type,'
      '                                     '#39'TABLE'#39', NVL (BYTES, 0),'
      '                                     0'
      '                                    ))'
      '                      / 1024'
      '                      / 1024'
      '                    +   SUM (DECODE (segment_type,'
      
        '                                     '#39'TABLE PARTITION'#39', NVL (BYT' +
        'ES, 0),'
      '                                     0'
      '                                    )'
      '                            )'
      '                      / 1024'
      '                      / 1024'
      '                    +   SUM (DECODE (segment_type,'
      
        '                                     '#39'TABLE SUBPARTITION'#39', NVL (' +
        'BYTES, 0),'
      '                                     0'
      '                                    )'
      '                            )'
      '                      / 1024'
      '                      / 1024'
      '                    +   SUM (DECODE (segment_type,'
      
        '                                     '#39'NESTED TABLE'#39', NVL (BYTES,' +
        ' 0),'
      '                                     0'
      '                                    )'
      '                            )'
      '                      / 1024'
      '                      / 1024'
      '                   ) table_space,'
      
        '                       SUM (DECODE (segment_type, '#39'INDEX'#39', NVL (' +
        'BYTES, 0), 0)'
      '                           )'
      '                     / 1024'
      '                     / 1024'
      '                   +   SUM (DECODE (segment_type,'
      
        '                                    '#39'INDEX PARTITION'#39', NVL (BYTE' +
        'S, 0),'
      '                                    0'
      '                                   )'
      '                           )'
      '                     / 1024'
      '                     / 1024'
      '                   +   SUM (DECODE (segment_type,'
      
        '                                    '#39'INDEX SUBPARTITION'#39', NVL (B' +
        'YTES, 0),'
      '                                    0'
      '                                   )'
      '                           )'
      '                     / 1024'
      '                     / 1024 index_space,'
      
        '                     SUM (DECODE (segment_type, '#39'CLUSTER'#39', NVL (' +
        'BYTES, 0), 0)'
      '                         )'
      '                   / 1024'
      '                   / 1024 cluster_space,'
      '                       SUM (DECODE (segment_type,'
      '                                    '#39'ROLLBACK'#39', NVL (BYTES, 0),'
      '                                    0'
      '                                   )'
      '                           )'
      '                     / 1024'
      '                     / 1024'
      '                   +   SUM (DECODE (segment_type,'
      
        '                                    '#39'TYPE2 UNDO'#39', NVL (BYTES, 0)' +
        ','
      '                                    0'
      '                                   )'
      '                           )'
      '                     / 1024'
      '                     / 1024 rollback_space,'
      '                       SUM (DECODE (segment_type,'
      '                                    '#39'LOBINDEX'#39', NVL (BYTES, 0),'
      '                                    0'
      '                                   )'
      '                           )'
      '                     / 1024'
      '                     / 1024'
      '                   +   SUM (DECODE (segment_type,'
      
        '                                    '#39'LOBSEGMENT'#39', NVL (BYTES, 0)' +
        ','
      '                                    0'
      '                                   )'
      '                           )'
      '                     / 1024'
      '                     / 1024 lob_space'
      '              FROM SYS.dba_segments'
      '             WHERE segment_type IN'
      '                      ('#39'TABLE'#39','
      '                       '#39'TABLE PARTITION'#39','
      '                       '#39'TABLE SUBPARTITION'#39','
      '                       '#39'INDEX'#39','
      '                       '#39'INDEX PARTITION'#39','
      '                       '#39'INDEX SUBPARTITION'#39','
      '                       '#39'ROLLBACK'#39','
      '                       '#39'TYPE2 UNDO'#39','
      '                       '#39'CLUSTER'#39','
      '                       '#39'LOBINDEX'#39','
      '                       '#39'LOBSEGMENT'#39
      '                      )'
      '          GROUP BY tablespace_name)'
      '   WHERE s_name = t_name(+)'
      'ORDER BY 1')
    Left = 362
    Top = 435
    object qTablespaceObjectTABLESPACE_NAME: TStringField
      FieldName = 'TABLESPACE_NAME'
      Required = True
      Size = 30
    end
    object qTablespaceObjectTABLE_MB: TFloatField
      FieldName = 'TABLE_MB'
    end
    object qTablespaceObjectINDEX_MB: TFloatField
      FieldName = 'INDEX_MB'
    end
    object qTablespaceObjectCLUSTER_MB: TFloatField
      FieldName = 'CLUSTER_MB'
    end
    object qTablespaceObjectROLLBACK_MB: TFloatField
      FieldName = 'ROLLBACK_MB'
    end
    object qTablespaceObjectLOB_MB: TFloatField
      FieldName = 'LOB_MB'
    end
  end
  object dsTablespaceObject: TDataSource
    DataSet = qTablespaceObject
    Left = 328
    Top = 432
  end
end
