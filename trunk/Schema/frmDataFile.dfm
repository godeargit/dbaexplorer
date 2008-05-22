object DataFileFrm: TDataFileFrm
  Left = 328
  Top = 156
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'DataFileFrm'
  ClientHeight = 302
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox3: TcxGroupBox
    Left = 7
    Top = 243
    TabOrder = 0
    Height = 48
    Width = 417
    object btnOk: TcxButton
      Left = 10
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
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
  object cxGroupBox2: TcxGroupBox
    Left = 9
    Top = 5
    TabOrder = 1
    DesignSize = (
      413
      234)
    Height = 234
    Width = 413
    object Bevel1: TBevel
      Left = 16
      Top = 54
      Width = 378
      Height = 9
      Shape = bsTopLine
      Style = bsRaised
    end
    object cxLabel1: TcxLabel
      Left = 15
      Top = 23
      Caption = 'Name :'
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 57
      Top = 65
      Caption = 'File Size :'
      Transparent = True
    end
    object chkReuse: TcxCheckBox
      Left = 264
      Top = 63
      Caption = 'Resuse'
      Properties.ReadOnly = False
      TabOrder = 2
      Transparent = True
      Width = 121
    end
    object edtFileSize: TcxButtonEdit
      Left = 111
      Top = 64
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
      TabOrder = 1
      Text = '0'
      Width = 121
    end
    object edtFileName: TcxMaskEdit
      Left = 55
      Top = 21
      Anchors = [akLeft, akTop, akRight]
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      TabOrder = 0
      Width = 339
    end
    object cxGroupBox1: TcxGroupBox
      Left = 16
      Top = 96
      TabOrder = 5
      DesignSize = (
        377
        119)
      Height = 119
      Width = 377
      object cxLabel3: TcxLabel
        Left = 16
        Top = 32
        Caption = 'Next Size :'
      end
      object edtNextSize: TcxButtonEdit
        Left = 96
        Top = 31
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
        TabOrder = 1
        Text = '0'
        Width = 214
      end
      object chkUnlimitedSize: TcxCheckBox
        Left = 93
        Top = 55
        Caption = 'Unlimited Maximum Size'
        Properties.ReadOnly = False
        TabOrder = 2
        Transparent = True
        Width = 169
      end
      object cxLabel4: TcxLabel
        Left = 16
        Top = 80
        Caption = 'Maximum Size :'
      end
      object edtMaxSize: TcxButtonEdit
        Left = 96
        Top = 79
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
        Width = 217
      end
      object chkAutoExtend: TcxCheckBox
        Left = 7
        Top = -4
        Caption = 'Auto extend property'
        Properties.ReadOnly = False
        Properties.OnChange = chkAutoExtendPropertiesChange
        TabOrder = 5
        Width = 131
      end
    end
  end
end
