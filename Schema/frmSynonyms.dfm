object SynonymsFrm: TSynonymsFrm
  Left = 278
  Top = 207
  Width = 451
  Height = 448
  BorderIcons = [biSystemMenu]
  Caption = 'SynonymsFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    443
    414)
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 8
    Top = 8
    Width = 425
    Height = 343
    ActivePage = tsSynonym
    Anchors = [akLeft, akTop, akRight, akBottom]
    ShowFrame = True
    Style = 9
    TabOrder = 0
    TabWidth = 80
    OnPageChanging = pcPageChanging
    ClientRectBottom = 342
    ClientRectLeft = 1
    ClientRectRight = 424
    ClientRectTop = 20
    object tsSynonym: TcxTabSheet
      Caption = 'Synonym'
      ImageIndex = 0
      DesignSize = (
        423
        322)
      object cxGroupBox2: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          405
          305)
        Height = 305
        Width = 405
        object Label2: TLabel
          Left = 12
          Top = 25
          Width = 34
          Height = 13
          Caption = 'Name :'
          Transparent = True
        end
        object Label14: TLabel
          Left = 12
          Top = 128
          Width = 37
          Height = 13
          Caption = 'Owner :'
          Transparent = True
        end
        object Label1: TLabel
          Left = 12
          Top = 152
          Width = 30
          Height = 13
          Caption = 'Type :'
          Transparent = True
        end
        object Label3: TLabel
          Left = 12
          Top = 195
          Width = 37
          Height = 13
          Caption = 'Object :'
          Transparent = True
        end
        object Label4: TLabel
          Left = 12
          Top = 103
          Width = 44
          Height = 13
          Caption = 'DB Link :'
          Transparent = True
        end
        object Label5: TLabel
          Left = 12
          Top = 80
          Width = 53
          Height = 13
          Caption = 'Link Type :'
          Transparent = True
        end
        object Bevel2: TBevel
          Left = 12
          Top = 52
          Width = 380
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object edtName: TcxTextEdit
          Left = 84
          Top = 21
          Anchors = [akLeft, akTop, akRight]
          Style.Shadow = False
          TabOrder = 0
          Width = 307
        end
        object lcObjectSchema: TcxLookupComboBox
          Left = 84
          Top = 125
          Anchors = [akLeft, akTop, akRight]
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsSchema
          Properties.OnEditValueChanged = icbTypePropertiesEditValueChanged
          TabOrder = 1
          Width = 307
        end
        object icbType: TcxImageComboBox
          Left = 84
          Top = 149
          Anchors = [akLeft, akTop, akRight]
          Properties.Items = <
            item
              Description = 'Table'
              ImageIndex = 0
              Value = 'Table'
            end
            item
              Description = 'View'
              Value = 'View'
            end
            item
              Description = 'Function'
              Value = 'Function'
            end
            item
              Description = 'Java Class'
              Value = 'Java Class'
            end
            item
              Description = 'Package'
              Value = 'Package'
            end
            item
              Description = 'Procedure'
              Value = 'Procedure'
            end
            item
              Description = 'Sequence'
              Value = 'Sequence'
            end
            item
              Description = 'Materialized View'
              Value = 'Materialized View'
            end
            item
              Description = 'Synonym'
              Value = 'Synonym'
            end>
          Properties.OnEditValueChanged = icbTypePropertiesEditValueChanged
          TabOrder = 2
          Width = 307
        end
        object lbObject: TcxListBox
          Left = 84
          Top = 194
          Width = 307
          Height = 98
          Anchors = [akLeft, akTop, akRight, akBottom]
          ItemHeight = 13
          TabOrder = 3
        end
        object edtDBLink: TcxTextEdit
          Left = 84
          Top = 101
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          Style.Shadow = False
          TabOrder = 4
          Width = 307
        end
        object cbPublic: TcxCheckBox
          Left = 9
          Top = 171
          Caption = 'Make Public :'
          Properties.Alignment = taRightJustify
          TabOrder = 5
          Transparent = True
          Width = 92
        end
        object cbDBLink: TcxComboBox
          Left = 84
          Top = 77
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'Local'
            'Remote')
          TabOrder = 6
          Text = 'Local'
          OnClick = cbDBLinkClick
          Width = 307
        end
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 1
      DesignSize = (
        423
        322)
      object redtDDL: TcxRichEdit
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Properties.ScrollBars = ssBoth
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -12
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 306
        Width = 407
      end
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 6
    Top = 358
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Height = 48
    Width = 430
    object btnCancel: TcxButton
      Left = 89
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnExecute: TcxButton
      Left = 9
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 1
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object ds: TDataSource
    Left = 24
    Top = 280
  end
  object query: TOraQuery
    Left = 24
    Top = 248
  end
end
