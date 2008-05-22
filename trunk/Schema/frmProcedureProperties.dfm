object ProcedurePropertiesFrm: TProcedurePropertiesFrm
  Left = 231
  Top = 204
  BorderStyle = bsNone
  Caption = 'ProcedurePropertiesFrm'
  ClientHeight = 509
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pcProcedureProperties: TcxPageControl
    Left = 0
    Top = 26
    Width = 775
    Height = 483
    ActivePage = tsProcedureCode
    Align = alClient
    Color = clWhite
    LookAndFeel.Kind = lfOffice11
    ParentColor = False
    Rotate = True
    Style = 8
    TabOrder = 0
    TabPosition = tpLeft
    TabSlants.Kind = skCutCorner
    TabWidth = 75
    OnPageChanging = pcProcedurePropertiesPageChanging
    ClientRectBottom = 483
    ClientRectLeft = 81
    ClientRectRight = 775
    ClientRectTop = 0
    object tsProcedureCode: TcxTabSheet
      Caption = 'Code'
      ImageIndex = 8
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 694
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
        SunkenBorder = False
        UseOwnSunkenBorder = True
      end
      object cxGroupBox1: TcxGroupBox
        Left = 0
        Top = 26
        Align = alTop
        TabOrder = 1
        Height = 45
        Width = 694
        object cxLabel1: TcxLabel
          Left = 11
          Top = 16
          Caption = 'Name :'
          Transparent = True
        end
        object edtName: TcxTextEdit
          Left = 48
          Top = 15
          Properties.ReadOnly = True
          TabOrder = 1
          Text = 'edtName'
          Width = 209
        end
        object cxLabel2: TcxLabel
          Left = 306
          Top = 16
          Caption = 'Owner :'
          Transparent = True
        end
        object edtOwner: TcxTextEdit
          Left = 352
          Top = 15
          Properties.ReadOnly = True
          TabOrder = 3
          Text = 'cxTextEdit1'
          Width = 153
        end
      end
      object redtCode: TcxRichEdit
        Left = 0
        Top = 71
        Align = alClient
        ParentFont = False
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Lines.Strings = (
          'CREATE OR REPLACE PACKAGE SH.DENEME2'
          'AS '
          '    '
          '    END DENEME2;2'
          '/'
          'CREATE OR REPLACE PACKAGE BODY SH.DENEME2'
          'AS 2'
          '    '
          '    END DENEME2;'
          '/')
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -13
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 2
        Height = 308
        Width = 694
      end
      object cxSplitter1: TcxSplitter
        Left = 0
        Top = 379
        Width = 694
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = lviewError
      end
      object lviewError: TcxListView
        Left = 0
        Top = 387
        Width = 694
        Height = 96
        Align = alBottom
        Columns = <
          item
            Caption = 'Line'
            MinWidth = 50
          end
          item
            Caption = 'Column'
            MinWidth = 50
          end
          item
            AutoSize = True
            Caption = 'Error Message'
            MinWidth = 300
          end>
        ReadOnly = True
        RowSelect = True
        Style.BorderStyle = cbsUltraFlat
        Style.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.Kind = lfOffice11
        TabOrder = 4
        ViewStyle = vsReport
      end
    end
    object tsBody: TcxTabSheet
      Caption = 'Body'
      ImageIndex = 1
      object redtBodyCode: TcxRichEdit
        Left = 0
        Top = 0
        Align = alClient
        ParentFont = False
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Lines.Strings = (
          'CREATE OR REPLACE PACKAGE SH.DENEME2'
          'AS '
          '    '
          '    END DENEME2;2'
          '/'
          'CREATE OR REPLACE PACKAGE BODY SH.DENEME2'
          'AS 2'
          '    '
          '    END DENEME2;'
          '/')
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -13
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 379
        Width = 694
      end
      object cxSplitter2: TcxSplitter
        Left = 0
        Top = 379
        Width = 694
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = lviewBodyError
      end
      object lviewBodyError: TcxListView
        Left = 0
        Top = 387
        Width = 694
        Height = 96
        Align = alBottom
        Columns = <
          item
            Caption = 'Line'
            MinWidth = 50
          end
          item
            Caption = 'Column'
            MinWidth = 50
          end
          item
            AutoSize = True
            Caption = 'Error Message'
            MinWidth = 300
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
    object tsArguments: TcxTabSheet
      Caption = 'Arguments'
      ImageIndex = 5
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 694
        Height = 483
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object cxGridDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsArguments
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
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'Position'
            DataBinding.FieldName = 'sequence'
            Width = 61
          end
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'Parameter'
            DataBinding.FieldName = 'ARGUMENT_NAME'
            Width = 133
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Data Type'
            DataBinding.FieldName = 'DATA_TYPE'
            Width = 117
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'In/Out'
            DataBinding.FieldName = 'IN_OUT'
            Width = 65
          end
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = 'Length'
            DataBinding.FieldName = 'DATA_SIZE'
            Width = 84
          end
          object cxGridDBTableView1Column1: TcxGridDBColumn
            Caption = 'Default Value'
            DataBinding.FieldName = 'DEFAULT_VALUE'
            Width = 237
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
    object tsProcedureGrants: TcxTabSheet
      Caption = 'Grants'
      ImageIndex = 6
      object dxBarDockControl4: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 694
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
      end
      object GridGrants: TcxGrid
        Left = 0
        Top = 26
        Width = 694
        Height = 457
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
    object tsProcedureSynonyms: TcxTabSheet
      Caption = 'Synonyms'
      ImageIndex = 7
      object dxBarDockControl6: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 694
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
      end
      object GridSynonyms: TcxGrid
        Left = 0
        Top = 26
        Width = 694
        Height = 457
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
    object tsProcedureUsedBy: TcxTabSheet
      Caption = 'Used By'
      ImageIndex = 12
      object GridUsed: TcxGrid
        Left = 0
        Top = 0
        Width = 694
        Height = 483
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
    object tsProcedureUses: TcxTabSheet
      Caption = 'Uses'
      ImageIndex = 7
      object GridUses: TcxGrid
        Left = 0
        Top = 0
        Width = 694
        Height = 483
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
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
      Width = 135
      Height = 14
      Caption = 'Procedure Description'
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
            Item = btnCreateProc
            Visible = True
          end
          item
            Item = btnAlterProc
            Visible = True
          end
          item
            Item = btnDropProc
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnCompileProc
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnExecPro
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnRefreshProc
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
      'grant'
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
    LookAndFeel.Kind = lfStandard
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    Style = bmsOffice11
    UseSystemFont = True
    Left = 12
    Top = 186
    DockControlHeights = (
      0
      0
      0
      0)
    object btnCreateProc: TdxBarButton
      Caption = 'Create Procedure'
      Category = 1
      Hint = 'Create Procedure'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = btnCreateProcClick
    end
    object btnAlterProc: TdxBarButton
      Caption = 'Alter Procedure'
      Category = 1
      Hint = 'Alter Procedure'
      Visible = ivAlways
      ImageIndex = 101
      OnClick = btnAlterProcClick
    end
    object btnDropProc: TdxBarButton
      Caption = 'Drop Procedure'
      Category = 1
      Hint = 'Drop Procedure'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = btnDropProcClick
    end
    object btnCompileProc: TdxBarButton
      Caption = 'Compile Procedure'
      Category = 1
      Hint = 'Compile Procedure'
      Visible = ivAlways
      ImageIndex = 86
      OnClick = btnCompileProcClick
    end
    object btnRefreshProc: TdxBarButton
      Caption = 'Refresh Procedure'
      Category = 1
      Hint = 'Refresh Procedure'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnRefreshProcClick
    end
    object btnPrivilegesView: TdxBarButton
      Caption = 'Privileges View'
      Category = 1
      Hint = 'Privileges View'
      Visible = ivAlways
      ImageIndex = 99
    end
    object bbtnGrantPrivileges: TdxBarButton
      Caption = 'Grant Privileges'
      Category = 2
      Hint = 'Grant Privileges'
      Visible = ivAlways
      ImageIndex = 99
      OnClick = bbtnGrantPrivilegesClick
    end
    object btnRefreshGrants: TdxBarButton
      Caption = 'Refresh Grant Privileges'
      Category = 2
      Hint = 'Refresh Grant Privileges'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = btnRefreshGrantsClick
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
    object bbtnExecPro: TdxBarButton
      Caption = 'Execute Procedure'
      Category = 1
      Hint = 'Execute Procedure'
      Visible = ivAlways
      ImageIndex = 78
      OnClick = bbtnExecProClick
    end
  end
  object dsGrants: TDataSource
    DataSet = vtGrants
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
  object vtGrants: TVirtualTable
    Left = 604
    Top = 202
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
  object vtArguments: TVirtualTable
    Left = 604
    Top = 170
    Data = {01000000000000000000}
  end
  object dsArguments: TDataSource
    DataSet = vtArguments
    Left = 641
    Top = 170
  end
end
