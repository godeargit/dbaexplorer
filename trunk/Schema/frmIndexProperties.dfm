object IndexPropertiesFrm: TIndexPropertiesFrm
  Left = 159
  Top = 84
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'IndexPropertiesFrm'
  ClientHeight = 506
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object imgToolBar: TImage
      Left = 0
      Top = 0
      Width = 775
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
      Width = 108
      Height = 14
      Caption = 'Index Description'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object pcIndexProperties: TcxPageControl
    Left = 0
    Top = 26
    Width = 775
    Height = 480
    ActivePage = tsProperties
    Align = alClient
    Color = clWhite
    LookAndFeel.Kind = lfOffice11
    ParentColor = False
    Rotate = True
    Style = 9
    TabOrder = 1
    TabPosition = tpLeft
    TabSlants.Kind = skCutCorner
    TabWidth = 75
    ClientRectBottom = 480
    ClientRectLeft = 76
    ClientRectRight = 775
    ClientRectTop = 0
    object tsProperties: TcxTabSheet
      Caption = 'Properties'
      ImageIndex = 6
      object dxBarDockControl4: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 699
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
      end
      object pcTableIndex: TcxPageControl
        Left = 0
        Top = 256
        Width = 699
        Height = 224
        ActivePage = cxTabSheet1
        Align = alBottom
        Style = 10
        TabOrder = 1
        ClientRectBottom = 224
        ClientRectRight = 699
        ClientRectTop = 19
        object cxTabSheet1: TcxTabSheet
          Caption = 'Index'
          ImageIndex = 0
          object Label3: TLabel
            Left = 8
            Top = 22
            Width = 63
            Height = 13
            Caption = 'Index Name :'
            Transparent = True
          end
          object Label43: TLabel
            Left = 11
            Top = 43
            Width = 59
            Height = 13
            Caption = 'Index Type :'
            Transparent = True
          end
          object Label37: TLabel
            Left = 384
            Top = 33
            Width = 39
            Height = 13
            Caption = 'columns'
            Transparent = True
          end
          object Label44: TLabel
            Left = 29
            Top = 66
            Width = 44
            Height = 13
            Caption = 'Logging :'
            Transparent = True
          end
          object lblPartition: TLabel
            Left = 15
            Top = 153
            Width = 79
            Height = 13
            Caption = 'Partition Clause :'
            Transparent = True
            Visible = False
          end
          object cgroupParalel: TcxGroupBox
            Left = 266
            Top = 89
            Caption = 'Paralel'
            TabOrder = 0
            Transparent = True
            Height = 53
            Width = 183
            object Label22: TLabel
              Left = 117
              Top = 12
              Width = 46
              Height = 13
              Caption = 'Instances'
              Transparent = True
            end
            object Label23: TLabel
              Left = 71
              Top = 12
              Width = 35
              Height = 13
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
            Top = 19
            Properties.ReadOnly = True
            TabOrder = 1
            Text = 'edtIndexName'
            Width = 161
          end
          object edtIndexType: TcxTextEdit
            Left = 80
            Top = 40
            Properties.ReadOnly = True
            TabOrder = 2
            Text = 'edtIndexType'
            Width = 161
          end
          object rgroupIndexType: TcxRadioGroup
            Left = 12
            Top = 90
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
            Top = 12
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
            Top = 30
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
            Top = 62
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
          object Label28: TLabel
            Left = 24
            Top = 9
            Width = 67
            Height = 13
            Caption = 'Percent Free :'
            Transparent = True
          end
          object Label33: TLabel
            Left = 22
            Top = 29
            Width = 71
            Height = 13
            Caption = 'Percent Used :'
            Transparent = True
          end
          object Label34: TLabel
            Left = 263
            Top = 9
            Width = 60
            Height = 13
            Caption = 'Initial Trans :'
            Transparent = True
          end
          object Label35: TLabel
            Left = 267
            Top = 29
            Width = 56
            Height = 13
            Caption = 'Max Trans :'
            Transparent = True
          end
          object Label36: TLabel
            Left = 27
            Top = 49
            Width = 67
            Height = 13
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
            object Label24: TLabel
              Left = 20
              Top = 19
              Width = 66
              Height = 13
              Caption = 'Initial Extend :'
              Transparent = True
            end
            object Label25: TLabel
              Left = 23
              Top = 40
              Width = 64
              Height = 13
              Caption = 'Next Extend :'
              Transparent = True
            end
            object Label26: TLabel
              Left = 257
              Top = 19
              Width = 61
              Height = 13
              Caption = 'Min Extents :'
              Transparent = True
            end
            object Label27: TLabel
              Left = 253
              Top = 41
              Width = 64
              Height = 13
              Caption = 'Max Extents :'
              Transparent = True
            end
            object Label29: TLabel
              Left = 23
              Top = 62
              Width = 66
              Height = 13
              Caption = 'Pct Increase :'
              Transparent = True
            end
            object Label30: TLabel
              Left = 272
              Top = 63
              Width = 46
              Height = 13
              Caption = 'Free List :'
              Transparent = True
            end
            object Label31: TLabel
              Left = 254
              Top = 86
              Width = 64
              Height = 13
              Caption = 'Free Groups :'
              Transparent = True
            end
            object Label32: TLabel
              Left = 30
              Top = 85
              Width = 58
              Height = 13
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
      end
      object cxSplitter1: TcxSplitter
        Left = 0
        Top = 248
        Width = 699
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = pcTableIndex
      end
      object GridIndex: TcxGrid
        Left = 0
        Top = 26
        Width = 699
        Height = 222
        Align = alClient
        TabOrder = 3
        LookAndFeel.Kind = lfOffice11
        object GridIndexDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsIndexColumns
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
    end
    object tsPartitions: TcxTabSheet
      Caption = 'Partitions'
      ImageIndex = 4
      object GridPartitiones: TcxGrid
        Left = 0
        Top = 0
        Width = 699
        Height = 480
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridPartitionesDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsIndexPartitions
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
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
    end
    object tsViewScripts: TcxTabSheet
      Caption = 'Scripts'
      ImageIndex = 5
      object redtDDL: TcxRichEdit
        Left = 0
        Top = 0
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
        Height = 480
        Width = 699
      end
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
        Caption = 'Properties'
        DockControl = dxBarDockControl4
        DockedDockControl = dxBarDockControl4
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 461
        FloatTop = 321
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bbtnCreateIndex
            Visible = True
          end
          item
            Item = bbtnAlterIndex
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
        Name = 'barProperties'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default'
      'properties')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    Images = dmGenel.imList
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 48
    Top = 138
    DockControlHeights = (
      0
      0
      0
      0)
    object bbtnCreateIndex: TdxBarButton
      Caption = 'Create Index'
      Category = 1
      Hint = 'Create Index'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = bbtnCreateIndexClick
    end
    object bbtnDropIndex: TdxBarButton
      Caption = 'Drop Index'
      Category = 1
      Hint = 'Drop Index'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropIndexClick
    end
    object bbtnAlterIndex: TdxBarButton
      Caption = 'Alter Index'
      Category = 1
      Hint = 'Alter Index'
      Visible = ivAlways
      ImageIndex = 101
      OnClick = bbtnAlterIndexClick
    end
    object bbtnAnalyzeIndex: TdxBarButton
      Caption = 'Analyze Index'
      Category = 1
      Hint = 'Analyze Index'
      Visible = ivAlways
      ImageIndex = 102
      OnClick = bbtnAnalyzeIndexClick
    end
    object bbtnRebuildIndex: TdxBarButton
      Caption = 'Rebuild Index'
      Category = 1
      Hint = 'Rebuild Index'
      Visible = ivAlways
      ImageIndex = 100
      OnClick = bbtnRebuildIndexClick
    end
    object bbtnCoalesceIndex: TdxBarButton
      Caption = 'Coalesce Index'
      Category = 1
      Hint = 'Coalesce Index'
      Visible = ivAlways
      ImageIndex = 87
      OnClick = bbtnCoalesceIndexClick
    end
    object bbtnRefreshIndex: TdxBarButton
      Caption = 'Refresh Index'
      Category = 1
      Hint = 'Refresh Index'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshIndexClick
    end
  end
  object dsIndexes: TDataSource
    DataSet = vIndexes
    Left = 40
    Top = 177
  end
  object vIndexes: TVirtualTable
    Left = 4
    Top = 178
    Data = {01000000000000000000}
  end
  object vIndexColumns: TVirtualTable
    Left = 4
    Top = 210
    Data = {01000000000000000000}
  end
  object dsIndexColumns: TDataSource
    DataSet = vIndexColumns
    Left = 40
    Top = 209
  end
  object vtIndexPartitions: TVirtualTable
    Left = 4
    Top = 242
    Data = {01000000000000000000}
  end
  object dsIndexPartitions: TDataSource
    DataSet = vtIndexPartitions
    Left = 40
    Top = 241
  end
end
