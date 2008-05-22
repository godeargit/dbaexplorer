object DirectoryPropertiesFrm: TDirectoryPropertiesFrm
  Left = 269
  Top = 219
  Width = 696
  Height = 480
  Caption = 'DirectoryPropertiesFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
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
      Width = 129
      Height = 14
      Caption = 'Directory Description'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object pcSequenceProperties: TcxPageControl
    Left = 0
    Top = 26
    Width = 688
    Height = 420
    ActivePage = tsDirectoryDetails
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
    ClientRectBottom = 420
    ClientRectLeft = 76
    ClientRectRight = 688
    ClientRectTop = 0
    object tsDirectoryDetails: TcxTabSheet
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
      object edtName: TcxTextEdit
        Left = 60
        Top = 45
        Properties.ReadOnly = True
        TabOrder = 1
        Width = 200
      end
      object cxLabel1: TcxLabel
        Left = 15
        Top = 46
        Caption = 'Name :'
        Transparent = True
      end
      object cxLabel8: TcxLabel
        Left = 20
        Top = 70
        Caption = 'Path :'
        Transparent = True
      end
      object edtPath: TcxTextEdit
        Left = 60
        Top = 69
        Properties.ReadOnly = True
        TabOrder = 4
        Width = 389
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
        FloatLeft = 368
        FloatTop = 325
        FloatClientWidth = 69
        FloatClientHeight = 49
        ItemLinks = <
          item
            Item = bbtnCreateDirectory
            Visible = True
          end
          item
            Item = bbtnAlterDirectory
            Visible = True
          end
          item
            Item = bbtnDropDirectory
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshDirectory
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
    object bbtnCreateDirectory: TdxBarButton
      Caption = 'Create Directory'
      Category = 1
      Hint = 'Create Directory'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = bbtnCreateDirectoryClick
    end
    object bbtnAlterDirectory: TdxBarButton
      Caption = 'Alter Directory'
      Category = 1
      Hint = 'Alter Directory'
      Visible = ivAlways
      ImageIndex = 101
      OnClick = bbtnAlterDirectoryClick
    end
    object bbtnDropDirectory: TdxBarButton
      Caption = 'Drop Directory'
      Category = 1
      Hint = 'Drop Directory'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropDirectoryClick
    end
    object bbtnRefreshDirectory: TdxBarButton
      Caption = 'Refresh Directory'
      Category = 1
      Hint = 'Refresh Directory'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshDirectoryClick
    end
  end
end
