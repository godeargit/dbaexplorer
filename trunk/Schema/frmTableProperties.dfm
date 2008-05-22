object TablePropertiesFrm: TTablePropertiesFrm
  Left = 267
  Top = 70
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'TablePropertiesFrm'
  ClientHeight = 594
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object pcTableProperties: TcxPageControl
    Left = 0
    Top = 26
    Width = 693
    Height = 568
    ActivePage = tsTableDetails
    Align = alClient
    LookAndFeel.Kind = lfUltraFlat
    Rotate = True
    TabOrder = 0
    TabPosition = tpLeft
    TabSlants.Kind = skCutCorner
    OnPageChanging = pcTablePropertiesPageChanging
    ClientRectBottom = 568
    ClientRectLeft = 78
    ClientRectRight = 693
    ClientRectTop = 0
    object tsTableDetails: TcxTabSheet
      Caption = 'Properties'
      ImageIndex = 0
      object cxGroupBox8: TcxGroupBox
        Left = 0
        Top = 26
        Align = alClient
        ParentColor = False
        Style.BorderStyle = ebsUltraFlat
        Style.Shadow = False
        TabOrder = 0
        Transparent = True
        Height = 542
        Width = 615
        object Label1: TcxLabel
          Left = 267
          Top = 19
          Caption = 'Owner :'
          Transparent = True
        end
        object cxGroupBox1: TcxGroupBox
          Left = 10
          Top = 109
          Caption = 'Storage'
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.Shadow = False
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfUltraFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfUltraFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Transparent = True
          Height = 142
          Width = 480
          object Label4: TcxLabel
            Left = 9
            Top = 18
            Caption = 'Tablespace :'
            Transparent = True
          end
          object Label5: TcxLabel
            Left = 30
            Top = 41
            Caption = '%Free :'
            Transparent = True
          end
          object Label6: TcxLabel
            Left = 28
            Top = 65
            Caption = '%Used :'
            Transparent = True
          end
          object Label7: TcxLabel
            Left = 24
            Top = 89
            Caption = 'Ini Trans:'
            Transparent = True
          end
          object Label8: TcxLabel
            Left = 249
            Top = 21
            Caption = 'Initial Extent :'
            Transparent = True
          end
          object Label9: TcxLabel
            Left = 252
            Top = 45
            Caption = 'Next Extent :'
            Transparent = True
          end
          object Label10: TcxLabel
            Left = 257
            Top = 69
            Caption = '%Increase :'
            Transparent = True
          end
          object Label11: TcxLabel
            Left = 254
            Top = 93
            Caption = 'Min Extents :'
            Transparent = True
          end
          object Label12: TcxLabel
            Left = 16
            Top = 113
            Caption = 'Max Trans:'
            Transparent = True
          end
          object Label13: TcxLabel
            Left = 250
            Top = 117
            Caption = 'Max Extents :'
            Transparent = True
          end
          object cxDBTextEdit5: TcxDBTextEdit
            Left = 80
            Top = 40
            DataBinding.DataField = 'PCT_FREE'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 0
            Width = 84
          end
          object cxDBTextEdit6: TcxDBTextEdit
            Left = 80
            Top = 64
            DataBinding.DataField = 'PCT_USED'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 1
            Width = 84
          end
          object cxDBTextEdit7: TcxDBTextEdit
            Left = 80
            Top = 88
            DataBinding.DataField = 'INI_TRANS'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 2
            Width = 84
          end
          object cxDBTextEdit8: TcxDBTextEdit
            Left = 330
            Top = 17
            DataBinding.DataField = 'INITIAL_EXTENT'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 3
            Width = 74
          end
          object cxDBTextEdit9: TcxDBTextEdit
            Left = 330
            Top = 41
            DataBinding.DataField = 'NEXT_EXTENT'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 4
            Width = 74
          end
          object cxDBTextEdit10: TcxDBTextEdit
            Left = 330
            Top = 65
            DataBinding.DataField = 'PCT_INCREASE'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 5
            Width = 74
          end
          object cxDBTextEdit11: TcxDBTextEdit
            Left = 330
            Top = 89
            DataBinding.DataField = 'MIN_EXTENTS'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 6
            Width = 74
          end
          object cxDBTextEdit12: TcxDBTextEdit
            Left = 80
            Top = 113
            DataBinding.DataField = 'MAX_TRANS'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 7
            Width = 84
          end
          object cxDBTextEdit13: TcxDBTextEdit
            Left = 406
            Top = 17
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 8
            Width = 53
          end
          object cxDBTextEdit14: TcxDBTextEdit
            Left = 406
            Top = 41
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 9
            Width = 53
          end
          object cxDBTextEdit15: TcxDBTextEdit
            Left = 330
            Top = 113
            DataBinding.DataField = 'MAX_EXTENTS'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 10
            Width = 74
          end
          object cxDBCheckBox1: TcxDBCheckBox
            Left = 407
            Top = 112
            Caption = 'Unlimited'
            DataBinding.DataSource = dsTableDetail
            TabOrder = 11
            Transparent = True
            Width = 68
          end
          object cxDBTextEdit3: TcxDBTextEdit
            Left = 80
            Top = 16
            DataBinding.DataField = 'TABLESPACE_NAME'
            DataBinding.DataSource = dsTableDetail
            TabOrder = 12
            Width = 121
          end
        end
        object cxGroupBox2: TcxGroupBox
          Left = 10
          Top = 257
          Caption = 'Cluster'
          Style.BorderStyle = ebsUltraFlat
          Style.Shadow = False
          TabOrder = 1
          Transparent = True
          Height = 47
          Width = 480
          object Label14: TcxLabel
            Left = 17
            Top = 17
            Caption = 'Name :'
            Transparent = True
          end
          object Label15: TcxLabel
            Left = 244
            Top = 18
            Caption = 'Columns :'
            Transparent = True
          end
          object cxDBTextEdit16: TcxDBTextEdit
            Left = 77
            Top = 17
            DataBinding.DataField = 'CLUSTER_NAME'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 0
            Width = 140
          end
          object cxDBTextEdit17: TcxDBTextEdit
            Left = 300
            Top = 17
            DataBinding.DataField = 'CLUSTER_OWNER'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 1
            Width = 171
          end
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 318
          Top = 17
          DataBinding.DataField = 'OWNER'
          DataBinding.DataSource = dsTableDetail
          Style.BorderColor = clNavy
          Style.Shadow = False
          TabOrder = 2
          Width = 152
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 58
          Top = 17
          DataBinding.DataField = 'TABLE_NAME'
          DataBinding.DataSource = dsTableDetail
          Style.BorderColor = clNavy
          Style.Shadow = False
          TabOrder = 3
          Width = 197
        end
        object cxGroupBox4: TcxGroupBox
          Left = 10
          Top = 475
          Caption = 'Analize'
          Style.BorderStyle = ebsUltraFlat
          Style.Shadow = False
          TabOrder = 4
          Transparent = True
          Height = 42
          Width = 479
          object Label16: TcxLabel
            Left = 9
            Top = 16
            Caption = 'Last Analyzed :'
            Transparent = True
          end
          object cxDBTextEdit18: TcxDBTextEdit
            Left = 93
            Top = 14
            DataBinding.DataField = 'LAST_ANALYZED'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 0
            Width = 148
          end
        end
        object cxGroupBox6: TcxGroupBox
          Left = 10
          Top = 362
          Caption = 'Parallel Query Option'
          Style.BorderStyle = ebsUltraFlat
          Style.Shadow = False
          TabOrder = 5
          Transparent = True
          Height = 43
          Width = 480
          object Label19: TcxLabel
            Left = 10
            Top = 17
            Caption = 'Degree : '
            Transparent = True
          end
          object Label20: TcxLabel
            Left = 240
            Top = 17
            Caption = 'Instances :'
            Transparent = True
          end
          object cxDBTextEdit21: TcxDBTextEdit
            Left = 77
            Top = 16
            DataBinding.DataField = 'DEGREE'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 0
            Width = 140
          end
          object cxDBTextEdit22: TcxDBTextEdit
            Left = 300
            Top = 16
            DataBinding.DataField = 'INSTANCES'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 1
            Width = 171
          end
        end
        object cxGroupBox3: TcxGroupBox
          Left = 10
          Top = 311
          Caption = 'Free List'
          Style.BorderStyle = ebsUltraFlat
          Style.Shadow = False
          TabOrder = 6
          Transparent = True
          Height = 47
          Width = 480
          object Label17: TcxLabel
            Left = 9
            Top = 19
            Caption = 'Free List :'
            Transparent = True
          end
          object Label21: TcxLabel
            Left = 250
            Top = 17
            Caption = 'Groups :'
            Transparent = True
          end
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 77
            Top = 17
            DataBinding.DataField = 'FREELISTS'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.BorderStyle = ebsUltraFlat
            Style.Shadow = False
            TabOrder = 0
            Width = 140
          end
          object cxDBTextEdit19: TcxDBTextEdit
            Left = 300
            Top = 17
            DataBinding.DataField = 'FREELIST_GROUPS'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 1
            Width = 171
          end
        end
        object cxGroupBox5: TcxGroupBox
          Left = 10
          Top = 408
          Style.BorderStyle = ebsUltraFlat
          Style.Shadow = False
          TabOrder = 7
          Transparent = True
          Height = 64
          Width = 479
          object Label18: TcxLabel
            Left = 7
            Top = 13
            Caption = 'Logging :'
            Transparent = True
          end
          object Label42: TcxLabel
            Left = 234
            Top = 13
            Caption = 'Buffer Pool :'
            Transparent = True
          end
          object cxDBTextEdit20: TcxDBTextEdit
            Left = 77
            Top = 11
            DataBinding.DataField = 'LOGGING'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 0
            Width = 140
          end
          object cxDBTextEdit23: TcxDBTextEdit
            Left = 300
            Top = 11
            DataBinding.DataField = 'BUFFER_POOL'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 1
            Width = 171
          end
          object cxDBCheckBox2: TcxDBCheckBox
            Left = 5
            Top = 38
            Caption = 'Monitoring :'
            DataBinding.DataField = 'MONITORING'
            DataBinding.DataSource = dsTableDetail
            Properties.Alignment = taRightJustify
            Properties.ValueChecked = 'YES'
            Properties.ValueUnchecked = 'NO'
            TabOrder = 2
            Transparent = True
            Width = 79
          end
          object cxDBCheckBox3: TcxDBCheckBox
            Left = 128
            Top = 40
            Caption = 'Cache :'
            DataBinding.DataField = 'CACHE'
            DataBinding.DataSource = dsTableDetail
            Properties.Alignment = taRightJustify
            Properties.ValueChecked = '    Y'
            Properties.ValueUnchecked = '    N'
            TabOrder = 3
            Transparent = True
            Width = 79
          end
          object cxDBCheckBox4: TcxDBCheckBox
            Left = 224
            Top = 40
            Caption = 'Enable Row Movement :'
            DataBinding.DataField = 'ROW_MOVEMENT'
            DataBinding.DataSource = dsTableDetail
            Properties.Alignment = taRightJustify
            Properties.ValueChecked = 'ENABLED'
            Properties.ValueUnchecked = 'DISABLE'
            TabOrder = 4
            Transparent = True
            Width = 153
          end
        end
        object cxLabel1: TcxLabel
          Left = 11
          Top = 18
          Caption = 'Name :'
          Style.BorderStyle = ebsNone
          Style.Shadow = False
          Style.TextColor = clWindowText
          Style.TextStyle = []
          Transparent = True
        end
        object cxGroupBox9: TcxGroupBox
          Left = 10
          Top = 52
          Caption = 'Size'
          Style.BorderStyle = ebsUltraFlat
          Style.Shadow = False
          TabOrder = 9
          Transparent = True
          Height = 47
          Width = 480
          object Label2: TcxLabel
            Left = 17
            Top = 17
            Caption = 'Size :'
            Transparent = True
          end
          object Label45: TcxLabel
            Left = 122
            Top = 18
            Caption = 'Row Count :'
            Transparent = True
          end
          object Label46: TcxLabel
            Left = 274
            Top = 18
            Caption = 'Avg. Row Length :'
            Transparent = True
          end
          object cxDBTextEdit24: TcxDBTextEdit
            Left = 48
            Top = 17
            DataBinding.DataField = 'SAMPLE_SIZE'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 0
            Width = 60
          end
          object cxDBTextEdit25: TcxDBTextEdit
            Left = 185
            Top = 17
            DataBinding.DataField = 'NUM_ROWS'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 1
            Width = 72
          end
          object cxDBTextEdit26: TcxDBTextEdit
            Left = 369
            Top = 17
            DataBinding.DataField = 'AVG_ROW_LEN'
            DataBinding.DataSource = dsTableDetail
            Style.BorderColor = clNavy
            Style.Shadow = False
            TabOrder = 2
            Width = 72
          end
        end
      end
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
    object tsTableColumns: TcxTabSheet
      Caption = 'Columns'
      ImageIndex = 0
      object gridColumn: TcxGrid
        Left = 0
        Top = 27
        Width = 615
        Height = 473
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object gridColumnDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCanSelectRecord = gridColumnDBTableView1CanSelectRecord
          DataController.DataSource = dsTableColumns
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.GroupByBox = False
          object gridColumnDBTableView1COLUMN_ID: TcxGridDBColumn
            Caption = 'Column ID'
            DataBinding.FieldName = 'COLUMN_ID'
            Width = 58
          end
          object gridColumnDBTableView1COLUMN_NAME: TcxGridDBColumn
            Caption = 'Column Name'
            DataBinding.FieldName = 'COLUMN_NAME'
            Width = 140
          end
          object gridColumnDBTableView1DATA_TYPE: TcxGridDBColumn
            Caption = 'Data Type'
            DataBinding.FieldName = 'DATA_TYPE'
            Width = 120
          end
          object gridColumnDBTableView1DATA_LENGTH: TcxGridDBColumn
            Caption = 'Length'
            DataBinding.FieldName = 'DATA_LENGTH'
            Width = 54
          end
          object gridColumnDBTableView1DATA_PRECISION: TcxGridDBColumn
            Caption = 'Precision'
            DataBinding.FieldName = 'DATA_PRECISION'
            Width = 56
          end
          object gridColumnDBTableView1DATA_SCALE: TcxGridDBColumn
            Caption = 'Scale'
            DataBinding.FieldName = 'DATA_SCALE'
            Width = 59
          end
          object gridColumnDBTableView1NULLABLE: TcxGridDBColumn
            Caption = 'Nullable'
            DataBinding.FieldName = 'NULLABLE'
            Width = 47
          end
          object gridColumnDBTableView1DATA_DEFAULT: TcxGridDBColumn
            Caption = 'Default'
            DataBinding.FieldName = 'DATA_DEFAULT'
            Width = 126
          end
          object gridColumnDBTableView1DATA_TYPE_MOD: TcxGridDBColumn
            Caption = 'Type Mod'
            DataBinding.FieldName = 'DATA_TYPE_MOD'
            Width = 62
          end
          object gridColumnDBTableView1DATA_TYPE_OWNER: TcxGridDBColumn
            Caption = 'Type Owner'
            DataBinding.FieldName = 'DATA_TYPE_OWNER'
            Width = 77
          end
        end
        object gridColumnLevel1: TcxGridLevel
          GridView = gridColumnDBTableView1
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 615
        Height = 1
        AutoSize = True
        Caption = 'ToolBar1'
        EdgeInner = esNone
        Flat = True
        Images = dmGenel.imList
        TabOrder = 1
        object ToolButton4: TToolButton
          Left = 0
          Top = 0
          Width = 10
          Caption = 'ToolButton4'
          ImageIndex = 5
          Style = tbsSeparator
        end
      end
      object cxSplitter3: TcxSplitter
        Left = 0
        Top = 500
        Width = 615
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = editColumnComment
      end
      object editColumnComment: TcxRichEdit
        Left = 0
        Top = 508
        Align = alBottom
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Style.BorderStyle = ebsUltraFlat
        Style.Shadow = False
        TabOrder = 3
        Height = 60
        Width = 615
      end
      object dxBarDockControl2: TdxBarDockControl
        Left = 0
        Top = 1
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
    object tsTableData: TcxTabSheet
      Caption = 'Data'
      ImageIndex = 4
      object GridData: TcxGrid
        Left = 0
        Top = 26
        Width = 615
        Height = 522
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object gridDataView: TcxGridDBTableView
          PopupMenu = popData
          NavigatorButtons.ConfirmDelete = False
          FilterBox.CustomizeDialog = False
          DataController.DataModeController.GridMode = True
          DataController.DataSource = dsTableData
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Appending = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          OnColumnHeaderClick = gridDataViewColumnHeaderClick
        end
        object cxGridLevel4: TcxGridLevel
          GridView = gridDataView
        end
      end
      object dxBarDockControl3: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
      object sbData: TdxStatusBar
        Left = 0
        Top = 548
        Width = 615
        Height = 20
        Panels = <
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
    end
    object tsTableIndexes: TcxTabSheet
      Caption = 'Indexes'
      ImageIndex = 1
      OnShow = tsTableIndexesShow
      object GridIndex: TcxGrid
        Left = 0
        Top = 26
        Width = 615
        Height = 332
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object GridIndexDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCanSelectRecord = GridIndexDBTableViewCanSelectRecord
          DataController.DataSource = dsTableIndexes
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object GridIndexDBTableViewColumn1: TcxGridDBColumn
            Caption = 'Index Name'
            DataBinding.FieldName = 'INDEX_NAME'
            MinWidth = 40
            Width = 109
          end
          object GridIndexDBTableViewColumn2: TcxGridDBColumn
            Caption = 'Column Name'
            DataBinding.FieldName = 'COLUMN_NAME'
            MinWidth = 40
            Width = 104
          end
          object GridIndexDBTableViewColumn3: TcxGridDBColumn
            Caption = 'Column Position'
            DataBinding.FieldName = 'COLUMN_POSITION'
            MinWidth = 40
            Width = 84
          end
          object GridIndexDBTableViewColumn4: TcxGridDBColumn
            Caption = 'Index Owner'
            DataBinding.FieldName = 'INDEX_OWNER'
            MinWidth = 40
            Width = 119
          end
          object GridIndexDBTableViewColumn5: TcxGridDBColumn
            Caption = 'Order'
            DataBinding.FieldName = 'DESCEND'
            MinWidth = 40
            Width = 110
          end
          object GridIndexDBTableViewColumn6: TcxGridDBColumn
            Caption = 'Is Uniqe'
            DataBinding.FieldName = 'ISUNIQE'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = GridIndexDBTableView
        end
      end
      object cxSplitter1: TcxSplitter
        Left = 0
        Top = 358
        Width = 615
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = pcTableIndex
      end
      object pcTableIndex: TcxPageControl
        Left = 0
        Top = 366
        Width = 615
        Height = 202
        ActivePage = cxTabSheet1
        Align = alBottom
        Style = 10
        TabOrder = 2
        ClientRectBottom = 202
        ClientRectRight = 615
        ClientRectTop = 19
        object cxTabSheet1: TcxTabSheet
          Caption = 'Index'
          ImageIndex = 0
          object Label3: TcxLabel
            Left = 8
            Top = 14
            Caption = 'Index Name :'
            Transparent = True
          end
          object Label43: TcxLabel
            Left = 11
            Top = 35
            Caption = 'Index Type :'
            Transparent = True
          end
          object Label37: TcxLabel
            Left = 384
            Top = 25
            Caption = 'columns'
            Transparent = True
          end
          object Label44: TcxLabel
            Left = 29
            Top = 58
            Caption = 'Logging :'
            Transparent = True
          end
          object lblPartition: TcxLabel
            Left = 15
            Top = 145
            Caption = 'Partition Clause :'
            Transparent = True
            Visible = False
          end
          object cgroupParalel: TcxGroupBox
            Left = 266
            Top = 81
            Caption = 'Paralel'
            TabOrder = 0
            Transparent = True
            Height = 53
            Width = 183
            object Label22: TcxLabel
              Left = 117
              Top = 12
              Caption = 'Instances'
              Transparent = True
            end
            object Label23: TcxLabel
              Left = 71
              Top = 12
              Caption = 'Degree'
              Transparent = True
            end
            object cbParalel: TcxCheckBox
              Left = 12
              Top = 26
              Caption = 'Paralel'
              Properties.ReadOnly = True
              TabOrder = 0
              Transparent = True
              Width = 56
            end
            object edtParalelDegree: TcxMaskEdit
              Left = 69
              Top = 26
              Properties.MaskKind = emkRegExpr
              Properties.EditMask = '\d+'
              Properties.MaxLength = 0
              Properties.ReadOnly = True
              TabOrder = 1
              Text = '0'
              Width = 41
            end
            object edtParalelInstances: TcxMaskEdit
              Left = 117
              Top = 26
              Properties.MaskKind = emkRegExpr
              Properties.EditMask = '\d+'
              Properties.MaxLength = 0
              Properties.ReadOnly = True
              TabOrder = 2
              Text = '0'
              Width = 41
            end
          end
          object edtIndexName: TcxTextEdit
            Left = 80
            Top = 11
            Properties.ReadOnly = True
            TabOrder = 1
            Text = 'edtIndexName'
            Width = 161
          end
          object edtIndexType: TcxTextEdit
            Left = 80
            Top = 32
            Properties.ReadOnly = True
            TabOrder = 2
            Text = 'edtIndexType'
            Width = 161
          end
          object rgroupIndexType: TcxRadioGroup
            Left = 12
            Top = 82
            Caption = 'Uniqueness'
            Properties.Columns = 3
            Properties.Items = <
              item
                Caption = 'Uniqe'
              end
              item
                Caption = 'Non-uniqe'
              end>
            Properties.ReadOnly = True
            ItemIndex = 1
            Style.Shadow = False
            TabOrder = 3
            Transparent = True
            Height = 53
            Width = 233
          end
          object rgroupKeyCompression: TcxRadioGroup
            Left = 264
            Top = 4
            Caption = 'Key Compression'
            Properties.Items = <
              item
                Caption = 'Compress'
              end
              item
                Caption = 'No Compress'
              end>
            Properties.ReadOnly = True
            ItemIndex = 1
            TabOrder = 4
            Transparent = True
            Height = 68
            Width = 185
          end
          object edtKeyCompressionColumns: TcxMaskEdit
            Left = 346
            Top = 22
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            TabOrder = 5
            Text = '0'
            Width = 35
          end
          object cbLogging: TcxImageComboBox
            Left = 79
            Top = 54
            EditValue = 'Default'
            Properties.Items = <
              item
                Description = 'Default'
                ImageIndex = 0
                Value = 'Default'
              end
              item
                Description = 'Logging'
                ImageIndex = 0
                Value = 'Logging'
              end
              item
                Description = 'No Logging'
                Value = 'No Logging'
              end>
            Properties.ReadOnly = True
            Style.Shadow = False
            TabOrder = 6
            Width = 77
          end
        end
        object cxTabSheet2: TcxTabSheet
          Caption = 'Physical Attributes'
          ImageIndex = 1
          object Label28: TcxLabel
            Left = 24
            Top = 9
            Caption = 'Percent Free :'
            Transparent = True
          end
          object Label33: TcxLabel
            Left = 22
            Top = 29
            Caption = 'Percent Used :'
            Transparent = True
          end
          object Label34: TcxLabel
            Left = 263
            Top = 9
            Caption = 'Initial Trans :'
            Transparent = True
          end
          object Label35: TcxLabel
            Left = 267
            Top = 29
            Caption = 'Max Trans :'
            Transparent = True
          end
          object Label36: TcxLabel
            Left = 27
            Top = 49
            Caption = 'Tablespacse :'
            Transparent = True
          end
          object cxGroupBox7: TcxGroupBox
            Left = 8
            Top = 69
            Caption = 'Storage Clause'
            TabOrder = 0
            Transparent = True
            Height = 111
            Width = 532
            object Label24: TcxLabel
              Left = 20
              Top = 19
              Caption = 'Initial Extend :'
              Transparent = True
            end
            object Label25: TcxLabel
              Left = 23
              Top = 40
              Caption = 'Next Extend :'
              Transparent = True
            end
            object Label26: TcxLabel
              Left = 257
              Top = 19
              Caption = 'Min Extents :'
              Transparent = True
            end
            object Label27: TcxLabel
              Left = 253
              Top = 41
              Caption = 'Max Extents :'
              Transparent = True
            end
            object Label29: TcxLabel
              Left = 23
              Top = 62
              Caption = 'Pct Increase :'
              Transparent = True
            end
            object Label30: TcxLabel
              Left = 272
              Top = 63
              Caption = 'Free List :'
              Transparent = True
            end
            object Label31: TcxLabel
              Left = 254
              Top = 86
              Caption = 'Free Groups :'
              Transparent = True
            end
            object Label32: TcxLabel
              Left = 30
              Top = 85
              Caption = 'Buffer Pool :'
              Transparent = True
            end
            object edtInitialExtend: TcxMaskEdit
              Left = 96
              Top = 16
              Properties.MaskKind = emkRegExpr
              Properties.EditMask = '\d+'
              Properties.MaxLength = 0
              Properties.ReadOnly = True
              TabOrder = 0
              Text = '0'
              Width = 90
            end
            object edtNextExtend: TcxMaskEdit
              Left = 96
              Top = 38
              Properties.MaskKind = emkRegExpr
              Properties.EditMask = '\d+'
              Properties.MaxLength = 0
              Properties.ReadOnly = True
              TabOrder = 1
              Text = '0'
              Width = 90
            end
            object edtMinExtents: TcxMaskEdit
              Left = 326
              Top = 16
              Properties.MaskKind = emkRegExpr
              Properties.EditMask = '\d+'
              Properties.MaxLength = 0
              Properties.ReadOnly = True
              TabOrder = 2
              Text = '0'
              Width = 90
            end
            object edtMaxExtents: TcxMaskEdit
              Left = 326
              Top = 38
              Properties.MaskKind = emkRegExpr
              Properties.EditMask = '\d+'
              Properties.MaxLength = 0
              Properties.ReadOnly = True
              TabOrder = 3
              Text = '0'
              Width = 90
            end
            object edtPctIncrease: TcxMaskEdit
              Left = 96
              Top = 60
              Properties.MaskKind = emkRegExpr
              Properties.EditMask = '\d+'
              Properties.MaxLength = 0
              Properties.ReadOnly = True
              TabOrder = 4
              Text = '0'
              Width = 90
            end
            object edtFreeList: TcxMaskEdit
              Left = 326
              Top = 60
              Properties.MaskKind = emkRegExpr
              Properties.EditMask = '\d+'
              Properties.MaxLength = 0
              Properties.ReadOnly = True
              TabOrder = 5
              Text = '0'
              Width = 90
            end
            object edtFreeGroup: TcxMaskEdit
              Left = 326
              Top = 82
              Properties.MaskKind = emkRegExpr
              Properties.EditMask = '\d+'
              Properties.MaxLength = 0
              Properties.ReadOnly = True
              TabOrder = 6
              Text = '0'
              Width = 90
            end
            object cbBufferPool: TcxImageComboBox
              Left = 96
              Top = 82
              EditValue = 'Default'
              Properties.Items = <
                item
                  Description = 'Default'
                  Value = 'Default'
                end
                item
                  Description = 'Recycle'
                  Value = 'Recycle'
                end
                item
                  Description = 'Keep'
                  Value = 'Keep'
                end>
              Properties.ReadOnly = True
              TabOrder = 7
              Width = 91
            end
          end
          object edtPercentFree: TcxMaskEdit
            Left = 100
            Top = 6
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            TabOrder = 1
            Text = '10'
            Width = 90
          end
          object edtPercentUsed: TcxMaskEdit
            Left = 100
            Top = 26
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            TabOrder = 2
            Text = '0'
            Width = 90
          end
          object edtInitialTrans: TcxMaskEdit
            Tag = 2
            Left = 334
            Top = 6
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            TabOrder = 3
            Text = '2'
            Width = 90
          end
          object edtMaxTrans: TcxMaskEdit
            Left = 334
            Top = 26
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            TabOrder = 4
            Text = '255'
            Width = 90
          end
          object lcTablespace: TcxLookupComboBox
            Left = 100
            Top = 46
            Properties.KeyFieldNames = 'TABLESPACE_NAME'
            Properties.ListColumns = <
              item
                FieldName = 'TABLESPACE_NAME'
              end>
            Properties.ListSource = dmGenel.dsTablespace
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            TabOrder = 5
            Width = 193
          end
        end
        object cxTabSheet3: TcxTabSheet
          Caption = 'DDL'
          ImageIndex = 2
          object redtIndexDDL: TcxRichEdit
            Left = 0
            Top = 0
            Align = alClient
            ParentFont = False
            Properties.ReadOnly = True
            Properties.ScrollBars = ssBoth
            Style.BorderStyle = ebsUltraFlat
            Style.Font.Charset = TURKISH_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Courier New'
            Style.Font.Style = []
            Style.Shadow = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 183
            Width = 615
          end
        end
      end
      object dxBarDockControl4: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
    object tsTableConstraints: TcxTabSheet
      Caption = 'Keys'
      ImageIndex = 2
      object pcTableKeys: TcxPageControl
        Left = 0
        Top = 379
        Width = 615
        Height = 189
        ActivePage = cxTabSheet11
        Align = alBottom
        Style = 10
        TabOrder = 0
        ClientRectBottom = 189
        ClientRectRight = 615
        ClientRectTop = 19
        object cxTabSheet11: TcxTabSheet
          Caption = 'Constraint'
          ImageIndex = 3
          object listViewKeys: TcxListView
            Left = 0
            Top = 0
            Width = 615
            Height = 170
            Align = alClient
            Columns = <
              item
                Caption = 'Columns'
                Width = 150
              end
              item
                Caption = 'Positions'
                Width = 60
              end>
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object cxTabSheet9: TcxTabSheet
          Caption = 'DDL'
          ImageIndex = 1
          object edtKeys: TcxRichEdit
            Left = 0
            Top = 0
            Align = alClient
            Properties.ReadOnly = True
            Properties.ScrollBars = ssBoth
            Style.BorderStyle = ebsUltraFlat
            Style.Shadow = False
            TabOrder = 0
            Height = 170
            Width = 615
          end
        end
      end
      object cxSplitter7: TcxSplitter
        Left = 0
        Top = 371
        Width = 615
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = pcTableKeys
      end
      object gridKey: TcxGrid
        Left = 0
        Top = 26
        Width = 615
        Height = 345
        Align = alClient
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        object gridKeyDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCanSelectRecord = gridKeyDBTableViewCanSelectRecord
          DataController.DataSource = dsConstraints
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.GroupByBox = False
          object gridKeyDBTableViewCONSTRAINT_NAME: TcxGridDBColumn
            Caption = 'Key Name'
            DataBinding.FieldName = 'CONSTRAINT_NAME'
            Width = 118
          end
          object gridKeyDBTableViewCONSTRAINT_TYPE: TcxGridDBColumn
            Caption = 'Key Type'
            DataBinding.FieldName = 'CONSTRAINT_TYPE'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                Description = 'Primary Key'
                ImageIndex = 0
                Value = 'P'
              end
              item
                Description = 'Unique Key'
                Value = 'U'
              end>
            Width = 80
          end
          object gridKeyDBTableViewDELETE_RULE: TcxGridDBColumn
            Caption = 'Delete Rule'
            DataBinding.FieldName = 'DELETE_RULE'
            Width = 92
          end
          object gridKeyDBTableViewSTATUS: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'STATUS'
            Width = 74
          end
          object gridKeyDBTableViewDEFERRABLE: TcxGridDBColumn
            Caption = 'Deferrable'
            DataBinding.FieldName = 'DEFERRABLE'
            Width = 110
          end
          object gridKeyDBTableViewDEFERRED: TcxGridDBColumn
            Caption = 'Deferred'
            DataBinding.FieldName = 'DEFERRED'
            Width = 74
          end
          object gridKeyDBTableViewVALIDATED: TcxGridDBColumn
            Caption = 'Validate'
            DataBinding.FieldName = 'VALIDATED'
          end
          object gridKeyDBTableViewColumn1: TcxGridDBColumn
            Caption = 'Index Ower'
            DataBinding.FieldName = 'INDEX_OWNER'
            Width = 120
          end
          object gridKeyDBTableViewColumn2: TcxGridDBColumn
            Caption = 'Index Name'
            DataBinding.FieldName = 'INDEX_NAME'
            Width = 121
          end
          object gridKeyDBTableViewColumn3: TcxGridDBColumn
            Caption = 'Last Change'
            DataBinding.FieldName = 'LAST_CHANGE'
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = gridKeyDBTableView
        end
      end
      object dxBarDockControl5: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
    object tsTableForeignKeys: TcxTabSheet
      Caption = 'Foreign Keys'
      ImageIndex = 13
      object GridForeignKey: TcxGrid
        Left = 0
        Top = 26
        Width = 615
        Height = 345
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridForeignKeyDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCanSelectRecord = GridForeignKeyDBTableViewCanSelectRecord
          DataController.DataSource = dsConstraints
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.GroupByBox = False
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'Foreign Key Name'
            DataBinding.FieldName = 'constraint_name'
            Width = 109
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'status'
            Width = 59
          end
          object cxGridDBColumn7: TcxGridDBColumn
            Caption = 'Delete Rule'
            DataBinding.FieldName = 'Delete_rule'
            Width = 98
          end
          object cxGridDBColumn8: TcxGridDBColumn
            Caption = 'Deferrable'
            DataBinding.FieldName = 'deferrable'
            Width = 84
          end
          object cxGridDBColumn9: TcxGridDBColumn
            Caption = 'Deferred'
            DataBinding.FieldName = 'deferred'
            Width = 81
          end
          object cxGridDBColumn10: TcxGridDBColumn
            Caption = 'Validated'
            DataBinding.FieldName = 'validated'
            Width = 72
          end
          object cxGridDBColumn11: TcxGridDBColumn
            Caption = 'Bad'
            DataBinding.FieldName = 'bad'
            Width = 59
          end
          object cxGridDBColumn12: TcxGridDBColumn
            DataBinding.FieldName = 'Rely'
            Width = 59
          end
        end
        object cxGridLevel10: TcxGridLevel
          GridView = GridForeignKeyDBTableView
        end
      end
      object cxSplitter6: TcxSplitter
        Left = 0
        Top = 371
        Width = 615
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = pcTableForeignKeys
      end
      object pcTableForeignKeys: TcxPageControl
        Left = 0
        Top = 379
        Width = 615
        Height = 189
        ActivePage = cxTabSheet4
        Align = alBottom
        Style = 10
        TabOrder = 2
        ClientRectBottom = 189
        ClientRectRight = 615
        ClientRectTop = 19
        object cxTabSheet4: TcxTabSheet
          Caption = 'Detail'
          ImageIndex = 0
          object cxGroupBox11: TcxGroupBox
            Left = 7
            Top = 8
            Caption = 'Constrained Columns (This Table)'
            TabOrder = 0
            Transparent = True
            Height = 153
            Width = 242
            object Label38: TcxLabel
              Left = 7
              Top = 18
              Caption = 'Schema :'
              Transparent = True
            end
            object Label39: TcxLabel
              Left = 17
              Top = 39
              Caption = 'Table :'
              Transparent = True
            end
            object edtForeignKeySchema: TcxTextEdit
              Left = 76
              Top = 15
              Properties.ReadOnly = True
              TabOrder = 0
              Width = 152
            end
            object edtForeignKeyTable: TcxTextEdit
              Left = 76
              Top = 36
              Properties.ReadOnly = True
              TabOrder = 1
              Width = 152
            end
            object lviewForeignKeys: TcxListView
              Left = 2
              Top = 64
              Width = 238
              Height = 87
              Align = alBottom
              Columns = <
                item
                  Caption = 'Column Name'
                  Width = 150
                end
                item
                  Caption = 'Position'
                  Width = 60
                end>
              TabOrder = 2
              ViewStyle = vsReport
            end
          end
          object cxGroupBox12: TcxGroupBox
            Left = 255
            Top = 8
            Caption = 'Referenced Columns'
            TabOrder = 1
            Transparent = True
            Height = 153
            Width = 266
            object Label40: TcxLabel
              Left = 7
              Top = 18
              Caption = 'Schema :'
              Transparent = True
            end
            object Label41: TcxLabel
              Left = 18
              Top = 39
              Caption = 'Table :'
              Transparent = True
            end
            object edtForeignKeyRSchema: TcxTextEdit
              Left = 76
              Top = 15
              Properties.ReadOnly = True
              TabOrder = 0
              Width = 152
            end
            object edtForeignKeyRTable: TcxTextEdit
              Left = 76
              Top = 36
              Properties.ReadOnly = True
              TabOrder = 1
              Width = 152
            end
            object lviewRForeignKeys: TcxListView
              Left = 2
              Top = 64
              Width = 262
              Height = 87
              Align = alBottom
              Columns = <
                item
                  Caption = 'Column Name'
                  Width = 150
                end
                item
                  Caption = 'Position'
                  Width = 60
                end>
              TabOrder = 2
              ViewStyle = vsReport
            end
          end
        end
        object cxTabSheet5: TcxTabSheet
          Caption = 'DDL'
          ImageIndex = 1
          object edtForeignKeyDLL: TcxRichEdit
            Left = 0
            Top = 0
            Align = alClient
            Properties.ReadOnly = True
            Properties.ScrollBars = ssBoth
            Style.BorderStyle = ebsUltraFlat
            Style.Shadow = False
            TabOrder = 0
            Height = 170
            Width = 615
          end
        end
      end
      object dxBarDockControl6: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
    object tsTableChecks: TcxTabSheet
      Caption = 'Check'
      ImageIndex = 14
      object pcTableCheck: TcxPageControl
        Left = 0
        Top = 379
        Width = 615
        Height = 189
        ActivePage = cxTabSheet7
        Align = alBottom
        Style = 10
        TabOrder = 0
        ClientRectBottom = 189
        ClientRectRight = 615
        ClientRectTop = 19
        object cxTabSheet7: TcxTabSheet
          Caption = 'Check Condition'
          ImageIndex = 3
          object edtChecksDetail: TcxRichEdit
            Left = 0
            Top = 0
            Align = alClient
            Properties.ReadOnly = True
            Properties.ScrollBars = ssBoth
            Style.BorderStyle = ebsUltraFlat
            Style.Shadow = False
            TabOrder = 0
            Height = 170
            Width = 615
          end
        end
        object cxTabSheet12: TcxTabSheet
          Caption = 'DDL'
          ImageIndex = 1
          object edtChecksDDL: TcxRichEdit
            Left = 0
            Top = 0
            Align = alClient
            Properties.ReadOnly = True
            Properties.ScrollBars = ssBoth
            Style.BorderStyle = ebsUltraFlat
            Style.Shadow = False
            TabOrder = 0
            Height = 170
            Width = 615
          end
        end
      end
      object cxSplitter9: TcxSplitter
        Left = 0
        Top = 371
        Width = 615
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = pcTableCheck
      end
      object gridCheck: TcxGrid
        Left = 0
        Top = 26
        Width = 615
        Height = 345
        Align = alClient
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        object gridCheckDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCanSelectRecord = gridCheckDBTableViewCanSelectRecord
          DataController.DataSource = dsConstraints
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.GroupByBox = False
          object cxGridDBColumn13: TcxGridDBColumn
            Caption = 'Check Name'
            DataBinding.FieldName = 'CONSTRAINT_NAME'
            Width = 118
          end
          object cxGridDBColumn15: TcxGridDBColumn
            Caption = 'Delete Rule'
            DataBinding.FieldName = 'DELETE_RULE'
            Width = 84
          end
          object cxGridDBColumn16: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'STATUS'
            Width = 68
          end
          object cxGridDBColumn17: TcxGridDBColumn
            Caption = 'Deferrable'
            DataBinding.FieldName = 'DEFERRABLE'
            Width = 103
          end
          object cxGridDBColumn18: TcxGridDBColumn
            Caption = 'Deferred'
            DataBinding.FieldName = 'DEFERRED'
            Width = 103
          end
          object cxGridDBColumn19: TcxGridDBColumn
            Caption = 'Validate'
            DataBinding.FieldName = 'VALIDATED'
          end
          object cxGridDBColumn22: TcxGridDBColumn
            Caption = 'Last Change'
            DataBinding.FieldName = 'LAST_CHANGE'
          end
        end
        object cxGridLevel11: TcxGridLevel
          GridView = gridCheckDBTableView
        end
      end
      object dxBarDockControl7: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
    object tsTableTrigers: TcxTabSheet
      Caption = 'Triggers'
      ImageIndex = 3
      object GridTrigers: TcxGrid
        Left = 0
        Top = 26
        Width = 615
        Height = 201
        Align = alTop
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridTrigersDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCanSelectRecord = GridTrigersDBTableView1CanSelectRecord
          DataController.DataSource = dsTrigger
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.GroupByBox = False
          object GridTrigersDBTableView1Column1: TcxGridDBColumn
            Caption = 'Trigger Name'
            DataBinding.FieldName = 'trigger_name'
            Width = 94
          end
          object GridTrigersDBTableView1Column2: TcxGridDBColumn
            Caption = 'Trigger Type'
            DataBinding.FieldName = 'trigger_type'
            Width = 105
          end
          object GridTrigersDBTableView1Column3: TcxGridDBColumn
            Caption = 'Triggering Event'
            DataBinding.FieldName = 'triggering_event'
            Width = 105
          end
          object GridTrigersDBTableView1Column4: TcxGridDBColumn
            Caption = 'When Clause'
            DataBinding.FieldName = 'when_clause'
            Width = 82
          end
          object GridTrigersDBTableView1Column5: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'status'
            Width = 81
          end
          object GridTrigersDBTableView1Column6: TcxGridDBColumn
            Caption = 'Owner'
            DataBinding.FieldName = 'owner'
            Width = 73
          end
          object GridTrigersDBTableView1Column7: TcxGridDBColumn
            Caption = 'Object ID'
            Width = 71
          end
          object GridTrigersDBTableView1Column8: TcxGridDBColumn
            DataBinding.FieldName = 'description'
            Visible = False
          end
          object GridTrigersDBTableView1Column9: TcxGridDBColumn
            DataBinding.FieldName = 'trigger_body'
            Visible = False
          end
          object GridTrigersDBTableView1Column10: TcxGridDBColumn
            Caption = 'Created'
            DataBinding.FieldName = 'CREATED'
            Width = 110
          end
          object GridTrigersDBTableView1Column11: TcxGridDBColumn
            Caption = 'Last DDL Time'
            DataBinding.FieldName = 'LAST_DDL_TIME'
            Width = 85
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = GridTrigersDBTableView1
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 0
        Top = 227
        Width = 615
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salTop
        Control = GridTrigers
      end
      object editTriggers: TcxRichEdit
        Left = 0
        Top = 235
        Align = alClient
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Style.BorderStyle = ebsUltraFlat
        Style.Shadow = False
        TabOrder = 2
        Height = 333
        Width = 615
      end
      object dxBarDockControl8: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
    object tsTableGrants: TcxTabSheet
      Caption = 'Grants'
      ImageIndex = 6
      object GridGrants: TcxGrid
        Left = 0
        Top = 26
        Width = 615
        Height = 542
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridGrantsDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsGrants
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object GridGrantsDBTableView1Column1: TcxGridDBColumn
            Caption = 'Grant To'
            DataBinding.FieldName = 'GRANTEE'
            Width = 98
          end
          object GridGrantsDBTableView1Column2: TcxGridDBColumn
            Caption = 'Privilege'
            DataBinding.FieldName = 'PRIVILEGE'
            Width = 130
          end
          object GridGrantsDBTableView1Column3: TcxGridDBColumn
            Caption = 'Grantable'
            DataBinding.FieldName = 'GRANTABLE'
            Width = 134
          end
          object GridGrantsDBTableView1Column4: TcxGridDBColumn
            Caption = 'Grantor'
            DataBinding.FieldName = 'GRANTOR'
            Width = 164
          end
        end
        object cxGridLevel5: TcxGridLevel
          GridView = GridGrantsDBTableView1
        end
      end
      object dxBarDockControl9: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
    object tsTableSynonyms: TcxTabSheet
      Caption = 'Synonyms'
      ImageIndex = 7
      object GridSynonyms: TcxGrid
        Left = 0
        Top = 26
        Width = 615
        Height = 542
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridSynonymsDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsSynonyms
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object GridSynonymsDBTableView1Column1: TcxGridDBColumn
            Caption = 'Owner'
            DataBinding.FieldName = 'OWNER'
            Width = 199
          end
          object GridSynonymsDBTableView1Column2: TcxGridDBColumn
            Caption = 'Synonym Name'
            DataBinding.FieldName = 'SYNONYM_NAME'
            Width = 327
          end
        end
        object cxGridLevel6: TcxGridLevel
          GridView = GridSynonymsDBTableView1
        end
      end
      object dxBarDockControl10: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
    object tsTablePartitions: TcxTabSheet
      Caption = 'Partions'
      ImageIndex = 8
      object GridPartitionedColumns: TcxGrid
        Left = 0
        Top = 26
        Width = 615
        Height = 200
        Align = alTop
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridPartitionedColumnsDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsPartitionColumns
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object GridPartitionedColumnsDBTableView1Column1: TcxGridDBColumn
            Caption = 'Column Name'
            DataBinding.FieldName = 'COLUMN_NAME'
            Width = 178
          end
          object GridPartitionedColumnsDBTableView1Column2: TcxGridDBColumn
            Caption = 'Position'
            DataBinding.FieldName = 'COLUMN_POSITION'
            Width = 95
          end
        end
        object GridPartitionedColumnsLevel1: TcxGridLevel
          GridView = GridPartitionedColumnsDBTableView1
        end
      end
      object GridPartitiones: TcxGrid
        Left = 0
        Top = 234
        Width = 615
        Height = 334
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        object GridPartitionesDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsPartitions
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
          object GridPartitionesDBTableView1Column1: TcxGridDBColumn
            Caption = 'Partition Name'
            DataBinding.FieldName = 'PARTITION_NAME'
            Width = 94
          end
          object GridPartitionesDBTableView1Column2: TcxGridDBColumn
            Caption = 'High Value'
            DataBinding.FieldName = 'HIGH_VALUE'
            Width = 80
          end
          object GridPartitionesDBTableView1Column3: TcxGridDBColumn
            Caption = 'Length'
            DataBinding.FieldName = 'HIGH_VALUE_LENGTH'
            Width = 54
          end
          object GridPartitionesDBTableView1Column4: TcxGridDBColumn
            Caption = 'Tablespace'
            DataBinding.FieldName = 'TABLESPACE_NAME'
            Width = 95
          end
          object GridPartitionesDBTableView1Column5: TcxGridDBColumn
            Caption = 'Rows'
            DataBinding.FieldName = 'NUM_ROWS'
            Width = 48
          end
          object GridPartitionesDBTableView1Column6: TcxGridDBColumn
            Caption = 'Blocks'
            DataBinding.FieldName = 'BLOCKS'
            Width = 73
          end
          object GridPartitionesDBTableView1Column7: TcxGridDBColumn
            Caption = 'Empty Blocks'
            DataBinding.FieldName = 'EMPTY_BLOCKS'
            Width = 91
          end
          object GridPartitionesDBTableView1Column8: TcxGridDBColumn
            Caption = 'Last Analyzed'
            DataBinding.FieldName = 'LAST_ANALYZED'
            Width = 114
          end
          object GridPartitionesDBTableView1Column9: TcxGridDBColumn
            Caption = 'Subpartition Count'
            DataBinding.FieldName = 'SUBPARTITION_COUNT'
            Width = 95
          end
          object GridPartitionesDBTableView1Column10: TcxGridDBColumn
            Caption = 'Compression'
            DataBinding.FieldName = 'COMPRESSION'
            Width = 70
          end
        end
        object GridPartitionesLevel1: TcxGridLevel
          GridView = GridPartitionesDBTableView1
        end
      end
      object cxSplitter4: TcxSplitter
        Left = 0
        Top = 226
        Width = 615
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salTop
        Control = GridPartitionedColumns
      end
      object dxBarDockControl11: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
    object tsTableSubpartitions: TcxTabSheet
      Caption = 'Subpartitions'
      ImageIndex = 9
      object GridSubPartitionedColumns: TcxGrid
        Left = 0
        Top = 26
        Width = 615
        Height = 200
        Align = alTop
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridSubPartitionedColumnsDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsSubPartitionColumns
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'Column Name'
            DataBinding.FieldName = 'COLUMN_NAME'
            Width = 178
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Position'
            DataBinding.FieldName = 'COLUMN_POSITION'
            Width = 95
          end
        end
        object cxGridLevel8: TcxGridLevel
          GridView = GridSubPartitionedColumnsDBTableView1
        end
      end
      object cxSplitter5: TcxSplitter
        Left = 0
        Top = 226
        Width = 615
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salTop
        Control = GridSubPartitionedColumns
      end
      object GridSubPartitiones: TcxGrid
        Left = 0
        Top = 234
        Width = 615
        Height = 334
        Align = alClient
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        object GridSubPartitionesDBTableView2: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsSubPartitions
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'Partition Name'
            DataBinding.FieldName = 'SUBPARTITION_NAME'
            Width = 94
          end
          object GridSubPartitionesDBTableView2Column1: TcxGridDBColumn
            Caption = 'Partition Name'
            DataBinding.FieldName = 'PARTITION_NAME'
            Width = 103
          end
          object GridSubPartitionesDBTableView2Column2: TcxGridDBColumn
            Caption = 'Last Analyzed'
            DataBinding.FieldName = 'LAST_ANALYZED'
            Width = 93
          end
          object GridSubPartitionesDBTableView2Column3: TcxGridDBColumn
            Caption = 'Tablespace Name'
            DataBinding.FieldName = 'TABLESPACE_NAME'
            Width = 91
          end
          object GridSubPartitionesDBTableView2Column4: TcxGridDBColumn
            Caption = 'Num Rows'
            DataBinding.FieldName = 'NUM_ROWS'
          end
          object GridSubPartitionesDBTableView2Column5: TcxGridDBColumn
            Caption = 'Blocks'
            DataBinding.FieldName = 'BLOCKS'
          end
          object GridSubPartitionesDBTableView2Column6: TcxGridDBColumn
            Caption = 'Empty Blocks'
            DataBinding.FieldName = 'EMPTY_BLOCKS'
            Width = 86
          end
          object GridSubPartitionesDBTableView2Column7: TcxGridDBColumn
            Caption = 'Avg Space'
            DataBinding.FieldName = 'AVG_SPACE'
            Width = 87
          end
          object GridSubPartitionesDBTableView2Column8: TcxGridDBColumn
            Caption = 'High Value'
            DataBinding.FieldName = 'HIGH_VALUE'
            Width = 84
          end
          object GridSubPartitionesDBTableView2Column9: TcxGridDBColumn
            Caption = 'Compression'
            DataBinding.FieldName = 'COMPRESSION'
            Width = 70
          end
        end
        object cxGridLevel9: TcxGridLevel
          GridView = GridSubPartitionesDBTableView2
        end
      end
      object dxBarDockControl12: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
    object tsTableUsedBy: TcxTabSheet
      Caption = 'Used By'
      ImageIndex = 12
      object GridUsed: TcxGrid
        Left = 0
        Top = 0
        Width = 615
        Height = 568
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridUsedDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCanSelectRecord = GridIndexDBTableViewCanSelectRecord
          DataController.DataSource = dsUsed
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object GridUsedDBTableView1Column1: TcxGridDBColumn
            Caption = 'Owner'
            DataBinding.FieldName = 'owner'
            Width = 92
          end
          object GridUsedDBTableView1Column2: TcxGridDBColumn
            Caption = 'Object Type'
            DataBinding.FieldName = 'object_type'
            Width = 96
          end
          object GridUsedDBTableView1Column3: TcxGridDBColumn
            Caption = 'Object Name'
            DataBinding.FieldName = 'object_name'
            Width = 143
          end
          object GridUsedDBTableView1Column4: TcxGridDBColumn
            Caption = 'Object ID'
            DataBinding.FieldName = 'object_id'
            Width = 85
          end
          object GridUsedDBTableView1Column5: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'status'
            Width = 110
          end
        end
        object cxGridLevel7: TcxGridLevel
          GridView = GridUsedDBTableView1
        end
      end
    end
    object tsTableComment: TcxTabSheet
      Caption = 'Comment'
      ImageIndex = 14
      object editComment: TcxRichEdit
        Left = 0
        Top = 26
        Align = alClient
        Properties.ScrollBars = ssBoth
        Style.BorderStyle = ebsUltraFlat
        Style.Shadow = False
        TabOrder = 0
        Height = 542
        Width = 615
      end
      object dxBarDockControl13: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
    object tsTableScripts: TcxTabSheet
      Caption = 'Scripts'
      ImageIndex = 5
      object redtDDL: TcxRichEdit
        Left = 0
        Top = 26
        Align = alClient
        ParentFont = False
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -13
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 542
        Width = 615
      end
      object dxBarDockControl14: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 615
        Height = 26
        Align = dalTop
        BarManager = barManager
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 693
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object imgToolBar: TImage
      Left = 0
      Top = 0
      Width = 693
      Height = 26
      Align = alClient
      Picture.Data = {
        07544269746D6170A6040000424DA60400000000000036040000280000000100
        00001C000000010008000000000070000000C40E0000C40E0000000100000001
        000094380400973C07009A3F0B009D430F009F461300A2491600A54D1A00A850
        1E00AB542100AE572500B15B2900B45E2C00B6613000B9653400BC683800BF6C
        3B00C26F3F00C5724300C8764600CB794A00CD7D4E00D0805200D3845500D687
        5900000000000000000000000000000000000000000000000000000000000000
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
        0000000000000100000002000000030000000400000005000000060000000700
        000008000000090000000A0000000B0000000C0000000D0000000E0000000F00
        0000100000001100000012000000130000001400000015000000160000001700
        000017000000170000001700000017000000}
      Stretch = True
    end
    object lblDescription: TLabel
      Left = 7
      Top = 6
      Width = 105
      Height = 14
      Caption = 'Table Description'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object dsTableDetail: TDataSource
    DataSet = QTableDetail
    Left = 624
    Top = 57
  end
  object QTableDetail: TOraQuery
    SQL.Strings = (
      'SELECT * FROM all_tables')
    Left = 592
    Top = 57
    object QTableDetailOWNER: TStringField
      FieldName = 'OWNER'
      Required = True
      Size = 30
    end
    object QTableDetailTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Required = True
      Size = 30
    end
    object QTableDetailTABLESPACE_NAME: TStringField
      FieldName = 'TABLESPACE_NAME'
      Size = 30
    end
    object QTableDetailCLUSTER_NAME: TStringField
      FieldName = 'CLUSTER_NAME'
      Size = 30
    end
    object QTableDetailIOT_NAME: TStringField
      FieldName = 'IOT_NAME'
      Size = 30
    end
    object QTableDetailPCT_FREE: TFloatField
      FieldName = 'PCT_FREE'
    end
    object QTableDetailPCT_USED: TFloatField
      FieldName = 'PCT_USED'
    end
    object QTableDetailINI_TRANS: TFloatField
      FieldName = 'INI_TRANS'
    end
    object QTableDetailMAX_TRANS: TFloatField
      FieldName = 'MAX_TRANS'
    end
    object QTableDetailINITIAL_EXTENT: TFloatField
      FieldName = 'INITIAL_EXTENT'
    end
    object QTableDetailNEXT_EXTENT: TFloatField
      FieldName = 'NEXT_EXTENT'
    end
    object QTableDetailMIN_EXTENTS: TFloatField
      FieldName = 'MIN_EXTENTS'
    end
    object QTableDetailMAX_EXTENTS: TFloatField
      FieldName = 'MAX_EXTENTS'
    end
    object QTableDetailPCT_INCREASE: TFloatField
      FieldName = 'PCT_INCREASE'
    end
    object QTableDetailFREELISTS: TFloatField
      FieldName = 'FREELISTS'
    end
    object QTableDetailFREELIST_GROUPS: TFloatField
      FieldName = 'FREELIST_GROUPS'
    end
    object QTableDetailLOGGING: TStringField
      FieldName = 'LOGGING'
      Size = 3
    end
    object QTableDetailBACKED_UP: TStringField
      FieldName = 'BACKED_UP'
      Size = 1
    end
    object QTableDetailNUM_ROWS: TFloatField
      FieldName = 'NUM_ROWS'
    end
    object QTableDetailBLOCKS: TFloatField
      FieldName = 'BLOCKS'
    end
    object QTableDetailEMPTY_BLOCKS: TFloatField
      FieldName = 'EMPTY_BLOCKS'
    end
    object QTableDetailAVG_SPACE: TFloatField
      FieldName = 'AVG_SPACE'
    end
    object QTableDetailCHAIN_CNT: TFloatField
      FieldName = 'CHAIN_CNT'
    end
    object QTableDetailAVG_ROW_LEN: TFloatField
      FieldName = 'AVG_ROW_LEN'
    end
    object QTableDetailAVG_SPACE_FREELIST_BLOCKS: TFloatField
      FieldName = 'AVG_SPACE_FREELIST_BLOCKS'
    end
    object QTableDetailNUM_FREELIST_BLOCKS: TFloatField
      FieldName = 'NUM_FREELIST_BLOCKS'
    end
    object QTableDetailDEGREE: TStringField
      FieldName = 'DEGREE'
      Size = 10
    end
    object QTableDetailINSTANCES: TStringField
      FieldName = 'INSTANCES'
      Size = 10
    end
    object QTableDetailCACHE: TStringField
      FieldName = 'CACHE'
      Size = 5
    end
    object QTableDetailTABLE_LOCK: TStringField
      FieldName = 'TABLE_LOCK'
      Size = 8
    end
    object QTableDetailSAMPLE_SIZE: TFloatField
      FieldName = 'SAMPLE_SIZE'
    end
    object QTableDetailLAST_ANALYZED: TDateTimeField
      FieldName = 'LAST_ANALYZED'
    end
    object QTableDetailPARTITIONED: TStringField
      FieldName = 'PARTITIONED'
      Size = 3
    end
    object QTableDetailIOT_TYPE: TStringField
      FieldName = 'IOT_TYPE'
      Size = 12
    end
    object QTableDetailTEMPORARY: TStringField
      FieldName = 'TEMPORARY'
      Size = 1
    end
    object QTableDetailSECONDARY: TStringField
      FieldName = 'SECONDARY'
      Size = 1
    end
    object QTableDetailNESTED: TStringField
      FieldName = 'NESTED'
      Size = 3
    end
    object QTableDetailBUFFER_POOL: TStringField
      FieldName = 'BUFFER_POOL'
      Size = 7
    end
    object QTableDetailROW_MOVEMENT: TStringField
      FieldName = 'ROW_MOVEMENT'
      Size = 8
    end
    object QTableDetailGLOBAL_STATS: TStringField
      FieldName = 'GLOBAL_STATS'
      Size = 3
    end
    object QTableDetailUSER_STATS: TStringField
      FieldName = 'USER_STATS'
      Size = 3
    end
    object QTableDetailDURATION: TStringField
      FieldName = 'DURATION'
      Size = 15
    end
    object QTableDetailSKIP_CORRUPT: TStringField
      FieldName = 'SKIP_CORRUPT'
      Size = 8
    end
    object QTableDetailMONITORING: TStringField
      FieldName = 'MONITORING'
      Size = 3
    end
    object QTableDetailCLUSTER_OWNER: TStringField
      FieldName = 'CLUSTER_OWNER'
      Size = 30
    end
    object QTableDetailDEPENDENCIES: TStringField
      FieldName = 'DEPENDENCIES'
      Size = 8
    end
    object QTableDetailCOMPRESSION: TStringField
      FieldName = 'COMPRESSION'
      Size = 8
    end
  end
  object QTableData: TOraQuery
    SQLInsert.Strings = (
      'insert into alp values (:c1, :c2)')
    SQLUpdate.Strings = (
      'update alp set c1= :c1')
    FetchRows = 500
    CachedUpdates = True
    AfterDelete = QTableDataAfterDelete
    OnNewRecord = QTableDataNewRecord
    Left = 632
    Top = 465
  end
  object dsTableData: TDataSource
    DataSet = QTableData
    OnStateChange = dsTableDataStateChange
    OnDataChange = dsTableDataDataChange
    OnUpdateData = dsTableDataUpdateData
    Left = 593
    Top = 465
  end
  object dsTableColumns: TDataSource
    DataSet = QTableColumns
    Left = 624
    Top = 89
  end
  object QTableColumns: TOraQuery
    SQL.Strings = (
      '    SELECT cols.*, '
      
        '         ( SELECT comments FROM SYS.user_col_comments WHERE tabl' +
        'e_name = cols.table_name AND column_name = cols.column_name) com' +
        'ments '
      '       FROM SYS.ALL_tab_columns cols '
      '    ORDER BY column_id ')
    Left = 592
    Top = 89
    object QTableColumnsOWNER: TStringField
      FieldName = 'OWNER'
      Required = True
      Size = 30
    end
    object QTableColumnsTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Required = True
      Size = 30
    end
    object QTableColumnsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Required = True
      Size = 30
    end
    object QTableColumnsDATA_TYPE: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
    object QTableColumnsDATA_TYPE_MOD: TStringField
      FieldName = 'DATA_TYPE_MOD'
      Size = 3
    end
    object QTableColumnsDATA_TYPE_OWNER: TStringField
      FieldName = 'DATA_TYPE_OWNER'
      Size = 30
    end
    object QTableColumnsDATA_LENGTH: TFloatField
      FieldName = 'DATA_LENGTH'
      Required = True
    end
    object QTableColumnsDATA_PRECISION: TFloatField
      FieldName = 'DATA_PRECISION'
    end
    object QTableColumnsDATA_SCALE: TFloatField
      FieldName = 'DATA_SCALE'
    end
    object QTableColumnsNULLABLE: TStringField
      FieldName = 'NULLABLE'
      Size = 1
    end
    object QTableColumnsCOLUMN_ID: TFloatField
      FieldName = 'COLUMN_ID'
    end
    object QTableColumnsDEFAULT_LENGTH: TFloatField
      FieldName = 'DEFAULT_LENGTH'
    end
    object QTableColumnsDATA_DEFAULT: TMemoField
      FieldName = 'DATA_DEFAULT'
      BlobType = ftMemo
    end
    object QTableColumnsNUM_DISTINCT: TFloatField
      FieldName = 'NUM_DISTINCT'
    end
    object QTableColumnsLOW_VALUE: TVarBytesField
      FieldName = 'LOW_VALUE'
      Size = 32
    end
    object QTableColumnsHIGH_VALUE: TVarBytesField
      FieldName = 'HIGH_VALUE'
      Size = 32
    end
    object QTableColumnsDENSITY: TFloatField
      FieldName = 'DENSITY'
    end
    object QTableColumnsNUM_NULLS: TFloatField
      FieldName = 'NUM_NULLS'
    end
    object QTableColumnsNUM_BUCKETS: TFloatField
      FieldName = 'NUM_BUCKETS'
    end
    object QTableColumnsLAST_ANALYZED: TDateTimeField
      FieldName = 'LAST_ANALYZED'
    end
    object QTableColumnsSAMPLE_SIZE: TFloatField
      FieldName = 'SAMPLE_SIZE'
    end
    object QTableColumnsCHARACTER_SET_NAME: TStringField
      FieldName = 'CHARACTER_SET_NAME'
      Size = 44
    end
    object QTableColumnsCHAR_COL_DECL_LENGTH: TFloatField
      FieldName = 'CHAR_COL_DECL_LENGTH'
    end
    object QTableColumnsGLOBAL_STATS: TStringField
      FieldName = 'GLOBAL_STATS'
      Size = 3
    end
    object QTableColumnsUSER_STATS: TStringField
      FieldName = 'USER_STATS'
      Size = 3
    end
    object QTableColumnsAVG_COL_LEN: TFloatField
      FieldName = 'AVG_COL_LEN'
    end
    object QTableColumnsCHAR_LENGTH: TFloatField
      FieldName = 'CHAR_LENGTH'
    end
    object QTableColumnsCHAR_USED: TStringField
      FieldName = 'CHAR_USED'
      Size = 1
    end
    object QTableColumnsV80_FMT_IMAGE: TStringField
      FieldName = 'V80_FMT_IMAGE'
      Size = 3
    end
    object QTableColumnsDATA_UPGRADED: TStringField
      FieldName = 'DATA_UPGRADED'
      Size = 3
    end
    object QTableColumnsCOMMENTS: TStringField
      FieldName = 'COMMENTS'
      Size = 4000
    end
  end
  object barManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Columns'
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 241
        FloatTop = 137
        FloatClientWidth = 0
        FloatClientHeight = 0
        ItemLinks = <
          item
            Item = bbtnAddColumn
            Visible = True
          end
          item
            Item = bbtnEditColumn
            Visible = True
          end
          item
            Item = bbtnDropColumn
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefeshColumn
            Visible = True
          end>
        Name = 'barColumns'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barTable'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bbtnCreateTable
            Visible = True
          end
          item
            Item = bbtnAlterTable
            Visible = True
          end
          item
            Item = bbtnDropTable
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnTruncateTable
            Visible = True
          end
          item
            Item = bbtnLockTable
            Visible = True
          end
          item
            Item = bbtnAnalyzeTable
            Visible = True
          end
          item
            Item = bbtnCopyTable
            Visible = True
          end
          item
            Item = bbtnRenameTable
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshTable
            Visible = True
          end>
        Name = 'barTable'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barData'
        DockControl = dxBarDockControl3
        DockedDockControl = dxBarDockControl3
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarDBNavFirst1
            Visible = True
          end
          item
            Item = dxBarDBNavPrev1
            Visible = True
          end
          item
            Item = dxBarDBNavNext1
            Visible = True
          end
          item
            Item = dxBarDBNavLast1
            Visible = True
          end
          item
            Item = dxBarDBNavInsert1
            Visible = True
          end
          item
            Item = dxBarDBNavDelete1
            Visible = True
          end
          item
            Item = dxBarDBNavEdit1
            Visible = True
          end
          item
            Item = dxBarDBNavPost1
            Visible = True
          end
          item
            Item = dxBarDBNavCancel1
            Visible = True
          end
          item
            Item = dxBarDBNavRefresh1
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnDataCommit
            Visible = True
          end
          item
            Item = bbtnDataRollback
            Visible = True
          end
          item
            BeginGroup = True
            Item = edtDataFilter
            UserDefine = [udWidth]
            UserWidth = 165
            Visible = True
          end>
        Name = 'barData'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barIndex'
        DockControl = dxBarDockControl4
        DockedDockControl = dxBarDockControl4
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bbtnCreateIndex
            Visible = True
          end
          item
            Item = bbtnEditIndex
            Visible = True
          end
          item
            Item = bbtnDropIndex
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnAnalyzeIndex
            Visible = True
          end
          item
            Item = bbtnRebuildIndex
            Visible = True
          end
          item
            Item = bbtnCoalesceIndex
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshIndex
            Visible = True
          end>
        Name = 'barIndex'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barKey'
        DockControl = dxBarDockControl5
        DockedDockControl = dxBarDockControl5
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 300
        FloatTop = 400
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bbtnCreateKey
            Visible = True
          end
          item
            Item = bbtnAlterKey
            Visible = True
          end
          item
            Item = bbtnDropKey
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnEnableKey
            Visible = True
          end
          item
            Item = bbtnDisableKey
            Visible = True
          end
          item
            Item = bbtnRenameKey
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshKey
            Visible = True
          end>
        Name = 'barKey'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barForeignKey'
        DockControl = dxBarDockControl6
        DockedDockControl = dxBarDockControl6
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 320
        FloatTop = 294
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bbtnCreateForeignKey
            Visible = True
          end
          item
            Item = bbtnAlterForeignKey
            Visible = True
          end
          item
            Item = bbtnDropForeignKey
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnEnableForeignKey
            Visible = True
          end
          item
            Item = bbrnDisableForeignKey
            Visible = True
          end
          item
            Item = bbtnRenameForeignKey
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshForeignKey
            Visible = True
          end>
        Name = 'barForeignKey'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barCheck'
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
            Item = bbtnCreateCheck
            Visible = True
          end
          item
            Item = bbtnAlterCheck
            Visible = True
          end
          item
            Item = bbtnDropCheck
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnEnableCheck
            Visible = True
          end
          item
            Item = bbtnDisableCheck
            Visible = True
          end
          item
            Item = bbtnRenameCheck
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshCheck
            Visible = True
          end>
        Name = 'barCheck'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barTriger'
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
            Item = bbtnCreateTrigger
            Visible = True
          end
          item
            Item = bbtnAlterTrigger
            Visible = True
          end
          item
            Item = bbtnDropTrigger
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnEnableTrigger
            Visible = True
          end
          item
            Item = bbtnDisableTrigger
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnEnableAllTriggers
            Visible = True
          end
          item
            Item = bbtnDisableAllTriggers
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnCompileTrigger
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshTrigger
            Visible = True
          end>
        Name = 'barTriger'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barGrant'
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
            Item = bbtnGrantPrivileges
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshGrants
            Visible = True
          end>
        Name = 'barGrant'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barSynonym'
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
            Item = bbtnCreateSynonym
            Visible = True
          end
          item
            Item = bbtnDropSynonym
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshSynonym
            Visible = True
          end>
        Name = 'barSynonym'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barPartitions'
        DockControl = dxBarDockControl11
        DockedDockControl = dxBarDockControl11
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 73
        FloatTop = 328
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bbtnRefreshPartition
            Visible = True
          end>
        Name = 'barPartitions'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barSubPartitions'
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
            Item = bbtnRefreshSubPartitions
            Visible = True
          end>
        Name = 'barSubPartitions'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barComment'
        DockControl = dxBarDockControl13
        DockedDockControl = dxBarDockControl13
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bbtnRefreshComment
            Visible = True
          end>
        Name = 'barComment'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barScript'
        DockControl = dxBarDockControl14
        DockedDockControl = dxBarDockControl14
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bbtnRefreshScript
            Visible = True
          end>
        Name = 'barScript'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default'
      'Properties'
      'Columns'
      'DB Navigator'
      'Index'
      'Key'
      'ForeignKey'
      'Check'
      'Trigger'
      'Grant'
      'Synonym'
      'Partitions'
      'SubPartitions'
      'Comment'
      'Script')
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
      True
      True
      True)
    HotImages = dmGenel.imList
    Images = dmGenel.imList
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    NotDocking = [dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    Style = bmsStandard
    UseSystemFont = True
    Left = 15
    Top = 390
    DockControlHeights = (
      0
      0
      0
      0)
    object bbtnCreateTable: TdxBarButton
      Caption = 'Create Table'
      Category = 1
      Description = 'Create Table'
      Hint = 'Create Table'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = bbtnCreateTableClick
    end
    object bbtnEditColumn: TdxBarButton
      Caption = 'Edit Column'
      Category = 2
      Hint = 'Edit Column'
      Visible = ivAlways
      ImageIndex = 9
      OnClick = bbtnEditColumnClick
    end
    object bbtnAddColumn: TdxBarButton
      Caption = 'Add Column'
      Category = 2
      Hint = 'Add Column'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = bbtnAddColumnClick
    end
    object bbtnDropColumn: TdxBarButton
      Caption = 'Drop Column from this table'
      Category = 2
      Hint = 'Drop Column from this table'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropColumnClick
    end
    object bbtnRefeshColumn: TdxBarButton
      Caption = 'Refresh Column Lists'
      Category = 2
      Hint = 'Refresh Column Lists'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefeshColumnClick
    end
    object bbtnDropTable: TdxBarButton
      Caption = 'Drop Table'
      Category = 1
      Description = 'Drop Table'
      Hint = 'Drop Table'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropTableClick
    end
    object bbtnAlterTable: TdxBarButton
      Caption = 'Alter Table'
      Category = 1
      Hint = 'Alter Table'
      Visible = ivAlways
      ImageIndex = 9
      OnClick = bbtnAlterTableClick
    end
    object bbtnAnalyzeTable: TdxBarButton
      Caption = 'Analyze Table'
      Category = 1
      Hint = 'Analyze Table'
      Visible = ivAlways
      ImageIndex = 102
      OnClick = bbtnAnalyzeTableClick
    end
    object bbtnTruncateTable: TdxBarButton
      Caption = 'Truncate Table'
      Category = 1
      Hint = 'Truncate Table'
      Visible = ivAlways
      ImageIndex = 31
      OnClick = bbtnTruncateTableClick
    end
    object bbtnCopyTable: TdxBarButton
      Caption = 'Copy Table'
      Category = 1
      Hint = 'Copy Table'
      Visible = ivAlways
      ImageIndex = 52
      OnClick = bbtnCopyTableClick
    end
    object bbtnLockTable: TdxBarButton
      Caption = 'Lock Table'
      Category = 1
      Hint = 'Lock Table'
      Visible = ivAlways
      ImageIndex = 26
      OnClick = bbtnLockTableClick
    end
    object bbtnRenameTable: TdxBarButton
      Caption = 'Rename Table'
      Category = 1
      Hint = 'Rename Table'
      Visible = ivAlways
      ImageIndex = 55
      OnClick = bbtnRenameTableClick
    end
    object bbtnRefreshTable: TdxBarButton
      Caption = 'Refresh Table'
      Category = 1
      Hint = 'Refresh Table'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshTableClick
    end
    object dxBarDBNavFirst1: TdxBarDBNavButton
      Caption = 'First'
      Category = 3
      Enabled = False
      Hint = 'First'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777087777778077777708777780007777770877800000777777088000000
        0777777087780000077777708777780007777770877777780777777777777777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator1
      NavButton = dxbnFirst
    end
    object dxBarDBNavPrev1: TdxBarDBNavButton
      Caption = 'Prior'
      Category = 3
      Enabled = False
      Hint = 'Prior'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777780777777777777800077777777778000007777777780000000
        7777777777800000777777777777800077777777777777807777777777777777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator1
      NavButton = dxbnPrior
    end
    object dxBarDBNavNext1: TdxBarDBNavButton
      Caption = 'Next'
      Category = 3
      Enabled = False
      Hint = 'Next'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777708777777777777770008777777777777000008777777777700000008
        7777777700000877777777770008777777777777087777777777777777777777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator1
      NavButton = dxbnNext
    end
    object dxBarDBNavLast1: TdxBarDBNavButton
      Caption = 'Last'
      Category = 3
      Enabled = False
      Hint = 'Last'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777087777778077777700087777807777770000087780777777000000088
        0777777000008778077777700087777807777770877777780777777777777777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator1
      NavButton = dxbnLast
    end
    object dxBarDBNavInsert1: TdxBarDBNavButton
      Caption = 'Insert'
      Category = 3
      Enabled = False
      Hint = 'Insert'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777000777
        7777777777000777777777777700077777777770000000007777777000000000
        7777777000000000777777777700077777777777770007777777777777000777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator1
      NavButton = dxbnInsert
    end
    object dxBarDBNavDelete1: TdxBarDBNavButton
      Caption = 'Delete'
      Category = 3
      Enabled = False
      Hint = 'Delete'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777777777777777777777777777770000000000777777000000000
        0777777000000000077777777777777777777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator1
      NavButton = dxbnDelete
    end
    object dxBarDBNavEdit1: TdxBarDBNavButton
      Caption = 'Edit'
      Category = 3
      Enabled = False
      Hint = 'Edit'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777777777777700000000007777777000000007777777770000007
        7777777777000077777777777770077777777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator1
      NavButton = dxbnEdit
    end
    object dxBarDBNavPost1: TdxBarDBNavButton
      Caption = 'Post'
      Category = 3
      Enabled = False
      Hint = 'Post'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777770777777
        7777777700077777777777700000777777777700070007777777770077700077
        7777777777770007777777777777700077777777777777000777777777777770
        0777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator1
      NavButton = dxbnPost
    end
    object dxBarDBNavCancel1: TdxBarDBNavButton
      Caption = 'Cancel'
      Category = 3
      Enabled = False
      Hint = 'Cancel'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777007777700
        7777777000777000777777770007000777777777700000777777777777000777
        7777777770000077777777770007000777777770007770007777777007777700
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator1
      NavButton = dxbnCancel
    end
    object dxBarDBNavRefresh1: TdxBarDBNavButton
      Caption = 'Refresh'
      Category = 3
      Enabled = False
      Hint = 'Refresh'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777778087777777777780087777
        7777777700877777777777780877777777777770077777777777777007770000
        0777777008777800077777780087800007777777000000080777777778000877
        0777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator1
      NavButton = dxbnRefresh
    end
    object bbtnDataCommit: TdxBarButton
      Caption = 'Commit'
      Category = 3
      Hint = 'Commit'
      Visible = ivAlways
      ImageIndex = 42
      OnClick = bbtnDataCommitClick
    end
    object bbtnDataRollback: TdxBarButton
      Caption = 'Rollback'
      Category = 3
      Hint = 'Rollback'
      Visible = ivAlways
      ImageIndex = 43
      OnClick = bbtnDataRollbackClick
    end
    object edtDataFilter: TdxBarEdit
      Align = iaClient
      Caption = 'Data Filter'
      Category = 3
      Hint = 'where column_name = value'
      Visible = ivAlways
      Text = 'Enter where clause'
      OnEnter = edtDataFilterEnter
      OnExit = edtDataFilterExit
      OnKeyDown = edtDataFilterKeyDown
      ShowCaption = True
      Width = 100
    end
    object bbtnCreateIndex: TdxBarButton
      Caption = 'Create Index'
      Category = 4
      Hint = 'Create Index'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = tbtnCreateIndexesClick
    end
    object bbtnEditIndex: TdxBarButton
      Caption = 'Edit Index'
      Category = 4
      Hint = 'Edit Index'
      Visible = ivAlways
      ImageIndex = 9
      OnClick = bbtnEditIndexClick
    end
    object bbtnDropIndex: TdxBarButton
      Caption = 'Drop Index'
      Category = 4
      Hint = 'Drop Index'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropIndexClick
    end
    object bbtnRefreshIndex: TdxBarButton
      Caption = 'Refresh Indexs'
      Category = 4
      Hint = 'Refresh Indexs'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshIndexClick
    end
    object bbtnAnalyzeIndex: TdxBarButton
      Caption = 'Analyze Index'
      Category = 4
      Hint = 'Analyze Index'
      Visible = ivAlways
      ImageIndex = 102
      OnClick = bbtnAnalyzeIndexClick
    end
    object bbtnRebuildIndex: TdxBarButton
      Caption = 'Rebuild Index'
      Category = 4
      Hint = 'Rebuild Index'
      Visible = ivAlways
      ImageIndex = 100
      OnClick = bbtnRebuildIndexClick
    end
    object bbtnCoalesceIndex: TdxBarButton
      Caption = 'Coalesce Index'
      Category = 4
      Hint = 'Coalesce Index'
      Visible = ivAlways
      ImageIndex = 87
      OnClick = bbtnCoalesceIndexClick
    end
    object bbtnDropKey: TdxBarButton
      Caption = 'Drop Key'
      Category = 5
      Hint = 'Drop Key'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropKeyClick
    end
    object bbtnCreateKey: TdxBarButton
      Caption = 'Create Key'
      Category = 5
      Hint = 'Create Key'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = tbtnCreateKeysClick
    end
    object bbtnRefreshKey: TdxBarButton
      Caption = 'Refresh Keys'
      Category = 5
      Hint = 'Refresh Keys'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshKeyClick
    end
    object bbtnEnableKey: TdxBarButton
      Caption = 'Enable Key'
      Category = 5
      Hint = 'Enable Key'
      Visible = ivAlways
      ImageIndex = 89
      OnClick = bbtnEnableKeyClick
    end
    object bbtnDisableKey: TdxBarButton
      Caption = 'Disable Key'
      Category = 5
      Hint = 'Disable Key'
      Visible = ivAlways
      ImageIndex = 91
      OnClick = bbtnDisableKeyClick
    end
    object bbtnRenameKey: TdxBarButton
      Caption = 'Rename Key'
      Category = 5
      Hint = 'Rename Key'
      Visible = ivAlways
      ImageIndex = 55
      OnClick = bbtnRenameKeyClick
    end
    object bbtnAlterKey: TdxBarButton
      Caption = 'Alter Key'
      Category = 5
      Hint = 'Alter Key'
      Visible = ivAlways
      ImageIndex = 9
    end
    object bbtnDropForeignKey: TdxBarButton
      Caption = 'Drop Foreign Key'
      Category = 6
      Hint = 'Drop Foreign Key'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropForeignKeyClick
    end
    object bbtnCreateForeignKey: TdxBarButton
      Caption = 'Create Foreign Key'
      Category = 6
      Hint = 'Create Foreign Key'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = tbtnCreateForeignKeyClick
    end
    object bbtnRefreshForeignKey: TdxBarButton
      Caption = 'Refresh Foreign Keys'
      Category = 6
      Hint = 'Refresh Foreign Keys'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshForeignKeyClick
    end
    object bbtnEnableForeignKey: TdxBarButton
      Caption = 'Enable Foreign Key'
      Category = 6
      Hint = 'Enable Foreign Key'
      Visible = ivAlways
      ImageIndex = 89
      OnClick = bbtnEnableForeignKeyClick
    end
    object bbrnDisableForeignKey: TdxBarButton
      Caption = 'Disable Foreign Key'
      Category = 6
      Visible = ivAlways
      ImageIndex = 91
      OnClick = bbrnDisableForeignKeyClick
    end
    object bbtnRenameForeignKey: TdxBarButton
      Caption = 'Rename Foreign Key'
      Category = 6
      Hint = 'Rename Foreign Key'
      Visible = ivAlways
      ImageIndex = 55
      OnClick = bbtnRenameForeignKeyClick
    end
    object bbtnAlterForeignKey: TdxBarButton
      Caption = 'Alter Foreign Key'
      Category = 6
      Hint = 'Alter Foreign Key'
      Visible = ivAlways
      ImageIndex = 9
    end
    object bbtnDropCheck: TdxBarButton
      Caption = 'Drop Check'
      Category = 7
      Hint = 'Drop Check'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropCheckClick
    end
    object bbtnCreateCheck: TdxBarButton
      Caption = 'Create Check'
      Category = 7
      Hint = 'Create Check'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = tbtnCreateCheckClick
    end
    object bbtnRefreshCheck: TdxBarButton
      Caption = 'Refresh Checks'
      Category = 7
      Hint = 'Refresh Checks'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshCheckClick
    end
    object bbtnEnableCheck: TdxBarButton
      Caption = 'Enable Check'
      Category = 7
      Hint = 'Enable Check'
      Visible = ivAlways
      ImageIndex = 89
      OnClick = bbtnEnableCheckClick
    end
    object bbtnDisableCheck: TdxBarButton
      Caption = 'Disable Check'
      Category = 7
      Hint = 'Disable Check'
      Visible = ivAlways
      ImageIndex = 91
      OnClick = bbtnDisableCheckClick
    end
    object bbtnRenameCheck: TdxBarButton
      Caption = 'Rename Check'
      Category = 7
      Hint = 'Rename Check'
      Visible = ivAlways
      ImageIndex = 55
      OnClick = bbtnRenameCheckClick
    end
    object bbtnAlterCheck: TdxBarButton
      Caption = 'Alter Check'
      Category = 7
      Hint = 'Alter Check'
      Visible = ivAlways
      ImageIndex = 9
      OnClick = bbtnAlterCheckClick
    end
    object bbtnDropTrigger: TdxBarButton
      Caption = 'Drop Trigger'
      Category = 8
      Hint = 'Drop Trigger'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = tbtnDropTrigerClick
    end
    object bbtnCreateTrigger: TdxBarButton
      Caption = 'Create Trigger'
      Category = 8
      Hint = 'Create Trigger'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = tbtnCreateTrigerClick
    end
    object bbtnAlterTrigger: TdxBarButton
      Caption = 'Alter Trigger'
      Category = 8
      Hint = 'Alter Trigger'
      Visible = ivAlways
      ImageIndex = 9
      OnClick = bbtnAlterTriggerClick
    end
    object bbtnEnableTrigger: TdxBarButton
      Caption = 'Enable Trigger'
      Category = 8
      Hint = 'Enable Trigger'
      Visible = ivAlways
      ImageIndex = 89
      OnClick = bbtnEnableTriggerClick
    end
    object bbtnDisableTrigger: TdxBarButton
      Caption = 'Disable Trigger'
      Category = 8
      Hint = 'Disable Trigger'
      Visible = ivAlways
      ImageIndex = 91
      OnClick = bbtnDisableTriggerClick
    end
    object bbtnCompileTrigger: TdxBarButton
      Caption = 'Compile Trigger'
      Category = 8
      Hint = 'Compile Trigger'
      Visible = ivAlways
      ImageIndex = 86
      OnClick = bbtnCompileTriggerClick
    end
    object bbtnRefreshTrigger: TdxBarButton
      Caption = 'Refresh Triggers'
      Category = 8
      Hint = 'Refresh Triggers'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshTriggerClick
    end
    object bbtnGrantPrivileges: TdxBarButton
      Caption = 'Grant Privileges'
      Category = 9
      Hint = 'Grant Privileges'
      Visible = ivAlways
      ImageIndex = 99
      OnClick = tbtnGrantPrivilegesClick
    end
    object bbtnRefreshGrants: TdxBarButton
      Caption = 'Refresh Grants'
      Category = 9
      Hint = 'Refresh Grants'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshGrantsClick
    end
    object bbtnCreateSynonym: TdxBarButton
      Caption = 'Create Synonym'
      Category = 10
      Hint = 'Create Synonym'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = tbtnCreateSynonymsClick
    end
    object bbtnDropSynonym: TdxBarButton
      Caption = 'Drop Synonym'
      Category = 10
      Hint = 'Drop Synonym'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropSynonymClick
    end
    object bbtnRefreshSynonym: TdxBarButton
      Caption = 'Refresh Synonyms'
      Category = 10
      Hint = 'Refresh Synonyms'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshSynonymClick
    end
    object bbtnRefreshPartition: TdxBarButton
      Caption = 'Refresh Partitions'
      Category = 11
      Hint = 'Refresh Partitions'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshPartitionClick
    end
    object bbtnRefreshSubPartitions: TdxBarButton
      Caption = 'Refresh SubPartitions'
      Category = 12
      Hint = 'Refresh SubPartitions'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshSubPartitionsClick
    end
    object bbtnRefreshComment: TdxBarButton
      Caption = 'Refresh Comment'
      Category = 13
      Hint = 'Refresh Comment'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshCommentClick
    end
    object bbtnRefreshScript: TdxBarButton
      Caption = 'Refresh Script'
      Category = 14
      Hint = 'Refresh Script'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshScriptClick
    end
    object bbtnDisableAllTriggers: TdxBarButton
      Caption = 'Disable All Triggers'
      Category = 8
      Hint = 'Disable All Triggers'
      Visible = ivAlways
      ImageIndex = 91
      OnClick = bbtnDisableAllTriggersClick
    end
    object bbtnEnableAllTriggers: TdxBarButton
      Caption = 'Enable All Triggers'
      Category = 8
      Hint = 'Enable All Triggers'
      Visible = ivAlways
      ImageIndex = 89
      OnClick = bbtnEnableAllTriggersClick
    end
  end
  object qTemp: TOraQuery
    Left = 592
    Top = 24
  end
  object qTableIndexes: TOraQuery
    Left = 591
    Top = 121
  end
  object dsTableIndexes: TDataSource
    DataSet = qTableIndexes
    Left = 624
    Top = 121
  end
  object qConstraints: TOraQuery
    Left = 593
    Top = 154
  end
  object dsConstraints: TDataSource
    DataSet = qConstraints
    Left = 625
    Top = 154
  end
  object qGrants: TOraQuery
    Left = 593
    Top = 218
  end
  object dsGrants: TDataSource
    DataSet = qGrants
    Left = 625
    Top = 218
  end
  object qSynonyms: TOraQuery
    Left = 593
    Top = 250
  end
  object dsSynonyms: TDataSource
    DataSet = qSynonyms
    Left = 625
    Top = 250
  end
  object qPartitions: TOraQuery
    SQL.Strings = (
      'select * FROM all_TAB_PARTITIONS')
    Left = 594
    Top = 283
    object qPartitionsTABLE_OWNER: TStringField
      FieldName = 'TABLE_OWNER'
      Size = 30
    end
    object qPartitionsTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 30
    end
    object qPartitionsCOMPOSITE: TStringField
      FieldName = 'COMPOSITE'
      Size = 3
    end
    object qPartitionsPARTITION_NAME: TStringField
      FieldName = 'PARTITION_NAME'
      Size = 30
    end
    object qPartitionsSUBPARTITION_COUNT: TFloatField
      FieldName = 'SUBPARTITION_COUNT'
    end
    object qPartitionsHIGH_VALUE: TMemoField
      FieldName = 'HIGH_VALUE'
      BlobType = ftMemo
    end
    object qPartitionsHIGH_VALUE_LENGTH: TFloatField
      FieldName = 'HIGH_VALUE_LENGTH'
    end
    object qPartitionsPARTITION_POSITION: TFloatField
      FieldName = 'PARTITION_POSITION'
    end
    object qPartitionsTABLESPACE_NAME: TStringField
      FieldName = 'TABLESPACE_NAME'
      Size = 30
    end
    object qPartitionsPCT_FREE: TFloatField
      FieldName = 'PCT_FREE'
    end
    object qPartitionsPCT_USED: TFloatField
      FieldName = 'PCT_USED'
    end
    object qPartitionsINI_TRANS: TFloatField
      FieldName = 'INI_TRANS'
    end
    object qPartitionsMAX_TRANS: TFloatField
      FieldName = 'MAX_TRANS'
    end
    object qPartitionsINITIAL_EXTENT: TFloatField
      FieldName = 'INITIAL_EXTENT'
    end
    object qPartitionsNEXT_EXTENT: TFloatField
      FieldName = 'NEXT_EXTENT'
    end
    object qPartitionsMIN_EXTENT: TFloatField
      FieldName = 'MIN_EXTENT'
    end
    object qPartitionsMAX_EXTENT: TFloatField
      FieldName = 'MAX_EXTENT'
    end
    object qPartitionsPCT_INCREASE: TFloatField
      FieldName = 'PCT_INCREASE'
    end
    object qPartitionsFREELISTS: TFloatField
      FieldName = 'FREELISTS'
    end
    object qPartitionsFREELIST_GROUPS: TFloatField
      FieldName = 'FREELIST_GROUPS'
    end
    object qPartitionsLOGGING: TStringField
      FieldName = 'LOGGING'
      Size = 7
    end
    object qPartitionsCOMPRESSION: TStringField
      FieldName = 'COMPRESSION'
      Size = 8
    end
    object qPartitionsNUM_ROWS: TFloatField
      FieldName = 'NUM_ROWS'
    end
    object qPartitionsBLOCKS: TFloatField
      FieldName = 'BLOCKS'
    end
    object qPartitionsEMPTY_BLOCKS: TFloatField
      FieldName = 'EMPTY_BLOCKS'
    end
    object qPartitionsAVG_SPACE: TFloatField
      FieldName = 'AVG_SPACE'
    end
    object qPartitionsCHAIN_CNT: TFloatField
      FieldName = 'CHAIN_CNT'
    end
    object qPartitionsAVG_ROW_LEN: TFloatField
      FieldName = 'AVG_ROW_LEN'
    end
    object qPartitionsSAMPLE_SIZE: TFloatField
      FieldName = 'SAMPLE_SIZE'
    end
    object qPartitionsLAST_ANALYZED: TDateTimeField
      FieldName = 'LAST_ANALYZED'
    end
    object qPartitionsBUFFER_POOL: TStringField
      FieldName = 'BUFFER_POOL'
      Size = 7
    end
    object qPartitionsGLOBAL_STATS: TStringField
      FieldName = 'GLOBAL_STATS'
      Size = 3
    end
    object qPartitionsUSER_STATS: TStringField
      FieldName = 'USER_STATS'
      Size = 3
    end
  end
  object qPartitionColumns: TOraQuery
    Left = 593
    Top = 314
  end
  object dsPartitions: TDataSource
    DataSet = qPartitions
    Left = 625
    Top = 282
  end
  object dsPartitionColumns: TDataSource
    DataSet = qPartitionColumns
    Left = 625
    Top = 314
  end
  object qTrigger: TOraQuery
    Left = 593
    Top = 186
  end
  object dsTrigger: TDataSource
    DataSet = qTrigger
    Left = 625
    Top = 186
  end
  object qSubPartitions: TOraQuery
    Left = 593
    Top = 354
  end
  object qSubPartitionColumns: TOraQuery
    Left = 593
    Top = 386
  end
  object dsSubPartitions: TDataSource
    DataSet = qSubPartitions
    Left = 625
    Top = 354
  end
  object dsSubPartitionColumns: TDataSource
    DataSet = qSubPartitionColumns
    Left = 625
    Top = 386
  end
  object qUsed: TOraQuery
    Left = 593
    Top = 418
  end
  object dsUsed: TDataSource
    DataSet = qUsed
    Left = 625
    Top = 418
  end
  object dxBarDBNavigator1: TdxBarDBNavigator
    BarManager = barManager
    CategoryName = 'DB Navigator'
    ConfirmDelete = False
    DataSource = dsTableData
    DBCheckLinks = <>
    VisibleButtons = [dxbnFirst, dxbnPrior, dxbnNext, dxbnLast, dxbnInsert, dxbnDelete, dxbnEdit, dxbnPost, dxbnCancel, dxbnRefresh]
    Left = 17
    Top = 354
  end
  object DataSaveDialog: TSaveDialog
    Filter = 'Txt|*.txt|Excel|*.xls|Html|*.html|Xml|*.xml'
    Left = 16
    Top = 426
  end
  object popData: TPopupMenu
    Left = 49
    Top = 426
    object popDataMultiSelect: TMenuItem
      AutoCheck = True
      Caption = 'Multi Select'
      OnClick = popDataMultiSelectClick
    end
    object popDataPopUpEditor: TMenuItem
      Caption = 'Popup Editor'
    end
    object popDataSaveAs: TMenuItem
      Caption = 'Save As...'
      OnClick = popDataSaveAsClick
    end
    object popDataFindData: TMenuItem
      Caption = 'Find Data...'
      OnClick = popDataFindDataClick
    end
    object popDataDuplicateRow: TMenuItem
      Caption = 'DuplicateRow'
      OnClick = popDataDuplicateRowClick
    end
    object popDataRecordCount: TMenuItem
      Caption = 'Record Count'
      OnClick = popDataRecordCountClick
    end
    object popDataCreateSQL: TMenuItem
      Caption = 'Create SQL for selected rows'
      OnClick = popDataCreateSQLClick
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 48
    Top = 360
    object cxStyle1: TcxStyle
    end
  end
end
