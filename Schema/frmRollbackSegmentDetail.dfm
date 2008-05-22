object RollbackSegmentDetailFrm: TRollbackSegmentDetailFrm
  Left = 298
  Top = 205
  Width = 518
  Height = 406
  BorderIcons = [biSystemMenu]
  Caption = 'RollbackSegmentDetailFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    510
    372)
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 9
    Top = 8
    Width = 488
    Height = 302
    ActivePage = tsRollbackSegment
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnFace
    ParentColor = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    OnPageChanging = pcPageChanging
    ClientRectBottom = 301
    ClientRectLeft = 1
    ClientRectRight = 487
    ClientRectTop = 20
    object tsRollbackSegment: TcxTabSheet
      Caption = 'Rollback Segment'
      ImageIndex = 0
      DesignSize = (
        486
        281)
      object cxGroupBox1: TcxGroupBox
        Left = 11
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          465
          260)
        Height = 260
        Width = 465
        object Bevel2: TBevel
          Left = 13
          Top = 47
          Width = 437
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object edtName: TcxTextEdit
          Left = 102
          Top = 17
          Anchors = [akLeft, akTop, akRight]
          Properties.ReadOnly = False
          TabOrder = 0
          Width = 351
        end
        object cxLabel1: TcxLabel
          Left = 15
          Top = 18
          Caption = 'Name :'
          Transparent = True
        end
        object cxLabel8: TcxLabel
          Left = 12
          Top = 72
          Caption = 'Tablespace :'
          Transparent = True
        end
        object chkOnline: TcxCheckBox
          Left = 11
          Top = 96
          Caption = 'Online :'
          Properties.Alignment = taRightJustify
          TabOrder = 3
          Transparent = True
          Width = 108
        end
        object chkPublic: TcxCheckBox
          Left = 10
          Top = 118
          Caption = 'Public :'
          Properties.Alignment = taRightJustify
          TabOrder = 4
          Transparent = True
          Width = 109
        end
        object gbStorageClause: TcxGroupBox
          Left = 10
          Top = 151
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Storage Clause'
          TabOrder = 5
          Transparent = True
          Height = 95
          Width = 444
          object Label11: TLabel
            Left = 11
            Top = 22
            Width = 66
            Height = 13
            Caption = 'Initial Extend :'
            Transparent = True
          end
          object Label12: TLabel
            Left = 11
            Top = 43
            Width = 64
            Height = 13
            Caption = 'Next Extend :'
            Transparent = True
          end
          object Label13: TLabel
            Left = 242
            Top = 21
            Width = 61
            Height = 13
            Caption = 'Min Extents :'
            Transparent = True
          end
          object Label14: TLabel
            Left = 242
            Top = 43
            Width = 64
            Height = 13
            Caption = 'Max Extents :'
            Transparent = True
          end
          object Label5: TLabel
            Left = 11
            Top = 65
            Width = 64
            Height = 13
            Caption = 'Optimal Size :'
            Transparent = True
          end
          object edtInitialExtend: TcxButtonEdit
            Left = 91
            Top = 18
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 0
            Text = '0'
            Width = 113
          end
          object edtNextExtend: TcxButtonEdit
            Left = 91
            Top = 40
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 1
            Text = '0'
            Width = 113
          end
          object edtPctIncrease: TcxButtonEdit
            Left = 91
            Top = 62
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 2
            Text = '0'
            Width = 113
          end
          object edtMinExtents: TcxSpinEdit
            Left = 315
            Top = 16
            TabOrder = 3
            Width = 112
          end
          object edtMaxExtents: TcxSpinEdit
            Left = 315
            Top = 39
            TabOrder = 4
            Width = 112
          end
        end
        object lcTablespace: TcxLookupComboBox
          Left = 102
          Top = 70
          Anchors = [akLeft, akTop, akRight]
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'TABLESPACE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLESPACE_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsTablespace
          TabOrder = 6
          Width = 351
        end
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 3
      DesignSize = (
        486
        281)
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
        Height = 265
        Width = 470
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 313
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Height = 51
    Width = 491
    object btnCancel: TcxButton
      Left = 90
      Top = 15
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
      Top = 15
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 1
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
  end
end
