object UserPropertiesFrm: TUserPropertiesFrm
  Left = 293
  Top = 208
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'UserPropertiesFrm'
  ClientHeight = 446
  ClientWidth = 688
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
    Width = 688
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object imgToolBar: TImage
      Left = 0
      Top = 0
      Width = 688
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
      Width = 99
      Height = 14
      Caption = 'User Description'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object pcUserProperties: TcxPageControl
    Left = 0
    Top = 26
    Width = 688
    Height = 420
    ActivePage = tsUserDetails
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
    OnPageChanging = pcUserPropertiesPageChanging
    ClientRectBottom = 420
    ClientRectLeft = 76
    ClientRectRight = 688
    ClientRectTop = 0
    object tsUserDetails: TcxTabSheet
      Caption = 'Properties'
      ImageIndex = 8
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 612
        Height = 26
        Align = dalTop
        BarManager = dxBarManager1
        SunkenBorder = False
        UseOwnSunkenBorder = True
      end
      object edtUserName: TcxTextEdit
        Left = 147
        Top = 77
        Properties.ReadOnly = True
        TabOrder = 1
        Width = 200
      end
      object cxLabel1: TcxLabel
        Left = 21
        Top = 76
        Caption = 'User Name :'
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 21
        Top = 100
        Caption = 'Default Tablespace :'
        Transparent = True
      end
      object edtDefaultTablespace: TcxTextEdit
        Left = 147
        Top = 101
        Properties.ReadOnly = True
        TabOrder = 4
        Width = 200
      end
      object cxLabel3: TcxLabel
        Left = 21
        Top = 124
        Caption = 'Temporary Tablespace :'
        Transparent = True
      end
      object edtTemporaryTablespace: TcxTextEdit
        Left = 147
        Top = 125
        Properties.ReadOnly = True
        TabOrder = 6
        Width = 200
      end
      object cxLabel4: TcxLabel
        Left = 21
        Top = 149
        Caption = 'Profile :'
        Transparent = True
      end
      object edtProfile: TcxTextEdit
        Left = 147
        Top = 149
        Properties.ReadOnly = True
        TabOrder = 8
        Width = 200
      end
      object cxLabel5: TcxLabel
        Left = 21
        Top = 173
        Caption = 'Date Created :'
        Transparent = True
      end
      object edtDateCreated: TcxTextEdit
        Left = 147
        Top = 173
        Properties.ReadOnly = True
        TabOrder = 10
        Width = 200
      end
      object cxLabel6: TcxLabel
        Left = 21
        Top = 197
        Caption = 'Account is Locked :'
        Transparent = True
      end
      object cxLabel7: TcxLabel
        Left = 21
        Top = 222
        Caption = 'Password Expire Date :'
        Transparent = True
      end
      object edtAccountIsLocked: TcxTextEdit
        Left = 147
        Top = 197
        Properties.ReadOnly = True
        TabOrder = 13
        Width = 200
      end
      object edtPasswordExpireDate: TcxTextEdit
        Left = 147
        Top = 221
        Properties.ReadOnly = True
        TabOrder = 14
        Width = 200
      end
      object cxLabel8: TcxLabel
        Left = 21
        Top = 52
        Caption = 'User ID :'
        Transparent = True
      end
      object edtUserId: TcxTextEdit
        Left = 147
        Top = 53
        Properties.ReadOnly = True
        TabOrder = 16
        Width = 200
      end
      object cxLabel9: TcxLabel
        Left = 21
        Top = 246
        Caption = 'Lock Date :'
        Transparent = True
      end
      object edtLockDate: TcxTextEdit
        Left = 147
        Top = 245
        Properties.ReadOnly = True
        TabOrder = 18
        Width = 200
      end
      object cxLabel10: TcxLabel
        Left = 21
        Top = 270
        Caption = 'External Name :'
        Transparent = True
      end
      object cxLabel11: TcxLabel
        Left = 21
        Top = 292
        Caption = 'Initial Resource Consumer Group:'
        Properties.WordWrap = True
        Transparent = True
      end
      object edtExternalName: TcxTextEdit
        Left = 147
        Top = 269
        Properties.ReadOnly = True
        TabOrder = 21
        Width = 200
      end
      object edtInitialResourceGroup: TcxTextEdit
        Left = 147
        Top = 293
        Properties.ReadOnly = True
        TabOrder = 22
        Width = 200
      end
    end
    object tsUserRoles: TcxTabSheet
      Caption = 'Roles'
      ImageIndex = 6
      object GridGrants: TcxGrid
        Left = 0
        Top = 0
        Width = 612
        Height = 420
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object GridGrantsDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsRoles
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object GridGrantsDBTableView1Column1: TcxGridDBColumn
            Caption = 'Role Name'
            DataBinding.FieldName = 'role'
            Options.Editing = False
            Width = 197
          end
          object GridGrantsDBTableView1Column2: TcxGridDBColumn
            Caption = 'Granted'
            DataBinding.FieldName = 'granted'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'YES'
            Properties.ValueUnchecked = 'NO'
            Options.Editing = False
            Width = 74
          end
          object GridGrantsDBTableView1Column3: TcxGridDBColumn
            Caption = 'Admin'
            DataBinding.FieldName = 'ADMIN_OPTION'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'YES'
            Properties.ValueUnchecked = 'NO'
            Options.Editing = False
            Width = 79
          end
          object GridGrantsDBTableView1Column4: TcxGridDBColumn
            Caption = 'Default'
            DataBinding.FieldName = 'DEFAULT_ROLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'YES'
            Properties.ValueUnchecked = 'NO'
            Options.Editing = False
            Width = 94
          end
        end
        object cxGridLevel5: TcxGridLevel
          GridView = GridGrantsDBTableView1
        end
      end
    end
    object tsSystemPrivileges: TcxTabSheet
      Caption = 'Privileges'
      ImageIndex = 7
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 612
        Height = 420
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object cxGridDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsSystemPrivileges
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'Privilege'
            DataBinding.FieldName = 'name'
            Options.Editing = False
            Width = 197
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Granted'
            DataBinding.FieldName = 'GRANTED'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'YES'
            Properties.ValueUnchecked = 'NO'
            Options.Editing = False
            Width = 74
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'Admin Option'
            DataBinding.FieldName = 'ADMIN_OPTION'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'YES'
            Properties.ValueUnchecked = 'NO'
            Options.Editing = False
            Width = 79
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
    object tsUserQuotas: TcxTabSheet
      Caption = 'Quotas'
      ImageIndex = 12
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 612
        Height = 420
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object cxGridDBTableView2: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsQuotas
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'Tablespace'
            DataBinding.FieldName = 'TABLESPACE_NAME'
            Options.Editing = False
            Width = 227
          end
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = 'Unlimited'
            DataBinding.FieldName = 'UNL'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'YES'
            Properties.ValueUnchecked = 'NO'
            Options.Editing = False
            Width = 75
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'Quota'
            DataBinding.FieldName = 'AMT'
            PropertiesClassName = 'TcxCalcEditProperties'
            Options.Editing = False
            Width = 66
          end
          object cxGridDBColumn7: TcxGridDBColumn
            Caption = 'Unit'
            DataBinding.FieldName = 'UNIT'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                ImageIndex = 0
              end
              item
                Description = 'MB'
                Value = 'MB'
              end
              item
                Description = 'KB'
                Value = 'KB'
              end>
            Options.Editing = False
            Width = 76
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
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
        Height = 420
        Width = 612
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
        FloatClientHeight = 93
        ItemLinks = <
          item
            Item = bbtnCreateUser
            Visible = True
          end
          item
            Item = bbtnAlterUser
            Visible = True
          end
          item
            Item = bbtnDropUser
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshUser
            Visible = True
          end>
        Name = 'barProperties'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default'
      'properties')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
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
    object bbtnCreateUser: TdxBarButton
      Caption = 'Create User'
      Category = 1
      Hint = 'Create User'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = bbtnCreateUserClick
    end
    object bbtnDropUser: TdxBarButton
      Caption = 'Drop User'
      Category = 1
      Hint = 'Drop User'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropUserClick
    end
    object bbtnAlterUser: TdxBarButton
      Caption = 'Alter User'
      Category = 1
      Hint = 'Alter User'
      Visible = ivAlways
      ImageIndex = 101
      OnClick = bbtnAlterUserClick
    end
    object bbtnRefreshUser: TdxBarButton
      Caption = 'Refresh User'
      Category = 1
      Hint = 'Refresh User'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshUserClick
    end
  end
  object vtRoles: TVirtualTable
    Left = 5
    Top = 208
    Data = {01000000000000000000}
  end
  object vtQuotas: TVirtualTable
    Left = 5
    Top = 272
    Data = {01000000000000000000}
  end
  object vtPrivs: TVirtualTable
    Left = 5
    Top = 240
    Data = {01000000000000000000}
  end
  object dsRoles: TDataSource
    DataSet = vtRoles
    Left = 37
    Top = 208
  end
  object dsSystemPrivileges: TDataSource
    DataSet = vtPrivs
    Left = 37
    Top = 240
  end
  object dsQuotas: TDataSource
    DataSet = vtQuotas
    Left = 37
    Top = 272
  end
end
