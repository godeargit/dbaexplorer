object TableIndexesFrm: TTableIndexesFrm
  Left = 217
  Top = 59
  BorderStyle = bsDialog
  Caption = 'TableIndexesFrm'
  ClientHeight = 620
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    616
    620)
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 8
    Top = 8
    Width = 598
    Height = 553
    ActivePage = tsIndex
    Anchors = [akLeft, akTop, akRight, akBottom]
    LookAndFeel.Kind = lfStandard
    ShowFrame = True
    Style = 9
    TabOrder = 0
    OnPageChanging = pcPageChanging
    ClientRectBottom = 552
    ClientRectLeft = 1
    ClientRectRight = 597
    ClientRectTop = 20
    object tsIndex: TcxTabSheet
      Caption = 'Index'
      ImageIndex = 0
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 8
        TabOrder = 0
        Transparent = True
        DesignSize = (
          575
          512)
        Height = 512
        Width = 575
        object sbtnAddIndex: TSpeedButton
          Left = 275
          Top = 316
          Width = 23
          Height = 22
          Caption = '>'
          OnClick = sbtnAddIndexClick
        end
        object sbtnAddAllIndex: TSpeedButton
          Left = 275
          Top = 340
          Width = 23
          Height = 22
          Caption = '>>'
          OnClick = sbtnAddAllIndexClick
        end
        object sbtnRemoveIndex: TSpeedButton
          Left = 275
          Top = 364
          Width = 23
          Height = 22
          Caption = '<'
          OnClick = sbtnRemoveIndexClick
        end
        object sbtnRemoveAllIndex: TSpeedButton
          Left = 275
          Top = 388
          Width = 23
          Height = 22
          Caption = '<<'
          OnClick = sbtnRemoveAllIndexClick
        end
        object sbtnUpIndex: TSpeedButton
          Left = 275
          Top = 412
          Width = 23
          Height = 22
          Caption = 'Up'
          OnClick = sbtnUpIndexClick
        end
        object sbtnDownIndex: TSpeedButton
          Left = 275
          Top = 436
          Width = 23
          Height = 22
          Caption = 'Dw'
          OnClick = sbtnDownIndexClick
        end
        object Label1: TLabel
          Left = 18
          Top = 66
          Width = 75
          Height = 13
          Caption = 'Index Schema :'
          Transparent = True
        end
        object Label2: TLabel
          Left = 18
          Top = 89
          Width = 65
          Height = 13
          Caption = 'Index Name :'
          Transparent = True
        end
        object lblIndexTable: TLabel
          Left = 18
          Top = 43
          Width = 66
          Height = 13
          Caption = 'Table Name  :'
          Transparent = True
        end
        object Label4: TLabel
          Left = 18
          Top = 20
          Width = 73
          Height = 13
          Caption = 'Table Schema :'
          Transparent = True
        end
        object Label5: TLabel
          Left = 18
          Top = 112
          Width = 82
          Height = 13
          Caption = 'Partition Clause :'
          Transparent = True
        end
        object lblPartition: TLabel
          Left = 323
          Top = 115
          Width = 82
          Height = 13
          Caption = 'Partition Clause :'
          Transparent = True
          Visible = False
        end
        object cxGroupBox2: TcxGroupBox
          Left = 11
          Top = 137
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Index Attributes'
          TabOrder = 0
          Transparent = True
          Height = 122
          Width = 550
          object Label6: TLabel
            Left = 464
            Top = 35
            Width = 38
            Height = 13
            Caption = 'columns'
            Transparent = True
          end
          object btnFunction: TSpeedButton
            Left = 296
            Top = 93
            Width = 23
            Height = 19
            Caption = '...'
            OnClick = btnFunctionClick
          end
          object Label17: TLabel
            Left = 11
            Top = 42
            Width = 44
            Height = 13
            Caption = 'Logging :'
            Transparent = True
          end
          object Label18: TLabel
            Left = 63
            Top = 76
            Width = 35
            Height = 13
            Caption = 'Degree'
            Transparent = True
          end
          object Label19: TLabel
            Left = 109
            Top = 76
            Width = 47
            Height = 13
            Caption = 'Instances'
            Transparent = True
          end
          object rgroupKeyCompression: TcxRadioGroup
            Left = 343
            Top = 17
            Caption = 'Key Compression'
            Properties.Items = <
              item
                Caption = 'Compress'
              end
              item
                Caption = 'No Compress'
              end>
            Properties.OnChange = onPropertiesChange
            ItemIndex = 1
            TabOrder = 6
            Transparent = True
            Height = 61
            Width = 170
          end
          object cbReverse: TcxCheckBox
            Left = 220
            Top = 54
            Caption = 'Reverse'
            Properties.OnChange = onPropertiesChange
            TabOrder = 0
            Transparent = True
            Width = 66
          end
          object cbNoSorted: TcxCheckBox
            Left = 220
            Top = 73
            Caption = 'No Sorted'
            Properties.OnChange = onPropertiesChange
            TabOrder = 1
            Transparent = True
            Width = 73
          end
          object cbBitmap: TcxCheckBox
            Left = 220
            Top = 35
            Caption = 'Bitmap'
            Properties.OnChange = onPropertiesChange
            TabOrder = 2
            Transparent = True
            Width = 58
          end
          object cbParalel: TcxCheckBox
            Left = 4
            Top = 90
            Caption = 'Paralel'
            Properties.OnChange = onPropertiesChange
            TabOrder = 3
            Transparent = True
            Width = 56
          end
          object cbComputeStatistic: TcxCheckBox
            Left = 5
            Top = 16
            Caption = 'Compute Statistics'
            Properties.OnChange = onPropertiesChange
            TabOrder = 4
            Transparent = True
            Width = 113
          end
          object cbOnline: TcxCheckBox
            Left = 220
            Top = 17
            Caption = 'Online'
            Properties.OnChange = onPropertiesChange
            TabOrder = 5
            Transparent = True
            Width = 58
          end
          object cbFunction: TcxCheckBox
            Left = 220
            Top = 92
            Caption = 'Function'
            Properties.OnChange = onPropertiesChange
            TabOrder = 7
            Transparent = True
            Width = 66
          end
          object edtFunction: TcxTextEdit
            Left = 318
            Top = 92
            Enabled = False
            TabOrder = 8
            Width = 221
          end
          object edtParalelDegree: TcxMaskEdit
            Left = 61
            Top = 90
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 9
            Text = '0'
            Width = 41
          end
          object edtKeyCompressionColumns: TcxMaskEdit
            Left = 423
            Top = 33
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 10
            Text = '0'
            Width = 35
          end
          object cbLogging: TcxImageComboBox
            Left = 61
            Top = 38
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
            Style.Shadow = False
            TabOrder = 11
            Width = 77
          end
          object edtParalelInstances: TcxMaskEdit
            Left = 109
            Top = 90
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 12
            Text = '0'
            Width = 41
          end
        end
        object gridTableColums: TcxGrid
          Left = 12
          Top = 266
          Width = 255
          Height = 232
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 1
          LookAndFeel.Kind = lfOffice11
          object gridTableColumsDBTableView1: TcxGridDBTableView
            OnDblClick = sbtnAddIndexClick
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsTableColumns
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
            object gridTableColumsDBTableView1COLUMN_NAME: TcxGridDBColumn
              Caption = 'Table Columns'
              DataBinding.FieldName = 'COLUMN_NAME'
              Width = 120
            end
            object gridTableColumsDBTableView1Column1: TcxGridDBColumn
              Caption = 'Type'
              DataBinding.FieldName = 'DATA_TYPE'
              Width = 88
            end
          end
          object gridTableColumsLevel1: TcxGridLevel
            GridView = gridTableColumsDBTableView1
          end
        end
        object gridIndexColums: TcxGrid
          Left = 306
          Top = 266
          Width = 255
          Height = 232
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
          LookAndFeel.Kind = lfOffice11
          object cxGridDBTableView4: TcxGridDBTableView
            OnDblClick = sbtnRemoveIndexClick
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsIndexColumns
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object cxGridDBColumn1: TcxGridDBColumn
              Caption = 'Index Columns'
              DataBinding.FieldName = 'COLUMN_NAME'
              Options.Editing = False
              Width = 115
            end
            object cxGridDBTableView4Column1: TcxGridDBColumn
              Caption = 'Type'
              DataBinding.FieldName = 'DATA_TYPE'
              Options.Editing = False
              Width = 51
            end
            object cxGridDBTableView4Column2: TcxGridDBColumn
              Caption = 'Order'
              DataBinding.FieldName = 'ORDER'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Desc'
                  ImageIndex = 0
                  Value = 'Desc'
                end
                item
                  Description = 'Asc'
                  Value = 'Asc'
                end>
              Width = 42
            end
            object cxGridDBTableView4Column3: TcxGridDBColumn
              DataBinding.FieldName = 'SORT'
              Visible = False
            end
          end
          object cxGridLevel4: TcxGridLevel
            GridView = cxGridDBTableView4
          end
        end
        object edtIndexName: TcxTextEdit
          Left = 101
          Top = 86
          Style.Shadow = False
          TabOrder = 3
          Width = 209
        end
        object lcIndexSchema: TcxLookupComboBox
          Left = 101
          Top = 63
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsSchema
          Style.Shadow = False
          TabOrder = 4
          Width = 209
        end
        object lcTableSchema: TcxLookupComboBox
          Left = 101
          Top = 17
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsSchema
          Properties.OnEditValueChanged = lcTableSchemaPropertiesEditValueChanged
          Style.Shadow = False
          TabOrder = 5
          Width = 208
        end
        object lcIndexTable: TcxLookupComboBox
          Left = 101
          Top = 40
          Properties.KeyFieldNames = 'TABLE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLE_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsIndexTable
          Properties.OnEditValueChanged = lcIndexTablePropertiesEditValueChanged
          Style.Shadow = False
          TabOrder = 6
          Width = 209
        end
        object rgroupIndexClause: TcxRadioGroup
          Left = 322
          Top = 18
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Index Clause'
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = 'Table Index'
            end
            item
              Caption = 'Cluster Index'
            end>
          Properties.OnChange = rgroupIndexClausePropertiesChange
          Properties.OnEditValueChanged = rgroupIndexClausePropertiesEditValueChanged
          ItemIndex = 0
          Style.Shadow = False
          TabOrder = 7
          Transparent = True
          Height = 44
          Width = 241
        end
        object rgroupIndexType: TcxRadioGroup
          Left = 323
          Top = 62
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Index Type'
          Properties.Columns = 3
          Properties.Items = <
            item
              Caption = 'Primary'
            end
            item
              Caption = 'Uniqe'
            end
            item
              Caption = 'Non-uniqe'
            end>
          Properties.OnChange = onPropertiesChange
          ItemIndex = 2
          Style.Shadow = False
          TabOrder = 8
          Transparent = True
          Height = 47
          Width = 240
        end
        object cbPartitionClause: TcxComboBox
          Left = 101
          Top = 109
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'Non-Partitioned'
            'Global')
          Properties.OnEditValueChanged = cbPartitionClausePropertiesEditValueChanged
          Style.Shadow = False
          TabOrder = 9
          Text = 'Non-Partitioned'
          Width = 208
        end
      end
    end
    object tsProperties: TcxTabSheet
      Caption = 'Physical Attributes'
      ImageIndex = 1
      DesignSize = (
        596
        532)
      object cxGroupBox4: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          578
          513)
        Height = 513
        Width = 578
        object Label7: TLabel
          Left = 30
          Top = 21
          Width = 69
          Height = 13
          Caption = 'Percent Free :'
          Transparent = True
        end
        object Label9: TLabel
          Left = 294
          Top = 21
          Width = 63
          Height = 13
          Caption = 'Initial Trans :'
          Transparent = True
        end
        object Label10: TLabel
          Left = 294
          Top = 45
          Width = 57
          Height = 13
          Caption = 'Max Trans :'
          Transparent = True
        end
        object Label15: TLabel
          Left = 32
          Top = 45
          Width = 66
          Height = 13
          Caption = 'Tablespacse :'
          Transparent = True
        end
        object edtPercentFree: TcxMaskEdit
          Left = 106
          Top = 18
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 0
          Text = '10'
          Width = 167
        end
        object edtInitialTrans: TcxMaskEdit
          Tag = 2
          Left = 365
          Top = 18
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 1
          Text = '2'
          Width = 181
        end
        object edtMaxTrans: TcxMaskEdit
          Left = 365
          Top = 42
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 2
          Text = '255'
          Width = 181
        end
        object cxGroupBox3: TcxGroupBox
          Left = 14
          Top = 72
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Storage Clause'
          TabOrder = 3
          Transparent = True
          Height = 119
          Width = 551
          object Label11: TLabel
            Left = 20
            Top = 21
            Width = 70
            Height = 13
            Caption = 'Initial Extend :'
            Transparent = True
          end
          object Label12: TLabel
            Left = 20
            Top = 43
            Width = 67
            Height = 13
            Caption = 'Next Extend :'
            Transparent = True
          end
          object Label13: TLabel
            Left = 282
            Top = 21
            Width = 63
            Height = 13
            Caption = 'Min Extents :'
            Transparent = True
          end
          object Label14: TLabel
            Left = 282
            Top = 43
            Width = 67
            Height = 13
            Caption = 'Max Extents :'
            Transparent = True
          end
          object Label29: TLabel
            Left = 20
            Top = 65
            Width = 67
            Height = 13
            Caption = 'Pct Increase :'
            Transparent = True
          end
          object Label30: TLabel
            Left = 282
            Top = 65
            Width = 48
            Height = 13
            Caption = 'Free List :'
            Transparent = True
          end
          object Label31: TLabel
            Left = 282
            Top = 88
            Width = 66
            Height = 13
            Caption = 'Free Groups :'
            Transparent = True
          end
          object Label32: TLabel
            Left = 20
            Top = 87
            Width = 60
            Height = 13
            Caption = 'Buffer Pool :'
            Transparent = True
          end
          object edtInitialExtend: TcxMaskEdit
            Left = 97
            Top = 18
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 0
            Text = '0'
            Width = 161
          end
          object edtNextExtend: TcxMaskEdit
            Left = 97
            Top = 40
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 1
            Text = '0'
            Width = 161
          end
          object edtMinExtents: TcxMaskEdit
            Left = 353
            Top = 18
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 2
            Text = '0'
            Width = 182
          end
          object edtMaxExtents: TcxMaskEdit
            Left = 353
            Top = 40
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 3
            Text = '0'
            Width = 182
          end
          object edtPctIncrease: TcxMaskEdit
            Left = 97
            Top = 62
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 4
            Text = '0'
            Width = 161
          end
          object edtFreeList: TcxMaskEdit
            Left = 353
            Top = 62
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 5
            Text = '0'
            Width = 182
          end
          object edtFreeGroup: TcxMaskEdit
            Left = 353
            Top = 84
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 6
            Text = '0'
            Width = 182
          end
          object cbBufferPool: TcxImageComboBox
            Left = 97
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
            Width = 162
          end
        end
        object lcTablespace: TcxLookupComboBox
          Left = 106
          Top = 42
          Properties.KeyFieldNames = 'TABLESPACE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLESPACE_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsTablespace
          TabOrder = 4
          Width = 167
        end
        object rgroupBitmapIndex: TcxGroupBox
          Left = 15
          Top = 197
          Caption = '           Bitmap Join Index Clause'
          TabOrder = 5
          Transparent = True
          DesignSize = (
            549
            300)
          Height = 300
          Width = 549
          object Label3: TLabel
            Left = 12
            Top = 21
            Width = 59
            Height = 13
            Caption = 'From Clause'
            Transparent = True
          end
          object Label16: TLabel
            Left = 282
            Top = 21
            Width = 67
            Height = 13
            Caption = 'Where Clause'
            Transparent = True
          end
          object edtBitmapIndexFromClause: TcxRichEdit
            Left = 10
            Top = 43
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Height = 238
            Width = 247
          end
          object chkBitmapIndex: TcxCheckBox
            Left = 5
            Top = -2
            Properties.OnChange = onPropertiesChange
            TabOrder = 1
            Transparent = True
            Width = 26
          end
          object edtBitmapIndexWhereClause: TcxRichEdit
            Left = 283
            Top = 43
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
            Height = 238
            Width = 252
          end
        end
      end
    end
    object tsPartitions: TcxTabSheet
      Caption = 'Partitions'
      ImageIndex = 3
      object sbtnPartitionAdd: TSpeedButton
        Left = 181
        Top = 28
        Width = 23
        Height = 22
        Caption = '>'
        OnClick = sbtnPartitionAddClick
      end
      object sbtnPartitionAddAll: TSpeedButton
        Left = 181
        Top = 52
        Width = 23
        Height = 22
        Caption = '>>'
        OnClick = sbtnPartitionAddAllClick
      end
      object sbtnPartitionRemove: TSpeedButton
        Left = 181
        Top = 76
        Width = 23
        Height = 22
        Caption = '<'
        OnClick = sbtnPartitionRemoveClick
      end
      object sbtnPartitionRemoveAll: TSpeedButton
        Left = 181
        Top = 100
        Width = 23
        Height = 22
        Caption = '<<'
        OnClick = sbtnPartitionRemoveAllClick
      end
      object sbtnSubPartitionAdd: TSpeedButton
        Left = 384
        Top = 29
        Width = 23
        Height = 22
        Caption = '>'
        OnClick = sbtnSubPartitionAddClick
      end
      object sbtnSubPartitionAddAll: TSpeedButton
        Left = 384
        Top = 53
        Width = 23
        Height = 22
        Caption = '>>'
        OnClick = sbtnSubPartitionAddAllClick
      end
      object sbtnSubPartitionRemove: TSpeedButton
        Left = 384
        Top = 77
        Width = 23
        Height = 22
        Caption = '<'
        OnClick = sbtnSubPartitionRemoveClick
      end
      object sbtnSubPartitionRemoveAll: TSpeedButton
        Left = 384
        Top = 101
        Width = 23
        Height = 22
        Caption = '<<'
        OnClick = sbtnSubPartitionRemoveAllClick
      end
      object gridAvailabeColumns: TcxGrid
        Left = 7
        Top = 8
        Width = 165
        Height = 233
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object cxGridDBTableView1: TcxGridDBTableView
          OnDblClick = sbtnPartitionAddClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsAvailabeColumns
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDBTableView1COLUMN_NAME: TcxGridDBColumn
            Caption = 'Available Columns'
            DataBinding.FieldName = 'COLUMN_NAME'
          end
          object cxGridDBTableView1DATA_TYPE: TcxGridDBColumn
            DataBinding.FieldName = 'DATA_TYPE'
            Visible = False
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object gridPartitionColumns: TcxGrid
        Left = 212
        Top = 8
        Width = 165
        Height = 233
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        object cxGridDBTableView2: TcxGridDBTableView
          OnDblClick = sbtnPartitionRemoveClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsPartitionColumns
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDBTableView2COLUMN_NAME: TcxGridDBColumn
            Caption = 'Partitions Columns'
            DataBinding.FieldName = 'COLUMN_NAME'
          end
          object cxGridDBTableView2DATA_TYPE: TcxGridDBColumn
            DataBinding.FieldName = 'DATA_TYPE'
            Visible = False
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
      object gridSubPartitionColumns: TcxGrid
        Left = 418
        Top = 8
        Width = 165
        Height = 233
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        object cxGridDBTableView3: TcxGridDBTableView
          OnDblClick = sbtnSubPartitionRemoveClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsSubPartitionColumns
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDBTableView3COLUMN_NAME: TcxGridDBColumn
            Caption = 'Subpartition Columns'
            DataBinding.FieldName = 'COLUMN_NAME'
          end
          object cxGridDBTableView3DATA_TYPE: TcxGridDBColumn
            DataBinding.FieldName = 'DATA_TYPE'
            Visible = False
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = cxGridDBTableView3
        end
      end
      object pcPartitionType: TcxPageControl
        Left = 0
        Top = 250
        Width = 596
        Height = 282
        ActivePage = tsRange
        Align = alBottom
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        Style = 9
        TabOrder = 3
        ClientRectBottom = 282
        ClientRectRight = 596
        ClientRectTop = 20
        object tsRange: TcxTabSheet
          Caption = 'Range Partitions'
          ImageIndex = 0
          DesignSize = (
            596
            262)
          object cxGrid1: TcxGrid
            Left = 8
            Top = 8
            Width = 576
            Height = 211
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            LookAndFeel.Kind = lfOffice11
            object cxGridDBTableView5: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsRangePartition
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.GroupByBox = False
              object cxGridDBTableView5PARTITION_NAME: TcxGridDBColumn
                Caption = 'Partition Name'
                DataBinding.FieldName = 'PARTITION_NAME'
                Width = 227
              end
              object cxGridDBTableView5TABLESPACE_NAME: TcxGridDBColumn
                Caption = 'Tablespace Name'
                DataBinding.FieldName = 'TABLESPACE_NAME'
                Width = 211
              end
              object cxGridDBTableView5PARTITION_ID: TcxGridDBColumn
                DataBinding.FieldName = 'PARTITION_ID'
                Visible = False
                Width = 76
              end
            end
            object cxGridLevel5: TcxGridLevel
              GridView = cxGridDBTableView5
            end
          end
          object btnRangeAdd: TcxButton
            Left = 351
            Top = 224
            Width = 75
            Height = 25
            Caption = 'Add..'
            TabOrder = 1
            OnClick = btnRangeAddClick
            LookAndFeel.Kind = lfOffice11
          end
          object btnRangeEdit: TcxButton
            Left = 431
            Top = 224
            Width = 75
            Height = 25
            Caption = 'Edit...'
            TabOrder = 2
            OnClick = btnRangeEditClick
            LookAndFeel.Kind = lfOffice11
          end
          object btnRangeDelete: TcxButton
            Left = 510
            Top = 224
            Width = 75
            Height = 25
            Caption = 'Delete'
            TabOrder = 3
            OnClick = btnRangeDeleteClick
            LookAndFeel.Kind = lfOffice11
          end
        end
        object tsHash: TcxTabSheet
          Caption = 'Hash Partitions'
          ImageIndex = 1
          object Label20: TLabel
            Left = 317
            Top = 231
            Width = 49
            Height = 13
            Caption = 'Quantity :'
            Transparent = True
          end
          object cxGrid2: TcxGrid
            Left = 8
            Top = 7
            Width = 577
            Height = 211
            TabOrder = 0
            LookAndFeel.Kind = lfOffice11
            object cxGridDBTableView6: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsHashPartition
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsData.DeletingConfirmation = False
              OptionsView.GroupByBox = False
              object cxGridDBTableView6PARTITION_NAME: TcxGridDBColumn
                Caption = 'Partition Name'
                DataBinding.FieldName = 'PARTITION_NAME'
                Width = 167
              end
              object cxGridDBTableView6TABLESPACE_NAME: TcxGridDBColumn
                Caption = 'Tablespace Name'
                DataBinding.FieldName = 'TABLESPACE_NAME'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'TABLESPACE_NAME'
                Properties.ListColumns = <
                  item
                    FieldName = 'TABLESPACE_NAME'
                  end>
                Properties.ListSource = dmGenel.dsTablespace
                Width = 216
              end
            end
            object cxGridLevel6: TcxGridLevel
              GridView = cxGridDBTableView6
            end
          end
          object btnHashAdd: TcxButton
            Left = 432
            Top = 224
            Width = 75
            Height = 25
            Caption = 'Add'
            TabOrder = 1
            OnClick = btnHashAddClick
            LookAndFeel.Kind = lfOffice11
          end
          object btnHashDelete: TcxButton
            Left = 511
            Top = 224
            Width = 75
            Height = 25
            Caption = 'Delete'
            TabOrder = 2
            OnClick = btnHashDeleteClick
            LookAndFeel.Kind = lfOffice11
          end
          object rgroupHashPartitionType: TcxRadioGroup
            Left = 8
            Top = 216
            Properties.Columns = 2
            Properties.Items = <
              item
                Caption = 'User Named'
              end
              item
                Caption = 'System Named'
              end>
            ItemIndex = 0
            TabOrder = 3
            Transparent = True
            Height = 38
            Width = 249
          end
          object edtHashQuantity: TcxSpinEdit
            Left = 367
            Top = 227
            Properties.MaxValue = 100.000000000000000000
            Properties.MinValue = 1.000000000000000000
            TabOrder = 4
            Value = 1
            Width = 54
          end
        end
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 2
      DesignSize = (
        596
        532)
      object redtDDL: TcxRichEdit
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Lines.Strings = (
          'cxRichEdit1')
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 513
        Width = 578
      end
    end
  end
  object cxGroupBox5: TcxGroupBox
    Left = 8
    Top = 564
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    Transparent = True
    Height = 48
    Width = 600
    object btnCancel: TcxButton
      Left = 89
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnExecute: TcxButton
      Left = 8
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 1
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object qIndexTable: TOraQuery
    SQL.Strings = (
      'select * from sys.All_tables')
    Left = 56
    Top = 439
    object StringField3: TStringField
      FieldName = 'TABLE_NAME'
      Size = 30
    end
  end
  object dsIndexTable: TDataSource
    DataSet = qIndexTable
    Left = 25
    Top = 439
  end
  object qTableColumns: TOraQuery
    LocalUpdate = True
    SQL.Strings = (
      'SELECT cols.*, '
      
        '      ( SELECT comments FROM SYS.user_col_comments WHERE table_n' +
        'ame = cols.table_name AND column_name = cols.column_name) commen' +
        'ts '
      '     FROM SYS.user_tab_columns cols')
    CachedUpdates = True
    AutoCommit = False
    IndexFieldNames = 'COLUMN_ID'
    Left = 56
    Top = 472
    object qTableColumnsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Required = True
      Size = 30
    end
    object qTableColumnsDATA_TYPE: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
    object qTableColumnsCOLUMN_ID: TFloatField
      FieldName = 'COLUMN_ID'
    end
  end
  object dsTableColumns: TDataSource
    DataSet = qTableColumns
    Left = 25
    Top = 473
  end
  object qIndexColumns: TVirtualTable
    IndexFieldNames = 'SORT'
    FieldDefs = <
      item
        Name = 'COLUMN_NAME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATA_TYPE'
        DataType = ftString
        Size = 106
      end
      item
        Name = 'ORDER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SORT'
        DataType = ftFloat
      end>
    Left = 58
    Top = 506
    Data = {
      010004000B00434F4C554D4E5F4E414D45010014000900444154415F54595045
      01006A0005004F52444552010014000400534F525406000000000000000000}
    object qIndexColumnsCOLUMN_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'COLUMN_NAME'
    end
    object qIndexColumnsDATA_TYPE: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
    object qIndexColumnsORDER: TStringField
      FieldName = 'ORDER'
      Size = 4
    end
    object qIndexColumnsSORT: TFloatField
      FieldName = 'SORT'
    end
  end
  object dsIndexColumns: TDataSource
    DataSet = qIndexColumns
    Left = 25
    Top = 505
  end
  object qIndexCluster: TOraQuery
    SQL.Strings = (
      
        'SELECT  CLUSTER_NAME FROM SYS.USER_CLUSTERS where cluster_type =' +
        ' '#39'INDEX'#39)
    Left = 120
    Top = 439
    object qIndexClusterCLUSTER_NAME: TStringField
      FieldName = 'CLUSTER_NAME'
      Size = 30
    end
  end
  object dsIndexCluster: TDataSource
    DataSet = qIndexCluster
    Left = 89
    Top = 439
  end
  object qAvailabeColumns: TVirtualTable
    Left = 251
    Top = 389
    Data = {01000000000000000000}
    object qAvailabeColumnsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 30
    end
    object qAvailabeColumnsDATA_TYPE: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
  end
  object dsAvailabeColumns: TDataSource
    DataSet = qAvailabeColumns
    Left = 217
    Top = 389
  end
  object dsPartitionColumns: TDataSource
    DataSet = qPartitionColumns
    Left = 217
    Top = 421
  end
  object qPartitionColumns: TVirtualTable
    Left = 251
    Top = 421
    Data = {01000000000000000000}
    object StringField2: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 30
    end
    object StringField4: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
  end
  object dsSubPartitionColumns: TDataSource
    DataSet = qSubPartitionColumns
    Left = 217
    Top = 453
  end
  object qSubPartitionColumns: TVirtualTable
    Left = 251
    Top = 453
    Data = {01000000000000000000}
    object StringField5: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 30
    end
    object StringField6: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
  end
  object qRangePartition: TVirtualTable
    Left = 251
    Top = 485
    Data = {01000000000000000000}
    object qRangePartitionPARTITION_NAME: TStringField
      FieldName = 'PARTITION_NAME'
      Size = 30
    end
    object qRangePartitionTABLESPACE_NAME: TStringField
      FieldName = 'TABLESPACE_NAME'
      Size = 30
    end
    object qRangePartitionPARTITION_ID: TIntegerField
      FieldName = 'PARTITION_ID'
    end
  end
  object dsRangePartition: TDataSource
    DataSet = qRangePartition
    Left = 217
    Top = 485
  end
  object qHashPartition: TVirtualTable
    BeforePost = qHashPartitionBeforePost
    Left = 251
    Top = 517
    Data = {01000000000000000000}
    object StringField7: TStringField
      FieldName = 'PARTITION_NAME'
      Size = 30
    end
    object StringField8: TStringField
      FieldName = 'TABLESPACE_NAME'
      Size = 30
    end
  end
  object dsHashPartition: TDataSource
    DataSet = qHashPartition
    Left = 217
    Top = 517
  end
  object qTemp: TOraQuery
    Left = 27
    Top = 407
  end
end
