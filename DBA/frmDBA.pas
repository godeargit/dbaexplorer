{
	DBAExplorer - Oracle Admin Management Tool
    Copyright (C) 2008  Alpaslan KILICKAYA

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit frmDBA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxControls, cxContainer, cxTreeView, cxPC, StdCtrls,
  dxBar, ExtCtrls, GenelDM, dxBarExtItems, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxStatusBar, MemDS, DBAccess,
  Ora, OraBarConn, VirtualTable, cxListView, cxSplitter, cxTL, cxMaskEdit,
  cxInplaceContainer, cxDBTL, cxTLData, cxTextEdit, cxMemo, cxRichEdit,
  cxDBRichEdit, cxGridCardView, cxGridDBCardView, cxEditRepositoryItems,
  cxGridChartView, cxGridDBChartView, cxProgressBar, cxGroupBox,
  cxRadioGroup, OraScript, oraError;

type
  TDBAfrm = class(TForm)
    barDBAManager: TdxBarManager;
    Panel1: TPanel;
    pcMain: TcxPageControl;
    tsSystem: TcxTabSheet;
    pcSystem: TcxPageControl;
    tsParameters: TcxTabSheet;
    tsSystemStatistics: TcxTabSheet;
    tsTop: TcxTabSheet;
    pcTop: TcxPageControl;
    tsTopSql: TcxTabSheet;
    tsTopSegments: TcxTabSheet;
    tsMemory: TcxTabSheet;
    pcMemory: TcxPageControl;
    tsBufferPools: TcxTabSheet;
    tsBufferWaitStats: TcxTabSheet;
    tsSharedPoolAdvice: TcxTabSheet;
    tsPGAAdvice: TcxTabSheet;
    tsPGAStats: TcxTabSheet;
    tsWaits: TcxTabSheet;
    pcWaits: TcxPageControl;
    tsEvents: TcxTabSheet;
    tsLocks: TcxTabSheet;
    tsLatches: TcxTabSheet;
    tsChildLatches: TcxTabSheet;
    tsLatchHolders: TcxTabSheet;
    tsStorage: TcxTabSheet;
    pcStorage: TcxPageControl;
    tsTablespace: TcxTabSheet;
    tsIO: TcxTabSheet;
    pcIO: TcxPageControl;
    tsFiles: TcxTabSheet;
    tsSGAStat: TcxTabSheet;
    tsUndo: TcxTabSheet;
    pcUndo: TcxPageControl;
    tsTablespaces: TcxTabSheet;
    tsUndoStats: TcxTabSheet;
    tsRedo: TcxTabSheet;
    pcRedo: TcxPageControl;
    tsGroups: TcxTabSheet;
    tsLogSwitchHistory: TcxTabSheet;
    tsArchivedLogs: TcxTabSheet;
    tsTemp: TcxTabSheet;
    pcTemp: TcxPageControl;
    tsTempFiles: TcxTabSheet;
    btnKillSelectedSession: TdxBarButton;
    btnStartTraceforSession: TdxBarButton;
    btnStopTraceForSession: TdxBarButton;
    gridDBParameters: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    statusBar: TdxStatusBar;
    gridDBParametersINSTANCE: TcxGridDBColumn;
    gridDBParametersNAME: TcxGridDBColumn;
    gridDBParametersVALUE: TcxGridDBColumn;
    gridDBParametersDEFAULT: TcxGridDBColumn;
    gridDBParametersSES_MODIFIABLE: TcxGridDBColumn;
    gridDBParametersISSES_MODIFIABLE: TcxGridDBColumn;
    gridDBParametersSYS_MODIFIABLE: TcxGridDBColumn;
    gridDBParametersDESCRIPTION: TcxGridDBColumn;
    gridDBParametersUPDATE_COMMENT: TcxGridDBColumn;
    dsTopSQL: TDataSource;
    dsDetail: TDataSource;
    qTopSQL: TOraQuery;
    qDetail: TOraQuery;
    tsNLSParameters: TcxTabSheet;
    tsDatabase: TcxTabSheet;
    tsOptions: TcxTabSheet;
    tsInstance: TcxTabSheet;
    tsVersion: TcxTabSheet;
    lviewVersion: TcxListView;
    lviewInstance: TcxListView;
    lviewDatabase: TcxListView;
    lviewLicense: TcxListView;
    lviewOption: TcxListView;
    qTemp: TOraQuery;
    lviewNLSDatabase: TcxListView;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    lviewNLSSession: TcxListView;
    lviewNLSInstance: TcxListView;
    cxSplitter3: TcxSplitter;
    gridStatistics: TcxGrid;
    gridDBStatistics: TcxGridDBTableView;
    gridStatisticsLevel1: TcxGridLevel;
    gridDBStatisticsColumn1: TcxGridDBColumn;
    gridDBStatisticsColumn2: TcxGridDBColumn;
    gridDBStatisticsColumn3: TcxGridDBColumn;
    gridDBStatisticsColumn4: TcxGridDBColumn;
    dsTemp: TDataSource;
    tsTopSessions: TcxTabSheet;
    qTopSQLSQL_TEXT: TStringField;
    qTopSQLSHARABLE_MEM: TFloatField;
    qTopSQLPERSISTENT_MEM: TFloatField;
    qTopSQLRUNTIME_MEM: TFloatField;
    qTopSQLSORTS: TFloatField;
    qTopSQLLOADED_VERSIONS: TFloatField;
    qTopSQLOPEN_VERSIONS: TFloatField;
    qTopSQLUSERS_OPENING: TFloatField;
    qTopSQLEXECUTIONS: TFloatField;
    qTopSQLUSERS_EXECUTING: TFloatField;
    qTopSQLLOADS: TFloatField;
    qTopSQLFIRST_LOAD_TIME: TStringField;
    qTopSQLINVALIDATIONS: TFloatField;
    qTopSQLPARSE_CALLS: TFloatField;
    qTopSQLDISK_READS: TFloatField;
    qTopSQLBUFFER_GETS: TFloatField;
    qTopSQLROWS_PROCESSED: TFloatField;
    qTopSQLBUFFER_GETS_PER_EXECUTIONS: TFloatField;
    qTopSQLDISK_READS_PER_EXECUTIONS: TFloatField;
    qTopSQLROWS_PROCESSED_PER_EXECUTIONS: TFloatField;
    qTopSQLHIT_RATIO: TFloatField;
    qTopSQLADDRESS: TVarBytesField;
    qTopSQLHASH_VALUE: TFloatField;
    pcTopSQL: TcxPageControl;
    tsTopSQLInformation: TcxTabSheet;
    lviewTopSQLInformation: TcxListView;
    tsTopSQLExplainPlan: TcxTabSheet;
    treeListCursorExplain: TcxDBTreeList;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeListColumn5: TcxDBTreeListColumn;
    cxSplitter4: TcxSplitter;
    StyleRepository: TcxStyleRepository;
    styleSelection: TcxStyle;
    styleCardHeader: TcxStyle;
    styleCardBorder: TcxStyle;
    styleBackground: TcxStyle;
    styleCategoryRow: TcxStyle;
    stylePrice: TcxStyle;
    CardsStyleSheet: TcxGridCardViewStyleSheet;
    cxEditRepository: TcxEditRepository;
    cxEditRepositoryBlobItem1: TcxEditRepositoryBlobItem;
    cxEditRepositoryMemoItem1: TcxEditRepositoryMemoItem;
    dsPlanTable: TDataSource;
    tsTopSQLSQL: TcxTabSheet;
    redtTopSQL: TcxDBRichEdit;
    gridTopSQL: TcxGrid;
    gridDBTopSQL: TcxGridDBCardView;
    gridDBTopSQLSQL: TcxGridDBCardViewRow;
    gridTopSQLLevel2: TcxGridLevel;
    tsTopSQLStats: TcxTabSheet;
    qTopSegment: TOraQuery;
    dsTopSegment: TDataSource;
    cxSplitter5: TcxSplitter;
    lviewTopSegments: TcxListView;
    qTopSegmentOWNER: TStringField;
    qTopSegmentFULL_OBJECT_NAME: TStringField;
    qTopSegmentOBJECT_TYPE: TStringField;
    qTopSegmentVALUE: TFloatField;
    qTopSegmentTABLESPACE_NAME: TStringField;
    qTopSegmentSTATISTIC_NAME: TStringField;
    qTopSegmentOBJ: TFloatField;
    qTopSegmentDATAOBJ: TFloatField;
    qTopSession: TOraQuery;
    dsTopSession: TDataSource;
    gridTopSessionsLevel1: TcxGridLevel;
    gridTopSessions: TcxGrid;
    gridDBTopSessions: TcxGridDBChartView;
    gridDBTopSessionsSeries1: TcxGridDBChartSeries;
    gridDBTopSessionsDataGroup1: TcxGridDBChartDataGroup;
    qTopSessionSID: TFloatField;
    qTopSessionSESSIONS: TStringField;
    qTopSessionSTATUS: TStringField;
    qTopSessionOSUSER: TStringField;
    qTopSessionMACHINE: TStringField;
    qTopSessionTERMINAL: TStringField;
    qTopSessionPROGRAM: TStringField;
    qTopSessionMODULE: TStringField;
    qTopSessionACTION: TStringField;
    qTopSessionCLIENT_INFO: TStringField;
    qTopSessionNAME: TStringField;
    qTopSessionVALUE: TFloatField;
    qTopSessionSQL_ADDRESS: TVarBytesField;
    qTopSessionSQL_HASH_VALUE: TFloatField;
    qTopSessionPREV_SQL_ADDR: TVarBytesField;
    qTopSessionPREV_HASH_VALUE: TFloatField;
    gridTopSessionsLevel2: TcxGridLevel;
    gridTopSessionsDBTableView1: TcxGridDBTableView;
    gridTopSessionsDBTableView1SID: TcxGridDBColumn;
    gridTopSessionsDBTableView1SESSIONS: TcxGridDBColumn;
    gridTopSessionsDBTableView1STATUS: TcxGridDBColumn;
    gridTopSessionsDBTableView1OSUSER: TcxGridDBColumn;
    gridTopSessionsDBTableView1MACHINE: TcxGridDBColumn;
    gridTopSessionsDBTableView1TERMINAL: TcxGridDBColumn;
    gridTopSessionsDBTableView1PROGRAM: TcxGridDBColumn;
    gridTopSessionsDBTableView1MODULE: TcxGridDBColumn;
    gridTopSessionsDBTableView1ACTION: TcxGridDBColumn;
    gridTopSessionsDBTableView1CLIENT_INFO: TcxGridDBColumn;
    gridTopSessionsDBTableView1NAME: TcxGridDBColumn;
    gridTopSessionsDBTableView1VALUE: TcxGridDBColumn;
    icShowToSessionBy: TdxBarImageCombo;
    icShowTopSessions: TdxBarImageCombo;
    btnShowTopSegment: TdxBarImageCombo;
    icSortSegmentBy: TdxBarImageCombo;
    cxGrid2: TcxGrid;
    cxGridDBChartView1: TcxGridDBChartView;
    cxGridDBChartDataGroup1: TcxGridDBChartDataGroup;
    cxGridDBChartSeries1: TcxGridDBChartSeries;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView1OWNER: TcxGridDBColumn;
    cxGridDBTableView1FULL_OBJECT_NAME: TcxGridDBColumn;
    cxGridDBTableView1OBJECT_TYPE: TcxGridDBColumn;
    cxGridDBTableView1VALUE: TcxGridDBColumn;
    cxGridDBTableView1TABLESPACE_NAME: TcxGridDBColumn;
    cxGridDBTableView1STATISTIC_NAME: TcxGridDBColumn;
    cxGridDBTableView1OBJ: TcxGridDBColumn;
    cxGridDBTableView1DATAOBJ: TcxGridDBColumn;
    gridDBTopSQLRow1: TcxGridDBCardViewRow;
    gridDBTopSQLRow2: TcxGridDBCardViewRow;
    gridDBTopSQLRow3: TcxGridDBCardViewRow;
    gridDBTopSQLRow4: TcxGridDBCardViewRow;
    icTopSQLSortBy: TdxBarImageCombo;
    icTopSQLTop: TdxBarImageCombo;
    gridTopSQLLevel1: TcxGridLevel;
    gridTopSQLDBTableView1: TcxGridDBTableView;
    gridTopSQLDBTableView1SQL_TEXT: TcxGridDBColumn;
    gridTopSQLDBTableView1SHARABLE_MEM: TcxGridDBColumn;
    gridTopSQLDBTableView1PERSISTENT_MEM: TcxGridDBColumn;
    gridTopSQLDBTableView1RUNTIME_MEM: TcxGridDBColumn;
    gridTopSQLDBTableView1SORTS: TcxGridDBColumn;
    gridTopSQLDBTableView1EXECUTIONS: TcxGridDBColumn;
    gridTopSQLDBTableView1FIRST_LOAD_TIME: TcxGridDBColumn;
    gridTopSQLDBTableView1INVALIDATIONS: TcxGridDBColumn;
    gridTopSQLDBTableView1PARSE_CALLS: TcxGridDBColumn;
    gridTopSQLDBTableView1DISK_READS: TcxGridDBColumn;
    gridTopSQLDBTableView1BUFFER_GETS: TcxGridDBColumn;
    gridTopSQLDBTableView1ROWS_PROCESSED: TcxGridDBColumn;
    gridTopSQLDBTableView1BUFFER_GETS_PER_EXECUTIONS: TcxGridDBColumn;
    gridTopSQLDBTableView1DISK_READS_PER_EXECUTIONS: TcxGridDBColumn;
    gridTopSQLDBTableView1ROWS_PROCESSED_PER_EXECUTIONS: TcxGridDBColumn;
    gridTopSQLDBTableView1HIT_RATIO: TcxGridDBColumn;
    lblTopSQLLastRefreshed: TdxBarStatic;
    lblTopSegmentLastRefreshed: TdxBarStatic;
    lblTopSessionLastRefreshed: TdxBarStatic;
    cxGrid3: TcxGrid;
    gridDBBufferPool: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    qBufferPool: TOraQuery;
    dsBufferPool: TDataSource;
    qBufferPoolID: TFloatField;
    qBufferPoolNAME: TStringField;
    qBufferPoolBLOCK_SIZE: TFloatField;
    qBufferPoolRESIZE_STATE: TStringField;
    qBufferPoolCURRENT_SIZE: TFloatField;
    qBufferPoolBUFFERS: TFloatField;
    qBufferPoolTARGET_SIZE: TFloatField;
    qBufferPoolTARGET_BUFFERS: TFloatField;
    qBufferPoolPREV_SIZE: TFloatField;
    qBufferPoolPREV_BUFFERS: TFloatField;
    gridDBBufferPoolID: TcxGridDBColumn;
    gridDBBufferPoolNAME: TcxGridDBColumn;
    gridDBBufferPoolBLOCK_SIZE: TcxGridDBColumn;
    gridDBBufferPoolRESIZE_STATE: TcxGridDBColumn;
    gridDBBufferPoolCURRENT_SIZE: TcxGridDBColumn;
    gridDBBufferPoolBUFFERS: TcxGridDBColumn;
    gridDBBufferPoolTARGET_SIZE: TcxGridDBColumn;
    gridDBBufferPoolTARGET_BUFFERS: TcxGridDBColumn;
    gridDBBufferPoolPREV_SIZE: TcxGridDBColumn;
    gridDBBufferPoolPREV_BUFFERS: TcxGridDBColumn;
    lvBufferPool: TcxListView;
    cxSplitter6: TcxSplitter;
    qBufferWait: TOraQuery;
    dsBufferWait: TDataSource;
    cxGrid4: TcxGrid;
    cxGridDBChartView2: TcxGridDBChartView;
    cxGridDBChartDataGroup2: TcxGridDBChartDataGroup;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cxGridLevel5: TcxGridLevel;
    qBufferWaitCLASS: TStringField;
    qBufferWaitCOUNT: TFloatField;
    qBufferWaitTIME: TFloatField;
    cxGridDBTableView2CLASS: TcxGridDBColumn;
    cxGridDBTableView2COUNT: TcxGridDBColumn;
    cxGridDBTableView2TIME: TcxGridDBColumn;
    cxGridDBChartView2Series1: TcxGridDBChartSeries;
    cxGrid5: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    qPGAAdvice: TOraQuery;
    dsPGAAdvice: TDataSource;
    qPGAAdvicePGA_TARGET_FOR_ESTIMATE: TFloatField;
    qPGAAdvicePGA_TARGET_FACTOR: TStringField;
    qPGAAdviceBYTES_PROCESSED: TFloatField;
    qPGAAdviceESTD_EXTRA_BYTES_RW: TFloatField;
    qPGAAdviceESTD_PGA_CACHE_HIT_PERCENTAGE: TStringField;
    qPGAAdviceESTD_OVERALLOC_COUNT: TFloatField;
    cxGridDBTableView3PGA_TARGET_FOR_ESTIMATE: TcxGridDBColumn;
    cxGridDBTableView3PGA_TARGET_FACTOR: TcxGridDBColumn;
    cxGridDBTableView3BYTES_PROCESSED: TcxGridDBColumn;
    cxGridDBTableView3ESTD_EXTRA_BYTES_RW: TcxGridDBColumn;
    cxGridDBTableView3ESTD_PGA_CACHE_HIT_PERCENTAGE: TcxGridDBColumn;
    cxGridDBTableView3ESTD_OVERALLOC_COUNT: TcxGridDBColumn;
    cxGrid6: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel7: TcxGridLevel;
    qPGAStat: TOraQuery;
    dsPGAStat: TDataSource;
    qPGAStatNAME: TStringField;
    qPGAStatVALUE: TFloatField;
    qPGAStatUNIT: TStringField;
    cxGridDBTableView4NAME: TcxGridDBColumn;
    cxGridDBTableView4VALUE: TcxGridDBColumn;
    cxGridDBTableView4UNIT: TcxGridDBColumn;
    qSharedPoolAdvice: TOraQuery;
    dsSharedPoolAdvice: TDataSource;
    cxGrid7: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel8: TcxGridLevel;
    qSharedPoolAdviceSHARED_POOL_SIZE_FOR_ESTIMATE: TFloatField;
    qSharedPoolAdviceSHARED_POOL_SIZE_FACTOR: TFloatField;
    qSharedPoolAdviceESTD_LC_SIZE: TFloatField;
    qSharedPoolAdviceESTD_LC_MEMORY_OBJECTS: TFloatField;
    qSharedPoolAdviceESTD_LC_TIME_SAVED: TFloatField;
    qSharedPoolAdviceESTD_LC_TIME_SAVED_FACTOR: TFloatField;
    qSharedPoolAdviceESTD_LC_MEMORY_OBJECT_HITS: TFloatField;
    cxGridDBTableView5SHARED_POOL_SIZE_FOR_ESTIMATE: TcxGridDBColumn;
    cxGridDBTableView5SHARED_POOL_SIZE_FACTOR: TcxGridDBColumn;
    cxGridDBTableView5ESTD_LC_SIZE: TcxGridDBColumn;
    cxGridDBTableView5ESTD_LC_MEMORY_OBJECTS: TcxGridDBColumn;
    cxGridDBTableView5ESTD_LC_TIME_SAVED: TcxGridDBColumn;
    cxGridDBTableView5ESTD_LC_TIME_SAVED_FACTOR: TcxGridDBColumn;
    cxGridDBTableView5ESTD_LC_MEMORY_OBJECT_HITS: TcxGridDBColumn;
    tsDataCacheAdvice: TcxTabSheet;
    cxGrid8: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridLevel9: TcxGridLevel;
    qDataCacheAdvice: TOraQuery;
    dsDataCacheAdvice: TDataSource;
    qDataCacheAdviceID: TFloatField;
    qDataCacheAdviceNAME: TStringField;
    qDataCacheAdviceBLOCK_SIZE: TFloatField;
    qDataCacheAdviceADVICE_STATUS: TStringField;
    qDataCacheAdviceSIZE_FOR_ESTIMATE: TFloatField;
    qDataCacheAdviceSIZE_FACTOR: TFloatField;
    qDataCacheAdviceBUFFERS_FOR_ESTIMATE: TFloatField;
    qDataCacheAdviceESTD_PHYSICAL_READ_FACTOR: TFloatField;
    qDataCacheAdviceESTD_PHYSICAL_READS: TFloatField;
    cxGridDBTableView6ID: TcxGridDBColumn;
    cxGridDBTableView6NAME: TcxGridDBColumn;
    cxGridDBTableView6BLOCK_SIZE: TcxGridDBColumn;
    cxGridDBTableView6ADVICE_STATUS: TcxGridDBColumn;
    cxGridDBTableView6SIZE_FOR_ESTIMATE: TcxGridDBColumn;
    cxGridDBTableView6SIZE_FACTOR: TcxGridDBColumn;
    cxGridDBTableView6BUFFERS_FOR_ESTIMATE: TcxGridDBColumn;
    cxGridDBTableView6ESTD_PHYSICAL_READ_FACTOR: TcxGridDBColumn;
    cxGridDBTableView6ESTD_PHYSICAL_READS: TcxGridDBColumn;
    qEvent: TOraQuery;
    dsEvent: TDataSource;
    qEventEVENT: TStringField;
    qEventTotalwaits: TFloatField;
    qEventTotaltimeouts: TFloatField;
    qEventTimewaited: TFloatField;
    qEventAveragewait: TFloatField;
    cxGrid9: TcxGrid;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridLevel10: TcxGridLevel;
    cxGridDBTableView7EVENT: TcxGridDBColumn;
    cxGridDBTableView7Totalwaits: TcxGridDBColumn;
    cxGridDBTableView7Totaltimeouts: TcxGridDBColumn;
    cxGridDBTableView7Timewaited: TcxGridDBColumn;
    cxGridDBTableView7Averagewait: TcxGridDBColumn;
    cxGrid10: TcxGrid;
    cxGridDBTableView8: TcxGridDBTableView;
    cxGridLevel11: TcxGridLevel;
    pcLock: TcxPageControl;
    cxSplitter7: TcxSplitter;
    tsLockedObjects: TcxTabSheet;
    tsLockSession: TcxTabSheet;
    tsLockSQL: TcxTabSheet;
    tsLockSQLStat: TcxTabSheet;
    tsLocksSessionStat: TcxTabSheet;
    tsLockWaits: TcxTabSheet;
    cxGrid11: TcxGrid;
    griDBLockObjects: TcxGridDBTableView;
    cxGridLevel12: TcxGridLevel;
    qLocks: TOraQuery;
    dsLocks: TDataSource;
    qLocksSID: TFloatField;
    qLocksUSERNAME: TStringField;
    qLocksSTATUS: TStringField;
    qLocksTYPE: TStringField;
    qLocksOSUSER: TStringField;
    qLocksSERVER: TStringField;
    qLocksSERIAL: TFloatField;
    qLocksSQL_ADDRESS: TVarBytesField;
    qLocksSQL_HASH_VALUE: TFloatField;
    qLocksPREV_SQL_ADDR: TVarBytesField;
    qLocksPREV_HASH_VALUE: TFloatField;
    cxGridDBTableView8SID: TcxGridDBColumn;
    cxGridDBTableView8USERNAME: TcxGridDBColumn;
    cxGridDBTableView8STATUS: TcxGridDBColumn;
    cxGridDBTableView8TYPE: TcxGridDBColumn;
    cxGridDBTableView8OSUSER: TcxGridDBColumn;
    cxGridDBTableView8SERVER: TcxGridDBColumn;
    cxGridDBTableView8SERIAL: TcxGridDBColumn;
    cxGridDBTableView8SQL_ADDRESS: TcxGridDBColumn;
    cxGridDBTableView8SQL_HASH_VALUE: TcxGridDBColumn;
    cxGridDBTableView8PREV_SQL_ADDR: TcxGridDBColumn;
    cxGridDBTableView8PREV_HASH_VALUE: TcxGridDBColumn;
    lvLockSession: TcxListView;
    griDBLockObjectsTYPE: TcxGridDBColumn;
    griDBLockObjectsCTIME: TcxGridDBColumn;
    griDBLockObjectsOBJECT_TYPE: TcxGridDBColumn;
    griDBLockObjectsOWNER: TcxGridDBColumn;
    griDBLockObjectsOBJECT_NAME: TcxGridDBColumn;
    griDBLockObjectsLOCKED_MODE: TcxGridDBColumn;
    redtWaitLockSQL: TcxDBRichEdit;
    lvLockSQLStat: TcxListView;
    lvWaitSessionStat: TcxListView;
    cxGrid12: TcxGrid;
    gridDBLockWait: TcxGridDBTableView;
    cxGridLevel13: TcxGridLevel;
    gridDBLockWaitEVENT: TcxGridDBColumn;
    gridDBLockWaitTIME_WAITED: TcxGridDBColumn;
    gridDBLockWaitTOTAL_WAITS: TcxGridDBColumn;
    gridDBLockWaitTOTAL_TIMEOUTS: TcxGridDBColumn;
    gridDBLockWaitAVERAGE_WAIT: TcxGridDBColumn;
    gridDBLockWaitMAX_WAIT: TcxGridDBColumn;
    cxGrid13: TcxGrid;
    cxGridDBTableView9: TcxGridDBTableView;
    cxGridLevel14: TcxGridLevel;
    dsLatches: TDataSource;
    qLatches: TOraQuery;
    qLatchesLATCH: TFloatField;
    qLatchesLEVEL: TFloatField;
    qLatchesNAME: TStringField;
    qLatchesWAIT_TIME: TFloatField;
    qLatchesHIT_RATE: TFloatField;
    qLatchesGETS: TFloatField;
    qLatchesMISSES: TFloatField;
    qLatchesSLEEPS: TFloatField;
    qLatchesIMMEDIATE_GETS: TFloatField;
    qLatchesIMMEDIATE_MISSES: TFloatField;
    qLatchesSPIN_GETS: TFloatField;
    qLatchesSLEEP1: TFloatField;
    qLatchesSLEEP2: TFloatField;
    qLatchesSLEEP3: TFloatField;
    qLatchesSLEEP4: TFloatField;
    cxGridDBTableView9LATCH: TcxGridDBColumn;
    cxGridDBTableView9LEVEL: TcxGridDBColumn;
    cxGridDBTableView9NAME: TcxGridDBColumn;
    cxGridDBTableView9WAIT_TIME: TcxGridDBColumn;
    cxGridDBTableView9HIT_RATE: TcxGridDBColumn;
    cxGridDBTableView9GETS: TcxGridDBColumn;
    cxGridDBTableView9MISSES: TcxGridDBColumn;
    cxGridDBTableView9SLEEPS: TcxGridDBColumn;
    cxGridDBTableView9IMMEDIATE_GETS: TcxGridDBColumn;
    cxGridDBTableView9IMMEDIATE_MISSES: TcxGridDBColumn;
    cxGridDBTableView9SPIN_GETS: TcxGridDBColumn;
    cxGridDBTableView9SLEEP1: TcxGridDBColumn;
    cxGridDBTableView9SLEEP2: TcxGridDBColumn;
    cxGridDBTableView9SLEEP3: TcxGridDBColumn;
    cxGridDBTableView9SLEEP4: TcxGridDBColumn;
    qChildLatches: TOraQuery;
    dsChildLatches: TDataSource;
    qChildLatchesNAME: TStringField;
    qChildLatchesLATCH: TFloatField;
    qChildLatchesCHILD: TFloatField;
    qChildLatchesLEVEL: TFloatField;
    qChildLatchesGETS: TFloatField;
    qChildLatchesMISSES: TFloatField;
    qChildLatchesSLEEPS: TFloatField;
    qChildLatchesIMMEDIATE_GETS: TFloatField;
    qChildLatchesIMMEDIATE_MISSES: TFloatField;
    qChildLatchesSPIN_GETS: TFloatField;
    qChildLatchesSLEEP1: TFloatField;
    qChildLatchesSLEEP2: TFloatField;
    qChildLatchesSLEEP3: TFloatField;
    qChildLatchesSLEEP4: TFloatField;
    cxGrid14: TcxGrid;
    cxGridDBTableView10: TcxGridDBTableView;
    cxGridLevel15: TcxGridLevel;
    cxGridDBTableView10NAME: TcxGridDBColumn;
    cxGridDBTableView10LATCH: TcxGridDBColumn;
    cxGridDBTableView10CHILD: TcxGridDBColumn;
    cxGridDBTableView10LEVEL: TcxGridDBColumn;
    cxGridDBTableView10GETS: TcxGridDBColumn;
    cxGridDBTableView10MISSES: TcxGridDBColumn;
    cxGridDBTableView10SLEEPS: TcxGridDBColumn;
    cxGridDBTableView10IMMEDIATE_GETS: TcxGridDBColumn;
    cxGridDBTableView10IMMEDIATE_MISSES: TcxGridDBColumn;
    cxGridDBTableView10SPIN_GETS: TcxGridDBColumn;
    cxGridDBTableView10SLEEP1: TcxGridDBColumn;
    cxGridDBTableView10SLEEP2: TcxGridDBColumn;
    cxGridDBTableView10SLEEP3: TcxGridDBColumn;
    cxGridDBTableView10SLEEP4: TcxGridDBColumn;
    cxGrid15: TcxGrid;
    cxGridDBTableView11: TcxGridDBTableView;
    cxGridLevel16: TcxGridLevel;
    qLatchHolders: TOraQuery;
    dsLatchHolders: TDataSource;
    qLatchHoldersNAME: TStringField;
    qLatchHoldersSID: TFloatField;
    qLatchHoldersSERIAL: TFloatField;
    qLatchHoldersUSERNAME: TStringField;
    qLatchHoldersOSUSER: TStringField;
    qLatchHoldersMACHINE: TStringField;
    qLatchHoldersTERMINAL: TStringField;
    qLatchHoldersPROGRAM: TStringField;
    cxGridDBTableView11NAME: TcxGridDBColumn;
    cxGridDBTableView11SID: TcxGridDBColumn;
    cxGridDBTableView11SERIAL: TcxGridDBColumn;
    cxGridDBTableView11USERNAME: TcxGridDBColumn;
    cxGridDBTableView11OSUSER: TcxGridDBColumn;
    cxGridDBTableView11MACHINE: TcxGridDBColumn;
    cxGridDBTableView11TERMINAL: TcxGridDBColumn;
    cxGridDBTableView11PROGRAM: TcxGridDBColumn;
    cxGrid16: TcxGrid;
    cxGridDBTableView12: TcxGridDBTableView;
    cxGridLevel17: TcxGridLevel;
    qTablespace: TOraQuery;
    dsTablespace: TDataSource;
    qTablespaceTABLESPACE_NAME: TStringField;
    qTablespaceBYTES: TFloatField;
    qTablespaceMAXBYTES: TFloatField;
    qTablespaceBYTES_FREE: TFloatField;
    qTablespaceTABLESPACE_TYPE: TStringField;
    qTablespaceSTATUS: TStringField;
    qTablespaceCONTENTS: TStringField;
    qTablespaceLOGGING: TStringField;
    qTablespaceEXTENT_MANAGEMENT: TStringField;
    qTablespaceALLOCATION_TYPE: TStringField;
    qTablespacePERCENT_USED: TFloatField;
    cxGridDBTableView12PERCENT_USED: TcxGridDBColumn;
    cxGridDBTableView12TABLESPACE_NAME: TcxGridDBColumn;
    cxGridDBTableView12BYTES: TcxGridDBColumn;
    cxGridDBTableView12MAXBYTES: TcxGridDBColumn;
    cxGridDBTableView12BYTES_FREE: TcxGridDBColumn;
    cxGridDBTableView12TABLESPACE_TYPE: TcxGridDBColumn;
    cxGridDBTableView12STATUS: TcxGridDBColumn;
    cxGridDBTableView12CONTENTS: TcxGridDBColumn;
    cxGridDBTableView12LOGGING: TcxGridDBColumn;
    cxGridDBTableView12EXTENT_MANAGEMENT: TcxGridDBColumn;
    cxGridDBTableView12ALLOCATION_TYPE: TcxGridDBColumn;
    pcTablespace: TcxPageControl;
    cxSplitter8: TcxSplitter;
    tsTablespaceFiles: TcxTabSheet;
    tsTablespaceObject: TcxTabSheet;
    tsTablespaceQuotas: TcxTabSheet;
    cxGrid17: TcxGrid;
    gridDBTablespaceFile: TcxGridDBTableView;
    cxGridLevel18: TcxGridLevel;
    gridDBTablespaceFileFILE_NAME: TcxGridDBColumn;
    gridDBTablespaceFileBYTES: TcxGridDBColumn;
    gridDBTablespaceFileBYTES_FREE: TcxGridDBColumn;
    gridDBTablespaceFileSTATUS: TcxGridDBColumn;
    gridDBTablespaceFileBLOCKS: TcxGridDBColumn;
    gridDBTablespaceFileAUTOEXTENSIBLE: TcxGridDBColumn;
    gridDBTablespaceFileINCREMENT_BY: TcxGridDBColumn;
    gridDBTablespaceFileMAXBYTES: TcxGridDBColumn;
    gridDBTablespaceFileMAXBLOCKS: TcxGridDBColumn;
    cxGrid18: TcxGrid;
    gridDBTablespaceObject: TcxGridDBTableView;
    cxGridLevel19: TcxGridLevel;
    gridDBTablespaceObjectOWNER: TcxGridDBColumn;
    gridDBTablespaceObjectOBJECTNAME: TcxGridDBColumn;
    gridDBTablespaceObjectOBJECT_TYPE: TcxGridDBColumn;
    gridDBTablespaceObjectOBJECT_SIZE: TcxGridDBColumn;
    gridDBTablespaceObjectINITIAL_EX: TcxGridDBColumn;
    gridDBTablespaceObjectNEXT_EX: TcxGridDBColumn;
    gridDBTablespaceObjectEXTENTS: TcxGridDBColumn;
    gridDBTablespaceObjectTTLSIZE: TcxGridDBColumn;
    gridDBTablespaceObjectMAX_EXTENTS: TcxGridDBColumn;
    cxGrid19: TcxGrid;
    gridDBQuotas: TcxGridDBTableView;
    cxGridLevel20: TcxGridLevel;
    gridDBQuotasUSERNAME: TcxGridDBColumn;
    gridDBQuotasDECODEMAX_BYTES1UNLIMITEDMAX_BYTES1024: TcxGridDBColumn;
    gridDBQuotasBYTES1024: TcxGridDBColumn;
    gridDBQuotasDECODEMAX_BYTES1000ROUNDBYTESMAX_BYTES1002: TcxGridDBColumn;
    cxGrid20: TcxGrid;
    cxGridDBTableView13: TcxGridDBTableView;
    cxGridLevel21: TcxGridLevel;
    qIOFiles: TOraQuery;
    dsIOFiles: TDataSource;
    qIOFilesFILE: TFloatField;
    qIOFilesNAME: TStringField;
    qIOFilesPHYRDS: TFloatField;
    qIOFilesPHYWRTS: TFloatField;
    qIOFilesPHYBLKRD: TFloatField;
    qIOFilesPHYBLKWRT: TFloatField;
    qIOFilesSINGLEBLKRDS: TFloatField;
    qIOFilesREADTIM: TFloatField;
    qIOFilesWRITETIM: TFloatField;
    qIOFilesSINGLEBLKRDTIM: TFloatField;
    qIOFilesAVGIOTIM: TFloatField;
    qIOFilesLSTIOTIM: TFloatField;
    qIOFilesMINIOTIM: TFloatField;
    qIOFilesMAXIORTM: TFloatField;
    qIOFilesMAXIOWTM: TFloatField;
    cxGridDBTableView13FILE: TcxGridDBColumn;
    cxGridDBTableView13NAME: TcxGridDBColumn;
    cxGridDBTableView13PHYRDS: TcxGridDBColumn;
    cxGridDBTableView13PHYWRTS: TcxGridDBColumn;
    cxGridDBTableView13PHYBLKRD: TcxGridDBColumn;
    cxGridDBTableView13PHYBLKWRT: TcxGridDBColumn;
    cxGridDBTableView13SINGLEBLKRDS: TcxGridDBColumn;
    cxGridDBTableView13READTIM: TcxGridDBColumn;
    cxGridDBTableView13WRITETIM: TcxGridDBColumn;
    cxGridDBTableView13SINGLEBLKRDTIM: TcxGridDBColumn;
    cxGridDBTableView13AVGIOTIM: TcxGridDBColumn;
    cxGridDBTableView13LSTIOTIM: TcxGridDBColumn;
    cxGridDBTableView13MINIOTIM: TcxGridDBColumn;
    cxGridDBTableView13MAXIORTM: TcxGridDBColumn;
    cxGridDBTableView13MAXIOWTM: TcxGridDBColumn;
    qSysStat: TOraQuery;
    qSysStatNAME: TStringField;
    qSysStatVALUE: TFloatField;
    qSysStatSYSDATE: TDateTimeField;
    dsConsistentChange: TDataSource;
    vtConsistentChange: TVirtualTable;
    cxGrid22: TcxGrid;
    cxGridDBTableView14: TcxGridDBTableView;
    cxGridLevel22: TcxGridLevel;
    cxSplitter9: TcxSplitter;
    pcTablespaces: TcxPageControl;
    tsTablespacesFiles: TcxTabSheet;
    tsTablespacesRollbackSegments: TcxTabSheet;
    tsTablespacesRollbackStats: TcxTabSheet;
    tsTablespacesCurrentTransaction: TcxTabSheet;
    qUndoTablespace: TOraQuery;
    qUndoTablespaceTABLESPACE_NAME: TStringField;
    qUndoTablespaceBYTES: TFloatField;
    qUndoTablespaceMAXBYTES: TFloatField;
    qUndoTablespaceBYTES_FREE: TFloatField;
    qUndoTablespaceSTATUS: TStringField;
    qUndoTablespaceTABLESPACE_TYPE: TStringField;
    qUndoTablespacePERCENT_USED: TFloatField;
    dsUndoTablespace: TDataSource;
    cxGridDBTableView14TABLESPACE_NAME: TcxGridDBColumn;
    cxGridDBTableView14BYTES: TcxGridDBColumn;
    cxGridDBTableView14MAXBYTES: TcxGridDBColumn;
    cxGridDBTableView14BYTES_FREE: TcxGridDBColumn;
    cxGridDBTableView14STATUS: TcxGridDBColumn;
    cxGridDBTableView14TABLESPACE_TYPE: TcxGridDBColumn;
    cxGridDBTableView14PERCENT_USED: TcxGridDBColumn;
    cxGrid23: TcxGrid;
    gridDBUndoTablespaceFile: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridLevel23: TcxGridLevel;
    cxGrid24: TcxGrid;
    gridDBTablespacesRollbackSegment: TcxGridDBTableView;
    cxGridLevel24: TcxGridLevel;
    gridDBTablespacesRollbackSegmentSEGMENT_ID: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentSEGMENT_NAME: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentOWNER: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentSTATUS: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentINSTANCE_NUM: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentINITIAL_EXTENT: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentNEXT_EXTENT: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentMIN_EXTENTS: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentMAX_EXTENTS: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentPCT_INCREASE: TcxGridDBColumn;
    cxGrid25: TcxGrid;
    gridDBTablespacesRollbackSegmentStat: TcxGridDBTableView;
    cxGridLevel25: TcxGridLevel;
    gridDBTablespacesRollbackSegmentStatUSN: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentStatEXTENTS: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentStatRSSIZE: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentStatWRITES: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentStatXACTS: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentStatGETS: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentStatWAITS: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentStatOPTSIZE: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentStatHWMSIZE: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentStatSHRINKS: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentStatWRAPS: TcxGridDBColumn;
    gridDBTablespacesRollbackSegmentStatEXTENDS: TcxGridDBColumn;
    cxGrid26: TcxGrid;
    gridDBTablespacesCurrentTrans: TcxGridDBTableView;
    cxGridLevel26: TcxGridLevel;
    gridDBTablespacesCurrentTransSEGMENT_NAME: TcxGridDBColumn;
    gridDBTablespacesCurrentTransXIDUSN: TcxGridDBColumn;
    gridDBTablespacesCurrentTransXACT_STATUS: TcxGridDBColumn;
    gridDBTablespacesCurrentTransSTART_TIME: TcxGridDBColumn;
    gridDBTablespacesCurrentTransUSED_UBLK: TcxGridDBColumn;
    gridDBTablespacesCurrentTransLOG_IO: TcxGridDBColumn;
    gridDBTablespacesCurrentTransPHY_IO: TcxGridDBColumn;
    gridDBTablespacesCurrentTransCR_GET: TcxGridDBColumn;
    gridDBTablespacesCurrentTransCR_CHANGE: TcxGridDBColumn;
    gridDBTablespacesCurrentTransSID: TcxGridDBColumn;
    gridDBTablespacesCurrentTransSERIAL: TcxGridDBColumn;
    gridDBTablespacesCurrentTransUSERNAME: TcxGridDBColumn;
    gridDBTablespacesCurrentTransOSUSER: TcxGridDBColumn;
    gridDBTablespacesCurrentTransMACHINE: TcxGridDBColumn;
    gridDBTablespacesCurrentTransTERMINAL: TcxGridDBColumn;
    gridDBTablespacesCurrentTransPROGRAM: TcxGridDBColumn;
    qUndoStat: TOraQuery;
    dsUndoStat: TDataSource;
    qUndoStatTHEDATE: TDateTimeField;
    qUndoStatTHEHOUR: TFloatField;
    qUndoStatSUM_UNDOBLKS: TFloatField;
    qUndoStatSUM_TNXCOUNT: TFloatField;
    qUndoStatMAX_QUERYLEN: TFloatField;
    cxGrid27Level1: TcxGridLevel;
    cxGrid27: TcxGrid;
    cxGrid27DBChartView1: TcxGridDBChartView;
    cxGrid27DBChartView1DataGroup1: TcxGridDBChartDataGroup;
    cxGrid27DBChartView1Series2: TcxGridDBChartSeries;
    cxGrid27Level2: TcxGridLevel;
    cxGrid27DBTableView1: TcxGridDBTableView;
    cxGrid27DBTableView1THEDATE: TcxGridDBColumn;
    cxGrid27DBTableView1THEHOUR: TcxGridDBColumn;
    cxGrid27DBTableView1SUM_UNDOBLKS: TcxGridDBColumn;
    cxGrid27DBTableView1SUM_TNXCOUNT: TcxGridDBColumn;
    cxGrid27DBTableView1MAX_QUERYLEN: TcxGridDBColumn;
    cxGrid21: TcxGrid;
    cxGridDBTableView15: TcxGridDBTableView;
    cxGridLevel27: TcxGridLevel;
    qRedoGroups: TOraQuery;
    dsRedoGroups: TDataSource;
    qRedoGroupsGROUP: TFloatField;
    qRedoGroupsTHREAD: TFloatField;
    qRedoGroupsSEQUENCE: TFloatField;
    qRedoGroupsBYTES: TFloatField;
    qRedoGroupsMEMBERS: TFloatField;
    qRedoGroupsARCHIVED: TStringField;
    qRedoGroupsSTATUS: TStringField;
    qRedoGroupsFIRST_CHANGE: TFloatField;
    qRedoGroupsFIRST_TIME: TDateTimeField;
    cxGridDBTableView15GROUP: TcxGridDBColumn;
    cxGridDBTableView15THREAD: TcxGridDBColumn;
    cxGridDBTableView15SEQUENCE: TcxGridDBColumn;
    cxGridDBTableView15BYTES: TcxGridDBColumn;
    cxGridDBTableView15MEMBERS: TcxGridDBColumn;
    cxGridDBTableView15ARCHIVED: TcxGridDBColumn;
    cxGridDBTableView15STATUS: TcxGridDBColumn;
    cxGridDBTableView15FIRST_CHANGE: TcxGridDBColumn;
    cxGridDBTableView15FIRST_TIME: TcxGridDBColumn;
    cxSplitter10: TcxSplitter;
    lvRedoGroups: TcxListView;
    cxGrid28: TcxGrid;
    cxGridDBTableView16: TcxGridDBTableView;
    cxGridLevel28: TcxGridLevel;
    dsLogSwitchHistory: TDataSource;
    qLogSwitchHistory: TOraQuery;
    qLogSwitchHistoryTHEYEAR: TFloatField;
    qLogSwitchHistoryTHEMONTH: TFloatField;
    qLogSwitchHistoryTHEDAY: TFloatField;
    qLogSwitchHistoryH0: TFloatField;
    qLogSwitchHistoryH1: TFloatField;
    qLogSwitchHistoryH2: TFloatField;
    qLogSwitchHistoryH3: TFloatField;
    qLogSwitchHistoryH4: TFloatField;
    qLogSwitchHistoryH5: TFloatField;
    qLogSwitchHistoryH6: TFloatField;
    qLogSwitchHistoryH7: TFloatField;
    qLogSwitchHistoryH8: TFloatField;
    qLogSwitchHistoryH9: TFloatField;
    qLogSwitchHistoryH10: TFloatField;
    qLogSwitchHistoryH11: TFloatField;
    qLogSwitchHistoryH12: TFloatField;
    qLogSwitchHistoryH13: TFloatField;
    qLogSwitchHistoryH14: TFloatField;
    qLogSwitchHistoryH15: TFloatField;
    qLogSwitchHistoryH16: TFloatField;
    qLogSwitchHistoryH17: TFloatField;
    qLogSwitchHistoryH18: TFloatField;
    qLogSwitchHistoryH19: TFloatField;
    qLogSwitchHistoryH20: TFloatField;
    qLogSwitchHistoryH21: TFloatField;
    qLogSwitchHistoryH22: TFloatField;
    qLogSwitchHistoryH23: TFloatField;
    cxGridDBTableView16THEYEAR: TcxGridDBColumn;
    cxGridDBTableView16THEMONTH: TcxGridDBColumn;
    cxGridDBTableView16THEDAY: TcxGridDBColumn;
    cxGridDBTableView16H0: TcxGridDBColumn;
    cxGridDBTableView16H1: TcxGridDBColumn;
    cxGridDBTableView16H2: TcxGridDBColumn;
    cxGridDBTableView16H3: TcxGridDBColumn;
    cxGridDBTableView16H4: TcxGridDBColumn;
    cxGridDBTableView16H5: TcxGridDBColumn;
    cxGridDBTableView16H6: TcxGridDBColumn;
    cxGridDBTableView16H7: TcxGridDBColumn;
    cxGridDBTableView16H8: TcxGridDBColumn;
    cxGridDBTableView16H9: TcxGridDBColumn;
    cxGridDBTableView16H10: TcxGridDBColumn;
    cxGridDBTableView16H11: TcxGridDBColumn;
    cxGridDBTableView16H12: TcxGridDBColumn;
    cxGridDBTableView16H13: TcxGridDBColumn;
    cxGridDBTableView16H14: TcxGridDBColumn;
    cxGridDBTableView16H15: TcxGridDBColumn;
    cxGridDBTableView16H16: TcxGridDBColumn;
    cxGridDBTableView16H17: TcxGridDBColumn;
    cxGridDBTableView16H18: TcxGridDBColumn;
    cxGridDBTableView16H19: TcxGridDBColumn;
    cxGridDBTableView16H20: TcxGridDBColumn;
    cxGridDBTableView16H21: TcxGridDBColumn;
    cxGridDBTableView16H22: TcxGridDBColumn;
    cxGridDBTableView16H23: TcxGridDBColumn;
    cxGrid29: TcxGrid;
    cxGridDBTableView17: TcxGridDBTableView;
    cxGridLevel29: TcxGridLevel;
    cxSplitter11: TcxSplitter;
    qArchivedLogs: TOraQuery;
    dsArchivedLogs: TDataSource;
    qArchivedLogsDEST_ID: TFloatField;
    qArchivedLogsSTATUS: TStringField;
    qArchivedLogsBINDING: TStringField;
    qArchivedLogsNAME_SPACE: TStringField;
    qArchivedLogsTARGET: TStringField;
    qArchivedLogsREOPEN_SECS: TFloatField;
    qArchivedLogsDESTINATION: TStringField;
    qArchivedLogsFAIL_DATE: TDateTimeField;
    qArchivedLogsFAIL_SEQUENCE: TFloatField;
    qArchivedLogsFAIL_BLOCK: TFloatField;
    qArchivedLogsERROR: TStringField;
    cxGridDBTableView17DEST_ID: TcxGridDBColumn;
    cxGridDBTableView17STATUS: TcxGridDBColumn;
    cxGridDBTableView17BINDING: TcxGridDBColumn;
    cxGridDBTableView17NAME_SPACE: TcxGridDBColumn;
    cxGridDBTableView17TARGET: TcxGridDBColumn;
    cxGridDBTableView17REOPEN_SECS: TcxGridDBColumn;
    cxGridDBTableView17DESTINATION: TcxGridDBColumn;
    cxGridDBTableView17FAIL_DATE: TcxGridDBColumn;
    cxGridDBTableView17FAIL_SEQUENCE: TcxGridDBColumn;
    cxGridDBTableView17FAIL_BLOCK: TcxGridDBColumn;
    cxGridDBTableView17ERROR: TcxGridDBColumn;
    cxGrid30: TcxGrid;
    gridDBArchivedLogDetail: TcxGridDBTableView;
    cxGridLevel30: TcxGridLevel;
    gridDBArchivedLogDetailNAME: TcxGridDBColumn;
    gridDBArchivedLogDetailTHREAD: TcxGridDBColumn;
    gridDBArchivedLogDetailSEQUENCE: TcxGridDBColumn;
    gridDBArchivedLogDetailRESETLOGS_CHANGE: TcxGridDBColumn;
    gridDBArchivedLogDetailRESETLOGS_TIME: TcxGridDBColumn;
    gridDBArchivedLogDetailFIRST_CHANGE: TcxGridDBColumn;
    gridDBArchivedLogDetailFIRST_TIME: TcxGridDBColumn;
    gridDBArchivedLogDetailNEXT_CHANGE: TcxGridDBColumn;
    gridDBArchivedLogDetailNEXT_TIME: TcxGridDBColumn;
    gridDBArchivedLogDetailBLOCKS: TcxGridDBColumn;
    gridDBArchivedLogDetailBLOCK_SIZE: TcxGridDBColumn;
    gridDBArchivedLogDetailCREATOR: TcxGridDBColumn;
    gridDBArchivedLogDetailREGISTRAR: TcxGridDBColumn;
    gridDBArchivedLogDetailSTANDBY_DEST: TcxGridDBColumn;
    gridDBArchivedLogDetailARCHIVED: TcxGridDBColumn;
    gridDBArchivedLogDetailAPPLIED: TcxGridDBColumn;
    gridDBArchivedLogDetailDELETED: TcxGridDBColumn;
    gridDBArchivedLogDetailSTATUS: TcxGridDBColumn;
    gridDBArchivedLogDetailCOMPLETION_TIME: TcxGridDBColumn;
    gridDBArchivedLogDetailDICTIONARY_BEGIN: TcxGridDBColumn;
    gridDBArchivedLogDetailDICTIONARY_END: TcxGridDBColumn;
    qTempfiles: TOraQuery;
    cxGrid31: TcxGrid;
    cxGridDBTableView18: TcxGridDBTableView;
    cxGridLevel31: TcxGridLevel;
    dsTempfiles: TDataSource;
    qTempfilesFILE: TFloatField;
    qTempfilesNAME: TStringField;
    qTempfilesPHYRDS: TFloatField;
    qTempfilesPHYWRTS: TFloatField;
    qTempfilesPHYBLKRD: TFloatField;
    qTempfilesPHYBLKWRT: TFloatField;
    qTempfilesSINGLEBLKRDS: TFloatField;
    qTempfilesREADTIM: TFloatField;
    qTempfilesWRITETIM: TFloatField;
    qTempfilesSINGLEBLKRDTIM: TFloatField;
    qTempfilesAVGIOTIM: TFloatField;
    qTempfilesLSTIOTIM: TFloatField;
    qTempfilesMINIOTIM: TFloatField;
    qTempfilesMAXIORTM: TFloatField;
    qTempfilesMAXIOWTM: TFloatField;
    cxGridDBTableView18FILE: TcxGridDBColumn;
    cxGridDBTableView18NAME: TcxGridDBColumn;
    cxGridDBTableView18PHYRDS: TcxGridDBColumn;
    cxGridDBTableView18PHYWRTS: TcxGridDBColumn;
    cxGridDBTableView18PHYBLKRD: TcxGridDBColumn;
    cxGridDBTableView18PHYBLKWRT: TcxGridDBColumn;
    cxGridDBTableView18SINGLEBLKRDS: TcxGridDBColumn;
    cxGridDBTableView18READTIM: TcxGridDBColumn;
    cxGridDBTableView18WRITETIM: TcxGridDBColumn;
    cxGridDBTableView18SINGLEBLKRDTIM: TcxGridDBColumn;
    cxGridDBTableView18AVGIOTIM: TcxGridDBColumn;
    cxGridDBTableView18LSTIOTIM: TcxGridDBColumn;
    cxGridDBTableView18MINIOTIM: TcxGridDBColumn;
    cxGridDBTableView18MAXIORTM: TcxGridDBColumn;
    cxGridDBTableView18MAXIOWTM: TcxGridDBColumn;
    dxBarDockControl1: TdxBarDockControl;
    btnSystemRefresh: TdxBarButton;
    lblSystemRefreshTime: TdxBarStatic;
    btnChangeParam: TdxBarButton;
    dxBarDockControl2: TdxBarDockControl;
    dxBarDockControl3: TdxBarDockControl;
    dxBarDockControl4: TdxBarDockControl;
    dsParameters: TDataSource;
    qParameters: TOraQuery;
    btnTopSQLRefresh: TdxBarButton;
    vtPlanTable: TVirtualTable;
    vtPlanTableID: TIntegerField;
    vtPlanTablePARENT_ID: TIntegerField;
    vtPlanTablePOSITION: TIntegerField;
    vtPlanTableOPERATION: TStringField;
    vtPlanTableOPTIONS: TStringField;
    vtPlanTableOPTIMIZER: TStringField;
    vtPlanTableOBJECT_NAME: TStringField;
    vtPlanTableCARDINALITY: TFloatField;
    vtPlanTableBYTES: TFloatField;
    vtPlanTableCOST: TFloatField;
    vtPlanTableOBJECT_NODE: TStringField;
    vtPlanTableOTHER_TAG: TStringField;
    vtPlanTableDISTRIBUTION: TStringField;
    vtPlanTablePARTITION_START: TStringField;
    vtPlanTablePARTITION_STOP: TStringField;
    vtPlanTableSTEP_NAME: TStringField;
    vtPlanTableCPU_COST: TFloatField;
    vtPlanTableIO_COST: TFloatField;
    vtPlanTableACCESS_PREDICATES: TStringField;
    vtPlanTableFILTER_PREDICATES: TStringField;
    treeListCursorExplaincxDBTreeListColumn1: TcxDBTreeListColumn;
    treeListCursorExplaincxDBTreeListColumn2: TcxDBTreeListColumn;
    treeListCursorExplaincxDBTreeListColumn3: TcxDBTreeListColumn;
    treeListCursorExplaincxDBTreeListColumn4: TcxDBTreeListColumn;
    lvSQLStat: TcxListView;
    btnTopSegmentRefresh: TdxBarButton;
    btnTopSessionRefresh: TdxBarButton;
    dxBarDockControl5: TdxBarDockControl;
    btnRefreshMemory: TdxBarButton;
    dxBarDockControl6: TdxBarDockControl;
    btnWaitRefresh: TdxBarButton;
    lblWaitLastRefreshed: TdxBarStatic;
    lblMemoryLastRefreshed: TdxBarStatic;
    dxBarDockControl7: TdxBarDockControl;
    btnStorageRefresh: TdxBarButton;
    lblStorageLastRefreshed: TdxBarStatic;
    tsControlFiles: TcxTabSheet;
    qControlFiles: TOraQuery;
    qControlFileStatistic: TOraQuery;
    dsControlFiles: TDataSource;
    dsControlFileStatistic: TDataSource;
    pcControlFiles: TcxPageControl;
    tsControlFile: TcxTabSheet;
    cxGrid33: TcxGrid;
    cxGridDBTableView20: TcxGridDBTableView;
    cxGridLevel33: TcxGridLevel;
    cxSplitter12: TcxSplitter;
    cxGrid34: TcxGrid;
    cxGridDBTableView21: TcxGridDBTableView;
    cxGridLevel34: TcxGridLevel;
    qControlFilesSTATUS: TStringField;
    qControlFilesNAME: TStringField;
    cxGridDBTableView20STATUS: TcxGridDBColumn;
    cxGridDBTableView20NAME: TcxGridDBColumn;
    qControlFileStatisticINITCAPTYPE: TStringField;
    qControlFileStatisticRECORD_SIZE: TFloatField;
    qControlFileStatisticRECORDS_TOTAL: TFloatField;
    qControlFileStatisticRECORDS_USED: TFloatField;
    qControlFileStatisticUsed: TFloatField;
    qControlFileStatisticFree: TFloatField;
    cxGridDBTableView21INITCAPTYPE: TcxGridDBColumn;
    cxGridDBTableView21RECORD_SIZE: TcxGridDBColumn;
    cxGridDBTableView21RECORDS_TOTAL: TcxGridDBColumn;
    cxGridDBTableView21RECORDS_USED: TcxGridDBColumn;
    cxGridDBTableView21Used: TcxGridDBColumn;
    cxGridDBTableView21Free: TcxGridDBColumn;
    dxBarDockControl8: TdxBarDockControl;
    btnIORefresh: TdxBarButton;
    lblIORefreshedTime: TdxBarStatic;
    dxBarDockControl9: TdxBarDockControl;
    btnUndoRefresh: TdxBarButton;
    lblUndoLastRefresh: TdxBarStatic;
    dxBarDockControl10: TdxBarDockControl;
    btnRedoRefresh: TdxBarButton;
    lblRedoLastRefreshed: TdxBarStatic;
    dxBarDockControl11: TdxBarDockControl;
    btnTempRefresh: TdxBarButton;
    lblTempLastRefresh: TdxBarStatic;
    dxBarDockControl12: TdxBarDockControl;
    btnControlRefresh: TdxBarButton;
    lblControlLastRefreshed: TdxBarStatic;
    cxGrid35: TcxGrid;
    cxGridDBTableView22: TcxGridDBTableView;
    cxGridLevel35: TcxGridLevel;
    qSGAStats: TOraQuery;
    dsSGAStats: TDataSource;
    qSGAStatsPOOL: TStringField;
    qSGAStatsNAME: TStringField;
    qSGAStatsBYTES: TFloatField;
    cxGridDBTableView22POOL: TcxGridDBColumn;
    cxGridDBTableView22NAME: TcxGridDBColumn;
    cxGridDBTableView22BYTES: TcxGridDBColumn;
    cxGrid16DBChartView1: TcxGridDBChartView;
    cxGrid16Level1: TcxGridLevel;
    cxGrid16DBChartView1DataGroup1: TcxGridDBChartDataGroup;
    cxGrid16DBChartView1Series1: TcxGridDBChartSeries;
    cxGrid16DBChartView1Series2: TcxGridDBChartSeries;
    tsTablespaceFragmentation: TcxTabSheet;
    tsTablespaceObjects: TcxTabSheet;
    qFragmentations: TOraQuery;
    dsFragmentations: TDataSource;
    qFragmentationsTABLESPACE_NAME: TStringField;
    qFragmentationsFRAGMENTATION_INDEX: TFloatField;
    qFragmentationsFREE_CHUNKS: TFloatField;
    qFragmentationsLARGEST_CHUNK: TFloatField;
    cxGrid32: TcxGrid;
    cxGridDBTableView19: TcxGridDBTableView;
    cxGridLevel32: TcxGridLevel;
    cxGridDBTableView19TABLESPACE_NAME: TcxGridDBColumn;
    cxGridDBTableView19FRAGMENTATION_INDEX: TcxGridDBColumn;
    cxGridDBTableView19FREE_CHUNKS: TcxGridDBColumn;
    cxGridDBTableView19LARGEST_CHUNK: TcxGridDBColumn;
    qTablespaceObject: TOraQuery;
    dsTablespaceObject: TDataSource;
    cxGrid36: TcxGrid;
    cxGridDBTableView23: TcxGridDBTableView;
    cxGridLevel36: TcxGridLevel;
    qTablespaceObjectTABLESPACE_NAME: TStringField;
    qTablespaceObjectTABLE_MB: TFloatField;
    qTablespaceObjectINDEX_MB: TFloatField;
    qTablespaceObjectCLUSTER_MB: TFloatField;
    qTablespaceObjectROLLBACK_MB: TFloatField;
    qTablespaceObjectLOB_MB: TFloatField;
    cxGridDBTableView23TABLESPACE_NAME: TcxGridDBColumn;
    cxGridDBTableView23TABLE_MB: TcxGridDBColumn;
    cxGridDBTableView23INDEX_MB: TcxGridDBColumn;
    cxGridDBTableView23CLUSTER_MB: TcxGridDBColumn;
    cxGridDBTableView23ROLLBACK_MB: TcxGridDBColumn;
    cxGridDBTableView23LOB_MB: TcxGridDBColumn;
    procedure pcMainPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure pcSystemPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcTopPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure qTopSQLAfterScroll(DataSet: TDataSet);
    procedure pcTopSQLPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure qTopSegmentAfterScroll(DataSet: TDataSet);
    procedure icShowToSessionByChange(Sender: TObject);
    procedure icShowTopSessionsChange(Sender: TObject);
    procedure icSortSegmentByChange(Sender: TObject);
    procedure btnShowTopSegmentChange(Sender: TObject);
    procedure cxGridDBChartView1ValueClick(Sender: TcxGridChartView;
      ASeries: TcxGridChartSeries; AValueIndex: Integer;
      var AHandled: Boolean);
    procedure icTopSQLTopChange(Sender: TObject);
    procedure icTopSQLSortByChange(Sender: TObject);
    procedure pcMemoryPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure qBufferPoolAfterScroll(DataSet: TDataSet);
    procedure pcWaitsPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure pcLockPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure qLocksAfterScroll(DataSet: TDataSet);
    procedure pcStoragePageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure pcTablespacePageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure qTablespaceAfterScroll(DataSet: TDataSet);
    procedure pcIOPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure pcUndoPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure qUndoTablespaceAfterScroll(DataSet: TDataSet);
    procedure pcTablespacesPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure pcRedoPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure qRedoGroupsAfterScroll(DataSet: TDataSet);
    procedure qArchivedLogsAfterScroll(DataSet: TDataSet);
    procedure pcTempPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure btnSystemRefreshClick(Sender: TObject);
    procedure btnChangeParamClick(Sender: TObject);
    procedure qParametersAfterScroll(DataSet: TDataSet);
    procedure lviewNLSSessionClick(Sender: TObject);
    procedure lviewNLSInstanceClick(Sender: TObject);
    procedure lviewNLSDatabaseClick(Sender: TObject);
    procedure btnTopSQLRefreshClick(Sender: TObject);
    procedure btnTopSegmentRefreshClick(Sender: TObject);
    procedure btnTopSessionRefreshClick(Sender: TObject);
    procedure btnRefreshMemoryClick(Sender: TObject);
    procedure btnWaitRefreshClick(Sender: TObject);
    procedure btnStorageRefreshClick(Sender: TObject);
    procedure pcControlFilesPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure btnIORefreshClick(Sender: TObject);
    procedure btnUndoRefreshClick(Sender: TObject);
    procedure btnRedoRefreshClick(Sender: TObject);
    procedure btnTempRefreshClick(Sender: TObject);
    procedure btnControlRefreshClick(Sender: TObject);
    procedure cxGrid16DBChartView1ValueClick(Sender: TcxGridChartView;
      ASeries: TcxGridChartSeries; AValueIndex: Integer;
      var AHandled: Boolean);
  private
    { Private declarations }

    FOraSession: TOraSession;
    FBarConnection : TBarConnection;
    a: boolean;
    FBarConnName   : string;
    
    procedure CloseAllDataset;
    procedure FillViewHorizontal(ViewName: TcxListView; SQLText: string; OraParams: TOraParams);
    procedure FillViewVertical(ViewName: TcxListView; SQLText: string; Field1No, Field2No: integer; const OraParams: TOraParams);
    procedure GetSystemParameters;
    procedure GetSystemInstance;
    procedure GetSystemOption;
    procedure GetSystemDatabase;
    procedure GetSystemVersion;
    procedure GetSystemLicense;
    procedure GetSystemNLSDatabase;
    procedure GetSystemNLSInstance;
    procedure GetSystemNLSSession;
    procedure GetSystemStatistics;

    procedure ExplainPlan(SQL: string);
    procedure GetTopTopSQL;
    procedure GetTopTopSegments;
    procedure GetTopTopSessions;

    procedure GetBufferPool;
    procedure GetBufferWaitStats;
    procedure GetPGAAdvice;
    procedure GetPGAstat;
    procedure GetSharedPoolAdvice;
    procedure GetDataCacheAdvice;

    procedure GetEvents;
    procedure GetLocks;
    procedure GetLockDetail;
    procedure GetLockSession;
    procedure GetLockSQL;
    procedure GetLockSQLStat;
    procedure GetLockSessionStat;
    procedure GetLockWaits;
    procedure GetLatches;
    procedure GetChildLatches;
    procedure GetLatchHolders;

    procedure GetTablespace;
    procedure GetTablespaceFiles;
    procedure GetTablespaceObjects;
    procedure GetTablespaceQuotas;
    procedure GetTablespaceFragmentation;
    procedure GetTablespaceObjectTotal;

    procedure GetFiles;
    procedure GetSGAStat;

    procedure GetTablespaces;
    procedure GetTablespacesFiles;
    procedure GetTablespacesRollbackSegment;
    procedure GetTablespacesRollbackSegmentStat;
    procedure GetTablespacesCurrentTrans;
    procedure GetUndoStats;

    procedure GetGroups;
    procedure GetLogSwitchHistory;
    procedure GetArchiedLogs;

    procedure GetTempFile;

    procedure GetControlFile;

  public
    { Public declarations }
    procedure Init(ABarConnection : TBarConnection);
    property BarConnName: String read FBarConnName write FBarConnName;
  end;

var
  DBAfrm: TDBAfrm;

implementation

uses frmMain, DBQuery, OraSessions, util, OraDBA, frmDBASystemParameters, VisualOptions;

{$R *.dfm}

procedure TDBAfrm.Init(ABarConnection : TBarConnection);
begin
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FBarConnection := ABarConnection;
  FOraSession := ABarConnection.Session;
  FBarConnName := ABarConnection.Name;

  Caption := FBarConnection.Session.Server+'/'+FBarConnection.Session.UserName+' - '+'DBA Browser';
  statusBar.Panels[0].Text := FBarConnection.Session.Server+'/'+FBarConnection.Session.UserName;
  MainFrm.dxBarListWindows.Items.AddObject(Caption, Self);
  pcMain.ActivePage := tsSystem;

  qTemp.Session := FOraSession;
  qDetail.Session := FOraSession;

  qParameters.Session := FOraSession;

  qTopSQL.Session := FOraSession;
  qTopSegment.Session := FOraSession;
  qTopSession.Session := FOraSession;

  qBufferPool.Session := FOraSession;
  qBufferWait.Session := FOraSession;
  qPGAAdvice.Session := FOraSession;
  qPGAStat.Session := FOraSession;
  qSharedPoolAdvice.Session := FOraSession;
  qDataCacheAdvice.Session := FOraSession;

  qEvent.Session := FOraSession;
  qLocks.Session := FOraSession;
  qLatches.Session := FOraSession;
  qChildLatches.Session := FOraSession;
  qLatchHolders.Session := FOraSession;

  qTablespace.Session := FOraSession;
  qFragmentations.Session := FOraSession;
  qTablespaceObject.Session := FOraSession;

  qIOFiles.Session := FOraSession;
  qSGAStats.Session := FOraSession;

  qUndoTablespace.Session := FOraSession;
  qUndoStat.Session := FOraSession;

  qRedoGroups.Session := FOraSession;
  qLogSwitchHistory.Session := FOraSession;
  qArchivedLogs.Session := FOraSession;

  qTempfiles.Session := FOraSession;
  
  pcMainPageChanging(self,pcMain.ActivePage, a);
end;

procedure TDBAfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseAllDataset;
  with MainFrm.dxBarListWindows.Items do
       Delete(IndexOfObject(Self));
  action := caFree;
end;

procedure TDBAfrm.CloseAllDataset;
var
  Temp: TComponent;
  i: integer;
begin
  for I := ComponentCount - 1 downto 0 do
  begin
    Temp := Components[I];
    if (Temp is TOraQuery) then
      TOraQuery(Temp).Close;
    if (Temp is TVirtualTable) then
      TVirtualTable(Temp).Close;
  end;
end;

{
function TDBAfrm.ExecSQL(SQL: string): string;
var
  e: string;
begin
  e := mainFrm.ExecSQL(nil,SQL);
  if e = '' then
    statusBar.Panels[2].Text := 'System altered at '+DateTimeToStr(now)
  else
    statusBar.Panels[2].Text := e;
end;
}

procedure TDBAfrm.FillViewHorizontal(ViewName: TcxListView; SQLText: string; OraParams: TOraParams);
var
  i: integer;
begin
  qTemp.close;
  qTemp.SQL.Text := SQLText;
  qTemp.Prepare;

  if OraParams <> nil then
     qTemp.Params.AssignValues(OraParams);

  qTemp.Open;
  ViewName.Items.Clear;
  for i := 0 to qTemp.FieldCount -1 do
  begin
    with ViewName.Items.Add do
    begin
      Caption := qTemp.Fields[i].FieldName;
      ImageIndex := -1;
    end;
    ViewName.Items[ViewName.Items.count-1].SubItems.Add(qTemp.Fields[i].Text);
  end;
  qTemp.close;
end;

procedure TDBAfrm.FillViewVertical(ViewName: TcxListView; SQLText: string;
                                   Field1No, Field2No: integer;
                                   const OraParams: TOraParams);
var
  i: integer;
begin
  qTemp.close;
  qTemp.SQL.Text := SQLText;
  qTemp.Prepare;

  if OraParams <> nil then
  begin
     for i := 0 to OraParams.Count - 1 do
         qTemp.Params[i].Value := OraParams[i].Value;
  end;

  qTemp.Open;
  ViewName.Items.Clear;
  while not qTemp.Eof do
  begin
    with ViewName.Items.Add do
    begin
      Caption := qTemp.Fields[Field1No-1].Text;
      ImageIndex := -1;
    end;
    if Field2No-1 > 0 then
       ViewName.Items[ViewName.Items.count-1].SubItems.Add(qTemp.Fields[Field2No-1].Text);
    qTemp.Next;
  end;
  qTemp.close;
end;


procedure TDBAfrm.pcMainPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
  CloseAllDataset;
  if NewPage = tsSystem then pcSystemPageChanging(self, pcSystem.ActivePage ,a);
  if NewPage = tsTop then pcTopPageChanging(self, pcTop.ActivePage ,a);
  if NewPage = tsMemory then pcMemoryPageChanging(self, pcMemory.ActivePage ,a);
  if NewPage = tsWaits then pcWaitsPageChanging(self, pcWaits.ActivePage, a);
  if NewPage = tsStorage then pcStoragePageChanging(self, pcStorage.ActivePage, a);
  if NewPage = tsIO then pcIOPageChanging(self, pcIO.ActivePage, a);
  if NewPage = tsUndo then pcUndoPageChanging(self, pcUndo.ActivePage, a);
  if NewPage = tsRedo then pcRedoPageChanging(self, pcRedo.ActivePage, a);
  if NewPage = tsTemp then pcTempPageChanging(self, pcTemp.ActivePage, a);
  if NewPage = tsControlFiles then pcControlFilesPageChanging(self, pcControlFiles.ActivePage, a);
end;  //pcMainPageChanging




{*******************************************************************************}
{                          S Y S T E M                                          }
{*******************************************************************************}

procedure TDBAfrm.pcSystemPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  qTemp.close;
  btnChangeParam.Enabled := (NewPage = tsParameters) or (NewPage = tsNLSParameters);
  if NewPage = tsParameters then GetSystemParameters;
  if NewPage = tsInstance then GetSystemInstance;
  if NewPage = tsOptions then GetSystemOption;
  if NewPage = tsDatabase then GetSystemDatabase;
  if NewPage = tsVersion then GetSystemVersion;
  if NewPage = tsVersion then GetSystemLicense;
  if NewPage = tsNLSParameters then GetSystemNLSDatabase;
  if NewPage = tsNLSParameters then GetSystemNLSInstance;
  if NewPage = tsNLSParameters then GetSystemNLSSession;
  if NewPage = tsSystemStatistics then GetSystemStatistics;
  lblSystemRefreshTime.Caption := 'Last refreshed at  '+ DateTimeToStr(Now);  
end;

procedure TDBAfrm.btnSystemRefreshClick(Sender: TObject);
begin
  pcSystemPageChanging(self, pcSystem.ActivePage ,a);
end;

//-----------------------------System Paramters--------------------------------//
procedure TDBAfrm.btnChangeParamClick(Sender: TObject);
var
  i: integer;
begin
  if pcSystem.ActivePage = tsParameters then
  begin
    DBASystemParametersFrm.Init(1,
                                qParameters.FieldByName('NAME').AsString,
                                qParameters.FieldByName('VALUE').AsString,
                                qParameters.FieldByName('VALUE').AsString,
                                '',
                                qParameters.FieldByName('SES_MODIFIABLE').AsString,
                                qParameters.FieldByName('SYS_MODIFIABLE').AsString,
                                FOraSession);
    GetSystemParameters;
  end;

  if pcSystem.ActivePage = tsNLSParameters then
  begin
    for i := 0 to lviewNLSSession.Items.Count - 1 do
    begin
      if lviewNLSSession.Items[i].Selected then
      begin
        DBASystemParametersFrm.Init(2,
                                    lviewNLSSession.Items[i].Caption,
                                    lviewNLSSession.Items[i].SubItems.Text,
                                    lviewNLSSession.Items[i].SubItems.Text,
                                    '','','',
                                    FOraSession);
      end;
    end;
    GetSystemNLSSession;
  end;
end;

procedure TDBAfrm.GetSystemParameters;
var
  bm: TBookmark;
begin
  with qParameters do
  begin
    bm := GetBookmark;
    try
      close;
      SQL.Text := GetParameters;
      Open;
      GotoBookmark(bm);
    finally
      FreeBookmark(bm);
    end;
  end;
end;

procedure TDBAfrm.qParametersAfterScroll(DataSet: TDataSet);
begin
  btnChangeParam.Enabled := (qParameters.FieldByName('SES_MODIFIABLE').AsString = 'YES') or  (qParameters.FieldByName('SYS_MODIFIABLE').AsString = 'YES');
end;


procedure TDBAfrm.GetSystemInstance;
begin
  FillViewHorizontal(lviewInstance, GetInstance, nil);
end;

procedure TDBAfrm.GetSystemOption;
begin
  FillViewVertical(lviewOption, GetOption,1,2,nil);
end;

procedure TDBAfrm.GetSystemDatabase;
begin
  FillViewHorizontal(lviewDatabase, GetDatabase, nil);
end;

procedure TDBAfrm.GetSystemVersion;
begin
  FillViewVertical(lviewVersion, GetVersion,1,0,nil);
end;

procedure TDBAfrm.GetSystemLicense;
begin
  FillViewHorizontal(lviewLicense, GetLicense, nil);
end;

procedure TDBAfrm.GetSystemNLSDatabase;
begin
  FillViewVertical(lviewNLSDatabase, GetNLSDatabase,1,2,nil);
end;

procedure TDBAfrm.GetSystemNLSInstance;
begin
  FillViewVertical(lviewNLSInstance, GetNLSInstance,1,2,nil);
end;

procedure TDBAfrm.GetSystemNLSSession;
begin
  FillViewVertical(lviewNLSSession, GetNLSSession,1,2,nil);
end;

procedure TDBAfrm.lviewNLSSessionClick(Sender: TObject);
begin
  btnChangeParam.Enabled := true;
end;

procedure TDBAfrm.lviewNLSInstanceClick(Sender: TObject);
begin
  btnChangeParam.Enabled := false;
end;

procedure TDBAfrm.lviewNLSDatabaseClick(Sender: TObject);
begin
  btnChangeParam.Enabled := false;
end;

procedure TDBAfrm.GetSystemStatistics;
begin
  qTemp.close;
  qTemp.SQL.Text := GetSysstat;
  qTemp.Open;
  gridDBStatistics.DataController.DataSource := dsTemp;
end;

{*******************************************************************************}
{                                T O P                                          }
{*******************************************************************************}

procedure TDBAfrm.pcTopPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
  qTopSQL.close;
  qTopSegment.Close;
  qTopSession.close;
  if NewPage = tsTopSql then GetTopTopSQL;
  if NewPage = tsTopSegments then GetTopTopSegments;
  if NewPage = tsTopSessions then GetTopTopSessions;
end;

//--------------------------------Top SQL -------------------------------------//

procedure TDBAfrm.GetTopTopSQL;
begin
  qTopSQL.Tag := 99;
  qTopSQL.close;
  qTopSQL.SQL.Text := GetTopSQL(icTopSQLSortBy.Text);
  qTopSQL.ParamByName('row1').AsInteger := StrToInt(icTopSQLTop.Text);
  qTopSQL.Prepare;
  qTopSQL.Open;
  qTopSQL.Tag := 0;
  qTopSQLAfterScroll(nil);
  lblTopSQLLastRefreshed.Caption := 'Last refreshed at '+DateTimeToStr(Now);
end;

procedure TDBAfrm.btnTopSQLRefreshClick(Sender: TObject);
begin
  GetTopTopSQL;
end;

procedure TDBAfrm.icTopSQLTopChange(Sender: TObject);
begin
  GetTopTopSQL;
end;

procedure TDBAfrm.icTopSQLSortByChange(Sender: TObject);
begin
  GetTopTopSQL;
end;

procedure TDBAfrm.qTopSQLAfterScroll(DataSet: TDataSet);
begin
  if not qTopSQL.Active then exit;
  if qTopSQL.Tag = 99 then exit;

  pcTopSQLPageChanging(self, pcTopSQL.ActivePage, a);

  redtTopSQL.Text := qTopSQL.Fields[0].AsString;
end;

procedure TDBAfrm.pcTopSQLPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
var
  i: integer;
  p: TOraParams;
begin
  if NewPage = tsTopSQLInformation then
  begin
    lviewTopSQLInformation.Items.Clear;
    for i := 1 to qTopSQL.FieldCount -1 do
    begin
      with lviewTopSQLInformation.Items.Add do
      begin
        Caption := qTopSQL.Fields[i].FieldName;
        ImageIndex := -1;
      end;
      lviewTopSQLInformation.Items[lviewTopSQLInformation.Items.count-1].SubItems.Add(qTopSQL.Fields[i].Text);
    end;
  end;

  if NewPage = tsTopSQLExplainPlan then
  begin
     try
       ExplainPlan(qTopSQL.Fields[0].AsString);
     except
     end;  
  end;

  if NewPage = tsTopSQLStats then
  begin
    p := TOraParams.Create(nil);
    p.CreateParam(ftVarBytes,'pAdd',ptUnknown).Value := TVarBytesField(qTopSQLADDRESS).asvariant;
    p.CreateParam(ftfloat,'pHash',ptUnknown).Value := qTopSQL.FieldByName('HASH_VALUE').Value;
    FillViewHorizontal(lvSQLStat, GetSQLStat, p);
  end;

end;

procedure TDBAfrm.ExplainPlan(SQL: string);
var
  step: string;
  p: TOraParams;
begin
  if vtPlanTable.RecordCount > 0 then
      while not vtPlanTable.Eof do  vtPlanTable.Delete;

  if trim(SQL) = '' then exit;

  qTemp.Close;
  qTemp.SQL.Text := GetTopSQLPlan;

  p := TOraParams.Create(nil);
  p.CreateParam(ftVarBytes,'pAddress',ptUnknown).Value := TVarBytesField(qTopSQLADDRESS).asvariant;
  p.CreateParam(ftfloat,'pHash',ptUnknown).Value := qTopSQL.FieldByName('HASH_VALUE').Value;
  qTemp.Prepare;
  qTemp.Params.AssignValues(p);

  try

    qTemp.Open;
    vtPlanTable.Open;

    with qTemp do
    begin
      while not Eof do
      begin
        vtPlanTable.Append;
        step := '';

        vtPlanTable.FieldByName('ID').AsInteger := FieldByName('ID').AsInteger;
        vtPlanTable.FieldByName('PARENT_ID').AsInteger := FieldByName('PARENT_ID').AsInteger;
        vtPlanTable.FieldByName('POSITION').AsInteger := FieldByName('POSITION').AsInteger;
        step := FieldByName('OPERATION').AsString;
        if FieldByName('OPTIONS').AsString <> '' then
           step := step +' '+FieldByName('OPTIONS').AsString;
        if (FieldByName('ID').AsInteger = 0) and (FieldByName('OPTIMIZER').AsString <> '') then
           step := step +' '+' Optinizer Mode='+FieldByName('OPTIMIZER').AsString;
        vtPlanTable.FieldByName('STEP_NAME').AsString :=  step;
        if FieldByName('OBJECT_NAME').AsString <> '' then
           vtPlanTable.FieldByName('OBJECT_NAME').AsString := FieldByName('OBJECT_OWNER').AsString+'.'+FieldByName('OBJECT_NAME').AsString;
        vtPlanTable.FieldByName('cardinality').AsFloat := FieldByName('cardinality').AsFloat / 1000; //Kilobyte
        vtPlanTable.FieldByName('BYTES').AsFloat := FieldByName('BYTES').AsFloat / 1000; //Kilobyte
        vtPlanTable.FieldByName('COST').AsFloat := FieldByName('COST').AsFloat / 1000; //Kilobyte
        vtPlanTable.FieldByName('OBJECT_NODE').AsString := FieldByName('OBJECT_NODE').AsString;
        vtPlanTable.FieldByName('OTHER_tag').AsString := FieldByName('OTHER_tag').AsString;
        vtPlanTable.FieldByName('distribution').AsString := FieldByName('distribution').AsString;
        vtPlanTable.FieldByName('partition_start').AsString := FieldByName('partition_start').AsString;
        vtPlanTable.FieldByName('partition_stop').AsString := FieldByName('partition_stop').AsString;
        vtPlanTable.FieldByName('CPU_COST').AsFloat := FieldByName('CPU_COST').AsFloat;
        vtPlanTable.FieldByName('IO_COST').AsFloat := FieldByName('IO_COST').AsFloat;
        vtPlanTable.FieldByName('ACCESS_PREDICATES').AsString := FieldByName('ACCESS_PREDICATES').AsString;
        vtPlanTable.FieldByName('FILTER_PREDICATES').AsString := FieldByName('FILTER_PREDICATES').AsString;
        vtPlanTable.post;
        next;
      end;
    end;
  except
  end;  
  qTemp.close;

end;

//-------------------------TopSegments----------------------------------------//

procedure TDBAfrm.GetTopTopSegments;
begin
  qTopSegment.Tag := 99;
  qTopSegment.close;
  qTopSegment.SQL.Text := GetTopSegments;
  qTopSegment.ParamByName('str1').AsString := icSortSegmentBy.Text;
  qTopSegment.ParamByName('row1').AsInteger := StrToInt(btnShowTopSegment.Text);
  qTopSegment.Prepare;
  qTopSegment.Open;
  qTopSegment.Tag := 0;
  qTopSegmentAfterScroll(nil);
  lblTopSegmentLastRefreshed.Caption := 'Last refreshed at '+DateTimeToStr(Now);
end;

procedure TDBAfrm.btnTopSegmentRefreshClick(Sender: TObject);
begin
  GetTopTopSegments;
end;

procedure TDBAfrm.icSortSegmentByChange(Sender: TObject);
begin
  GetTopTopSegments;
end;

procedure TDBAfrm.btnShowTopSegmentChange(Sender: TObject);
begin
  GetTopTopSegments;
end;

procedure TDBAfrm.cxGridDBChartView1ValueClick(Sender: TcxGridChartView;
  ASeries: TcxGridChartSeries; AValueIndex: Integer;
  var AHandled: Boolean);
begin
  qTopSegment.Tag := 99;
  qTopSegment.Locate('full_object_name', Sender.Categories.VisibleValues[AValueIndex], []);
  qTopSegment.Tag := 0;
  qTopSegmentAfterScroll(nil);
  //grMainLevel1.Active := True;
end;

procedure TDBAfrm.qTopSegmentAfterScroll(DataSet: TDataSet);
var
 p: TOraParams;
begin
  if not qTopSegment.Active then exit;
  if qTopSegment.Tag = 99 then exit;
  p := TOraParams.Create(nil);
  p.CreateParam(ftfloat,'obj#',ptUnknown).AsFloat := qTopSegment.FieldByName('obj#').AsFloat;
  p.CreateParam(ftfloat,'dataobj#',ptUnknown).AsFloat := qTopSegment.FieldByName('dataobj#').AsFloat;
  FillViewVertical(lviewTopSegments, GetSegmentStatistic, 1, 2, p);
end;

//-------------------------TopSessions----------------------------------------//

procedure TDBAfrm.GetTopTopSessions;
begin
  qTopSession.close;
  qTopSession.SQL.Text := GetTopSessions;
  qTopSession.ParamByName('str1').AsString := icShowToSessionBy.Text;
  qTopSession.ParamByName('row1').AsInteger := StrToInt(icShowTopSessions.Text);
  qTopSession.Open;
  lblTopSessionLastRefreshed.Caption := 'Last refreshed at '+DateTimeToStr(Now);
end;

procedure TDBAfrm.icShowToSessionByChange(Sender: TObject);
begin
  GetTopTopSessions;
end;

procedure TDBAfrm.icShowTopSessionsChange(Sender: TObject);
begin
  GetTopTopSessions;
end;

procedure TDBAfrm.btnTopSessionRefreshClick(Sender: TObject);
begin
  GetTopTopSessions;
end;


{*******************************************************************************}
{                           M E M O R Y                                         }
{*******************************************************************************}

procedure TDBAfrm.pcMemoryPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  qBufferPool.Close;
  qBufferWait.Close;
  qPGAAdvice.Close;
  qPGAStat.Close;
  qSharedPoolAdvice.Close;
  qDataCacheAdvice.Close;
  
  if NewPage = tsBufferPools then GetBufferPool;
  if NewPage = tsBufferWaitStats then GetBufferWaitStats;
  if NewPage = tsPGAAdvice then GetPGAAdvice;
  if NewPage = tsPGAStats then GetPGAstat;
  if NewPage = tsSharedPoolAdvice then GetSharedPoolAdvice;
  if NewPage = tsDataCacheAdvice then GetDataCacheAdvice;
  lblMemoryLastRefreshed.Caption := NewPage.Hint;
end;

procedure TDBAfrm.btnRefreshMemoryClick(Sender: TObject);
begin
  pcMemoryPageChanging(self, pcMemory.ActivePage ,a);
end;

//------------------------------Buffer Pools-----------------------------------//

procedure TDBAfrm.GetBufferPool;
begin
  qBufferPool.Tag := 99;
  qBufferPool.close;
  qBufferPool.SQL.Text := GetMemoryBufferPool;
  qBufferPool.Prepare;
  qBufferPool.Open;
  qBufferPool.Tag := 0;
  qBufferPoolAfterScroll(nil);
  tsBufferPools.Hint := 'Last refreshed at '+DateTimeToStr(Now);
end;

procedure TDBAfrm.qBufferPoolAfterScroll(DataSet: TDataSet);
var
 p: TOraParams;
begin
  if not qBufferPool.Active then exit;
  if qBufferPool.Tag = 99 then exit;
  p := TOraParams.Create(nil);
  p.CreateParam(ftfloat,'ID',ptUnknown).AsFloat := qBufferPool.FieldByName('ID').AsFloat;
  FillViewHorizontal(lvBufferPool, GetMemoryBufferPoolStatistic, p);
end;

//---------------------------Buffer Wait Stats--------------------------------//

procedure TDBAfrm.GetBufferWaitStats;
begin
  qBufferWait.Tag := 99;
  qBufferWait.close;
  qBufferWait.SQL.Text := GetMemoryBufferWaitStats;
  qBufferWait.Prepare;
  qBufferWait.Open;
  qBufferWait.Tag := 0;
  tsBufferWaitStats.Hint := 'Last refreshed at '+DateTimeToStr(Now);
end;

//---------------------------   PGA Advice   ---------------------------------//

procedure TDBAfrm.GetPGAAdvice;
begin
  qPGAAdvice.Tag := 99;
  qPGAAdvice.close;
  qPGAAdvice.SQL.Text := GetMemoryPGAAdvice;
  qPGAAdvice.Prepare;
  qPGAAdvice.Open;
  qPGAAdvice.Tag := 0;
  tsPGAAdvice.Hint := 'Last refreshed at '+DateTimeToStr(Now);
end;

//---------------------------   PGA stat  ------------------------------------//

procedure TDBAfrm.GetPGAstat;
begin
  qPGAStat.Tag := 99;
  qPGAStat.close;
  qPGAStat.SQL.Text := GetMemoryPGAStat;
  qPGAStat.Prepare;
  qPGAStat.Open;
  qPGAStat.Tag := 0;
  tsPGAStats.Hint := 'Last refreshed at '+DateTimeToStr(Now);
end;

//---------------------------Shared Pool Advice -------------------------------//

procedure TDBAfrm.GetSharedPoolAdvice;
begin
  qSharedPoolAdvice.Tag := 99;
  qSharedPoolAdvice.close;
  qSharedPoolAdvice.SQL.Text := GetMemorySharedPoolAdvice;
  qSharedPoolAdvice.Prepare;
  qSharedPoolAdvice.Open;
  qSharedPoolAdvice.Tag := 0;
  tsSharedPoolAdvice.Hint := 'Last refreshed at '+DateTimeToStr(Now);
end;

//--------------------------- Data Cache Advice ------------------------------//

procedure TDBAfrm.GetDataCacheAdvice;
begin
  qDataCacheAdvice.Tag := 99;
  qDataCacheAdvice.close;
  qDataCacheAdvice.SQL.Text := GetMemoryDataCacheAdvice;
  qDataCacheAdvice.Prepare;
  qDataCacheAdvice.Open;
  qDataCacheAdvice.Tag := 0;
  tsDataCacheAdvice.Hint := 'Last refreshed at '+DateTimeToStr(Now);
end;

{*******************************************************************************}
{                             W A I T                                           }
{*******************************************************************************}

procedure TDBAfrm.pcWaitsPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  qEvent.close;
  qLocks.close;
  qLatches.close;
  qChildLatches.close;
  qLatchHolders.close;
  if NewPage = tsEvents then GetEvents;
  if NewPage = tsLocks then GetLocks;
  if NewPage = tsLatches then GetLatches;
  if NewPage = tsChildLatches then GetChildLatches;
  if NewPage = tsLatchHolders then GetLatchHolders;
  lblWaitLastRefreshed.Caption := NewPage.Hint;
end;

procedure TDBAfrm.btnWaitRefreshClick(Sender: TObject);
begin
  pcWaitsPageChanging(self, pcWaits.ActivePage, a);
end;

//--------------------------- Event ------------------------------------------//

procedure TDBAfrm.GetEvents;
begin
  qEvent.Tag := 99;
  qEvent.close;
  qEvent.SQL.Text := GetWaitEvents;
  qEvent.Prepare;
  qEvent.Open;
  qEvent.Tag := 0;
  tsEvents.Hint := 'Last refreshed at '+DateTimeToStr(Now);
end;

//--------------------------- Locks ------------------------------------------//

procedure TDBAfrm.GetLocks;
begin
  qLocks.Tag := 99;
  qLocks.close;
  qLocks.SQL.Text := GetWaitLocks;
  qLocks.Prepare;
  qLocks.Open;
  qLocks.Tag := 0;
  qLocksAfterScroll(nil);
  tsLocks.Hint := 'Last refreshed at '+DateTimeToStr(Now);
end;

procedure TDBAfrm.qLocksAfterScroll(DataSet: TDataSet);
begin
  if not qLocks.Active then exit;
  if qLocks.Tag = 99 then exit;
  pcLockPageChanging(self, pcLock.ActivePage, a);
end;

procedure TDBAfrm.pcLockPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
  if not qLocks.Active then exit;
  if qLocks.Tag = 99 then exit;
  if NewPage = tsLockedObjects then GetLockDetail;
  if NewPage = tsLockSession then GetLockSession;
  if NewPage = tsLockSQL then GetLockSQL;
  if NewPage = tsLockSQLStat then GetLockSQLStat;
  if NewPage = tsLocksSessionStat then GetLockSessionStat;
  if NewPage = tsLockWaits then GetLockWaits;
end;

procedure TDBAfrm.GetLockDetail;
begin
  qTemp.Close;
  qTemp.SQL.Text := GetWaitLockDetail;
  qTemp.ParamByName('sid').AsFloat := qLocks.fieldByName('sid').AsFloat;
  qTemp.Open;
  griDBLockObjects.DataController.DataSource := dsTemp;
end;

procedure TDBAfrm.GetLockSession;
var
 p: TOraParams;
begin
  p := TOraParams.Create(nil);
  p.CreateParam(ftfloat,'sid',ptUnknown).AsFloat := qLocks.FieldByName('SID').AsFloat;
  FillViewHorizontal(lvLockSession, GetWaitLockSession, p);
end;

procedure TDBAfrm.GetLockSQL;
var
 p: TOraParams;
begin
  p := TOraParams.Create(nil);
  p.CreateParam(ftVarBytes,'pAdd',ptUnknown).Value := TVarBytesField(qLocksPREV_SQL_ADDR).asvariant;
  p.CreateParam(ftfloat,'pHash',ptUnknown).Value := qLocks.FieldByName('PREV_HASH_VALUE').Value;

  qTemp.close;
  qTemp.SQL.Text := GetWaitLockSQL;
  qTemp.Prepare;

  qTemp.Params.AssignValues(p);

  qTemp.Open;
  redtWaitLockSQL.Text := qTemp.FieldByName('SQL_TEXT').AsString;
  qTemp.close;
end;

procedure TDBAfrm.GetLockSQLStat;
var
 p: TOraParams;
begin
  p := TOraParams.Create(nil);
  p.CreateParam(ftVarBytes,'pAdd',ptUnknown).Value := TVarBytesField(qLocksPREV_SQL_ADDR).asvariant;
  p.CreateParam(ftfloat,'pHash',ptUnknown).Value := qLocks.FieldByName('PREV_HASH_VALUE').Value;
  FillViewHorizontal(lvLockSQLStat, GetSQLStat, p);
end;

procedure TDBAfrm.GetLockSessionStat;
var
 p: TOraParams;
begin
  p := TOraParams.Create(nil);
  p.CreateParam(ftfloat,'pSid',ptUnknown).Value := qLocks.FieldByName('SID').Value;
  FillViewVertical(lvWaitSessionStat, GetWaitSessionStat,1,2, p);
end;

procedure TDBAfrm.GetLockWaits;
begin
  qTemp.Close;
  qTemp.SQL.Text := GetWaitLock;
  qTemp.ParamByName('pSid').AsFloat := qLocks.fieldByName('sid').AsFloat;
  qTemp.Open;
  gridDBLockWait.DataController.DataSource := dsTemp;
end;

//--------------------------- Latches ----------------------------------------//

procedure TDBAfrm.GetLatches;
begin
  qLatches.Tag := 99;
  qLatches.close;
  qLatches.SQL.Text := GetWaitLatches;
  qLatches.Prepare;
  qLatches.Open;
  qLatches.Tag := 0;
  tsLatches.Hint := 'Last refreshed at '+DateTimeToStr(Now);
end;

//------------------------ Child Latches -------------------------------------//

procedure TDBAfrm.GetChildLatches;
begin
  qChildLatches.Tag := 99;
  qChildLatches.close;
  qChildLatches.SQL.Text := GetWaitChildLatches;
  qChildLatches.Prepare;
  qChildLatches.Open;
  qChildLatches.Tag := 0;
  tsChildLatches.Hint := 'Last refreshed at '+DateTimeToStr(Now);
end;

//--------------------------- Latch Holders-----------------------------------//

procedure TDBAfrm.GetLatchHolders;
begin
  qLatchHolders.Tag := 99;
  qLatchHolders.close;
  qLatchHolders.SQL.Text := GetWaitLatchHolders;
  qLatchHolders.Prepare;
  qLatchHolders.Open;
  qLatchHolders.Tag := 0;
  tsLatchHolders.Hint := 'Last refreshed at '+DateTimeToStr(Now);
end;


{*******************************************************************************}
{                          T A B L E S P A C E S                                }
{*******************************************************************************}

procedure TDBAfrm.pcStoragePageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  qTablespace.Close;
  qFragmentations.close;
  qTablespaceObject.close;

  if NewPage = tsTablespace then GetTablespace;
  if NewPage = tsTablespaceFragmentation then GetTablespaceFragmentation;
  if NewPage = tsTablespaceObjects then GetTablespaceObjectTotal;
  
  lblStorageLastRefreshed.Caption := 'Last refreshed at '+DateTimeToStr(Now);
end;

//--------------------------- Tablespaces ------------------------------------//
procedure TDBAfrm.btnStorageRefreshClick(Sender: TObject);
begin
  pcStoragePageChanging(self, pcStorage.ActivePage, a);
end;

procedure TDBAfrm.GetTablespace;
begin
  qTablespace.Tag := 99;
  qTablespace.close;
  qTablespace.SQL.Text := GetStorageTablespaces;
  qTablespace.Prepare;
  qTablespace.Open;
  qTablespace.Tag := 0;
  qTablespaceAfterScroll(nil);
end;

procedure TDBAfrm.qTablespaceAfterScroll(DataSet: TDataSet);
begin
  if not qTablespace.Active then exit;
  if qTablespace.Tag = 99 then exit;
  pcTablespacePageChanging(self, pcTablespace.ActivePage, a);
end;

procedure TDBAfrm.cxGrid16DBChartView1ValueClick(Sender: TcxGridChartView;
  ASeries: TcxGridChartSeries; AValueIndex: Integer;
  var AHandled: Boolean);
begin
  qTablespace.Tag := 99;
  qTablespace.Locate('TABLESPACE_NAME', Sender.Categories.VisibleValues[AValueIndex], []);
  qTablespace.Tag := 0;
  qTablespaceAfterScroll(nil);
end;


procedure TDBAfrm.pcTablespacePageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if not qTablespace.Active then exit;
  if qTablespace.Tag = 99 then exit;
  if NewPage = tsTablespaceFiles then GetTablespaceFiles;
  if NewPage = tsTablespaceObject then GetTablespaceObjects;
  if NewPage = tsTablespaceQuotas then GetTablespaceQuotas;
end;

procedure TDBAfrm.GetTablespaceFiles;
begin
  qTemp.Close;
  qTemp.SQL.Text := GetStorageTablespaceFiles(qTablespace.fieldByName('TABLESPACE_NAME').AsString);
  qTemp.ParamByName('pName').AsString := qTablespace.fieldByName('TABLESPACE_NAME').AsString;
  qTemp.Open;
  gridDBTablespaceFile.DataController.DataSource := dsTemp;
end;

procedure TDBAfrm.GetTablespaceObjects;
begin
  qTemp.Close;
  qTemp.SQL.Text := GetStorageTablespaceObjects;
  qTemp.ParamByName('pName').AsString := qTablespace.fieldByName('TABLESPACE_NAME').AsString;
  qTemp.Open;
  gridDBTablespaceObject.DataController.DataSource := dsTemp;
end;

procedure TDBAfrm.GetTablespaceQuotas;
begin
  qTemp.Close;
  qTemp.SQL.Text := GetStorageTablespaceQuotas;
  qTemp.ParamByName('pName').AsString := qTablespace.fieldByName('TABLESPACE_NAME').AsString;
  qTemp.Open;
  gridDBQuotas.DataController.DataSource := dsTemp;
end;


//------------------------ Fragmentation -------------------------------------//

procedure TDBAfrm.GetTablespaceFragmentation;
begin
  qFragmentations.Tag := 99;
  qFragmentations.close;
  qFragmentations.SQL.Text := GetStorageTablespaceFragmentation;
  qFragmentations.Prepare;
  qFragmentations.Open;
  qFragmentations.Tag := 0;
end;

//------------------------------ Objects -------------------------------------//

procedure TDBAfrm.GetTablespaceObjectTotal;
begin
  qTablespaceObject.Tag := 99;
  qTablespaceObject.close;
  qTablespaceObject.SQL.Text := GetStorageTablespaceObjectTotal;
  qTablespaceObject.Prepare;
  qTablespaceObject.Open;
  qTablespaceObject.Tag := 0;
end;

{*******************************************************************************}
{                          I / O                                                }
{*******************************************************************************}

procedure TDBAfrm.pcIOPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
  qIOFiles.close;
  qSGAStats.close;
  if NewPage = tsFiles then GetFiles;
  if NewPage = tsSGAStat then GetSGAStat;
end;

procedure TDBAfrm.btnIORefreshClick(Sender: TObject);
begin
  pcIOPageChanging(self, pcIO.ActivePage, a);
end;

procedure TDBAfrm.GetFiles;
begin
  qIOFiles.Tag := 99;
  qIOFiles.close;
  qIOFiles.SQL.Text := GetIOFiles;
  qIOFiles.Prepare;
  qIOFiles.Open;
  qIOFiles.Tag := 0;
  lblIORefreshedTime.Caption := 'Last refreshed at '+DateTimeToStr(Now);
end;

procedure TDBAfrm.GetSGAStat;
begin
  qSGAStats.Tag := 99;
  qSGAStats.close;
  qSGAStats.SQL.Text := GetSGAFiles;
  qSGAStats.Prepare;
  qSGAStats.Open;
  qSGAStats.Tag := 0;
  lblIORefreshedTime.Caption := 'Last refreshed at '+DateTimeToStr(Now);
end;

{*******************************************************************************}
{                          U N D O                                              }
{*******************************************************************************}

procedure TDBAfrm.pcUndoPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
  qUndoTablespace.close;
  qUndoStat.close;
  if NewPage = tsTablespaces then GetTablespaces;
  if NewPage = tsUndoStats then GetUndoStats;
end;

procedure TDBAfrm.btnUndoRefreshClick(Sender: TObject);
begin
  pcUndoPageChanging(self, pcUndo.ActivePage, a);
end;

//--------------------------- Tablespaces ------------------------------------//

procedure TDBAfrm.GetTablespaces;
begin
  qUndoTablespace.Tag := 99;
  qUndoTablespace.close;
  qUndoTablespace.SQL.Text := GetUndoTablespaces;
  qUndoTablespace.Prepare;
  qUndoTablespace.Open;
  qUndoTablespace.Tag := 0;
  qUndoTablespaceAfterScroll(nil);
  lblUndoLastRefresh.Caption := 'Last refreshed at '+DateTimeToStr(Now);
end;

procedure TDBAfrm.qUndoTablespaceAfterScroll(DataSet: TDataSet);
begin
  if not qUndoTablespace.Active then exit;
  if qUndoTablespace.Tag = 99 then exit;
  pcTablespacesPageChanging(self, pcTablespaces.ActivePage, a);
end;

procedure TDBAfrm.pcTablespacesPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if not qUndoTablespace.Active then exit;
  if qUndoTablespace.Tag = 99 then exit;
  if NewPage = tsTablespacesFiles then GetTablespacesFiles;
  if NewPage = tsTablespacesRollbackSegments then GetTablespacesRollbackSegment;
  if NewPage = tsTablespacesRollbackStats then  GetTablespacesRollbackSegmentStat;
  if NewPage = tsTablespacesCurrentTransaction then GetTablespacesCurrentTrans;
end;

procedure TDBAfrm.GetTablespacesFiles;
begin
  qTemp.Close;
  qTemp.SQL.Text := GetStorageTablespaceFiles(qUndoTablespace.fieldByName('TABLESPACE_NAME').AsString);
  qTemp.ParamByName('pName').AsString := qUndoTablespace.fieldByName('TABLESPACE_NAME').AsString;
  qTemp.Open;
  gridDBUndoTablespaceFile.DataController.DataSource := dsTemp;
end;

procedure TDBAfrm.GetTablespacesRollbackSegment;
begin
  qTemp.Close;
  qTemp.SQL.Text := GetUndoTablespacesRollbackSegment;
  qTemp.ParamByName('pName').AsString := qUndoTablespace.fieldByName('TABLESPACE_NAME').AsString;
  qTemp.Open;
  gridDBTablespacesRollbackSegment.DataController.DataSource := dsTemp;
end;

procedure TDBAfrm.GetTablespacesRollbackSegmentStat;
begin
  qTemp.Close;
  qTemp.SQL.Text := GetUndoTablespacesRollbackSegmentStat;
  qTemp.ParamByName('pName').AsString := qUndoTablespace.fieldByName('TABLESPACE_NAME').AsString;
  qTemp.Open;
  gridDBTablespacesRollbackSegmentStat.DataController.DataSource := dsTemp;
end;

procedure TDBAfrm.GetTablespacesCurrentTrans;
begin
  qTemp.Close;
  qTemp.SQL.Text := GetUndoTablespacesCurrentTrans;
  qTemp.ParamByName('pName').AsString := qUndoTablespace.fieldByName('TABLESPACE_NAME').AsString;
  qTemp.Open;
  gridDBTablespacesCurrentTrans.DataController.DataSource := dsTemp;
end;

//--------------------------- Undo Stats ------------------------------------//

procedure TDBAfrm.GetUndoStats;
begin
  qUndoStat.Tag := 99;
  qUndoStat.close;
  qUndoStat.SQL.Text := GetUndoUndoStats;
  qUndoStat.Prepare;
  qUndoStat.Open;
  qUndoStat.Tag := 0;
  lblUndoLastRefresh.Caption := 'Last refreshed at '+DateTimeToStr(Now);
end;


{*******************************************************************************}
{                          R E D O                                              }
{*******************************************************************************}

procedure TDBAfrm.pcRedoPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
  qRedoGroups.close;
  qLogSwitchHistory.close;
  qArchivedLogs.close;
  if NewPage = tsGroups then GetGroups;
  if NewPage = tsLogSwitchHistory then GetLogSwitchHistory;
  if NewPage = tsArchivedLogs then GetArchiedLogs
end;

procedure TDBAfrm.btnRedoRefreshClick(Sender: TObject);
begin
  pcRedoPageChanging(self, pcRedo.ActivePage, a);
end;

//--------------------------- Redo Groups ------------------------------------//
procedure TDBAfrm.GetGroups;
begin
  qRedoGroups.Tag := 99;
  qRedoGroups.close;
  qRedoGroups.SQL.Text := GetRedoGroups;
  qRedoGroups.Prepare;
  qRedoGroups.Open;
  qRedoGroups.Tag := 0;
  qRedoGroupsAfterScroll(nil);
  lblRedoLastRefreshed.Caption := 'Last refreshed at '+DateTimeToStr(Now);
end;

procedure TDBAfrm.qRedoGroupsAfterScroll(DataSet: TDataSet);
var
 p: TOraParams;
begin
  if not qRedoGroups.Active then exit;
  if qRedoGroups.Tag = 99 then exit;
  p := TOraParams.Create(nil);
  p.CreateParam(ftfloat,'pGroup',ptUnknown).Value := qRedoGroups.FieldByName('GROUP#').Value;
  FillViewVertical(lvRedoGroups, GetRedoGroupDetail, 1,2, p);
end;

//--------------------------- Log Switch History------------------------------//
procedure TDBAfrm.GetLogSwitchHistory;
begin
  qLogSwitchHistory.Tag := 99;
  qLogSwitchHistory.close;
  qLogSwitchHistory.SQL.Text := GetRedoLogSwitchHistory;
  qLogSwitchHistory.Prepare;
  qLogSwitchHistory.Open;
  qLogSwitchHistory.Tag := 0;
  lblRedoLastRefreshed.Caption := 'Last refreshed at '+DateTimeToStr(Now);
end;

//--------------------------- Archived Logs ----------------------------------//

procedure TDBAfrm.GetArchiedLogs;
begin
  qArchivedLogs.Tag := 99;
  qArchivedLogs.close;
  qArchivedLogs.SQL.Text := GetRedoArchivedLogs;
  qArchivedLogs.Prepare;
  qArchivedLogs.Open;
  qArchivedLogs.Tag := 0;
  qArchivedLogsAfterScroll(nil);
  lblRedoLastRefreshed.Caption := 'Last refreshed at '+DateTimeToStr(Now);
end;

procedure TDBAfrm.qArchivedLogsAfterScroll(DataSet: TDataSet);
begin
  if not qArchivedLogs.Active then exit;
  if qArchivedLogs.Tag = 99 then exit;

  qTemp.close;
  qTemp.SQL.Text := GetRedoArchivedLogDetail;
  qTemp.ParamByName('pID').AsFloat := qArchivedLogs.fieldByName('DEST_ID').AsFloat;
  qTemp.Open;
  gridDBArchivedLogDetail.DataController.DataSource := dsTemp;
end;


{*******************************************************************************}
{                          T E M P                                              }
{*******************************************************************************}

procedure TDBAfrm.pcTempPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
  qTempfiles.Close;
  if NewPage = tsTempFiles then  GetTempFile;
end;   

procedure TDBAfrm.btnTempRefreshClick(Sender: TObject);
begin
  GetTempFile;
end;

procedure TDBAfrm.GetTempFile;
begin
  qTempfiles.Close;
  qTempfiles.SQL.Text := GetTempFiles;
  qTempfiles.Open;
  lblTempLastRefresh.Caption := 'Last refreshed at '+DateTimeToStr(Now);
end;

{*******************************************************************************}
{                          C O N T R O L  F I L E S                             }
{*******************************************************************************}

procedure TDBAfrm.pcControlFilesPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  qControlFiles.close;
  qControlFileStatistic.close;
  if NEwPage = tsControlFile then GetControlFile;
end;

procedure TDBAfrm.btnControlRefreshClick(Sender: TObject);
begin
  GetControlFile;
end;

procedure TDBAfrm.GetControlFile;
begin
  qControlFiles.Tag := 99;
  qControlFiles.close;
  qControlFiles.SQL.Text := GetControlFiles;
  qControlFiles.Prepare;
  qControlFiles.Open;
  qControlFiles.Tag := 0;

  qControlFileStatistic.Tag := 99;
  qControlFileStatistic.close;
  qControlFileStatistic.SQL.Text := GetControlFileDetail;
  qControlFileStatistic.Prepare;
  qControlFileStatistic.Open;
  qControlFileStatistic.Tag := 0;

  lblControlLastRefreshed.Caption := 'Last refreshed at '+DateTimeToStr(Now);

end;





end.


