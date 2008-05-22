object MaterializedViewDetailFrm: TMaterializedViewDetailFrm
  Left = 322
  Top = 115
  Width = 610
  Height = 586
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Create Materialized View'
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
    Width = 582
    Height = 473
    ActivePage = tsView
    Color = clBtnFace
    ParentColor = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    TabWidth = 80
    OnPageChanging = pcPageChanging
    ClientRectBottom = 472
    ClientRectLeft = 1
    ClientRectRight = 581
    ClientRectTop = 20
    object tsView: TcxTabSheet
      Caption = 'View'
      ImageIndex = 0
      DesignSize = (
        580
        452)
      object cxGroupBox5: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          561
          432)
        Height = 432
        Width = 561
        object Label2: TLabel
          Left = 13
          Top = 23
          Width = 34
          Height = 13
          Caption = 'Name :'
          Transparent = True
        end
        object Label1: TLabel
          Left = 14
          Top = 74
          Width = 44
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object Bevel1: TBevel
          Left = 14
          Top = 56
          Width = 530
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object edtViewName: TcxTextEdit
          Left = 63
          Top = 20
          Style.Shadow = False
          TabOrder = 0
          Width = 483
        end
        object lcViewSchema: TcxLookupComboBox
          Left = 63
          Top = 70
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
          Width = 483
        end
        object edtSQLQuery: TcxRichEdit
          Left = 11
          Top = 127
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Style.Font.Charset = TURKISH_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -13
          Style.Font.Name = 'Courier New'
          Style.Font.Style = []
          Style.Shadow = False
          Style.IsFontAssigned = True
          TabOrder = 2
          Height = 258
          Width = 537
        end
        object cxLabel3: TcxLabel
          Left = 11
          Top = 101
          Caption = 'Materialized View SQL Query'
          Transparent = True
        end
        object btnTestSQL: TcxButton
          Left = 464
          Top = 393
          Width = 85
          Height = 27
          Anchors = [akRight]
          Caption = 'Test SQL'
          TabOrder = 4
          OnClick = btnTestSQLClick
          LookAndFeel.Kind = lfOffice11
        end
      end
    end
    object tsProperties: TcxTabSheet
      Caption = 'Properties'
      Color = clBtnFace
      ImageIndex = 1
      ParentColor = False
      DesignSize = (
        580
        452)
      object cxGroupBox1: TcxGroupBox
        Left = 12
        Top = 9
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Refresh Options'
        TabOrder = 0
        Transparent = True
        Height = 230
        Width = 553
        object cxLabel1: TcxLabel
          Left = 16
          Top = 17
          Caption = 'Mode :'
          ParentFont = False
          Style.Font.Charset = TURKISH_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 15
          Top = 41
          Caption = 'When :'
          ParentFont = False
          Style.Font.Charset = TURKISH_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cboxMethod: TcxComboBox
          Left = 58
          Top = 16
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'Fast'
            'Complete'
            'Force'
            'Never')
          Properties.OnChange = cboxPropertiesChange
          TabOrder = 2
          Text = 'Never'
          Width = 121
        end
        object cbWhen: TcxComboBox
          Left = 59
          Top = 39
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'On Demand'
            'On Commit'
            'Automatically')
          TabOrder = 3
          Text = 'On Demand'
          Width = 121
        end
        object tedtOnThisTime: TcxTimeEdit
          Left = 83
          Top = 62
          EditValue = 0.000000000000000000
          TabOrder = 4
          Width = 73
        end
        object dedtOnThisDate: TcxDateEdit
          Left = 160
          Top = 62
          TabOrder = 5
          Width = 121
        end
        object cxLabel7: TcxLabel
          Left = 18
          Top = 111
          Caption = 'Type :'
          ParentFont = False
          Style.Font.Charset = TURKISH_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cbType: TcxComboBox
          Left = 59
          Top = 109
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'Primary Key'
            'Row ID')
          TabOrder = 7
          Text = 'Primary Key'
          Width = 121
        end
        object chkStartOn: TcxCheckBox
          Left = 3
          Top = 62
          Caption = 'Start on :'
          Properties.Alignment = taRightJustify
          Properties.OnChange = cboxPropertiesChange
          TabOrder = 8
          Transparent = True
          Width = 74
        end
        object chkNext: TcxCheckBox
          Left = 17
          Top = 85
          Caption = 'Next :'
          Properties.Alignment = taRightJustify
          Properties.OnChange = cboxPropertiesChange
          TabOrder = 9
          Transparent = True
          Width = 60
        end
        object tedtOnNextTime: TcxTimeEdit
          Left = 83
          Top = 85
          EditValue = 0.000000000000000000
          TabOrder = 10
          Width = 73
        end
        object dedtOnNextDate: TcxDateEdit
          Left = 160
          Top = 85
          TabOrder = 11
          Width = 121
        end
        object cxGroupBox4: TcxGroupBox
          Left = 15
          Top = 144
          Caption = '      Use Default Rollback Segment '
          TabOrder = 12
          Transparent = True
          Height = 73
          Width = 526
          object rgLocation: TcxRadioGroup
            Left = 17
            Top = 19
            Caption = 'Location'
            Properties.Columns = 2
            Properties.Items = <
              item
                Caption = 'Master'
              end
              item
                Caption = 'Local'
              end>
            ItemIndex = 0
            TabOrder = 0
            Transparent = True
            Height = 44
            Width = 169
          end
          object cxLabel5: TcxLabel
            Left = 192
            Top = 25
            Caption = 'Rollback Segment Name :'
            Transparent = True
          end
          object edtRollbackSegmentName: TcxTextEdit
            Left = 192
            Top = 41
            TabOrder = 2
            Width = 321
          end
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 9
        Top = 247
        Caption = 'Materialized View Options'
        TabOrder = 1
        Transparent = True
        Height = 194
        Width = 264
        object cxLabel17: TcxLabel
          Left = 12
          Top = 164
          Caption = 'Built Type :'
          ParentFont = False
          Style.Font.Charset = TURKISH_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cbBuiltType: TcxComboBox
          Left = 73
          Top = 162
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'Immediate'
            'Deferred')
          TabOrder = 1
          Text = 'Immediate'
          Width = 104
        end
        object chkParalel: TcxCheckBox
          Left = 9
          Top = 24
          Caption = 'Paralel'
          Properties.OnChange = cboxPropertiesChange
          TabOrder = 2
          Transparent = True
          Width = 56
        end
        object edtParalelDegree: TcxMaskEdit
          Left = 69
          Top = 24
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 3
          Text = '0'
          Width = 41
        end
        object chkAllowUpdates: TcxCheckBox
          Left = 8
          Top = 46
          Caption = 'Allow Updates'
          TabOrder = 4
          Transparent = True
          Width = 93
        end
        object chkPrebuiltOption: TcxCheckBox
          Left = 8
          Top = 69
          Caption = 'Prebuilt Option'
          Properties.OnChange = cboxPropertiesChange
          TabOrder = 5
          Transparent = True
          Width = 105
        end
        object chkEnableRowMovement: TcxCheckBox
          Left = 8
          Top = 94
          Caption = 'Enable Row Movement'
          TabOrder = 6
          Transparent = True
          Width = 145
        end
        object chkEnableQueryRewrite: TcxCheckBox
          Left = 8
          Top = 117
          Caption = 'Enable Query Rewrite'
          TabOrder = 7
          Transparent = True
          Width = 145
        end
        object cboxPrebuiltOption: TcxComboBox
          Left = 119
          Top = 69
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'Reduced Precision'
            'No Reduced Precision')
          TabOrder = 8
          Text = 'Reduced Precision'
          Width = 136
        end
        object chkCompress: TcxCheckBox
          Left = 8
          Top = 140
          Caption = 'Compress'
          TabOrder = 9
          Transparent = True
          Width = 145
        end
      end
      object cxGroupBox3: TcxGroupBox
        Left = 287
        Top = 248
        Caption = 'Using Index Clause'
        TabOrder = 2
        Transparent = True
        Height = 193
        Width = 279
        object chkUsingIndex: TcxCheckBox
          Left = 8
          Top = 22
          Caption = 'Add Using Index Clause'
          Properties.OnChange = cboxPropertiesChange
          TabOrder = 0
          Transparent = True
          Width = 169
        end
        object cxLabel4: TcxLabel
          Left = 21
          Top = 48
          Caption = 'Index Tablespace :'
          ParentFont = False
          Style.Font.Charset = TURKISH_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object lcbUsingIndex: TcxLookupComboBox
          Left = 22
          Top = 66
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'TABLESPACE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLESPACE_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsTablespace
          TabOrder = 2
          Width = 185
        end
      end
      object chkUseRollbackSegment: TcxCheckBox
        Left = 32
        Top = 150
        Properties.OnChange = cboxPropertiesChange
        TabOrder = 3
        Transparent = True
        Width = 196
      end
    end
    object tsStorage: TcxTabSheet
      Caption = 'Storage'
      ImageIndex = 0
      object cxGroupBox6: TcxGroupBox
        Left = 8
        Top = 8
        TabOrder = 0
        Height = 433
        Width = 561
        object gbStorageClause: TcxGroupBox
          Left = 12
          Top = 107
          Caption = 'Storage Clause'
          TabOrder = 0
          Transparent = True
          Height = 119
          Width = 533
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
            Left = 275
            Top = 21
            Width = 63
            Height = 13
            Caption = 'Min Extents :'
            Transparent = True
          end
          object Label14: TLabel
            Left = 275
            Top = 43
            Width = 67
            Height = 13
            Caption = 'Max Extents :'
            Transparent = True
          end
          object Label5: TLabel
            Left = 20
            Top = 64
            Width = 67
            Height = 13
            Caption = 'Pct Increase :'
            Transparent = True
          end
          object Label6: TLabel
            Left = 275
            Top = 65
            Width = 48
            Height = 13
            Caption = 'Free List :'
            Transparent = True
          end
          object Label16: TLabel
            Left = 275
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
            Left = 352
            Top = 18
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 2
            Text = '0'
            Width = 90
          end
          object edtMaxExtents: TcxMaskEdit
            Left = 352
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
            Left = 352
            Top = 62
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 5
            Text = '0'
            Width = 90
          end
          object edtFreeGroup: TcxMaskEdit
            Left = 352
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
          Left = 19
          Top = 0
          Style.BorderStyle = ebsNone
          TabOrder = 1
          Transparent = True
          Height = 107
          Width = 505
          object Label7: TLabel
            Left = 10
            Top = 29
            Width = 69
            Height = 13
            Caption = 'Percent Free :'
            Transparent = True
          end
          object Label8: TLabel
            Left = 10
            Top = 53
            Width = 71
            Height = 13
            Caption = 'Percent Used :'
            Transparent = True
          end
          object Label9: TLabel
            Left = 272
            Top = 29
            Width = 63
            Height = 13
            Caption = 'Initial Trans :'
            Transparent = True
          end
          object Label10: TLabel
            Left = 276
            Top = 53
            Width = 57
            Height = 13
            Caption = 'Max Trans :'
            Transparent = True
          end
          object Label15: TLabel
            Left = 10
            Top = 77
            Width = 66
            Height = 13
            Caption = 'Tablespacse :'
            Transparent = True
          end
          object edtPercentFree: TcxMaskEdit
            Left = 90
            Top = 26
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 0
            Text = '10'
            Width = 90
          end
          object edtPercentUsed: TcxMaskEdit
            Left = 90
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
            Left = 90
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
            Width = 343
          end
        end
        object rgCache: TcxRadioGroup
          Left = 12
          Top = 239
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
          Width = 533
        end
        object rgLogging: TcxRadioGroup
          Left = 12
          Top = 311
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
          Width = 533
        end
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 3
      DesignSize = (
        580
        452)
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
        Height = 436
        Width = 564
      end
    end
  end
  object cxGroupBox7: TcxGroupBox
    Left = 8
    Top = 488
    TabOrder = 1
    Transparent = True
    Height = 55
    Width = 585
    object btnExecute: TcxButton
      Left = 10
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 0
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnCancel: TcxButton
      Left = 90
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
  end
end
