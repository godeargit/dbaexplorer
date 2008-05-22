object GrantsFrm: TGrantsFrm
  Left = 179
  Top = 95
  BorderStyle = bsDialog
  Caption = 'Grants'
  ClientHeight = 533
  ClientWidth = 648
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
    Width = 626
    Height = 457
    ActivePage = tsPrivileges
    Color = clBtnFace
    ParentColor = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    OnPageChanging = pcPageChanging
    ClientRectBottom = 456
    ClientRectLeft = 1
    ClientRectRight = 625
    ClientRectTop = 20
    object tsPrivileges: TcxTabSheet
      Caption = 'Object Privileges'
      ImageIndex = 0
      DesignSize = (
        624
        436)
      object lblObje: TLabel
        Left = 15
        Top = 11
        Width = 50
        Height = 13
        Caption = 'On Table :'
        Transparent = True
      end
      object Bevel1: TBevel
        Left = 10
        Top = 35
        Width = 600
        Height = 9
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
        Style = bsRaised
      end
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 48
        Caption = 'Grants'
        Style.Shadow = False
        TabOrder = 0
        Height = 375
        Width = 604
        object cxGrid1: TcxGrid
          Left = 9
          Top = 17
          Width = 580
          Height = 345
          TabOrder = 0
          object gridGrantDB: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnCustomDrawCell = gridGrantDBCustomDrawCell
            DataController.DataSource = dsGrants
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.GroupByBox = False
            object gridGrantDBUSER_NAME: TcxGridDBColumn
              Caption = 'User Name'
              DataBinding.FieldName = 'GRANTEE'
              Options.Editing = False
              Width = 101
            end
            object gridGrantDBSelect: TcxGridDBColumn
              DataBinding.FieldName = 'Select'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Yes'
                  ImageIndex = 0
                  Value = 'YES'
                end
                item
                  Description = 'NO'
                  Value = 'NO'
                end
                item
                  Description = 'Grantable'
                  Value = 'GRANTABLE'
                end>
              Width = 60
            end
            object gridGrantDBDelete: TcxGridDBColumn
              DataBinding.FieldName = 'Delete'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Yes'
                  ImageIndex = 0
                  Value = 'YES'
                end
                item
                  Description = 'NO'
                  Value = 'NO'
                end
                item
                  Description = 'Grantable'
                  Value = 'GRANTABLE'
                end>
              Width = 60
            end
            object gridGrantDBInsert: TcxGridDBColumn
              DataBinding.FieldName = 'Insert'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Yes'
                  ImageIndex = 0
                  Value = 'YES'
                end
                item
                  Description = 'NO'
                  Value = 'NO'
                end
                item
                  Description = 'Grantable'
                  Value = 'GRANTABLE'
                end>
              Width = 60
            end
            object gridGrantDBUpdate: TcxGridDBColumn
              DataBinding.FieldName = 'Update'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Yes'
                  ImageIndex = 0
                  Value = 'YES'
                end
                item
                  Description = 'NO'
                  Value = 'NO'
                end
                item
                  Description = 'Grantable'
                  Value = 'GRANTABLE'
                end>
              Width = 60
            end
            object gridGrantDBAlter: TcxGridDBColumn
              DataBinding.FieldName = 'Alter'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Yes'
                  ImageIndex = 0
                  Value = 'YES'
                end
                item
                  Description = 'NO'
                  Value = 'NO'
                end
                item
                  Description = 'Grantable'
                  Value = 'GRANTABLE'
                end>
              Width = 60
            end
            object gridGrantDBReferences: TcxGridDBColumn
              DataBinding.FieldName = 'References'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Yes'
                  ImageIndex = 0
                  Value = 'YES'
                end
                item
                  Description = 'NO'
                  Value = 'NO'
                end
                item
                  Description = 'Grantable'
                  Value = 'GRANTABLE'
                end>
              Width = 60
            end
            object gridGrantDBIndex: TcxGridDBColumn
              DataBinding.FieldName = 'Index'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Yes'
                  ImageIndex = 0
                  Value = 'YES'
                end
                item
                  Description = 'NO'
                  Value = 'NO'
                end
                item
                  Description = 'Grantable'
                  Value = 'GRANTABLE'
                end>
              Width = 60
            end
            object gridGrantDBOnCommitRefresh: TcxGridDBColumn
              DataBinding.FieldName = 'On Commit Refresh'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Yes'
                  ImageIndex = 0
                  Value = 'YES'
                end
                item
                  Description = 'NO'
                  Value = 'NO'
                end
                item
                  Description = 'Grantable'
                  Value = 'GRANTABLE'
                end>
              Width = 100
            end
            object gridGrantDBQueryRewrite: TcxGridDBColumn
              DataBinding.FieldName = 'Query Rewrite'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Yes'
                  ImageIndex = 0
                  Value = 'YES'
                end
                item
                  Description = 'NO'
                  Value = 'NO'
                end
                item
                  Description = 'Grantable'
                  Value = 'GRANTABLE'
                end>
              Width = 79
            end
            object gridGrantDBDebug: TcxGridDBColumn
              DataBinding.FieldName = 'Debug'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Yes'
                  ImageIndex = 0
                  Value = 'YES'
                end
                item
                  Description = 'NO'
                  Value = 'NO'
                end
                item
                  Description = 'Grantable'
                  Value = 'GRANTABLE'
                end>
              Width = 60
            end
            object gridGrantDBFlashback: TcxGridDBColumn
              DataBinding.FieldName = 'Flashback'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Yes'
                  ImageIndex = 0
                  Value = 'YES'
                end
                item
                  Description = 'NO'
                  Value = 'NO'
                end
                item
                  Description = 'Grantable'
                  Value = 'GRANTABLE'
                end>
              Width = 60
            end
            object gridGrantDBExecute: TcxGridDBColumn
              DataBinding.FieldName = 'Execute'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Yes'
                  ImageIndex = 0
                  Value = 'YES'
                end
                item
                  Description = 'NO'
                  Value = 'NO'
                end
                item
                  Description = 'Grantable'
                  Value = 'GRANTABLE'
                end>
              Width = 60
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = gridGrantDB
          end
        end
      end
      object edtTriggerName: TcxTextEdit
        Left = 104
        Top = 7
        Properties.ReadOnly = True
        Style.Color = clWindow
        Style.Shadow = False
        TabOrder = 1
        Width = 505
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 1
      object redtDDL: TcxRichEdit
        Left = 9
        Top = 9
        ParentFont = False
        Properties.ScrollBars = ssBoth
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -12
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 416
        Width = 605
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 472
    TabOrder = 1
    Height = 50
    Width = 629
    object btnCancel: TcxButton
      Left = 90
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Cancel'
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
  object vtGrants: TVirtualTable
    FieldDefs = <
      item
        Name = 'GRANTEE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Select'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Delete'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Insert'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Update'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Alter'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'References'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Index'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'On Commit Refresh'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Query Rewrite'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Debug'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Flashback'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Execute'
        DataType = ftString
        Size = 20
      end>
    Left = 120
    Top = 232
    Data = {
      01000D0007004752414E54454501003200060053656C65637401001400060044
      656C657465010014000600496E73657274010014000600557064617465010014
      000500416C746572010014000A005265666572656E636573010014000500496E
      6465780100140011004F6E20436F6D6D69742052656672657368010014000D00
      517565727920526577726974650100140005004465627567010014000900466C
      6173686261636B0100140007004578656375746501001400000000000000}
    object vtGrantsGRANTEE: TStringField
      FieldName = 'GRANTEE'
      Size = 50
    end
    object vtGrantsSelect: TStringField
      FieldName = 'Select'
    end
    object vtGrantsDelete: TStringField
      FieldName = 'Delete'
    end
    object vtGrantsInsert: TStringField
      FieldName = 'Insert'
    end
    object vtGrantsUpdate: TStringField
      FieldName = 'Update'
    end
    object vtGrantsAlter: TStringField
      FieldName = 'Alter'
    end
    object vtGrantsReferences: TStringField
      FieldName = 'References'
    end
    object vtGrantsIndex: TStringField
      FieldName = 'Index'
    end
    object vtGrantsOnCommitRefresh: TStringField
      FieldName = 'On Commit Refresh'
    end
    object vtGrantsQueryRewrite: TStringField
      FieldName = 'Query Rewrite'
    end
    object vtGrantsDebug: TStringField
      FieldName = 'Debug'
    end
    object vtGrantsFlashback: TStringField
      FieldName = 'Flashback'
    end
    object vtGrantsExecute: TStringField
      FieldName = 'Execute'
    end
  end
  object dsGrants: TDataSource
    DataSet = vtGrants
    Left = 88
    Top = 232
  end
  object qUser: TOraQuery
    Left = 120
    Top = 264
  end
end
