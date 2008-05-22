object ProcedureDetailFrm: TProcedureDetailFrm
  Left = 291
  Top = 210
  Width = 299
  Height = 220
  BorderIcons = [biSystemMenu]
  Caption = 'New Object'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Caption = 'New Object'
    TabOrder = 0
    Height = 113
    Width = 273
    object Label1: TLabel
      Left = 16
      Top = 50
      Width = 64
      Height = 13
      Caption = 'Object Type :'
    end
    object Label2: TLabel
      Left = 16
      Top = 80
      Width = 68
      Height = 13
      Caption = 'Object Name :'
    end
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 45
      Height = 13
      Caption = 'Schema :'
    end
    object cbObjectType: TcxComboBox
      Left = 88
      Top = 48
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Procedure'
        'Package'
        'Function'
        'Type')
      TabOrder = 0
      Width = 166
    end
    object edtObjectName: TcxTextEdit
      Left = 88
      Top = 76
      TabOrder = 1
      Width = 166
    end
    object lcViewSchema: TcxLookupComboBox
      Left = 88
      Top = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'USERNAME'
      Properties.ListColumns = <
        item
          FieldName = 'USERNAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dmGenel.dsSchema
      Style.Shadow = False
      TabOrder = 2
      Width = 166
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 128
    TabOrder = 1
    Height = 48
    Width = 273
    object btnOK: TcxButton
      Left = 10
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOKClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnCancel: TcxButton
      Left = 90
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
    end
  end
end
