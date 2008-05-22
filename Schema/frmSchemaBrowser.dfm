object SchemaBrowserFrm: TSchemaBrowserFrm
  Left = 210
  Top = 192
  Width = 725
  Height = 451
  Caption = 'Schema Browser'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    000000000000000000000000000066666660666666606F88EE606F88EE606F88
    8E606F888E606FFFF8600FFFF860666666600066666000070000000700000007
    7777777700000000000700000000000066666660000000006F88EE6000000000
    6F888E60000000006FFFF860000000006666666000000000000000000000FFFF
    0000808000000000000000000000000000000080000001C10000E0070000E00F
    0000F80F0000F00F0000F00F0000F00F0000F00F0000F01F0000FFFF0000}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    717
    417)
  PixelsPerInch = 96
  TextHeight = 13
  object dsHost: TdxDockSite
    Left = 0
    Top = 0
    Width = 717
    Height = 417
    Align = alClient
    DockType = 0
    OriginalWidth = 717
    OriginalHeight = 417
    object dxLayoutDockSite2: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 717
      Height = 389
      DockType = 1
      OriginalWidth = 300
      OriginalHeight = 200
      object dxLayoutDockSite3: TdxLayoutDockSite
        Left = 233
        Top = 0
        Width = 484
        Height = 389
        DockType = 1
        OriginalWidth = 300
        OriginalHeight = 200
        object dxLayoutDockSite4: TdxLayoutDockSite
          Left = 0
          Top = 0
          Width = 484
          Height = 389
          DockType = 1
          OriginalWidth = 300
          OriginalHeight = 200
        end
        object DockObjectsPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 484
          Height = 389
          AllowFloating = True
          AutoHide = False
          Caption = 'DockObjectsPanel'
          ShowCaption = False
          DockType = 1
          OriginalWidth = 185
          OriginalHeight = 140
        end
      end
      object dpToolbox: TdxDockPanel
        Left = 0
        Top = 0
        Width = 233
        Height = 389
        AllowFloating = True
        AutoHide = False
        Caption = 'Browser'
        CaptionButtons = [cbMaximize, cbHide]
        ImageIndex = 7
        DockType = 2
        OriginalWidth = 233
        OriginalHeight = 573
        object cxHeader1: TcxHeader
          Left = 0
          Top = 0
          Width = 229
          Height = 31
          Align = alTop
          Color = clBtnFace
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = False
          ParentColor = False
          Sections = <
            item
              Width = 1000
            end>
        end
        object lcIndexSchema: TcxLookupComboBox
          Left = 11
          Top = 5
          Properties.KeyFieldNames = 'USERNAME'
          Properties.ListColumns = <
            item
              FieldName = 'USERNAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmGenel.dsSchema
          Properties.OnEditValueChanged = lcIndexSchemaPropertiesEditValueChanged
          Style.BorderStyle = ebsNone
          Style.Shadow = False
          TabOrder = 1
          Width = 206
        end
        object treeBrowser: TcxTreeView
          Left = 0
          Top = 31
          Width = 229
          Height = 336
          Align = alClient
          Style.BorderStyle = cbsNone
          Style.LookAndFeel.Kind = lfStandard
          Style.Shadow = False
          StyleDisabled.BorderStyle = cbsOffice11
          StyleDisabled.LookAndFeel.Kind = lfStandard
          StyleFocused.LookAndFeel.Kind = lfStandard
          StyleHot.LookAndFeel.Kind = lfStandard
          TabOrder = 2
          OnMouseDown = treeBrowserMouseDown
          HotTrack = True
          Images = dmGenel.ilSchemaBrowser
          Items.Data = {
            030000001F0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
            06536368656D61210000000000000000000000FFFFFFFFFFFFFFFF0000000000
            000000085365637572697479200000000000000000000000FFFFFFFFFFFFFFFF
            00000000000000000753746F72616765}
          ReadOnly = True
          StateImages = dmGenel.ilSchemaBrowser
          OnChange = treeBrowserChange
          OnChanging = treeBrowserChanging
          OnExpanding = treeBrowserExpanding
        end
      end
    end
    object dpOutput: TdxDockPanel
      Left = 0
      Top = 0
      Width = 179
      Height = 81
      Visible = False
      AllowFloating = True
      AutoHide = True
      Caption = 'Output'
      ImageIndex = 4
      AutoHidePosition = 3
      DockType = 5
      OriginalWidth = 179
      OriginalHeight = 81
      object memOutput: TMemo
        Left = 0
        Top = 0
        Width = 695
        Height = 77
        Align = alClient
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object dxDockingManager1: TdxDockingManager
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Images = dmGenel.ilDockIcons
    Options = [doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doTabContainerHasCaption, doTabContainerCanAutoHide, doSideContainerCanClose, doSideContainerCanAutoHide, doTabContainerCanInSideContainer]
    ViewStyle = vsStandard
    Left = 416
    Top = 24
  end
  object TimerConnected: TTimer
    Enabled = False
    OnTimer = TimerConnectedTimer
    Left = 383
    Top = 21
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 386
    Top = 56
  end
  object popupSchema: TPopupMenu
    Images = dmGenel.ilSchemaBrowser
    Left = 305
    Top = 152
    object miCreateTables: TMenuItem
      Caption = 'Create Table'
      ImageIndex = 0
      OnClick = miCreateTablesClick
    end
    object miCreateViews: TMenuItem
      Caption = 'Create View'
      ImageIndex = 1
      OnClick = miCreateViewsClick
    end
    object miCreateIndexes: TMenuItem
      Caption = 'Create Index'
      ImageIndex = 2
      OnClick = miCreateIndexesClick
    end
    object miCreateTriggers: TMenuItem
      Caption = 'Create Trigger'
      ImageIndex = 3
      OnClick = miCreateTriggersClick
    end
    object miCreateSequences: TMenuItem
      Caption = 'Create Sequence'
      ImageIndex = 4
      OnClick = miCreateSequencesClick
    end
    object miCreatePackages: TMenuItem
      Caption = 'Create Package'
      ImageIndex = 5
      OnClick = miCreatePackagesClick
    end
    object miCreateProcedures: TMenuItem
      Caption = 'Create Procedure'
      ImageIndex = 6
      OnClick = miCreateProceduresClick
    end
    object miCreateFunctions: TMenuItem
      Caption = 'Create Functions'
      ImageIndex = 7
      OnClick = miCreateFunctionsClick
    end
    object miCreateTypes: TMenuItem
      Caption = 'Create Type'
      ImageIndex = 8
      OnClick = miCreateTypesClick
    end
    object miCreateSynonyms: TMenuItem
      Caption = 'Create Synonym'
      ImageIndex = 9
      OnClick = miCreateSynonymsClick
    end
    object miCreatePublicSynonyms: TMenuItem
      Caption = 'Create PublicSynonym'
      ImageIndex = 10
      OnClick = miCreatePublicSynonymsClick
    end
    object miCreateDatabaseLinks: TMenuItem
      Caption = 'Create Database Link'
      ImageIndex = 11
      OnClick = miCreateDatabaseLinksClick
    end
    object miCreateUsers: TMenuItem
      Caption = 'Create User'
      ImageIndex = 12
      OnClick = miCreateUsersClick
    end
    object miCreateRoles: TMenuItem
      Caption = 'Create Role'
      ImageIndex = 13
    end
    object miCreateSystemPrivs: TMenuItem
      Caption = 'Create SystemPriv'
      ImageIndex = 14
    end
    object miCreateDirectories: TMenuItem
      Caption = 'Create Directory'
      ImageIndex = 15
      OnClick = miCreateDirectoriesClick
    end
    object miCreateRollbackSegments: TMenuItem
      Caption = 'Create Rollback Segment'
      ImageIndex = 16
      OnClick = miCreateRollbackSegmentsClick
    end
    object miCreateTablespaces: TMenuItem
      Caption = 'Create Tablespace'
      ImageIndex = 17
      OnClick = miCreateTablespacesClick
    end
    object miCizgi: TMenuItem
      Caption = '-'
    end
    object miCreateMaterializedViews: TMenuItem
      Caption = 'Create Materialized View'
    end
    object miCreateMaterializedViewLogs: TMenuItem
      Caption = 'Create Materialized View Logs'
    end
    object miCizgi2: TMenuItem
      Caption = '-'
    end
    object miRefreshObjects: TMenuItem
      Caption = 'Refresh Objects'
      OnClick = miRefreshObjectsClick
    end
  end
  object popupTable: TPopupMenu
    Images = dmGenel.imList
    Left = 305
    Top = 184
    object miTableName: TMenuItem
      Caption = '<TableName>'
      Enabled = False
      ImageIndex = 82
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miCreateTable: TMenuItem
      Caption = 'Create Table'
      ImageIndex = 82
      OnClick = miCreateTableClick
    end
    object miAlterTable: TMenuItem
      Caption = 'Alter Table'
      ImageIndex = 101
      OnClick = miAlterTableClick
    end
    object miDropTable: TMenuItem
      Caption = 'DropTable'
      ImageIndex = 83
      OnClick = miDropTableClick
    end
    object miTableCreateSequence: TMenuItem
      Caption = 'Create Sequence'
      OnClick = miTableCreateSequenceClick
    end
    object miAddColumn: TMenuItem
      Caption = 'Add Column'
      OnClick = miAddColumnClick
    end
    object miAddIndex: TMenuItem
      Caption = 'Add Index'
      OnClick = miAddIndexClick
    end
    object miTableGrants: TMenuItem
      Caption = 'Grants'
      OnClick = miTableGrantsClick
    end
    object miTableSynonym: TMenuItem
      Caption = 'Synonym'
      OnClick = miTableSynonymClick
    end
    object Constraint1: TMenuItem
      Caption = 'Constraint'
      object miAddKeys: TMenuItem
        Caption = 'Add Key'
        OnClick = miAddKeysClick
      end
      object miAddForeignKey: TMenuItem
        Caption = 'Add Foreign Key'
        OnClick = miAddForeignKeyClick
      end
      object miAddCheck: TMenuItem
        Caption = 'Add Check'
        OnClick = miAddCheckClick
      end
      object miTableEnableAllConstraint: TMenuItem
        Caption = 'Enable All Constraints'
        OnClick = miTableEnableAllConstraintClick
      end
      object miTableDisableAllConstraint: TMenuItem
        Caption = 'Disable All Constraint'
        OnClick = miTableDisableAllConstraintClick
      end
    end
    object rigger1: TMenuItem
      Caption = 'Trigger'
      object miTableAddTrigger: TMenuItem
        Caption = 'Add Trigger'
        OnClick = miTableAddTriggerClick
      end
      object miTableEnableAllTrigger: TMenuItem
        Caption = 'Enable All Trigger'
        OnClick = miTableEnableAllTriggerClick
      end
      object miTableDisableAllTrigger: TMenuItem
        Caption = 'Disable All Trigger'
        OnClick = miTableDisableAllTriggerClick
      end
    end
    object Export1: TMenuItem
      Caption = 'Export'
      object miTableExportData: TMenuItem
        Caption = 'Export Data'
      end
      object miTableExportDDL: TMenuItem
        Caption = 'Export DDL'
      end
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object miCreateMaterializedView: TMenuItem
      Caption = 'Create Materialized View'
      OnClick = miCreateMaterializedViewClick
    end
    object miCreateMaterializedViewLog: TMenuItem
      Caption = 'Create Materialized View Log'
      OnClick = miCreateMaterializedViewLogClick
    end
  end
  object popupView: TPopupMenu
    Left = 345
    Top = 184
    object ViewName1: TMenuItem
      Caption = '<ViewName>'
      Enabled = False
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object miCreateView: TMenuItem
      Caption = 'Create View'
      OnClick = miCreateViewClick
    end
    object miAlterView: TMenuItem
      Caption = 'Alter View'
      OnClick = miAlterViewClick
    end
    object miDropView: TMenuItem
      Caption = 'Drop View'
      OnClick = miDropViewClick
    end
    object miViewGrants: TMenuItem
      Caption = 'Grant'
      OnClick = miViewGrantsClick
    end
    object miViewSynonym: TMenuItem
      Caption = 'Synonym'
      OnClick = miViewSynonymClick
    end
    object rigger2: TMenuItem
      Caption = 'Trigger'
      object miViewTrigger: TMenuItem
        Caption = 'Add Trigger'
        OnClick = miViewTriggerClick
      end
      object miViewEnableAllTrigger: TMenuItem
        Caption = 'Enable All Trigger'
        OnClick = miViewEnableAllTriggerClick
      end
      object miViewDisableAllTrigger: TMenuItem
        Caption = 'Disable All Trigger'
        OnClick = miViewDisableAllTriggerClick
      end
    end
  end
  object popupIndex: TPopupMenu
    Left = 369
    Top = 184
    object MenuItem1: TMenuItem
      Caption = '<IndexName>'
      Enabled = False
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object miCreateIndex: TMenuItem
      Caption = 'Create Index'
      OnClick = miCreateIndexClick
    end
    object miAlterIndex: TMenuItem
      Caption = 'Alter Index'
      OnClick = miAlterIndexClick
    end
    object miDropIndex: TMenuItem
      Caption = 'Drop Index'
      OnClick = miDropIndexClick
    end
  end
  object popupTrigger: TPopupMenu
    Left = 401
    Top = 184
    object MenuItem3: TMenuItem
      Caption = '<TriggerName>'
      Enabled = False
    end
    object MenuItem4: TMenuItem
      Caption = '-'
    end
    object miCreateTrigger: TMenuItem
      Caption = 'Create Trigger'
      OnClick = miCreateTriggerClick
    end
    object miAlterTrigger: TMenuItem
      Caption = 'Alter Trigger'
      OnClick = miAlterTriggerClick
    end
    object miDropTrigger: TMenuItem
      Caption = 'Drop Trigger'
      OnClick = miDropTriggerClick
    end
  end
  object popupSequence: TPopupMenu
    Left = 305
    Top = 216
    object SequenceName1: TMenuItem
      Caption = '<SequenceName>'
      Enabled = False
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object miCreateSequence: TMenuItem
      Caption = 'Create Sequence'
      OnClick = miCreateSequenceClick
    end
    object miAlterSequence: TMenuItem
      Caption = 'Alter Sequence'
      OnClick = miAlterSequenceClick
    end
    object miDropSequence: TMenuItem
      Caption = 'Drop Sequence'
      OnClick = miDropSequenceClick
    end
  end
  object popupPackage: TPopupMenu
    Left = 337
    Top = 216
    object ProcedureName1: TMenuItem
      Caption = '<PackageName>'
      Enabled = False
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object miCreatePackage: TMenuItem
      Caption = 'Create Package'
      OnClick = miCreatePackageClick
    end
    object miAlterPackage: TMenuItem
      Caption = 'Alter Package'
      OnClick = miAlterPackageClick
    end
    object miDropPackage: TMenuItem
      Caption = 'Drop Package'
      OnClick = miDropPackageClick
    end
    object miCompilePackage: TMenuItem
      Caption = 'Compile'
      OnClick = miCompilePackageClick
    end
    object miExecutePackage: TMenuItem
      Caption = 'Execute'
      OnClick = miExecutePackageClick
    end
    object miGrantPackage: TMenuItem
      Caption = 'Grant'
      OnClick = miGrantPackageClick
    end
    object miSynonymPackage: TMenuItem
      Caption = 'Synonym'
      OnClick = miSynonymPackageClick
    end
  end
  object popupProcedure: TPopupMenu
    Left = 369
    Top = 216
    object MenuItem5: TMenuItem
      Caption = '<PackageName>'
      Enabled = False
    end
    object MenuItem6: TMenuItem
      Caption = '-'
    end
    object miCreateProcedure: TMenuItem
      Caption = 'Create Procedure'
      OnClick = miCreatePackageClick
    end
    object miAlterProcedure: TMenuItem
      Caption = 'Alter Procedure'
      OnClick = miAlterPackageClick
    end
    object miDropProcedure: TMenuItem
      Caption = 'Drop Procedure'
      OnClick = miDropPackageClick
    end
    object miCompileProcedure: TMenuItem
      Caption = 'Compile'
      OnClick = miCompilePackageClick
    end
    object miExecuteProcedure: TMenuItem
      Caption = 'Execute'
      OnClick = miExecutePackageClick
    end
    object miGrantProcedure: TMenuItem
      Caption = 'Grant'
      OnClick = miGrantPackageClick
    end
    object miSynonymProcedure: TMenuItem
      Caption = 'Synonym'
      OnClick = miSynonymPackageClick
    end
  end
  object popupFunction: TPopupMenu
    Left = 401
    Top = 216
    object MenuItem14: TMenuItem
      Caption = '<PackageName>'
      Enabled = False
    end
    object MenuItem15: TMenuItem
      Caption = '-'
    end
    object miCreateFunction: TMenuItem
      Caption = 'Create Function'
      OnClick = miCreatePackageClick
    end
    object miAlterFunction: TMenuItem
      Caption = 'Alter Function'
      OnClick = miAlterPackageClick
    end
    object mDropFunction: TMenuItem
      Caption = 'Drop Function'
      OnClick = miDropPackageClick
    end
    object miCompileFunction: TMenuItem
      Caption = 'Compile'
      OnClick = miCompilePackageClick
    end
    object miExecuteFunction: TMenuItem
      Caption = 'Execute'
      OnClick = miExecutePackageClick
    end
    object miGrantFunction: TMenuItem
      Caption = 'Grant'
      OnClick = miGrantPackageClick
    end
    object miSynonymFunction: TMenuItem
      Caption = 'Synonym'
      OnClick = miSynonymPackageClick
    end
  end
  object popupType: TPopupMenu
    Left = 433
    Top = 216
    object MenuItem7: TMenuItem
      Caption = '<PackageName>'
      Enabled = False
    end
    object MenuItem8: TMenuItem
      Caption = '-'
    end
    object miCreateType: TMenuItem
      Caption = 'Create Type'
      OnClick = miCreatePackageClick
    end
    object miAlterType: TMenuItem
      Caption = 'Alter Type'
      OnClick = miAlterPackageClick
    end
    object miDropType: TMenuItem
      Caption = 'Drop Type'
      OnClick = miDropPackageClick
    end
    object miCompileType: TMenuItem
      Caption = 'Compile'
      OnClick = miCompilePackageClick
    end
    object miExecuteType: TMenuItem
      Caption = 'Execute'
      OnClick = miExecutePackageClick
    end
    object miGrantType: TMenuItem
      Caption = 'Grant'
      OnClick = miGrantPackageClick
    end
    object miSynonymType: TMenuItem
      Caption = 'Synonym'
      OnClick = miSynonymPackageClick
    end
  end
  object popupSynonym: TPopupMenu
    Left = 305
    Top = 248
    object SynonymName1: TMenuItem
      Caption = '<SynonymName>'
      Enabled = False
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object miCreateSynonym: TMenuItem
      Caption = 'Create Synonym'
      OnClick = miCreateSynonymClick
    end
    object miDropSynonym: TMenuItem
      Caption = 'Drop Synonym'
      OnClick = miDropSynonymClick
    end
  end
  object popupDBLink: TPopupMenu
    Left = 337
    Top = 248
    object DBlinkName1: TMenuItem
      Caption = '<DB link Name>'
      Enabled = False
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object miCreateDBLink: TMenuItem
      Caption = 'Create DB Link'
      OnClick = miCreateDBLinkClick
    end
    object miAlterDBLink: TMenuItem
      Caption = 'Alter DB Link'
      OnClick = miAlterDBLinkClick
    end
    object miDropDBLink: TMenuItem
      Caption = 'Drop DB Link'
      OnClick = miDropDBLinkClick
    end
  end
  object popupUser: TPopupMenu
    Left = 305
    Top = 280
    object MenuItem9: TMenuItem
      Caption = '<UserName>'
      Enabled = False
    end
    object MenuItem10: TMenuItem
      Caption = '-'
    end
    object miCreateUser: TMenuItem
      Caption = 'Create User'
      OnClick = miCreateUserClick
    end
    object miAlteruser: TMenuItem
      Caption = 'Alter User'
      OnClick = miAlteruserClick
    end
    object miDropUser: TMenuItem
      Caption = 'Drop User'
      OnClick = miDropUserClick
    end
  end
  object popupDirectory: TPopupMenu
    Left = 305
    Top = 312
    object MenuItem11: TMenuItem
      Caption = '<DirektoryName>'
      Enabled = False
    end
    object MenuItem12: TMenuItem
      Caption = '-'
    end
    object miCreateDirectory: TMenuItem
      Caption = 'Create Directory'
      OnClick = miCreateDirectoryClick
    end
    object miAlterDirectory: TMenuItem
      Caption = 'Alter Directory'
      OnClick = miAlterDirectoryClick
    end
    object miDropDirectory: TMenuItem
      Caption = 'Drop Directory'
      OnClick = miDropDirectoryClick
    end
  end
  object popupRollbackSegment: TPopupMenu
    Left = 337
    Top = 312
    object MenuItem13: TMenuItem
      Caption = '<RollbackSegmentName>'
      Enabled = False
    end
    object MenuItem16: TMenuItem
      Caption = '-'
    end
    object miCreateRollbackSegment: TMenuItem
      Caption = 'Create Rollback Segment'
      OnClick = miCreateRollbackSegmentClick
    end
    object miAlterRollbackSegment: TMenuItem
      Caption = 'Alter Rollback Segment'
      OnClick = miAlterRollbackSegmentClick
    end
    object miDropRollbackSegment: TMenuItem
      Caption = 'Drop Rollback Segment'
      OnClick = miDropRollbackSegmentClick
    end
  end
  object popupTablespace: TPopupMenu
    Left = 369
    Top = 312
    object MenuItem17: TMenuItem
      Caption = '<TablespaceName>'
      Enabled = False
    end
    object MenuItem18: TMenuItem
      Caption = '-'
    end
    object miCreateTablespace: TMenuItem
      Caption = 'Create Tablespace'
      OnClick = miCreateTablespaceClick
    end
    object miAlterTablespace: TMenuItem
      Caption = 'Alter Tablespace'
      OnClick = miAlterTablespaceClick
    end
    object miDropTablespace: TMenuItem
      Caption = 'Drop Tablespace'
      OnClick = miDropTablespaceClick
    end
  end
end
