object TriggerPropertiesFrm: TTriggerPropertiesFrm
  Left = 309
  Top = 221
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'TriggerPropertiesFrm'
  ClientHeight = 575
  ClientWidth = 757
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
    Width = 757
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object imgToolBar: TImage
      Left = 0
      Top = 0
      Width = 757
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
      Width = 116
      Height = 14
      Caption = 'Trigger Description'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object pcTriggerProperties: TcxPageControl
    Left = 0
    Top = 26
    Width = 757
    Height = 549
    ActivePage = tsTriggerSource
    Align = alClient
    Color = clWhite
    LookAndFeel.Kind = lfOffice11
    ParentColor = False
    Rotate = True
    Style = 9
    TabOrder = 1
    TabPosition = tpLeft
    TabSlants.Kind = skCutCorner
    TabWidth = 82
    OnPageChanging = pcTriggerPropertiesPageChanging
    ClientRectBottom = 549
    ClientRectLeft = 83
    ClientRectRight = 757
    ClientRectTop = 0
    object tsTriggerSource: TcxTabSheet
      Caption = 'Source'
      ImageIndex = 8
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 674
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
        SunkenBorder = False
        UseOwnSunkenBorder = True
      end
      object redtSource: TcxRichEdit
        Left = 0
        Top = 89
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
        TabOrder = 1
        Height = 356
        Width = 674
      end
      object cxSplitter1: TcxSplitter
        Left = 0
        Top = 445
        Width = 674
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = lviewError
      end
      object gbDescription: TcxGroupBox
        Left = 0
        Top = 26
        Align = alTop
        TabOrder = 3
        Transparent = True
        Height = 63
        Width = 674
        object Label9: TLabel
          Left = 8
          Top = 18
          Width = 34
          Height = 13
          Caption = 'Name :'
          Transparent = True
        end
        object Label10: TLabel
          Left = 182
          Top = 18
          Width = 45
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object Label2: TLabel
          Left = 343
          Top = 18
          Width = 34
          Height = 13
          Caption = 'Name :'
          Transparent = True
        end
        object Label4: TLabel
          Left = 501
          Top = 18
          Width = 45
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object edtTriggerName: TcxTextEdit
          Left = 8
          Top = 31
          Properties.ReadOnly = True
          Style.Shadow = False
          TabOrder = 0
          Width = 171
        end
        object edtTriggerSchema: TcxTextEdit
          Left = 182
          Top = 31
          Properties.ReadOnly = True
          Style.Shadow = False
          TabOrder = 1
          Width = 155
        end
        object edtSourceName: TcxTextEdit
          Left = 341
          Top = 31
          Properties.ReadOnly = True
          Style.Shadow = False
          TabOrder = 2
          Width = 155
        end
        object edtSourceOwner: TcxTextEdit
          Left = 501
          Top = 31
          Properties.ReadOnly = True
          Style.Shadow = False
          TabOrder = 3
          Width = 155
        end
      end
      object lviewError: TcxListView
        Left = 0
        Top = 453
        Width = 674
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
    object tsTriggerProperties: TcxTabSheet
      Caption = 'Properties'
      ImageIndex = 0
      object gboxFireOnDatabase: TcxGroupBox
        Left = 0
        Top = 58
        Align = alTop
        Caption = 'Fire On'
        TabOrder = 0
        Transparent = True
        Height = 63
        Width = 674
        object cbServerError: TcxCheckBox
          Left = 6
          Top = 16
          Caption = 'Server Error'
          Properties.ReadOnly = True
          TabOrder = 0
          Transparent = True
          Width = 91
        end
        object cbLoggon: TcxCheckBox
          Left = 102
          Top = 16
          Caption = 'Loggon'
          Properties.ReadOnly = True
          TabOrder = 1
          Transparent = True
          Width = 73
        end
        object cbStartup: TcxCheckBox
          Left = 196
          Top = 16
          Caption = 'Startup'
          Properties.ReadOnly = True
          TabOrder = 2
          Transparent = True
          Width = 73
        end
        object cbLoggof: TcxCheckBox
          Left = 103
          Top = 37
          Caption = 'Loggof'
          Properties.ReadOnly = True
          TabOrder = 3
          Transparent = True
          Width = 73
        end
        object cbShotdown: TcxCheckBox
          Left = 197
          Top = 37
          Caption = 'Shotdown'
          Properties.ReadOnly = True
          TabOrder = 4
          Transparent = True
          Width = 98
        end
        object cbsuspend: TcxCheckBox
          Left = 6
          Top = 37
          Caption = 'Suspend'
          Properties.ReadOnly = True
          TabOrder = 5
          Transparent = True
          Width = 98
        end
      end
      object gboxFireOnDDL: TcxGroupBox
        Left = 0
        Top = 419
        Align = alTop
        Caption = 'Fire On'
        TabOrder = 1
        Transparent = True
        Height = 81
        Width = 674
        object cbAlter: TcxCheckBox
          Left = 6
          Top = 16
          Caption = 'Alter'
          Properties.ReadOnly = True
          TabOrder = 0
          Transparent = True
          Width = 73
        end
        object cbAnalyze: TcxCheckBox
          Left = 6
          Top = 35
          Caption = 'Analyze'
          Properties.ReadOnly = True
          TabOrder = 1
          Transparent = True
          Width = 73
        end
        object cbAssocStats: TcxCheckBox
          Left = 6
          Top = 53
          Caption = 'Assoc Stats'
          Properties.ReadOnly = True
          TabOrder = 2
          Transparent = True
          Width = 83
        end
        object cbAudit: TcxCheckBox
          Left = 94
          Top = 16
          Caption = 'Audit'
          Properties.ReadOnly = True
          TabOrder = 3
          Transparent = True
          Width = 73
        end
        object cbComment: TcxCheckBox
          Left = 94
          Top = 35
          Caption = 'Comment'
          Properties.ReadOnly = True
          TabOrder = 4
          Transparent = True
          Width = 73
        end
        object cbCreate: TcxCheckBox
          Left = 94
          Top = 53
          Caption = 'Create'
          Properties.ReadOnly = True
          TabOrder = 5
          Transparent = True
          Width = 73
        end
        object cbDisassocStats: TcxCheckBox
          Left = 169
          Top = 16
          Caption = 'Disassoc Stats'
          Properties.ReadOnly = True
          TabOrder = 6
          Transparent = True
          Width = 98
        end
        object cbDrop: TcxCheckBox
          Left = 169
          Top = 35
          Caption = 'Drop'
          Properties.ReadOnly = True
          TabOrder = 7
          Transparent = True
          Width = 98
        end
        object cbGrant: TcxCheckBox
          Left = 169
          Top = 53
          Caption = 'Grant'
          Properties.ReadOnly = True
          TabOrder = 8
          Transparent = True
          Width = 98
        end
        object cbNoAudit: TcxCheckBox
          Left = 269
          Top = 16
          Caption = 'No Audit'
          Properties.ReadOnly = True
          TabOrder = 9
          Transparent = True
          Width = 73
        end
        object cbRename: TcxCheckBox
          Left = 269
          Top = 35
          Caption = 'Rename'
          Properties.ReadOnly = True
          TabOrder = 10
          Transparent = True
          Width = 73
        end
        object cbRevoke: TcxCheckBox
          Left = 269
          Top = 53
          Caption = 'Revoke'
          Properties.ReadOnly = True
          TabOrder = 11
          Transparent = True
          Width = 73
        end
        object cbTruncate: TcxCheckBox
          Left = 342
          Top = 16
          Caption = 'Truncate'
          Properties.ReadOnly = True
          TabOrder = 12
          Transparent = True
          Width = 73
        end
        object cbDDL: TcxCheckBox
          Left = 342
          Top = 35
          Caption = 'DDL'
          Properties.ReadOnly = True
          TabOrder = 13
          Transparent = True
          Width = 73
        end
      end
      object gbReferencing: TcxGroupBox
        Left = 0
        Top = 370
        Align = alTop
        Caption = 'Referencing Clause'
        TabOrder = 2
        Transparent = True
        Height = 49
        Width = 674
        object Label5: TLabel
          Left = 7
          Top = 22
          Width = 42
          Height = 13
          Caption = 'New as :'
          Transparent = True
        end
        object Label6: TLabel
          Left = 143
          Top = 22
          Width = 36
          Height = 13
          Caption = 'Old as :'
          Transparent = True
        end
        object lblParent: TLabel
          Left = 271
          Top = 22
          Width = 51
          Height = 13
          Caption = 'Parent as :'
          Transparent = True
        end
        object edtNewAs: TcxTextEdit
          Left = 56
          Top = 18
          Properties.ReadOnly = True
          TabOrder = 0
          Text = 'New'
          Width = 73
        end
        object edtOldAs: TcxTextEdit
          Left = 184
          Top = 18
          Properties.ReadOnly = True
          TabOrder = 1
          Text = 'Old'
          Width = 73
        end
        object edtParent: TcxTextEdit
          Left = 328
          Top = 18
          Properties.ReadOnly = True
          TabOrder = 2
          Text = 'Parent'
          Width = 73
        end
      end
      object cxGroupBox5: TcxGroupBox
        Left = 0
        Top = 258
        Align = alTop
        TabOrder = 3
        Height = 112
        Width = 674
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
          Properties.ReadOnly = True
          ItemIndex = 0
          TabOrder = 0
          Transparent = True
          Height = 47
          Width = 153
        end
        object rgForEach: TcxRadioGroup
          Left = 165
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
          Properties.ReadOnly = True
          ItemIndex = 0
          TabOrder = 1
          Transparent = True
          Height = 47
          Width = 153
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
          Properties.ReadOnly = True
          ItemIndex = 0
          TabOrder = 2
          Transparent = True
          Height = 47
          Width = 153
        end
        object rgEventType: TcxRadioGroup
          Left = 165
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
          Properties.ReadOnly = True
          ItemIndex = 0
          TabOrder = 3
          Transparent = True
          Height = 47
          Width = 153
        end
        object cgOnEvent: TcxGroupBox
          Left = 324
          Top = 13
          Caption = 'On Event'
          TabOrder = 4
          Height = 92
          Width = 113
          object cbInsert: TcxCheckBox
            Left = 6
            Top = 16
            Caption = 'Insert'
            Properties.ReadOnly = True
            TabOrder = 0
            Transparent = True
            Width = 73
          end
          object cbUpdate: TcxCheckBox
            Left = 6
            Top = 40
            Caption = 'Update'
            Properties.ReadOnly = True
            TabOrder = 1
            Transparent = True
            Width = 73
          end
          object cbDelete: TcxCheckBox
            Left = 6
            Top = 64
            Caption = 'Delete'
            Properties.ReadOnly = True
            TabOrder = 2
            Transparent = True
            Width = 83
          end
        end
      end
      object gbObject: TcxGroupBox
        Left = 0
        Top = 170
        Align = alTop
        Caption = 'Object'
        TabOrder = 4
        Transparent = True
        Height = 88
        Width = 674
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
          Width = 68
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
        object lcbNestedTable: TcxTextEdit
          Left = 118
          Top = 58
          Properties.ReadOnly = True
          TabOrder = 0
          Width = 204
        end
        object edtObjectSchema: TcxTextEdit
          Left = 118
          Top = 13
          Properties.ReadOnly = True
          TabOrder = 1
          Width = 204
        end
        object edtObjectName: TcxTextEdit
          Left = 118
          Top = 36
          Properties.ReadOnly = True
          TabOrder = 2
          Width = 204
        end
      end
      object rgTriggerOn: TcxRadioGroup
        Left = 0
        Top = 0
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
        Properties.ReadOnly = True
        ItemIndex = 0
        TabOrder = 5
        Transparent = True
        Height = 58
        Width = 674
      end
      object gbSchema: TcxGroupBox
        Left = 0
        Top = 121
        Align = alTop
        Caption = 'Schema'
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 6
        Transparent = True
        Height = 49
        Width = 674
        object Label7: TLabel
          Left = 13
          Top = 20
          Width = 45
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object edtSchema: TcxTextEdit
          Left = 64
          Top = 18
          Properties.ReadOnly = True
          TabOrder = 0
          Width = 204
        end
      end
    end
    object tsUsedBy: TcxTabSheet
      Caption = 'Used By'
      ImageIndex = 4
      object GridUsed: TcxGrid
        Left = 0
        Top = 0
        Width = 674
        Height = 549
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
    object tsUses: TcxTabSheet
      Caption = 'Uses'
      ImageIndex = 5
      object GridUses: TcxGrid
        Left = 0
        Top = 0
        Width = 674
        Height = 549
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
        Height = 549
        Width = 674
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
        Caption = 'properties'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 261
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
            Item = bbtnDisableTrgger
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
        Name = 'properties'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = dmGenel.imList
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 48
    Top = 218
    DockControlHeights = (
      0
      0
      0
      0)
    object bbtnCreateTrigger: TdxBarButton
      Caption = 'Create Trigger'
      Category = 0
      Hint = 'Create Trigger'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = bbtnCreateTriggerClick
    end
    object bbtnAlterTrigger: TdxBarButton
      Caption = 'Alter Trigger'
      Category = 0
      Hint = 'Alter Trigger'
      Visible = ivAlways
      ImageIndex = 101
      OnClick = bbtnAlterTriggerClick
    end
    object bbtnDropTrigger: TdxBarButton
      Caption = 'Drop Trigger'
      Category = 0
      Hint = 'Drop Trigger'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropTriggerClick
    end
    object bbtnEnableTrigger: TdxBarButton
      Caption = 'Enable Trigger'
      Category = 0
      Hint = 'Enable Trigger'
      Visible = ivAlways
      ImageIndex = 89
      OnClick = bbtnEnableTriggerClick
    end
    object bbtnDisableTrgger: TdxBarButton
      Caption = 'Disable Trigger'
      Category = 0
      Hint = 'Disable Trigger'
      Visible = ivAlways
      ImageIndex = 91
      OnClick = bbtnDisableTrggerClick
    end
    object bbtnCompileTrigger: TdxBarButton
      Caption = 'Compile Trigger'
      Category = 0
      Hint = 'Compile Trigger'
      Visible = ivAlways
      ImageIndex = 86
      OnClick = bbtnCompileTriggerClick
    end
    object bbtnRefreshTrigger: TdxBarButton
      Caption = 'RefreshTrigger'
      Category = 0
      Hint = 'RefreshTrigger'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshTriggerClick
    end
  end
  object dsUsed: TDataSource
    DataSet = vtUsedBy
    Left = 49
    Top = 250
  end
  object dsUses: TDataSource
    DataSet = vtUses
    Left = 49
    Top = 282
  end
  object vtUsedBy: TVirtualTable
    Left = 12
    Top = 250
    Data = {01000000000000000000}
  end
  object vtUses: TVirtualTable
    Left = 12
    Top = 282
    Data = {01000000000000000000}
  end
end
