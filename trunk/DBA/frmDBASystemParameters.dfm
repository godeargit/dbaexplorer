object DBASystemParametersFrm: TDBASystemParametersFrm
  Left = 389
  Top = 172
  Width = 492
  Height = 299
  BorderIcons = [biSystemMenu]
  Caption = 'DBASystemParametersFrm'
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 224
    Width = 484
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object btnOK: TcxButton
      Left = 10
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
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
  object pc: TcxPageControl
    Left = 0
    Top = 0
    Width = 484
    Height = 224
    ActivePage = tsParameters
    Align = alClient
    TabOrder = 1
    ClientRectBottom = 224
    ClientRectRight = 484
    ClientRectTop = 0
    object tsParameters: TcxTabSheet
      Caption = 'tsParameters'
      ImageIndex = 0
      TabVisible = False
      DesignSize = (
        484
        224)
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Value'
        TabOrder = 0
        Transparent = True
        DesignSize = (
          465
          137)
        Height = 137
        Width = 465
        object Label1: TLabel
          Left = 16
          Top = 17
          Width = 81
          Height = 13
          Caption = 'Current Setting :'
          Transparent = True
        end
        object Label2: TLabel
          Left = 32
          Top = 61
          Width = 65
          Height = 13
          Caption = 'New Setting :'
          Transparent = True
        end
        object Label3: TLabel
          Left = 45
          Top = 106
          Width = 52
          Height = 13
          Caption = 'Comment :'
          Transparent = True
        end
        object memCurrent: TcxMemo
          Left = 104
          Top = 16
          Anchors = [akLeft, akTop, akRight]
          Properties.ReadOnly = True
          TabOrder = 0
          Height = 41
          Width = 352
        end
        object memNew: TcxMemo
          Left = 104
          Top = 60
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Height = 41
          Width = 352
        end
        object edtComment: TcxTextEdit
          Left = 104
          Top = 104
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Width = 352
        end
      end
      object rgrpApplay: TcxRadioGroup
        Left = 208
        Top = 152
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Apply to'
        Properties.Columns = 3
        Properties.Items = <
          item
            Caption = 'Memory'
          end
          item
            Caption = 'SP File'
          end
          item
            Caption = 'Both'
          end>
        ItemIndex = 1
        TabOrder = 1
        Transparent = True
        Height = 57
        Width = 265
      end
      object cxGroupBox2: TcxGroupBox
        Left = 8
        Top = 152
        Caption = 'Scope'
        TabOrder = 2
        Transparent = True
        Height = 58
        Width = 185
        object cboxSession: TcxCheckBox
          Left = 8
          Top = 24
          Caption = 'Session'
          TabOrder = 0
          Transparent = True
          Width = 73
        end
        object cboxSystem: TcxCheckBox
          Left = 88
          Top = 24
          Caption = 'System'
          Properties.OnChange = cboxSystemPropertiesChange
          TabOrder = 1
          Transparent = True
          Width = 73
        end
      end
    end
    object tsNLSParameters: TcxTabSheet
      Caption = 'tsNLSParameters'
      ImageIndex = 1
      TabVisible = False
      DesignSize = (
        484
        224)
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 484
        Height = 224
        Align = alClient
        Picture.Data = {
          0A544A504547496D616765C5010000FFD8FFE000104A46494600010200006400
          640000FFEC00114475636B7900010004000000500000FFEE000E41646F626500
          64C000000001FFDB008400020202020202020202020302020203040302020304
          0504040404040506050505050505060607070807070609090A0A09090C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C01030303050405090606090D0B090B0D0F0E0E0E0E
          0F0F0C0C0C0C0C0F0F0C0C0C0C0C0C0F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080320000103011100021101031101FF
          C400570001010101010000000000000000000000000201030901010101000000
          0000000000000000000000010210010101010101000000000000000000000011
          015161121101010100000000000000000000000000001101FFDA000C03010002
          110311003F00F7F013F5AA2500000004FD78090000000000730005835A1CEEF5
          8180000D6A0254AE777A8A368C119458914000118220560833744DF1A58C1582
          50401375A8259004DC6DA48944A83235A1CEEF540004DF46A204AD10001CC000
          1970100000C9BD02E741000008BA0C0000019714425000197144032895A8A000
          039A8000026E744891400000000004FD683FFFD9}
        Stretch = True
      end
      object cxGroupBox3: TcxGroupBox
        Left = 8
        Top = 8
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Value'
        TabOrder = 0
        Transparent = True
        DesignSize = (
          465
          113)
        Height = 113
        Width = 465
        object Label4: TLabel
          Left = 16
          Top = 17
          Width = 81
          Height = 13
          Caption = 'Current Setting :'
          Transparent = True
        end
        object Label5: TLabel
          Left = 32
          Top = 61
          Width = 65
          Height = 13
          Caption = 'New Setting :'
          Transparent = True
        end
        object memCurrent2: TcxMemo
          Left = 104
          Top = 16
          Anchors = [akLeft, akTop, akRight]
          Properties.ReadOnly = True
          TabOrder = 0
          Height = 41
          Width = 352
        end
        object memNew2: TcxMemo
          Left = 104
          Top = 60
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Height = 41
          Width = 352
        end
      end
    end
  end
end
