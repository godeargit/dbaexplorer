object DatabaseStatusFrm: TDatabaseStatusFrm
  Left = 319
  Top = 97
  Width = 687
  Height = 532
  Caption = 'Database Status'
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    000000000000000000000000000000000000000000000FFFFFFFFFFFFF000FCC
    CCCCCCCCCF000FCCCCECCCCCCF000FCCCCE7CECCCF000FCCCEEECEECCF000F7E
    EE6ECEEECF000F66EE6EE6666F000FCC66CEE6CCCF000FCCCCC7ECCCCF000FCC
    CCC6ECCCCF000FFFFFFFFFFFFF0000000000000000000000000000000000FFFF
    0000FFFF00000001000000010000000100000001000000010000000100000001
    0000000100000001000000010000000100000001000000010000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxSplitter12: TcxSplitter
    Left = 0
    Top = 225
    Width = 679
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    AlignSplitter = salTop
    Control = lviewStatus
  end
  object statusBar: TdxStatusBar
    Left = 0
    Top = 478
    Width = 679
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
  object lviewStatus: TcxListView
    Left = 0
    Top = 26
    Width = 679
    Height = 199
    Align = alTop
    Columns = <
      item
        AutoSize = True
        Caption = 'Details'
      end
      item
        AutoSize = True
        Caption = 'Value'
      end>
    ReadOnly = True
    RowSelect = True
    Style.BorderStyle = cbsUltraFlat
    Style.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.Kind = lfOffice11
    TabOrder = 2
    ViewStyle = vsReport
  end
  object gridTopSessions: TcxGrid
    Left = 0
    Top = 233
    Width = 679
    Height = 245
    Align = alClient
    TabOrder = 7
    LevelTabs.Style = 8
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object gridDBChart: TcxGridDBChartView
      DataController.DataSource = dsStatus
      DiagramArea.AxisCategory.TickMarkLabels = False
      DiagramArea.Values.VaryColorsByCategory = True
      DiagramArea.Values.CaptionPosition = ldvcpAbove
      DiagramArea.Values.MarkerStyle = cmsDiamond
      DiagramBar.AxisCategory.CategoriesInReverseOrder = True
      DiagramBar.Values.VaryColorsByCategory = True
      DiagramBar.Values.CaptionPosition = cdvcpOutsideEnd
      DiagramColumn.AxisValue.Title.Alignment = cpaCenter
      DiagramColumn.AxisValue.MinMaxValues = mmvAuto
      DiagramColumn.Values.VaryColorsByCategory = True
      DiagramColumn.Values.CaptionPosition = cdvcpOutsideEnd
      DiagramLine.Values.VaryColorsByCategory = True
      DiagramLine.Values.MarkerStyle = cmsDiamond
      DiagramPie.Active = True
      DiagramPie.SeriesSites = True
      DiagramPie.Values.CaptionPosition = pdvcpOutsideEndWithLeaderLines
      OptionsBehavior.ValueHotTrack = vhAlways
      OptionsCustomize.DataDrillDown = False
      OptionsCustomize.DataGroupMoving = False
      OptionsCustomize.OptionsCustomization = False
      OptionsCustomize.SeriesCustomization = False
      ToolBox.DataLevelsInfoVisible = dlivNever
      ToolBox.DiagramSelector = True
      object gridDBChartDataGroup1: TcxGridDBChartDataGroup
        DataBinding.FieldName = 'DETAIL'
      end
      object gridDBChartSeries1: TcxGridDBChartSeries
        DataBinding.FieldName = 'VALUE'
        DisplayText = 'SGA Configuration'
      end
    end
    object gridTopSessionsLevel2: TcxGridLevel
      Caption = 'Chart'
      GridView = gridDBChart
    end
  end
  object qStatus: TOraQuery
    SQL.Strings = (
      
        '   (SELECT '#39'db_size_in_mb'#39' detail, ROUND (MAX (a.BYTES) / 104857' +
        '6.0, 2) Value'
      '          FROM SYS.v_$sgastat a'
      
        '         WHERE (a.NAME = '#39'db_block_buffers'#39' OR a.NAME = '#39'buffer_' +
        'cache'#39'))'
      #9#9'union all'
      #9#9' '
      '       (SELECT '#39'db_caches'#39' detail, NVL'
      '                  (SUM (DECODE (SUBSTR (UPPER (b.VALUE), -1, 1),'
      
        '                                '#39'K'#39', ROUND ((  REPLACE (UPPER (b' +
        '.VALUE), '#39'K'#39', '#39#39' ) / 1024 ), 2),'
      
        '                                '#39'M'#39', REPLACE (UPPER (b.VALUE), '#39 +
        'M'#39', '#39#39'),'
      
        '                                '#39'B'#39', ROUND ((  REPLACE (UPPER (b' +
        '.VALUE), '#39'B'#39', '#39#39')/ 1048576.0), 2 ),'
      '                                ROUND ((b.VALUE / 1048576.0), 2)'
      '                               ) ), 0 ) value'
      '          FROM SYS.v_$parameter b'
      '         WHERE b.NAME LIKE '#39'%k_cache_size'#39')'
      #9
      '    '#9'union all'
      #9#9#9' '
      
        '       (SELECT '#39'fixed_size_in_mb'#39' detail, ROUND (SUM (b.BYTES) /' +
        ' 1048576.0, 2)value'
      '          FROM SYS.v_$sgastat b  WHERE b.NAME = '#39'fixed_sga'#39')'
      #9#9' '
      #9#9'union all'
      #9#9' '
      
        '       (SELECT '#39'lb_size_in_mb'#39' detail, ROUND (SUM (c.BYTES) / 10' +
        '48576.0, 2) value '
      '          FROM SYS.v_$sgastat c   WHERE c.NAME = '#39'log_buffer'#39')'
      #9
      #9#9'union all'
      #9#9' '
      
        '       (SELECT '#39'sp_size_in_mb'#39' detail, ROUND (SUM (d.BYTES) / 10' +
        '48576.0, 2) value'
      '          FROM SYS.v_$sgastat d  WHERE d.pool = '#39'shared pool'#39')'
      #9
      #9'    union all'#9'  '
      #9#9'  '
      
        '       (SELECT '#39'lp_size_in_mb'#39' detail, ROUND (SUM (e.BYTES) / 10' +
        '48576.0, 2) value'
      '          FROM SYS.v_$sgastat e  WHERE e.pool = '#39'large pool'#39')'
      #9#9' '
      #9'   union all'#9'  '
      #9#9'  '
      
        '       (SELECT '#39'jp_size_in_mb'#39' detail, ROUND (SUM (f.BYTES) / 10' +
        '48576.0, 2) value'
      '          FROM SYS.v_$sgastat f  WHERE f.pool = '#39'java pool'#39')'
      #9#9'  '
      '')
    Left = 24
    Top = 224
    object qStatusDETAIL: TStringField
      FieldName = 'DETAIL'
      Size = 16
    end
    object qStatusVALUE: TFloatField
      FieldName = 'VALUE'
    end
  end
  object dsStatus: TDataSource
    DataSet = qStatus
    Left = 64
    Top = 224
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 351
        FloatTop = 160
        FloatClientWidth = 23
        FloatClientHeight = 22
        IsMainMenu = True
        ItemLinks = <
          item
            Item = btnRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnClose
            Visible = True
          end>
        MultiLine = True
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = dmGenel.ilDBA
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 56
    Top = 280
    DockControlHeights = (
      0
      0
      26
      0)
    object btnRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 0
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 0
      OnClick = btnRefreshClick
    end
    object btnClose: TdxBarButton
      Caption = 'Close'
      Category = 0
      Hint = 'Close'
      Visible = ivAlways
      ImageIndex = 1
      OnClick = btnCloseClick
    end
  end
  object qTemp: TOraQuery
    Left = 24
    Top = 176
  end
  object dsTemp: TDataSource
    DataSet = qTemp
    Left = 56
    Top = 176
  end
end
