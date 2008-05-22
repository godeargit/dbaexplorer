unit frmTrigerDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCheckGroup, cxGroupBox, cxRadioGroup, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxTextEdit, StdCtrls, cxControls, cxContainer, cxEdit, Menus,
  cxLookAndFeelPainters, cxButtons, cxPC, cxMemo, cxRichEdit, Ora, jpeg,
  ExtCtrls, cxCheckBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, MemDS,
  VirtualTable, DBAccess, OraTriger,GenelDM;

type
  TTriggerDetailFrm = class(TForm)
    pc: TcxPageControl;
    tsProperties: TcxTabSheet;
    gbReferencing: TcxGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    lblParent: TLabel;
    edtNewAs: TcxTextEdit;
    edtOldAs: TcxTextEdit;
    edtParent: TcxTextEdit;
    gbObject: TcxGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    lcObjectSchema: TcxLookupComboBox;
    lcObjectName: TcxLookupComboBox;
    rgTriggerOn: TcxRadioGroup;
    tsWhenClause: TcxTabSheet;
    redtWhenClause: TcxRichEdit;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    tsUpdateColumns: TcxTabSheet;
    lblNestedTable: TLabel;
    gboxFireOnDDL: TcxGroupBox;
    cbAlter: TcxCheckBox;
    cbAnalyze: TcxCheckBox;
    cbAssocStats: TcxCheckBox;
    cbAudit: TcxCheckBox;
    cbComment: TcxCheckBox;
    cbCreate: TcxCheckBox;
    cbDisassocStats: TcxCheckBox;
    cbDrop: TcxCheckBox;
    cbGrant: TcxCheckBox;
    cbNoAudit: TcxCheckBox;
    cbRename: TcxCheckBox;
    cbRevoke: TcxCheckBox;
    cbTruncate: TcxCheckBox;
    cbDDL: TcxCheckBox;
    gboxFireOnDatabase: TcxGroupBox;
    cbServerError: TcxCheckBox;
    cbLoggon: TcxCheckBox;
    cbStartup: TcxCheckBox;
    cbLoggof: TcxCheckBox;
    cbShotdown: TcxCheckBox;
    cbsuspend: TcxCheckBox;
    gbSchema: TcxGroupBox;
    Label4: TLabel;
    lcbSchema: TcxLookupComboBox;
    gbDescription: TcxGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edtTriggerName: TcxTextEdit;
    lcbTriggerOwner: TcxLookupComboBox;
    cxGroupBox5: TcxGroupBox;
    rgFireWhen: TcxRadioGroup;
    rgForEach: TcxRadioGroup;
    rgStatus: TcxRadioGroup;
    rgEventType: TcxRadioGroup;
    cgOnEvent: TcxGroupBox;
    cbInsert: TcxCheckBox;
    cbUpdate: TcxCheckBox;
    cbDelete: TcxCheckBox;
    rgrpUpdateColumns: TcxRadioGroup;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1COL_ID: TcxGridDBColumn;
    cxGrid1DBTableView1COLUMN_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_TYPE: TcxGridDBColumn;
    cxGrid1DBTableView1CHK: TcxGridDBColumn;
    dsObjectTable: TDataSource;
    qObjectTable: TOraQuery;
    StringField3: TStringField;
    qTableColumns: TOraQuery;
    qTableColumnsCOLUMN_NAME: TStringField;
    qTableColumnsDATA_TYPE: TStringField;
    qTableColumnsCOLUMN_ID: TFloatField;
    dsTableColumns: TDataSource;
    qObjectView: TOraQuery;
    qObjectViewVIEW_NAME: TStringField;
    dsObjectView: TDataSource;
    vTableColumns: TVirtualTable;
    vTableColumnsCOLUMN_ID: TIntegerField;
    vTableColumnsCOLUMN_NAME: TStringField;
    vTableColumnsDATA_TYPE: TStringField;
    vTableColumnsCHK: TIntegerField;
    tsBody: TcxTabSheet;
    redtBody: TcxRichEdit;
    qViewWithNested: TOraQuery;
    dsViewWithNested: TDataSource;
    qViewWithNestedVIEW_NAME: TStringField;
    qViewWithNestedCOLUMN_NAME: TStringField;
    qViewWithNestedDATA_TYPE: TStringField;
    qViewWithNestedCOLUMN_ID: TFloatField;
    lcbNestedTable: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    btnExecute: TcxButton;
    btnCancel: TcxButton;
    Bevel1: TBevel;
    procedure btnCancelClick(Sender: TObject);
    procedure rgTriggerOnPropertiesChange(Sender: TObject);
    procedure lcObjectNamePropertiesEditValueChanged(Sender: TObject);
    procedure rgrpUpdateColumnsPropertiesChange(Sender: TObject);
    procedure lcObjectSchemaPropertiesEditValueChanged(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FTrigger : TTrigger;
    procedure SetProperties;
    procedure GetTriggerDetail;
    function SetTriggerDetail: boolean;
  public
    { Public declarations }
    function Init(ATrigger : TTrigger): boolean;

  end;

var
  TriggerDetailFrm: TTriggerDetailFrm;

implementation

{$R *.dfm}

uses frmSchemaBrowser, OraScripts, Util,  OraTable, OraStorage, OraView,
     VisualOptions;

function TTriggerDetailFrm.Init(ATrigger : TTrigger): boolean;
begin
  TriggerDetailFrm := TTriggerDetailFrm.Create(Application);
  Self := TriggerDetailFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  
  Height := 556;
  FTrigger := TTrigger.Create;
  FTrigger := ATrigger;

  if FTrigger.BASE_OBJECT_TYPE = 'TABLE' then
     rgTriggerOn.ItemIndex := 0;

  if FTrigger.BASE_OBJECT_TYPE = 'VIEW' then
     rgTriggerOn.ItemIndex := 1;

  qObjectTable.Session := FTrigger.OraSession;
  qObjectView.Session := FTrigger.OraSession;
  qTableColumns.Session := FTrigger.OraSession;
  qViewWithNested.Session := FTrigger.OraSession;
  vTableColumns.Open;
  dmGenel.ReLoad(FTrigger.OraSession);
  GetTriggerDetail;
  SetProperties;
  pc.ActivePage := tsProperties;  
  ShowModal;
  result := ModalResult = mrOk;
  Free;
end;

procedure TTriggerDetailFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qObjectTable.Close;
  qObjectView.Close;
  qTableColumns.Close;
  qViewWithNested.Close;
  vTableColumns.Close;
end;

procedure TTriggerDetailFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TTriggerDetailFrm.SetProperties;
begin
  if rgTriggerOn.ItemIndex = 0 then //table
  begin
    qObjectTable.SQL.Text := GetTables(lcObjectSchema.Text);
    qObjectTable.Open;
    lcObjectName.Properties.ListSource := dsObjectTable;
    lcObjectName.Properties.ListFieldNames := 'TABLE_NAME';
    lcObjectName.Properties.KeyFieldNames := 'TABLE_NAME';
  end;

  if rgTriggerOn.ItemIndex = 1 then //view
  begin
    qObjectView.SQL.Text := GetViews(lcObjectSchema.Text);
    qObjectView.Open;
    lcObjectName.Properties.ListSource := dsObjectView;
    lcObjectName.Properties.ListFieldNames := 'VIEW_NAME';
    lcObjectName.Properties.KeyFieldNames := 'VIEW_NAME';
  end;

  if rgTriggerOn.ItemIndex = 3 then //NESTED TABLE
  begin
    qViewWithNested.SQL.Text := GetViewsWithNested(lcObjectSchema.Text);
    qViewWithNested.Open;
    lcObjectName.Properties.ListSource := dsViewWithNested;
    lcObjectName.Properties.ListFieldNames := 'VIEW_NAME;column_name';
    lcObjectName.Properties.KeyFieldNames := 'VIEW_NAME';
  end;
  
  if rgTriggerOn.ItemIndex = 0 then //table
  begin
    rgForEach.Enabled := True;
    rgForEach.Visible := True;
    rgFireWhen.Enabled := true;
    cgOnEvent.Visible := true;
    cgOnEvent.Enabled := true;
    gbReferencing.Visible := true;
    lblParent.Visible := false;
    edtParent.Visible := false;
    lblNestedTable.Visible := false;
    lcbNestedTable.Visible := false;
    gboxFireOnDDL.Visible := false;
    gboxFireOnDatabase.Visible := false;
    gbSchema.Visible := false;
    rgEventType.Visible := False;
    tsUpdateColumns.TabVisible := cbUpdate.Checked;
    tsWhenClause.TabVisible := rgForEach.ItemIndex = 0;
    gbObject.Visible := true;
  end;

  if rgTriggerOn.ItemIndex = 1 then //View
  begin
    rgFireWhen.Enabled := false;
    rgForEach.Enabled := False;
    rgForEach.Visible := True;
    rgForEach.ItemIndex := 0;
    cgOnEvent.Visible := true;
    cgOnEvent.Enabled := true;
    gbReferencing.Visible := true;
    lblParent.Visible := false;
    edtParent.Visible := false;
    lblNestedTable.Visible := false;
    lcbNestedTable.Visible := false;
    gboxFireOnDDL.Visible := false;
    gboxFireOnDatabase.Visible := false;
    gbSchema.Visible := false;
    rgEventType.Visible := False;
    tsUpdateColumns.TabVisible := false;
    tsWhenClause.TabVisible := false;
    gbObject.Visible := true;
  end;

  if rgTriggerOn.ItemIndex = 3 then //Nested of
  begin
    rgFireWhen.Enabled := false;
    rgForEach.Enabled := False;
    rgForEach.Visible := True;
    rgForEach.ItemIndex := 0;
    cgOnEvent.Visible := true;
    cgOnEvent.Enabled := true;
    gbReferencing.Visible := true;
    lblParent.Visible := True;
    edtParent.Visible := True;
    lblNestedTable.Visible := True;
    lcbNestedTable.Visible := True;
    gboxFireOnDDL.Visible := false;
    gboxFireOnDatabase.Visible := false;
    gbSchema.Visible := false;
    rgEventType.Visible := False;
    tsUpdateColumns.TabVisible := false;
    tsWhenClause.TabVisible := false;
    gbObject.Visible := true;
  end;

  if rgTriggerOn.ItemIndex = 2 then //Schema
  begin
    gbObject.Visible := false;
    rgFireWhen.Enabled := True;
    rgForEach.Visible := false;
    cgOnEvent.Visible := False;
    gbReferencing.Visible := false;
    lblNestedTable.Visible := false;
    lcbNestedTable.Visible := false;
    rgEventType.Visible := True;   
    gboxFireOnDDL.Visible := rgEventType.ItemIndex = 1;
    gboxFireOnDatabase.Visible := rgEventType.ItemIndex = 0;
    gbSchema.Visible := True;
    tsUpdateColumns.TabVisible := false;
    tsWhenClause.TabVisible := true;

    cbServerError.Enabled := rgFireWhen.ItemIndex = 1;
    cbLoggon.Enabled := rgFireWhen.ItemIndex = 1;
    cbStartup.Enabled := rgFireWhen.ItemIndex = 1;
    cbLoggof.Enabled := rgFireWhen.ItemIndex = 0;
    cbShotdown.Enabled := rgFireWhen.ItemIndex = 0;
  end;

  if rgTriggerOn.ItemIndex = 4 then //Database
  begin
    gbObject.Visible := false;
    rgFireWhen.Enabled := True;
    rgForEach.Visible := false;
    cgOnEvent.Visible := False;
    gbReferencing.Visible := false;
    lblNestedTable.Visible := false;
    lcbNestedTable.Visible := false;
    rgEventType.Visible := True;   
    gboxFireOnDDL.Visible := rgEventType.ItemIndex = 1;
    gboxFireOnDatabase.Visible := rgEventType.ItemIndex = 0;
    gbSchema.Visible := false;
    tsUpdateColumns.TabVisible := false;
    tsWhenClause.TabVisible := true;

    cbServerError.Enabled := rgFireWhen.ItemIndex = 1;
    cbLoggon.Enabled := rgFireWhen.ItemIndex = 1;
    cbStartup.Enabled := rgFireWhen.ItemIndex = 1;
    cbLoggof.Enabled := rgFireWhen.ItemIndex = 0;
    cbShotdown.Enabled := rgFireWhen.ItemIndex = 0;
  end;
end; //SetProperties;

procedure TTriggerDetailFrm.GetTriggerDetail;
var n,o,p: integer;
begin
  if FTrigger.TRIGGER_NAME = '' then Caption := 'Create Trigger' else Caption := 'Alter Trigger '+FTrigger.TRIGGER_NAME;

  lcbTriggerOwner.Text := FTrigger.OWNER;
  lcObjectSchema.Text := FTrigger.TABLE_OWNER;
  lcObjectName.Text := FTrigger.TABLE_NAME;

  if FTrigger.TRIGGER_NAME = '' then exit;
  edtTriggerName.Text := FTrigger.TRIGGER_NAME;

  if pos('BEFORE', FTrigger.TRIGGER_TYPE) > 0 then rgFireWhen.ItemIndex := 0;
  if pos('AFTER', FTrigger.TRIGGER_TYPE) > 0 then rgFireWhen.ItemIndex := 1;

  cbInsert.Checked := pos('INSERT', FTrigger.TRIGGERING_EVENT) > 0;
  cbUpdate.Checked := pos('UPDATE', FTrigger.TRIGGERING_EVENT) > 0;
  cbDelete.Checked := pos('DELETE', FTrigger.TRIGGERING_EVENT) > 0;

  cbLoggof.Checked := pos('LOGOFF', FTrigger.TRIGGERING_EVENT) > 0;
  cbShotdown.Checked := pos('SHUTDOWN', FTrigger.TRIGGERING_EVENT) > 0;
  cbServerError.Checked := pos('SERVERERROR', FTrigger.TRIGGERING_EVENT) > 0;
  cbLoggon.Checked := pos('LOGON', FTrigger.TRIGGERING_EVENT) > 0;
  cbStartup.Checked := pos('STARTUP', FTrigger.TRIGGERING_EVENT) > 0;
  cbsuspend.Checked := pos('SUSPEND', FTrigger.TRIGGERING_EVENT) > 0;
  cbAlter.Checked := pos('ALTER', FTrigger.TRIGGERING_EVENT) > 0;
  cbAudit.Checked := pos('AUDIT', FTrigger.TRIGGERING_EVENT) > 0;
  cbDisassocStats.Checked := pos('DISASSOCIATE STATISTICS', FTrigger.TRIGGERING_EVENT) > 0;
  cbNoAudit.Checked := pos('NOAUDIT', FTrigger.TRIGGERING_EVENT) > 0;
  cbTruncate.Checked := pos('TRUNCATE', FTrigger.TRIGGERING_EVENT) > 0;
  cbAnalyze.Checked := pos('ANALYZE', FTrigger.TRIGGERING_EVENT) > 0;
  cbComment.Checked := pos('COMMENT', FTrigger.TRIGGERING_EVENT) > 0;
  cbDrop.Checked := pos('DROP', FTrigger.TRIGGERING_EVENT) > 0;
  cbRename.Checked := pos('RENAME', FTrigger.TRIGGERING_EVENT) > 0;
  cbDDL.Checked := pos('DDL', FTrigger.TRIGGERING_EVENT) > 0;
  cbAssocStats.Checked := pos('ASSOCIATE STATISTICS', FTrigger.TRIGGERING_EVENT) > 0;
  cbCreate.Checked := pos('CREATE', FTrigger.TRIGGERING_EVENT) > 0;
  cbGrant.Checked := pos('GRANT', FTrigger.TRIGGERING_EVENT) > 0;
  cbRevoke.Checked := pos('REVOKE', FTrigger.TRIGGERING_EVENT) > 0;

  lcObjectSchema.Text := FTrigger.TABLE_OWNER;
  if trim(FTrigger.BASE_OBJECT_TYPE) = 'TABLE' then rgTriggerOn.ItemIndex := 0;
  if trim(FTrigger.BASE_OBJECT_TYPE) = 'VIEW' then rgTriggerOn.ItemIndex := 1;
  if trim(FTrigger.BASE_OBJECT_TYPE) = 'SCHEMA' then rgTriggerOn.ItemIndex := 2;
  if (trim(FTrigger.BASE_OBJECT_TYPE) = 'VIEW') and (length(FTrigger.COLUMN_NAME)>0) then rgTriggerOn.ItemIndex := 3;
  if trim(FTrigger.BASE_OBJECT_TYPE) = 'DATABASE' then rgTriggerOn.ItemIndex := 4;

  lcObjectName.Text := FTrigger.TABLE_NAME;
  lcbNestedTable.Text := FTrigger.COLUMN_NAME;
  lcbSchema.Text := FTrigger.TABLE_OWNER;

  n := pos('NEW AS ', FTrigger.REFERENCING_NAMES)+7;
  o := pos('OLD AS ', FTrigger.REFERENCING_NAMES)+7;
  p := pos('PARENT AS ',FTrigger.REFERENCING_NAMES);
  if p <= 0 then p := length(FTrigger.REFERENCING_NAMES)+1;
  edtNewAs.Text := copy(FTrigger.REFERENCING_NAMES,n,o-n-8);
  edtOldAs.Text := copy(FTrigger.REFERENCING_NAMES,o,p-o);
  edtParent.Text := copy(FTrigger.REFERENCING_NAMES,p+10, length(FTrigger.REFERENCING_NAMES));

  redtWhenClause.Text := FTrigger.WHEN_CLAUSE;
  if FTrigger.STATUS = 'ENABLED' then rgStatus.ItemIndex := 0
     else rgStatus.ItemIndex := 1;
  redtBody.Text := FTrigger.TRIGGER_BODY;

  if (rgTriggerOn.ItemIndex = 0) and (cbUpdate.Checked) then
  begin
    rgrpUpdateColumns.ItemIndex := 1;
    vTableColumns.First;
    while not vTableColumns.Eof do
    begin
      if pos(vTableColumns.FieldByName('COLUMN_NAME').AsString, FTrigger.DESCRIPTION) > 0 then
      begin
         vTableColumns.edit;
         vTableColumns.FieldByName('CHK').AsInteger := 1;
         vTableColumns.post;
      end;
      vTableColumns.Next;
    end;
  end;  
  rgTriggerOn.Enabled := false;
  gbSchema.Enabled := false;
  gbObject.Enabled := false;
  gbDescription.Enabled := false;
end; //GetTriggerDetail


function TTriggerDetailFrm.SetTriggerDetail: boolean;
var
  columns,
  eachRow,
  nestedTable,
  TableOwnerName: string;
begin
  result := true;
  if edtTriggerName.Text = '' then
  begin
    MessageDlg('Trigger Name must be specified', mtWarning, [mbOk], 0);
    result := false;
    exit;
  end;
  if rgTriggerOn.ItemIndex in [0,1,3] then //table , view, nested
  begin
    if lcObjectSchema.Text = '' then
    begin
      MessageDlg('Object Schema Name must be specified', mtWarning, [mbOk], 0);
      result := false;
      exit;
    end;
    if lcObjectName.Text = '' then
    begin
      MessageDlg('Object Name must be specified', mtWarning, [mbOk], 0);
      result := false;
      exit;
    end;
    if edtNewAs.Text = '' then
    begin
      MessageDlg('New As cannot be left blank', mtWarning, [mbOk], 0);
      result := false;
      exit;
    end;
    if edtOldAs.Text = '' then
    begin
      MessageDlg('Old As cannot be left blank', mtWarning, [mbOk], 0);
      result := false;
      exit;
    end;
    if (rgTriggerOn.ItemIndex = 3) and (edtParent.Text = '') then
    begin
      MessageDlg('Parent As cannot be left blank', mtWarning, [mbOk], 0);
      result := false;
      exit;
    end;
    if (rgTriggerOn.ItemIndex = 3) and (lcbNestedTable.Text = '') then
    begin
      MessageDlg('Nested Table cannot be left blank', mtWarning, [mbOk], 0);
      result := false;
      exit;
    end;
    if (not cbInsert.Checked) and (not cbUpdate.Checked) and (not cbDelete.Checked) then
    begin
      MessageDlg('Select at least one event to fire the trigger on', mtWarning, [mbOk], 0);
      result := false;
      exit;
    end;

  end; //table , view, nested

  if rgTriggerOn.ItemIndex in [2,4] then //schema, database
  begin
    if rgEventType.ItemIndex = 0 then //database
    begin
      if (not cbServerError.Checked) and (not cbLoggon.Checked) and (not cbStartup.Checked)
          and (not cbsuspend.Checked) and (not cbLoggof.Checked) and (not cbShotdown.Checked) then
          begin
            MessageDlg('Select at least one event to fire the trigger on', mtWarning, [mbOk], 0);
            result := false;
            exit;
          end;
    end;
    if rgEventType.ItemIndex = 1 then //ddl
    begin
      if (not cbAlter.Checked) and  (not cbAudit.Checked) and (not cbDisassocStats.Checked) and (not cbNoAudit.Checked) and  (not cbTruncate.Checked) and
         (not cbAnalyze.Checked) and  (not cbComment.Checked) and (not cbDrop.Checked) and (not cbRename.Checked) and  (not cbDDL.Checked) and
         (not cbAssocStats.Checked) and  (not cbCreate.Checked) and (not cbGrant.Checked) and (not cbRevoke.Checked) then
         begin
           MessageDlg('Select at least one event to fire the trigger on', mtWarning, [mbOk], 0);
           result := false;
           exit;
         end;  
    end;
  end; //schema, database

  columns := '';
  nestedTable := '';
  with FTrigger do
  begin
    OWNER := lcbTriggerOwner.Text;
    TRIGGER_NAME := edtTriggerName.Text;
    TRIGGERING_EVENT := '';
    WHEN_CLAUSE := '';
    if rgStatus.ItemIndex = 0 then STATUS := 'ENABLED' else STATUS := 'DISABLED';

    if rgTriggerOn.ItemIndex = 0 then //table
    begin
      if rgFireWhen.ItemIndex = 0 then TRIGGER_TYPE := 'BEFORE' else TRIGGER_TYPE := 'AFTER';
      if cbInsert.Checked then
         TRIGGERING_EVENT := 'INSERT';
      if cbUpdate.Checked then
         if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR UPDATE'
            else TRIGGERING_EVENT := 'UPDATE';
      if cbDelete.Checked then
         if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR DELETE'
            else TRIGGERING_EVENT := 'DELETE';
      TABLE_OWNER := lcObjectSchema.Text;
      BASE_OBJECT_TYPE := 'TABLE';
      TABLE_NAME := lcObjectName.Text;
      COLUMN_NAME := '';
      REFERENCING_NAMES := 'REFERENCING NEW AS '+edtNewAs.Text+' OLD AS '+edtOldAs.Text;
      if (cbUpdate.Checked) and (rgrpUpdateColumns.ItemIndex = 1) then
      begin
        vTableColumns.First;
        while not vTableColumns.Eof do
        begin
          if vTableColumns.FieldByName('CHK').AsInteger = 1 then
             columns := columns + vTableColumns.FieldByName('COLUMN_NAME').AsString+',';
          vTableColumns.Next;
        end;
        if length(columns) > 0 then delete(columns,length(columns),1);
        if length(columns) > 0 then columns := 'OF '+columns+ln;
      end;
      if rgForEach.ItemIndex = 0 then eachRow := 'FOR EACH ROW'+ln else eachRow := '';
      WHEN_CLAUSE := redtWhenClause.Text;
      TableOwnerName := TABLE_OWNER+'.'+TABLE_NAME;
    end; //table

    if rgTriggerOn.ItemIndex = 1 then //view
    begin
      TRIGGER_TYPE := 'INSTEAD OF';
      if cbInsert.Checked then
         TRIGGERING_EVENT := 'INSERT';
      if cbUpdate.Checked then
         if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR UPDATE'
            else TRIGGERING_EVENT := 'UPDATE';
      if cbDelete.Checked then
         if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR DELETE'
            else TRIGGERING_EVENT := 'DELETE';
      TABLE_OWNER := lcObjectSchema.Text;
      BASE_OBJECT_TYPE := 'VIEW';
      TABLE_NAME := lcObjectName.Text;
      COLUMN_NAME := '';
      REFERENCING_NAMES := 'REFERENCING NEW AS '+edtNewAs.Text+' OLD AS '+edtOldAs.Text;
      eachRow := 'FOR EACH ROW'+ln;
      TableOwnerName := TABLE_OWNER+'.'+TABLE_NAME;
    end; //view

    if rgTriggerOn.ItemIndex = 3 then //nested
    begin
      nestedTable := ' NESTED TABLE '+lcbNestedTable.Text+' OF ';
      TRIGGER_TYPE := 'INSTEAD OF';
      if cbInsert.Checked then
         TRIGGERING_EVENT := 'INSERT';
      if cbUpdate.Checked then
         if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR UPDATE'
            else TRIGGERING_EVENT := 'UPDATE';
      if cbDelete.Checked then
         if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR DELETE'
            else TRIGGERING_EVENT := 'DELETE';
      TABLE_OWNER := lcObjectSchema.Text;
      BASE_OBJECT_TYPE := 'VIEW';
      TABLE_NAME := lcObjectName.Text;
      COLUMN_NAME := '';
      REFERENCING_NAMES := 'REFERENCING NEW AS '+edtNewAs.Text+' OLD AS '+edtOldAs.Text+' PARENT AS '+edtParent.Text ;
      eachRow := 'FOR EACH ROW'+ln;
      TableOwnerName := TABLE_OWNER+'.'+TABLE_NAME;
    end; //NESTED


    if rgTriggerOn.ItemIndex in [2,4] then //schema, database
    begin
      if rgFireWhen.ItemIndex = 0 then TRIGGER_TYPE := 'BEFORE' else TRIGGER_TYPE := 'AFTER';

      if rgEventType.ItemIndex = 0 then//database
      begin
        if rgFireWhen.ItemIndex = 0 then //before
        begin
          if (cbLoggof.Checked) then
             if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR LOGOFF' else TRIGGERING_EVENT := 'LOGOFF';
          if (cbShotdown.Checked) then
             if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR SHUTDOWN' else TRIGGERING_EVENT := 'SHUTDOWN';
        end else
        begin //after
          if (cbServerError.Checked) then TRIGGERING_EVENT := 'SERVERERROR';
          if (cbLoggon.Checked) then
             if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR LOGON' else TRIGGERING_EVENT := 'LOGON';
          if (cbStartup.Checked) then
             if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR STARTUP' else TRIGGERING_EVENT := 'STARTUP';
        end;
        if (cbsuspend.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR SUSPEND' else TRIGGERING_EVENT := 'SUSPEND';
      end;

      if rgEventType.ItemIndex = 1 then//ddl
      begin
        if (cbAlter.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR ALTER' else TRIGGERING_EVENT := 'ALTER';
        if (cbAudit.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR AUDIT' else TRIGGERING_EVENT := 'AUDIT';
        if (cbDisassocStats.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR DISASSOCIATE STATISTICS' else TRIGGERING_EVENT := 'DISASSOCIATE STATISTICS';
        if (cbNoAudit.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR NOAUDIT' else TRIGGERING_EVENT := 'NOAUDIT';
        if (cbTruncate.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR TRUNCATE' else TRIGGERING_EVENT := 'TRUNCATE';
        if (cbAnalyze.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR ANALYZE' else TRIGGERING_EVENT := 'ANALYZE';
        if (cbComment.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR COMMENT' else TRIGGERING_EVENT := 'COMMENT';
        if (cbDrop.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR DROP' else TRIGGERING_EVENT := 'DROP';
        if (cbRename.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR RENAME' else TRIGGERING_EVENT := 'RENAME';
        if (cbDDL.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR DDL' else TRIGGERING_EVENT := 'DDL';
        if (cbAssocStats.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR ASSOCIATE STATISTICS' else TRIGGERING_EVENT := 'ASSOCIATE STATISTICS';
        if (cbCreate.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR CREATE' else TRIGGERING_EVENT := 'CREATE';
        if (cbGrant.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR GRANT' else TRIGGERING_EVENT := 'GRANT';
        if (cbRevoke.Checked) then
           if length(TRIGGERING_EVENT) > 0 then TRIGGERING_EVENT := TRIGGERING_EVENT + ' OR REVOKE' else TRIGGERING_EVENT := 'REVOKE';
      end;

      TABLE_OWNER := '';
      BASE_OBJECT_TYPE := 'VIEW';
      TABLE_NAME := '';
      COLUMN_NAME := '';
      REFERENCING_NAMES := '';
      eachRow := '';
      WHEN_CLAUSE := redtWhenClause.Text;
      if rgTriggerOn.ItemIndex = 2 then TableOwnerName := lcbSchema.Text+'.SCHEMA';
      if rgTriggerOn.ItemIndex = 4 then TableOwnerName := 'DATABASE';
    end; //schema

    ACTION_TYPE := 'PL/SQL     ';
    TRIGGER_BODY := redtBody.Text;
    DESCRIPTION := OWNER+'.'+TRIGGER_NAME +ln
                  +TRIGGER_TYPE+' '
                  +TRIGGERING_EVENT+ln
                  +columns
                  +'ON '
                  +nestedTable
                  +TableOwnerName+ln
                  +REFERENCING_NAMES+ln
                  +eachRow+ln;
  end;//with FTrigger

end; //SetTriggerDetail

procedure TTriggerDetailFrm.rgTriggerOnPropertiesChange(Sender: TObject);
begin
  SetProperties;
end;

procedure TTriggerDetailFrm.lcObjectNamePropertiesEditValueChanged(
  Sender: TObject);
begin
  QTableColumns.Close;
  if vTableColumns.Active then vTableColumns.Clear;
  vTableColumns.Close;
  if lcObjectName.Text = '' then exit;
  if (rgTriggerOn.ItemIndex = 0) and (rgrpUpdateColumns.ItemIndex = 1) and (cbUpdate.Checked) then //table
  begin
    QTableColumns.SQL.Text := GetTableColumns(lcObjectName.Text, lcObjectSchema.Text, '');
    QTableColumns.Open;
    vTableColumns.Open;
    while not QTableColumns.Eof do
    begin
      vTableColumns.Append;
      vTableColumns.FieldByName('COLUMN_ID').AsInteger := QTableColumns.FieldByName('COLUMN_ID').AsInteger;
      vTableColumns.FieldByName('COLUMN_NAME').AsString := QTableColumns.FieldByName('COLUMN_NAME').AsString;
      vTableColumns.FieldByName('DATA_TYPE').AsString := QTableColumns.FieldByName('DATA_TYPE').AsString;
      vTableColumns.FieldByName('CHK').AsInteger := 0;
      vTableColumns.Post;
      QTableColumns.Next;
    end;
  end;

  if (rgTriggerOn.ItemIndex = 3) then
     lcbNestedTable.Text := qViewWithNested.FieldByName('COLUMN_NAME').AsString; 
end;

procedure TTriggerDetailFrm.rgrpUpdateColumnsPropertiesChange(
  Sender: TObject);
begin
  lcObjectNamePropertiesEditValueChanged(self);
end;

procedure TTriggerDetailFrm.lcObjectSchemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  SetProperties;
end;

procedure TTriggerDetailFrm.btnExecuteClick(Sender: TObject);
begin
  if not SetTriggerDetail then exit;
  redtDDL.Text := FTrigger.GetDDL;
  if FTrigger.CreateTrigger(redtDDL.Text) then ModalResult := mrOK;
end;

procedure TTriggerDetailFrm.pcPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
    if not SetTriggerDetail then AllowChange := false
       else redtDDL.Text := FTrigger.GetDDL;
    CodeColors(self, 'Default', redtDDL, false);   
  end;
end;



end.
