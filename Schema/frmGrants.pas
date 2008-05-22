unit frmGrants;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMemo, cxRichEdit, cxPC, cxControls, StdCtrls, cxButtons, ExtCtrls,
  cxListBox, cxGroupBox, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MemDS, VirtualTable, OraGrants,
  cxImageComboBox, DBAccess, Ora, dximctrl;

type
  TGrantsFrm = class(TForm)
    pc: TcxPageControl;
    tsPrivileges: TcxTabSheet;
    tsDDL: TcxTabSheet;
    redtDDL: TcxRichEdit;
    cxGroupBox1: TcxGroupBox;
    lblObje: TLabel;
    edtTriggerName: TcxTextEdit;
    gridGrantDB: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    vtGrants: TVirtualTable;
    dsGrants: TDataSource;
    qUser: TOraQuery;
    vtGrantsGRANTEE: TStringField;
    vtGrantsSelect: TStringField;
    vtGrantsDelete: TStringField;
    vtGrantsInsert: TStringField;
    vtGrantsUpdate: TStringField;
    vtGrantsAlter: TStringField;
    vtGrantsReferences: TStringField;
    vtGrantsIndex: TStringField;
    vtGrantsOnCommitRefresh: TStringField;
    vtGrantsQueryRewrite: TStringField;
    vtGrantsDebug: TStringField;
    vtGrantsFlashback: TStringField;
    gridGrantDBUSER_NAME: TcxGridDBColumn;
    gridGrantDBSelect: TcxGridDBColumn;
    gridGrantDBDelete: TcxGridDBColumn;
    gridGrantDBInsert: TcxGridDBColumn;
    gridGrantDBUpdate: TcxGridDBColumn;
    gridGrantDBAlter: TcxGridDBColumn;
    gridGrantDBReferences: TcxGridDBColumn;
    gridGrantDBIndex: TcxGridDBColumn;
    gridGrantDBOnCommitRefresh: TcxGridDBColumn;
    gridGrantDBQueryRewrite: TcxGridDBColumn;
    gridGrantDBDebug: TcxGridDBColumn;
    gridGrantDBFlashback: TcxGridDBColumn;
    gridGrantDBExecute: TcxGridDBColumn;
    vtGrantsExecute: TStringField;
    Bevel1: TBevel;
    cxGroupBox2: TcxGroupBox;
    btnCancel: TcxButton;
    btnExecute: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure gridGrantDBCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btnExecuteClick(Sender: TObject);
  private
    { Private declarations }
    FGrantList : TGrantList;
    FResult : Boolean;
    procedure SetProperties;
    procedure GetGrantsDetail;
    function SetGrantsDetail: string;

  public
    { Public declarations }
    function Init(AGrantList : TGrantList): boolean;
  end;

var
  GrantsFrm: TGrantsFrm;

implementation

uses GenelDM, OraScripts, OraUser, OraStorage, VisualOptions;

{$R *.dfm}

function TGrantsFrm.Init(AGrantList : TGrantList): boolean;
begin
  GrantsFrm := TGrantsFrm.Create(Application);
  Self := GrantsFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FResult := false;
  FGrantList := TGrantList.Create;
  FGrantList := AGrantList;
  qUser.Session := FGrantList.OraSession;
  vtGrants.Open;
  SetProperties;
  GetGrantsDetail;
  pc.ActivePage := tsPrivileges;
  caption := 'Object Privileges for '+ FGrantList.TableSchema+'.'+FGrantList.TableName;

  ShowModal;
  result := FResult;
  Free;
end;


procedure TGrantsFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TGrantsFrm.SetProperties;
var i : integer;
begin
  edtTriggerName.Text := FGrantList.TableName;
  qUser.Close;
  qUser.SQL.Text := GetUsersAndRoles;
  qUser.Open;
  while not qUser.Eof do
  begin
    vtGrants.Append;
    vtGrants.FieldByName('GRANTEE').AsString := qUser.FieldByName('name').AsString;
    for i := 1 to 12 do
        vtGrants.Fields[i].AsString := 'NO';
    vtGrants.Post;

    qUser.Next;
  end;
  lblObje.Caption := 'On '+DBFormType[FGrantList.ObjectType]+' :';

  if FGrantList.ObjectType = dbView then
  begin
    gridGrantDBSelect.Visible := true;
    gridGrantDBDelete.Visible := true;
    gridGrantDBInsert.Visible := true;
    gridGrantDBUpdate.Visible := true;
    gridGrantDBAlter.Visible := false;
    gridGrantDBReferences.Visible := false;
    gridGrantDBIndex.Visible := false;
    gridGrantDBOnCommitRefresh.Visible := false;
    gridGrantDBQueryRewrite.Visible := false;
    gridGrantDBDebug.Visible := true;
    gridGrantDBFlashback.Visible := true;
    gridGrantDBExecute.Visible := false;
  end;

  if FGrantList.ObjectType = dbSequences then
  begin
    gridGrantDBSelect.Visible := true;
    gridGrantDBDelete.Visible := false;
    gridGrantDBInsert.Visible := false;
    gridGrantDBUpdate.Visible := false;
    gridGrantDBAlter.Visible := true;
    gridGrantDBReferences.Visible := false;
    gridGrantDBIndex.Visible := false;
    gridGrantDBOnCommitRefresh.Visible := false;
    gridGrantDBQueryRewrite.Visible := false;
    gridGrantDBDebug.Visible := false;
    gridGrantDBFlashback.Visible := false;
    gridGrantDBExecute.Visible := false;
  end;

  if FGrantList.ObjectType in [dbProcedures,dbFunctions,dbPackages,dbTypes] then
  begin
    gridGrantDBSelect.Visible := false;
    gridGrantDBDelete.Visible := false;
    gridGrantDBInsert.Visible := false;
    gridGrantDBUpdate.Visible := false;
    gridGrantDBAlter.Visible := false;
    gridGrantDBReferences.Visible := false;
    gridGrantDBIndex.Visible := false;
    gridGrantDBOnCommitRefresh.Visible := false;
    gridGrantDBQueryRewrite.Visible := false;
    gridGrantDBDebug.Visible := true;
    gridGrantDBFlashback.Visible := false;
    gridGrantDBExecute.Visible := true;
  end;

end;

procedure TGrantsFrm.GetGrantsDetail;
var i : integer;
begin
  if FGrantList.GrantCount = 0 then exit;
  for i := 0 to FGrantList.GrantCount-1 do
  begin
     if vtGrants.Locate('GRANTEE',FGrantList.GrantItems[i].Grantee,[]) then
     begin
       vtGrants.Edit;

       if FGrantList.GrantItems[i].Grantable = 'YES' then
          vtGrants.FieldByName(FGrantList.GrantItems[i].Privilege).AsString := 'GRANTABLE'
       else
          vtGrants.FieldByName(FGrantList.GrantItems[i].Privilege).AsString := 'YES';
       vtGrants.Post;
     end;                                                   
  end;
  vtGrants.First;
end;

function TGrantsFrm.SetGrantsDetail: string;
var
  i,x : integer;
  FGrant: TGrant;
  NGrantList : TGrantList;
begin
  NGrantList := TGrantList.Create;
  NGrantList.CopyFrom(FGrantList);

  vtGrants.First;
  while not vtGrants.Eof do
  begin
    for i := 1 to 12 do
    begin
      x := NGrantList.FindByGrants(vtGrants.FieldByName('GRANTEE').AsString,Uppercase( vtGrants.Fields[i].FieldName));
      if x >= 0 then
         if vtGrants.Fields[i].AsString = 'NO' then
            NGrantList.GrantItems[x].Grantable := ''
         else if vtGrants.Fields[i].AsString = 'YES' then
           NGrantList.GrantItems[x].Grantable := 'NO'
         else
           NGrantList.GrantItems[x].Grantable:= 'YES';
      if x < 0 then
      begin
        if vtGrants.Fields[i].AsString <> 'NO' then
        begin
          new(FGrant);
          FGrant^.Grantor := NGrantList.TableSchema;
          FGrant^.Grantee := vtGrants.FieldByName('GRANTEE').AsString;
          FGrant^.TableSchema := NGrantList.TableSchema;
          FGrant^.TableName := NGrantList.TableName;
          FGrant^.Privilege := vtGrants.Fields[i].FieldName;
          if vtGrants.Fields[i].AsString = 'YES' then
             FGrant^.Grantable := 'NO'
           else
             FGrant^.Grantable := 'YES';
          FGrant^.Hierarchy := 'NO';
          NGrantList.GrantAdd(FGrant);
        end;
      end;
    end; //for
    vtGrants.Next;
  end;
  result := NGrantList.GetDDL;
end; //SetGrantsDetail


procedure TGrantsFrm.pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
  if NewPage = tsDDL then
  begin
     redtDDL.Text := SetGrantsDetail;
  end;
end;

procedure TGrantsFrm.gridGrantDBCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var i : integer;
begin
  for i := 1 to 12 do
  begin
    if AViewInfo.GridRecord.Values[i] <> 'NO' then
    begin
      ACanvas.Canvas.Brush.Style := bsSolid;
      ACanvas.Canvas.Brush.Color := clYellow;
      ACanvas.Canvas.FillRect(AViewInfo.Bounds);
    end;
  end;
end;   

procedure TGrantsFrm.btnExecuteClick(Sender: TObject);
begin
  redtDDL.Text := SetGrantsDetail;
  if FGrantList.Grant(redtDDL.Text) then
  begin
    FResult := true;
    close;
  end;
end;

end.
