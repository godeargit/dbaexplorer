object EnvironmentOptionsFrm: TEnvironmentOptionsFrm
  Left = 289
  Top = 267
  Width = 588
  Height = 403
  Caption = 'Environment Options'
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
  object Panel2: TPanel
    Left = 0
    Top = 328
    Width = 580
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
  object treeList: TcxTreeView
    Left = 0
    Top = 0
    Width = 129
    Height = 328
    Align = alLeft
    Style.BorderStyle = cbsUltraFlat
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Shadow = False
    TabOrder = 1
    HideSelection = False
    Images = dmGenel.ilEnviromentOptions
    Items.Data = {
      0300000022000000000000000000000000000000FFFFFFFF0000000000000000
      094C616E6775616765731E000000010000000100000001000000FFFFFFFF0000
      00000000000005466F6E747325000000020000000200000002000000FFFFFFFF
      00000000000000000C456469746F7220436F6C6F72}
    ReadOnly = True
    OnChange = treeListChange
  end
  object Panel1: TPanel
    Left = 129
    Top = 0
    Width = 451
    Height = 328
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 451
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 0
      object imgToolBar: TImage
        Left = 0
        Top = 0
        Width = 451
        Height = 25
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
      object imgObject: TImage
        Left = 412
        Top = 4
        Width = 18
        Height = 18
        Center = True
        Stretch = True
        Transparent = True
      end
      object lblObjectName: TcxLabel
        Left = 5
        Top = 2
        Caption = 'Languages'
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
    object pc: TcxPageControl
      Left = 0
      Top = 25
      Width = 451
      Height = 303
      ActivePage = tsFont
      Align = alClient
      ShowFrame = True
      TabOrder = 1
      ClientRectBottom = 302
      ClientRectLeft = 1
      ClientRectRight = 450
      ClientRectTop = 1
      object tsLanguages: TcxTabSheet
        Caption = 'tsLanguages'
        ImageIndex = 0
        TabVisible = False
        object cxLabel1: TcxLabel
          Left = 8
          Top = 16
          Caption = 'Default Language :'
        end
        object comboDefaultLanguage: TcxComboBox
          Left = 116
          Top = 15
          Properties.DropDownListStyle = lsFixedList
          TabOrder = 1
          Width = 326
        end
        object cxLabel2: TcxLabel
          Left = 8
          Top = 48
          Caption = 'Available Languages'
        end
        object lvLanguageList: TcxListView
          Left = 7
          Top = 71
          Width = 436
          Height = 192
          Columns = <
            item
              Caption = 'Language'
              MinWidth = 100
              Width = 100
            end
            item
              Caption = 'Path'
              MinWidth = 330
              Width = 330
            end>
          TabOrder = 3
          ViewStyle = vsReport
        end
        object btnAddLanguage: TcxButton
          Left = 8
          Top = 270
          Width = 105
          Height = 25
          Caption = 'Add Language...'
          TabOrder = 4
          OnClick = btnAddLanguageClick
          LookAndFeel.Kind = lfOffice11
        end
      end
      object tsFont: TcxTabSheet
        Caption = 'tsFont'
        ImageIndex = 1
        TabVisible = False
        object cxLabel3: TcxLabel
          Left = 8
          Top = 16
          Caption = 'System Font Name :'
        end
        object comboFontName: TcxFontNameComboBox
          Left = 112
          Top = 14
          Properties.OnChange = comboFontNamePropertiesChange
          TabOrder = 1
          Width = 265
        end
        object cxLabel4: TcxLabel
          Left = 15
          Top = 42
          Caption = 'System Font Size :'
        end
        object sedtFontSize: TcxSpinEdit
          Left = 112
          Top = 39
          Properties.OnChange = comboFontNamePropertiesChange
          TabOrder = 3
          Value = 8
          Width = 66
        end
        object lblFontSample: TcxLabel
          Left = 11
          Top = 67
          AutoSize = False
          Caption = 'Sample Text  ABCD - 1234'
          ParentColor = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.Orientation = cxoBottom
          Style.BorderStyle = ebsUltraFlat
          Style.Color = clWhite
          Height = 73
          Width = 423
        end
      end
      object tsEditorColor: TcxTabSheet
        Caption = 'tsEditorColor'
        ImageIndex = 2
        TabVisible = False
      end
    end
  end
end
