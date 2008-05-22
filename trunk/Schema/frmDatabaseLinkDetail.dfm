object DatabaseLinkDetailFrm: TDatabaseLinkDetailFrm
  Left = 341
  Top = 239
  Width = 449
  Height = 381
  BorderIcons = [biSystemMenu]
  Caption = 'Create Database Link'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    441
    347)
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 8
    Top = 8
    Width = 422
    Height = 281
    ActivePage = tsDBLink
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnFace
    ParentColor = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    TabWidth = 80
    OnPageChanging = pcPageChanging
    ClientRectBottom = 280
    ClientRectLeft = 1
    ClientRectRight = 421
    ClientRectTop = 20
    object tsDBLink: TcxTabSheet
      Caption = 'DB Link'
      ImageIndex = 0
      DesignSize = (
        420
        260)
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        Height = 242
        Width = 402
        object Label2: TLabel
          Left = 11
          Top = 22
          Width = 57
          Height = 13
          Caption = 'Link Name :'
          Transparent = True
        end
        object Label1: TLabel
          Left = 11
          Top = 78
          Width = 45
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object Label3: TLabel
          Left = 11
          Top = 127
          Width = 59
          Height = 13
          Caption = 'Host Name :'
          Transparent = True
        end
        object Label4: TLabel
          Left = 11
          Top = 182
          Width = 59
          Height = 13
          Caption = 'User Name :'
          Transparent = True
        end
        object Label5: TLabel
          Left = 11
          Top = 206
          Width = 52
          Height = 13
          Caption = 'Password :'
          Transparent = True
        end
        object Bevel1: TBevel
          Left = 13
          Top = 49
          Width = 370
          Height = 9
          Shape = bsTopLine
          Style = bsRaised
        end
        object edtLinkName: TcxTextEdit
          Left = 85
          Top = 19
          Style.Shadow = False
          TabOrder = 0
          Width = 300
        end
        object lcDBLinkSchema: TcxLookupComboBox
          Left = 85
          Top = 75
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
          Width = 300
        end
        object edtHostName: TcxTextEdit
          Left = 85
          Top = 124
          Style.Shadow = False
          TabOrder = 2
          Width = 300
        end
        object cbCurrentUser: TcxCheckBox
          Left = 8
          Top = 152
          Caption = 'Use current session User/Password'
          Properties.OnChange = cbCurrentUserPropertiesChange
          State = cbsChecked
          TabOrder = 3
          Transparent = True
          Width = 225
        end
        object edtUserName: TcxTextEdit
          Left = 85
          Top = 179
          Style.Shadow = False
          TabOrder = 4
          Width = 300
        end
        object edtPassword: TcxTextEdit
          Left = 85
          Top = 203
          Style.Shadow = False
          TabOrder = 5
          Width = 300
        end
        object cbPublic: TcxCheckBox
          Left = 8
          Top = 99
          Caption = 'Public :'
          Properties.Alignment = taRightJustify
          TabOrder = 6
          Transparent = True
          Width = 94
        end
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 3
      DesignSize = (
        420
        260)
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
        Height = 243
        Width = 404
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 292
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Height = 48
    Width = 424
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
end
