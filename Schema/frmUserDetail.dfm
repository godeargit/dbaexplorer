object UserDetailFrm: TUserDetailFrm
  Left = 454
  Top = 258
  Width = 589
  Height = 506
  BorderIcons = [biSystemMenu]
  Caption = 'UserDetailFrm'
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    581
    472)
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 8
    Top = 8
    Width = 561
    Height = 403
    ActivePage = tsUser
    Anchors = [akLeft, akTop, akRight, akBottom]
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    TabWidth = 110
    OnPageChanging = pcPageChanging
    ClientRectBottom = 402
    ClientRectLeft = 1
    ClientRectRight = 560
    ClientRectTop = 20
    object tsUser: TcxTabSheet
      Caption = 'User'
      ImageIndex = 0
      DesignSize = (
        559
        382)
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          542
          364)
        Height = 364
        Width = 542
        object Bevel1: TBevel
          Left = 18
          Top = 56
          Width = 497
          Height = 7
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object cxLabel1: TcxLabel
          Left = 18
          Top = 24
          Caption = 'User Name :'
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 18
          Top = 80
          Caption = 'New Password :'
          Transparent = True
        end
        object edtNewPassword: TcxMaskEdit
          Left = 143
          Top = 80
          Anchors = [akLeft, akTop, akRight]
          Properties.EchoMode = eemPassword
          TabOrder = 2
          Width = 372
        end
        object cxLabel3: TcxLabel
          Left = 18
          Top = 104
          Caption = 'Confirm Password :'
          Transparent = True
        end
        object edtConfirmPassword: TcxMaskEdit
          Left = 143
          Top = 104
          Anchors = [akLeft, akTop, akRight]
          Properties.EchoMode = eemPassword
          TabOrder = 4
          Width = 372
        end
        object chkPasswordExpired: TcxCheckBox
          Left = 135
          Top = 202
          Caption = 'Password expired (user must change next login)'
          TabOrder = 5
          Transparent = True
          Width = 267
        end
        object chkAccountLocked: TcxCheckBox
          Left = 135
          Top = 226
          Caption = 'Account Is Locked'
          TabOrder = 6
          Transparent = True
          Width = 267
        end
        object cxLabel4: TcxLabel
          Left = 18
          Top = 129
          Caption = 'Default Tablespace :'
          Transparent = True
        end
        object cxLabel5: TcxLabel
          Left = 18
          Top = 154
          Caption = 'Temporary Tablespace :'
          Transparent = True
        end
        object lcTablespace: TcxLookupComboBox
          Left = 143
          Top = 128
          Anchors = [akLeft, akTop, akRight]
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'TABLESPACE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLESPACE_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsTablespace
          TabOrder = 9
          Width = 372
        end
        object lcTemporaryTablespace: TcxLookupComboBox
          Left = 143
          Top = 152
          Anchors = [akLeft, akTop, akRight]
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'TABLESPACE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLESPACE_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsTemporary
          TabOrder = 10
          Width = 372
        end
        object cxLabel6: TcxLabel
          Left = 19
          Top = 179
          Caption = 'Resource Profile :'
          Transparent = True
        end
        object lcProfile: TcxLookupComboBox
          Left = 143
          Top = 176
          Anchors = [akLeft, akTop, akRight]
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'profile'
          Properties.ListColumns = <
            item
              FieldName = 'profile'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsProfiles
          TabOrder = 12
          Width = 372
        end
        object edtUserName: TcxMaskEdit
          Left = 143
          Top = 23
          Anchors = [akLeft, akTop, akRight]
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '[a-zA-Z0-9_]+'
          Properties.MaxLength = 0
          TabOrder = 13
          Width = 372
        end
      end
    end
    object tsRoles: TcxTabSheet
      Caption = 'Roles'
      ImageIndex = 2
      object GridGrants: TcxGrid
        Left = 8
        Top = 8
        Width = 542
        Height = 365
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
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
            Width = 74
          end
          object GridGrantsDBTableView1Column3: TcxGridDBColumn
            Caption = 'Admin'
            DataBinding.FieldName = 'ADMIN_OPTION'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'YES'
            Properties.ValueUnchecked = 'NO'
            Width = 79
          end
          object GridGrantsDBTableView1Column4: TcxGridDBColumn
            Caption = 'Default'
            DataBinding.FieldName = 'DEFAULT_ROLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'YES'
            Properties.ValueUnchecked = 'NO'
            Width = 94
          end
        end
        object cxGridLevel5: TcxGridLevel
          GridView = GridGrantsDBTableView1
        end
      end
    end
    object tsSystemPrivileges: TcxTabSheet
      Caption = 'System Privileges'
      ImageIndex = 3
      object cxGrid1: TcxGrid
        Left = 8
        Top = 8
        Width = 542
        Height = 365
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
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
            Width = 74
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'Admin Option'
            DataBinding.FieldName = 'ADMIN_OPTION'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'YES'
            Properties.ValueUnchecked = 'NO'
            Width = 79
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
    object tsQuotas: TcxTabSheet
      Caption = 'Quotas'
      ImageIndex = 4
      object cxGrid2: TcxGrid
        Left = 8
        Top = 8
        Width = 545
        Height = 367
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
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
            Width = 75
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'Quota'
            DataBinding.FieldName = 'AMT'
            PropertiesClassName = 'TcxCalcEditProperties'
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
            Width = 76
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 3
      DesignSize = (
        559
        382)
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
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.Shadow = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        TabOrder = 0
        Height = 366
        Width = 543
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 418
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Height = 45
    Width = 562
    object btnCancel: TcxButton
      Left = 90
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnExecute: TcxButton
      Left = 10
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 1
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object vtRoles: TVirtualTable
    Left = 421
    Top = 264
    Data = {01000000000000000000}
  end
  object dsRoles: TDataSource
    DataSet = vtRoles
    Left = 453
    Top = 264
  end
  object vtPrivs: TVirtualTable
    Left = 421
    Top = 296
    Data = {01000000000000000000}
  end
  object dsSystemPrivileges: TDataSource
    DataSet = vtPrivs
    Left = 453
    Top = 296
  end
  object dsQuotas: TDataSource
    DataSet = vtQuotas
    Left = 453
    Top = 328
  end
  object vtQuotas: TVirtualTable
    Left = 421
    Top = 328
    Data = {01000000000000000000}
  end
  object vtProfiles: TVirtualTable
    FieldDefs = <
      item
        Name = 'profile'
        DataType = ftString
        Size = 50
      end>
    Left = 421
    Top = 360
    Data = {01000100070070726F66696C6501003200000000000000}
    object vtProfilesprofile: TStringField
      FieldName = 'profile'
      Size = 50
    end
  end
  object dsProfiles: TDataSource
    DataSet = vtProfiles
    Left = 453
    Top = 360
  end
  object vtTemporary: TVirtualTable
    FieldDefs = <
      item
        Name = 'TABLESPACE_NAME'
        DataType = ftString
        Size = 50
      end>
    Left = 421
    Top = 232
    Data = {010001000F005441424C4553504143455F4E414D4501003200000000000000}
    object vtTemporaryTABLESPACE_NAME: TStringField
      FieldName = 'TABLESPACE_NAME'
      Size = 50
    end
  end
  object dsTemporary: TDataSource
    DataSet = vtTemporary
    Left = 453
    Top = 232
  end
end
