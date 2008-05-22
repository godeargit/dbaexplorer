object TableIndexPartitionFrm: TTableIndexPartitionFrm
  Left = 369
  Top = 179
  BorderStyle = bsDialog
  Caption = 'TableIndexPartitionFrm'
  ClientHeight = 402
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    550
    402)
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TcxPageControl
    Left = 8
    Top = 8
    Width = 530
    Height = 331
    ActivePage = tsGeneral
    Anchors = [akLeft, akTop, akRight, akBottom]
    ShowFrame = True
    Style = 9
    TabOrder = 0
    ClientRectBottom = 330
    ClientRectLeft = 1
    ClientRectRight = 529
    ClientRectTop = 20
    object tsGeneral: TcxTabSheet
      Caption = 'General'
      ImageIndex = 0
      DesignSize = (
        528
        310)
      object cxGroupBox2: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          509
          291)
        Height = 291
        Width = 509
        object Label2: TLabel
          Left = 13
          Top = 21
          Width = 77
          Height = 13
          Caption = 'Partition Name :'
          Transparent = True
        end
        object Bevel1: TBevel
          Left = 12
          Top = 46
          Width = 481
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          Style = bsRaised
        end
        object edtPartitionName: TcxTextEdit
          Left = 102
          Top = 17
          Anchors = [akLeft, akTop, akRight]
          Style.Shadow = False
          TabOrder = 0
          Width = 392
        end
        object cxGrid1: TcxGrid
          Left = 12
          Top = 61
          Width = 482
          Height = 218
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          LookAndFeel.Kind = lfOffice11
          object cxGrid1DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsPartitionColumns
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object cxGrid1DBTableView1COLUMN_NAME: TcxGridDBColumn
              Caption = 'Column Name'
              DataBinding.FieldName = 'COLUMN_NAME'
              Options.Editing = False
              Width = 129
            end
            object cxGrid1DBTableView1DATA_TYPE: TcxGridDBColumn
              Caption = 'Data Type'
              DataBinding.FieldName = 'DATA_TYPE'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <>
              Options.Editing = False
              Width = 108
            end
            object cxGrid1DBTableView1UPPER_BOUND: TcxGridDBColumn
              Caption = 'Upper Bound'
              DataBinding.FieldName = 'UPPER_BOUND'
              Width = 217
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
    end
    object tsStorage: TcxTabSheet
      Caption = 'Storage'
      ImageIndex = 1
      DesignSize = (
        528
        310)
      object cxGroupBox3: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Transparent = True
        DesignSize = (
          511
          293)
        Height = 293
        Width = 511
        object Label7: TLabel
          Left = 30
          Top = 21
          Width = 69
          Height = 13
          Caption = 'Percent Free :'
          Transparent = True
        end
        object Label8: TLabel
          Left = 30
          Top = 45
          Width = 71
          Height = 13
          Caption = 'Percent Used :'
          Transparent = True
        end
        object Label9: TLabel
          Left = 268
          Top = 21
          Width = 63
          Height = 13
          Caption = 'Initial Trans :'
          Transparent = True
        end
        object Label10: TLabel
          Left = 268
          Top = 45
          Width = 57
          Height = 13
          Caption = 'Max Trans :'
          Transparent = True
        end
        object Label15: TLabel
          Left = 30
          Top = 69
          Width = 61
          Height = 13
          Caption = 'Tablespace :'
          Transparent = True
        end
        object Label17: TLabel
          Left = 268
          Top = 70
          Width = 44
          Height = 13
          Caption = 'Logging :'
          Transparent = True
        end
        object edtPercentFree: TcxMaskEdit
          Left = 106
          Top = 18
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 0
          Text = '0'
          Width = 118
        end
        object edtPercentUsed: TcxMaskEdit
          Left = 106
          Top = 42
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 1
          Text = '0'
          Width = 118
        end
        object edtInitialTrans: TcxMaskEdit
          Tag = 2
          Left = 342
          Top = 18
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 2
          Text = '0'
          Width = 121
        end
        object edtMaxTrans: TcxMaskEdit
          Left = 342
          Top = 42
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          TabOrder = 3
          Text = '0'
          Width = 121
        end
        object cxGroupBox4: TcxGroupBox
          Left = 12
          Top = 104
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Storage Clause'
          TabOrder = 4
          Transparent = True
          Height = 119
          Width = 487
          object Label11: TLabel
            Left = 20
            Top = 21
            Width = 70
            Height = 13
            Caption = 'Initial Extend :'
            Transparent = True
          end
          object Label12: TLabel
            Left = 20
            Top = 42
            Width = 67
            Height = 13
            Caption = 'Next Extend :'
            Transparent = True
          end
          object Label13: TLabel
            Left = 254
            Top = 21
            Width = 63
            Height = 13
            Caption = 'Min Extents :'
            Transparent = True
          end
          object Label14: TLabel
            Left = 254
            Top = 43
            Width = 67
            Height = 13
            Caption = 'Max Extents :'
            Transparent = True
          end
          object Label29: TLabel
            Left = 20
            Top = 64
            Width = 67
            Height = 13
            Caption = 'Pct Increase :'
            Transparent = True
          end
          object Label30: TLabel
            Left = 254
            Top = 65
            Width = 48
            Height = 13
            Caption = 'Free List :'
            Transparent = True
          end
          object Label31: TLabel
            Left = 254
            Top = 88
            Width = 66
            Height = 13
            Caption = 'Free Groups :'
            Transparent = True
          end
          object Label32: TLabel
            Left = 20
            Top = 86
            Width = 60
            Height = 13
            Caption = 'Buffer Pool :'
            Transparent = True
          end
          object edtInitialExtend: TcxMaskEdit
            Left = 98
            Top = 18
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 0
            Text = '0'
            Width = 120
          end
          object edtNextExtend: TcxMaskEdit
            Left = 98
            Top = 40
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 1
            Text = '0'
            Width = 120
          end
          object edtMinExtents: TcxMaskEdit
            Left = 331
            Top = 18
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 2
            Text = '0'
            Width = 119
          end
          object edtMaxExtents: TcxMaskEdit
            Left = 331
            Top = 40
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 3
            Text = '0'
            Width = 119
          end
          object edtPctIncrease: TcxMaskEdit
            Left = 98
            Top = 62
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 4
            Text = '0'
            Width = 120
          end
          object edtFreeList: TcxMaskEdit
            Left = 331
            Top = 62
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 5
            Text = '0'
            Width = 119
          end
          object edtFreeGroup: TcxMaskEdit
            Left = 331
            Top = 84
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d+'
            Properties.MaxLength = 0
            TabOrder = 6
            Text = '0'
            Width = 119
          end
          object cbBufferPool: TcxImageComboBox
            Left = 98
            Top = 84
            EditValue = 'Default'
            Properties.Items = <
              item
                Description = 'Default'
                Value = 'Default'
              end
              item
                Description = 'Recycle'
                Value = 'Recycle'
              end
              item
                Description = 'Keep'
                Value = 'Keep'
              end>
            TabOrder = 7
            Width = 121
          end
        end
        object lcTablespace: TcxLookupComboBox
          Left = 106
          Top = 66
          Properties.KeyFieldNames = 'TABLESPACE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'TABLESPACE_NAME'
            end>
          Properties.ListSource = dmGenel.dsTablespace
          TabOrder = 5
          Width = 119
        end
        object cbLogging: TcxImageComboBox
          Left = 342
          Top = 66
          EditValue = 'Default'
          Properties.Items = <
            item
              Description = 'Default'
              ImageIndex = 0
              Value = 'Default'
            end
            item
              Description = 'Logging'
              ImageIndex = 0
              Value = 'Logging'
            end
            item
              Description = 'No Logging'
              Value = 'No Logging'
            end>
          Style.Shadow = False
          TabOrder = 6
          Width = 120
        end
      end
    end
    object tsHashSubpartition: TcxTabSheet
      Caption = 'Hash Subpartition'
      ImageIndex = 2
      DesignSize = (
        528
        310)
      object Label20: TLabel
        Left = 230
        Top = 277
        Width = 49
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Quantity :'
        Transparent = True
      end
      object cxGrid2: TcxGrid
        Left = 8
        Top = 8
        Width = 510
        Height = 246
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object cxGridDBTableView6: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsHashPartition
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.DeletingConfirmation = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGridDBTableView6PARTITION_NAME: TcxGridDBColumn
            Caption = 'Partition Name'
            DataBinding.FieldName = 'PARTITION_NAME'
            Width = 167
          end
          object cxGridDBTableView6TABLESPACE_NAME: TcxGridDBColumn
            Caption = 'Tablespace Name'
            DataBinding.FieldName = 'TABLESPACE_NAME'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'TABLESPACE_NAME'
            Properties.ListColumns = <
              item
                FieldName = 'TABLESPACE_NAME'
              end>
            Properties.ListSource = dmGenel.dsTablespace
            Width = 216
          end
        end
        object cxGridLevel6: TcxGridLevel
          GridView = cxGridDBTableView6
        end
      end
      object rgroupHashPartitionType: TcxRadioGroup
        Left = 9
        Top = 262
        Anchors = [akLeft, akBottom]
        Properties.Columns = 2
        Properties.Items = <
          item
            Caption = 'User Named'
          end
          item
            Caption = 'System Named'
          end>
        ItemIndex = 0
        TabOrder = 1
        Transparent = True
        Height = 39
        Width = 211
      end
      object edtHashQuantity: TcxSpinEdit
        Left = 280
        Top = 273
        Anchors = [akLeft, akBottom]
        Properties.MaxValue = 100.000000000000000000
        Properties.MinValue = 1.000000000000000000
        TabOrder = 2
        Value = 1
        Width = 54
      end
      object btnHashAdd: TcxButton
        Left = 342
        Top = 269
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Add'
        TabOrder = 3
        OnClick = btnHashAddClick
        LookAndFeel.Kind = lfOffice11
      end
      object btnHashDelete: TcxButton
        Left = 422
        Top = 268
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Delete'
        TabOrder = 4
        OnClick = btnHashDeleteClick
        LookAndFeel.Kind = lfOffice11
      end
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 7
    Top = 346
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Height = 48
    Width = 534
    object btnOk: TcxButton
      Left = 10
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnCancel: TcxButton
      Left = 90
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object qPartitionColumns: TVirtualTable
    FieldDefs = <
      item
        Name = 'COLUMN_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATA_TYPE'
        DataType = ftString
        Size = 106
      end
      item
        Name = 'UPPER_BOUND'
        DataType = ftString
        Size = 500
      end>
    Left = 187
    Top = 141
    Data = {
      010003000B00434F4C554D4E5F4E414D4501001E000900444154415F54595045
      01006A000B0055505045525F424F554E440100F401000000000000}
    object qPartitionColumnsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 30
    end
    object qPartitionColumnsDATA_TYPE: TStringField
      FieldName = 'DATA_TYPE'
      Size = 106
    end
    object qPartitionColumnsUPPER_BOUND: TStringField
      FieldName = 'UPPER_BOUND'
      Size = 500
    end
  end
  object dsPartitionColumns: TDataSource
    DataSet = qPartitionColumns
    Left = 153
    Top = 141
  end
  object qHashPartition: TVirtualTable
    Left = 187
    Top = 181
    Data = {01000000000000000000}
    object StringField7: TStringField
      FieldName = 'PARTITION_NAME'
      Size = 30
    end
    object StringField8: TStringField
      FieldName = 'TABLESPACE_NAME'
      Size = 30
    end
  end
  object dsHashPartition: TDataSource
    DataSet = qHashPartition
    Left = 153
    Top = 181
  end
end
