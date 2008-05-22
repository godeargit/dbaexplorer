unit frmProcedureRun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, MemDS, VirtualTable, cxContainer, cxTextEdit,
  cxMemo, cxRichEdit, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxSplitter, OraProcSource;

type
  TProcedureRunFrm = class(TForm)
    Panel1: TPanel;
    btnExecute: TcxButton;
    btnCancel: TcxButton;
    Panel2: TPanel;
    Panel3: TPanel;
    cxSplitter1: TcxSplitter;
    gridDBParams: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    edtSQL: TcxRichEdit;
    vtParams: TVirtualTable;
    dsParams: TDataSource;
    gridDBParamsNAME: TcxGridDBColumn;
    gridDBParamsDATA_TYPE: TcxGridDBColumn;
    gridDBParamsMODE: TcxGridDBColumn;
    gridDBParamsVALUE: TcxGridDBColumn;
    vtParamsobject_name: TStringField;
    vtParamssequence: TIntegerField;
    vtParamsargument_name: TStringField;
    vtParamsDATA_SIZE: TStringField;
    vtParamsdata_type: TStringField;
    vtParamsin_out: TStringField;
    vtParamsVALUE: TStringField;
    gridDBParamsColumn1: TcxGridDBColumn;
    procedure btnCancelClick(Sender: TObject);
    procedure gridDBParamsEditValueChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure btnExecuteClick(Sender: TObject);
  private
    { Private declarations }
    ProcSource: TProcSource;
    procedure GetParameters;
    procedure SetParameters;
  public
    { Public declarations }
    procedure Init(FProcSource: TProcSource);
  end;

var
  ProcedureRunFrm: TProcedureRunFrm;

implementation

{$R *.dfm}
uses Util, VisualOptions, GenelDM;

procedure TProcedureRunFrm.Init(FProcSource: TProcSource);
begin
  ProcedureRunFrm := TProcedureRunFrm.Create(Application);
  Self := ProcedureRunFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  ProcSource := FProcSource;
  GetParameters;
  SetParameters;
  ShowModal;
  Free;
end;

procedure TProcedureRunFrm.GetParameters;
begin
  vtParams.Close;
  vtParams.Tag := 9;
  vtParams.Assign(ProcSource.Arguments);
  vtParams.Open;
  vtParams.AddField('VALUE',ftString,50);

  with vtParams do
  begin
    while not Eof do
    begin
      edit;
      FieldByName('VALUE').AsString := 'NULL';
      post;
      next;
    end;
  end;
  vtParams.Tag := 0;
end;

procedure TProcedureRunFrm.SetParameters;
var
  param, paramsStr, paramsValue: string;
  i: integer;
begin
  i := 0;
  with vtParams do
  begin
    First;
    while not Eof do
    begin
      inc(i);
      paramsStr := paramsStr +ln+'  '+FieldByName('argument_name').AsString
                                +' '+FieldByName('data_type').AsString;
      if FieldByName('DATA_SIZE').AsString <> '' then
         paramsStr := paramsStr +'('+FieldByName('DATA_SIZE').AsString+')';
      paramsStr := paramsStr +';';
      paramsValue := paramsValue +ln+'  '+FieldByName('argument_name').AsString
                                 +' := '+GetColumnValue(FieldByName('data_type').AsString,FieldByName('VALUE').AsString )
                                 +';';
      param := param +'  '+FieldByName('argument_name').AsString;
      Next;
      if i <> RecordCount then param := param +',';
    end;
  end;

  edtSQL.Text :='DECLARE'
                +paramsStr
                +ln+'BEGIN'
                +paramsValue
                +ln+'  '+ProcSource.OWNER+'.'+ProcSource.SOURCE_NAME;
  if paramsStr <> '' then
     edtSQL.Text := edtSQL.Text + '('+param+')';

  edtSQL.Text := edtSQL.Text +';'+ln
                              +'  COMMIT;'+ln
                              +'END;';
  CodeColors(self, 'Default', edtSQL, false);                            
end;


procedure TProcedureRunFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TProcedureRunFrm.gridDBParamsEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  SetParameters;
end;

procedure TProcedureRunFrm.btnExecuteClick(Sender: TObject);
begin
  ProcSource.RunSource(edtSQL.Text);
  close;
end;

end.
