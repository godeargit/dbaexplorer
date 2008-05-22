object FindInDBFrm: TFindInDBFrm
  Left = 264
  Top = 140
  Width = 571
  Height = 516
  Caption = 'FindInDBFrm'
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
  DesignSize = (
    563
    482)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 7
    Top = 8
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Search Options'
    TabOrder = 0
    DesignSize = (
      546
      224)
    Height = 224
    Width = 546
    object Bevel1: TBevel
      Left = 16
      Top = 54
      Width = 511
      Height = 9
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
      Style = bsRaised
    end
    object cxLabel1: TcxLabel
      Left = 15
      Top = 23
      Caption = 'Text :'
      Transparent = True
    end
    object edtSearchText: TcxMaskEdit
      Left = 55
      Top = 21
      Anchors = [akLeft, akTop, akRight]
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      TabOrder = 1
      Width = 304
    end
    object cxGroupBox2: TcxGroupBox
      Left = 260
      Top = 100
      Anchors = [akTop, akRight]
      Caption = 'Object Options'
      TabOrder = 2
      Height = 111
      Width = 273
      object chkObjectNames: TcxCheckBox
        Left = 13
        Top = 24
        Caption = 'Object Names'
        TabOrder = 0
        Width = 121
      end
      object chkColomnNames: TcxCheckBox
        Left = 13
        Top = 48
        Caption = 'Column Names'
        TabOrder = 1
        Width = 121
      end
      object chkProcedureSource: TcxCheckBox
        Left = 152
        Top = 24
        Caption = 'Procedure Source'
        TabOrder = 2
        Width = 121
      end
      object chkTriggerSource: TcxCheckBox
        Left = 152
        Top = 48
        Caption = 'Trigger Source'
        TabOrder = 3
        Width = 121
      end
      object chkViewSource: TcxCheckBox
        Left = 152
        Top = 72
        Caption = 'View Source'
        TabOrder = 4
        Width = 121
      end
    end
    object cxLabel2: TcxLabel
      Left = 254
      Top = 72
      Anchors = [akTop, akRight]
      Caption = 'Text Positions :'
    end
    object cbTextPositions: TcxComboBox
      Left = 346
      Top = 71
      Anchors = [akTop, akRight]
      Properties.Items.Strings = (
        'Text occurs anyware'
        'Start with text'
        'Exact match')
      TabOrder = 4
      Text = 'Text occurs anyware'
      Width = 183
    end
    object cxLabel3: TcxLabel
      Left = 15
      Top = 72
      Caption = 'Schema List'
    end
    object lboxSchema: TcxListBox
      Left = 14
      Top = 104
      Width = 236
      Height = 107
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 6
    end
    object btnSearch: TcxButton
      Left = 371
      Top = 20
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Search'
      TabOrder = 7
      OnClick = btnSearchClick
    end
    object btnClose: TcxButton
      Left = 451
      Top = 20
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Close'
      TabOrder = 8
      OnClick = btnCloseClick
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 7
    Top = 233
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Result'
    TabOrder = 1
    DesignSize = (
      547
      221)
    Height = 221
    Width = 547
    object gridResult: TcxGrid
      Left = 9
      Top = 16
      Width = 528
      Height = 194
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object gridResultDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsSearch
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object gridResultDBTableView1OBJECT_NAME: TcxGridDBColumn
          Caption = 'Object Name'
          DataBinding.FieldName = 'OBJECT_NAME'
          Width = 123
        end
        object gridResultDBTableView1OBJECT_TYPE: TcxGridDBColumn
          Caption = 'Object Type'
          DataBinding.FieldName = 'OBJECT_TYPE'
          Width = 114
        end
        object gridResultDBTableView1PARENT: TcxGridDBColumn
          Caption = 'Type'
          DataBinding.FieldName = 'RESULT_TYPE'
          Width = 128
        end
        object gridResultDBTableView1OWNER: TcxGridDBColumn
          Caption = 'Owner'
          DataBinding.FieldName = 'OWNER'
          Width = 128
        end
      end
      object gridResultLevel1: TcxGridLevel
        GridView = gridResultDBTableView1
      end
    end
  end
  object statusBar: TdxStatusBar
    Left = 0
    Top = 462
    Width = 563
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object qSearch: TOraQuery
    Left = 39
    Top = 305
    object qSearchOWNER: TStringField
      FieldName = 'OWNER'
      Size = 50
    end
    object qSearchOBJECT_TYPE: TStringField
      FieldName = 'OBJECT_TYPE'
      Size = 50
    end
    object qSearchRESULT_TYPE: TStringField
      FieldName = 'RESULT_TYPE'
      Size = 50
    end
    object qSearchOBJECT_NAME: TStringField
      FieldName = 'OBJECT_NAME'
      Size = 50
    end
  end
  object dsSearch: TDataSource
    DataSet = qSearch
    Left = 72
    Top = 307
  end
  object qTemp: TOraQuery
    Left = 119
    Top = 281
  end
end
