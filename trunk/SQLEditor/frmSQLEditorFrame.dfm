object SQLEditorFrameFrm: TSQLEditorFrameFrm
  Left = 286
  Top = 123
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'SQLEditorFrameFrm'
  ClientHeight = 438
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 0
    Top = 208
    Width = 662
    Height = 230
    ActivePage = tsDBMSOutput
    Align = alBottom
    Images = dmGenel.ilSQLEditor
    TabOrder = 0
    ClientRectBottom = 230
    ClientRectRight = 662
    ClientRectTop = 25
    object tsResult: TcxTabSheet
      Caption = 'Result'
      ImageIndex = 40
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 662
        Height = 205
        Align = alClient
        DataSource = dsSQL
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tsExplainPlan: TcxTabSheet
      Caption = 'Explain Plan'
      ImageIndex = 25
      object treeListExplain: TcxDBTreeList
        Left = 0
        Top = 0
        Width = 662
        Height = 205
        Align = alClient
        Bands = <
          item
          end>
        BufferedPaint = False
        DataController.DataSource = dsPlanTable
        DataController.ParentField = 'PARENT_ID'
        DataController.KeyField = 'ID'
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
    object tsDBMSOutput: TcxTabSheet
      Caption = 'DBMS Output'
      ImageIndex = 24
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
        TabOrder = 0
        Height = 179
        Width = 662
      end
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 662
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Query History'
      ImageIndex = 33
      object GridIndex: TcxGrid
        Left = 0
        Top = 0
        Width = 662
        Height = 127
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridIndexDBTableView1: TcxGridDBTableView
          OnDblClick = GridIndexDBTableView1DblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsHistory
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnMoving = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object GridIndexDBTableView1HISTORY_ID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'HISTORY_ID'
            SortIndex = 0
            SortOrder = soDescending
            Width = 46
          end
          object GridIndexDBTableView1CONNECTION: TcxGridDBColumn
            Caption = 'Connection'
            DataBinding.FieldName = 'CONNECTION'
            Width = 125
          end
          object GridIndexDBTableView1STATUS: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'STATUS'
            Width = 78
          end
          object GridIndexDBTableView1START_TIME: TcxGridDBColumn
            Caption = 'Start Time'
            DataBinding.FieldName = 'START_TIME'
            Width = 108
          end
          object GridIndexDBTableView1STOP_TIME: TcxGridDBColumn
            Caption = 'Stop Time'
            DataBinding.FieldName = 'STOP_TIME'
            Width = 110
          end
          object GridIndexDBTableView1EXECUTION_TIME: TcxGridDBColumn
            Caption = 'Execution Time'
            DataBinding.FieldName = 'EXECUTION_TIME'
            Width = 100
          end
          object GridIndexDBTableView1ROWS_PROCESSED: TcxGridDBColumn
            Caption = 'Rows Processed'
            DataBinding.FieldName = 'ROWS_PROCESSED'
            Width = 103
          end
          object GridIndexDBTableView1SQL: TcxGridDBColumn
            DataBinding.FieldName = 'SQL'
          end
          object GridIndexDBTableView1SQL_RESULT: TcxGridDBColumn
            Caption = 'Result'
            DataBinding.FieldName = 'SQL_RESULT'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = GridIndexDBTableView1
        end
      end
      object redtSQLResult: TRichEdit
        Left = 0
        Top = 135
        Width = 662
        Height = 70
        Align = alBottom
        Font.Charset = TURKISH_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
        OnMouseDown = SQLEditorMouseDown
      end
      object cxSplitter2: TcxSplitter
        Left = 0
        Top = 127
        Width = 662
        Height = 8
        HotZoneClassName = 'TcxXPTaskBarStyle'
        AlignSplitter = salBottom
        Control = redtSQLResult
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 200
    Width = 662
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    AlignSplitter = salBottom
    Control = pc
  end
  object SQLEditor: TRichEdit
    Left = 0
    Top = 0
    Width = 662
    Height = 200
    Align = alClient
    Font.Charset = TURKISH_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    WordWrap = False
    OnMouseDown = SQLEditorMouseDown
  end
  object sqlSession: TOraSession
    ConnectPrompt = False
    Username = 'aytis'
    Password = 'aytis'
    Server = 'AYTIS_AYTIS'
    AutoCommit = False
    Left = 64
    Top = 32
  end
  object tHistory: TVirtualTable
    IndexFieldNames = 'HISTORY_ID'
    Left = 64
    Top = 72
    Data = {01000000000000000000}
    object tHistoryHISTORY_ID: TIntegerField
      FieldName = 'HISTORY_ID'
    end
    object tHistoryCONNECTION: TStringField
      FieldName = 'CONNECTION'
      Size = 100
    end
    object tHistoryStatus: TIntegerField
      FieldName = 'STATUS'
    end
    object tHistorySTART_TIME: TTimeField
      FieldName = 'START_TIME'
    end
    object tHistorySTOP_TIME: TTimeField
      FieldName = 'STOP_TIME'
    end
    object tHistoryEXECUTION_TIME: TStringField
      FieldName = 'EXECUTION_TIME'
      Size = 30
    end
    object tHistoryROWS_PROCESSED: TFloatField
      FieldName = 'ROWS_PROCESSED'
    end
    object tHistorySQL: TMemoField
      FieldName = 'SQL'
      BlobType = ftMemo
    end
    object tHistorySQL_RESULT: TMemoField
      FieldName = 'SQL_RESULT'
      BlobType = ftMemo
    end
  end
  object dsHistory: TDataSource
    DataSet = tHistory
    OnStateChange = dsHistoryStateChange
    OnDataChange = dsHistoryDataChange
    Left = 96
    Top = 72
  end
  object dsSQL: TDataSource
    OnStateChange = dsSQLStateChange
    OnDataChange = dsSQLDataChange
    Left = 96
    Top = 32
  end
  object dsPlanTable: TDataSource
    DataSet = vtPlanTable
    OnStateChange = dsSQLStateChange
    OnDataChange = dsSQLDataChange
    Left = 64
    Top = 112
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
  object tDbMS_output: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = tDbMS_outputTimer
    Left = 200
    Top = 280
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
    Left = 144
    Top = 283
    DockControlHeights = (
      0
      0
      0
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
  end
  object sdDBMS: TSaveDialog
    Filter = 'Text Files|*.txt|All Files|*.*'
    Left = 72
    Top = 280
  end
  object vtPlanTable: TVirtualTable
    IndexFieldNames = 'ID;PARENT_ID'
    Left = 96
    Top = 112
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
end
