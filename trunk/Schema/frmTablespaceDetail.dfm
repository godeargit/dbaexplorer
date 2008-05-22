object TablespaceDetailFrm: TTablespaceDetailFrm
  Left = 256
  Top = 118
  Width = 579
  Height = 499
  BorderIcons = [biSystemMenu]
  Caption = 'TablespaceDetailFrm'
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    571
    465)
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 8
    Top = 8
    Width = 553
    Height = 400
    ActivePage = tsTablespace
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    TabWidth = 100
    OnPageChanging = pcPageChanging
    ClientRectBottom = 399
    ClientRectLeft = 1
    ClientRectRight = 552
    ClientRectTop = 20
    object tsTablespace: TcxTabSheet
      Caption = 'Tablespace'
      ImageIndex = 8
      DesignSize = (
        551
        379)
      object cxGroupBox2: TcxGroupBox
        Left = 9
        Top = 4
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          531
          363)
        Height = 363
        Width = 531
        object Bevel1: TBevel
          Left = 24
          Top = 54
          Width = 478
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object Label11: TcxLabel
          Left = 23
          Top = 122
          Caption = 'Initial Extend :'
          Transparent = True
        end
        object Label12: TcxLabel
          Left = 23
          Top = 146
          Caption = 'Next Extend :'
          Transparent = True
        end
        object Label13: TcxLabel
          Left = 268
          Top = 96
          Anchors = [akTop, akRight]
          Caption = 'Min Extents :'
          Transparent = True
        end
        object Label14: TcxLabel
          Left = 268
          Top = 120
          Anchors = [akTop, akRight]
          Caption = 'Max Extents :'
          Transparent = True
        end
        object Label1: TcxLabel
          Left = 23
          Top = 171
          Caption = 'Pct Increase :'
          Transparent = True
        end
        object Label2: TcxLabel
          Left = 23
          Top = 195
          Caption = 'Status :'
          Transparent = True
        end
        object Label3: TcxLabel
          Left = 23
          Top = 75
          Caption = 'Contents :'
          Transparent = True
        end
        object Label4: TcxLabel
          Left = 23
          Top = 220
          Caption = 'Logging :'
          Transparent = True
        end
        object Label5: TcxLabel
          Left = 268
          Top = 171
          Anchors = [akTop, akRight]
          Caption = 'Extent Management :'
          Transparent = True
        end
        object Label6: TcxLabel
          Left = 268
          Top = 195
          Anchors = [akTop, akRight]
          Caption = 'Allocation Type :'
          Transparent = True
        end
        object Label7: TcxLabel
          Left = 268
          Top = 220
          Anchors = [akTop, akRight]
          Caption = 'Retention :'
          Transparent = True
        end
        object Label8: TcxLabel
          Left = 268
          Top = 144
          Anchors = [akTop, akRight]
          Caption = 'Min Extent Size :'
          Transparent = True
        end
        object cxLabel1: TcxLabel
          Left = 23
          Top = 22
          Caption = 'Name :'
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 23
          Top = 98
          Caption = 'Block Size :'
          Transparent = True
        end
        object edtInitialExtend: TcxButtonEdit
          Left = 104
          Top = 120
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          TabOrder = 4
          Text = '0'
          Width = 124
        end
        object edtNextExtend: TcxButtonEdit
          Left = 104
          Top = 144
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          TabOrder = 6
          Text = '0'
          Width = 124
        end
        object edtMinExtents: TcxSpinEdit
          Left = 374
          Top = 96
          Anchors = [akTop, akRight]
          Properties.ReadOnly = False
          TabOrder = 3
          Width = 130
        end
        object edtMaxExtents: TcxSpinEdit
          Left = 374
          Top = 120
          Anchors = [akTop, akRight]
          Properties.ReadOnly = False
          TabOrder = 5
          Width = 129
        end
        object edtPctIncrease: TcxButtonEdit
          Left = 104
          Top = 168
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          TabOrder = 8
          Text = '0'
          Width = 124
        end
        object icbStatus: TcxImageComboBox
          Left = 104
          Top = 192
          Anchors = [akLeft, akTop, akRight]
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
          Properties.ReadOnly = False
          TabOrder = 10
          Width = 124
        end
        object icbContents: TcxImageComboBox
          Left = 104
          Top = 72
          Anchors = [akLeft, akTop, akRight]
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
          Properties.ReadOnly = False
          TabOrder = 1
          Width = 124
        end
        object icbLogging: TcxImageComboBox
          Left = 104
          Top = 216
          Anchors = [akLeft, akTop, akRight]
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
          Properties.ReadOnly = False
          TabOrder = 12
          Width = 124
        end
        object cbForceLogging: TcxCheckBox
          Left = 21
          Top = 276
          Caption = 'Force Logging'
          Properties.ReadOnly = False
          TabOrder = 15
          Transparent = True
          Width = 121
        end
        object icbExtentManagement: TcxImageComboBox
          Left = 374
          Top = 168
          Anchors = [akTop, akRight]
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
          Properties.ReadOnly = False
          TabOrder = 9
          Width = 129
        end
        object icbRetention: TcxImageComboBox
          Left = 374
          Top = 216
          Anchors = [akTop, akRight]
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
          Properties.ReadOnly = False
          TabOrder = 13
          Width = 129
        end
        object cbBigFile: TcxCheckBox
          Left = 21
          Top = 300
          Caption = 'Big File'
          Properties.ReadOnly = False
          TabOrder = 16
          Transparent = True
          Width = 209
        end
        object edtMinExtlen: TcxSpinEdit
          Left = 374
          Top = 144
          Anchors = [akTop, akRight]
          Properties.ReadOnly = False
          TabOrder = 7
          Width = 129
        end
        object edtBlockSize: TcxButtonEdit
          Left = 104
          Top = 96
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          TabOrder = 2
          Text = '0'
          Width = 124
        end
        object icbSgmentSpaceManagement: TcxImageComboBox
          Left = 211
          Top = 250
          Anchors = [akLeft, akTop, akRight]
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
          Properties.ReadOnly = False
          TabOrder = 14
          Width = 131
        end
        object cxLabel3: TcxLabel
          Left = 22
          Top = 251
          Caption = 'Auto Segment Space Management :'
          Transparent = True
        end
        object cbCompress: TcxCheckBox
          Left = 21
          Top = 324
          Caption = 'Compress'
          Properties.ReadOnly = False
          TabOrder = 17
          Transparent = True
          Width = 209
        end
        object icbAllocationType: TcxImageComboBox
          Left = 374
          Top = 192
          Anchors = [akTop, akRight]
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
          Properties.ReadOnly = False
          TabOrder = 11
          Width = 129
        end
        object edtName: TcxMaskEdit
          Left = 103
          Top = 21
          Anchors = [akLeft, akTop, akRight]
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '[a-zA-Z0-9_]+'
          Properties.MaxLength = 0
          TabOrder = 0
          Width = 404
        end
      end
    end
    object tsDataFile: TcxTabSheet
      Caption = 'Data Files'
      ImageIndex = 2
      DesignSize = (
        551
        379)
      object gridDataFile: TcxGrid
        Left = 8
        Top = 8
        Width = 530
        Height = 330
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object gridDataFileDB: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsDataFile
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.GroupByBox = False
          object gridDataFileDBNAME: TcxGridDBColumn
            DataBinding.FieldName = 'NAME'
            Width = 181
          end
          object gridDataFileDBSIZE: TcxGridDBColumn
            DataBinding.FieldName = 'SIZE'
          end
          object gridDataFileDBUNITS: TcxGridDBColumn
            DataBinding.FieldName = 'UNITS'
            Width = 38
          end
          object gridDataFileDBREUSE: TcxGridDBColumn
            DataBinding.FieldName = 'REUSE'
            Width = 59
          end
          object gridDataFileDBAUTOEXTEND: TcxGridDBColumn
            DataBinding.FieldName = 'AUTOEXTEND'
            Width = 96
          end
          object gridDataFileDBNEXT: TcxGridDBColumn
            DataBinding.FieldName = 'NEXT'
          end
          object gridDataFileDBNEXT_UNIT: TcxGridDBColumn
            DataBinding.FieldName = 'NEXT_UNIT'
            Width = 66
          end
          object gridDataFileDBMAX_UNLIMITED: TcxGridDBColumn
            DataBinding.FieldName = 'MAX_UNLIMITED'
          end
          object gridDataFileDBMAX_SIZE: TcxGridDBColumn
            DataBinding.FieldName = 'MAX_SIZE'
          end
          object gridDataFileDBMAX_UNIT: TcxGridDBColumn
            DataBinding.FieldName = 'MAX_UNIT'
            Width = 60
          end
        end
        object gridDataFileLevel1: TcxGridLevel
          GridView = gridDataFileDB
        end
      end
      object btnAddDataFile: TcxButton
        Left = 8
        Top = 345
        Width = 85
        Height = 25
        Anchors = [akLeft]
        Caption = 'Add DataFile...'
        TabOrder = 1
        OnClick = btnAddDataFileClick
      end
      object btnEditDataFile: TcxButton
        Left = 104
        Top = 344
        Width = 85
        Height = 25
        Anchors = [akLeft]
        Caption = 'Edit DataFile...'
        TabOrder = 2
        OnClick = btnEditDataFileClick
      end
      object btnDeleteDataFile: TcxButton
        Left = 200
        Top = 344
        Width = 85
        Height = 25
        Anchors = [akLeft]
        Caption = 'Delete DataFile'
        TabOrder = 3
        OnClick = btnDeleteDataFileClick
      end
    end
    object tsDDL: TcxTabSheet
      Caption = 'DDL'
      ImageIndex = 5
      object redtDDL: TcxRichEdit
        Left = 7
        Top = 6
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -13
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 364
        Width = 537
      end
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 8
    Top = 411
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Height = 48
    Width = 553
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
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object vtDataFile: TVirtualTable
    AfterScroll = vtDataFileAfterScroll
    FieldDefs = <
      item
        Name = 'NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'SIZE'
        DataType = ftFloat
      end
      item
        Name = 'UNITS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'REUSE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AUTOEXTEND'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NEXT'
        DataType = ftFloat
      end
      item
        Name = 'NEXT_UNIT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MAX_UNLIMITED'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MAX_SIZE'
        DataType = ftFloat
      end
      item
        Name = 'MAX_UNIT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECORD_STATUS'
        DataType = ftString
        Size = 20
      end>
    Left = 32
    Top = 196
    Data = {
      01000B0004004E414D4501006400040053495A45060000000500554E49545301
      00140005005245555345010014000A004155544F455854454E44010014000400
      4E4558540600000009004E4558545F554E4954010014000D004D41585F554E4C
      494D495445440100140008004D41585F53495A450600000008004D41585F554E
      4954010014000D005245434F52445F53544154555301001400000000000000}
    object vtDataFileNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object vtDataFileSIZE: TFloatField
      FieldName = 'SIZE'
    end
    object vtDataFileUNITS: TStringField
      FieldName = 'UNITS'
    end
    object vtDataFileREUSE: TStringField
      FieldName = 'REUSE'
    end
    object vtDataFileAUTOEXTEND: TStringField
      FieldName = 'AUTOEXTEND'
    end
    object vtDataFileNEXT: TFloatField
      FieldName = 'NEXT'
    end
    object vtDataFileNEXT_UNIT: TStringField
      FieldName = 'NEXT_UNIT'
    end
    object vtDataFileMAX_UNLIMITED: TStringField
      FieldName = 'MAX_UNLIMITED'
    end
    object vtDataFileMAX_SIZE: TFloatField
      FieldName = 'MAX_SIZE'
    end
    object vtDataFileMAX_UNIT: TStringField
      FieldName = 'MAX_UNIT'
    end
    object vtDataFileRECORD_STATUS: TStringField
      FieldName = 'RECORD_STATUS'
    end
  end
  object dsDataFile: TDataSource
    DataSet = vtDataFile
    Left = 32
    Top = 228
  end
end
