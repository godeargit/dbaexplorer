object MaterializedViewLogDetailFrm: TMaterializedViewLogDetailFrm
  Left = 313
  Top = 77
  Width = 548
  Height = 518
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Create Materialized View Log'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 443
    Width = 540
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object btnExecute: TcxButton
      Left = 10
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 0
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnCancel: TcxButton
      Left = 90
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object pc: TcxPageControl
    Left = 0
    Top = 0
    Width = 540
    Height = 443
    ActivePage = tsView
    Align = alClient
    Color = clWhite
    ParentColor = False
    Rotate = True
    Style = 9
    TabOrder = 1
    TabPosition = tpLeft
    TabWidth = 80
    OnPageChanging = pcPageChanging
    ClientRectBottom = 443
    ClientRectLeft = 81
    ClientRectRight = 540
    ClientRectTop = 0
    object tsView: TcxTabSheet
      Caption = 'View Log'
      ImageIndex = 0
      object Label2: TLabel
        Left = 10
        Top = 42
        Width = 68
        Height = 13
        Caption = 'Master Table :'
        Transparent = True
      end
      object Label1: TLabel
        Left = 35
        Top = 19
        Width = 45
        Height = 13
        Caption = 'Schema :'
        Transparent = True
      end
      object Label3: TLabel
        Left = 10
        Top = 208
        Width = 114
        Height = 13
        Caption = 'Available Filter Columns '
        Transparent = True
      end
      object Label4: TLabel
        Left = 243
        Top = 208
        Width = 113
        Height = 13
        Caption = 'Selected Filter Columns '
        Transparent = True
      end
      object sbtnAddIndex: TSpeedButton
        Left = 216
        Top = 246
        Width = 23
        Height = 22
        Caption = '>'
        OnClick = sbtnAddIndexClick
      end
      object sbtnRemoveIndex: TSpeedButton
        Left = 216
        Top = 294
        Width = 23
        Height = 22
        Caption = '<'
        OnClick = sbtnRemoveIndexClick
      end
      object sbtnAddAllIndex: TSpeedButton
        Left = 216
        Top = 270
        Width = 23
        Height = 22
        Caption = '>>'
        OnClick = sbtnAddAllIndexClick
      end
      object sbtnRemoveAllIndex: TSpeedButton
        Left = 216
        Top = 318
        Width = 23
        Height = 22
        Caption = '<<'
        OnClick = sbtnRemoveAllIndexClick
      end
      object lcViewSchema: TcxLookupComboBox
        Left = 85
        Top = 15
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'USERNAME'
        Properties.ListColumns = <
          item
            FieldName = 'USERNAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmGenel.dsSchema
        Properties.OnChange = lcViewSchemaPropertiesChange
        Style.Shadow = False
        TabOrder = 0
        Width = 188
      end
      object lcMasterTable: TcxLookupComboBox
        Left = 85
        Top = 39
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'TABLE_NAME'
        Properties.ListColumns = <
          item
            Caption = 'TABLE_NAME'
            FieldName = 'TABLE_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsTables
        Properties.OnChange = lcMasterTablePropertiesChange
        Style.Shadow = False
        TabOrder = 1
        Width = 188
      end
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 142
        Caption = 'With'
        TabOrder = 2
        Transparent = True
        Height = 54
        Width = 436
        object chkRowId: TcxCheckBox
          Left = 17
          Top = 22
          Caption = 'Row ID '
          TabOrder = 0
          Transparent = True
          Width = 88
        end
        object chkObjectId: TcxCheckBox
          Left = 105
          Top = 22
          Caption = 'Object ID'
          TabOrder = 1
          Transparent = True
          Width = 96
        end
        object chkPrimaryKey: TcxCheckBox
          Left = 217
          Top = 21
          Caption = 'Primary Key'
          TabOrder = 2
          Transparent = True
          Width = 96
        end
        object chkSequence: TcxCheckBox
          Left = 329
          Top = 20
          Caption = 'Sequence'
          TabOrder = 3
          Transparent = True
          Width = 96
        end
      end
      object chkParalel: TcxCheckBox
        Left = 16
        Top = 88
        Caption = 'Paralel'
        Properties.OnChange = chkParalelPropertiesChange
        TabOrder = 3
        Transparent = True
        Width = 56
      end
      object edtParalelDegree: TcxMaskEdit
        Left = 76
        Top = 88
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        TabOrder = 4
        Text = '0'
        Width = 41
      end
      object chkEnableRowMovement: TcxCheckBox
        Left = 16
        Top = 110
        Caption = 'Enable Row Movement'
        TabOrder = 5
        Transparent = True
        Width = 145
      end
      object cxLabel7: TcxLabel
        Left = 226
        Top = 87
        Caption = 'New Values :'
        ParentFont = False
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cbNewValues: TcxComboBox
        Left = 299
        Top = 85
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          ''
          'Including'
          'Excluding')
        TabOrder = 7
        Width = 121
      end
      object gridTableColums: TcxGrid
        Left = 9
        Top = 224
        Width = 202
        Height = 211
        TabOrder = 8
        LookAndFeel.Kind = lfOffice11
        object gridTableColumsDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsAvailableColumns
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          object gridTableColumsDBTableView1COLUMN_NAME: TcxGridDBColumn
            Caption = 'Table Columns'
            DataBinding.FieldName = 'COLUMN_NAME'
            Width = 120
          end
        end
        object gridTableColumsLevel1: TcxGridLevel
          GridView = gridTableColumsDBTableView1
        end
      end
      object cxGrid1: TcxGrid
        Left = 245
        Top = 224
        Width = 202
        Height = 211
        TabOrder = 9
        LookAndFeel.Kind = lfOffice11
        object cxGridDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsSelectedColumns
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'Table Columns'
            DataBinding.FieldName = 'COLUMN_NAME'
            Width = 120
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
    object tsStorage: TcxTabSheet
      Caption = 'Storage'
      ImageIndex = 0
      object gbStorageClause: TcxGroupBox
        Left = 7
        Top = 104
        Caption = 'Storage Clause'
        TabOrder = 0
        Transparent = True
        Height = 119
        Width = 443
        object Label11: TLabel
          Left = 20
          Top = 21
          Width = 66
          Height = 13
          Caption = 'Initial Extend :'
          Transparent = True
        end
        object Label12: TLabel
          Left = 23
          Top = 42
          Width = 64
          Height = 13
          Caption = 'Next Extend :'
          Transparent = True
        end
        object Label13: TLabel
          Left = 257
          Top = 21
          Width = 61
          Height = 13
          Caption = 'Min Extents :'
          Transparent = True
        end
        object Label14: TLabel
          Left = 253
          Top = 43
          Width = 64
          Height = 13
          Caption = 'Max Extents :'
          Transparent = True
        end
        object Label5: TLabel
          Left = 23
          Top = 64
          Width = 66
          Height = 13
          Caption = 'Pct Increase :'
          Transparent = True
        end
        object Label6: TLabel
          Left = 272
          Top = 65
          Width = 46
          Height = 13
          Caption = 'Free List :'
          Transparent = True
        end
        object Label16: TLabel
          Left = 254
          Top = 88
          Width = 64
          Height = 13
          Caption = 'Free Groups :'
          Transparent = True
        end
        object Label17: TLabel
          Left = 30
          Top = 87
          Width = 58
          Height = 13
          Caption = 'Buffer Pool :'
          Transparent = True
        end
        object edtInitialExtend: TcxMaskEdit
          Left = 96
          Top = 18
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 0
          Text = '0'
          Width = 90
        end
        object edtNextExtend: TcxMaskEdit
          Left = 96
          Top = 40
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 1
          Text = '0'
          Width = 90
        end
        object edtMinExtents: TcxMaskEdit
          Left = 326
          Top = 18
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 2
          Text = '0'
          Width = 90
        end
        object edtMaxExtents: TcxMaskEdit
          Left = 326
          Top = 40
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 3
          Text = '0'
          Width = 90
        end
        object edtPctIncrease: TcxMaskEdit
          Left = 96
          Top = 62
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 4
          Text = '0'
          Width = 90
        end
        object edtFreeList: TcxMaskEdit
          Left = 326
          Top = 62
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 5
          Text = '0'
          Width = 90
        end
        object edtFreeGroup: TcxMaskEdit
          Left = 326
          Top = 84
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 6
          Text = '0'
          Width = 90
        end
        object cbBufferPool: TcxImageComboBox
          Left = 96
          Top = 84
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
          TabOrder = 7
          Width = 91
        end
      end
      object gbStorage: TcxGroupBox
        Left = 14
        Top = -3
        Style.BorderStyle = ebsNone
        TabOrder = 1
        Transparent = True
        Height = 107
        Width = 505
        object Label7: TLabel
          Left = 33
          Top = 29
          Width = 67
          Height = 13
          Caption = 'Percent Free :'
          Transparent = True
        end
        object Label8: TLabel
          Left = 31
          Top = 53
          Width = 71
          Height = 13
          Caption = 'Percent Used :'
          Transparent = True
        end
        object Label9: TLabel
          Left = 272
          Top = 29
          Width = 60
          Height = 13
          Caption = 'Initial Trans :'
          Transparent = True
        end
        object Label10: TLabel
          Left = 276
          Top = 53
          Width = 56
          Height = 13
          Caption = 'Max Trans :'
          Transparent = True
        end
        object Label15: TLabel
          Left = 36
          Top = 77
          Width = 67
          Height = 13
          Caption = 'Tablespacse :'
          Transparent = True
        end
        object edtPercentFree: TcxMaskEdit
          Left = 109
          Top = 26
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 0
          Text = '10'
          Width = 90
        end
        object edtPercentUsed: TcxMaskEdit
          Left = 109
          Top = 50
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 1
          Text = '0'
          Width = 90
        end
        object edtInitialTrans: TcxMaskEdit
          Tag = 2
          Left = 343
          Top = 26
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 2
          Text = '2'
          Width = 90
        end
        object edtMaxTrans: TcxMaskEdit
          Left = 343
          Top = 50
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 3
          Text = '255'
          Width = 90
        end
        object lcTablespace: TcxLookupComboBox
          Left = 109
          Top = 74
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'TABLESPACE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLESPACE_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsTablespace
          TabOrder = 4
          Width = 193
        end
      end
      object rgCache: TcxRadioGroup
        Left = 7
        Top = 236
        Caption = 'Cache Options'
        Properties.Items = <
          item
            Caption = 
              '(CACHE) Place frequently accessed data to the top of the buffer ' +
              'cache.'
          end
          item
            Caption = 
              '(NOCACHE) Place least frequently accessed data to the end of the' +
              ' buffer cache.'
          end>
        ItemIndex = 1
        TabOrder = 2
        Transparent = True
        Height = 65
        Width = 443
      end
      object rgLogging: TcxRadioGroup
        Left = 7
        Top = 308
        Caption = 'Logging Value'
        Properties.Items = <
          item
            Caption = '(Default)'
          end
          item
            Caption = 
              '(LOGGING) Redo logs are generated. Updates are slower but recove' +
              'rable.'
          end
          item
            Caption = 
              '(NOLOGGING) No redo logs are generated. Updates are faster but n' +
              'ot recoverable.'
          end>
        ItemIndex = 0
        TabOrder = 3
        Transparent = True
        Height = 82
        Width = 443
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 3
      DesignSize = (
        459
        443)
      object redtDDL: TcxRichEdit
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 427
        Width = 443
      end
    end
  end
  object vtTables: TVirtualTable
    Left = 8
    Top = 336
    Data = {01000000000000000000}
  end
  object dsTables: TDataSource
    DataSet = vtTables
    Left = 40
    Top = 336
  end
  object vtAvailableColumns: TVirtualTable
    Left = 8
    Top = 368
    Data = {01000000000000000000}
    object vtAvailableColumnsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 30
    end
  end
  object dsAvailableColumns: TDataSource
    DataSet = vtAvailableColumns
    Left = 40
    Top = 368
  end
  object vtSelectedColumns: TVirtualTable
    Left = 8
    Top = 400
    Data = {01000000000000000000}
    object vtSelectedColumnsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 30
    end
  end
  object dsSelectedColumns: TDataSource
    DataSet = vtSelectedColumns
    Left = 40
    Top = 400
  end
end
