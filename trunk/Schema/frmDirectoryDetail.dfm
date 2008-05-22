object DirectoryDetailFrm: TDirectoryDetailFrm
  Left = 289
  Top = 247
  Width = 515
  Height = 250
  BorderIcons = [biSystemMenu]
  Caption = 'DirectoryDetailFrm'
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
  object pc: TcxPageControl
    Left = 8
    Top = 8
    Width = 489
    Height = 145
    ActivePage = tsDirectory
    Color = clBtnFace
    ParentColor = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    TabWidth = 80
    OnPageChanging = pcPageChanging
    ClientRectBottom = 144
    ClientRectLeft = 1
    ClientRectRight = 488
    ClientRectTop = 20
    object tsDirectory: TcxTabSheet
      Caption = 'Directory'
      ImageIndex = 0
      object cxGroupBox1: TcxGroupBox
        Left = 9
        Top = 6
        TabOrder = 0
        Transparent = True
        DesignSize = (
          470
          107)
        Height = 107
        Width = 470
        object Bevel1: TBevel
          Left = 13
          Top = 51
          Width = 430
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object edtName: TcxTextEdit
          Left = 67
          Top = 21
          Anchors = [akLeft, akTop, akRight]
          Style.Shadow = False
          TabOrder = 0
          Width = 379
        end
        object cxLabel1: TcxLabel
          Left = 16
          Top = 23
          Caption = 'Name :'
        end
        object cxLabel2: TcxLabel
          Left = 17
          Top = 63
          Caption = 'Path :'
        end
        object edtPath: TcxButtonEdit
          Left = 67
          Top = 60
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          TabOrder = 3
          Width = 380
        end
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 3
      DesignSize = (
        487
        124)
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
        Height = 108
        Width = 471
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 7
    Top = 158
    TabOrder = 1
    Height = 48
    Width = 492
    object btnExecute: TcxButton
      Left = 10
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 0
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnCancel: TcxButton
      Left = 90
      Top = 13
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
