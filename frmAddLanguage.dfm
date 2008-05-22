object AddLanguageFrm: TAddLanguageFrm
  Left = 385
  Top = 357
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Add Language'
  ClientHeight = 150
  ClientWidth = 430
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
  object Shape1: TShape
    Left = 0
    Top = 30
    Width = 430
    Height = 79
    Align = alClient
    Pen.Color = clGreen
  end
  object lblAction: TLabel
    Left = 16
    Top = 48
    Width = 88
    Height = 13
    Caption = 'Language Name : '
    Transparent = True
  end
  object Label1: TLabel
    Left = 16
    Top = 72
    Width = 76
    Height = 13
    Caption = 'Language File : '
    Transparent = True
  end
  object Panel2: TPanel
    Left = 0
    Top = 109
    Width = 430
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnCancel: TcxButton
      Left = 90
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnOK: TcxButton
      Left = 10
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object imgToolBar: TImage
      Left = 0
      Top = 0
      Width = 430
      Height = 30
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
    object lblObjectName: TcxLabel
      Left = 14
      Top = 5
      Caption = 'Add New Language'
      ParentFont = False
      Properties.Depth = 2
      Properties.LabelEffect = cxleCool
      Properties.ShadowedColor = clNavy
      Style.BorderStyle = ebsNone
      Style.Font.Charset = TURKISH_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.Shadow = False
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
  end
  object bedtLanguageFile: TcxButtonEdit
    Left = 107
    Top = 68
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = bedtLanguageFilePropertiesButtonClick
    TabOrder = 2
    Width = 286
  end
  object edtLanguageName: TcxTextEdit
    Left = 107
    Top = 46
    TabOrder = 3
    Width = 286
  end
  object OpenDialog: TOpenDialog
    Filter = 'Language Ini File|*.ini'
    Left = 328
    Top = 24
  end
end
