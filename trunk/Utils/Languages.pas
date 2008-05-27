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
unit Languages;

interface

uses Classes, TypInfo, QTypes, IniFiles, Forms, ComCtrls, SysUtils;

type
  TMultiLanguages = class(TComponent)
  private
    FActiveLanguage: string;
    FActiveFileName: string;
    FLanguages: TStrings;
    FOwner: TComponent;
    FProperties: TStrings;
    function GetObjectCaption(obj:TComponent; PropertyName: string): string;
    function GetTreeNodesCaptions(Nodes: TTreeNodes): string;
    procedure SetObjectCaption(obj: TComponent; AValue: string; PropertyName: string);
    procedure SetTreeNodesCaptions(Nodes: TTreeNodes; const CommaText: string);

  public
    property ActiveLanguage: string read FActiveLanguage write FActiveLanguage;
    property Languages: TStrings read FLanguages write FLanguages;
    procedure SaveObjectList;
    procedure Translate;
    procedure Add(LanguageName, FilePath: string);
    procedure SaveDefault(LanguageName: string);
    function TranslateSentence(ASentence: string): string;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  function ChangeSentence(ASentence, Default: string): string;
  function ReadAllLanguages: TStrings;
  function ReadDefaultLanguage: String;

implementation

const FileCommo = '=';

function ReadAllLanguages: TStrings;
begin
  result := TStringList.Create;
  with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  try
    ReadSectionValues('Language Files', Result);
  finally
    free;
  end;
end;

function ReadDefaultLanguage: String;
begin
  with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  try
    Result := ReadString('Language Options','DefaultLanguage', 'English');
  finally
    free;
  end;
end;


function ChangeSentence(ASentence, Default: string): string;
var
  lng: TMultiLanguages;
  DefaultLanguage: string;
  Lnglist: TStrings;
begin
  Lnglist := TStringList.Create;

  with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  try
    DefaultLanguage := ReadString('Language Options','DefaultLanguage', 'English');
    ReadSectionValues('Language Files', Lnglist);
  finally
    free;
  end;

  lng := TMultiLanguages.Create(nil);
  try
    lng.ActiveLanguage := DefaultLanguage;
    lng.Languages := LngList;
    result := lng.TranslateSentence(ASentence);
  finally
    lng.Free;
  end;

  if result = '' then result := Default;
end;

constructor TMultiLanguages.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOwner := AOwner;
  FLanguages := TStringList.Create();
  FProperties := TStringList.Create();
  FProperties.Add('Caption');
  FProperties.Add('Hint');
  FProperties.Add('Columns.Caption.Text');
end;

destructor TMultiLanguages.Destroy;
begin
  FLanguages.Free();
  FProperties.Free();
  inherited Destroy();
end;

procedure TMultiLanguages.Add(LanguageName, FilePath: string);
begin
  FLanguages.Add(LanguageName+FileCommo+FilePath);

  with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  try
    WriteString('Language Files', LanguageName, FilePath);
  finally
    free;
  end;
end;

procedure TMultiLanguages.SaveDefault(LanguageName: string);
begin
  with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  try
    WriteString('Language Options','DefaultLanguage', LanguageName);
  finally
    free;
  end;
end;      

procedure TMultiLanguages.SaveObjectList;
var
  i,x: integer;
  aCaption: string;
  LngIni: TIniFile;
  formName: string;
begin
  for i := 0 to Languages.Count -1 do
  begin
    if pos(FActiveLanguage, Languages.Strings[i])> 0 then
       FActiveFileName := copy(Languages.Strings[i], Pos(FileCommo, Languages.Strings[i])+1, length(Languages.Strings[i]));
  end;


  LngIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+FActiveFileName);

  if pos('_',TForm(FOwner).Name) > 0 then
     formName := copy(TForm(FOwner).Name, 1, pos('_',TForm(FOwner).Name) -1)
  else
     formName := TForm(FOwner).Name;

  for i:= 0 to FOwner.ComponentCount -1 do
  begin
    for x := 0 to FProperties.Count -1 do
    begin
      try
        aCaption := GetObjectCaption(FOwner.Components[i], FProperties.Strings[x]);
      except
        aCaption := '';
      end;
      if aCaption <> '' then
         LngIni.WriteString(formName, FOwner.Components[i].Name+'.'+FProperties.Strings[x], aCaption);
    end;
  end;

  LngIni.Free;
end;

function TMultiLanguages.GetObjectCaption(obj: TComponent; PropertyName: string): string;
var
  ptrPropInfo : PPropInfo;
  CollObj: TStringList;
  AClass: boolean;
  PropObjValue: TPersistent;
  CollPropInfo: PPropInfo;
  i: integer;
begin
  ptrPropInfo := GetPropInfo(obj.ClassInfo, PropertyName);
  result := '';
  if not Assigned(ptrPropInfo) then Exit;

  case ptrPropInfo^.PropType^.Kind of
      tkString,
      tkLString,
      tkWString,
      tkChar,
      tkWChar: result := GetStrProp(obj, ptrPropInfo);

      tkClass:
        begin
          AClass := False;
          PropObjValue := TPersistent(GetOrdProp(Obj, ptrPropInfo));
          if PropObjValue is TStrings then
          begin
            Result := TStrings(PropObjValue).CommaText;
            AClass := True;
          end;
          if PropObjValue is TTreeNodes then
          begin
            Result := GetTreeNodesCaptions(TTreeNodes(PropObjValue));
            AClass := True;
          end;
          if PropObjValue is TCollection then
          begin
            AClass := True;
            CollObj := TStringList.Create;
            try
              for i:=0 to TCollection(PropObjValue).Count-1 do
              begin
                CollPropInfo := GetPropInfo(TCollection(PropObjValue).Items[i], PropertyName);
                if not Assigned(CollPropInfo) then Continue;
                case CollPropInfo^.PropType^.Kind of
                tkString,
                  tkLString,
                  tkWString,
                  tkChar,
                  tkWChar: CollObj.Add(GetStrProp(TCollection(PropObjValue).Items[i], CollPropInfo));
                tkClass:
                  GetPropValue(TCollection(PropObjValue).Items[i], PropertyName)
                end
              end;
              Result := CollObj.CommaText;
            finally
              CollObj.Free;
            end;

          end;
          if not AClass then
            Result := GetPropValue(PropObjValue, PropertyName);
        end;
    end;
end;

function TMultiLanguages.GetTreeNodesCaptions(Nodes: TTreeNodes): string;
var
  I: integer;
  Captions: TStrings;
begin
  if not Assigned(Nodes) then Exit;
  Captions := TStringList.Create();
  try
    for I := 0 to Nodes.Count - 1 do
      Captions.Add(Nodes[I].Text);
    Result := Captions.CommaText;
  finally
    Captions.Free();
  end;
end;  

procedure TMultiLanguages.Translate;
var
  i: integer;
  LngIni: TIniFile;
  Lnglist: TStrings;
  PropObj: TComponent;
  Index: integer;
  PropName, PropValue, ObjName: string;
  formName : string;
begin
  for i := 0 to Languages.Count -1 do
  begin
    if pos(FActiveLanguage, Languages.Strings[i])> 0 then
       FActiveFileName := copy(Languages.Strings[i], Pos(FileCommo, Languages.Strings[i])+1, length(Languages.Strings[i]));
  end;

  if pos('_',TForm(FOwner).Name) > 0 then
     formName := copy(TForm(FOwner).Name, 1, pos('_',TForm(FOwner).Name) -1)
  else
     formName := TForm(FOwner).Name;



  LngIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+FActiveFileName);
  Lnglist := TStringList.Create;
  LngIni.ReadSectionValues(formName, Lnglist);

  if Lnglist.Count = 0 then
  begin
    SaveObjectList;
    exit;
  end;

  for i:= 0 to Lnglist.Count -1 do
  begin
    PropValue := Lnglist.Strings[i];
    Index := pos('.', PropValue);
    if Index = 0 then PropName := PropValue
    else begin
      ObjName := Copy(PropValue, 1, Index-1);
      Delete(PropValue, 1, Index);
      PropName := Copy(PropValue, 1, pos('=',PropValue)-1 );
      Delete(PropValue, 1, pos('=',PropValue));
    end;
    PropObj := FOwner.FindComponent(ObjName);
    try
      SetObjectCaption(PropObj, PropValue, PropName);
    except
    end;
  end;

  LngIni.Free;
end;   

procedure TMultiLanguages.SetObjectCaption(obj: TComponent; AValue: string; PropertyName: string);
var
  CollObj: TCollection;
  PropInfo: PPropInfo;
  i: integer;
  obj1: TObject;
  isClass: boolean;
  CollList: TStringList;
  ColPropInfo: PPropInfo;
begin
  PropInfo := GetPropInfo(obj.ClassInfo, PropertyName);
  if not Assigned(PropInfo) then Exit;
  CollObj := nil;
  Obj1 := Obj;
  if PropInfo^.PropType^.Kind = tkClass then
  begin
    Obj1 := GetObjectProp(Obj1, PropInfo);
    if Obj1 is TCollection then
      CollObj := Obj1 as TCollection;
  end;

    isClass := False;
    if (CollObj = nil) then
    begin
      if Obj1 is TStrings then
      begin
        TStrings(Obj1).CommaText := AValue;
        isClass := True
      end;
      if Obj1 is TTreeNodes then
      begin
        isClass := True;
        SetTreeNodesCaptions(TTreeNodes(Obj1), AValue);
      end;

      if not isClass then
        if (Assigned(PropInfo)) then
          if (GetStrProp(Obj1, PropInfo) <> '') then
            SetStrProp(Obj1, PropInfo, AValue)
    end
    else begin
      if CollObj.Count = 0 then Exit;
      CollList := TStringList.Create;
      try
        CollList.CommaText := AValue;
        for i:=0 to CollObj.Count-1 do
        begin
          ColPropInfo := GetPropInfo(CollObj.Items[i], PropertyName);
          if Assigned(ColPropInfo) and (i < CollList.Count) then
            if (GetStrProp(CollObj.Items[i], ColPropInfo) <> '') then
              SetStrProp(CollObj.Items[i], ColPropInfo, CollList[i]);
        end;
      finally
        CollList.Free;
      end;
    end;

end;


procedure TMultiLanguages.SetTreeNodesCaptions(Nodes: TTreeNodes; const CommaText: string);
var
  I: integer;
  Captions: TStrings;
begin
  if not Assigned(Nodes) then Exit;
  Captions := TStringList.Create();
  try
    Captions.CommaText := CommaText;
    Nodes.BeginUpdate();
    try
      for I := 0 to Captions.Count - 1 do
        if I < Nodes.Count
          then Nodes.Item[I].Text := Captions[I]
          else Break;
    finally
      Nodes.EndUpdate();
    end;
  finally
    Captions.Free();
  end;
end;

function TMultiLanguages.TranslateSentence(ASentence: string): string;
var
  i: integer;
  LngIni: TIniFile;
begin
  for i := 0 to Languages.Count -1 do
  begin
    if pos(FActiveLanguage, Languages.Strings[i])> 0 then
       FActiveFileName := copy(Languages.Strings[i], Pos(FileCommo, Languages.Strings[i])+1, length(Languages.Strings[i]));
  end;

  LngIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+FActiveFileName);
  try
    result := LngIni.ReadString('Resourcestring', ASentence, '');
  finally
    LngIni.Free;
  end;
end;

end.
