object TableFindFrm: TTableFindFrm
  Left = 334
  Top = 175
  BorderStyle = bsDialog
  Caption = 'Data Find'
  ClientHeight = 357
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 304
    TabOrder = 0
    Transparent = True
    Height = 46
    Width = 509
    object btnCancel: TcxButton
      Left = 90
      Top = 12
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
    end
    object btnOK: TcxButton
      Left = 10
      Top = 12
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 8
    Top = 8
    Width = 506
    Height = 288
    ActivePage = cxTabSheet1
    ShowFrame = True
    Style = 9
    TabOrder = 1
    ClientRectBottom = 287
    ClientRectLeft = 1
    ClientRectRight = 505
    ClientRectTop = 20
    object cxTabSheet1: TcxTabSheet
      Caption = 'Find Data'
      ImageIndex = 0
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 2
        TabOrder = 0
        Transparent = True
        Height = 256
        Width = 489
        object lbFields: TcxListBox
          Left = 8
          Top = 28
          Width = 153
          Height = 213
          ItemHeight = 13
          TabOrder = 0
        end
        object edtValue: TcxTextEdit
          Left = 165
          Top = 28
          TabOrder = 1
          Width = 315
        end
        object cxLabel1: TcxLabel
          Left = 10
          Top = 8
          Caption = 'Table Fields'
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 165
          Top = 10
          Caption = 'Field Value'
          Transparent = True
        end
        object lbFilter: TcxListBox
          Left = 165
          Top = 84
          Width = 315
          Height = 137
          ItemHeight = 13
          TabOrder = 4
        end
        object btnAdd: TcxButton
          Left = 167
          Top = 53
          Width = 75
          Height = 25
          Caption = 'Add'
          TabOrder = 5
          OnClick = btnAddClick
          LookAndFeel.Kind = lfOffice11
        end
        object btnDelete: TcxButton
          Left = 256
          Top = 53
          Width = 75
          Height = 25
          Caption = 'Delete'
          TabOrder = 6
          OnClick = btnDeleteClick
          LookAndFeel.Kind = lfOffice11
        end
        object cbCaseInsensitive: TcxCheckBox
          Left = 166
          Top = 228
          Caption = 'Case Insensitive'
          TabOrder = 7
          Transparent = True
          Width = 113
        end
        object cbPartialKey: TcxCheckBox
          Left = 294
          Top = 228
          Caption = 'Partial Key'
          TabOrder = 8
          Transparent = True
          Width = 113
        end
      end
    end
  end
end
