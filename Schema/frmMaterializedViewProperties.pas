unit frmMaterializedViewProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxListView, cxSplitter, cxMemo,
  cxRichEdit, cxTextEdit, cxLabel, cxContainer, cxGroupBox, cxPC, StdCtrls,
  ExtCtrls;

type
  TMaterializedViewPropertiesFrm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Shape1: TShape;
    lblDescription: TLabel;
    pcMaterializedViewProperties: TcxPageControl;
    tsProcedureSQLQuery: TcxTabSheet;
    dxBarDockControl1: TdxBarDockControl;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edtName: TcxTextEdit;
    cxLabel2: TcxLabel;
    edtOwner: TcxTextEdit;
    redtCode: TcxRichEdit;
    cxSplitter1: TcxSplitter;
    lviewError: TcxListView;
    tsBody: TcxTabSheet;
    redtBodyCode: TcxRichEdit;
    cxSplitter2: TcxSplitter;
    lviewBodyError: TcxListView;
    tsArguments: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    tsProcedureGrants: TcxTabSheet;
    dxBarDockControl4: TdxBarDockControl;
    GridGrants: TcxGrid;
    GridGrantsDBTableView1: TcxGridDBTableView;
    GridGrantsDBTableView1Column1: TcxGridDBColumn;
    GridGrantsDBTableView1Column2: TcxGridDBColumn;
    GridGrantsDBTableView1Column3: TcxGridDBColumn;
    GridGrantsDBTableView1Column4: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    tsProcedureSynonyms: TcxTabSheet;
    dxBarDockControl6: TdxBarDockControl;
    GridSynonyms: TcxGrid;
    GridSynonymsDBTableView1: TcxGridDBTableView;
    GridSynonymsDBTableView1Column1: TcxGridDBColumn;
    GridSynonymsDBTableView1Column2: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    tsProcedureUsedBy: TcxTabSheet;
    GridUsed: TcxGrid;
    GridUsedDBTableView1: TcxGridDBTableView;
    GridUsedDBTableView1Column1: TcxGridDBColumn;
    GridUsedDBTableView1Column2: TcxGridDBColumn;
    GridUsedDBTableView1Column3: TcxGridDBColumn;
    GridUsedDBTableView1Column4: TcxGridDBColumn;
    GridUsedDBTableView1Column5: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    tsProcedureUses: TcxTabSheet;
    GridUses: TcxGrid;
    GridUsesDBTableView1: TcxGridDBTableView;
    GridUsesDBTableView1Column1: TcxGridDBColumn;
    GridUsesDBTableView1Column2: TcxGridDBColumn;
    GridUsesDBTableView1Column3: TcxGridDBColumn;
    GridUsesDBTableView1Column4: TcxGridDBColumn;
    GridUsesDBTableView1Column5: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    dxBarManager1: TdxBarManager;
    btnCreateProc: TdxBarButton;
    btnAlterProc: TdxBarButton;
    btnDropProc: TdxBarButton;
    btnCompileProc: TdxBarButton;
    btnRefreshProc: TdxBarButton;
    btnPrivilegesView: TdxBarButton;
    bbtnGrantPrivileges: TdxBarButton;
    btnRefreshGrants: TdxBarButton;
    bbtnCreateSynonym: TdxBarButton;
    bbtnDropSynonym: TdxBarButton;
    bbtnRefreshSynonym: TdxBarButton;
    bbtnExecPro: TdxBarButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MaterializedViewPropertiesFrm: TMaterializedViewPropertiesFrm;

implementation

{$R *.dfm}

end.
