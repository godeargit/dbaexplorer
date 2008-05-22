object TableColumnsFrm: TTableColumnsFrm
  Left = 381
  Top = 176
  BorderStyle = bsDialog
  Caption = 'Table Columns'
  ClientHeight = 485
  ClientWidth = 386
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
    Width = 367
    Height = 416
    ActivePage = tsDataType
    Color = clBtnFace
    LookAndFeel.Kind = lfOffice11
    ParentColor = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    ClientRectBottom = 415
    ClientRectLeft = 1
    ClientRectRight = 366
    ClientRectTop = 20
    object tsDataType: TcxTabSheet
      Caption = 'Table Column'
      ImageIndex = 0
      object cxGroupBox5: TcxGroupBox
        Left = 8
        Top = 8
        TabOrder = 0
        Transparent = True
        Height = 377
        Width = 344
        object Label4: TLabel
          Left = 14
          Top = 169
          Width = 34
          Height = 13
          Caption = 'Type : '
          Transparent = True
        end
        object Label5: TLabel
          Left = 14
          Top = 193
          Width = 29
          Height = 13
          Caption = 'Size : '
          Transparent = True
        end
        object Label6: TLabel
          Left = 14
          Top = 213
          Width = 32
          Height = 13
          Caption = 'Scale :'
          Transparent = True
        end
        object lblDataType: TLabel
          Left = 14
          Top = 232
          Width = 59
          Height = 13
          Caption = 'User Type : '
          Transparent = True
        end
        object Label8: TLabel
          Left = 14
          Top = 270
          Width = 71
          Height = 13
          Caption = 'Default Value :'
          Transparent = True
        end
        object Label9: TLabel
          Left = 14
          Top = 292
          Width = 52
          Height = 13
          Caption = 'Comment :'
          Transparent = True
        end
        object Label1: TLabel
          Left = 13
          Top = 17
          Width = 63
          Height = 13
          Caption = 'Table Name :'
          Transparent = True
        end
        object Label2: TLabel
          Left = 13
          Top = 40
          Width = 72
          Height = 13
          Caption = 'Column Name :'
          Transparent = True
        end
        object edtDefaultValue: TcxTextEdit
          Left = 107
          Top = 268
          TabOrder = 0
          Width = 227
        end
        object memComment: TcxMemo
          Left = 107
          Top = 290
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 1
          Height = 75
          Width = 227
        end
        object edtOracleDataSize: TcxSpinEdit
          Left = 107
          Top = 187
          TabOrder = 2
          Width = 66
        end
        object edtOracleDataScale: TcxSpinEdit
          Left = 107
          Top = 209
          TabOrder = 3
          Width = 66
        end
        object icUserDataType: TcxLookupComboBox
          Left = 108
          Top = 230
          Properties.KeyFieldNames = 'TYPE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TYPE_NAME'
            end>
          Properties.ListSource = dsUserDataType
          TabOrder = 4
          Width = 176
        end
        object cboxNullable: TcxCheckBox
          Left = 11
          Top = 249
          Caption = 'Nullable :'
          Properties.Alignment = taRightJustify
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          State = cbsGrayed
          TabOrder = 5
          Transparent = True
          Width = 114
        end
        object rgroupSizeType: TcxRadioGroup
          Left = 173
          Top = 175
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = 'Byte'
            end
            item
              Caption = 'Char'
            end>
          ItemIndex = 0
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.Kind = lfStandard
          Style.LookAndFeel.NativeStyle = False
          Style.Shadow = False
          StyleDisabled.LookAndFeel.Kind = lfStandard
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfStandard
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfStandard
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 6
          Transparent = True
          Height = 30
          Width = 135
        end
        object edtColumnName: TcxTextEdit
          Left = 99
          Top = 37
          Style.Shadow = False
          TabOrder = 7
          Width = 233
        end
        object edtTableName: TcxTextEdit
          Left = 99
          Top = 14
          Enabled = False
          Style.Shadow = False
          TabOrder = 8
          Width = 233
        end
        object cxGroupBox2: TcxGroupBox
          Left = 11
          Top = 65
          Caption = 'Column Data Type'
          TabOrder = 9
          Transparent = True
          Height = 94
          Width = 321
          object Label3: TLabel
            Left = 96
            Top = 68
            Width = 47
            Height = 13
            Caption = 'Schema : '
            Transparent = True
          end
          object rgroupColumnType: TcxRadioGroup
            Left = 8
            Top = 6
            Properties.Items = <
              item
                Caption = 'Oracle Data Type'
              end
              item
                Caption = 'User Defined Data Type'
              end>
            Properties.OnChange = rgroupColumnTypePropertiesChange
            ItemIndex = 0
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            Style.Shadow = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            Transparent = True
            Height = 54
            Width = 169
          end
          object lcDataTypeSchema: TcxLookupComboBox
            Left = 145
            Top = 65
            Properties.KeyFieldNames = 'USERNAME'
            Properties.ListColumns = <
              item
                FieldName = 'USERNAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmGenel.dsSchema
            Properties.OnEditValueChanged = lcDataTypeSchemaPropertiesEditValueChanged
            TabOrder = 1
            Width = 166
          end
        end
        object icOracleDataType: TcxImageComboBox
          Left = 107
          Top = 166
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
          Properties.OnEditValueChanged = icOracleDataTypePropertiesEditValueChanged
          TabOrder = 10
          Width = 177
        end
      end
    end
    object tsCheck: TcxTabSheet
      Caption = 'Check Constraint'
      ImageIndex = 1
      object Label10: TLabel
        Left = 19
        Top = 19
        Width = 34
        Height = 13
        Caption = 'Name :'
        Transparent = True
      end
      object edtCheckName: TcxTextEdit
        Left = 65
        Top = 16
        Style.Shadow = False
        TabOrder = 0
        Width = 272
      end
      object cxGroupBox3: TcxGroupBox
        Left = 8
        Top = 48
        Caption = 'Check Conditions'
        TabOrder = 1
        Transparent = True
        Height = 335
        Width = 345
        object edtCheckCondition: TcxMemo
          Left = 12
          Top = 18
          Style.Shadow = False
          TabOrder = 0
          Height = 305
          Width = 321
        end
      end
    end
    object tsForeign: TcxTabSheet
      Caption = 'Foreign Key'
      ImageIndex = 2
      object cxGroupBox6: TcxGroupBox
        Left = 8
        Top = 7
        TabOrder = 0
        Transparent = True
        Height = 377
        Width = 347
        object Label12: TLabel
          Left = 18
          Top = 21
          Width = 34
          Height = 13
          Caption = 'Name :'
          Transparent = True
        end
        object Label16: TLabel
          Left = 18
          Top = 119
          Width = 38
          Height = 13
          Caption = 'Status :'
          Transparent = True
        end
        object Label17: TLabel
          Left = 18
          Top = 142
          Width = 53
          Height = 13
          Caption = 'Validation :'
          Transparent = True
        end
        object Label13: TLabel
          Left = 18
          Top = 72
          Width = 93
          Height = 13
          Caption = 'Foreign Key Table :'
          Transparent = True
        end
        object Label14: TLabel
          Left = 18
          Top = 49
          Width = 104
          Height = 13
          Caption = 'Foreign Key Schema :'
          Transparent = True
        end
        object Label15: TLabel
          Left = 18
          Top = 95
          Width = 96
          Height = 13
          Caption = 'Forein Key Column :'
          Transparent = True
        end
        object Label19: TLabel
          Left = 18
          Top = 165
          Width = 62
          Height = 13
          Caption = 'Delete Rule :'
          Transparent = True
        end
        object edtForeignName: TcxTextEdit
          Left = 62
          Top = 17
          Style.Shadow = False
          TabOrder = 0
          Width = 265
        end
        object cboxStatus: TcxImageComboBox
          Left = 131
          Top = 116
          EditValue = 'Enable'
          Properties.Items = <
            item
              Description = 'Enable'
              ImageIndex = 0
              Value = 'Enable'
            end
            item
              Description = 'Disable'
              Value = 'Disable'
            end>
          TabOrder = 1
          Width = 135
        end
        object cboxValidation: TcxImageComboBox
          Left = 131
          Top = 139
          EditValue = 'Validate'
          Properties.Items = <
            item
              Description = 'Validate'
              ImageIndex = 0
              Value = 'Validate'
            end
            item
              Description = 'No Validate'
              Value = 'No Validate'
            end>
          TabOrder = 2
          Width = 198
        end
        object cxGroupBox4: TcxGroupBox
          Left = 12
          Top = 219
          Caption = 'Exceptions Processing (Owner,Table)'
          TabOrder = 3
          Transparent = True
          Height = 60
          Width = 315
          object lcExceptionOwner: TcxLookupComboBox
            Left = 12
            Top = 25
            Properties.ClearKey = 46
            Properties.KeyFieldNames = 'USERNAME'
            Properties.ListColumns = <
              item
                FieldName = 'USERNAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmGenel.dsSchema
            Properties.OnEditValueChanged = lcExceptionOwnerPropertiesEditValueChanged
            TabOrder = 0
            Width = 117
          end
          object lcExceptionTable: TcxLookupComboBox
            Left = 138
            Top = 25
            Properties.ClearKey = 46
            Properties.KeyFieldNames = 'TABLE_NAME'
            Properties.ListColumns = <
              item
                FieldName = 'TABLE_NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsExceptionTable
            TabOrder = 1
            Width = 169
          end
        end
        object lcForeignTable: TcxLookupComboBox
          Left = 131
          Top = 69
          Properties.KeyFieldNames = 'TABLE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLE_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsForeignTable
          Properties.OnEditValueChanged = lcForeignTablePropertiesEditValueChanged
          TabOrder = 4
          Width = 197
        end
        object lcForeignSchema: TcxLookupComboBox
          Left = 131
          Top = 46
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsSchema
          Properties.OnEditValueChanged = lcForeignSchemaPropertiesEditValueChanged
          TabOrder = 5
          Width = 197
        end
        object lcForeinColumn: TcxLookupComboBox
          Left = 131
          Top = 92
          Properties.KeyFieldNames = 'COLUMN_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'COLUMN_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsForeignColumn
          TabOrder = 6
          Width = 197
        end
        object cboxDeleteRule: TcxImageComboBox
          Left = 131
          Top = 162
          EditValue = 'None'
          Properties.Items = <
            item
              Description = 'None'
              ImageIndex = 0
              Value = 'None'
            end
            item
              Description = 'Set Null'
              Value = 'Set Null'
            end
            item
              Description = 'Delete Cascade'
              Value = 'Delete Cascade'
            end>
          TabOrder = 7
          Width = 198
        end
        object cboxDeferrable: TcxImageComboBox
          Left = 152
          Top = 186
          Enabled = False
          Properties.Items = <
            item
              Description = 'Initially Immediate'
              ImageIndex = 0
              Value = 'Initially Immediate'
            end
            item
              Description = 'Initially Deferred'
              Value = 'Initially Deferred'
            end>
          TabOrder = 8
          Width = 176
        end
        object chkDeferrable: TcxCheckBox
          Left = 14
          Top = 185
          Caption = 'Deferrable :'
          Properties.Alignment = taRightJustify
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Properties.OnEditValueChanged = chkDeferrablePropertiesEditValueChanged
          TabOrder = 9
          Transparent = True
          Width = 134
        end
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 3
      OnShow = tsDDLShow
      object edtColumnDDL: TcxRichEdit
        Left = 8
        Top = 9
        Align = alCustom
        Lines.Strings = (
          'cxRichEdit1')
        Style.Shadow = False
        TabOrder = 0
        Height = 376
        Width = 347
      end
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 7
    Top = 428
    TabOrder = 1
    Height = 47
    Width = 370
    object btnCancel: TcxButton
      Left = 93
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnExecute: TcxButton
      Left = 13
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 1
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object QTableColumns: TOraQuery
    SQL.Strings = (
      'SELECT cols.*, '
      
        '      ( SELECT comments FROM SYS.user_col_comments WHERE table_n' +
        'ame = cols.table_name AND column_name = cols.column_name) commen' +
        'ts '
      '     FROM SYS.user_tab_columns cols')
    Left = 312
    Top = 400
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
  object dsTableColumns: TDataSource
    DataSet = QTableColumns
    Left = 281
    Top = 401
  end
  object qUserDataType: TOraQuery
    SQL.Strings = (
      
        'SELECT TYPE_NAME FROM ALL_TYPES WHERE OWNER = '#39'OE'#39' AND TYPECODE ' +
        'IN ('#39'OBJECT'#39', '#39'COLLECTION'#39', '#39'XMLTYPE'#39') '
      'ORDER BY TYPE_NAME')
    Left = 312
    Top = 440
    object qUserDataTypeTYPE_NAME: TStringField
      FieldName = 'TYPE_NAME'
      Required = True
      Size = 30
    end
  end
  object dsUserDataType: TDataSource
    DataSet = qUserDataType
    Left = 281
    Top = 441
  end
  object qForeignTable: TOraQuery
    SQL.Strings = (
      'select * from sys.All_tables')
    Left = 248
    Top = 367
    object qForeignTableTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 30
    end
  end
  object dsForeignTable: TDataSource
    DataSet = qForeignTable
    Left = 217
    Top = 367
  end
  object dsForeignColumn: TDataSource
    DataSet = qForeignColumn
    Left = 217
    Top = 399
  end
  object qForeignColumn: TOraQuery
    SQL.Strings = (
      'select * from SYS.user_tab_columns')
    Left = 248
    Top = 399
    object qForeignColumnCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Required = True
      Size = 30
    end
  end
  object dsExceptionTable: TDataSource
    DataSet = qExceptionTable
    Left = 217
    Top = 439
  end
  object qExceptionTable: TOraQuery
    SQL.Strings = (
      'select * from sys.All_tables')
    Left = 248
    Top = 439
    object StringField3: TStringField
      FieldName = 'TABLE_NAME'
      Size = 30
    end
  end
end
