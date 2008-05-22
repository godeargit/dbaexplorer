object TablespacePropertiesFrm: TTablespacePropertiesFrm
  Left = 265
  Top = 169
  Width = 696
  Height = 480
  Caption = 'TablespacePropertiesFrm'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
      Width = 139
      Height = 14
      Caption = 'Tablespace Description'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object pcTablespaceProperties: TcxPageControl
    Left = 0
    Top = 26
    Width = 688
    Height = 420
    ActivePage = tsRollbackSegmentDetails
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
    object tsRollbackSegmentDetails: TcxTabSheet
      Caption = 'Properties'
      ImageIndex = 8
      object Label11: TcxLabel
        Left = 20
        Top = 130
        Caption = 'Initial Extend :'
        Transparent = True
      end
      object Label12: TcxLabel
        Left = 20
        Top = 154
        Caption = 'Next Extend :'
        Transparent = True
      end
      object Label13: TcxLabel
        Left = 240
        Top = 104
        Caption = 'Min Extents :'
        Transparent = True
      end
      object Label14: TcxLabel
        Left = 240
        Top = 128
        Caption = 'Max Extents :'
        Transparent = True
      end
      object Label1: TcxLabel
        Left = 20
        Top = 179
        Caption = 'Pct Increase :'
        Transparent = True
      end
      object Label2: TcxLabel
        Left = 20
        Top = 203
        Caption = 'Status :'
        Transparent = True
      end
      object Label3: TcxLabel
        Left = 20
        Top = 83
        Caption = 'Contents :'
        Transparent = True
      end
      object Label4: TcxLabel
        Left = 20
        Top = 228
        Caption = 'Logging :'
        Transparent = True
      end
      object Label5: TcxLabel
        Left = 240
        Top = 179
        Caption = 'Extent Management :'
        Transparent = True
      end
      object Label6: TcxLabel
        Left = 240
        Top = 203
        Caption = 'Allocation Type :'
        Transparent = True
      end
      object Label7: TcxLabel
        Left = 240
        Top = 228
        Caption = 'Retention :'
        Transparent = True
      end
      object Label8: TcxLabel
        Left = 240
        Top = 152
        Caption = 'Min Extent Size :'
        Transparent = True
      end
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
        Left = 92
        Top = 45
        Properties.ReadOnly = True
        TabOrder = 1
        Width = 366
      end
      object cxLabel1: TcxLabel
        Left = 20
        Top = 46
        Caption = 'Name :'
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 19
        Top = 106
        Caption = 'Block Size :'
        Transparent = True
      end
      object edtInitialExtend: TcxButtonEdit
        Left = 92
        Top = 128
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        TabOrder = 4
        Text = '0'
        Width = 113
      end
      object edtNextExtend: TcxButtonEdit
        Left = 92
        Top = 152
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        TabOrder = 5
        Text = '0'
        Width = 113
      end
      object edtMinExtents: TcxSpinEdit
        Left = 344
        Top = 104
        Properties.ReadOnly = True
        TabOrder = 6
        Width = 113
      end
      object edtMaxExtents: TcxSpinEdit
        Left = 344
        Top = 128
        Properties.ReadOnly = True
        TabOrder = 7
        Width = 113
      end
      object edtPctIncrease: TcxButtonEdit
        Left = 92
        Top = 176
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        TabOrder = 8
        Text = '0'
        Width = 113
      end
      object icbStatus: TcxImageComboBox
        Left = 92
        Top = 200
        Properties.Items = <
          item
            Description = 'Online'
            ImageIndex = 0
            Value = 'Online'
          end
          item
            Description = 'Offline'
            Value = 'Offline'
          end
          item
            Description = 'Read Only'
            Value = 'Read Only'
          end>
        Properties.ReadOnly = True
        TabOrder = 9
        Width = 113
      end
      object icbContents: TcxImageComboBox
        Left = 92
        Top = 80
        Properties.Items = <
          item
            Description = 'Permanent'
            ImageIndex = 0
            Value = 'Permanent'
          end
          item
            Description = 'Temporary'
            Value = 'Temporary'
          end
          item
            Description = 'Undo'
            Value = 'Undo'
          end>
        Properties.ReadOnly = True
        TabOrder = 10
        Width = 113
      end
      object icbLogging: TcxImageComboBox
        Left = 92
        Top = 224
        Properties.Items = <
          item
            Description = 'Deffault'
            ImageIndex = 0
            Value = 'Deffault'
          end
          item
            Description = 'Logging'
            Value = 'Logging'
          end
          item
            Description = 'No Logging'
            Value = 'No Logging'
          end>
        Properties.ReadOnly = True
        TabOrder = 11
        Width = 113
      end
      object cbForceLogging: TcxCheckBox
        Left = 16
        Top = 284
        Caption = 'Force Logging'
        Properties.ReadOnly = True
        TabOrder = 12
        Transparent = True
        Width = 121
      end
      object icbExtentManagement: TcxImageComboBox
        Left = 344
        Top = 176
        Properties.Items = <
          item
            Description = 'Dictionary'
            ImageIndex = 0
            Value = 'Dictionary'
          end
          item
            Description = 'Local'
            Value = 'Local'
          end>
        Properties.ReadOnly = True
        TabOrder = 13
        Width = 113
      end
      object icbRetention: TcxImageComboBox
        Left = 344
        Top = 224
        Properties.Items = <
          item
            Description = 'Guarantee'
            ImageIndex = 0
            Value = 'Guarantee'
          end
          item
            Description = 'No Guarantee'
            Value = 'No Guarantee'
          end
          item
            Description = 'Not Apply'
            Value = 'Not Apply'
          end>
        Properties.ReadOnly = True
        TabOrder = 14
        Width = 113
      end
      object cbBigFile: TcxCheckBox
        Left = 16
        Top = 308
        Caption = 'Big File'
        Properties.ReadOnly = True
        TabOrder = 15
        Transparent = True
        Width = 209
      end
      object edtMinExtlen: TcxSpinEdit
        Left = 344
        Top = 152
        Properties.ReadOnly = True
        TabOrder = 16
        Width = 113
      end
      object edtBlockSize: TcxButtonEdit
        Left = 92
        Top = 104
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        TabOrder = 29
        Text = '0'
        Width = 113
      end
      object icbSgmentSpaceManagement: TcxImageComboBox
        Left = 202
        Top = 258
        Properties.Items = <
          item
            Description = 'Manual'
            ImageIndex = 0
            Value = 'Manual'
          end
          item
            Description = 'Auto'
            Value = 'Auto'
          end>
        Properties.ReadOnly = True
        TabOrder = 30
        Width = 113
      end
      object cxLabel3: TcxLabel
        Left = 20
        Top = 260
        Caption = 'Auto Segment Space Management :'
        Transparent = True
      end
      object cbCompress: TcxCheckBox
        Left = 16
        Top = 332
        Caption = 'Compress'
        Properties.ReadOnly = True
        TabOrder = 32
        Transparent = True
        Width = 209
      end
      object icbAllocationType: TcxImageComboBox
        Left = 344
        Top = 200
        Properties.Items = <
          item
            Description = 'Auto'
            ImageIndex = 0
            Value = 'Auto'
          end
          item
            Description = 'Uniform'
            Value = 'Uniform'
          end
          item
            Description = 'Default'
            Value = 'Default'
          end>
        Properties.ReadOnly = True
        TabOrder = 33
        Width = 113
      end
    end
    object tsDataFile: TcxTabSheet
      Caption = 'Data Files'
      ImageIndex = 2
    end
    object tsObjects: TcxTabSheet
      Caption = 'Objects'
      ImageIndex = 2
    end
    object tsFramentation: TcxTabSheet
      Caption = 'Framentation'
      ImageIndex = 4
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
        FloatLeft = 319
        FloatTop = 145
        FloatClientWidth = 69
        FloatClientHeight = 76
        ItemLinks = <
          item
            Item = bbtnCreateTablespace
            Visible = True
          end
          item
            Item = bbtnAlterTablespace
            Visible = True
          end
          item
            Item = bbtnDropTablespace
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnTakeOnTablespace
            Visible = True
          end
          item
            Item = bbtnTakeOffTablespace
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRefreshTablespace
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
    object bbtnCreateTablespace: TdxBarButton
      Caption = 'Create Tablespace'
      Category = 1
      Hint = 'Create Tablespace'
      Visible = ivAlways
      ImageIndex = 82
      OnClick = bbtnCreateTablespaceClick
    end
    object bbtnAlterTablespace: TdxBarButton
      Caption = 'Alter Tablespace'
      Category = 1
      Hint = 'Alter Tablespace'
      Visible = ivAlways
      ImageIndex = 101
      OnClick = bbtnAlterTablespaceClick
    end
    object bbtnDropTablespace: TdxBarButton
      Caption = 'Drop Tablespace'
      Category = 1
      Hint = 'Drop Tablespace'
      Visible = ivAlways
      ImageIndex = 83
      OnClick = bbtnDropTablespaceClick
    end
    object bbtnRefreshTablespace: TdxBarButton
      Caption = 'Refresh Tablespace'
      Category = 1
      Hint = 'Refresh Tablespace'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = bbtnRefreshTablespaceClick
    end
    object bbtnTakeOffTablespace: TdxBarButton
      Caption = 'Take Off'
      Category = 1
      Hint = 'Take Off'
      Visible = ivAlways
      ImageIndex = 91
      OnClick = bbtnTakeOffTablespaceClick
    end
    object bbtnTakeOnTablespace: TdxBarButton
      Caption = 'Take On'
      Category = 1
      Hint = 'Take On'
      Visible = ivAlways
      ImageIndex = 89
      OnClick = bbtnTakeOnTablespaceClick
    end
  end
end
