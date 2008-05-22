object TableDetailFrm: TTableDetailFrm
  Left = 294
  Top = 132
  Width = 633
  Height = 640
  BorderIcons = [biSystemMenu]
  Caption = 'TableDetailFrm'
  Color = clBtnFace
  Constraints.MinWidth = 600
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  DesignSize = (
    625
    606)
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 8
    Top = 8
    Width = 606
    Height = 528
    ActivePage = tsTable
    Anchors = [akLeft, akTop, akRight, akBottom]
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    TabSlants.Kind = skCutCorner
    TabWidth = 95
    OnPageChanging = pcPageChanging
    ClientRectBottom = 527
    ClientRectLeft = 1
    ClientRectRight = 605
    ClientRectTop = 20
    object tsTable: TcxTabSheet
      Caption = 'Table'
      ImageIndex = 0
      DesignSize = (
        604
        507)
      object Label2: TLabel
        Left = 10
        Top = 18
        Width = 34
        Height = 13
        Caption = 'Name :'
        Transparent = True
      end
      object Label1: TLabel
        Left = 311
        Top = 19
        Width = 44
        Height = 13
        Caption = 'Schema :'
        Transparent = True
      end
      object edtTableName: TcxTextEdit
        Left = 51
        Top = 15
        Style.Shadow = False
        TabOrder = 0
        Width = 238
      end
      object lcTableSchema: TcxLookupComboBox
        Left = 365
        Top = 15
        Anchors = [akLeft, akTop, akRight]
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'USERNAME'
        Properties.ListColumns = <
          item
            FieldName = 'USERNAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmGenel.dsSchema
        Style.Shadow = False
        TabOrder = 1
        Width = 228
      end
      object gbColumns: TcxGroupBox
        Left = 8
        Top = 90
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Style.BorderStyle = ebsNone
        TabOrder = 2
        Transparent = True
        Height = 409
        Width = 587
        object redtTableSQL: TcxRichEdit
          Left = 2
          Top = 100
          Align = alClient
          TabOrder = 4
          Height = 140
          Width = 583
        end
        object gridColumn: TcxGrid
          Left = 2
          Top = 100
          Width = 583
          Height = 140
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          object gridColumnDB: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.PriorPage.Visible = True
            NavigatorButtons.Refresh.Visible = False
            NavigatorButtons.SaveBookmark.Visible = False
            NavigatorButtons.GotoBookmark.Visible = False
            NavigatorButtons.Filter.Visible = False
            FilterBox.CustomizeDialog = False
            DataController.DataSource = dsTableColumns
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoInsertOnNewItemRowFocusing]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Appending = True
            OptionsData.Inserting = False
            OptionsView.Navigator = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object gridColumnDBCOLUMN_NAME: TcxGridDBColumn
              Caption = 'Column Name'
              DataBinding.FieldName = 'COLUMN_NAME'
              Width = 112
            end
            object gridColumnDBDATA_TYPE: TcxGridDBColumn
              Caption = 'Data Type'
              DataBinding.FieldName = 'DATA_TYPE'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'BFILE'
                  ImageIndex = 0
                  Value = 'BFILE'
                end
                item
                  Description = 'BINARY_DOUBLE'
                  Value = 'BINARY_DOUBLE'
                end
                item
                  Description = 'BINARY_FLOAT'
                  Value = 'BINARY_FLOAT'
                end
                item
                  Description = 'BLOB'
                  Value = 'BLOB'
                end
                item
                  Description = 'CHAR'
                  Value = 'CHAR'
                end
                item
                  Description = 'CLOB'
                  Value = 'CLOB'
                end
                item
                  Description = 'DATE'
                  Value = 'DATE'
                end
                item
                  Description = 'FLOAT'
                  Value = 'FLOAT'
                end
                item
                  Description = 'LONG'
                  Value = 'LONG'
                end
                item
                  Description = 'LONG RAW'
                  Value = 'LONG RAW'
                end
                item
                  Description = 'MLSLABEL'
                  Value = 'MLSLABEL'
                end
                item
                  Description = 'NCHAR'
                  Value = 'NCHAR'
                end
                item
                  Description = 'NCLOB'
                  Value = 'NCLOB'
                end
                item
                  Description = 'NUMBER'
                  Value = 'NUMBER'
                end
                item
                  Description = 'NVARCHAR2'
                  Value = 'NVARCHAR2'
                end
                item
                  Description = 'RAW'
                  Value = 'RAW'
                end
                item
                  Description = 'ROWID'
                  Value = 'ROWID'
                end
                item
                  Description = 'URITYPE'
                  Value = 'URITYPE'
                end
                item
                  Description = 'UROWID'
                  Value = 'UROWID'
                end
                item
                  Description = 'VARCHAR2'
                  Value = 'VARCHAR2'
                end
                item
                  Description = 'CHAR VARYING'
                  Value = 'CHAR VARYING'
                end
                item
                  Description = 'CHARACTER'
                  Value = 'CHARACTER'
                end
                item
                  Description = 'CHARACTER VARYING'
                  Value = 'CHARACTER VARYING'
                end
                item
                  Description = 'DECIMAL'
                  Value = 'DECIMAL'
                end
                item
                  Description = 'DOUBLE PRECISION'
                  Value = 'DOUBLE PRECISION'
                end
                item
                  Description = 'INT'
                  Value = 'INT'
                end
                item
                  Description = 'INTEGER'
                  Value = 'INTEGER'
                end
                item
                  Description = 'NATIONAL CHAR'
                  Value = 'NATIONAL CHAR'
                end
                item
                  Description = 'NATIONAL CHAR VARYING'
                  Value = 'NATIONAL CHAR VARYING'
                end
                item
                  Description = 'NATIONAL CHARACTER'
                  Value = 'NATIONAL CHARACTER'
                end
                item
                  Description = 'NATIONAL CHARACTER VARYING'
                  Value = 'NATIONAL CHARACTER VARYING'
                end
                item
                  Description = 'NCHAR VARYING'
                  Value = 'NCHAR VARYING'
                end
                item
                  Description = 'NUMERIC'
                  Value = 'NUMERIC'
                end
                item
                  Description = 'REAL'
                  Value = 'REAL'
                end
                item
                  Description = 'SMALLINT'
                  Value = 'SMALLINT'
                end
                item
                  Description = 'VARCHAR'
                  Value = 'VARCHAR'
                end>
              Properties.OnEditValueChanged = gridColumnDBDATA_TYPEPropertiesEditValueChanged
              Width = 97
            end
            object gridColumnDBDATA_LENGTH: TcxGridDBColumn
              Caption = 'Size'
              DataBinding.FieldName = 'DATA_LENGTH'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.ValueType = vtFloat
              Width = 47
            end
            object gridColumnDBDATA_SCALE: TcxGridDBColumn
              Caption = 'Scale'
              DataBinding.FieldName = 'DATA_SCALE'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.ValueType = vtFloat
              Width = 44
            end
            object gridColumnDBNULLABLE: TcxGridDBColumn
              Caption = 'Not Null'
              DataBinding.FieldName = 'NULLABLE'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'Y'
              Properties.ValueUnchecked = 'N'
              Width = 46
            end
            object gridColumnDBDATA_DEFAULT: TcxGridDBColumn
              Caption = 'Default'
              DataBinding.FieldName = 'DATA_DEFAULT'
              Width = 75
            end
            object gridColumnDBCOMMENT: TcxGridDBColumn
              Caption = 'Comment'
              DataBinding.FieldName = 'COMMENTS'
              Width = 150
            end
          end
          object gridColumnLevel1: TcxGridLevel
            GridView = gridColumnDB
          end
        end
        object gbColumnObject: TcxGroupBox
          Left = 2
          Top = 56
          Align = alTop
          Caption = 'Object'
          TabOrder = 1
          Transparent = True
          Height = 44
          Width = 583
          object Label32: TLabel
            Left = 8
            Top = 18
            Width = 39
            Height = 13
            Caption = 'Owner :'
            Transparent = True
          end
          object Label33: TLabel
            Left = 220
            Top = 17
            Width = 31
            Height = 13
            Caption = 'Type :'
            Transparent = True
          end
          object lcbObjectOwner: TcxLookupComboBox
            Left = 48
            Top = 14
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'USERNAME'
            Properties.ListColumns = <
              item
                FieldName = 'USERNAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmGenel.dsSchema
            Properties.OnChange = lcbObjectOwnerPropertiesChange
            Style.Shadow = False
            TabOrder = 0
            Width = 166
          end
          object lcbObjectType: TcxLookupComboBox
            Left = 257
            Top = 14
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'TYPE_NAME'
            Properties.ListColumns = <
              item
                FieldName = 'TYPE_NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsUserDataType
            Properties.OnEditValueChanged = lcbObjectTypePropertiesEditValueChanged
            Style.Shadow = False
            TabOrder = 1
            Width = 166
          end
          object cbObjectIdentifier: TcxCheckBox
            Left = 438
            Top = 8
            Caption = 'Object Identifier is Primary Key'
            Properties.MultiLine = True
            TabOrder = 2
            Transparent = True
            Width = 115
          end
        end
        object rgColumnType: TcxRadioGroup
          Left = 2
          Top = 16
          Align = alTop
          Caption = 'Column Type'
          Properties.Columns = 3
          Properties.Items = <
            item
              Caption = 'Define Columns'
            end
            item
              Caption = 'Define Query'
            end
            item
              Caption = 'Object Table'
            end>
          Properties.OnChange = rgColumnTypePropertiesChange
          ItemIndex = 0
          TabOrder = 2
          Transparent = True
          Height = 40
          Width = 583
        end
        object gbConstraintDefinition: TcxGroupBox
          Left = 2
          Top = 240
          Align = alBottom
          Caption = 'Constraint Definition'
          TabOrder = 3
          Transparent = True
          Height = 119
          Width = 583
          object Label30: TLabel
            Left = 348
            Top = 29
            Width = 62
            Height = 13
            Caption = 'Delete Rule :'
            Transparent = True
          end
          object Label31: TLabel
            Left = 372
            Top = 51
            Width = 38
            Height = 13
            Caption = 'Status :'
            Transparent = True
          end
          object Label34: TLabel
            Left = 351
            Top = 73
            Width = 58
            Height = 13
            Caption = 'Deferrable :'
            Transparent = True
          end
          object Label35: TLabel
            Left = 357
            Top = 93
            Width = 53
            Height = 13
            Caption = 'Validation :'
            Transparent = True
          end
          object Label36: TLabel
            Left = 42
            Top = 29
            Width = 69
            Height = 13
            Caption = 'Column Type :'
            Transparent = True
          end
          object Label37: TLabel
            Left = 78
            Top = 51
            Width = 34
            Height = 13
            Caption = 'Name :'
            Transparent = True
          end
          object lblForeignKeyTable: TLabel
            Left = 20
            Top = 72
            Width = 92
            Height = 13
            Caption = 'Referanced Table :'
            Transparent = True
            Visible = False
          end
          object lblForeignKeyColumn: TLabel
            Left = 8
            Top = 93
            Width = 101
            Height = 13
            Caption = 'Referanced Column :'
            Transparent = True
            Visible = False
          end
          object lblCheck: TLabel
            Left = 78
            Top = 72
            Width = 36
            Height = 13
            Caption = 'Check :'
            Transparent = True
            Visible = False
          end
          object cbDeleteRule: TcxDBComboBox
            Left = 413
            Top = 26
            DataBinding.DataField = 'CONSTRAINT_DELETE_RULE'
            DataBinding.DataSource = dsTableColumns
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'No Action'
              'On Delete Set Null'
              'On Delete Cascade')
            TabOrder = 0
            Width = 121
          end
          object cbStatus: TcxDBComboBox
            Left = 413
            Top = 47
            DataBinding.DataField = 'CONSTRAINT_STATUS'
            DataBinding.DataSource = dsTableColumns
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'Enable'
              'Disable')
            TabOrder = 1
            Width = 121
          end
          object cbDeferrable: TcxDBComboBox
            Left = 413
            Top = 69
            DataBinding.DataField = 'CONSTRAINT_DEFERRABLE'
            DataBinding.DataSource = dsTableColumns
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'Not Set'
              'Initially Immediate'
              'Initially Deferred')
            TabOrder = 2
            Width = 121
          end
          object cbValidation: TcxDBComboBox
            Left = 413
            Top = 90
            DataBinding.DataField = 'CONSTRAINT_VALIDATION'
            DataBinding.DataSource = dsTableColumns
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'No Validate'
              'Validate')
            TabOrder = 3
            Width = 121
          end
          object edtConstraintName: TcxDBTextEdit
            Left = 115
            Top = 47
            DataBinding.DataField = 'CONSTRAINT_NAME'
            DataBinding.DataSource = dsTableColumns
            TabOrder = 4
            Width = 182
          end
          object cbUnique: TcxDBCheckBox
            Left = 238
            Top = 26
            Caption = 'Unique'
            DataBinding.DataField = 'UNIQUE'
            DataBinding.DataSource = dsTableColumns
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'True'
            Properties.ValueUnchecked = 'False'
            TabOrder = 5
            Transparent = True
            Width = 57
          end
          object lcbRefTable: TcxDBLookupComboBox
            Left = 115
            Top = 68
            DataBinding.DataField = 'CONSTRAINT_REF_TABLE'
            DataBinding.DataSource = dsTableColumns
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'TABLE_NAME'
            Properties.ListColumns = <
              item
                FieldName = 'TABLE_NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsRefTable
            Properties.OnChange = lcbRefTablePropertiesChange
            TabOrder = 6
            Visible = False
            Width = 183
          end
          object lcbRefTableColumn: TcxDBLookupComboBox
            Left = 115
            Top = 89
            DataBinding.DataField = 'CONSTRAINT_REF_COLUMN'
            DataBinding.DataSource = dsTableColumns
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'COLUMN_NAME'
            Properties.ListColumns = <
              item
                FieldName = 'COLUMN_NAME'
              end
              item
                FieldName = 'DATA_TYPE'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsRefTableColumns
            TabOrder = 7
            Visible = False
            Width = 183
          end
          object edtCheck: TcxDBTextEdit
            Left = 115
            Top = 68
            DataBinding.DataField = 'CONSTRAINT_CHK'
            DataBinding.DataSource = dsTableColumns
            TabOrder = 8
            Visible = False
            Width = 183
          end
          object icbColumnType: TcxDBImageComboBox
            Left = 115
            Top = 26
            DataBinding.DataField = 'CONSTRAINT_TYPE'
            DataBinding.DataSource = dsTableColumns
            Properties.Alignment.Horz = taLeftJustify
            Properties.Items = <
              item
                ImageIndex = 0
                Value = -1
              end
              item
                Description = 'Primary'
                ImageIndex = 0
                Value = 0
              end
              item
                Description = 'Check'
                Value = 2
              end
              item
                Description = 'Foreign'
                Value = 3
              end>
            Properties.OnChange = cbColumnTypePropertiesChange
            TabOrder = 9
            Width = 121
          end
        end
        object gbConstraintDefinition2: TcxGroupBox
          Left = 2
          Top = 359
          Align = alBottom
          Caption = 'Constraint Definition'
          TabOrder = 5
          Transparent = True
          Visible = False
          Height = 48
          Width = 583
          object Label27: TLabel
            Left = 10
            Top = 21
            Width = 69
            Height = 13
            Caption = 'Column Type :'
            Transparent = True
          end
          object icbColumnType2: TcxDBImageComboBox
            Left = 88
            Top = 18
            DataBinding.DataField = 'CONSTRAINT_TYPE'
            DataBinding.DataSource = dsTableColumns
            Properties.Alignment.Horz = taLeftJustify
            Properties.Items = <
              item
                ImageIndex = 0
                Value = -1
              end
              item
                Description = 'Primary'
                ImageIndex = 0
                Value = 0
              end>
            Properties.OnChange = cbColumnTypePropertiesChange
            TabOrder = 0
            Width = 121
          end
        end
      end
      object rgTableType: TcxRadioGroup
        Left = 9
        Top = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Table Type'
        Properties.Columns = 3
        Properties.Items = <
          item
            Caption = 'Standard'
          end
          item
            Caption = 'Index Organized'
          end
          item
            Caption = 'Advanced Quening'
          end
          item
            Caption = 'Global Temporary'
          end
          item
            Caption = 'Clustered'
          end
          item
            Caption = 'Externel'
          end>
        Properties.OnChange = rgTableTypePropertiesChange
        ItemIndex = 0
        StyleDisabled.BorderColor = clBtnShadow
        StyleDisabled.TextColor = clBtnShadow
        TabOrder = 3
        Transparent = True
        Height = 56
        Width = 584
      end
    end
    object tsStorage: TcxTabSheet
      Caption = 'Storage'
      ImageIndex = 0
      DesignSize = (
        604
        507)
      object cxGroupBox3: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          584
          488)
        Height = 488
        Width = 584
        object gbStorageClause: TcxGroupBox
          Left = 20
          Top = 104
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Storage Clause'
          TabOrder = 0
          Transparent = True
          Height = 119
          Width = 546
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
          object Label5: TLabel
            Left = 20
            Top = 65
            Width = 67
            Height = 13
            Caption = 'Pct Increase :'
            Transparent = True
          end
          object Label6: TLabel
            Left = 257
            Top = 65
            Width = 48
            Height = 13
            Caption = 'Free List :'
            Transparent = True
          end
          object Label16: TLabel
            Left = 257
            Top = 88
            Width = 66
            Height = 13
            Caption = 'Free Groups :'
            Transparent = True
          end
          object Label17: TLabel
            Left = 20
            Top = 87
            Width = 60
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
            Left = 332
            Top = 18
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 2
            Text = '0'
            Width = 90
          end
          object edtMaxExtents: TcxMaskEdit
            Left = 332
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
            Left = 332
            Top = 62
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 5
            Text = '0'
            Width = 90
          end
          object edtFreeGroup: TcxMaskEdit
            Left = 332
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
        object cbMonitoring: TcxCheckBox
          Left = 388
          Top = 242
          Caption = 'Monitoring'
          TabOrder = 1
          Transparent = True
          Width = 93
        end
        object cbRowMovement: TcxCheckBox
          Left = 236
          Top = 242
          Caption = 'Enable Row Movement'
          TabOrder = 2
          Transparent = True
          Width = 157
        end
        object rgCache: TcxRadioGroup
          Left = 18
          Top = 286
          Anchors = [akLeft, akTop, akRight]
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
          TabOrder = 3
          Transparent = True
          Height = 65
          Width = 548
        end
        object rgLogging: TcxRadioGroup
          Left = 17
          Top = 359
          Anchors = [akLeft, akTop, akRight]
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
          TabOrder = 4
          Transparent = True
          Height = 82
          Width = 550
        end
        object gbStorage: TcxGroupBox
          Left = 9
          Top = 5
          Style.BorderStyle = ebsNone
          TabOrder = 5
          Transparent = True
          Height = 94
          Width = 550
          object Label7: TLabel
            Left = 33
            Top = 20
            Width = 69
            Height = 13
            Caption = 'Percent Free :'
            Transparent = True
          end
          object Label8: TLabel
            Left = 33
            Top = 44
            Width = 71
            Height = 13
            Caption = 'Percent Used :'
            Transparent = True
          end
          object Label9: TLabel
            Left = 272
            Top = 20
            Width = 63
            Height = 13
            Caption = 'Initial Trans :'
            Transparent = True
          end
          object Label10: TLabel
            Left = 272
            Top = 44
            Width = 57
            Height = 13
            Caption = 'Max Trans :'
            Transparent = True
          end
          object Label15: TLabel
            Left = 33
            Top = 68
            Width = 66
            Height = 13
            Caption = 'Tablespacse :'
            Transparent = True
          end
          object edtPercentFree: TcxMaskEdit
            Left = 109
            Top = 17
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 0
            Text = '10'
            Width = 90
          end
          object edtPercentUsed: TcxMaskEdit
            Left = 109
            Top = 41
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
            Top = 17
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 2
            Text = '2'
            Width = 90
          end
          object edtMaxTrans: TcxMaskEdit
            Left = 343
            Top = 41
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 3
            Text = '255'
            Width = 90
          end
          object lcTablespace: TcxLookupComboBox
            Left = 109
            Top = 65
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'TABLESPACE_NAME'
            Properties.ListColumns = <
              item
                FieldName = 'TABLESPACE_NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmGenel.dsTablespace
            TabOrder = 4
            Width = 324
          end
        end
        object gbParalel: TcxGroupBox
          Left = 34
          Top = 220
          Style.BorderStyle = ebsNone
          TabOrder = 6
          Transparent = True
          Height = 59
          Width = 193
          object Label19: TLabel
            Left = 71
            Top = 10
            Width = 35
            Height = 13
            Caption = 'Degree'
            Transparent = True
          end
          object Label28: TLabel
            Left = 117
            Top = 10
            Width = 47
            Height = 13
            Caption = 'Instances'
            Transparent = True
          end
          object edtParalelInstances: TcxMaskEdit
            Left = 117
            Top = 24
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 0
            Text = '0'
            Width = 47
          end
          object edtParalelDegree: TcxMaskEdit
            Left = 69
            Top = 24
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 1
            Text = '0'
            Width = 41
          end
          object cbParalel: TcxCheckBox
            Left = 12
            Top = 24
            Caption = 'Paralel'
            Properties.OnChange = cbParalelPropertiesChange
            TabOrder = 2
            Transparent = True
            Width = 56
          end
        end
      end
    end
    object tsPartitions: TcxTabSheet
      Caption = 'Partitions'
      ImageIndex = 4
      object sbtnPartitionAdd: TSpeedButton
        Left = 184
        Top = 28
        Width = 23
        Height = 22
        Caption = '>'
        OnClick = sbtnPartitionAddClick
      end
      object sbtnPartitionAddAll: TSpeedButton
        Left = 184
        Top = 52
        Width = 23
        Height = 22
        Caption = '>>'
        OnClick = sbtnPartitionAddAllClick
      end
      object sbtnPartitionRemove: TSpeedButton
        Left = 184
        Top = 76
        Width = 23
        Height = 22
        Caption = '<'
        OnClick = sbtnPartitionRemoveClick
      end
      object sbtnPartitionRemoveAll: TSpeedButton
        Left = 184
        Top = 100
        Width = 23
        Height = 22
        Caption = '<<'
        OnClick = sbtnPartitionRemoveAllClick
      end
      object sbtnSubPartitionAdd: TSpeedButton
        Left = 390
        Top = 29
        Width = 23
        Height = 22
        Caption = '>'
        OnClick = sbtnSubPartitionAddClick
      end
      object sbtnSubPartitionAddAll: TSpeedButton
        Left = 390
        Top = 53
        Width = 23
        Height = 22
        Caption = '>>'
        OnClick = sbtnSubPartitionAddAllClick
      end
      object sbtnSubPartitionRemove: TSpeedButton
        Left = 390
        Top = 77
        Width = 23
        Height = 22
        Caption = '<'
        OnClick = sbtnSubPartitionRemoveClick
      end
      object sbtnSubPartitionRemoveAll: TSpeedButton
        Left = 390
        Top = 101
        Width = 23
        Height = 22
        Caption = '<<'
        OnClick = sbtnSubPartitionRemoveAllClick
      end
      object gridAvailabeColumns: TcxGrid
        Left = 7
        Top = 8
        Width = 173
        Height = 227
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
        Left = 213
        Top = 8
        Width = 172
        Height = 227
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
        Left = 422
        Top = 8
        Width = 170
        Height = 227
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
        Top = 243
        Width = 604
        Height = 264
        ActivePage = tsRange
        Align = alBottom
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = True
        Style = 9
        TabOrder = 3
        ClientRectBottom = 264
        ClientRectRight = 604
        ClientRectTop = 20
        object tsRange: TcxTabSheet
          Caption = 'Range / List Partitions'
          ImageIndex = 0
          DesignSize = (
            604
            244)
          object cxGrid1: TcxGrid
            Left = 7
            Top = 6
            Width = 587
            Height = 190
            Anchors = [akLeft, akTop, akRight]
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
            Left = 343
            Top = 206
            Width = 75
            Height = 25
            Caption = 'Add..'
            TabOrder = 1
            OnClick = btnRangeAddClick
            LookAndFeel.Kind = lfOffice11
          end
          object btnRangeEdit: TcxButton
            Left = 423
            Top = 206
            Width = 75
            Height = 25
            Caption = 'Edit...'
            TabOrder = 2
            OnClick = btnRangeEditClick
            LookAndFeel.Kind = lfOffice11
          end
          object btnRangeDelete: TcxButton
            Left = 502
            Top = 206
            Width = 75
            Height = 25
            Caption = 'Delete'
            TabOrder = 3
            OnClick = btnRangeDeleteClick
            LookAndFeel.Kind = lfOffice11
          end
          object rgPartitionRangeType: TcxRadioGroup
            Left = 8
            Top = 198
            Properties.Columns = 2
            Properties.Items = <
              item
                Caption = 'Range Partitions'
              end
              item
                Caption = 'List Partitions'
              end>
            ItemIndex = 0
            TabOrder = 4
            Transparent = True
            Height = 38
            Width = 249
          end
        end
        object tsHash: TcxTabSheet
          Caption = 'Hash Partitions'
          ImageIndex = 1
          DesignSize = (
            604
            244)
          object Label18: TLabel
            Left = 308
            Top = 214
            Width = 49
            Height = 13
            Caption = 'Quantity :'
            Transparent = True
          end
          object cxGrid2: TcxGrid
            Left = 7
            Top = 6
            Width = 587
            Height = 190
            Anchors = [akLeft, akTop, akRight]
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
            Left = 423
            Top = 207
            Width = 75
            Height = 25
            Caption = 'Add'
            TabOrder = 1
            OnClick = btnHashAddClick
            LookAndFeel.Kind = lfOffice11
          end
          object btnHashDelete: TcxButton
            Left = 502
            Top = 207
            Width = 75
            Height = 25
            Caption = 'Delete'
            TabOrder = 2
            OnClick = btnHashDeleteClick
            LookAndFeel.Kind = lfOffice11
          end
          object rgroupHashPartitionType: TcxRadioGroup
            Left = 8
            Top = 199
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
            Left = 358
            Top = 210
            Properties.MaxValue = 100.000000000000000000
            Properties.MinValue = 1.000000000000000000
            TabOrder = 4
            Value = 1
            Width = 54
          end
        end
      end
    end
    object tsSubpartition: TcxTabSheet
      Caption = 'Subpartitions'
      ImageIndex = 8
      DesignSize = (
        604
        507)
      object cxGroupBox9: TcxGroupBox
        Left = 8
        Top = 5
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          585
          490)
        Height = 490
        Width = 585
        object Label26: TLabel
          Left = 299
          Top = 459
          Width = 49
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Quantity :'
          Transparent = True
        end
        object gridSubPartition: TcxGrid
          Left = 8
          Top = 17
          Width = 566
          Height = 417
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          object gridDBSubPartition: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsSubPartition
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsData.DeletingConfirmation = False
            OptionsView.GroupByBox = False
            object cxGridDBColumn4: TcxGridDBColumn
              Caption = 'Subpartition Name'
              DataBinding.FieldName = 'PARTITION_NAME'
              Width = 167
            end
            object cxGridDBColumn5: TcxGridDBColumn
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
            object gridDBSubPartitionValues: TcxGridDBColumn
              Caption = 'Values'
              DataBinding.FieldName = 'VALUES'
              Visible = False
              Width = 200
            end
          end
          object cxGridLevel7: TcxGridLevel
            GridView = gridDBSubPartition
          end
        end
        object rgSubpartitionType: TcxRadioGroup
          Left = 8
          Top = 442
          Anchors = [akLeft, akBottom]
          Properties.Columns = 3
          Properties.Items = <
            item
              Caption = 'User Named'
            end
            item
              Caption = 'List'
            end>
          Properties.OnChange = rgSubpartitionTypePropertiesChange
          ItemIndex = 0
          TabOrder = 1
          Transparent = True
          Height = 38
          Width = 249
        end
        object edtSubQuantity: TcxSpinEdit
          Left = 353
          Top = 455
          Anchors = [akLeft, akBottom]
          Properties.MaxValue = 100.000000000000000000
          Properties.MinValue = 1.000000000000000000
          TabOrder = 2
          Value = 1
          Width = 54
        end
        object btnSubpartitionAdd: TcxButton
          Left = 418
          Top = 451
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Add'
          TabOrder = 3
          OnClick = btnSubpartitionAddClick
          LookAndFeel.Kind = lfOffice11
        end
        object btnSubpartitionDelete: TcxButton
          Left = 497
          Top = 451
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Delete'
          TabOrder = 4
          OnClick = btnSubpartitionDeleteClick
          LookAndFeel.Kind = lfOffice11
        end
      end
    end
    object tsClusters: TcxTabSheet
      Caption = 'Clusters'
      ImageIndex = 7
      DesignSize = (
        604
        507)
      object cxGroupBox8: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          585
          489)
        Height = 489
        Width = 585
        object Label40: TLabel
          Left = 44
          Top = 42
          Width = 44
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object Label41: TLabel
          Left = 46
          Top = 66
          Width = 41
          Height = 13
          Caption = 'Cluster :'
          Transparent = True
        end
        object cbCluster: TcxCheckBox
          Left = 16
          Top = 16
          Caption = 'Define table as part of a Cluster '
          Properties.OnChange = cbClusterPropertiesChange
          TabOrder = 0
          Transparent = True
          Width = 265
        end
        object lcbClusterSchema: TcxLookupComboBox
          Left = 91
          Top = 38
          Enabled = False
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsSchema
          Properties.OnEditValueChanged = lcbClusterSchemaPropertiesEditValueChanged
          Style.Shadow = False
          TabOrder = 1
          Width = 184
        end
        object lcbClusterTable: TcxLookupComboBox
          Left = 91
          Top = 62
          Enabled = False
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'CLUSTER_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'CLUSTER_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsCluster
          Properties.OnEditValueChanged = lcbClusterTablePropertiesEditValueChanged
          Style.Shadow = False
          TabOrder = 2
          Width = 184
        end
        object cxGrid3: TcxGrid
          Left = 13
          Top = 96
          Width = 559
          Height = 379
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 3
          object cxGrid3DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsClasterColumns
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object cxGrid3DBTableView1CLUSTER_COLUMN_NAME: TcxGridDBColumn
              Caption = 'Cluster Column'
              DataBinding.FieldName = 'CLUSTER_COLUMN_NAME'
              Options.Editing = False
            end
            object cxGrid3DBTableView1COLUMN_NAME: TcxGridDBColumn
              Caption = 'Table Column'
              DataBinding.FieldName = 'COLUMN_NAME'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.DropDownListStyle = lsFixedList
              Properties.KeyFieldNames = 'COLUMN_NAME'
              Properties.ListColumns = <
                item
                  FieldName = 'COLUMN_NAME'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dsTableColumns
            end
          end
          object cxGrid3Level1: TcxGridLevel
            GridView = cxGrid3DBTableView1
          end
        end
      end
    end
    object tsExternal: TcxTabSheet
      Caption = 'External'
      ImageIndex = 7
      DesignSize = (
        604
        507)
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 7
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          586
          490)
        Height = 490
        Width = 586
        object Label20: TLabel
          Left = 44
          Top = 19
          Width = 72
          Height = 13
          Caption = 'Access Driver :'
          Transparent = True
        end
        object Label21: TLabel
          Left = 49
          Top = 40
          Width = 67
          Height = 13
          Caption = 'Access Type :'
          Transparent = True
        end
        object Label22: TLabel
          Left = 27
          Top = 63
          Width = 89
          Height = 13
          Caption = 'Default Directory :'
          Transparent = True
        end
        object Label23: TLabel
          Left = 257
          Top = 276
          Width = 35
          Height = 13
          Caption = 'Degree'
          Transparent = True
        end
        object rgroupExternalLimit: TcxRadioGroup
          Left = 16
          Top = 273
          Caption = 'Reject Limit'
          Properties.Items = <
            item
              Caption = 'Unlimited'
            end
            item
              Caption = 'Specify'
            end>
          Properties.OnChange = rgroupKeyCompressionPropertiesChange
          ItemIndex = 1
          TabOrder = 0
          Transparent = True
          Height = 61
          Width = 138
        end
        object cbExternalParalel: TcxCheckBox
          Left = 195
          Top = 290
          Caption = 'Paralel'
          Properties.OnChange = cbExternalParalelPropertiesChange
          TabOrder = 1
          Transparent = True
          Width = 56
        end
        object icbDirectory: TcxImageComboBox
          Left = 120
          Top = 59
          Properties.Items = <
            item
              Description = 'ADMIN_DIR'
              ImageIndex = 0
              Value = 'ADMIN_DIR'
            end
            item
              Description = 'DATA_FILE_DIR'
              Value = 'DATA_FILE_DIR'
            end
            item
              Description = 'DATA_PUMP_DIR'
              Value = 'DATA_PUMP_DIR'
            end
            item
              Description = 'LOG_FILE_DIR'
              Value = 'LOG_FILE_DIR'
            end
            item
              Description = 'MEDIA_DIR'
              Value = 'MEDIA_DIR'
            end
            item
              Description = 'SUBDIR'
              Value = 'SUBDIR'
            end
            item
              Description = 'WORK_DIR'
              Value = 'WORK_DIR'
            end
            item
              Description = 'XMLDIR'
              Value = 'XMLDIR'
            end>
          TabOrder = 2
          Width = 182
        end
        object edtAccessDriver: TcxTextEdit
          Left = 120
          Top = 16
          TabOrder = 3
          Width = 182
        end
        object edtAccessType: TcxTextEdit
          Left = 120
          Top = 37
          TabOrder = 4
          Width = 182
        end
        object cxGroupBox2: TcxGroupBox
          Left = 11
          Top = 88
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Locations'
          TabOrder = 5
          Transparent = True
          DesignSize = (
            564
            177)
          Height = 177
          Width = 564
          object gridExternalLocations: TcxGrid
            Left = 9
            Top = 16
            Width = 543
            Height = 151
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            object gridDBExternalLocations: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              NavigatorButtons.PriorPage.Visible = False
              NavigatorButtons.NextPage.Visible = False
              NavigatorButtons.Refresh.Visible = False
              NavigatorButtons.SaveBookmark.Visible = False
              NavigatorButtons.GotoBookmark.Visible = False
              NavigatorButtons.Filter.Visible = False
              DataController.DataSource = dsExternalLocations
              DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoInsertOnNewItemRowFocusing]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.Appending = True
              OptionsView.Navigator = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object gridDBExternalLocationsColumn1: TcxGridDBColumn
                Caption = 'Directory'
                DataBinding.FieldName = 'DIRECTORY'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Items = <
                  item
                    Description = 'ADMIN_DIR'
                    ImageIndex = 0
                    Value = 'ADMIN_DIR'
                  end
                  item
                    Description = 'DATA_FILE_DIR'
                    Value = 'DATA_FILE_DIR'
                  end
                  item
                    Description = 'DATA_PUMP_DIR'
                    Value = 'DATA_PUMP_DIR'
                  end
                  item
                    Description = 'LOG_FILE_DIR'
                    Value = 'LOG_FILE_DIR'
                  end
                  item
                    Description = 'MEDIA_DIR'
                    Value = 'MEDIA_DIR'
                  end
                  item
                    Description = 'SUBDIR'
                    Value = 'SUBDIR'
                  end
                  item
                    Description = 'WORK_DIR'
                    Value = 'WORK_DIR'
                  end
                  item
                    Description = 'XMLDIR'
                    Value = 'XMLDIR'
                  end>
                Width = 170
              end
              object gridDBExternalLocationsColumn2: TcxGridDBColumn
                Caption = 'File Name'
                DataBinding.FieldName = 'FILE_NAME'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.OnButtonClick = gridDBExternalLocationsColumn2PropertiesButtonClick
                Width = 346
              end
            end
            object gridExternalLocationsLevel1: TcxGridLevel
              GridView = gridDBExternalLocations
            end
          end
        end
        object cxGroupBox10: TcxGroupBox
          Left = 11
          Top = 336
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Access Parameters'
          TabOrder = 6
          Transparent = True
          DesignSize = (
            564
            144)
          Height = 144
          Width = 564
          object redtExternalParameters: TcxRichEdit
            Left = 9
            Top = 47
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Height = 87
            Width = 545
          end
        end
        object btnOpenControlFile: TcxButton
          Left = 23
          Top = 360
          Width = 115
          Height = 19
          Caption = 'Open Control File...'
          TabOrder = 7
          OnClick = btnOpenControlFileClick
          LookAndFeel.Kind = lfOffice11
        end
        object edtExternalDegree: TcxSpinEdit
          Left = 252
          Top = 290
          Enabled = False
          TabOrder = 8
          Width = 49
        end
        object edtExternalLimit: TcxSpinEdit
          Left = 83
          Top = 309
          TabOrder = 9
          Width = 65
        end
      end
    end
    object tsIndexOrganized: TcxTabSheet
      Caption = 'Index Organized'
      ImageIndex = 6
      DesignSize = (
        604
        507)
      object cxGroupBox7: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          585
          489)
        Height = 489
        Width = 585
        object cxGroupBox11: TcxGroupBox
          Left = 11
          Top = 15
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Index Organized Parameters'
          TabOrder = 0
          Transparent = True
          Height = 129
          Width = 563
          object Label3: TLabel
            Left = 20
            Top = 30
            Width = 112
            Height = 13
            Caption = 'Percentage Threshold :'
            Transparent = True
          end
          object Label4: TLabel
            Left = 183
            Top = 61
            Width = 40
            Height = 13
            Caption = 'Columns'
            Transparent = True
          end
          object edtPercentageThreshold: TcxMaskEdit
            Left = 144
            Top = 27
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 0
            Text = '0'
            Width = 57
          end
          object cbKeyCompression: TcxCheckBox
            Left = 16
            Top = 58
            Caption = 'Key compression'
            Properties.OnChange = cbKeyCompressionPropertiesChange
            TabOrder = 1
            Transparent = True
            Width = 105
          end
          object edtKeyCompression: TcxMaskEdit
            Left = 123
            Top = 58
            Enabled = False
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 2
            Text = '0'
            Width = 57
          end
          object cbOverfloaw: TcxCheckBox
            Left = 16
            Top = 90
            Caption = 'Overflow '
            Properties.OnChange = cbOverfloawPropertiesChange
            TabOrder = 3
            Transparent = True
            Width = 72
          end
          object lcbIndexOrganizedField: TcxLookupComboBox
            Left = 89
            Top = 90
            Enabled = False
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'COLUMN_NAME'
            Properties.ListColumns = <
              item
                FieldName = 'COLUMN_NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsTableColumns
            Style.Shadow = False
            TabOrder = 4
            Width = 166
          end
        end
      end
    end
    object tsQueuing: TcxTabSheet
      Caption = 'Queuing'
      ImageIndex = 8
      DesignSize = (
        604
        507)
      object cxGroupBox4: TcxGroupBox
        Left = 8
        Top = 5
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        DesignSize = (
          586
          492)
        Height = 492
        Width = 586
        object cxGroupBox5: TcxGroupBox
          Left = 15
          Top = 15
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Payload type'
          TabOrder = 0
          Transparent = True
          Height = 105
          Width = 558
          object Label24: TLabel
            Left = 107
            Top = 56
            Width = 44
            Height = 13
            Caption = 'Schema :'
            Transparent = True
          end
          object Label25: TLabel
            Left = 118
            Top = 77
            Width = 31
            Height = 13
            Caption = 'Type :'
            Transparent = True
          end
          object rgPayloadType: TcxRadioGroup
            Left = 13
            Top = 14
            Properties.Items = <
              item
                Caption = 'Raw'
              end
              item
                Caption = 'Object'
              end>
            Properties.OnChange = rgPayloadTypePropertiesChange
            ItemIndex = 0
            Style.BorderStyle = ebsNone
            TabOrder = 0
            Transparent = True
            Height = 60
            Width = 79
          end
          object lcbQueuingSchema: TcxLookupComboBox
            Left = 155
            Top = 52
            Enabled = False
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'USERNAME'
            Properties.ListColumns = <
              item
                FieldName = 'USERNAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmGenel.dsSchema
            Properties.OnEditValueChanged = lcbQueuingSchemaPropertiesEditValueChanged
            Style.Shadow = False
            TabOrder = 1
            Width = 184
          end
          object lcbQueuingType: TcxLookupComboBox
            Left = 155
            Top = 74
            Enabled = False
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'TYPE_NAME'
            Properties.ListColumns = <
              item
                FieldName = 'TYPE_NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsQueuing
            Style.Shadow = False
            TabOrder = 2
            Width = 184
          end
        end
        object cxGroupBox6: TcxGroupBox
          Left = 15
          Top = 128
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Options'
          TabOrder = 1
          Transparent = True
          Height = 65
          Width = 558
          object cbQueuningSubscribes: TcxCheckBox
            Left = 24
            Top = 24
            Caption = 'Allow Subscribes'
            TabOrder = 0
            Transparent = True
            Width = 121
          end
          object cbQueuningMessageGrouping: TcxCheckBox
            Left = 160
            Top = 24
            Caption = 'Allow Message Grouping'
            TabOrder = 1
            Transparent = True
            Width = 161
          end
        end
        object rgQueuningCapatibility: TcxRadioGroup
          Left = 15
          Top = 200
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Capatibility'
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = '8.0'
            end
            item
              Caption = '8i'
            end>
          ItemIndex = 0
          TabOrder = 2
          Transparent = True
          Height = 50
          Width = 558
        end
        object cxGroupBox12: TcxGroupBox
          Left = 15
          Top = 256
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Sort List'
          TabOrder = 3
          Transparent = True
          DesignSize = (
            558
            121)
          Height = 121
          Width = 558
          object lbQueuingSortList: TcxListBox
            Left = 16
            Top = 22
            Width = 527
            Height = 84
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            Items.Strings = (
              'ENQ_TIME'
              'PRIORITY'
              'PRIORITY,ENQ_TIME'
              'ENQ_TIME,PRIORITY')
            TabOrder = 0
          end
        end
      end
    end
    object tsGlobalTemporary: TcxTabSheet
      Caption = 'Global Temporary'
      ImageIndex = 8
      DesignSize = (
        604
        507)
      object cxGroupBox13: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          585
          489)
        Height = 489
        Width = 585
        object rgBlobalTemporaryParams: TcxRadioGroup
          Left = 12
          Top = 15
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Global Temporary Parameters'
          Properties.Items = <
            item
              Caption = 'Delete Rows'
            end
            item
              Caption = 'Preserve Rows'
            end>
          Properties.OnChange = rgPayloadTypePropertiesChange
          ItemIndex = 0
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 0
          Transparent = True
          Height = 82
          Width = 559
        end
      end
    end
    object tsComment: TcxTabSheet
      Caption = 'Comment'
      ImageIndex = 9
      DesignSize = (
        604
        507)
      object redtComment: TcxRichEdit
        Left = 9
        Top = 8
        Anchors = [akLeft, akTop, akRight]
        Properties.ScrollBars = ssBoth
        Style.Shadow = False
        TabOrder = 0
        Height = 486
        Width = 586
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 8
      DesignSize = (
        604
        507)
      object redtDDL: TcxRichEdit
        Left = 9
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -13
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 487
        Width = 586
      end
    end
  end
  object cxGroupBox14: TcxGroupBox
    Left = 8
    Top = 544
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Height = 49
    Width = 609
    object btnCancel: TcxButton
      Left = 90
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnExecute: TcxButton
      Left = 10
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 1
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object qAvailabeColumns: TVirtualTable
    Left = 35
    Top = 349
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
    Left = 1
    Top = 349
  end
  object dsPartitionColumns: TDataSource
    DataSet = qPartitionColumns
    Left = 1
    Top = 381
  end
  object dsSubPartitionColumns: TDataSource
    DataSet = qSubPartitionColumns
    Left = 1
    Top = 413
  end
  object dsRangePartition: TDataSource
    DataSet = qRangePartition
    Left = 1
    Top = 445
  end
  object dsHashPartition: TDataSource
    DataSet = qHashPartition
    Left = 1
    Top = 477
  end
  object qHashPartition: TVirtualTable
    BeforePost = qHashPartitionBeforePost
    Left = 35
    Top = 477
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
  object qRangePartition: TVirtualTable
    Left = 35
    Top = 445
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
  object qSubPartitionColumns: TVirtualTable
    Left = 35
    Top = 413
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
  object qPartitionColumns: TVirtualTable
    Left = 35
    Top = 381
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
  object qTableColumns: TVirtualTable
    BeforePost = qTableColumnsBeforePost
    AfterScroll = qTableColumnsAfterScroll
    OnNewRecord = qTableColumnsNewRecord
    FieldDefs = <
      item
        Name = 'COLUMN_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATA_TYPE'
        DataType = ftString
        Size = 106
      end
      item
        Name = 'DATA_TYPE_MOD'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DATA_TYPE_OWNER'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATA_LENGTH'
        DataType = ftFloat
      end
      item
        Name = 'DATA_PRECISION'
        DataType = ftFloat
      end
      item
        Name = 'DATA_SCALE'
        DataType = ftFloat
      end
      item
        Name = 'NULLABLE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'COLUMN_ID'
        DataType = ftFloat
      end
      item
        Name = 'DATA_DEFAULT'
        DataType = ftMemo
      end
      item
        Name = 'COMMENTS'
        DataType = ftString
        Size = 4000
      end
      item
        Name = 'CONSTRAINT_TYPE'
        DataType = ftInteger
      end
      item
        Name = 'UNIQUE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONSTRAINT_NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CONSTRAINT_REF_TABLE'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CONSTRAINT_REF_COLUMN'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CONSTRAINT_DELETE_RULE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONSTRAINT_STATUS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONSTRAINT_DEFERRABLE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONSTRAINT_VALIDATION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONSTRAINT_CHK'
        DataType = ftString
        Size = 200
      end>
    Left = 34
    Top = 306
    Data = {
      010015000B00434F4C554D4E5F4E414D4501001E000900444154415F54595045
      01006A000D00444154415F545950455F4D4F44010003000F00444154415F5459
      50455F4F574E455201001E000B00444154415F4C454E475448060000000E0044
      4154415F505245434953494F4E060000000A00444154415F5343414C45060000
      0008004E554C4C41424C45010001000900434F4C554D4E5F4944060000000C00
      444154415F44454641554C54100000000800434F4D4D454E54530100A00F0F00
      434F4E53545241494E545F54595045030000000600554E49515545010014000F
      00434F4E53545241494E545F4E414D45010032001400434F4E53545241494E54
      5F5245465F5441424C45010028001500434F4E53545241494E545F5245465F43
      4F4C554D4E01001E001600434F4E53545241494E545F44454C4554455F52554C
      45010014001100434F4E53545241494E545F535441545553010014001500434F
      4E53545241494E545F44454645525241424C45010014001500434F4E53545241
      494E545F56414C49444154494F4E010014000E00434F4E53545241494E545F43
      484B0100C800000000000000}
    object qTableColumnsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Required = True
      Size = 30
    end
    object qTableColumnsDATA_TYPE: TStringField
      FieldName = 'DATA_TYPE'
      Required = True
      Size = 106
    end
    object qTableColumnsDATA_TYPE_MOD: TStringField
      FieldName = 'DATA_TYPE_MOD'
      Size = 3
    end
    object qTableColumnsDATA_TYPE_OWNER: TStringField
      FieldName = 'DATA_TYPE_OWNER'
      Size = 30
    end
    object qTableColumnsDATA_LENGTH: TFloatField
      FieldName = 'DATA_LENGTH'
    end
    object qTableColumnsDATA_PRECISION: TFloatField
      FieldName = 'DATA_PRECISION'
    end
    object qTableColumnsDATA_SCALE: TFloatField
      FieldName = 'DATA_SCALE'
    end
    object qTableColumnsNULLABLE: TStringField
      FieldName = 'NULLABLE'
      Size = 1
    end
    object qTableColumnsCOLUMN_ID: TFloatField
      FieldName = 'COLUMN_ID'
    end
    object qTableColumnsDATA_DEFAULT: TMemoField
      FieldName = 'DATA_DEFAULT'
      BlobType = ftMemo
    end
    object qTableColumnsCOMMENTS: TStringField
      FieldName = 'COMMENTS'
      Size = 4000
    end
    object qTableColumnsUNIQUE: TStringField
      FieldName = 'UNIQUE'
    end
    object qTableColumnsCONSTRAINT_TYPE: TIntegerField
      FieldName = 'CONSTRAINT_TYPE'
    end
    object qTableColumnsCONSTRAINT_NAME: TStringField
      FieldName = 'CONSTRAINT_NAME'
      Size = 50
    end
    object qTableColumnsCONSTRAINT_REF_TABLE: TStringField
      FieldName = 'CONSTRAINT_REF_TABLE'
      Size = 40
    end
    object qTableColumnsCONSTRAINT_REF_COLUMN: TStringField
      FieldName = 'CONSTRAINT_REF_COLUMN'
      Size = 30
    end
    object qTableColumnsCONSTRAINT_DELETE_RULE: TStringField
      FieldName = 'CONSTRAINT_DELETE_RULE'
    end
    object qTableColumnsCONSTRAINT_STATUS: TStringField
      FieldName = 'CONSTRAINT_STATUS'
    end
    object qTableColumnsCONSTRAINT_DEFERRABLE: TStringField
      FieldName = 'CONSTRAINT_DEFERRABLE'
    end
    object qTableColumnsCONSTRAINT_VALIDATION: TStringField
      FieldName = 'CONSTRAINT_VALIDATION'
    end
    object qTableColumnsCONSTRAINT_CHK: TStringField
      FieldName = 'CONSTRAINT_CHK'
      Size = 200
    end
  end
  object dsTableColumns: TDataSource
    DataSet = qTableColumns
    Left = 1
    Top = 305
  end
  object qRefTable: TOraQuery
    SQL.Strings = (
      'select * from sys.All_tables')
    Left = 32
    Top = 239
    object StringField1: TStringField
      FieldName = 'TABLE_NAME'
      Size = 30
    end
  end
  object dsRefTable: TDataSource
    DataSet = qRefTable
    Left = 1
    Top = 240
  end
  object dsRefTableColumns: TDataSource
    DataSet = qRefTableColumns
    Left = 1
    Top = 273
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
    Left = 32
    Top = 272
    object StringField3: TStringField
      FieldName = 'COLUMN_NAME'
      Required = True
      Size = 30
    end
    object StringField9: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
    object FloatField1: TFloatField
      FieldName = 'COLUMN_ID'
    end
  end
  object qUserDataType: TOraQuery
    SQL.Strings = (
      
        'SELECT TYPE_NAME FROM ALL_TYPES WHERE OWNER = '#39'OE'#39' AND TYPECODE ' +
        'IN ('#39'OBJECT'#39', '#39'COLLECTION'#39', '#39'XMLTYPE'#39') '
      'ORDER BY TYPE_NAME')
    Left = 32
    Top = 208
    object qUserDataTypeTYPE_NAME: TStringField
      FieldName = 'TYPE_NAME'
      Required = True
      Size = 30
    end
  end
  object dsUserDataType: TDataSource
    DataSet = qUserDataType
    Left = 1
    Top = 209
  end
  object qClasterColumns: TVirtualTable
    FieldDefs = <
      item
        Name = 'CLUSTER_COLUMN_NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'COLUMN_NAME'
        DataType = ftString
        Size = 50
      end>
    Left = 112
    Top = 517
    Data = {
      010002001300434C55535445525F434F4C554D4E5F4E414D45010032000B0043
      4F4C554D4E5F4E414D4501003200000000000000}
    object qClasterColumnsCLUSTER_COLUMN_NAME: TStringField
      FieldName = 'CLUSTER_COLUMN_NAME'
      Size = 50
    end
    object qClasterColumnsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 50
    end
  end
  object dsClasterColumns: TDataSource
    DataSet = qClasterColumns
    Left = 81
    Top = 517
  end
  object qCluster: TOraQuery
    SQL.Strings = (
      
        'SELECT  CLUSTER_NAME FROM SYS.USER_CLUSTERS where cluster_type =' +
        ' '#39'INDEX'#39)
    Left = 112
    Top = 463
    object qClusterCLUSTER_NAME: TStringField
      FieldName = 'CLUSTER_NAME'
      Size = 30
    end
  end
  object dsCluster: TDataSource
    DataSet = qCluster
    Left = 81
    Top = 463
  end
  object qTemp: TOraQuery
    Left = 19
    Top = 175
  end
  object qExternalLocations: TVirtualTable
    FieldDefs = <
      item
        Name = 'DIRECTORY'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FILE_NAME'
        DataType = ftString
        Size = 300
      end>
    Left = 116
    Top = 424
    Data = {
      0100020009004449524543544F525901006400090046494C455F4E414D450100
      2C01000000000000}
  end
  object dsExternalLocations: TDataSource
    DataSet = qExternalLocations
    Left = 81
    Top = 423
  end
  object OpenDialog: TOpenDialog
    Left = 177
    Top = 440
  end
  object qQueuing: TOraQuery
    Left = 114
    Top = 386
    object qQueuingTYPE_NAME: TStringField
      FieldName = 'TYPE_NAME'
      Size = 100
    end
  end
  object dsQueuing: TDataSource
    DataSet = qQueuing
    Left = 81
    Top = 383
  end
  object dsSubPartition: TDataSource
    DataSet = qSubPartition
    Left = 1
    Top = 508
  end
  object qSubPartition: TVirtualTable
    FieldDefs = <
      item
        Name = 'PARTITION_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TABLESPACE_NAME'
        DataType = ftString
        Size = 30
      end>
    Left = 35
    Top = 508
    Data = {
      010002000E00504152544954494F4E5F4E414D4501001E000F005441424C4553
      504143455F4E414D4501001E00000000000000}
    object StringField10: TStringField
      FieldName = 'PARTITION_NAME'
      Size = 30
    end
    object StringField11: TStringField
      FieldName = 'TABLESPACE_NAME'
      Size = 30
    end
    object qSubPartitionVALUES: TStringField
      FieldName = 'VALUES'
      Size = 200
    end
  end
  object OraScript: TOraScript
    Left = 96
    Top = 326
  end
end
