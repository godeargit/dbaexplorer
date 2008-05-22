object DiffMainFrm: TDiffMainFrm
  Left = 220
  Top = 115
  Width = 696
  Height = 480
  Caption = 'Compare Files/Folders'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 427
    Width = 688
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Text = '+'
        Width = 18
      end
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Text = '~'
        Width = 18
      end
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Text = '-'
        Width = 18
      end
      item
        Width = 50
      end>
    ParentFont = True
    UseSystemFont = False
    OnDrawPanel = StatusBar1DrawPanel
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 176
        FloatTop = 162
        FloatClientWidth = 0
        FloatClientHeight = 0
        IsMainMenu = True
        ItemLinks = <
          item
            Item = dxBarSubItem1
            Visible = True
          end
          item
            Item = mnuEdit
            Visible = True
          end
          item
            Item = mnuSearch
            Visible = True
          end
          item
            Item = mnuOptions
            Visible = True
          end
          item
            Item = dxBarSubItem5
            Visible = True
          end>
        MultiLine = True
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'Custom 2'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 23
        DockingStyle = dsTop
        FloatLeft = 176
        FloatTop = 162
        FloatClientWidth = 0
        FloatClientHeight = 0
        ItemLinks = <
          item
            Item = tbFolder
            Visible = True
          end
          item
            BeginGroup = True
            Item = tbOpen1
            Visible = True
          end
          item
            Item = tbOpen2
            Visible = True
          end
          item
            BeginGroup = True
            Item = tbCompare
            Visible = True
          end
          item
            Item = tbCancel
            Visible = True
          end
          item
            Item = tbHorzSplit
            Visible = True
          end
          item
            BeginGroup = True
            Item = tbSave1
            Visible = True
          end
          item
            Item = tbSave2
            Visible = True
          end
          item
            Item = tbFindNext
            Visible = True
          end
          item
            Item = tbReplace
            Visible = True
          end
          item
            BeginGroup = True
            Item = tbNext
            Visible = True
          end
          item
            Item = tbPrev
            Visible = True
          end>
        Name = 'Custom 2'
        OneOnRow = True
        Row = 1
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default'
      'File'
      'Edit'
      'Search'
      'Options'
      'Actions'
      'tool')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True
      True)
    Images = dmGenel.ilDiff
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 48
    Top = 80
    DockControlHeights = (
      0
      0
      49
      0)
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'File'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = mnuOpen1
          Visible = True
        end
        item
          Item = mnuOpen2
          Visible = True
        end
        item
          BeginGroup = True
          Item = mnuSave1
          Visible = True
        end
        item
          Item = mnuSave2
          Visible = True
        end
        item
          BeginGroup = True
          Item = mnuFolder
          Visible = True
        end
        item
          BeginGroup = True
          Item = mnuSaveReport
          Visible = True
        end
        item
          Item = mnuExit
          Visible = True
        end>
    end
    object mnuEdit: TdxBarSubItem
      Caption = 'Edit'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = mnuUndo
          Visible = True
        end
        item
          Item = mnuRedo
          Visible = True
        end
        item
          BeginGroup = True
          Item = mnuCut
          Visible = True
        end
        item
          Item = mnuCopy
          Visible = True
        end
        item
          Item = mnuPaste
          Visible = True
        end>
    end
    object mnuSearch: TdxBarSubItem
      Caption = 'Search'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = mnuFind
          Visible = True
        end
        item
          Item = mnuFindNext
          Visible = True
        end
        item
          Item = mnuReplace
          Visible = True
        end>
    end
    object mnuOptions: TdxBarSubItem
      Caption = 'Options'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = mnuIgnoreBlanks
          Visible = True
        end
        item
          Item = mnuIgnoreCase
          Visible = True
        end
        item
          Item = mnuShowDiffsOnly
          Visible = True
        end
        item
          Item = mnuHorzSplit
          Visible = True
        end
        item
          Item = dxBarSubItem6
          Visible = True
        end
        item
          Item = mnuFont
          Visible = True
        end>
    end
    object dxBarSubItem5: TdxBarSubItem
      Caption = 'Actions'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = mnuCompare
          Visible = True
        end
        item
          Item = mnuCancel
          Visible = True
        end
        item
          Item = mnuCompareFiles
          Visible = True
        end
        item
          BeginGroup = True
          Item = mnuNext
          Visible = True
        end
        item
          Item = mnuPrev
          Visible = True
        end
        item
          BeginGroup = True
          Item = mnuCopyBlockRight
          Visible = True
        end
        item
          Item = mnuCopyBlockLeft
          Visible = True
        end>
    end
    object mnuOpen1: TdxBarButton
      Caption = 'Open 1'
      Category = 1
      Hint = 'Open 1'
      Visible = ivAlways
    end
    object mnuOpen2: TdxBarButton
      Caption = 'Open 2'
      Category = 1
      Hint = 'Open 2'
      Visible = ivAlways
    end
    object mnuSave1: TdxBarButton
      Caption = 'Save 1'
      Category = 1
      Hint = 'Save 1'
      Visible = ivAlways
    end
    object mnuSave2: TdxBarButton
      Caption = 'Save 2'
      Category = 1
      Hint = 'Save 2'
      Visible = ivAlways
    end
    object mnuFolder: TdxBarButton
      Caption = 'Folder'
      Category = 1
      Hint = 'Folder'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = mnuFolderClick
    end
    object mnuSaveReport: TdxBarButton
      Caption = 'Save Compare Report'
      Category = 1
      Hint = 'Save Compare Report'
      Visible = ivAlways
    end
    object mnuExit: TdxBarButton
      Caption = 'Close'
      Category = 1
      Hint = 'Close'
      Visible = ivAlways
      OnClick = mnuExitClick
    end
    object mnuUndo: TdxBarButton
      Caption = 'Undo'
      Category = 2
      Hint = 'Undo'
      Visible = ivAlways
      ShortCut = 16474
    end
    object mnuRedo: TdxBarButton
      Caption = 'Redo'
      Category = 2
      Hint = 'Redo'
      Visible = ivAlways
      ShortCut = 24666
    end
    object mnuCut: TdxBarButton
      Caption = 'Cut'
      Category = 2
      Hint = 'Cut'
      Visible = ivAlways
      ShortCut = 16472
    end
    object mnuCopy: TdxBarButton
      Caption = 'Copy'
      Category = 2
      Hint = 'Copy'
      Visible = ivAlways
      ShortCut = 16451
    end
    object mnuPaste: TdxBarButton
      Caption = 'Paste'
      Category = 2
      Hint = 'Paste'
      Visible = ivAlways
      ShortCut = 16470
    end
    object mnuFind: TdxBarButton
      Caption = 'Find'
      Category = 3
      Hint = 'Find'
      Visible = ivAlways
      ShortCut = 16454
    end
    object mnuFindNext: TdxBarButton
      Caption = 'Find Next'
      Category = 3
      Hint = 'Find Next'
      Visible = ivAlways
      ShortCut = 114
    end
    object mnuReplace: TdxBarButton
      Caption = 'Replace'
      Category = 3
      Hint = 'Replace'
      Visible = ivAlways
      ShortCut = 16466
    end
    object mnuIgnoreBlanks: TdxBarButton
      Caption = 'Ignore Blanks'
      Category = 4
      Hint = 'Ignore Blanks'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = mnuIgnoreBlanksClick
    end
    object mnuIgnoreCase: TdxBarButton
      Caption = 'Ignore Case'
      Category = 4
      Hint = 'Ignore Case'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = mnuIgnoreCaseClick
    end
    object mnuShowDiffsOnly: TdxBarButton
      Caption = 'Show Diffs Only'
      Category = 4
      Hint = 'Show Diffs Only'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = mnuShowDiffsOnlyClick
    end
    object mnuHorzSplit: TdxBarButton
      Caption = 'Horz Split'
      Category = 4
      Hint = 'Horz Split'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object dxBarSubItem6: TdxBarSubItem
      Caption = 'Highlight Colors'
      Category = 4
      Visible = ivAlways
      ItemLinks = <
        item
          Item = Added1
          Visible = True
        end
        item
          Item = Modified1
          Visible = True
        end
        item
          Item = Deleted1
          Visible = True
        end>
    end
    object Added1: TdxBarButton
      Caption = 'Added'
      Category = 4
      Hint = 'Added'
      Visible = ivAlways
      OnClick = Added1Click
    end
    object Modified1: TdxBarButton
      Caption = 'Modified'
      Category = 4
      Hint = 'Modified'
      Visible = ivAlways
      OnClick = Modified1Click
    end
    object Deleted1: TdxBarButton
      Caption = 'Deleted'
      Category = 4
      Hint = 'Deleted'
      Visible = ivAlways
      OnClick = Deleted1Click
    end
    object mnuFont: TdxBarButton
      Caption = 'Font...'
      Category = 4
      Hint = 'Font'
      Visible = ivAlways
    end
    object mnuCompare: TdxBarButton
      Caption = 'Compare'
      Category = 5
      Hint = 'Compare'
      Visible = ivAlways
      ShortCut = 120
    end
    object mnuCancel: TdxBarButton
      Caption = 'Cancel'
      Category = 5
      Hint = 'Cancel'
      Visible = ivAlways
      ShortCut = 27
    end
    object mnuCompareFiles: TdxBarButton
      Caption = 'Compare Files'
      Category = 5
      Hint = 'Compare Files'
      Visible = ivAlways
      ShortCut = 13
    end
    object mnuNext: TdxBarButton
      Caption = 'Next'
      Category = 5
      Hint = 'Next'
      Visible = ivAlways
      ShortCut = 16462
    end
    object mnuPrev: TdxBarButton
      Caption = 'Prev'
      Category = 5
      Hint = 'Prev'
      Visible = ivAlways
      ShortCut = 16464
    end
    object mnuCopyBlockRight: TdxBarButton
      Caption = 'Copy Block Right'
      Category = 5
      Hint = 'Copy Block Right'
      Visible = ivAlways
      ShortCut = 49234
    end
    object mnuCopyBlockLeft: TdxBarButton
      Caption = 'Copy Block Left'
      Category = 5
      Hint = 'Copy Block Left'
      Visible = ivAlways
      ShortCut = 49228
    end
    object tbFolder: TdxBarButton
      Caption = 'tbFolder'
      Category = 6
      Hint = 'tbFolder'
      Visible = ivAlways
      ImageIndex = 12
    end
    object tbOpen1: TdxBarButton
      Caption = 'tbOpen1'
      Category = 6
      Hint = 'tbOpen1'
      Visible = ivAlways
      ImageIndex = 0
    end
    object tbOpen2: TdxBarButton
      Caption = 'tbOpen2'
      Category = 6
      Hint = 'tbOpen2'
      Visible = ivAlways
      ImageIndex = 1
    end
    object tbCompare: TdxBarButton
      Caption = 'tbCompare'
      Category = 6
      Hint = 'tbCompare'
      Visible = ivAlways
      ImageIndex = 5
    end
    object tbCancel: TdxBarButton
      Caption = 'tbCancel'
      Category = 6
      Hint = 'tbCancel'
      Visible = ivAlways
      ImageIndex = 6
    end
    object tbHorzSplit: TdxBarButton
      Caption = 'tbHorzSplit'
      Category = 6
      Hint = 'tbHorzSplit'
      Visible = ivAlways
      ImageIndex = 4
    end
    object tbSave1: TdxBarButton
      Caption = 'tbSave1'
      Category = 6
      Hint = 'tbSave1'
      Visible = ivAlways
      ImageIndex = 2
    end
    object tbSave2: TdxBarButton
      Caption = 'tbSave2'
      Category = 6
      Hint = 'tbSave2'
      Visible = ivAlways
      ImageIndex = 3
    end
    object tbFindNext: TdxBarButton
      Caption = 'tbFindNext'
      Category = 6
      Hint = 'tbFindNext'
      Visible = ivAlways
      ImageIndex = 10
    end
    object tbReplace: TdxBarButton
      Caption = 'tbReplace'
      Category = 6
      Hint = 'tbReplace'
      Visible = ivAlways
      ImageIndex = 11
    end
    object tbNext: TdxBarButton
      Caption = 'tbNext'
      Category = 6
      Hint = 'tbNext'
      Visible = ivAlways
      ImageIndex = 7
    end
    object tbPrev: TdxBarButton
      Caption = 'tbPrev'
      Category = 6
      Hint = 'tbPrev'
      Visible = ivAlways
      ImageIndex = 8
    end
  end
  object ColorDialog1: TColorDialog
    Options = [cdFullOpen]
    Left = 16
    Top = 79
  end
end
