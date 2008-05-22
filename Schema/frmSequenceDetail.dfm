object SequenceDetailFrm: TSequenceDetailFrm
  Left = 333
  Top = 170
  Width = 417
  Height = 427
  Caption = 'SequenceDetailFrm'
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 8
    Top = 8
    Width = 392
    Height = 324
    ActivePage = tsSequence
    Color = clBtnFace
    ParentColor = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    TabWidth = 80
    OnPageChanging = pcPageChanging
    ClientRectBottom = 323
    ClientRectLeft = 1
    ClientRectRight = 391
    ClientRectTop = 20
    object tsSequence: TcxTabSheet
      Caption = 'Sequence'
      ImageIndex = 0
      object cxGroupBox1: TcxGroupBox
        Left = 11
        Top = 8
        TabOrder = 0
        Transparent = True
        DesignSize = (
          365
          282)
        Height = 282
        Width = 365
        object Label2: TLabel
          Left = 21
          Top = 26
          Width = 34
          Height = 13
          Caption = 'Name :'
          Transparent = True
        end
        object Label1: TLabel
          Left = 23
          Top = 78
          Width = 44
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object Bevel2: TBevel
          Left = 22
          Top = 53
          Width = 315
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object edtSequenceName: TcxTextEdit
          Left = 116
          Top = 23
          Style.Shadow = False
          TabOrder = 0
          Width = 230
        end
        object lcSequenceSchema: TcxLookupComboBox
          Left = 116
          Top = 75
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsSchema
          Style.Shadow = False
          TabOrder = 1
          Width = 230
        end
        object edtStartWith: TcxMaskEdit
          Left = 116
          Top = 100
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 2
          Text = '0'
          Width = 230
        end
        object cxLabel3: TcxLabel
          Left = 20
          Top = 102
          Caption = 'Start With :'
          Transparent = True
        end
        object edtMinValue: TcxMaskEdit
          Left = 116
          Top = 124
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 4
          Text = '0'
          Width = 230
        end
        object cxLabel1: TcxLabel
          Left = 20
          Top = 126
          Caption = 'Min Value :'
          Transparent = True
        end
        object edtMaxValue: TcxMaskEdit
          Left = 116
          Top = 148
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 6
          Text = '0'
          Width = 230
        end
        object cxLabel2: TcxLabel
          Left = 20
          Top = 150
          Caption = 'Max Value :'
          Transparent = True
        end
        object edtIcrementBy: TcxMaskEdit
          Left = 116
          Top = 172
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 8
          Text = '1'
          Width = 230
        end
        object cxLabel4: TcxLabel
          Left = 20
          Top = 174
          Caption = 'Icrement By :'
          Transparent = True
        end
        object cxLabel5: TcxLabel
          Left = 20
          Top = 198
          Caption = 'Cycle :'
          Transparent = True
        end
        object edtCache: TcxMaskEdit
          Left = 116
          Top = 220
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 11
          Text = '0'
          Width = 230
        end
        object cxLabel6: TcxLabel
          Left = 20
          Top = 222
          Caption = 'Number to Cache :'
          Transparent = True
        end
        object cbCycle: TcxCheckBox
          Left = 112
          Top = 196
          TabOrder = 13
          Transparent = True
          Width = 230
        end
        object cxLabel7: TcxLabel
          Left = 20
          Top = 245
          Caption = 'Order :'
          Transparent = True
        end
        object cbOrder: TcxCheckBox
          Left = 113
          Top = 241
          TabOrder = 15
          Transparent = True
          Width = 230
        end
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 3
      DesignSize = (
        390
        303)
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
        Height = 286
        Width = 373
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 7
    Top = 334
    TabOrder = 1
    Height = 50
    Width = 394
    object btnExecute: TcxButton
      Left = 10
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 0
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnCancel: TcxButton
      Left = 90
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
  end
end
