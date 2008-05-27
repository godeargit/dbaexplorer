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
unit frmTableProperties;
                          
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, Grids, DBGrids, cxPC, Ora, MemDS,
  DBAccess, ComCtrls, ToolWin, StdCtrls, ExtCtrls,
  //
  GenelDM, frmBaseForm, OraBarConn, Menus, cxLookAndFeelPainters,
  cxButtons, cxSplitter, DBClient, cxContainer, cxListView, cxMemo,
  cxRichEdit, cxDBEdit, cxGroupBox, cxCheckBox, cxCheckGroup, cxMaskEdit,
  cxDropDownEdit, cxRadioGroup, cxImageComboBox, cxListBox, VirtualTable,
  dxBar, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, jpeg, OraErrHand,
  dxBarDBNav, cxGridExportLink, dxStatusBar, Clipbrd, cxLabel,
  frmSchemaPublicEvent;

type
  TTablePropertiesFrm = class(TBaseform)
    pcTableProperties: TcxPageControl;
    tsTableIndexes: TcxTabSheet;
    tsTableConstraints: TcxTabSheet;
    tsTableTrigers: TcxTabSheet;
    tsTableData: TcxTabSheet;
    tsTableScripts: TcxTabSheet;
    tsTableGrants: TcxTabSheet;
    tsTableSynonyms: TcxTabSheet;
    tsTablePartitions: TcxTabSheet;
    tsTableSubpartitions: TcxTabSheet;
    tsTableUsedBy: TcxTabSheet;
    tsTableColumns: TcxTabSheet;
    gridColumn: TcxGrid;
    gridColumnDBTableView1: TcxGridDBTableView;
    gridColumnLevel1: TcxGridLevel;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    GridIndex: TcxGrid;
    GridIndexDBTableView: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    GridIndexDBTableViewColumn1: TcxGridDBColumn;
    GridIndexDBTableViewColumn2: TcxGridDBColumn;
    GridIndexDBTableViewColumn3: TcxGridDBColumn;
    GridIndexDBTableViewColumn4: TcxGridDBColumn;
    GridIndexDBTableViewColumn5: TcxGridDBColumn;
    GridIndexDBTableViewColumn6: TcxGridDBColumn;
    GridTrigers: TcxGrid;
    GridTrigersDBTableView1: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    editTriggers: TcxRichEdit;
    GridTrigersDBTableView1Column1: TcxGridDBColumn;
    GridTrigersDBTableView1Column2: TcxGridDBColumn;
    GridTrigersDBTableView1Column3: TcxGridDBColumn;
    GridTrigersDBTableView1Column4: TcxGridDBColumn;
    GridTrigersDBTableView1Column5: TcxGridDBColumn;
    GridTrigersDBTableView1Column6: TcxGridDBColumn;
    GridTrigersDBTableView1Column7: TcxGridDBColumn;
    GridTrigersDBTableView1Column8: TcxGridDBColumn;
    GridTrigersDBTableView1Column9: TcxGridDBColumn;
    GridTrigersDBTableView1Column10: TcxGridDBColumn;
    GridTrigersDBTableView1Column11: TcxGridDBColumn;
    tsTableDetails: TcxTabSheet;
    GridData: TcxGrid;
    gridDataView: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    GridGrants: TcxGrid;
    GridGrantsDBTableView1: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    GridGrantsDBTableView1Column1: TcxGridDBColumn;
    GridGrantsDBTableView1Column2: TcxGridDBColumn;
    GridGrantsDBTableView1Column3: TcxGridDBColumn;
    GridGrantsDBTableView1Column4: TcxGridDBColumn;
    GridSynonyms: TcxGrid;
    GridSynonymsDBTableView1: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    GridSynonymsDBTableView1Column1: TcxGridDBColumn;
    GridSynonymsDBTableView1Column2: TcxGridDBColumn;
    cxSplitter3: TcxSplitter;
    editColumnComment: TcxRichEdit;
    tsTableComment: TcxTabSheet;
    editComment: TcxRichEdit;
    GridUsed: TcxGrid;
    GridUsedDBTableView1: TcxGridDBTableView;
    cxGridLevel7: TcxGridLevel;
    GridUsedDBTableView1Column1: TcxGridDBColumn;
    GridUsedDBTableView1Column2: TcxGridDBColumn;
    GridUsedDBTableView1Column3: TcxGridDBColumn;
    GridUsedDBTableView1Column4: TcxGridDBColumn;
    GridUsedDBTableView1Column5: TcxGridDBColumn;
    dsTableDetail: TDataSource;
    QTableDetail: TOraQuery;
    GridPartitionedColumnsDBTableView1: TcxGridDBTableView;
    GridPartitionedColumnsLevel1: TcxGridLevel;
    GridPartitionedColumns: TcxGrid;
    GridPartitionesDBTableView1: TcxGridDBTableView;
    GridPartitionesLevel1: TcxGridLevel;
    GridPartitiones: TcxGrid;
    cxSplitter4: TcxSplitter;
    GridPartitionedColumnsDBTableView1Column1: TcxGridDBColumn;
    GridPartitionedColumnsDBTableView1Column2: TcxGridDBColumn;
    GridPartitionesDBTableView1Column1: TcxGridDBColumn;
    GridPartitionesDBTableView1Column2: TcxGridDBColumn;
    GridPartitionesDBTableView1Column3: TcxGridDBColumn;
    GridPartitionesDBTableView1Column4: TcxGridDBColumn;
    GridPartitionesDBTableView1Column5: TcxGridDBColumn;
    GridPartitionesDBTableView1Column6: TcxGridDBColumn;
    GridPartitionesDBTableView1Column7: TcxGridDBColumn;
    GridPartitionesDBTableView1Column8: TcxGridDBColumn;
    GridPartitionesDBTableView1Column9: TcxGridDBColumn;
    GridPartitionesDBTableView1Column10: TcxGridDBColumn;
    GridSubPartitionedColumns: TcxGrid;
    GridSubPartitionedColumnsDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel8: TcxGridLevel;
    cxSplitter5: TcxSplitter;
    GridSubPartitiones: TcxGrid;
    GridSubPartitionesDBTableView2: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel9: TcxGridLevel;
    GridSubPartitionesDBTableView2Column1: TcxGridDBColumn;
    GridSubPartitionesDBTableView2Column2: TcxGridDBColumn;
    GridSubPartitionesDBTableView2Column3: TcxGridDBColumn;
    GridSubPartitionesDBTableView2Column4: TcxGridDBColumn;
    GridSubPartitionesDBTableView2Column5: TcxGridDBColumn;
    GridSubPartitionesDBTableView2Column6: TcxGridDBColumn;
    GridSubPartitionesDBTableView2Column7: TcxGridDBColumn;
    GridSubPartitionesDBTableView2Column8: TcxGridDBColumn;
    GridSubPartitionesDBTableView2Column9: TcxGridDBColumn;
    tsTableForeignKeys: TcxTabSheet;
    pcTableIndex: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    Label3: TcxLabel;
    cgroupParalel: TcxGroupBox;
    redtIndexDDL: TcxRichEdit;
    GridForeignKey: TcxGrid;
    GridForeignKeyDBTableView: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel10: TcxGridLevel;
    cxSplitter6: TcxSplitter;
    pcTableForeignKeys: TcxPageControl;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxGroupBox11: TcxGroupBox;
    cxGroupBox12: TcxGroupBox;
    Label38: TcxLabel;
    edtForeignKeySchema: TcxTextEdit;
    Label39: TcxLabel;
    edtForeignKeyTable: TcxTextEdit;
    Label40: TcxLabel;
    edtForeignKeyRSchema: TcxTextEdit;
    Label41: TcxLabel;
    edtForeignKeyRTable: TcxTextEdit;
    lviewForeignKeys: TcxListView;
    lviewRForeignKeys: TcxListView;
    edtForeignKeyDLL: TcxRichEdit;
    pcTableKeys: TcxPageControl;
    cxTabSheet9: TcxTabSheet;
    edtKeys: TcxRichEdit;
    cxSplitter7: TcxSplitter;
    cxGroupBox8: TcxGroupBox;
    Label1: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    Label4: TcxLabel;
    Label5: TcxLabel;
    Label6: TcxLabel;
    Label7: TcxLabel;
    Label8: TcxLabel;
    Label9: TcxLabel;
    Label10: TcxLabel;
    Label11: TcxLabel;
    Label12: TcxLabel;
    Label13: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    cxDBTextEdit15: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBTextEdit3: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    Label14: TcxLabel;
    Label15: TcxLabel;
    cxDBTextEdit16: TcxDBTextEdit;
    cxDBTextEdit17: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxGroupBox4: TcxGroupBox;
    Label16: TcxLabel;
    cxDBTextEdit18: TcxDBTextEdit;
    cxGroupBox6: TcxGroupBox;
    Label19: TcxLabel;
    Label20: TcxLabel;
    cxDBTextEdit21: TcxDBTextEdit;
    cxDBTextEdit22: TcxDBTextEdit;
    cxGroupBox3: TcxGroupBox;
    Label17: TcxLabel;
    Label21: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit19: TcxDBTextEdit;
    cxGroupBox5: TcxGroupBox;
    Label18: TcxLabel;
    Label42: TcxLabel;
    cxDBTextEdit20: TcxDBTextEdit;
    cxDBTextEdit23: TcxDBTextEdit;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    cxDBCheckBox4: TcxDBCheckBox;
    QTableData: TOraQuery;
    dsTableData: TDataSource;
    Label43: TcxLabel;
    cxTabSheet11: TcxTabSheet;
    tsTableChecks: TcxTabSheet;
    gridKey: TcxGrid;
    gridKeyDBTableView: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    gridKeyDBTableViewCONSTRAINT_NAME: TcxGridDBColumn;
    gridKeyDBTableViewCONSTRAINT_TYPE: TcxGridDBColumn;
    gridKeyDBTableViewDELETE_RULE: TcxGridDBColumn;
    gridKeyDBTableViewSTATUS: TcxGridDBColumn;
    gridKeyDBTableViewDEFERRABLE: TcxGridDBColumn;
    gridKeyDBTableViewDEFERRED: TcxGridDBColumn;
    gridKeyDBTableViewVALIDATED: TcxGridDBColumn;
    listViewKeys: TcxListView;
    gridKeyDBTableViewColumn1: TcxGridDBColumn;
    gridKeyDBTableViewColumn2: TcxGridDBColumn;
    gridKeyDBTableViewColumn3: TcxGridDBColumn;
    pcTableCheck: TcxPageControl;
    cxTabSheet7: TcxTabSheet;
    cxTabSheet12: TcxTabSheet;
    edtChecksDDL: TcxRichEdit;
    cxSplitter9: TcxSplitter;
    gridCheck: TcxGrid;
    gridCheckDBTableView: TcxGridDBTableView;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridLevel11: TcxGridLevel;
    edtChecksDetail: TcxRichEdit;
    dsTableColumns: TDataSource;
    QTableColumns: TOraQuery;
    gridColumnDBTableView1COLUMN_NAME: TcxGridDBColumn;
    gridColumnDBTableView1DATA_TYPE: TcxGridDBColumn;
    gridColumnDBTableView1DATA_TYPE_MOD: TcxGridDBColumn;
    gridColumnDBTableView1DATA_TYPE_OWNER: TcxGridDBColumn;
    gridColumnDBTableView1DATA_LENGTH: TcxGridDBColumn;
    gridColumnDBTableView1DATA_PRECISION: TcxGridDBColumn;
    gridColumnDBTableView1DATA_SCALE: TcxGridDBColumn;
    gridColumnDBTableView1NULLABLE: TcxGridDBColumn;
    gridColumnDBTableView1COLUMN_ID: TcxGridDBColumn;
    gridColumnDBTableView1DATA_DEFAULT: TcxGridDBColumn;
    imgToolBar: TImage;
    barManager: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbtnCreateTable: TdxBarButton;
    dxBarDockControl2: TdxBarDockControl;
    bbtnEditColumn: TdxBarButton;
    bbtnAddColumn: TdxBarButton;
    bbtnRefeshColumn: TdxBarButton;
    bbtnDropColumn: TdxBarButton;
    edtIndexName: TcxTextEdit;
    edtIndexType: TcxTextEdit;
    cbParalel: TcxCheckBox;
    edtParalelDegree: TcxMaskEdit;
    edtParalelInstances: TcxMaskEdit;
    Label22: TcxLabel;
    Label23: TcxLabel;
    rgroupIndexType: TcxRadioGroup;
    rgroupKeyCompression: TcxRadioGroup;
    edtKeyCompressionColumns: TcxMaskEdit;
    Label37: TcxLabel;
    Label44: TcxLabel;
    cbLogging: TcxImageComboBox;
    cxGroupBox7: TcxGroupBox;
    Label24: TcxLabel;
    Label25: TcxLabel;
    Label26: TcxLabel;
    Label27: TcxLabel;
    Label29: TcxLabel;
    Label30: TcxLabel;
    Label31: TcxLabel;
    Label32: TcxLabel;
    edtInitialExtend: TcxMaskEdit;
    edtNextExtend: TcxMaskEdit;
    edtMinExtents: TcxMaskEdit;
    edtMaxExtents: TcxMaskEdit;
    edtPctIncrease: TcxMaskEdit;
    edtFreeList: TcxMaskEdit;
    edtFreeGroup: TcxMaskEdit;
    cbBufferPool: TcxImageComboBox;
    Label28: TcxLabel;
    Label33: TcxLabel;
    Label34: TcxLabel;
    Label35: TcxLabel;
    Label36: TcxLabel;
    edtPercentFree: TcxMaskEdit;
    edtPercentUsed: TcxMaskEdit;
    edtInitialTrans: TcxMaskEdit;
    edtMaxTrans: TcxMaskEdit;
    lcTablespace: TcxLookupComboBox;
    lblPartition: TcxLabel;
    redtDDL: TcxRichEdit;
    qTemp: TOraQuery;
    QTableColumnsOWNER: TStringField;
    QTableColumnsTABLE_NAME: TStringField;
    QTableColumnsCOLUMN_NAME: TStringField;
    QTableColumnsDATA_TYPE: TStringField;
    QTableColumnsDATA_TYPE_MOD: TStringField;
    QTableColumnsDATA_TYPE_OWNER: TStringField;
    QTableColumnsDATA_LENGTH: TFloatField;
    QTableColumnsDATA_PRECISION: TFloatField;
    QTableColumnsDATA_SCALE: TFloatField;
    QTableColumnsNULLABLE: TStringField;
    QTableColumnsCOLUMN_ID: TFloatField;
    QTableColumnsDEFAULT_LENGTH: TFloatField;
    QTableColumnsNUM_DISTINCT: TFloatField;
    QTableColumnsLOW_VALUE: TVarBytesField;
    QTableColumnsHIGH_VALUE: TVarBytesField;
    QTableColumnsDENSITY: TFloatField;
    QTableColumnsNUM_NULLS: TFloatField;
    QTableColumnsNUM_BUCKETS: TFloatField;
    QTableColumnsLAST_ANALYZED: TDateTimeField;
    QTableColumnsSAMPLE_SIZE: TFloatField;
    QTableColumnsCHARACTER_SET_NAME: TStringField;
    QTableColumnsCHAR_COL_DECL_LENGTH: TFloatField;
    QTableColumnsGLOBAL_STATS: TStringField;
    QTableColumnsUSER_STATS: TStringField;
    QTableColumnsAVG_COL_LEN: TFloatField;
    QTableColumnsCHAR_LENGTH: TFloatField;
    QTableColumnsCHAR_USED: TStringField;
    QTableColumnsV80_FMT_IMAGE: TStringField;
    QTableColumnsDATA_UPGRADED: TStringField;
    QTableColumnsCOMMENTS: TStringField;
    QTableColumnsDATA_DEFAULT: TMemoField;
    QTableDetailOWNER: TStringField;
    QTableDetailTABLE_NAME: TStringField;
    QTableDetailTABLESPACE_NAME: TStringField;
    QTableDetailCLUSTER_NAME: TStringField;
    QTableDetailIOT_NAME: TStringField;
    QTableDetailPCT_FREE: TFloatField;
    QTableDetailPCT_USED: TFloatField;
    QTableDetailINI_TRANS: TFloatField;
    QTableDetailMAX_TRANS: TFloatField;
    QTableDetailINITIAL_EXTENT: TFloatField;
    QTableDetailNEXT_EXTENT: TFloatField;
    QTableDetailMIN_EXTENTS: TFloatField;
    QTableDetailMAX_EXTENTS: TFloatField;
    QTableDetailPCT_INCREASE: TFloatField;
    QTableDetailFREELISTS: TFloatField;
    QTableDetailFREELIST_GROUPS: TFloatField;
    QTableDetailLOGGING: TStringField;
    QTableDetailBACKED_UP: TStringField;
    QTableDetailNUM_ROWS: TFloatField;
    QTableDetailBLOCKS: TFloatField;
    QTableDetailEMPTY_BLOCKS: TFloatField;
    QTableDetailAVG_SPACE: TFloatField;
    QTableDetailCHAIN_CNT: TFloatField;
    QTableDetailAVG_ROW_LEN: TFloatField;
    QTableDetailAVG_SPACE_FREELIST_BLOCKS: TFloatField;
    QTableDetailNUM_FREELIST_BLOCKS: TFloatField;
    QTableDetailDEGREE: TStringField;
    QTableDetailINSTANCES: TStringField;
    QTableDetailCACHE: TStringField;
    QTableDetailTABLE_LOCK: TStringField;
    QTableDetailSAMPLE_SIZE: TFloatField;
    QTableDetailLAST_ANALYZED: TDateTimeField;
    QTableDetailPARTITIONED: TStringField;
    QTableDetailIOT_TYPE: TStringField;
    QTableDetailTEMPORARY: TStringField;
    QTableDetailSECONDARY: TStringField;
    QTableDetailNESTED: TStringField;
    QTableDetailBUFFER_POOL: TStringField;
    QTableDetailROW_MOVEMENT: TStringField;
    QTableDetailGLOBAL_STATS: TStringField;
    QTableDetailUSER_STATS: TStringField;
    QTableDetailDURATION: TStringField;
    QTableDetailSKIP_CORRUPT: TStringField;
    QTableDetailMONITORING: TStringField;
    QTableDetailCLUSTER_OWNER: TStringField;
    QTableDetailDEPENDENCIES: TStringField;
    QTableDetailCOMPRESSION: TStringField;
    qTableIndexes: TOraQuery;
    dsTableIndexes: TDataSource;
    qConstraints: TOraQuery;
    dsConstraints: TDataSource;
    qGrants: TOraQuery;
    dsGrants: TDataSource;
    qSynonyms: TOraQuery;
    dsSynonyms: TDataSource;
    qPartitions: TOraQuery;
    qPartitionColumns: TOraQuery;
    dsPartitions: TDataSource;
    dsPartitionColumns: TDataSource;
    qTrigger: TOraQuery;
    dsTrigger: TDataSource;
    qPartitionsTABLE_OWNER: TStringField;
    qPartitionsTABLE_NAME: TStringField;
    qPartitionsCOMPOSITE: TStringField;
    qPartitionsPARTITION_NAME: TStringField;
    qPartitionsSUBPARTITION_COUNT: TFloatField;
    qPartitionsHIGH_VALUE: TMemoField;
    qPartitionsHIGH_VALUE_LENGTH: TFloatField;
    qPartitionsPARTITION_POSITION: TFloatField;
    qPartitionsTABLESPACE_NAME: TStringField;
    qPartitionsPCT_FREE: TFloatField;
    qPartitionsPCT_USED: TFloatField;
    qPartitionsINI_TRANS: TFloatField;
    qPartitionsMAX_TRANS: TFloatField;
    qPartitionsINITIAL_EXTENT: TFloatField;
    qPartitionsNEXT_EXTENT: TFloatField;
    qPartitionsMIN_EXTENT: TFloatField;
    qPartitionsMAX_EXTENT: TFloatField;
    qPartitionsPCT_INCREASE: TFloatField;
    qPartitionsFREELISTS: TFloatField;
    qPartitionsFREELIST_GROUPS: TFloatField;
    qPartitionsLOGGING: TStringField;
    qPartitionsCOMPRESSION: TStringField;
    qPartitionsNUM_ROWS: TFloatField;
    qPartitionsBLOCKS: TFloatField;
    qPartitionsEMPTY_BLOCKS: TFloatField;
    qPartitionsAVG_SPACE: TFloatField;
    qPartitionsCHAIN_CNT: TFloatField;
    qPartitionsAVG_ROW_LEN: TFloatField;
    qPartitionsSAMPLE_SIZE: TFloatField;
    qPartitionsLAST_ANALYZED: TDateTimeField;
    qPartitionsBUFFER_POOL: TStringField;
    qPartitionsGLOBAL_STATS: TStringField;
    qPartitionsUSER_STATS: TStringField;
    qSubPartitions: TOraQuery;
    qSubPartitionColumns: TOraQuery;
    dsSubPartitions: TDataSource;
    dsSubPartitionColumns: TDataSource;
    qUsed: TOraQuery;
    dsUsed: TDataSource;
    bbtnDropTable: TdxBarButton;
    bbtnAlterTable: TdxBarButton;
    bbtnAnalyzeTable: TdxBarButton;
    bbtnTruncateTable: TdxBarButton;
    bbtnCopyTable: TdxBarButton;
    bbtnLockTable: TdxBarButton;
    bbtnRenameTable: TdxBarButton;
    bbtnRefreshTable: TdxBarButton;
    dxBarDockControl3: TdxBarDockControl;
    dxBarDBNavigator1: TdxBarDBNavigator;
    dxBarDBNavFirst1: TdxBarDBNavButton;
    dxBarDBNavPrev1: TdxBarDBNavButton;
    dxBarDBNavNext1: TdxBarDBNavButton;
    dxBarDBNavLast1: TdxBarDBNavButton;
    dxBarDBNavInsert1: TdxBarDBNavButton;
    dxBarDBNavDelete1: TdxBarDBNavButton;
    dxBarDBNavEdit1: TdxBarDBNavButton;
    dxBarDBNavPost1: TdxBarDBNavButton;
    dxBarDBNavCancel1: TdxBarDBNavButton;
    dxBarDBNavRefresh1: TdxBarDBNavButton;
    bbtnDataCommit: TdxBarButton;
    bbtnDataRollback: TdxBarButton;
    edtDataFilter: TdxBarEdit;
    DataSaveDialog: TSaveDialog;
    sbData: TdxStatusBar;
    popData: TPopupMenu;
    popDataMultiSelect: TMenuItem;
    popDataPopUpEditor: TMenuItem;
    popDataSaveAs: TMenuItem;
    popDataFindData: TMenuItem;
    popDataDuplicateRow: TMenuItem;
    popDataRecordCount: TMenuItem;
    popDataCreateSQL: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    dxBarDockControl4: TdxBarDockControl;
    bbtnCreateIndex: TdxBarButton;
    bbtnEditIndex: TdxBarButton;
    bbtnDropIndex: TdxBarButton;
    bbtnRefreshIndex: TdxBarButton;
    bbtnAnalyzeIndex: TdxBarButton;
    bbtnRebuildIndex: TdxBarButton;
    bbtnCoalesceIndex: TdxBarButton;
    dxBarDockControl5: TdxBarDockControl;
    bbtnDropKey: TdxBarButton;
    bbtnCreateKey: TdxBarButton;
    bbtnRefreshKey: TdxBarButton;
    bbtnEnableKey: TdxBarButton;
    bbtnDisableKey: TdxBarButton;
    bbtnRenameKey: TdxBarButton;
    bbtnAlterKey: TdxBarButton;
    dxBarDockControl6: TdxBarDockControl;
    bbtnDropForeignKey: TdxBarButton;
    bbtnCreateForeignKey: TdxBarButton;
    bbtnRefreshForeignKey: TdxBarButton;
    bbtnEnableForeignKey: TdxBarButton;
    bbrnDisableForeignKey: TdxBarButton;
    bbtnRenameForeignKey: TdxBarButton;
    bbtnAlterForeignKey: TdxBarButton;
    dxBarDockControl7: TdxBarDockControl;
    bbtnDropCheck: TdxBarButton;
    bbtnCreateCheck: TdxBarButton;
    bbtnRefreshCheck: TdxBarButton;
    bbtnEnableCheck: TdxBarButton;
    bbtnDisableCheck: TdxBarButton;
    bbtnRenameCheck: TdxBarButton;
    bbtnAlterCheck: TdxBarButton;
    dxBarDockControl8: TdxBarDockControl;
    bbtnDropTrigger: TdxBarButton;
    bbtnCreateTrigger: TdxBarButton;
    bbtnAlterTrigger: TdxBarButton;
    bbtnEnableTrigger: TdxBarButton;
    bbtnDisableTrigger: TdxBarButton;
    bbtnCompileTrigger: TdxBarButton;
    bbtnRefreshTrigger: TdxBarButton;
    dxBarDockControl9: TdxBarDockControl;
    bbtnGrantPrivileges: TdxBarButton;
    bbtnRefreshGrants: TdxBarButton;
    dxBarDockControl10: TdxBarDockControl;
    bbtnCreateSynonym: TdxBarButton;
    bbtnDropSynonym: TdxBarButton;
    bbtnRefreshSynonym: TdxBarButton;
    dxBarDockControl11: TdxBarDockControl;
    bbtnRefreshPartition: TdxBarButton;
    dxBarDockControl12: TdxBarDockControl;
    bbtnRefreshSubPartitions: TdxBarButton;
    dxBarDockControl13: TdxBarDockControl;
    bbtnRefreshComment: TdxBarButton;
    dxBarDockControl14: TdxBarDockControl;
    bbtnRefreshScript: TdxBarButton;
    cxLabel1: TcxLabel;
    cxGroupBox9: TcxGroupBox;
    Label2: TcxLabel;
    Label45: TcxLabel;
    cxDBTextEdit24: TcxDBTextEdit;
    cxDBTextEdit25: TcxDBTextEdit;
    cxDBTextEdit26: TcxDBTextEdit;
    Label46: TcxLabel;
    bbtnDisableAllTriggers: TdxBarButton;
    bbtnEnableAllTriggers: TdxBarButton;
    lblDescription: TLabel;
    procedure pcTablePropertiesPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure GridIndexDBTableViewCanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure tsTableIndexesShow(Sender: TObject);
    procedure GridTrigersDBTableView1CanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure bbtnRefeshColumnClick(Sender: TObject);
    procedure bbtnAddColumnClick(Sender: TObject);
    procedure gridKeyDBTableViewCanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure gridCheckDBTableViewCanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure GridForeignKeyDBTableViewCanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure gridColumnDBTableView1CanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure bbtnEditColumnClick(Sender: TObject);
    procedure bbtnDropColumnClick(Sender: TObject);
    procedure tbtnCreateIndexesClick(Sender: TObject);
    procedure tbtnCreateKeysClick(Sender: TObject);
    procedure tbtnCreateForeignKeyClick(Sender: TObject);
    procedure tbtnCreateCheckClick(Sender: TObject);
    procedure tbtnCreateTrigerClick(Sender: TObject);
    procedure tbtnCreateSynonymsClick(Sender: TObject);
    procedure tbtnDropTrigerClick(Sender: TObject);
    procedure tbtnGrantPrivilegesClick(Sender: TObject);
    procedure bbtnCreateTableClick(Sender: TObject);
    procedure bbtnDropTableClick(Sender: TObject);
    procedure bbtnAlterTableClick(Sender: TObject);
    procedure bbtnTruncateTableClick(Sender: TObject);
    procedure bbtnLockTableClick(Sender: TObject);
    procedure bbtnCopyTableClick(Sender: TObject);
    procedure bbtnRefreshTableClick(Sender: TObject);
    procedure bbtnAnalyzeTableClick(Sender: TObject);
    procedure bbtnRenameTableClick(Sender: TObject);
    procedure bbtnDataCommitClick(Sender: TObject);
    procedure bbtnDataRollbackClick(Sender: TObject);
    procedure dsTableDataStateChange(Sender: TObject);
    procedure dsTableDataDataChange(Sender: TObject; Field: TField);
    procedure edtDataFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataFilterEnter(Sender: TObject);
    procedure edtDataFilterExit(Sender: TObject);
    procedure dsTableDataUpdateData(Sender: TObject);
    procedure QTableDataNewRecord(DataSet: TDataSet);
    procedure QTableDataAfterDelete(DataSet: TDataSet);
    procedure gridDataViewColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure popDataMultiSelectClick(Sender: TObject);
    procedure popDataSaveAsClick(Sender: TObject);
    procedure popDataFindDataClick(Sender: TObject);
    procedure popDataDuplicateRowClick(Sender: TObject);
    procedure popDataRecordCountClick(Sender: TObject);
    procedure popDataCreateSQLClick(Sender: TObject);
    procedure bbtnRefreshIndexClick(Sender: TObject);
    procedure bbtnEditIndexClick(Sender: TObject);
    procedure bbtnDropIndexClick(Sender: TObject);
    procedure bbtnAnalyzeIndexClick(Sender: TObject);
    procedure bbtnCoalesceIndexClick(Sender: TObject);
    procedure bbtnRebuildIndexClick(Sender: TObject);
    procedure bbtnDropKeyClick(Sender: TObject);
    procedure bbtnEnableKeyClick(Sender: TObject);
    procedure bbtnDisableKeyClick(Sender: TObject);
    procedure bbtnRenameKeyClick(Sender: TObject);
    procedure bbtnRefreshKeyClick(Sender: TObject);
    procedure bbtnDropForeignKeyClick(Sender: TObject);
    procedure bbtnRefreshForeignKeyClick(Sender: TObject);
    procedure bbtnEnableForeignKeyClick(Sender: TObject);
    procedure bbrnDisableForeignKeyClick(Sender: TObject);
    procedure bbtnRenameForeignKeyClick(Sender: TObject);
    procedure bbtnDropCheckClick(Sender: TObject);
    procedure bbtnAlterCheckClick(Sender: TObject);
    procedure bbtnEnableCheckClick(Sender: TObject);
    procedure bbtnDisableCheckClick(Sender: TObject);
    procedure bbtnRenameCheckClick(Sender: TObject);
    procedure bbtnRefreshCheckClick(Sender: TObject);
    procedure bbtnAlterTriggerClick(Sender: TObject);
    procedure bbtnEnableTriggerClick(Sender: TObject);
    procedure bbtnDisableTriggerClick(Sender: TObject);
    procedure bbtnCompileTriggerClick(Sender: TObject);
    procedure bbtnRefreshTriggerClick(Sender: TObject);
    procedure bbtnRefreshGrantsClick(Sender: TObject);
    procedure bbtnDropSynonymClick(Sender: TObject);
    procedure bbtnRefreshSynonymClick(Sender: TObject);
    procedure bbtnRefreshPartitionClick(Sender: TObject);
    procedure bbtnRefreshSubPartitionsClick(Sender: TObject);
    procedure bbtnRefreshCommentClick(Sender: TObject);
    procedure bbtnRefreshScriptClick(Sender: TObject);
    procedure bbtnEnableAllTriggersClick(Sender: TObject);
    procedure bbtnDisableAllTriggersClick(Sender: TObject);
  private
    { Private declarations }
    FOraSession: TOraSession;
    FTableName,
    FOwnerName : string;
    FDataChanged: boolean;
    procedure GetDetails;
    procedure GetIndex;
    procedure GetColumns;
    procedure GetColumnDetail(Comment: string);
    procedure GetIndexDetail;
    procedure GetKeys;
    procedure GetKeyDetails;
    procedure GetChecks;
    procedure GetCheckDetails;
    procedure GetForeignKey;
    procedure GetForeignKeyDetails;
    procedure GetTriggers;
    procedure GetTriggerDetail;
    procedure GetDataWithWhereCont;
    procedure GetData;
    procedure GetGrants;
    procedure GetSynonyms;
    procedure GetUsed;
    procedure GetComment;
    procedure GetPartitions;
    procedure GetSubPartitions;
    procedure GetScript;
  public
    { Public declarations }

    procedure Init(ObjName, OwnerName: string); override;
    property DataChanged: boolean read FDataChanged;
    property TableName: string read FTableName;
    procedure CommitData;
    procedure RoolbackData;

  end;

var
  TablePropertiesFrm: TTablePropertiesFrm;

implementation

{$R *.dfm}
uses frmMain, frmSchemaBrowser, Util, frmTableEvents,
  frmTableColumns, frmTableSort, frmTableFind,                             
  OraStorage,
  OraConstraint, frmTableConstraints,
  OraIndex,      frmTableIndexes,
  OraTriger,     frmTrigerDetail,
  OraGrants,     frmGrants,
  OraSynonym,    frmSynonyms,
  OraTable,      frmTableDetail,
  OraPartitions,
  VisualOptions;


procedure TTablePropertiesFrm.Init(ObjName, OwnerName: string);
var
  a: boolean;
begin
  inherited Show;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  top := 0;
  left := 0;
  FTableName := ObjName;
  FOwnerName := OwnerName;

  FOraSession := TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).OraSession;

  qTemp.Session := FOraSession;
  qTemp.close;
  qTemp.SQL.Text := GetTableStatus;
  qTemp.ParamByName('pOName').AsString := FTableName;
  qTemp.ParamByName('pOType').AsString := 'TABLE';
  qTemp.ParamByName('pOwner').AsString := FOwnerName;
  qTemp.Open;
  lblDescription.Caption := FTableName+' ( Created: '+qTemp.FieldByName('CREATED').AsString
                            +' Last DDL: '+qTemp.FieldByName('LAST_DDL_TIME').AsString
                            +' Status: '+qTemp.FieldByName('STATUS').AsString
                            +' )';
  qTemp.close;

  edtDataFilter.Text := 'Enter where clause';
  pcTablePropertiesPageChanging(self, pcTableProperties.ActivePage ,a);
end;

procedure TTablePropertiesFrm.pcTablePropertiesPageChanging(
  Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  qTemp.close;
  QTableDetail.close;
  QTableColumns.Close;
  qTableIndexes.Close;
  qConstraints.close;
  qTrigger.Close;
  qGrants.close;
  qSynonyms.close;
  qPartitionColumns.close;
  qPartitions.close;
  qSubPartitionColumns.close;
  qSubPartitions.close;
  qUsed.close;

  QTableData.close;

  if NewPage = tsTableDetails then GetDetails;
  if NewPage = tsTableColumns then GetColumns;
  if NewPage = tsTableIndexes then GetIndex;
  if NewPage = tsTableConstraints then GetKeys;
  if NewPage = tsTableChecks then GetChecks;
  if NewPage = tsTableForeignKeys then GetForeignKey;
  if NewPage = tsTableTrigers then GetTriggers;
  if NewPage = tsTableData then GetData;
  if NewPage = tsTableGrants then GetGrants;
  if NewPage = tsTableSynonyms then GetSynonyms;
  if NewPage = tsTableUsedBy then GetUsed;
  if NewPage = tsTableComment then GetComment;
  if NewPage = tsTablePartitions then GetPartitions;
  if NewPage = tsTableSubpartitions then GetSubPartitions;
  if NewPage = tsTableScripts then GetScript;
end;

{*******************************************************************************}
{                        T A B L E                                              }
{*******************************************************************************}

procedure TTablePropertiesFrm.GetDetails;
begin
  QTableDetail.close;
  QTableDetail.Session := FOraSession;
  QTableDetail.SQL.Text := GetTableDetail;
  QTableDetail.ParamByName('pTable').AsString := FTableName;
  QTableDetail.ParamByName('pOwner').AsString := FOwnerName;
  QTableDetail.Open;
end;

procedure TTablePropertiesFrm.bbtnCreateTableClick(Sender: TObject);
var
  FTable: TTable;
begin
  inherited;
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := '';
  FTable.OWNER := FOwnerName;
  if TableDetailFrm.Init(FTable) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTable);
end;      

procedure TTablePropertiesFrm.bbtnAlterTableClick(Sender: TObject);
var
  FTable: TTable;
begin
  inherited;
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := FTableName;
  FTable.OWNER := FOwnerName;
  TableDetailFrm.Init(FTable);
end;

procedure TTablePropertiesFrm.bbtnDropTableClick(Sender: TObject);
var
  FTable: TTable;
begin
  inherited;
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := FTableName;
  FTable.OWNER := FOwnerName;
  if TableEventsfrm.Init(FTable, oeDrop) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTable);
end;

procedure TTablePropertiesFrm.bbtnTruncateTableClick(Sender: TObject);
var
  FTable: TTable;
begin
  inherited;
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := FTableName;
  FTable.OWNER := FOwnerName;
  TableEventsfrm.Init(FTable, oeTruncate);
end;

procedure TTablePropertiesFrm.bbtnLockTableClick(Sender: TObject);
var
  FTable: TTable;
begin
  inherited;
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := FTableName;
  FTable.OWNER := FOwnerName;
  TableEventsfrm.Init(FTable, oeLock);
end;

procedure TTablePropertiesFrm.bbtnCopyTableClick(Sender: TObject);
var
  FTable: TTable;
begin
  inherited;
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := FTableName;
  FTable.OWNER := FOwnerName;
  if TableEventsfrm.Init(FTable, oeCopy) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTable);
end;

procedure TTablePropertiesFrm.bbtnAnalyzeTableClick(Sender: TObject);
var
  FTable: TTable;
begin
  inherited;
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := FTableName;
  FTable.OWNER := FOwnerName;
  if TableEventsfrm.Init(FTable, oeAnalyze) then
     GetDetails;
end;

procedure TTablePropertiesFrm.bbtnRenameTableClick(Sender: TObject);
var
  FTable: TTable;
begin
  inherited;
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := FTableName;
  FTable.OWNER := FOwnerName;
  if TableEventsfrm.Init(FTable, oeRename) then
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTable);
end;

procedure TTablePropertiesFrm.bbtnRefreshTableClick(Sender: TObject);
begin
  inherited;
  GetDetails;
end;


{*******************************************************************************}
{                        Table Columns                                          }
{*******************************************************************************}

procedure TTablePropertiesFrm.GetColumns;
begin
  QTableColumns.close;
  QTableColumns.Session := FOraSession;
  QTableColumns.SQL.Text := GetTableColumns;
  QTableColumns.ParamByName('pTable').AsString := FTableName;
  QTableColumns.ParamByName('pOwner').AsString := FOwnerName;
  QTableColumns.Open;
  GetColumnDetail(QTableColumns.FieldByName('comments').AsString);
end;

procedure TTablePropertiesFrm.gridColumnDBTableView1CanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  GetColumnDetail(QTableColumns.FieldByName('comments').AsString);
end;

procedure TTablePropertiesFrm.GetColumnDetail(Comment: string);
begin
  editColumnComment.text := Comment;
end;

procedure TTablePropertiesFrm.bbtnRefeshColumnClick(Sender: TObject);
begin
  inherited;
  GetColumns;
end;

procedure TTablePropertiesFrm.bbtnAddColumnClick(Sender: TObject);
begin
  inherited;
  TableColumnsFrm.Init(FTableName, FOwnerName,'',
                       FOraSession );
  GetColumns;
end;

procedure TTablePropertiesFrm.bbtnEditColumnClick(Sender: TObject);
begin
  inherited;
  if QTableColumns.FieldByName('COLUMN_NAME').AsString = '' then exit;
  TableColumnsFrm.Init(FTableName, FOwnerName,QTableColumns.FieldByName('COLUMN_NAME').AsString,
                       FOraSession );
  GetColumns;
end;

procedure TTablePropertiesFrm.bbtnDropColumnClick(Sender: TObject);
var
  ColumnList: TColumnList;
  Column: TColumn;
begin
  inherited;
  if QTableColumns.FieldByName('COLUMN_NAME').AsString = '' then exit;

  Column := TColumn.Create;
  Column.ColumnName := QTableColumns.FieldByName('COLUMN_NAME').AsString;

  ColumnList := TColumnList.Create;
  ColumnList.TableName := FTableName;
  ColumnList.Owner := FOwnerName;
  ColumnList.Add(Column);

  if SchemaPublicEventFrm.Init(ColumnList, oeDrop) then
     GetColumns;
end;

{*******************************************************************************}
{                        Table Index                                            }
{*******************************************************************************}
procedure TTablePropertiesFrm.GetIndex;
begin
  qTableIndexes.Close;
  qTableIndexes.Session := FOraSession;
  qTableIndexes.SQL.Text := GetTableIndexs;
  qTableIndexes.ParamByName('pTable').AsString := FTableName;
  qTableIndexes.ParamByName('pOwner').AsString := FOwnerName;
  qTableIndexes.Open;
  GetIndexDetail;
end;

procedure TTablePropertiesFrm.GridIndexDBTableViewCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  GetIndexDetail;
end;

procedure TTablePropertiesFrm.tsTableIndexesShow(Sender: TObject);
begin
  inherited;
  GridIndex.SetFocus;
end;

procedure TTablePropertiesFrm.GetIndexDetail;
var
  TableIndex : TTableIndex;
  IndexName, IndexOwner: string;
begin
  redtIndexDDL.Text := '';
  if not qTableIndexes.Active then exit;
  IndexName := qTableIndexes.FieldByName('INDEX_NAME').AsString;
  IndexOwner:= qTableIndexes.FieldByName('INDEX_OWNER').AsString;
  if IndexName = '' then exit;

  TableIndex := TTableIndex.Create;
  TableIndex.IndexName := IndexName;
  TableIndex.IndexSchema := IndexOwner;
  TableIndex.OraSession := FOraSession;
  TableIndex.SetDDL;
  redtIndexDDL.Text := TableIndex.GetDDL;
  CodeColors(self, 'Default', redtIndexDDL, false);

  edtIndexName.Text := TableIndex.IndexName;
  edtIndexType.Text := 'NORMAL';
  if TableIndex.Bitmap then edtIndexType.Text := 'BITMAP';
  if TableIndex.Functions then edtIndexType.Text := 'FUNCTION-BASED NORMAL';
  cbLogging.ItemIndex := Integer(TableIndex.LoggingType);
  if TableIndex.IndexType = Uniqe then rgroupIndexType.ItemIndex := 0
     else rgroupIndexType.ItemIndex := 1;

  if TableIndex.Compress then rgroupKeyCompression.ItemIndex := 0
     else rgroupKeyCompression.ItemIndex := 1;
  edtKeyCompressionColumns.Text := IntToStr(TableIndex.CompressColumns);

  cbParalel.Checked := TableIndex.Paralel;
  edtParalelDegree.Text :=  IntToStr(TableIndex.ParalelDegree);
  edtParalelInstances.Text := IntToStr(TableIndex.ParalelInstances);

  lblPartition.Visible := TableIndex.PartitionClause <> pcNonPartition ;
  if TableIndex.PartitionClause <> pcNonPartition then
     lblPartition.Caption := 'This table has '+ IntToStr(TableIndex.IndexPartitionLists.Count)
                                           +' '+DBIndexPartitionType[TableIndex.IndexPartitionType]
                                           +' partitions';

  with TableIndex.PhsicalAttributes do
  begin
    edtPercentFree.Text := PercentFree;
    edtPercentUsed.Text := PercentUsed;
    edtInitialTrans.Text := InitialTrans;
    edtMaxTrans.Text := MaxExtent;
    lcTablespace.Text := Tablespace;
    edtInitialExtend.Text := InitialExtent;
    edtNextExtend.Text := NextExtent;
    edtMinExtents.Text := MinExtent;
    edtMaxExtents.Text := MaxExtent;
    edtPctIncrease.Text := PctIncrease;
    cbBufferPool.ItemIndex := Integer(BufferPool);
    edtFreeList.Text := FreeLists;
    edtFreeGroup.Text := FreeGroups;
  end;
end;


procedure TTablePropertiesFrm.tbtnCreateIndexesClick(Sender: TObject);
var
  TableIndex : TTableIndex;
begin
  inherited;
  TableIndex := TTableIndex.Create;
  TableIndex.IndexName := '';
  TableIndex.IndexSchema := FOwnerName;
  TableIndex.TableName := FTableName;
  TableIndex.TableSchema := FOwnerName;
  TableIndex.OraSession := FOraSession;
  if TableIndexesFrm.Init(TableIndex) then
  begin
    GetIndex;
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbIndexes);
  end;
end;


procedure TTablePropertiesFrm.bbtnEditIndexClick(Sender: TObject);
var
  TableIndex : TTableIndex;
  IndexName, IndexOwner: string;
begin
  inherited;

  if not qTableIndexes.Active then exit;
  IndexName := qTableIndexes.FieldByName('INDEX_NAME').AsString;
  IndexOwner:= qTableIndexes.FieldByName('INDEX_OWNER').AsString;
  if IndexName = '' then exit;

  TableIndex := TTableIndex.Create;
  TableIndex.IndexName := IndexName;
  TableIndex.IndexSchema := IndexOwner;
  TableIndex.TableName := FTableName;
  TableIndex.TableSchema := FOwnerName;
  TableIndex.OraSession := FOraSession;
  TableIndex.SetDDL;
  if TableIndexesFrm.Init(TableIndex) then
     GetIndex;
end;

procedure TTablePropertiesFrm.bbtnRefreshIndexClick(Sender: TObject);
begin
  inherited;
  GetIndex;
end;

procedure TTablePropertiesFrm.bbtnDropIndexClick(Sender: TObject);
var
  TableIndex : TTableIndex;
  IndexName, IndexOwner: string;
begin
  inherited;

  if not qTableIndexes.Active then exit;
  IndexName := qTableIndexes.FieldByName('INDEX_NAME').AsString;
  IndexOwner:= qTableIndexes.FieldByName('INDEX_OWNER').AsString;
  if IndexName = '' then exit;

  TableIndex := TTableIndex.Create;
  TableIndex.IndexName := IndexName;
  TableIndex.IndexSchema := IndexOwner;
  TableIndex.TableName := FTableName;
  TableIndex.TableSchema := FOwnerName;
  TableIndex.OraSession := FOraSession;
  if SchemaPublicEventFrm.Init(TableIndex, oeDrop) then
  begin
    GetIndex;
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbIndexes);
  end;
end;

procedure TTablePropertiesFrm.bbtnCoalesceIndexClick(Sender: TObject);
var
  TableIndex : TTableIndex;
  IndexName, IndexOwner: string;
begin
  inherited;

  if not qTableIndexes.Active then exit;
  IndexName := qTableIndexes.FieldByName('INDEX_NAME').AsString;
  IndexOwner:= qTableIndexes.FieldByName('INDEX_OWNER').AsString;
  if IndexName = '' then exit;

  TableIndex := TTableIndex.Create;
  TableIndex.IndexName := IndexName;
  TableIndex.IndexSchema := IndexOwner;
  TableIndex.TableName := FTableName;
  TableIndex.TableSchema := FOwnerName;
  TableIndex.OraSession := FOraSession;

  SchemaPublicEventFrm.Init(TableIndex, oeCoalesce);
end;

procedure TTablePropertiesFrm.bbtnRebuildIndexClick(Sender: TObject);
var
  TableIndex : TTableIndex;
  IndexName, IndexOwner: string;
begin
  inherited;

  if not qTableIndexes.Active then exit;
  IndexName := qTableIndexes.FieldByName('INDEX_NAME').AsString;
  IndexOwner:= qTableIndexes.FieldByName('INDEX_OWNER').AsString;
  if IndexName = '' then exit;

  TableIndex := TTableIndex.Create;
  TableIndex.IndexName := IndexName;
  TableIndex.IndexSchema := IndexOwner;
  TableIndex.TableName := FTableName;
  TableIndex.TableSchema := FOwnerName;
  TableIndex.OraSession := FOraSession;

  SchemaPublicEventFrm.Init(TableIndex, oeRebuild);
end;

procedure TTablePropertiesFrm.bbtnAnalyzeIndexClick(Sender: TObject);
var
  TableIndex : TTableIndex;
  IndexName, IndexOwner: string;
begin
  inherited;

  if not qTableIndexes.Active then exit;
  IndexName := qTableIndexes.FieldByName('INDEX_NAME').AsString;
  IndexOwner:= qTableIndexes.FieldByName('INDEX_OWNER').AsString;
  if IndexName = '' then exit;

  TableIndex := TTableIndex.Create;
  TableIndex.IndexName := IndexName;
  TableIndex.IndexSchema := IndexOwner;
  TableIndex.TableName := FTableName;
  TableIndex.TableSchema := FOwnerName;
  TableIndex.OraSession := FOraSession;

  TableEventsfrm.Init(TableIndex, oeAnalyze);
end;

{*******************************************************************************}
{                        Table Constraints (KEYS)                               }
{*******************************************************************************}

procedure TTablePropertiesFrm.GetKeys;
begin
  qConstraints.close;
  qConstraints.Session := FOraSession;
  qConstraints.SQL.Text := GetConstaints(str('P')+','+str('U') );
  qConstraints.ParamByName('pTable').AsString := FTableName;
  qConstraints.ParamByName('pOwner').AsString := FOwnerName;
  qConstraints.Open;
  GetKeyDetails;
end;

procedure TTablePropertiesFrm.gridKeyDBTableViewCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  GetKeyDetails;
end;

procedure TTablePropertiesFrm.GetKeyDetails;
var
  c: TConstraint;
  i: integer;
  KeyName: string;
begin
  listViewKeys.Items.Clear;
  edtKeys.Text := '';
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;
  if KeyName = '' then exit;

  c := TConstraint.Create;
  c.OraSession := FOraSession;
  c.ConstraintName := KeyName;
  c.Owner := FOwnerName;
  c.TableName := FTableName;
  c.SetDDL;

  if c.ConstraitColumns.Count <= 0 then exit;
  for i := 0 to c.ConstraitColumns.Count-1  do
  begin
    with listViewKeys.Items.Add do
    begin
      Caption := c.ConstraitColumns.Items[i].ColumnName;
      ImageIndex := -1;
    end;
    listViewKeys.Items[listViewKeys.Items.count-1].SubItems.Add(intToStr(i));
  end;
  edtKeys.Text := c.GetDDL;
  CodeColors(self, 'Default', edtKeys, false);
end;

procedure TTablePropertiesFrm.tbtnCreateKeysClick(Sender: TObject);
var
  Constraint: TConstraint;
begin
  inherited;
  Constraint := TConstraint.Create;
  Constraint.ConstraintName := '';
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctPrimary;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if TableConstraintsFrm.Init(Constraint) then
  begin
    GetKeys;
  end;
end;

procedure TTablePropertiesFrm.bbtnDropKeyClick(Sender: TObject);
var
  Constraint: TConstraint;
  KeyName: string;
begin
  inherited;
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;

  Constraint := TConstraint.Create;
  Constraint.ConstraintName := KeyName;
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctPrimary;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if SchemaPublicEventFrm.Init(Constraint, oeDrop) then
     GetKeys;
end;

procedure TTablePropertiesFrm.bbtnEnableKeyClick(Sender: TObject);
var
  Constraint: TConstraint;
  KeyName: string;
begin
  inherited;
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;

  Constraint := TConstraint.Create;
  Constraint.ConstraintName := KeyName;
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctPrimary;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if SchemaPublicEventFrm.Init(Constraint, oeEnable) then
     GetKeys;
end;

procedure TTablePropertiesFrm.bbtnDisableKeyClick(Sender: TObject);
var
  Constraint: TConstraint;
  KeyName: string;
begin
  inherited;
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;

  Constraint := TConstraint.Create;
  Constraint.ConstraintName := KeyName;
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctPrimary;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if SchemaPublicEventFrm.Init(Constraint, oeDisable) then
     GetKeys;
end;

procedure TTablePropertiesFrm.bbtnRefreshKeyClick(Sender: TObject);
begin
  inherited;
  GetKeys;
end;

procedure TTablePropertiesFrm.bbtnRenameKeyClick(Sender: TObject);
var
  Constraint: TConstraint;
  KeyName: string;
begin
  inherited;
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;

  Constraint := TConstraint.Create;
  Constraint.ConstraintName := KeyName;
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctPrimary;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if TableEventsfrm.Init(Constraint, oeRename) then
     GetKeys;
end;

{*******************************************************************************}
{                        Table Constraints (CHECKS)                               }
{*******************************************************************************}

procedure TTablePropertiesFrm.GetChecks;
begin
  qConstraints.close;
  qConstraints.Session := FOraSession;
  qConstraints.SQL.Text := GetConstaints(str('C') );
  qConstraints.ParamByName('pTable').AsString := FTableName;
  qConstraints.ParamByName('pOwner').AsString := FOwnerName;
  qConstraints.Open;
  GetCheckDetails;
end;

procedure TTablePropertiesFrm.gridCheckDBTableViewCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  GetCheckDetails;
end;

procedure TTablePropertiesFrm.GetCheckDetails;
var
  c: TConstraint;
  KeyName: string;
begin
  edtChecksDetail.Text := '';
  edtChecksDDL.Text := '';
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;
  if KeyName = '' then exit;

  c := TConstraint.Create;
  c.OraSession := FOraSession;
  c.ConstraintName := KeyName;
  c.Owner := FOwnerName;
  c.TableName := FTableName;
  c.SetDDL;

  edtChecksDetail.Text := c.SearchCondidion;
  edtChecksDDL.Text := c.GetDDL;
  CodeColors(self, 'Default', edtChecksDDL, false);
end;

procedure TTablePropertiesFrm.tbtnCreateCheckClick(Sender: TObject);
var
  Constraint: TConstraint;
begin
  inherited;
  Constraint := TConstraint.Create;
  Constraint.ConstraintName := '';
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctCheck;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  TableConstraintsFrm.Init(Constraint);
  GetChecks;
end;

procedure TTablePropertiesFrm.bbtnDropCheckClick(Sender: TObject);
var
  Constraint: TConstraint;
  KeyName: string;
begin
  inherited;
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;

  Constraint := TConstraint.Create;
  Constraint.ConstraintName := KeyName;
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctCheck;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if SchemaPublicEventFrm.Init(Constraint, oeDrop) then
     GetChecks;
end;

procedure TTablePropertiesFrm.bbtnAlterCheckClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TTablePropertiesFrm.bbtnEnableCheckClick(Sender: TObject);
var
  Constraint: TConstraint;
  KeyName: string;
begin
  inherited;
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;

  Constraint := TConstraint.Create;
  Constraint.ConstraintName := KeyName;
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctCheck;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if SchemaPublicEventFrm.Init(Constraint, oeEnable) then
     GetChecks;
end;

procedure TTablePropertiesFrm.bbtnDisableCheckClick(Sender: TObject);
var
  Constraint: TConstraint;
  KeyName: string;
begin
  inherited;
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;

  Constraint := TConstraint.Create;
  Constraint.ConstraintName := KeyName;
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctCheck;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if SchemaPublicEventFrm.Init(Constraint, oeDisable) then
     GetChecks;
end;

procedure TTablePropertiesFrm.bbtnRenameCheckClick(Sender: TObject);
var
  Constraint: TConstraint;
  KeyName: string;
begin
  inherited;
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;

  Constraint := TConstraint.Create;
  Constraint.ConstraintName := KeyName;
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctCheck;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if TableEventsfrm.Init(Constraint, oeRename) then
     GetChecks;
end;

procedure TTablePropertiesFrm.bbtnRefreshCheckClick(Sender: TObject);
begin
  inherited;
  GetChecks;
end;

{*******************************************************************************}
{                        Table Constraints (FOREIGN KEY)                        }
{*******************************************************************************}

procedure TTablePropertiesFrm.GetForeignKey;
begin
  qConstraints.close;
  qConstraints.Session := FOraSession;
  qConstraints.SQL.Text := GetConstaints(str('R') );
  qConstraints.ParamByName('pTable').AsString := FTableName;
  qConstraints.ParamByName('pOwner').AsString := FOwnerName;
  qConstraints.Open;
  GetForeignKeyDetails;
end;

procedure TTablePropertiesFrm.GridForeignKeyDBTableViewCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  GetForeignKeyDetails;
end;

procedure TTablePropertiesFrm.GetForeignKeyDetails;
var
  c: TConstraint;
  i: integer;
  ConstraintName: string;
begin
  lviewForeignKeys.Items.Clear;
  lviewRForeignKeys.Items.Clear;
  edtForeignKeyDLL.Text := '';
  edtForeignKeySchema.Text := '';
  edtForeignKeyTable.Text := '';
  edtForeignKeyRSchema.Text := '';
  edtForeignKeyRTable.Text := '';

  if not qConstraints.Active then exit;
  ConstraintName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;
  if ConstraintName = '' then exit;

  c := TConstraint.Create;
  c.OraSession := FOraSession;
  c.ConstraintName := ConstraintName;
  c.Owner := FOwnerName;
  c.TableName := FTableName;
  c.SetDDL;

  if c.ConstraitColumns.Count <= 0 then exit;

  edtForeignKeySchema.Text := c.Owner;
  edtForeignKeyTable.Text :=  c.TableName;
  for i := 0 to c.ConstraitColumns.Count-1  do
  begin
    with lviewForeignKeys.Items.Add do
    begin
      Caption := c.ConstraitColumns.Items[i].ColumnName;
      ImageIndex := -1;
    end;
    lviewForeignKeys.Items[lviewForeignKeys.Items.count-1].SubItems.Add(intToStr(i));
  end;

  edtForeignKeyRSchema.Text := c.ROwner;
  edtForeignKeyRTable.Text :=  c.RConstraintName;
  for i := 0 to c.ReferencedColumns.Count-1  do
  begin
    with lviewRForeignKeys.Items.Add do
    begin
      Caption := c.ReferencedColumns.Items[i].ColumnName;
      ImageIndex := -1;
    end;
    lviewRForeignKeys.Items[lviewRForeignKeys.Items.count-1].SubItems.Add(intToStr(i));
  end;

  edtForeignKeyDLL.Text := c.GetDDL;
  CodeColors(self, 'Default', edtForeignKeyDLL, false);
end;

procedure TTablePropertiesFrm.tbtnCreateForeignKeyClick(Sender: TObject);
var
  Constraint: TConstraint;
begin
  inherited;
  Constraint := TConstraint.Create;
  Constraint.ConstraintName := '';
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctForeignKey;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  TableConstraintsFrm.Init(Constraint);
  GetForeignKey;
end;

procedure TTablePropertiesFrm.bbtnDropForeignKeyClick(Sender: TObject);
var
  Constraint: TConstraint;
  KeyName: string;
begin
  inherited;
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;

  Constraint := TConstraint.Create;
  Constraint.ConstraintName := KeyName;
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctForeignKey;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if SchemaPublicEventFrm.Init(Constraint, oeDrop) then
     GetForeignKey;
end;

procedure TTablePropertiesFrm.bbtnEnableForeignKeyClick(Sender: TObject);
var
  Constraint: TConstraint;
  KeyName: string;
begin
  inherited;
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;

  Constraint := TConstraint.Create;
  Constraint.ConstraintName := KeyName;
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctForeignKey;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if SchemaPublicEventFrm.Init(Constraint, oeEnable) then
     GetForeignKey;
end;

procedure TTablePropertiesFrm.bbrnDisableForeignKeyClick(Sender: TObject);
var
  Constraint: TConstraint;
  KeyName: string;
begin
  inherited;
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;

  Constraint := TConstraint.Create;
  Constraint.ConstraintName := KeyName;
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctForeignKey;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if SchemaPublicEventFrm.Init(Constraint, oeDisable) then
     GetForeignKey;
end;

procedure TTablePropertiesFrm.bbtnRenameForeignKeyClick(Sender: TObject);
var
  Constraint: TConstraint;
  KeyName: string;
begin
  inherited;
  if not qConstraints.Active then exit;
  KeyName := qConstraints.FieldByName('CONSTRAINT_NAME').AsString;

  Constraint := TConstraint.Create;
  Constraint.ConstraintName := KeyName;
  Constraint.Owner := FOwnerName;
  Constraint.ConstraintType := ctForeignKey;
  Constraint.TableName := FTableName;
  Constraint.OraSession := FOraSession;
  if TableEventsfrm.Init(Constraint, oeRename) then
     GetForeignKey;
end;

procedure TTablePropertiesFrm.bbtnRefreshForeignKeyClick(Sender: TObject);
begin
  inherited;
  GetForeignKey;
end;

{*******************************************************************************}
{                                   T R I G E R                                 }
{*******************************************************************************}
procedure TTablePropertiesFrm.GetTriggers;
begin
  qTrigger.close;
  qTrigger.Session := FOraSession;
  qTrigger.SQL.Text := GetOraTriggers;
  qTrigger.ParamByName('pName').AsString := FTableName;
  qTrigger.ParamByName('pOwner').AsString := FOwnerName;
  qTrigger.ParamByName('pType').AsString := 'TABLE';
  qTrigger.Open;
  GetTriggerDetail;
end;

procedure TTablePropertiesFrm.GridTrigersDBTableView1CanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  GetTriggerDetail;
end;

procedure TTablePropertiesFrm.GetTriggerDetail;
var
  t: TTrigger;
  TriggerName: string;
begin
  editTriggers.Lines.Clear;
  if not qTrigger.Active then exit;
  if qTrigger.RecordCount = 0 then exit;
  TriggerName := qTrigger.FieldByName('TRIGGER_NAME').AsString;
  if TriggerName = '' then exit;

  t := TTrigger.Create;
  t.OraSession := FOraSession;
  t.TRIGGER_NAME := TriggerName;
  t.Owner := FOwnerName;
  t.SetDDL;
  editTriggers.Text := t.GetDDL;
  CodeColors(self, 'Default', editTriggers, false);
end;

procedure TTablePropertiesFrm.tbtnCreateTrigerClick(Sender: TObject);
var
  t: TTrigger;
begin
  inherited;
  t := TTrigger.Create;
  t.OraSession := FOraSession;
  t.TRIGGER_NAME := '';
  t.Owner := FOwnerName;
  t.TABLE_NAME := FTableName;
  t.TABLE_OWNER := FOwnerName;
  t.BASE_OBJECT_TYPE := 'TABLE';
  if TriggerDetailFrm.Init(t) then
  begin
     GetTriggers;
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
  end;
end;

procedure TTablePropertiesFrm.bbtnAlterTriggerClick(Sender: TObject);
var
  t: TTrigger;
  TriggerName: string;
begin
  inherited;
  if not qTrigger.Active then exit;
  if qTrigger.RecordCount = 0 then exit;
  TriggerName := qTrigger.FieldByName('TRIGGER_NAME').AsString;
  if TriggerName = '' then exit;

  t := TTrigger.Create;
  t.OraSession := FOraSession;
  t.TRIGGER_NAME := TriggerName;
  t.Owner := FOwnerName;
  t.SetDDL;
  if TriggerDetailFrm.Init(t) then
     GetTriggers;
end;

procedure TTablePropertiesFrm.tbtnDropTrigerClick(Sender: TObject);
var
  trigger: TTrigger;
  TriggerName: string;
begin
  inherited;
  if not qTrigger.Active then exit;
  if qTrigger.RecordCount = 0 then exit;
  TriggerName := qTrigger.FieldByName('TRIGGER_NAME').AsString;
  if TriggerName = '' then exit;

  trigger := TTrigger.Create;
  trigger.OraSession := FOraSession;
  trigger.TRIGGER_NAME := TriggerName;
  trigger.Owner := FOwnerName;

  if SchemaPublicEventFrm.Init(trigger, oeDrop) then
     GetTriggers;
end;

procedure TTablePropertiesFrm.bbtnEnableTriggerClick(Sender: TObject);
var
  trigger: TTrigger;
  TriggerName: string;
begin
  inherited;
  if not qTrigger.Active then exit;
  if qTrigger.RecordCount = 0 then exit;
  TriggerName := qTrigger.FieldByName('TRIGGER_NAME').AsString;
  if TriggerName = '' then exit;

  trigger := TTrigger.Create;
  trigger.OraSession := FOraSession;
  trigger.TRIGGER_NAME := TriggerName;
  trigger.Owner := FOwnerName;

  if SchemaPublicEventFrm.Init(trigger, oeEnable) then
  begin
    GetTriggers;
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
  end;
end;

procedure TTablePropertiesFrm.bbtnEnableAllTriggersClick(Sender: TObject);
var
  FTable: TTable;
begin
  inherited;
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := FTableName;
  FTable.OWNER := FOwnerName;
  if TableEventsfrm.Init(FTable, oeEnableTriggers) then
  begin
    GetTriggers;
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
  end;
end;

procedure TTablePropertiesFrm.bbtnDisableTriggerClick(Sender: TObject);
var
  trigger: TTrigger;
  TriggerName: string;
begin
  inherited;
  if not qTrigger.Active then exit;
  if qTrigger.RecordCount = 0 then exit;
  TriggerName := qTrigger.FieldByName('TRIGGER_NAME').AsString;
  if TriggerName = '' then exit;

  trigger := TTrigger.Create;
  trigger.OraSession := FOraSession;
  trigger.TRIGGER_NAME := TriggerName;
  trigger.Owner := FOwnerName;

  if SchemaPublicEventFrm.Init(trigger, oeDisable) then
  begin
     GetTriggers;
     TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
  end;
end;

procedure TTablePropertiesFrm.bbtnDisableAllTriggersClick(Sender: TObject);
var
  FTable: TTable;
begin
  inherited;
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := FTableName;
  FTable.OWNER := FOwnerName;
  if TableEventsfrm.Init(FTable, oeDisableTriggers) then
  begin
    GetTriggers;
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbTriggers);
  end;
end;

procedure TTablePropertiesFrm.bbtnCompileTriggerClick(Sender: TObject);
var
  trigger: TTrigger;
  TriggerName: string;
begin
  inherited;
  if not qTrigger.Active then exit;
  if qTrigger.RecordCount = 0 then exit;
  TriggerName := qTrigger.FieldByName('TRIGGER_NAME').AsString;
  if TriggerName = '' then exit;

  trigger := TTrigger.Create;
  trigger.OraSession := FOraSession;
  trigger.TRIGGER_NAME := TriggerName;
  trigger.Owner := FOwnerName;

  if SchemaPublicEventFrm.Init(trigger, oeCompile) then
     GetTriggers;
end;

procedure TTablePropertiesFrm.bbtnRefreshTriggerClick(Sender: TObject);
begin
  inherited;
  GetTriggers;
end;


{*******************************************************************************}
{                              G R A N T S                                      }
{*******************************************************************************}

procedure TTablePropertiesFrm.GetGrants;
begin
  qGrants.close;
  qGrants.Session := FOraSession;
  qGrants.SQL.Text := GetPrivs;
  qGrants.ParamByName('pOwner').AsString := FOwnerName;
  qGrants.ParamByName('pName').AsString := FTableName;
  qGrants.Open;
end;

procedure TTablePropertiesFrm.tbtnGrantPrivilegesClick(Sender: TObject);
var
  t: TGrantList;
begin
  inherited;
  t := TGrantList.Create;
  t.OraSession := FOraSession;
  t.TableSchema := FOwnerName;
  t.TableName := FTableName;
  t.ObjectType := dbTable;
  t.SetDDL;
  GrantsFrm.Init(t);
  GetGrants;
end;

procedure TTablePropertiesFrm.bbtnRefreshGrantsClick(Sender: TObject);
begin
  inherited;
  GetGrants;
end;

{*******************************************************************************}
{                              S Y N O N Y M S                                  }
{*******************************************************************************}

procedure TTablePropertiesFrm.GetSynonyms;
begin
  qSynonyms.close;
  qSynonyms.Session := FOraSession;
  qSynonyms.SQL.Text := GetOraSynonyms;
  qSynonyms.ParamByName('pOwner').AsString := FOwnerName;
  qSynonyms.ParamByName('pTable').AsString := FTableName;
  qSynonyms.Open;
end;

procedure TTablePropertiesFrm.tbtnCreateSynonymsClick(Sender: TObject);
var
  t: TSynonymList;
begin
  inherited;
  t := TSynonymList.Create;
  t.OraSession := FOraSession;
  t.TableOwner := FOwnerName;
  t.TableName := FTableName;
  t.ObjectType := dbTable;
  if SynonymsFrm.Init(t) then
  begin
    GetSynonyms;
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbSynonyms);
  end;
end;

procedure TTablePropertiesFrm.bbtnDropSynonymClick(Sender: TObject);
var
  SynonymList: TSynonymList;
  FSynonym: TSynonym;
begin
  inherited;

  new(FSynonym);
  FSynonym^.Owner := FOwnerName;
  FSynonym^.SynonymName := qSynonyms.FieldByName('SYNONYM_NAME').AsString;
  FSynonym^.TableOwner := qSynonyms.FieldByName('TABLE_OWNER').AsString;
  FSynonym^.TableName := qSynonyms.FieldByName('TABLE_NAME').AsString;

  SynonymList := TSynonymList.Create;
  SynonymList.OraSession := FOraSession;
  SynonymList.TableOwner := FOwnerName;
  SynonymList.TableName := FTableName;
  SynonymList.SynonymAdd(FSynonym);
  if SchemaPublicEventFrm.Init(SynonymList, oeDrop) then
  begin
    GetSynonyms;
    TSchemaBrowserFrm(Application.MainForm.ActiveMDIChild).RefreshNode(dbSynonyms);
  end;  
end;

procedure TTablePropertiesFrm.bbtnRefreshSynonymClick(Sender: TObject);
begin
  inherited;
  GetSynonyms;
end;

{*******************************************************************************}
{                              D A T A                                          }
{*******************************************************************************}

procedure TTablePropertiesFrm.GetData;
begin
  FDataChanged := false;
  QTableData.Session := FOraSession;
  GetDataWithWhereCont;
  QTableData.SQLUpdate.Text := GetUpdateSQL(FTableName, QTableData.FieldDefs);
  QTableData.SQLInsert.Text := GetInsertSQL(FTableName, QTableData.FieldDefs);
  QTableData.SQLDelete.Text := GetDeleteSQL(FTableName, QTableData.FieldDefs);
  gridDataView.BeginUpdate;
  gridDataView.ClearItems;
  gridDataView.DataController.CreateAllItems();
  gridDataView.DataController.DataSource.DataSet.FieldByName('ROWID').Visible := false;
  gridDataView.EndUpdate;
  gridDataView.ApplyBestFit();
end;

procedure TTablePropertiesFrm.GetDataWithWhereCont;
var
  sql: string;
begin
  sql := GetTableData(FTableName, FOwnerName);
  if edtDataFilter.Text <> 'Enter where clause' then
     sql := sql + edtDataFilter.Text;

  sql := sql + QTableData.SQLRefresh.Text;
  
  QTableData.Close;
  QTableData.SQL.Text := sql;
  QTableData.Open;
end;

procedure TTablePropertiesFrm.edtDataFilterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  answer: word;
begin
  inherited;
  if Key <> VK_RETURN	then exit;
  if edtDataFilter.Text = 'Enter where clause' then exit;

  if FDataChanged then
  begin
    answer := MessageDlg('Table '+FTableName+' has been modified. Save changes ?',mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if answer =  mrYes then bbtnDataCommit.Click;
    if answer =  mrNo then bbtnDataRollback.Click;
    if answer =  mrCancel then
    begin
      edtDataFilter.Text := 'Enter where clause';
      exit;
    end;
  end;

  if (edtDataFilter.Text <> '') AND (getFirstWord(UpperCase(edtDataFilter.Text)) <> 'WHERE')  then
  begin
    MessageDlg('You must enter first word equel WHERE clause', mtInformation, [mbOK], 0);
    exit;
  end;

  GetDataWithWhereCont;
end;

procedure TTablePropertiesFrm.edtDataFilterEnter(Sender: TObject);
begin
  inherited;
  if edtDataFilter.Text = 'Enter where clause' then edtDataFilter.CurText := '';
end;

procedure TTablePropertiesFrm.edtDataFilterExit(Sender: TObject);
begin
  inherited;
  if edtDataFilter.Text = '' then edtDataFilter.Text := 'Enter where clause';
end;

procedure TTablePropertiesFrm.dsTableDataStateChange(Sender: TObject);
begin
  inherited;
  sbData.Panels[0].Text := Format('Row %3d of %3d total rows', [dsTableData.DataSet.RecNo, dsTableData.DataSet.RecordCount]);
end;

procedure TTablePropertiesFrm.dsTableDataDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  dsTableDataStateChange(nil);
end;

procedure TTablePropertiesFrm.QTableDataNewRecord(DataSet: TDataSet);
begin
  inherited;
  FDataChanged := true;
end;

procedure TTablePropertiesFrm.QTableDataAfterDelete(DataSet: TDataSet);
begin
  inherited;
  FDataChanged := true;
end;

procedure TTablePropertiesFrm.dsTableDataUpdateData(Sender: TObject);
begin
  inherited;
  FDataChanged := true;
end;

procedure TTablePropertiesFrm.bbtnDataCommitClick(Sender: TObject);
begin
  inherited;
  QTableData.ApplyUpdates;
  FDataChanged := false;
end;

procedure TTablePropertiesFrm.bbtnDataRollbackClick(Sender: TObject);
begin
  inherited;
  QTableData.CancelUpdates;
  FDataChanged := false;
end;


procedure TTablePropertiesFrm.CommitData;
begin
  bbtnDataCommit.Click;
end;

procedure TTablePropertiesFrm.RoolbackData;
begin
  bbtnDataRollback.Click;
end;             

procedure TTablePropertiesFrm.gridDataViewColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
var
  sort: TSort;
begin
  inherited;
  sort := TSort(Acolumn.SortOrder);
  if not TableSortFrm.Init(AColumn.Caption, sort) then exit;

  QTableData.SQLRefresh.Text := '';
  AColumn. SortIndex := -1;
  gridDataView.DataController.ClearSorting(false);

  if sort = sASC then
  begin
    QTableData.SQLRefresh.Text := ' ORDER BY '+AColumn.Caption + ' asc ';
    AColumn.SortOrder := soAscending;
  end;

  if sort = sDESC then
  begin
    QTableData.SQLRefresh.Text := ' ORDER BY '+AColumn.Caption + ' desc ';
    AColumn.SortOrder := soDescending;
  end;
  GetDataWithWhereCont;
end;

procedure TTablePropertiesFrm.popDataMultiSelectClick(Sender: TObject);
begin
  inherited;
  gridDataView.OptionsSelection.MultiSelect := popDataMultiSelect.Checked;
end;

procedure TTablePropertiesFrm.popDataSaveAsClick(Sender: TObject);
begin
  inherited;
  if DataSaveDialog.Execute then
  begin
    case DataSaveDialog.FilterIndex of
      1: ExportGridToText(DataSaveDialog.FileName, GridData,True,True,',','','');
      2: ExportGridToExcel(DataSaveDialog.FileName, GridData);
      3: ExportGridToHTML(DataSaveDialog.FileName, GridData);
      4: ExportGridToXML(DataSaveDialog.FileName, GridData);
    end;
  end;
end;

procedure TTablePropertiesFrm.popDataFindDataClick(Sender: TObject);
var
  i: integer;
  col: string;
begin
  inherited;
  for i := 0 to gridDataView.ColumnCount -1 do
      if gridDataView.Columns[i].Focused then
         col := gridDataView.Columns[i].Caption;
  TableFindFrm.Init(QTableData, col);
end;

procedure TTablePropertiesFrm.popDataDuplicateRowClick(Sender: TObject);
begin
  inherited;
  DuplicateCurrentRecord(QTableData);
end;

procedure TTablePropertiesFrm.popDataRecordCountClick(Sender: TObject);
var
  FTable: TTable;
begin
  inherited;
  FTable := TTable.Create;
  FTable.OraSession := FOraSession;
  FTable.TABLE_NAME := FTableName;
  FTable.OWNER := FOwnerName;
  MessageDlg('Record count : '+IntToStr(FTable.RecordCount), mtInformation, [mbOK], 0);
end;

procedure TTablePropertiesFrm.popDataCreateSQLClick(Sender: TObject);
var
  i: integer;
  List: TStringList;
begin
  inherited;
  List := TStringList.Create;
  try
    for i := 0 to gridDataView.Controller.SelectedRowCount -1 do
    begin
      if gridDataView.Controller.SelectedRows[i].Selected then
         List.Add(gridDataView.Controller.SelectedRows[i].Values[0]);
    end;
    clipboard.AsText:= GetInsertSQLWithData(FTableName, QTableData, List);
  finally
    List.Free;
  end; 
end;

{*******************************************************************************}
{                              U S E D                                          }
{*******************************************************************************}

procedure TTablePropertiesFrm.GetUsed;
begin
  qUsed.Close;
  qUsed.Session := FOraSession;
  qUsed.SQL.Text := GetTableUsed;
  qUsed.ParamByName('pOwner').AsString := FOwnerName;
  qUsed.ParamByName('pName').AsString := FTableName;
  qUsed.Open;
end;

{*******************************************************************************}
{                              C O M M E N T                                    }
{*******************************************************************************}
procedure TTablePropertiesFrm.GetComment;
begin
  qTemp.Session := FOraSession;
  qTemp.close;
  qTemp.SQL.Text := GetTableComment;
  qTemp.ParamByName('pName').AsString := FTableName;
  qTemp.ParamByName('pOwner').AsString := FOwnerName;
  qTemp.Open;
  editComment.Lines.Text := qTemp.FieldByName('COMMENTS').AsString;
  qTemp.Close;
end;

procedure TTablePropertiesFrm.bbtnRefreshCommentClick(Sender: TObject);
begin
  inherited;
  GetComment;
end;

{*******************************************************************************}
{                            P A R T I T I O N                                  }
{*******************************************************************************}

procedure TTablePropertiesFrm.GetPartitions;
begin
  qPartitionColumns.close;
  qPartitionColumns.Session := FOraSession;
  qPartitionColumns.SQL.Text := GetTablePartitionedColumns;
  qPartitionColumns.ParamByName('pName').AsString := FTableName;
  qPartitionColumns.ParamByName('pOwner').AsString := FOwnerName;
  qPartitionColumns.Open;

  qPartitions.close;
  qPartitions.Session := FOraSession;
  qPartitions.SQL.Text := GetTablePartitions;
  qPartitions.ParamByName('pName').AsString := FTableName;
  qPartitions.ParamByName('pOwner').AsString := FOwnerName;
  qPartitions.Open;
end;

procedure TTablePropertiesFrm.bbtnRefreshPartitionClick(Sender: TObject);
begin
  inherited;
  GetPartitions;
end;

procedure TTablePropertiesFrm.GetSubPartitions;
begin
  qSubPartitionColumns.close;
  qSubPartitionColumns.Session := FOraSession;
  qSubPartitionColumns.SQL.Text := GetTableSubPartitionedColumns;
  qSubPartitionColumns.ParamByName('pName').AsString := FTableName;
  qSubPartitionColumns.ParamByName('pOwner').AsString := FOwnerName;
  qSubPartitionColumns.Open;

  qSubPartitions.close;
  qSubPartitions.Session := FOraSession;
  qSubPartitions.SQL.Text := GetTableSubPartitions;
  qSubPartitions.ParamByName('pName').AsString := FTableName;
  qSubPartitions.ParamByName('pOwner').AsString := FOwnerName;
  qSubPartitions.Open;
end;

procedure TTablePropertiesFrm.bbtnRefreshSubPartitionsClick(
  Sender: TObject);
begin
  inherited;
  GetSubPartitions;
end;

{*******************************************************************************}
{                           S C R I P T                                         }
{*******************************************************************************}
procedure TTablePropertiesFrm.GetScript;
var
  t: TTable;
begin
  inherited;
  t := TTable.Create;
  t.OraSession := FOraSession;
  t.OWNER := FOwnerName;
  t.TABLE_NAME := FTableName;
  t.SetDDL;
  redtDDL.Text := t.GetDDL;
  CodeColors(self, 'Default', redtDDL, false); 
end;

procedure TTablePropertiesFrm.bbtnRefreshScriptClick(Sender: TObject);
begin
  inherited;
  GetScript;
end;





end.
