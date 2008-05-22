object ViewPropertiesFrm: TViewPropertiesFrm
  Left = 279
  Top = 144
  BorderStyle = bsNone
  Caption = 'ViewPropertiesFrm'
  ClientHeight = 492
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pcViewProperties: TcxPageControl
    Left = 0
    Top = 26
    Width = 733
    Height = 466
    ActivePage = tsViewDetails
    Align = alClient
    Color = clWhite
    LookAndFeel.Kind = lfUltraFlat
    ParentColor = False
    Rotate = True
    TabOrder = 0
    TabPosition = tpLeft
    TabSlants.Kind = skCutCorner
    TabWidth = 75
    OnPageChanging = pcViewPropertiesPageChanging
    ClientRectBottom = 466
    ClientRectLeft = 81
    ClientRectRight = 733
    ClientRectTop = 0
    object tsViewDetails: TcxTabSheet
      Caption = 'Properties'
      ImageIndex = 8
      object Image2: TImage
        Left = 0
        Top = 81
        Width = 652
        Height = 385
        Align = alClient
        Picture.Data = {
          0A544A504547496D616765C5010000FFD8FFE000104A46494600010200006400
          640000FFEC00114475636B7900010004000000500000FFEE000E41646F626500
          64C000000001FFDB008400020202020202020202020302020203040302020304
          0504040404040506050505050505060607070807070609090A0A09090C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C01030303050405090606090D0B090B0D0F0E0E0E0E
          0F0F0C0C0C0C0C0F0F0C0C0C0C0C0C0F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080320000103011100021101031101FF
          C400570001010101010000000000000000000000000201030901010101000000
          0000000000000000000000010210010101010101000000000000000000000011
          015161121101010100000000000000000000000000001101FFDA000C03010002
          110311003F00F7F013F5AA2500000004FD78090000000000730005835A1CEEF5
          8180000D6A0254AE777A8A368C119458914000118220560833744DF1A58C1582
          50401375A8259004DC6DA48944A83235A1CEEF540004DF46A204AD10001CC000
          1970100000C9BD02E741000008BA0C0000019714425000197144032895A8A000
          039A8000026E744891400000000004FD683FFFD9}
        Stretch = True
      end
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 652
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
        SunkenBorder = False
        UseOwnSunkenBorder = True
      end
      object gridColumn: TcxGrid
        Left = 0
        Top = 81
        Width = 652
        Height = 385
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfStandard
        object gridColumnDB: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsViewColumns
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.GroupByBox = False
          object gridColumnDBCOLUMN_ID: TcxGridDBColumn
            Caption = 'Column ID'
            DataBinding.FieldName = 'COLUMN_ID'
            Width = 58
          end
          object gridColumnDBCOLUMN_NAME: TcxGridDBColumn
            Caption = 'Column Name'
            DataBinding.FieldName = 'COLUMN_NAME'
            Width = 140
          end
          object gridColumnDBDATA_TYPE: TcxGridDBColumn
            Caption = 'Data Type'
            DataBinding.FieldName = 'DATA_TYPE'
            Width = 120
          end
          object gridColumnDBDATA_LENGTH: TcxGridDBColumn
            Caption = 'Length'
            DataBinding.FieldName = 'DATA_LENGTH'
            Width = 54
          end
          object gridColumnDBDATA_PRECISION: TcxGridDBColumn
            Caption = 'Precision'
            DataBinding.FieldName = 'DATA_PRECISION'
            Width = 56
          end
          object gridColumnDBDATA_SCALE: TcxGridDBColumn
            Caption = 'Scale'
            DataBinding.FieldName = 'DATA_SCALE'
            Width = 59
          end
          object gridColumnDBNULLABLE: TcxGridDBColumn
            Caption = 'Nullable'
            DataBinding.FieldName = 'NULLABLE'
            Width = 47
          end
        end
        object gridColumnLevel1: TcxGridLevel
          GridView = gridColumnDB
        end
      end
      object cxGroupBox1: TcxGroupBox
        Left = 0
        Top = 26
        Align = alTop
        TabOrder = 2
        Height = 55
        Width = 652
        object cxLabel1: TcxLabel
          Left = 11
          Top = 22
          Caption = 'View Name :'
          Transparent = True
        end
        object edtViewName: TcxTextEdit
          Left = 80
          Top = 21
          Properties.ReadOnly = True
          TabOrder = 1
          Text = 'edtViewName'
          Width = 145
        end
        object cxLabel2: TcxLabel
          Left = 242
          Top = 22
          Caption = 'Owner :'
          Transparent = True
        end
        object edtOwner: TcxTextEdit
          Left = 288
          Top = 21
          Properties.ReadOnly = True
          TabOrder = 3
          Text = 'cxTextEdit1'
          Width = 121
        end
      end
    end
    object tsViewData: TcxTabSheet
      Caption = 'Data'
      ImageIndex = 4
      object dxBarDockControl3: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 652
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
      end
      object sbData: TdxStatusBar
        Left = 0
        Top = 446
        Width = 652
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
      object GridData: TcxGrid
        Left = 0
        Top = 26
        Width = 652
        Height = 420
        Align = alClient
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        object gridDataView: TcxGridDBTableView
          PopupMenu = popData
          NavigatorButtons.ConfirmDelete = False
          FilterBox.CustomizeDialog = False
          DataController.DataModeController.GridMode = True
          DataController.DataSource = dsViewData
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Appending = True
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          OnColumnHeaderClick = gridDataViewColumnHeaderClick
        end
        object cxGridLevel4: TcxGridLevel
          GridView = gridDataView
        end
      end
    end
    object tsViewGrants: TcxTabSheet
      Caption = 'Grants'
      ImageIndex = 6
      object dxBarDockControl4: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 652
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
      end
      object GridGrants: TcxGrid
        Left = 0
        Top = 26
        Width = 652
        Height = 440
        Align = alClient
        TabOrder = 1
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
    end
    object tsViewTrigers: TcxTabSheet
      Caption = 'Trigers'
      ImageIndex = 3
      object cxSplitter2: TcxSplitter
        Left = 0
        Top = 227
        Width = 652
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salTop
        Control = GridTrigers
      end
      object editTriggers: TcxRichEdit
        Left = 0
        Top = 235
        Align = alClient
        Properties.ScrollBars = ssBoth
        Style.BorderStyle = ebsUltraFlat
        Style.Shadow = False
        TabOrder = 1
        Height = 231
        Width = 652
      end
      object GridTrigers: TcxGrid
        Left = 0
        Top = 26
        Width = 652
        Height = 201
        Align = alTop
        TabOrder = 2
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
      object dxBarDockControl5: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 652
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
      end
    end
    object tsViewSynonyms: TcxTabSheet
      Caption = 'Synonyms'
      ImageIndex = 7
      object dxBarDockControl6: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 652
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
      end
      object GridSynonyms: TcxGrid
        Left = 0
        Top = 26
        Width = 652
        Height = 440
        Align = alClient
        TabOrder = 1
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
    end
    object tsViewUsedBy: TcxTabSheet
      Caption = 'Used By'
      ImageIndex = 12
      object GridUsed: TcxGrid
        Left = 0
        Top = 0
        Width = 652
        Height = 466
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridUsedDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
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
    object tsViewUses: TcxTabSheet
      Caption = 'Uses'
      ImageIndex = 7
      object GridUses: TcxGrid
        Left = 0
        Top = 0
        Width = 652
        Height = 466
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridUsesDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsUses
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
          object GridUsesDBTableView1Column1: TcxGridDBColumn
            Caption = 'Owner'
            DataBinding.FieldName = 'OWNER'
            Width = 120
          end
          object GridUsesDBTableView1Column2: TcxGridDBColumn
            Caption = 'Type'
            DataBinding.FieldName = 'object_type'
            Width = 107
          end
          object GridUsesDBTableView1Column3: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'object_name'
            Width = 149
          end
          object GridUsesDBTableView1Column4: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'STATUS'
            Width = 104
          end
          object GridUsesDBTableView1Column5: TcxGridDBColumn
            Caption = 'Object ID'
            DataBinding.FieldName = 'object_id'
            Width = 148
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = GridUsesDBTableView1
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
        Height = 466
        Width = 652
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 733
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object imgToolBar: TImage
      Left = 0
      Top = 0
      Width = 733
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
      Width = 102
      Height = 14
      Caption = 'View Description'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object dxBarManager1: TdxBarManager
    AllowCallFromAnotherForm = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'barProperties'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 383
        FloatTop = 236
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnCreateView
            Visible = True
          end
          item
            Item = btnAlterView
            Visible = True
          end
          item
            Item = btnDropView
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnCompileView
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnRefreshView
            Visible = True
          end>
        Name = 'barProperties'
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
        FloatLeft = 382
        FloatTop = 377
        FloatClientWidth = 305
        FloatClientHeight = 47
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
            Item = dxBarDBNavRefresh1
            Visible = True
          end
          item
            BeginGroup = True
            Item = edtDataFilter
            UserDefine = [udWidth]
            UserWidth = 244
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
        Caption = 'barGrants'
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
            Item = bbtnGrantPrivileges
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnRefreshGrants
            Visible = True
          end>
        Name = 'barGrants'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barTriggers'
        DockControl = dxBarDockControl5
        DockedDockControl = dxBarDockControl5
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 373
        FloatTop = 299
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
        Name = 'barTriggers'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'barSynonym'
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
      end>
    Categories.Strings = (
      'Default'
      'properties'
      'DB Navigator'
      'grant'
      'triggers'
      'synonym')
    Categories.ItemsVisibles = (
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
      True)
    Images = dmGenel.imList
    LookAndFeel.Kind = lfStandard
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    Style = bmsStandard
    UseSystemFont = True
    Left = 4
    Top = 282
    DockControlHeights = (
      0
      0
      0
      0)
    object btnCreateView: TdxBarButton
      Caption = 'Create View'
      Category = 1
      Hint = 'Create View'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = btnCreateViewClick
    end
    object btnAlterView: TdxBarButton
      Caption = 'Alter View'
      Category = 1
      Hint = 'Alter View'
      Visible = ivAlways
      ImageIndex = 101
      OnClick = btnAlterViewClick
    end
    object btnDropView: TdxBarButton
      Caption = 'Drop View'
      Category = 1
      Hint = 'Drop View'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = btnDropViewClick
    end
    object btnCompileView: TdxBarButton
      Caption = 'Compile View'
      Category = 1
      Hint = 'Compile View'
      Visible = ivAlways
      ImageIndex = 86
      OnClick = btnCompileViewClick
    end
    object btnRefreshView: TdxBarButton
      Caption = 'Refresh View'
      Category = 1
      Hint = 'Refresh View'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnRefreshViewClick
    end
    object btnPrivilegesView: TdxBarButton
      Caption = 'Privileges View'
      Category = 1
      Hint = 'Privileges View'
      Visible = ivAlways
      ImageIndex = 99
    end
    object dxBarDBNavFirst1: TdxBarDBNavButton
      Caption = 'First'
      Category = 2
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
      Category = 2
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
      Category = 2
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
      Category = 2
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
    object dxBarDBNavRefresh1: TdxBarDBNavButton
      Caption = 'Refresh'
      Category = 2
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
    object edtDataFilter: TdxBarEdit
      Caption = 'Data Filter'
      Category = 2
      Hint = 'where column_name = value'
      Visible = ivAlways
      Text = 'Enter where clause'
      OnEnter = edtDataFilterEnter
      OnExit = edtDataFilterExit
      OnKeyDown = edtDataFilterKeyDown
      ShowCaption = True
      Width = 100
    end
    object bbtnGrantPrivileges: TdxBarButton
      Caption = 'Grant Privileges'
      Category = 3
      Hint = 'Grant Privileges'
      Visible = ivAlways
      ImageIndex = 99
      OnClick = bbtnGrantPrivilegesClick
    end
    object btnRefreshGrants: TdxBarButton
      Caption = 'Refresh Grant Privileges'
      Category = 3
      Hint = 'Refresh Grant Privileges'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnRefreshGrantsClick
    end
    object bbtnCreateTrigger: TdxBarButton
      Caption = 'Create Trigger'
      Category = 4
      Hint = 'Create Trigger'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = bbtnCreateTriggerClick
    end
    object bbtnAlterTrigger: TdxBarButton
      Caption = 'Alter Trigger'
      Category = 4
      Hint = 'Alter Trigger'
      Visible = ivAlways
      ImageIndex = 101
      OnClick = bbtnAlterTriggerClick
    end
    object bbtnDropTrigger: TdxBarButton
      Caption = 'Drop Trigger'
      Category = 4
      Hint = 'Drop Trigger'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropTriggerClick
    end
    object bbtnEnableTrigger: TdxBarButton
      Caption = 'Enable Trigger'
      Category = 4
      Hint = 'Enable Trigger'
      Visible = ivAlways
      ImageIndex = 89
      OnClick = bbtnEnableTriggerClick
    end
    object bbtnDisableTrigger: TdxBarButton
      Caption = 'Disable Trigger'
      Category = 4
      Hint = 'Disable Trigger'
      Visible = ivAlways
      ImageIndex = 91
      OnClick = bbtnDisableTriggerClick
    end
    object bbtnCompileTrigger: TdxBarButton
      Caption = 'Compile Trigger'
      Category = 4
      Hint = 'Compile Trigger'
      Visible = ivAlways
      ImageIndex = 86
      OnClick = bbtnCompileTriggerClick
    end
    object bbtnRefreshTrigger: TdxBarButton
      Caption = 'Refresh Trigger'
      Category = 4
      Hint = 'Refresh Trigger'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshTriggerClick
    end
    object bbtnCreateSynonym: TdxBarButton
      Caption = 'Create Synonym'
      Category = 5
      Hint = 'Create Synonym'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = bbtnCreateSynonymClick
    end
    object bbtnDropSynonym: TdxBarButton
      Caption = 'Drop Synonym'
      Category = 5
      Hint = 'Drop Synonym'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropSynonymClick
    end
    object bbtnRefreshSynonym: TdxBarButton
      Caption = 'Refresh Synonym'
      Category = 5
      Hint = 'Refresh Synonym'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshSynonymClick
    end
    object bbtnEnableAllTriggers: TdxBarButton
      Caption = 'Enable All Triggers'
      Category = 4
      Hint = 'Enable All Triggers'
      Visible = ivAlways
      ImageIndex = 89
      OnClick = bbtnEnableAllTriggersClick
    end
    object bbtnDisableAllTriggers: TdxBarButton
      Caption = 'Disable All Triggers'
      Category = 4
      Hint = 'Disable All Triggers'
      Visible = ivAlways
      ImageIndex = 91
      OnClick = bbtnDisableAllTriggersClick
    end
  end
  object dsViewColumns: TDataSource
    DataSet = vtViewColumns
    Left = 641
    Top = 106
  end
  object dxBarDBNavigator1: TdxBarDBNavigator
    BarManager = dxBarManager1
    CategoryName = 'DB Navigator'
    ConfirmDelete = False
    DataSource = dsViewData
    DBCheckLinks = <>
    VisibleButtons = [dxbnFirst, dxbnPrior, dxbnNext, dxbnLast, dxbnRefresh]
    Left = 33
    Top = 282
  end
  object qViewData: TOraQuery
    SQLInsert.Strings = (
      'insert into alp values (:c1, :c2)')
    SQLUpdate.Strings = (
      'update alp set c1= :c1')
    FetchRows = 500
    CachedUpdates = True
    Left = 608
    Top = 137
  end
  object dsViewData: TDataSource
    DataSet = qViewData
    OnStateChange = dsViewDataStateChange
    OnDataChange = dsViewDataDataChange
    Left = 641
    Top = 137
  end
  object popData: TPopupMenu
    Left = 33
    Top = 314
    object popDataMultiSelect: TMenuItem
      AutoCheck = True
      Caption = 'Multi Select'
      OnClick = popDataMultiSelectClick
    end
    object popDataSaveAs: TMenuItem
      Caption = 'Save As...'
      OnClick = popDataSaveAsClick
    end
    object popDataFindData: TMenuItem
      Caption = 'Find Data...'
      OnClick = popDataFindDataClick
    end
    object popDataRecordCount: TMenuItem
      Caption = 'Record Count'
      OnClick = popDataRecordCountClick
    end
  end
  object DataSaveDialog: TSaveDialog
    Filter = 'Txt|*.txt|Excel|*.xls|Html|*.html|Xml|*.xml'
    Left = 4
    Top = 314
  end
  object dsGrants: TDataSource
    DataSet = vtGrants
    Left = 641
    Top = 170
  end
  object qTrigger: TOraQuery
    Left = 609
    Top = 202
  end
  object dsTrigger: TDataSource
    DataSet = qTrigger
    Left = 641
    Top = 202
  end
  object dsSynonyms: TDataSource
    DataSet = vtSynonyms
    Left = 641
    Top = 234
  end
  object dsUsed: TDataSource
    DataSet = vtUsed
    Left = 641
    Top = 266
  end
  object dsUses: TDataSource
    DataSet = vtUses
    Left = 641
    Top = 298
  end
  object vtViewColumns: TVirtualTable
    Left = 604
    Top = 106
    Data = {01000000000000000000}
  end
  object vtGrants: TVirtualTable
    Left = 612
    Top = 170
    Data = {01000000000000000000}
  end
  object vtSynonyms: TVirtualTable
    Left = 604
    Top = 234
    Data = {01000000000000000000}
  end
  object vtUsed: TVirtualTable
    Left = 604
    Top = 266
    Data = {01000000000000000000}
  end
  object vtUses: TVirtualTable
    Left = 604
    Top = 298
    Data = {01000000000000000000}
  end
end
