object SequencePropertiesFrm: TSequencePropertiesFrm
  Left = 228
  Top = 122
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'SequencePropertiesFrm'
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
      Width = 132
      Height = 14
      Caption = 'Sequence Description'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object pcSequenceProperties: TcxPageControl
    Left = 0
    Top = 26
    Width = 775
    Height = 480
    ActivePage = tsSequenceDetails
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
    OnPageChanging = pcSequencePropertiesPageChanging
    ClientRectBottom = 480
    ClientRectLeft = 76
    ClientRectRight = 775
    ClientRectTop = 0
    object tsSequenceDetails: TcxTabSheet
      Caption = 'Properties'
      ImageIndex = 8
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 699
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
        SunkenBorder = False
        UseOwnSunkenBorder = True
      end
      object edtIncrementBy: TcxTextEdit
        Left = 96
        Top = 77
        Properties.ReadOnly = True
        TabOrder = 1
        Width = 121
      end
      object cxLabel1: TcxLabel
        Left = 22
        Top = 76
        Caption = 'Increment by :'
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 33
        Top = 100
        Caption = 'Last Value :'
        Transparent = True
      end
      object edtLastValue: TcxTextEdit
        Left = 96
        Top = 101
        Properties.ReadOnly = True
        TabOrder = 4
        Width = 121
      end
      object cxLabel3: TcxLabel
        Left = 36
        Top = 124
        Caption = 'Min Value :'
        Transparent = True
      end
      object edtMinValue: TcxTextEdit
        Left = 96
        Top = 125
        Properties.ReadOnly = True
        TabOrder = 6
        Width = 121
      end
      object cxLabel4: TcxLabel
        Left = 33
        Top = 148
        Caption = 'Max Value :'
        Transparent = True
      end
      object edtMaxValue: TcxTextEdit
        Left = 96
        Top = 149
        Properties.ReadOnly = True
        TabOrder = 8
        Width = 121
      end
      object cxLabel5: TcxLabel
        Left = 29
        Top = 172
        Caption = 'Cache Size :'
        Transparent = True
      end
      object edtCacheSize: TcxTextEdit
        Left = 96
        Top = 173
        Properties.ReadOnly = True
        TabOrder = 10
        Width = 121
      end
      object cxLabel6: TcxLabel
        Left = 57
        Top = 196
        Caption = 'Cycle :'
        Transparent = True
      end
      object cxLabel7: TcxLabel
        Left = 57
        Top = 223
        Caption = 'Order :'
        Transparent = True
      end
      object edtCycleFlag: TcxTextEdit
        Left = 96
        Top = 197
        Properties.ReadOnly = True
        TabOrder = 13
        Width = 121
      end
      object edtOrderFlag: TcxTextEdit
        Left = 96
        Top = 221
        Properties.ReadOnly = True
        TabOrder = 14
        Width = 121
      end
      object cxLabel8: TcxLabel
        Left = 55
        Top = 52
        Caption = 'Name :'
        Transparent = True
      end
      object edtName: TcxTextEdit
        Left = 96
        Top = 53
        Properties.ReadOnly = True
        TabOrder = 16
        Width = 121
      end
    end
    object tsSequenceGrants: TcxTabSheet
      Caption = 'Grants'
      ImageIndex = 6
      object dxBarDockControl4: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 699
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
      end
      object GridGrants: TcxGrid
        Left = 0
        Top = 26
        Width = 699
        Height = 454
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
    object tsSequenceSynonyms: TcxTabSheet
      Caption = 'Synonyms'
      ImageIndex = 7
      object dxBarDockControl6: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 699
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
      end
      object GridSynonyms: TcxGrid
        Left = 0
        Top = 26
        Width = 699
        Height = 454
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
    object tsSequenceUsedBy: TcxTabSheet
      Caption = 'Used By'
      ImageIndex = 12
      object GridUsed: TcxGrid
        Left = 0
        Top = 0
        Width = 699
        Height = 480
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridUsedDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
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
    object tsSequenceScripts: TcxTabSheet
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
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 461
        FloatTop = 321
        FloatClientWidth = 23
        FloatClientHeight = 164
        ItemLinks = <
          item
            Item = bbtnCreateSequence
            Visible = True
          end
          item
            Item = bbtnAlterSequence
            Visible = True
          end
          item
            Item = bbtnDropSequence
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshSequence
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
        Caption = 'barGrants'
        DockControl = dxBarDockControl4
        DockedDockControl = dxBarDockControl4
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 325
        FloatTop = 225
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bbtnGrantPrivileges
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshGrant
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
        Caption = 'barSynonym'
        DockControl = dxBarDockControl6
        DockedDockControl = dxBarDockControl6
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
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
      'grants'
      'synonym')
    Categories.ItemsVisibles = (
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True)
    Images = dmGenel.imList
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 8
    Top = 162
    DockControlHeights = (
      0
      0
      0
      0)
    object bbtnCreateSequence: TdxBarButton
      Caption = 'Create Sequence'
      Category = 1
      Hint = 'Create Sequence'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = bbtnCreateSequenceClick
    end
    object bbtnDropSequence: TdxBarButton
      Caption = 'Drop Sequence'
      Category = 1
      Hint = 'Drop Sequence'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropSequenceClick
    end
    object bbtnAlterSequence: TdxBarButton
      Caption = 'Alter Sequence'
      Category = 1
      Hint = 'Alter Sequence'
      Visible = ivAlways
      ImageIndex = 101
      OnClick = bbtnAlterSequenceClick
    end
    object bbtnRefreshSequence: TdxBarButton
      Caption = 'Refresh Sequence'
      Category = 1
      Hint = 'Refresh Sequence'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshSequenceClick
    end
    object bbtnGrantPrivileges: TdxBarButton
      Caption = 'Grant Privileges'
      Category = 2
      Hint = 'Grant Privileges'
      Visible = ivAlways
      ImageIndex = 99
      OnClick = bbtnGrantPrivilegesClick
    end
    object bbtnRefreshGrant: TdxBarButton
      Caption = 'Refresh Grant'
      Category = 2
      Hint = 'Refresh Grant'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshGrantClick
    end
    object bbtnCreateSynonym: TdxBarButton
      Caption = 'Create Synonym'
      Category = 3
      Hint = 'Create Synonym'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = bbtnCreateSynonymClick
    end
    object bbtnDropSynonym: TdxBarButton
      Caption = 'Drop Synonym'
      Category = 3
      Hint = 'Drop Synonym'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropSynonymClick
    end
    object bbtnRefreshSynonym: TdxBarButton
      Caption = 'Refresh Synonym'
      Category = 3
      Hint = 'Refresh Synonym'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshSynonymClick
    end
  end
  object dsGrants: TDataSource
    DataSet = vtGrants
    Left = 41
    Top = 226
  end
  object dsSynonyms: TDataSource
    DataSet = vtSynonyms
    Left = 41
    Top = 258
  end
  object dsUsed: TDataSource
    DataSet = vtUsedBy
    Left = 41
    Top = 290
  end
  object vtSynonyms: TVirtualTable
    Left = 12
    Top = 258
    Data = {01000000000000000000}
  end
  object vtGrants: TVirtualTable
    Left = 8
    Top = 226
    Data = {01000000000000000000}
  end
  object vtUsedBy: TVirtualTable
    Left = 12
    Top = 290
    Data = {01000000000000000000}
  end
end
