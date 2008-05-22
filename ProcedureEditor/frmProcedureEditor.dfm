object ProcedureEditorFrm: TProcedureEditorFrm
  Left = 161
  Top = 173
  BorderStyle = bsNone
  Caption = 'ProcedureEditorFrm'
  ClientHeight = 506
  ClientWidth = 855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object bottomPanel: TPanel
    Left = 0
    Top = 412
    Width = 855
    Height = 74
    Align = alBottom
    TabOrder = 0
    object lviewError: TcxListView
      Left = 1
      Top = 1
      Width = 853
      Height = 72
      Align = alClient
      Columns = <
        item
          Caption = 'Line'
          MinWidth = 50
        end
        item
          Caption = 'Column'
          MinWidth = 50
        end
        item
          AutoSize = True
          Caption = 'Error Message'
          MinWidth = 300
        end>
      ReadOnly = True
      RowSelect = True
      Style.BorderStyle = cbsUltraFlat
      Style.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.Kind = lfOffice11
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object cxSplitter2: TcxSplitter
    Left = 0
    Top = 404
    Width = 855
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salBottom
    Control = bottomPanel
  end
  object dxBarDockControl1: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 855
    Height = 26
    Align = dalTop
    BarManager = dxBarManager1
  end
  object editorStatusBar: TdxStatusBar
    Left = 0
    Top = 486
    Width = 855
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        MinWidth = 20
        Width = 250
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 140
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object pc: TcxPageControl
    Left = 0
    Top = 26
    Width = 855
    Height = 378
    ActivePage = tsSource
    Align = alClient
    Style = 8
    TabOrder = 8
    OnChange = pcChange
    ClientRectBottom = 378
    ClientRectRight = 855
    ClientRectTop = 24
    object tsSource: TcxTabSheet
      Caption = 'Code'
      ImageIndex = 0
      object SQLEditorSource: TRichEdit
        Left = 0
        Top = 0
        Width = 855
        Height = 354
        Align = alClient
        Font.Charset = TURKISH_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        OnChange = SQLEditorSourceChange
        OnSelectionChange = SQLEditorSourceSelectionChange
      end
    end
    object tsBody: TcxTabSheet
      Caption = 'Body'
      ImageIndex = 1
      object SQLEditorBody: TRichEdit
        Left = 0
        Top = 0
        Width = 855
        Height = 354
        Align = alClient
        Font.Charset = TURKISH_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        OnChange = SQLEditorSourceChange
        OnSelectionChange = SQLEditorSourceSelectionChange
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
        Caption = 'FileBar'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 266
        FloatTop = 322
        FloatClientWidth = 23
        FloatClientHeight = 115
        ItemLinks = <
          item
            Item = btnNewQuery
            Visible = True
          end
          item
            Item = btnOpenQuery
            Visible = True
          end
          item
            Item = btnSaveQuery
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnCompile
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbtnRun
            Visible = True
          end>
        Name = 'FileBar'
        OneOnRow = False
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'FortmatBar'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 148
        DockedTop = 0
        FloatLeft = 405
        FloatTop = 142
        FloatClientWidth = 46
        FloatClientHeight = 196
        ItemLinks = <
          item
            Item = btnUndo
            Visible = True
          end
          item
            Item = btnRedo
            Visible = True
          end
          item
            Item = btnAlignLeft
            Visible = True
          end
          item
            Item = btnAlignCenter
            Visible = True
          end
          item
            Item = btnAlignRight
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnCut
            Visible = True
          end
          item
            Item = btnCopy
            Visible = True
          end
          item
            Item = btnPaste
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnClear
            Visible = True
          end
          item
            Item = btnSelectAll
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnFindText
            Visible = True
          end
          item
            Item = btnReplace
            Visible = True
          end>
        Name = 'FortmatBar'
        OneOnRow = False
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    CanCustomize = False
    Categories.Strings = (
      'FormatBar'
      'FileBar')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    HotImages = dmGenel.imBarIcons
    Images = dmGenel.imBarIcons
    NotDocking = [dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 32
    Top = 48
    DockControlHeights = (
      0
      0
      0
      0)
    object btnSaveQuery: TdxBarButton
      Caption = 'Save File'
      Category = 1
      Hint = 'Save File'
      Visible = ivAlways
      ImageIndex = 35
      ShortCut = 16467
      OnClick = btnSaveQueryClick
    end
    object btnNewQuery: TdxBarButton
      Caption = 'Create new PL/SQL object'
      Category = 1
      Hint = 'Create new PL/SQL object'
      Visible = ivAlways
      ImageIndex = 36
      OnClick = btnNewQueryClick
    end
    object btnOpenQuery: TdxBarButton
      Caption = 'Open File'
      Category = 1
      Hint = 'Open File'
      Visible = ivAlways
      ImageIndex = 37
      ShortCut = 16463
      OnClick = btnOpenQueryClick
    end
    object btnCompile: TdxBarButton
      Caption = 'Compile'
      Category = 1
      Hint = 'Compile'
      Visible = ivAlways
      ImageIndex = 43
      ShortCut = 120
      OnClick = btnCompileClick
    end
    object btnUndo: TdxBarButton
      Caption = 'Undo'
      Category = 0
      Hint = 'Undo'
      Visible = ivAlways
      ImageIndex = 7
      OnClick = btnUndoClick
    end
    object btnRedo: TdxBarButton
      Caption = 'Redo'
      Category = 0
      Hint = 'Redo'
      Visible = ivAlways
      ImageIndex = 8
      OnClick = btnRedoClick
    end
    object btnFindText: TdxBarButton
      Caption = 'Find Text'
      Category = 0
      Hint = 'Find Text'
      Visible = ivAlways
      ImageIndex = 25
      OnClick = btnFindTextClick
    end
    object btnAlignLeft: TdxBarButton
      Caption = 'Align Left'
      Category = 0
      Hint = 'Align Left'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      ImageIndex = 18
      OnClick = btnAlignLeftClick
    end
    object btnAlignCenter: TdxBarButton
      Tag = 2
      Caption = 'Align Center'
      Category = 0
      Hint = 'Align Center'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      ImageIndex = 19
      OnClick = btnAlignLeftClick
    end
    object btnAlignRight: TdxBarButton
      Tag = 1
      Caption = 'Align Right'
      Category = 0
      Hint = 'Align Right'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      ImageIndex = 20
      OnClick = btnAlignLeftClick
    end
    object btnCut: TdxBarButton
      Caption = 'Cut'
      Category = 0
      Hint = 'Cut'
      Visible = ivAlways
      ImageIndex = 4
      ShortCut = 16472
      OnClick = btnCutClick
    end
    object btnCopy: TdxBarButton
      Caption = 'Copy'
      Category = 0
      Hint = 'Copy'
      Visible = ivAlways
      ImageIndex = 5
      ShortCut = 16451
      OnClick = btnCopyClick
    end
    object btnPaste: TdxBarButton
      Caption = 'Paste'
      Category = 0
      Hint = 'Paste'
      Visible = ivAlways
      ImageIndex = 6
      ShortCut = 16470
      OnClick = btnPasteClick
    end
    object btnClear: TdxBarButton
      Caption = 'Clear'
      Category = 0
      Hint = 'Clear'
      Visible = ivAlways
      ImageIndex = 49
      OnClick = btnClearClick
    end
    object btnSelectAll: TdxBarButton
      Caption = 'Select All'
      Category = 0
      Hint = 'Select All'
      Visible = ivAlways
      ImageIndex = 48
      OnClick = btnSelectAllClick
    end
    object btnReplace: TdxBarButton
      Caption = 'Replace'
      Category = 0
      Hint = 'Replace'
      Visible = ivAlways
      ImageIndex = 47
      OnClick = btnReplaceClick
    end
    object bbtnRun: TdxBarButton
      Caption = 'Run'
      Category = 1
      Hint = 'Run'
      Visible = ivAlways
      ImageIndex = 45
      OnClick = bbtnRunClick
    end
  end
  object OpenDialog: TOpenDialog
    Left = 32
    Top = 258
  end
  object SaveDialog: TSaveDialog
    Left = 64
    Top = 258
  end
  object ReplaceDialog: TReplaceDialog
    OnFind = ReplaceDialogFind
    Left = 128
    Top = 256
  end
  object FindDialog: TFindDialog
    Options = [frHideUpDown]
    OnFind = FindDialogFind
    Left = 104
    Top = 256
  end
end
