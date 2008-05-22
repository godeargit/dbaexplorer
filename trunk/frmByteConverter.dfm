object ByteConverterFrm: TByteConverterFrm
  Left = 425
  Top = 214
  BorderStyle = bsDialog
  Caption = 'Byte Converter'
  ClientHeight = 195
  ClientWidth = 178
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Caption = 'Byte Converter'
    Style.Shadow = False
    TabOrder = 0
    Height = 145
    Width = 161
    object Label1: TLabel
      Left = 10
      Top = 23
      Width = 53
      Height = 13
      Caption = 'Gigabytes :'
    end
    object Label2: TLabel
      Left = 5
      Top = 44
      Width = 58
      Height = 13
      Caption = 'Megabytes :'
    end
    object Label3: TLabel
      Left = 15
      Top = 65
      Width = 48
      Height = 13
      Caption = 'Kilobytes :'
    end
    object Label4: TLabel
      Left = 31
      Top = 86
      Width = 32
      Height = 13
      Caption = 'Bytes :'
    end
    object Shape1: TShape
      Left = 2
      Top = 109
      Width = 158
      Height = 1
      Pen.Color = clNavy
    end
    object Label5: TLabel
      Left = 8
      Top = 120
      Width = 36
      Height = 13
      Caption = 'Result :'
    end
    object cxSpinEdit1: TcxSpinEdit
      Left = 69
      Top = 20
      TabOrder = 0
      Width = 85
    end
    object cxSpinEdit2: TcxSpinEdit
      Left = 69
      Top = 41
      TabOrder = 1
      Width = 85
    end
    object cxSpinEdit3: TcxSpinEdit
      Left = 69
      Top = 62
      TabOrder = 2
      Width = 85
    end
    object cxSpinEdit4: TcxSpinEdit
      Left = 69
      Top = 83
      TabOrder = 3
      Width = 85
    end
    object cxTextEdit1: TcxTextEdit
      Left = 48
      Top = 115
      TabOrder = 4
      Text = 'cxTextEdit1'
      Width = 105
    end
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 160
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object cxButton2: TcxButton
    Left = 94
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
