object ViewDetailFrm: TViewDetailFrm
  Left = 380
  Top = 96
  Width = 572
  Height = 546
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'View Detail'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  DesignSize = (
    564
    512)
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 8
    Top = 5
    Width = 547
    Height = 441
    ActivePage = tsView
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    LookAndFeel.NativeStyle = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    TabWidth = 80
    OnPageChanging = pcPageChanging
    ClientRectBottom = 440
    ClientRectLeft = 1
    ClientRectRight = 546
    ClientRectTop = 20
    object tsView: TcxTabSheet
      Caption = 'View'
      ImageIndex = 0
      DesignSize = (
        545
        420)
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          527
          400)
        Height = 400
        Width = 527
        object Label2: TLabel
          Left = 10
          Top = 20
          Width = 34
          Height = 13
          Caption = 'Name :'
          Transparent = True
        end
        object Label1: TLabel
          Left = 267
          Top = 19
          Width = 45
          Height = 13
          Caption = 'Schema :'
          Transparent = True
        end
        object Bevel1: TBevel
          Left = 11
          Top = 46
          Width = 499
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object lcViewSchema: TcxLookupComboBox
          Left = 322
          Top = 15
          Anchors = [akLeft, akTop, akRight]
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsSchema
          Style.Shadow = False
          TabOrder = 0
          Width = 192
        end
        object edtSQLQuery: TcxRichEdit
          Left = 11
          Top = 79
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Style.Font.Charset = TURKISH_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -13
          Style.Font.Name = 'Courier New'
          Style.Font.Style = []
          Style.Shadow = False
          Style.IsFontAssigned = True
          TabOrder = 1
          Height = 308
          Width = 504
        end
        object cxLabel3: TcxLabel
          Left = 8
          Top = 56
          Caption = 'SQL Query'
          Transparent = True
        end
        object edtViewName: TcxMaskEdit
          Left = 49
          Top = 15
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '[a-zA-Z0-9_]+'
          Properties.MaxLength = 0
          TabOrder = 3
          Width = 210
        end
      end
    end
    object tsDetail: TcxTabSheet
      Caption = 'Detail'
      ImageIndex = 1
      object cxGroupBox3: TcxGroupBox
        Left = 8
        Top = 8
        TabOrder = 0
        Transparent = True
        DesignSize = (
          529
          401)
        Height = 401
        Width = 529
        object Bevel2: TBevel
          Left = 11
          Top = 104
          Width = 499
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object rgroupWith: TcxRadioGroup
          Left = 11
          Top = 29
          Enabled = False
          Properties.Items = <
            item
              Caption = 'Read Only'
            end
            item
              Caption = 'Check Option'
            end>
          ItemIndex = 0
          TabOrder = 0
          Transparent = True
          Height = 63
          Width = 145
        end
        object cbRestrictQuery: TcxCheckBox
          Left = 8
          Top = 11
          Caption = 'Restrict Query'
          Properties.OnChange = cbRestrictQueryPropertiesChange
          TabOrder = 1
          Transparent = True
          Width = 121
        end
        object edtCheckOption: TcxTextEdit
          Left = 184
          Top = 39
          TabOrder = 2
          Width = 329
        end
        object cxLabel1: TcxLabel
          Left = 184
          Top = 18
          Caption = 'Check Constraint Name'
          Transparent = True
        end
        object cbForceOnCreate: TcxCheckBox
          Left = 186
          Top = 67
          Caption = 'Force on create'
          TabOrder = 4
          Transparent = True
          Width = 121
        end
        object cxLabel2: TcxLabel
          Left = 12
          Top = 115
          Caption = 'View Comment'
          Transparent = True
        end
        object edtComment: TcxRichEdit
          Left = 11
          Top = 136
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Properties.ScrollBars = ssBoth
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -13
          Style.Font.Name = 'Courier New'
          Style.Font.Style = []
          Style.Shadow = False
          Style.IsFontAssigned = True
          TabOrder = 6
          Height = 254
          Width = 507
        end
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 3
      DesignSize = (
        545
        420)
      object redtDDL: TcxRichEdit
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 403
        Width = 529
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 453
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Height = 47
    Width = 548
    object btnCancel: TcxButton
      Left = 90
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
    end
    object btnExecute: TcxButton
      Left = 10
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 1
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
  end
end
