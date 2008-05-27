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
unit frmSchemaPublicEvent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel,
  cxPC, cxControls, StdCtrls, cxButtons, ExtCtrls,
  Ora, OraStorage, GenelDM;

type
  TSchemaPublicEventFrm = class(TForm)
    Panel1: TPanel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    Panel2: TPanel;
    imgToolBar: TImage;
    imgObject: TImage;
    Shape1: TShape;
    lblAction: TLabel;
    lblObjectName: TcxLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FResult : boolean;
    FObj: TObject;
    FOraEvent: TOraEvent;        
  public
    { Public declarations }
    function Init(obj: TObject; OEvent: TOraEvent): boolean;
  end;

var
  SchemaPublicEventFrm: TSchemaPublicEventFrm;

implementation

{$R *.dfm}

uses OraSynonym, OraSequence, OraProcSource, OraDBLink, OraTriger, OraConstraint,
     OraIndex, OraView, VisualOptions, OraUser, OraDirectory, OraRollbackSegment,
     OraTablespace;
     
function TSchemaPublicEventFrm.Init(Obj: TObject; OEvent: TOraEvent): boolean;
var
  objectID: integer;
begin
  SchemaPublicEventFrm := TSchemaPublicEventFrm.Create(Application);
  Self := SchemaPublicEventFrm;
  DMGenel.ChangeLanguage(self);
  ChangeVisualGUI(self);
  FObj := Obj;
  FOraEvent := OEvent;
  FResult := false;
  objectID := 0;

  if (FObj is TSynonymList) then
  begin
    lblObjectName.Caption := TSynonymList(FObj).SynonymItems[0].SynonymName;
    objectID := Integer(TDBFormType(dbSynonyms));
  end;

  if (FObj is TSequence) then
  begin
    lblObjectName.Caption := 'Sequence [ '+TSequence(FObj).SEQUENCE_NAME+' ]';
    objectID := Integer(TDBFormType(dbSequences));
  end;

  if (FObj is TProcSource) then
  begin
    lblObjectName.Caption := TProcSource(FObj).SOURCE_NAME;
    if TProcSource(FObj).SOURCE_TYPE = stProcedure then objectID := Integer(TDBFormType(dbProcedures));
    if TProcSource(FObj).SOURCE_TYPE = stPackage then objectID := Integer(TDBFormType(dbPackages));
    if TProcSource(FObj).SOURCE_TYPE = stTrigger then objectID := Integer(TDBFormType(dbTriggers));
    if TProcSource(FObj).SOURCE_TYPE = stFunction then objectID := Integer(TDBFormType(dbFunctions));
    if TProcSource(FObj).SOURCE_TYPE = stType then objectID := Integer(TDBFormType(dbTypes));
  end;

  if (FObj is TSynonyms) then
  begin
    lblObjectName.Caption := TSynonyms(FObj).SYNONYM_NAME;
    objectID := Integer(TDBFormType(dbSynonyms));
  end;

  if (FObj is TDBLink) then
  begin
    lblObjectName.Caption := TDBLink(FObj).DB_LINK;
    objectID := Integer(TDBFormType(dbDatabaseLinks));
  end;

  if (FObj is TTrigger) then
  begin
    lblObjectName.Caption := TTrigger(FObj).TRIGGER_NAME;
    objectID := Integer(TDBFormType(dbTriggers));
  end;

  if (FObj is TSynonymList) then
  begin
    lblObjectName.Caption := TSynonymList(FObj).SynonymItems[0].SynonymName;
    objectID := Integer(TDBFormType(dbSynonyms));
  end;

  if (FObj is TColumnList) then
  begin
    lblObjectName.Caption := TColumnList(FObj).TableName+'.'+TColumnList(FObj).Items[0].ColumnName;
    objectID := Integer(TDBFormType(dbColumns));
  end;

  if (FObj is TConstraint) then
  begin
    lblObjectName.Caption := TConstraint(FObj).ConstraintName;
    objectID := Integer(TDBFormType(dbConstraint));
  end;

  if (FObj is TTableIndex) then
  begin
    lblObjectName.Caption := TTableIndex(FObj).IndexName;
    objectID := Integer(TDBFormType(dbIndexes));
  end;

  if (FObj is TView) then
  begin
    lblObjectName.Caption := TView(FObj).VIEW_NAME;
    objectID := Integer(TDBFormType(dbView));
  end;

  if (FObj is TUser) then
  begin
    lblObjectName.Caption := TUser(FObj).USERNAME;
    objectID := Integer(TDBFormType(dbUsers));
  end;

  if (FObj is TDBDirectory) then
  begin
    lblObjectName.Caption := TDBDirectory(FObj).DIRECTORY_NAME;
    objectID := Integer(TDBFormType(dbDirectories));
  end;

  if (FObj is TRollbackSegment) then
  begin
    lblObjectName.Caption := TRollbackSegment(FObj).SEGMENT_NAME;
    objectID := Integer(TDBFormType(dbRollbackSegments));
  end;

  if (FObj is TTablespace) then
  begin
    lblObjectName.Caption := TTablespace(FObj).TABLESPACE_NAME;
    objectID := Integer(TDBFormType(dbTablespaces));
  end;

  dmGenel.ilSchemaBrowser.GetBitmap(objectID,imgObject.Picture.Bitmap);

  Caption := OraEvent[FOraEvent]+' '+DBFormType[TDBFormType(objectID)];
  lblAction.Caption := 'Are you sure you want to '+UpperCase(OraEvent[FOraEvent])+' selected '+DBFormType[TDBFormType(objectID)]+' ?';

  ShowModal;
  result := FResult;
  Free;
end;


procedure TSchemaPublicEventFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TSchemaPublicEventFrm.btnOKClick(Sender: TObject);
begin
  btnOK.Enabled := false;
  if (FObj is TSynonymList) then
  begin
    if FOraEvent = oeDrop then FResult := TSynonymList(FObj).DropSynonym;
  end;

  if (FObj is TSequence) then
  begin
    if FOraEvent = oeDrop then FResult := TSequence(FObj).DropSequence;
  end;

  if (FObj is TProcSource) then
  begin
    if FOraEvent = oeDrop then FResult := TProcSource(FObj).DropSource;
    if FOraEvent = oeCompile then
    begin
      FResult := TProcSource(FObj).CompileSource;
      FResult := true;
    end;
  end;

  if (FObj is TSynonyms) then
  begin
    if FOraEvent = oeDrop then FResult := TSynonyms(FObj).DropSynonym;
  end;

  if (FObj is TSynonymList) then
  begin
    if FOraEvent = oeDrop then FResult :=  TSynonymList(FObj).DropSynonym;
  end;
    
  if (FObj is TDBLink) then
  begin
    if FOraEvent = oeDrop then FResult := TDBLink(FObj).DropDBLink;
  end;

  if (FObj is TTrigger) then
  begin
    if FOraEvent = oeDrop then FResult := TTrigger(FObj).DropTrigger;
    if FOraEvent = oeEnable then FResult := TTrigger(FObj).EnableTrigger;
    if FOraEvent = oeDisable then FResult := TTrigger(FObj).DisableTrigger;
    if FOraEvent = oeCompile then
    begin
      TTrigger(FObj).CompileTrigger;
      FResult := True;
    end;
  end;

  if (FObj is TColumnList) then
  begin
    if FOraEvent = oeDrop then FResult := TColumnList(FObj).DropColumn;
  end;

  if (FObj is TConstraint) then
  begin
    if FOraEvent = oeDrop then FResult := TConstraint(FObj).DropConstraint;
    if FOraEvent = oeEnable then FResult := TConstraint(FObj).EnableConstraint;
    if FOraEvent = oeDisable then FResult := TConstraint(FObj).DisableConstraint;
  end;

  if (FObj is TTableIndex) then
  begin
    if FOraEvent = oeDrop then FResult := TTableIndex(FObj).DropIndex;
    if FOraEvent = oeRebuild then FResult := TTableIndex(FObj).RebuildIndex;
    if FOraEvent = oeCoalesce then FResult := TTableIndex(FObj).CoalesceIndex;
  end;

  if (FObj is TView) then
  begin
    if FOraEvent = oeDrop then FResult := TView(FObj).DropView;
    if FOraEvent = oeCompile then FResult := TView(FObj).CompileView;
    if FOraEvent = oeDisableTriggers then FResult := TView(FObj).DisableALLTriggers;
    if FOraEvent = oeEnableTriggers then FResult := TView(FObj).EnableALLTriggers;
  end;

  if (FObj is TUser) then
  begin
    if FOraEvent = oeDrop then FResult := TUser(FObj).DropUser;
  end;

  if (FObj is TDBDirectory) then
  begin
    if FOraEvent = oeDrop then FResult := TDBDirectory(FObj).DropDBDirectory;
  end;

  if (FObj is TRollbackSegment) then
  begin
    if FOraEvent = oeDrop then FResult := TRollbackSegment(FObj).DropRollbackSegment;
    if FOraEvent = oeOffLine then FResult := TRollbackSegment(FObj).RollbackSegmentToOffline;
    if FOraEvent = oeOnLine then FResult := TRollbackSegment(FObj).RollbackSegmentToOnline
  end;

  if (FObj is TTablespace) then
  begin
    if FOraEvent = oeDrop then FResult := TTablespace(FObj).DropTablespace;
    if FOraEvent = oeOffLine then FResult := TTablespace(FObj).TablespaceToOffline;
    if FOraEvent = oeOnLine then FResult := TTablespace(FObj).TablespaceToOnline
  end;

  if FResult then close;
end;

end.
