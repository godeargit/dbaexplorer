object AlarmOptionsFrm: TAlarmOptionsFrm
  Left = 247
  Top = 162
  Width = 480
  Height = 376
  BorderIcons = [biSystemMenu]
  Caption = 'Alert Event Options'
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000333
    33333333333003BBBBBBBBBBBB3003B8777777777B3003B8FFFFFFFF7B3003B8
    FF7FFFFF7B3003B8F899FFFF7B3003B8F9998FFF7B3003B889779FFF7B3003B8
    89FF97FF7B3003B8FFFF898F7B3003B8FFFFF89F7B3003B8FFFFFF897B3003B8
    FFFFFFF81B3003B8877777787330003338FFF873330000000088870000008001
    0000800100008001000080010000800100008001000080010000800100008001
    00008001000080010000800100008001000080010000C0030000FC3F0000}
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 301
    Width = 472
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnCancel: TcxButton
      Left = 90
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnOK: TcxButton
      Left = 10
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnAlarmMaintence: TcxButton
      Left = 170
      Top = 9
      Width = 129
      Height = 25
      Caption = 'Alert Maintenance ...'
      TabOrder = 2
      OnClick = btnAlarmMaintenceClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 472
    Height = 301
    ActivePage = cxTabSheet1
    Align = alClient
    Rotate = True
    TabOrder = 1
    TabPosition = tpLeft
    ClientRectBottom = 301
    ClientRectLeft = 64
    ClientRectRight = 472
    ClientRectTop = 0
    object cxTabSheet1: TcxTabSheet
      Caption = 'Properties'
      ImageIndex = 0
      DesignSize = (
        408
        301)
      object cxGroupBox2: TcxGroupBox
        Left = 5
        Top = 163
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Options'
        TabOrder = 0
        Height = 126
        Width = 393
        object cxLabel2: TcxLabel
          Left = 20
          Top = 18
          Caption = 'Refresh interval :'
        end
        object sedtRefreshInterval: TcxSpinEdit
          Left = 112
          Top = 16
          TabOrder = 1
          Value = 200
          Width = 73
        end
        object chkIconInSystemTray: TcxCheckBox
          Left = 16
          Top = 48
          Caption = 'Show alert icon in system tray when alert events to arise'
          TabOrder = 2
          Width = 305
        end
        object chkSentToMail: TcxCheckBox
          Left = 16
          Top = 72
          Caption = 'Sent to mail when alert events to rise'
          TabOrder = 3
          Width = 305
        end
        object chkSentToSMS: TcxCheckBox
          Left = 16
          Top = 96
          Caption = 'Sent to sms when alert events to rise'
          TabOrder = 4
          Width = 305
        end
        object cxLabel7: TcxLabel
          Left = 189
          Top = 18
          Caption = 'seconds'
        end
      end
      object cxGroupBox1: TcxGroupBox
        Left = 5
        Top = 8
        Anchors = [akLeft, akTop, akRight]
        Caption = 'General Properties'
        TabOrder = 1
        DesignSize = (
          393
          145)
        Height = 145
        Width = 393
        object rbDoNotLogAlarm: TcxRadioButton
          Left = 16
          Top = 32
          Width = 209
          Height = 17
          Caption = 'Do not log alarms to the alert log'
          TabOrder = 0
          OnClick = rbDoNotLogAlarmClick
        end
        object rbLogAlarms: TcxRadioButton
          Left = 16
          Top = 56
          Width = 177
          Height = 17
          Caption = 'Log alerts to do alarm log'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = rbLogAlarmsClick
        end
        object cxLabel1: TcxLabel
          Left = 32
          Top = 80
          Caption = 'Alert Log Name :'
        end
        object bedtLogFileName: TcxButtonEdit
          Left = 127
          Top = 78
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = bedtLogFileNamePropertiesButtonClick
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 3
          Width = 253
        end
        object btnClearAlarmLog: TcxButton
          Left = 32
          Top = 112
          Width = 97
          Height = 25
          Caption = 'Clear Alert Log'
          TabOrder = 4
          OnClick = btnClearAlarmLogClick
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'SMTP Mail'
      ImageIndex = 1
      object cxGroupBox3: TcxGroupBox
        Left = 8
        Top = 8
        Caption = 'Sender'
        TabOrder = 0
        Height = 89
        Width = 385
        object cxLabel3: TcxLabel
          Left = 16
          Top = 24
          Caption = 'Name :'
        end
        object cxLabel4: TcxLabel
          Left = 16
          Top = 48
          Caption = 'Mail Adres :'
        end
      end
      object cxGroupBox4: TcxGroupBox
        Left = 8
        Top = 104
        Caption = 'Mail Server'
        TabOrder = 1
        Height = 89
        Width = 385
        object cxLabel5: TcxLabel
          Left = 16
          Top = 24
          Caption = 'Host Name :'
        end
        object cxLabel6: TcxLabel
          Left = 16
          Top = 48
          Caption = 'Port Number :'
        end
      end
      object cxGroupBox5: TcxGroupBox
        Left = 8
        Top = 200
        Caption = 'Mail To'
        TabOrder = 2
        Height = 89
        Width = 385
        object cxMemo1: TcxMemo
          Left = 8
          Top = 16
          Lines.Strings = (
            'cxMemo1')
          TabOrder = 0
          Height = 63
          Width = 367
        end
      end
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.log'
    Filter = 'Log File|*.Log|All Files|*.*'
    Left = 400
    Top = 56
  end
end
