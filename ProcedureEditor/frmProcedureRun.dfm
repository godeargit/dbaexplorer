object ProcedureRunFrm: TProcedureRunFrm
  Left = 347
  Top = 165
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Procedure Run'
  ClientHeight = 461
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 420
    Width = 540
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object btnExecute: TcxButton
      Left = 10
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 0
      OnClick = btnExecuteClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnCancel: TcxButton
      Left = 90
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 153
    Width = 540
    Height = 267
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object edtSQL: TcxRichEdit
      Left = 0
      Top = 0
      Align = alClient
      ParentFont = False
      Style.Font.Charset = TURKISH_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Courier New'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Height = 267
      Width = 540
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 145
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 540
      Height = 145
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object gridDBParams: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        FilterBox.CustomizeDialog = False
        OnEditValueChanged = gridDBParamsEditValueChanged
        DataController.DataSource = dsParams
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object gridDBParamsNAME: TcxGridDBColumn
          Caption = 'Parameter Name'
          DataBinding.FieldName = 'argument_name'
          Options.Editing = False
          Options.Filtering = False
          Width = 107
        end
        object gridDBParamsDATA_TYPE: TcxGridDBColumn
          Caption = 'Data Type'
          DataBinding.FieldName = 'DATA_TYPE'
          Options.Editing = False
          Options.Filtering = False
          Width = 121
        end
        object gridDBParamsColumn1: TcxGridDBColumn
          Caption = 'Size'
          DataBinding.FieldName = 'DATA_SIZE'
          Options.Editing = False
          Options.Filtering = False
          Width = 57
        end
        object gridDBParamsMODE: TcxGridDBColumn
          Caption = 'Mode'
          DataBinding.FieldName = 'in_out'
          Options.Editing = False
          Options.Filtering = False
          Width = 39
        end
        object gridDBParamsVALUE: TcxGridDBColumn
          Caption = 'Value'
          DataBinding.FieldName = 'VALUE'
          Options.Filtering = False
          Width = 202
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = gridDBParams
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 145
    Width = 540
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salTop
    Control = Panel3
  end
  object vtParams: TVirtualTable
    Left = 16
    Top = 144
    Data = {01000000000000000000}
    object vtParamsobject_name: TStringField
      FieldName = 'object_name'
      Size = 100
    end
    object vtParamssequence: TIntegerField
      FieldName = 'sequence'
    end
    object vtParamsargument_name: TStringField
      FieldName = 'argument_name'
      Size = 100
    end
    object vtParamsDATA_SIZE: TStringField
      FieldName = 'DATA_SIZE'
      Size = 50
    end
    object vtParamsdata_type: TStringField
      FieldName = 'data_type'
      Size = 50
    end
    object vtParamsin_out: TStringField
      FieldName = 'in_out'
      Size = 10
    end
    object vtParamsVALUE: TStringField
      FieldName = 'VALUE'
      Size = 50
    end
  end
  object dsParams: TDataSource
    DataSet = vtParams
    Left = 48
    Top = 144
  end
end
