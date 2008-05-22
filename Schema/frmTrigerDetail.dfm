object TriggerDetailFrm: TTriggerDetailFrm
  Left = 324
  Top = 166
  Width = 556
  Height = 556
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'TriggerDetailFrm'
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  DesignSize = (
    548
    522)
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 8
    Top = 8
    Width = 528
    Height = 460
    ActivePage = tsProperties
    Anchors = [akLeft, akTop, akRight, akBottom]
    ShowFrame = True
    Style = 9
    TabOrder = 0
    TabWidth = 100
    OnPageChanging = pcPageChanging
    ClientRectBottom = 459
    ClientRectLeft = 1
    ClientRectRight = 527
    ClientRectTop = 20
    object tsProperties: TcxTabSheet
      Caption = 'Trigger'
      ImageIndex = 0
      object gbSchema: TcxGroupBox
        Left = 0
        Top = 138
        Align = alTop
        Caption = 'Schema'
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 5
        Transparent = True
        Height = 49
        Width = 526
        object Label4: TLabel
          Left = 13
          Top = 20
          Width = 44
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object lcbSchema: TcxLookupComboBox
          Left = 64
          Top = 18
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListSource = dmGenel.dsSchema
          TabOrder = 0
          Width = 166
        end
      end
      object gbReferencing: TcxGroupBox
        Left = 0
        Top = 387
        Align = alTop
        Caption = 'Referencing Clause'
        TabOrder = 0
        Transparent = True
        Height = 49
        Width = 526
        object Label5: TLabel
          Left = 7
          Top = 21
          Width = 42
          Height = 13
          Caption = 'New as :'
          Transparent = True
        end
        object Label6: TLabel
          Left = 143
          Top = 21
          Width = 37
          Height = 13
          Caption = 'Old as :'
          Transparent = True
        end
        object lblParent: TLabel
          Left = 271
          Top = 21
          Width = 53
          Height = 13
          Caption = 'Parent as :'
          Transparent = True
        end
        object edtNewAs: TcxTextEdit
          Left = 56
          Top = 18
          TabOrder = 0
          Text = 'New'
          Width = 73
        end
        object edtOldAs: TcxTextEdit
          Left = 184
          Top = 18
          TabOrder = 1
          Text = 'Old'
          Width = 73
        end
        object edtParent: TcxTextEdit
          Left = 328
          Top = 18
          TabOrder = 2
          Text = 'Parent'
          Width = 73
        end
      end
      object gbObject: TcxGroupBox
        Left = 0
        Top = 187
        Align = alTop
        Caption = 'Object'
        TabOrder = 1
        Transparent = True
        Height = 88
        Width = 526
        object Label3: TLabel
          Left = 32
          Top = 17
          Width = 79
          Height = 13
          Caption = 'Object Schema :'
          Transparent = True
        end
        object Label1: TLabel
          Left = 42
          Top = 39
          Width = 69
          Height = 13
          Caption = 'Object Name :'
          Transparent = True
        end
        object lblNestedTable: TLabel
          Left = 41
          Top = 61
          Width = 70
          Height = 13
          Caption = 'Nested Table :'
          Transparent = True
        end
        object lcObjectSchema: TcxLookupComboBox
          Left = 118
          Top = 16
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListSource = dmGenel.dsSchema
          Properties.OnEditValueChanged = lcObjectSchemaPropertiesEditValueChanged
          TabOrder = 0
          Width = 204
        end
        object lcObjectName: TcxLookupComboBox
          Left = 118
          Top = 37
          Properties.DropDownAutoSize = True
          Properties.KeyFieldNames = 'TABLE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLE_NAME'
            end>
          Properties.ListSource = dsObjectTable
          Properties.OnEditValueChanged = lcObjectNamePropertiesEditValueChanged
          TabOrder = 1
          Width = 204
        end
        object lcbNestedTable: TcxTextEdit
          Left = 118
          Top = 58
          TabOrder = 2
          Width = 204
        end
      end
      object rgTriggerOn: TcxRadioGroup
        Left = 0
        Top = 80
        Align = alTop
        Caption = 'Trigger On'
        Properties.Columns = 3
        Properties.Items = <
          item
            Caption = 'Table'
          end
          item
            Caption = 'View'
          end
          item
            Caption = 'Schema'
          end
          item
            Caption = 'Nested Table of View'
          end
          item
            Caption = 'Database'
          end>
        Properties.OnChange = rgTriggerOnPropertiesChange
        ItemIndex = 0
        TabOrder = 2
        Transparent = True
        Height = 58
        Width = 526
      end
      object gboxFireOnDDL: TcxGroupBox
        Left = 0
        Top = 436
        Align = alTop
        Caption = 'Fire On'
        TabOrder = 3
        Transparent = True
        Height = 81
        Width = 526
        object cbAlter: TcxCheckBox
          Left = 6
          Top = 16
          Caption = 'Alter'
          TabOrder = 0
          Transparent = True
          Width = 73
        end
        object cbAnalyze: TcxCheckBox
          Left = 6
          Top = 35
          Caption = 'Analyze'
          TabOrder = 1
          Transparent = True
          Width = 73
        end
        object cbAssocStats: TcxCheckBox
          Left = 6
          Top = 53
          Caption = 'Assoc Stats'
          TabOrder = 2
          Transparent = True
          Width = 83
        end
        object cbAudit: TcxCheckBox
          Left = 94
          Top = 16
          Caption = 'Audit'
          TabOrder = 3
          Transparent = True
          Width = 73
        end
        object cbComment: TcxCheckBox
          Left = 94
          Top = 35
          Caption = 'Comment'
          TabOrder = 4
          Transparent = True
          Width = 73
        end
        object cbCreate: TcxCheckBox
          Left = 94
          Top = 53
          Caption = 'Create'
          TabOrder = 5
          Transparent = True
          Width = 73
        end
        object cbDisassocStats: TcxCheckBox
          Left = 169
          Top = 16
          Caption = 'Disassoc Stats'
          TabOrder = 6
          Transparent = True
          Width = 98
        end
        object cbDrop: TcxCheckBox
          Left = 169
          Top = 35
          Caption = 'Drop'
          TabOrder = 7
          Transparent = True
          Width = 98
        end
        object cbGrant: TcxCheckBox
          Left = 169
          Top = 53
          Caption = 'Grant'
          TabOrder = 8
          Transparent = True
          Width = 98
        end
        object cbNoAudit: TcxCheckBox
          Left = 269
          Top = 16
          Caption = 'No Audit'
          TabOrder = 9
          Transparent = True
          Width = 73
        end
        object cbRename: TcxCheckBox
          Left = 269
          Top = 35
          Caption = 'Rename'
          TabOrder = 10
          Transparent = True
          Width = 73
        end
        object cbRevoke: TcxCheckBox
          Left = 269
          Top = 53
          Caption = 'Revoke'
          TabOrder = 11
          Transparent = True
          Width = 73
        end
        object cbTruncate: TcxCheckBox
          Left = 342
          Top = 16
          Caption = 'Truncate'
          TabOrder = 12
          Transparent = True
          Width = 73
        end
        object cbDDL: TcxCheckBox
          Left = 342
          Top = 35
          Caption = 'DDL'
          TabOrder = 13
          Transparent = True
          Width = 73
        end
      end
      object gboxFireOnDatabase: TcxGroupBox
        Left = 0
        Top = 517
        Align = alTop
        Caption = 'Fire On'
        TabOrder = 4
        Transparent = True
        Height = 63
        Width = 526
        object cbServerError: TcxCheckBox
          Left = 6
          Top = 16
          Caption = 'Server Error'
          TabOrder = 0
          Transparent = True
          Width = 91
        end
        object cbLoggon: TcxCheckBox
          Left = 102
          Top = 16
          Caption = 'Loggon'
          TabOrder = 1
          Transparent = True
          Width = 73
        end
        object cbStartup: TcxCheckBox
          Left = 196
          Top = 16
          Caption = 'Startup'
          TabOrder = 2
          Transparent = True
          Width = 73
        end
        object cbLoggof: TcxCheckBox
          Left = 103
          Top = 37
          Caption = 'Loggof'
          TabOrder = 3
          Transparent = True
          Width = 73
        end
        object cbShotdown: TcxCheckBox
          Left = 197
          Top = 37
          Caption = 'Shotdown'
          TabOrder = 4
          Transparent = True
          Width = 98
        end
        object cbsuspend: TcxCheckBox
          Left = 6
          Top = 37
          Caption = 'Suspend'
          TabOrder = 5
          Transparent = True
          Width = 98
        end
      end
      object gbDescription: TcxGroupBox
        Left = 0
        Top = 0
        Align = alTop
        Style.BorderStyle = ebsNone
        TabOrder = 6
        Transparent = True
        DesignSize = (
          526
          80)
        Height = 80
        Width = 526
        object Label9: TLabel
          Left = 14
          Top = 16
          Width = 34
          Height = 13
          Caption = 'Name :'
          Transparent = True
        end
        object Label10: TLabel
          Left = 13
          Top = 37
          Width = 44
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object Bevel1: TBevel
          Left = 12
          Top = 62
          Width = 501
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object edtTriggerName: TcxTextEdit
          Left = 64
          Top = 11
          Anchors = [akLeft, akTop, akRight]
          Style.Shadow = False
          TabOrder = 0
          Width = 446
        end
        object lcbTriggerOwner: TcxLookupComboBox
          Left = 64
          Top = 33
          Anchors = [akLeft, akTop, akRight]
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListSource = dmGenel.dsSchema
          Style.Shadow = False
          TabOrder = 1
          Width = 446
        end
      end
      object cxGroupBox5: TcxGroupBox
        Left = 0
        Top = 275
        Align = alTop
        TabOrder = 7
        Transparent = True
        Height = 112
        Width = 526
        object rgFireWhen: TcxRadioGroup
          Left = 8
          Top = 12
          Caption = 'Fire When'
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = 'Before'
            end
            item
              Caption = 'After'
            end>
          Properties.OnChange = rgTriggerOnPropertiesChange
          ItemIndex = 0
          TabOrder = 0
          Transparent = True
          Height = 47
          Width = 153
        end
        object rgForEach: TcxRadioGroup
          Left = 166
          Top = 59
          Caption = 'For Each'
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = 'Row'
            end
            item
              Caption = 'Statement'
            end>
          Properties.OnChange = rgTriggerOnPropertiesChange
          ItemIndex = 0
          TabOrder = 1
          Transparent = True
          Height = 47
          Width = 167
        end
        object rgStatus: TcxRadioGroup
          Left = 8
          Top = 59
          Caption = 'Status'
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = 'Enable'
            end
            item
              Caption = 'Disable'
            end>
          ItemIndex = 0
          TabOrder = 2
          Transparent = True
          Height = 47
          Width = 153
        end
        object rgEventType: TcxRadioGroup
          Left = 166
          Top = 12
          Caption = 'Event Type'
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = 'Database'
            end
            item
              Caption = 'DDL'
            end>
          Properties.OnChange = rgTriggerOnPropertiesChange
          ItemIndex = 0
          TabOrder = 3
          Transparent = True
          Height = 47
          Width = 167
        end
        object cgOnEvent: TcxGroupBox
          Left = 340
          Top = 13
          Caption = 'On Event'
          TabOrder = 4
          Transparent = True
          Height = 92
          Width = 113
          object cbInsert: TcxCheckBox
            Left = 6
            Top = 16
            Caption = 'Insert'
            TabOrder = 0
            Transparent = True
            Width = 73
          end
          object cbUpdate: TcxCheckBox
            Left = 6
            Top = 40
            Caption = 'Update'
            Properties.OnChange = rgTriggerOnPropertiesChange
            TabOrder = 1
            Transparent = True
            Width = 73
          end
          object cbDelete: TcxCheckBox
            Left = 6
            Top = 64
            Caption = 'Delete'
            TabOrder = 2
            Transparent = True
            Width = 83
          end
        end
      end
    end
    object tsWhenClause: TcxTabSheet
      Caption = 'When Clause'
      ImageIndex = 2
      DesignSize = (
        526
        439)
      object redtWhenClause: TcxRichEdit
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        Style.Shadow = False
        TabOrder = 0
        Height = 422
        Width = 509
      end
    end
    object tsUpdateColumns: TcxTabSheet
      Caption = 'Update Columns'
      ImageIndex = 4
      DesignSize = (
        526
        439)
      object rgrpUpdateColumns: TcxRadioGroup
        Left = 8
        Top = 8
        Align = alCustom
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Select Options'
        Properties.Items = <
          item
            Caption = 'Fire the trigger when any column is update'
          end
          item
            Caption = 'Fire the trigger only when the specified columns are update'
          end>
        Properties.OnChange = rgrpUpdateColumnsPropertiesChange
        ItemIndex = 0
        TabOrder = 0
        Height = 77
        Width = 507
      end
      object cxGrid1: TcxGrid
        Left = 8
        Top = 91
        Width = 507
        Height = 337
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsTableColumns
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1COL_ID: TcxGridDBColumn
            Caption = 'Column ID'
            DataBinding.FieldName = 'COLUMN_ID'
            Options.Editing = False
            Width = 54
          end
          object cxGrid1DBTableView1COLUMN_NAME: TcxGridDBColumn
            Caption = 'Column Name'
            DataBinding.FieldName = 'COLUMN_NAME'
            Options.Editing = False
            Width = 125
          end
          object cxGrid1DBTableView1DATA_TYPE: TcxGridDBColumn
            Caption = 'Data Type'
            DataBinding.FieldName = 'DATA_TYPE'
            Options.Editing = False
            Width = 141
          end
          object cxGrid1DBTableView1CHK: TcxGridDBColumn
            Caption = 'Fire trigger on update ?'
            DataBinding.FieldName = 'CHK'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 126
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object tsBody: TcxTabSheet
      Caption = 'Body'
      ImageIndex = 4
      DesignSize = (
        526
        439)
      object redtBody: TcxRichEdit
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Properties.ScrollBars = ssBoth
        Lines.Strings = (
          'DECLARE'
          'tmpVar NUMBER;'
          
            '/***************************************************************' +
            '***************'
          '   NAME:       '
          '   PURPOSE:    '
          ''
          '   REVISIONS:'
          '   Ver        Date        Author           Description'
          
            '   ---------  ----------  ---------------  ---------------------' +
            '---------------'
          '   1.0        05.07.2007             1. Created this trigger.'
          ''
          
            '****************************************************************' +
            '**************/'
          'BEGIN'
          '   tmpVar := 0;'
          ''
          '   SELECT MySeq.NEXTVAL INTO tmpVar FROM dual;'
          '   :NEW.SequenceColumn := tmpVar;'
          '   :NEW.CreatedDate := SYSDATE;'
          '   :NEW.CreatedUser := USER;'
          ''
          '   EXCEPTION'
          '     WHEN OTHERS THEN'
          '       -- Consider logging the error and then re-raise'
          '       RAISE;'
          'END ;'
          '/')
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -12
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 420
        Width = 507
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 3
      DesignSize = (
        526
        439)
      object redtDDL: TcxRichEdit
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -12
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 420
        Width = 508
      end
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 470
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Height = 45
    Width = 531
    object btnExecute: TcxButton
      Left = 10
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 0
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnCancel: TcxButton
      Left = 90
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object dsObjectTable: TDataSource
    DataSet = qObjectTable
    Left = 81
    Top = 199
  end
  object qObjectTable: TOraQuery
    SQL.Strings = (
      'select * from sys.All_tables')
    Left = 48
    Top = 199
    object StringField3: TStringField
      FieldName = 'TABLE_NAME'
      Size = 30
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
    Left = 48
    Top = 296
    object qTableColumnsCOLUMN_ID: TFloatField
      FieldName = 'COLUMN_ID'
    end
    object qTableColumnsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Required = True
      Size = 30
    end
    object qTableColumnsDATA_TYPE: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
  end
  object dsTableColumns: TDataSource
    DataSet = vTableColumns
    Left = 81
    Top = 329
  end
  object qObjectView: TOraQuery
    SQL.Strings = (
      'select * from sys.All_tables')
    Left = 48
    Top = 231
    object qObjectViewVIEW_NAME: TStringField
      FieldName = 'VIEW_NAME'
      Size = 30
    end
  end
  object dsObjectView: TDataSource
    DataSet = qObjectView
    Left = 81
    Top = 231
  end
  object vTableColumns: TVirtualTable
    Left = 48
    Top = 328
    Data = {01000000000000000000}
    object vTableColumnsCOLUMN_ID: TIntegerField
      FieldName = 'COLUMN_ID'
    end
    object vTableColumnsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 30
    end
    object vTableColumnsDATA_TYPE: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
    object vTableColumnsCHK: TIntegerField
      FieldName = 'CHK'
    end
  end
  object qViewWithNested: TOraQuery
    SQL.Strings = (
      'select * from sys.All_tables')
    Left = 48
    Top = 263
    object qViewWithNestedVIEW_NAME: TStringField
      FieldName = 'VIEW_NAME'
      Size = 30
    end
    object qViewWithNestedCOLUMN_ID: TFloatField
      FieldName = 'COLUMN_ID'
    end
    object qViewWithNestedCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 100
    end
    object qViewWithNestedDATA_TYPE: TStringField
      FieldName = 'DATA_TYPE'
      Size = 50
    end
  end
  object dsViewWithNested: TDataSource
    DataSet = qViewWithNested
    Left = 73
    Top = 263
  end
end
