program DBAExplorer;

uses
  Forms,
  frmMain in 'frmMain.pas' {MainFrm},
  frmSchemaBrowser in 'Schema\frmSchemaBrowser.pas' {SchemaBrowserFrm},
  frmLogin in 'frmLogin.pas' {LoginFrm},
  OraQueryThread in 'OraQueryThread.pas',
  Global in 'Global.pas',
  Util in 'Util.pas',
  OraScripts in 'OracleScripts\OraScripts.pas',
  frmTableProperties in 'Schema\frmTableProperties.pas' {TablePropertiesFrm},
  GenelDM in 'GenelDM.pas' {dmGenel: TDataModule},
  frmBaseform in 'frmBaseform.pas' {Baseform},
  frmViewProperties in 'Schema\frmViewProperties.pas' {ViewPropertiesFrm},
  OraBarConn in 'OraBarConn.pas',
  frmSchemaBrowserList in 'Schema\frmSchemaBrowserList.pas' {SchemaBrowserListFrm},
  frmTableDetail in 'Schema\frmTableDetail.pas' {TableDetailFrm},
  frmTableColumns in 'Schema\frmTableColumns.pas' {TableColumnsFrm},
  frmTableIndexes in 'Schema\frmTableIndexes.pas' {TableIndexesFrm},
  frmTableConstraints in 'Schema\frmTableConstraints.pas' {TableConstraintsFrm},
  frmTrigerDetail in 'Schema\frmTrigerDetail.pas' {TriggerDetailFrm},
  frmSynonyms in 'Schema\frmSynonyms.pas' {SynonymsFrm},
  frmByteConverter in 'frmByteConverter.pas' {ByteConverterFrm},
  frmTableIndexPartition in 'Schema\frmTableIndexPartition.pas' {TableIndexPartitionFrm},
  OraStorage in 'OracleScripts\OraStorage.pas',
  frmSQLEditor in 'SQLEditor\frmSQLEditor.pas' {SQLEditorFrm},
  frmSQLEditorFrame in 'SQLEditor\frmSQLEditorFrame.pas' {SQLEditorFrameFrm},
  OraConstraint in 'OracleScripts\OraConstraint.pas',
  OraIndex in 'OracleScripts\OraIndex.pas',
  OraTriger in 'OracleScripts\OraTriger.pas',
  frmGrants in 'Schema\frmGrants.pas' {GrantsFrm},
  OraGrants in 'OracleScripts\OraGrants.pas',
  DBQueryThread in 'DBQueryThread.pas',
  DBQuery in 'DBQuery.pas',
  OraSynonym in 'OracleScripts\OraSynonym.pas',
  OraTable in 'OracleScripts\OraTable.pas',
  frmSessionBrowser in 'DBA\frmSessionBrowser.pas' {SessionBrowserFrm},
  OraSessions in 'OracleScripts\OraSessions.pas',
  frmDBA in 'DBA\frmDBA.pas' {DBAfrm},
  OraDBA in 'OracleScripts\OraDBA.pas',
  frmDBASystemParameters in 'DBA\frmDBASystemParameters.pas' {DBASystemParametersFrm},
  OraUser in 'OracleScripts\OraUser.pas',
  OraCluster in 'OracleScripts\OraCluster.pas',
  OraPartitions in 'OracleScripts\OraPartitions.pas',
  frmTableEvents in 'Schema\frmTableEvents.pas' {TableEventsFrm},
  frmTableSort in 'Schema\frmTableSort.pas' {TableSortFrm},
  frmTableFind in 'Schema\frmTableFind.pas' {TableFindFrm},
  OraView in 'OracleScripts\OraView.pas',
  frmViewDetail in 'Schema\frmViewDetail.pas' {ViewDetailFrm},
  frmIndexProperties in 'Schema\frmIndexProperties.pas' {IndexPropertiesFrm},
  frmTriggerProperties in 'Schema\frmTriggerProperties.pas' {TriggerPropertiesFrm},
  frmSequenceProperties in 'Schema\frmSequenceProperties.pas' {SequencePropertiesFrm},
  OraSequence in 'OracleScripts\OraSequence.pas',
  frmSchemaPublicEvent in 'Schema\frmSchemaPublicEvent.pas' {SchemaPublicEventFrm},
  frmSequenceDetail in 'Schema\frmSequenceDetail.pas' {SequenceDetailFrm},
  frmProcedureEditor in 'ProcedureEditor\frmProcedureEditor.pas' {ProcedureEditorFrm},
  frmProcedureProperties in 'Schema\frmProcedureProperties.pas' {ProcedurePropertiesFrm},
  OraProcSource in 'OracleScripts\OraProcSource.pas',
  frmProcedureDetail in 'ProcedureEditor\frmProcedureDetail.pas' {ProcedureDetailFrm},
  frmProcedureRun in 'ProcedureEditor\frmProcedureRun.pas' {ProcedureRunFrm},
  frmMaterializedViewDetail in 'Schema\frmMaterializedViewDetail.pas' {MaterializedViewDetailFrm},
  OraMaterializedView in 'OracleScripts\OraMaterializedView.pas',
  frmMaterializedViewLogDetail in 'Schema\frmMaterializedViewLogDetail.pas' {MaterializedViewLogDetailFrm},
  OraMaterializedViewLog in 'OracleScripts\OraMaterializedViewLog.pas',
  frmSynonymProperties in 'Schema\frmSynonymProperties.pas' {SynonymPropertiesFrm},
  frmDatabaseLinkDetail in 'Schema\frmDatabaseLinkDetail.pas' {DatabaseLinkDetailFrm},
  OraDBLink in 'OracleScripts\OraDBLink.pas',
  frmDatabaseLinkProperties in 'Schema\frmDatabaseLinkProperties.pas' {DatabaseLinkPropertiesFrm},
  frmPreferences in 'frmPreferences.pas' {PreferencesFrm},
  frmVisualOptions in 'frmVisualOptions.pas' {VisualOptionsFrm},
  VisualOptions in 'VisualOptions.pas',
  frmDatabaseStatus in 'DBA\frmDatabaseStatus.pas' {DatabaseStatusFrm},
  frmDiffMain in 'Diff\frmDiffMain.pas' {DiffMainFrm},
  DiffUnit in 'Diff\DiffUnit.pas',
  HashUnit in 'Diff\HashUnit.pas',
  CodeEditor in 'Diff\CodeEditor.pas',
  DirWatch in 'Diff\DirWatch.pas',
  FileView in 'Diff\FileView.pas' {FilesFrame: TFrame},
  FindReplace in 'Diff\FindReplace.pas',
  FolderView in 'Diff\FolderView.pas' {FoldersFrame: TFrame},
  Searches in 'Diff\Searches.pas',
  frmAlarmOptions in 'DBA\frmAlarmOptions.pas' {AlarmOptionsFrm},
  frmAlarmMaintenance in 'DBA\frmAlarmMaintenance.pas' {AlarmMaintenanceFrm},
  AlarmOptions in 'DBA\AlarmOptions.pas',
  frmAlarmHistory in 'DBA\frmAlarmHistory.pas' {AlarmHistoryFrm},
  frmDBMSOutput in 'SQLEditor\frmDBMSOutput.pas' {DBMSOutputFrm},
  Languages in 'Utils\Languages.pas',
  frmEnvironmentOptions in 'frmEnvironmentOptions.pas' {EnvironmentOptionsFrm},
  frmAddLanguage in 'frmAddLanguage.pas' {AddLanguageFrm},
  frmUserProperties in 'Schema\frmUserProperties.pas' {UserPropertiesFrm},
  frmUserDetail in 'Schema\frmUserDetail.pas' {UserDetailFrm},
  OraRole in 'OracleScripts\OraRole.pas',
  OraSysPrivs in 'OracleScripts\OraSysPrivs.pas',
  OraQuota in 'OracleScripts\OraQuota.pas',
  frmDirectoryProperties in 'Schema\frmDirectoryProperties.pas' {DirectoryPropertiesFrm},
  OraDirectory in 'OracleScripts\OraDirectory.pas',
  frmDirectoryDetail in 'Schema\frmDirectoryDetail.pas' {DirectoryDetailFrm},
  frmRollbackSegmentProperties in 'Schema\frmRollbackSegmentProperties.pas' {RollbackSegmentPropertiesFrm},
  frmRollbackSegmentDetail in 'Schema\frmRollbackSegmentDetail.pas' {RollbackSegmentDetailFrm},
  OraRollbackSegment in 'OracleScripts\OraRollbackSegment.pas',
  OraTablespace in 'OracleScripts\OraTablespace.pas',
  frmTablespaceProperties in 'Schema\frmTablespaceProperties.pas' {TablespacePropertiesFrm},
  frmTablespaceDetail in 'Schema\frmTablespaceDetail.pas' {TablespaceDetailFrm},
  frmDataFile in 'Schema\frmDataFile.pas' {DataFileFrm},
  frmFindInDB in 'frmFindInDB.pas' {FindInDBFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(TdmGenel, dmGenel);
  Application.Run;
end.
