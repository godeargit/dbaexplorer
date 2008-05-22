object TableConstraintsFrm: TTableConstraintsFrm
  Left = 303
  Top = 122
  BorderStyle = bsDialog
  Caption = 'TableConstraintsFrm'
  ClientHeight = 534
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 8
    Top = 8
    Width = 534
    Height = 460
    ActivePage = tsKey
    LookAndFeel.NativeStyle = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    OnPageChanging = pcPageChanging
    ClientRectBottom = 459
    ClientRectLeft = 1
    ClientRectRight = 533
    ClientRectTop = 20
    object tsKey: TcxTabSheet
      Caption = 'Primary/Uniqe Key'
      ImageIndex = 0
      object cxGroupBox4: TcxGroupBox
        Left = 8
        Top = 8
        TabOrder = 0
        Transparent = True
        DesignSize = (
          512
          418)
        Height = 418
        Width = 512
        object Label2: TLabel
          Left = 19
          Top = 22
          Width = 34
          Height = 13
          Caption = 'Name :'
          Transparent = True
        end
        object Label3: TLabel
          Left = 19
          Top = 88
          Width = 33
          Height = 13
          Caption = 'Table :'
          Transparent = True
        end
        object Label4: TLabel
          Left = 19
          Top = 65
          Width = 44
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object sbtnAddKey: TSpeedButton
          Left = 244
          Top = 136
          Width = 23
          Height = 22
          Caption = '>'
          OnClick = sbtnAddKeyClick
        end
        object sbtnAddAllKey: TSpeedButton
          Left = 244
          Top = 160
          Width = 23
          Height = 22
          Caption = '>>'
          OnClick = sbtnAddAllKeyClick
        end
        object sbtnRemoveKey: TSpeedButton
          Left = 244
          Top = 184
          Width = 23
          Height = 22
          Caption = '<'
          OnClick = sbtnRemoveKeyClick
        end
        object sbtnRemoveAllKey: TSpeedButton
          Left = 244
          Top = 208
          Width = 23
          Height = 22
          Caption = '<<'
          OnClick = sbtnRemoveAllKeyClick
        end
        object Bevel1: TBevel
          Left = 16
          Top = 51
          Width = 478
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object edtKeyName: TcxTextEdit
          Left = 67
          Top = 19
          Style.Shadow = False
          TabOrder = 0
          Width = 318
        end
        object lcKeyTableSchema: TcxLookupComboBox
          Left = 67
          Top = 62
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListSource = dmGenel.dsSchema
          Properties.OnEditValueChanged = lcKeyTableSchemaPropertiesEditValueChanged
          Style.Shadow = False
          TabOrder = 1
          Width = 170
        end
        object lcKeyTable: TcxLookupComboBox
          Left = 67
          Top = 85
          Properties.KeyFieldNames = 'TABLE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLE_NAME'
            end>
          Properties.ListSource = dsTable
          Properties.OnEditValueChanged = lcKeyTablePropertiesEditValueChanged
          Style.Shadow = False
          TabOrder = 2
          Width = 170
        end
        object cbKeySystemName: TcxCheckBox
          Left = 387
          Top = 18
          Caption = 'Use Oracle Name'
          Style.Shadow = False
          TabOrder = 3
          Transparent = True
          Width = 112
        end
        object rgrpKeyType: TcxRadioGroup
          Left = 276
          Top = 57
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = 'Primary Key'
            end
            item
              Caption = 'Uniqe Key'
            end>
          ItemIndex = 0
          Style.Shadow = False
          TabOrder = 4
          Transparent = True
          Height = 49
          Width = 221
        end
        object gridKeyTableColums: TcxGrid
          Left = 14
          Top = 116
          Width = 220
          Height = 287
          TabOrder = 5
          LookAndFeel.Kind = lfOffice11
          object gridKeyTableColumsDBTableView1: TcxGridDBTableView
            OnDblClick = sbtnAddKeyClick
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dTableColumns
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
            object gridKeyTableColumsDBTableView1COLUMN_NAME: TcxGridDBColumn
              Caption = 'Table Columns'
              DataBinding.FieldName = 'COLUMN_NAME'
              Width = 120
            end
            object gridKeyTableColumsDBTableView1Column1: TcxGridDBColumn
              Caption = 'Type'
              DataBinding.FieldName = 'DATA_TYPE'
              Width = 88
            end
          end
          object gridKeyTableColumsLevel1: TcxGridLevel
            GridView = gridKeyTableColumsDBTableView1
          end
        end
        object gridKeyIndexColums: TcxGrid
          Left = 278
          Top = 116
          Width = 220
          Height = 287
          TabOrder = 6
          LookAndFeel.Kind = lfOffice11
          object cxGridDBTableView1: TcxGridDBTableView
            OnDblClick = sbtnRemoveKeyClick
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsKeyColumns
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
              Caption = 'Key Columns'
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
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
    end
    object tsCheck: TcxTabSheet
      Caption = 'Check'
      ImageIndex = 1
      object cxGroupBox6: TcxGroupBox
        Left = 8
        Top = 8
        TabOrder = 0
        Transparent = True
        DesignSize = (
          512
          420)
        Height = 420
        Width = 512
        object Label17: TLabel
          Left = 23
          Top = 23
          Width = 34
          Height = 13
          Caption = 'Name :'
          Transparent = True
        end
        object Label18: TLabel
          Left = 23
          Top = 94
          Width = 33
          Height = 13
          Caption = 'Table :'
          Transparent = True
        end
        object Label19: TLabel
          Left = 23
          Top = 71
          Width = 44
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object Bevel2: TBevel
          Left = 23
          Top = 46
          Width = 476
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object cxGroupBox2: TcxGroupBox
          Left = 12
          Top = 123
          Caption = 'Check Conditions'
          Style.Shadow = False
          TabOrder = 0
          Transparent = True
          Height = 283
          Width = 487
          object edtCheckConditions: TcxRichEdit
            Left = 11
            Top = 18
            TabOrder = 0
            Height = 251
            Width = 463
          end
        end
        object edtCheckName: TcxTextEdit
          Left = 74
          Top = 19
          Style.Shadow = False
          TabOrder = 1
          Width = 311
        end
        object lcCheckTableSchema: TcxLookupComboBox
          Left = 74
          Top = 67
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListSource = dmGenel.dsSchema
          Properties.OnEditValueChanged = lcCheckTableSchemaPropertiesEditValueChanged
          Style.Shadow = False
          TabOrder = 2
          Width = 407
        end
        object lcCheckTable: TcxLookupComboBox
          Left = 74
          Top = 90
          Properties.KeyFieldNames = 'TABLE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLE_NAME'
            end>
          Properties.ListSource = dsTable
          Style.Shadow = False
          TabOrder = 3
          Width = 407
        end
        object cbCheckSystemName: TcxCheckBox
          Left = 384
          Top = 18
          Caption = 'Use Oracle Name'
          Style.Shadow = False
          TabOrder = 4
          Transparent = True
          Width = 113
        end
      end
    end
    object tsForeignKey: TcxTabSheet
      Caption = 'Foreign Key'
      ImageIndex = 3
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 8
        TabOrder = 0
        Transparent = True
        DesignSize = (
          513
          421)
        Height = 421
        Width = 513
        object Label23: TLabel
          Left = 23
          Top = 16
          Width = 34
          Height = 13
          Caption = 'Name :'
          Transparent = True
        end
        object Label24: TLabel
          Left = 269
          Top = 57
          Width = 33
          Height = 13
          Caption = 'Table :'
          Transparent = True
        end
        object Label25: TLabel
          Left = 15
          Top = 56
          Width = 44
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object Bevel3: TBevel
          Left = 16
          Top = 43
          Width = 485
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object cxGroupBox5: TcxGroupBox
          Left = 9
          Top = 77
          Caption = 'Key Fields'
          TabOrder = 0
          Transparent = True
          Height = 151
          Width = 496
          object sbtnAddFKey: TSpeedButton
            Left = 235
            Top = 43
            Width = 23
            Height = 22
            Caption = '>'
            OnClick = sbtnAddFKeyClick
          end
          object sbtnAddAllFKey: TSpeedButton
            Left = 235
            Top = 67
            Width = 23
            Height = 22
            Caption = '>>'
            OnClick = sbtnAddAllFKeyClick
          end
          object sbtnRemoveFKey: TSpeedButton
            Left = 235
            Top = 91
            Width = 23
            Height = 22
            Caption = '<'
            OnClick = sbtnRemoveFKeyClick
          end
          object sbtnRemoveAllFKey: TSpeedButton
            Left = 235
            Top = 115
            Width = 23
            Height = 22
            Caption = '<<'
            OnClick = sbtnRemoveAllFKeyClick
          end
          object cxGrid1: TcxGrid
            Left = 10
            Top = 20
            Width = 220
            Height = 119
            TabOrder = 0
            LookAndFeel.Kind = lfOffice11
            object cxGridDBTableView2: TcxGridDBTableView
              OnDblClick = sbtnAddFKeyClick
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dTableColumns
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
              object cxGridDBColumn2: TcxGridDBColumn
                Caption = 'Table Columns'
                DataBinding.FieldName = 'COLUMN_NAME'
                Width = 120
              end
              object cxGridDBColumn3: TcxGridDBColumn
                Caption = 'Type'
                DataBinding.FieldName = 'DATA_TYPE'
                Width = 88
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = cxGridDBTableView2
            end
          end
          object cxGrid2: TcxGrid
            Left = 264
            Top = 20
            Width = 220
            Height = 119
            TabOrder = 1
            LookAndFeel.Kind = lfOffice11
            object cxGridDBTableView3: TcxGridDBTableView
              OnDblClick = sbtnRemoveFKeyClick
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsKeyColumns
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
              object cxGridDBColumn4: TcxGridDBColumn
                Caption = 'Selected Columns'
                DataBinding.FieldName = 'COLUMN_NAME'
                Options.Editing = False
                Width = 115
              end
              object cxGridDBColumn5: TcxGridDBColumn
                Caption = 'Type'
                DataBinding.FieldName = 'DATA_TYPE'
                Options.Editing = False
                Width = 51
              end
            end
            object cxGridLevel3: TcxGridLevel
              GridView = cxGridDBTableView3
            end
          end
        end
        object edtForeignKeyName: TcxTextEdit
          Left = 64
          Top = 12
          Style.Shadow = False
          TabOrder = 1
          Width = 321
        end
        object lcForeignTableSchema: TcxLookupComboBox
          Left = 64
          Top = 52
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListSource = dmGenel.dsSchema
          Properties.OnEditValueChanged = lcForeignTableSchemaPropertiesEditValueChanged
          Style.Shadow = False
          TabOrder = 2
          Width = 169
        end
        object lcForeignTable: TcxLookupComboBox
          Left = 312
          Top = 54
          Properties.KeyFieldNames = 'TABLE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLE_NAME'
            end>
          Properties.ListSource = dsTable
          Properties.OnEditValueChanged = lcForeignTablePropertiesEditValueChanged
          Style.Shadow = False
          TabOrder = 3
          Width = 191
        end
        object cbForeignKeySystemName: TcxCheckBox
          Left = 388
          Top = 12
          Caption = 'Use Oracle Name'
          Style.Shadow = False
          TabOrder = 4
          Transparent = True
          Width = 111
        end
        object cxGroupBox7: TcxGroupBox
          Left = 9
          Top = 227
          Caption = 'Referanced Fields'
          TabOrder = 5
          Transparent = True
          Height = 183
          Width = 496
          object sbtnAddRKey: TSpeedButton
            Left = 235
            Top = 78
            Width = 23
            Height = 22
            Caption = '>'
            OnClick = sbtnAddRKeyClick
          end
          object sbtnAddAllRKey: TSpeedButton
            Left = 235
            Top = 102
            Width = 23
            Height = 22
            Caption = '>>'
            OnClick = sbtnAddAllRKeyClick
          end
          object sbtnRemoveRKey: TSpeedButton
            Left = 235
            Top = 126
            Width = 23
            Height = 22
            Caption = '<'
            OnClick = sbtnRemoveRKeyClick
          end
          object sbtnRemoveAllRKey: TSpeedButton
            Left = 235
            Top = 150
            Width = 23
            Height = 22
            Caption = '<<'
            OnClick = sbtnRemoveAllRKeyClick
          end
          object Label6: TLabel
            Left = 15
            Top = 26
            Width = 44
            Height = 13
            Caption = 'Schema :'
            Transparent = True
          end
          object Label8: TLabel
            Left = 261
            Top = 25
            Width = 33
            Height = 13
            Caption = 'Table :'
            Transparent = True
          end
          object cxGrid3: TcxGrid
            Left = 10
            Top = 54
            Width = 220
            Height = 119
            TabOrder = 0
            LookAndFeel.Kind = lfOffice11
            object cxGridDBTableView4: TcxGridDBTableView
              OnDblClick = sbtnAddRKeyClick
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsRefTableColumns
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
              object cxGridDBColumn6: TcxGridDBColumn
                Caption = 'Table Columns'
                DataBinding.FieldName = 'COLUMN_NAME'
                Width = 120
              end
              object cxGridDBColumn7: TcxGridDBColumn
                Caption = 'Type'
                DataBinding.FieldName = 'DATA_TYPE'
                Width = 88
              end
            end
            object cxGridLevel4: TcxGridLevel
              GridView = cxGridDBTableView4
            end
          end
          object cxGrid4: TcxGrid
            Left = 264
            Top = 54
            Width = 220
            Height = 119
            TabOrder = 1
            LookAndFeel.Kind = lfOffice11
            object cxGridDBTableView5: TcxGridDBTableView
              OnDblClick = sbtnRemoveRKeyClick
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsRefTableKeyColumns
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
              object cxGridDBColumn8: TcxGridDBColumn
                Caption = 'Selected Columns'
                DataBinding.FieldName = 'COLUMN_NAME'
                Options.Editing = False
                Width = 115
              end
              object cxGridDBColumn9: TcxGridDBColumn
                Caption = 'Type'
                DataBinding.FieldName = 'DATA_TYPE'
                Options.Editing = False
                Width = 51
              end
            end
            object cxGridLevel5: TcxGridLevel
              GridView = cxGridDBTableView5
            end
          end
          object lcRefTableSchema: TcxLookupComboBox
            Left = 64
            Top = 22
            Properties.KeyFieldNames = 'USERNAME'
            Properties.ListColumns = <
              item
                FieldName = 'USERNAME'
              end>
            Properties.ListSource = dmGenel.dsSchema
            Properties.OnEditValueChanged = lcRefTableSchemaPropertiesEditValueChanged
            Style.Shadow = False
            TabOrder = 2
            Width = 167
          end
          object lcRefTable: TcxLookupComboBox
            Left = 299
            Top = 21
            Properties.KeyFieldNames = 'TABLE_NAME'
            Properties.ListColumns = <
              item
                FieldName = 'TABLE_NAME'
              end>
            Properties.ListSource = dsRefTable
            Properties.OnEditValueChanged = lcRefTablePropertiesEditValueChanged
            Style.Shadow = False
            TabOrder = 3
            Width = 174
          end
        end
      end
    end
    object tsStorage: TcxTabSheet
      Caption = 'Physical Attributes'
      ImageIndex = 6
      object cxGroupBox8: TcxGroupBox
        Left = 8
        Top = 8
        TabOrder = 0
        Transparent = True
        Height = 420
        Width = 512
        object Label7: TLabel
          Left = 36
          Top = 61
          Width = 69
          Height = 13
          Caption = 'Percent Free :'
          Transparent = True
        end
        object Label15: TLabel
          Left = 36
          Top = 85
          Width = 66
          Height = 13
          Caption = 'Tablespacse :'
          Transparent = True
        end
        object edtPercentFree: TcxMaskEdit
          Left = 113
          Top = 58
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 0
          Text = '10'
          Width = 128
        end
        object cxGroupBox3: TcxGroupBox
          Left = 15
          Top = 106
          Caption = 'Storage Clause'
          TabOrder = 1
          Transparent = True
          Height = 119
          Width = 482
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
            Top = 42
            Width = 67
            Height = 13
            Caption = 'Next Extend :'
            Transparent = True
          end
          object Label13: TLabel
            Left = 257
            Top = 21
            Width = 63
            Height = 13
            Caption = 'Min Extents :'
            Transparent = True
          end
          object Label14: TLabel
            Left = 257
            Top = 43
            Width = 67
            Height = 13
            Caption = 'Max Extents :'
            Transparent = True
          end
          object Label29: TLabel
            Left = 20
            Top = 64
            Width = 67
            Height = 13
            Caption = 'Pct Increase :'
            Transparent = True
          end
          object Label30: TLabel
            Left = 257
            Top = 65
            Width = 48
            Height = 13
            Caption = 'Free List :'
            Transparent = True
          end
          object Label31: TLabel
            Left = 257
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
            Left = 98
            Top = 18
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 0
            Text = '0'
            Width = 132
          end
          object edtNextExtend: TcxMaskEdit
            Left = 98
            Top = 40
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 1
            Text = '0'
            Width = 132
          end
          object edtMinExtents: TcxMaskEdit
            Left = 328
            Top = 18
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 2
            Text = '0'
            Width = 137
          end
          object edtMaxExtents: TcxMaskEdit
            Left = 328
            Top = 40
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 3
            Text = '0'
            Width = 137
          end
          object edtPctIncrease: TcxMaskEdit
            Left = 98
            Top = 62
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 4
            Text = '0'
            Width = 132
          end
          object edtFreeList: TcxMaskEdit
            Left = 328
            Top = 62
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 5
            Text = '0'
            Width = 137
          end
          object edtFreeGroup: TcxMaskEdit
            Left = 328
            Top = 84
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 6
            Text = '0'
            Width = 137
          end
          object cbBufferPool: TcxImageComboBox
            Left = 98
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
            Width = 133
          end
        end
        object lcTablespace: TcxLookupComboBox
          Left = 113
          Top = 82
          Properties.KeyFieldNames = 'TABLESPACE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLESPACE_NAME'
            end>
          Properties.ListSource = dmGenel.dsTablespace
          TabOrder = 2
          Width = 193
        end
        object cbUIA: TcxCheckBox
          Left = 26
          Top = 24
          Caption = 'Using Index Attributes'
          ParentFont = False
          Style.Font.Charset = TURKISH_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 3
          Transparent = True
          Width = 175
        end
      end
    end
    object tsOptions: TcxTabSheet
      Caption = 'Options'
      ImageIndex = 4
      object cxGroupBox9: TcxGroupBox
        Left = 8
        Top = 8
        TabOrder = 0
        Transparent = True
        Height = 421
        Width = 514
        object rgrpStatus: TcxRadioGroup
          Left = 12
          Top = 15
          Caption = 'Status'
          Properties.Items = <
            item
              Caption = 'Disabled'
            end
            item
              Caption = 'Enabled'
            end>
          ItemIndex = 1
          TabOrder = 0
          Transparent = True
          Height = 73
          Width = 225
        end
        object rgrpValidation: TcxRadioGroup
          Left = 267
          Top = 15
          Caption = 'Validation'
          Properties.Items = <
            item
              Caption = 'No Validate'
            end
            item
              Caption = 'Validate'
            end>
          Properties.OnChange = rgrpValidationPropertiesChange
          ItemIndex = 1
          TabOrder = 1
          Transparent = True
          Height = 73
          Width = 233
        end
        object rgrpDeferrable: TcxRadioGroup
          Left = 12
          Top = 95
          Caption = 'Deferrable'
          Enabled = False
          Properties.Items = <
            item
              Caption = 'Initially immediate'
            end
            item
              Caption = 'Initially deffered'
            end>
          ItemIndex = 0
          TabOrder = 2
          Transparent = True
          Height = 73
          Width = 225
        end
        object rgrpRely: TcxRadioGroup
          Left = 267
          Top = 95
          Caption = 'Relly'
          Properties.Items = <
            item
              Caption = 'No rely'
            end
            item
              Caption = 'Rely'
            end>
          ItemIndex = 0
          TabOrder = 3
          Transparent = True
          Height = 73
          Width = 233
        end
        object grpExceptions: TcxGroupBox
          Left = 12
          Top = 179
          Caption = 'Exceptions processing'
          TabOrder = 4
          Transparent = True
          Height = 81
          Width = 488
          object Label1: TLabel
            Left = 10
            Top = 25
            Width = 44
            Height = 13
            Caption = 'Schema :'
            Transparent = True
          end
          object Label5: TLabel
            Left = 20
            Top = 49
            Width = 33
            Height = 13
            Caption = 'Table :'
            Transparent = True
          end
          object lcbExceptionSchema: TcxLookupComboBox
            Left = 64
            Top = 24
            Properties.KeyFieldNames = 'USERNAME'
            Properties.ListColumns = <
              item
                FieldName = 'USERNAME'
              end>
            Properties.ListSource = dmGenel.dsSchema
            Properties.OnEditValueChanged = cxLookupComboBox1PropertiesEditValueChanged
            TabOrder = 0
            Width = 409
          end
          object lcbExceptionTable: TcxLookupComboBox
            Left = 64
            Top = 47
            Properties.KeyFieldNames = 'TABLE_NAME'
            Properties.ListColumns = <
              item
                FieldName = 'TABLE_NAME'
              end>
            Properties.ListSource = dsExceptionTable
            TabOrder = 1
            Width = 409
          end
        end
        object cbDeferrable: TcxCheckBox
          Left = 73
          Top = 92
          Properties.OnChange = cbDeferrablePropertiesChange
          TabOrder = 5
          Transparent = True
          Width = 163
        end
        object rgrpDeleteRule: TcxRadioGroup
          Left = 12
          Top = 269
          Caption = 'Delete Rule'
          Properties.Columns = 3
          Properties.Items = <
            item
              Caption = 'No Action'
            end
            item
              Caption = 'On Delete Set Null'
            end
            item
              Caption = 'On Delete Cascade'
            end>
          ItemIndex = 0
          TabOrder = 6
          Transparent = True
          Height = 48
          Width = 489
        end
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 5
      object edtDDL: TcxRichEdit
        Left = 8
        Top = 8
        Properties.ReadOnly = True
        Style.Shadow = False
        TabOrder = 0
        Height = 422
        Width = 513
      end
    end
  end
  object cxGroupBox10: TcxGroupBox
    Left = 7
    Top = 473
    TabOrder = 1
    Height = 49
    Width = 536
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
    Left = 128
    Top = 407
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
  object dTableColumns: TDataSource
    DataSet = qTableColumns
    Left = 97
    Top = 408
  end
  object qKeyColumns: TVirtualTable
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
    Left = 130
    Top = 441
    Data = {
      010004000B00434F4C554D4E5F4E414D45010014000900444154415F54595045
      01006A0005004F52444552010014000400534F525406000000000000000000}
    object qKeyColumnsCOLUMN_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'COLUMN_NAME'
    end
    object qKeyColumnsDATA_TYPE: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
    object qKeyColumnsORDER: TStringField
      FieldName = 'ORDER'
      Size = 4
    end
    object qKeyColumnsSORT: TFloatField
      FieldName = 'SORT'
    end
  end
  object dsKeyColumns: TDataSource
    DataSet = qKeyColumns
    Left = 97
    Top = 440
  end
  object qTable: TOraQuery
    SQL.Strings = (
      'select * from sys.All_tables')
    Left = 128
    Top = 375
    object StringField3: TStringField
      FieldName = 'TABLE_NAME'
      Size = 30
    end
  end
  object dsTable: TDataSource
    DataSet = qTable
    Left = 97
    Top = 377
  end
  object qRefTable: TOraQuery
    SQL.Strings = (
      'select * from sys.All_tables')
    Left = 56
    Top = 375
    object StringField1: TStringField
      FieldName = 'TABLE_NAME'
      Size = 30
    end
  end
  object dsRefTable: TDataSource
    DataSet = qRefTable
    Left = 25
    Top = 376
  end
  object qRefTableColumns: TOraQuery
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
    Top = 408
    object StringField2: TStringField
      FieldName = 'COLUMN_NAME'
      Required = True
      Size = 30
    end
    object StringField4: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
    object FloatField1: TFloatField
      FieldName = 'COLUMN_ID'
    end
  end
  object dsRefTableColumns: TDataSource
    DataSet = qRefTableColumns
    Left = 25
    Top = 409
  end
  object qRefTableKeyColumns: TVirtualTable
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
    Left = 56
    Top = 438
    Data = {
      010004000B00434F4C554D4E5F4E414D45010014000900444154415F54595045
      01006A0005004F52444552010014000400534F525406000000000000000000}
    object StringField5: TStringField
      DisplayWidth = 30
      FieldName = 'COLUMN_NAME'
    end
    object StringField6: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
    object StringField7: TStringField
      FieldName = 'ORDER'
      Size = 4
    end
    object FloatField2: TFloatField
      FieldName = 'SORT'
    end
  end
  object dsRefTableKeyColumns: TDataSource
    DataSet = qRefTableKeyColumns
    Left = 23
    Top = 437
  end
  object qExceptionTable: TOraQuery
    SQL.Strings = (
      'select * from sys.All_tables')
    Left = 128
    Top = 343
    object StringField8: TStringField
      FieldName = 'TABLE_NAME'
      Size = 30
    end
  end
  object dsExceptionTable: TDataSource
    DataSet = qExceptionTable
    Left = 97
    Top = 345
  end
end
