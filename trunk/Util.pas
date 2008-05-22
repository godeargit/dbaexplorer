unit Util;

interface

uses Global, SysUtils, windows, Graphics, forms, ComCtrls, cxRichEdit, DB,
     variants, ora, Classes, VirtualTable, cxListView;

function isNVL(value, newValue: variant): variant;
function isNull(value:string): string;
function isNullorZero(value,DefaultValue:string): boolean; overload;
function isNullorZero(value,DefaultValue: integer): boolean; overload;
function isNullorZero(value,DefaultValue: Extended): boolean; overload;
function ln: string;
function Str(s: string): string;
function Date(d: string): string;
function CompareStr(str1, str2: string): boolean;
procedure debug(txt: String);
function getFirstWord( text: String ): String;
function ExpectResultSet(ASql: String): Boolean;
function ExpectScriptSet(ASql: String): Boolean;
function GetColumnType(OraFieldName: string): string;
function GetColumnValue(OraFieldName, Value: string): string;
procedure DrawGradient(Canvas: TCanvas; const ARect: TRect;
  FromColor, ToColor: TColor; AStepCount: Integer; IsVertical: Boolean = False);
procedure CodeColors(Form : TForm; Style :String;  RichE : TcxRichedit; InVisible   :   Boolean);

function GetInsertSQLWithData(TableName: string; QTable: TOraQuery; SelectedList: TStringList): string;

function GetInsertSQL(TableName: string; FieldList: TFieldDefs): string;
function GetUpdateSQL(TableName: string; FieldList: TFieldDefs): string;
function GetDeleteSQL(TableName: string; FieldList: TFieldDefs): string;
procedure DuplicateCurrentRecord(aDataSet : TDataSet);

procedure CopyDataSet(Source: TDataSet; Target: TVirtualTable);
procedure FillViewHorizontal(Source: TDataset; ViewName: TcxListView);

function BoolToStr(value: boolean; boolType: string): string;
function FormatColumnName(ColumnName: string): string;

implementation


var
  dbgCounter: Integer = 0;

function FormatColumnName(ColumnName: string): string;
var
  str: string;
  i: integer;
begin
  result := ColumnName;
  while Pos('_', result) > 0 do
    result[Pos('_', result)] := ' ';

  str := AnsiUpperCase(result[1]);
  i := 1;

  repeat
    i:=i+1;
    if (result[i-1] = ' ') then
      str := str + AnsiUpperCase(result[i])
    else
      str := str + AnsiLowerCase(result[i]);
  until length(str) = length(result);

  result := str;
end;

function BoolToStr(value: boolean; boolType: string): string;
begin
  if boolType = 'YN' then
  begin
  if value then result := 'Yes'
     else result := 'No';
  end;

  if boolType = 'TF' then
  begin
  if value then result := 'True'
     else result := 'False';
  end;
end;

procedure FillViewHorizontal(Source: TDataset; ViewName: TcxListView);
var
  i: integer;
begin
  ViewName.Items.Clear;
  Source.First;
  while not Source.Eof do
  begin
    with ViewName.Items.Add do
    begin
      Caption := Source.Fields[0].Text;
      ImageIndex := -1;
    end;
    for i := 1 to Source.FieldCount -1 do
       ViewName.Items[ViewName.Items.count-1].SubItems.Add(Source.Fields[i].Text);
    Source.Next;
  end;
end;

procedure CopyDataSet(Source: TDataSet; Target: TVirtualTable);
var
  i: integer;
begin
  if not Source.Active then exit;
  Target.close;
  Target.FieldDefs.Clear;
  Source.First;
  
  for i := 0 to Source.FieldCount - 1 do
  begin
    if not (Source.Fields[i].DataType in [ftVarBytes, ftTypedBinary, ftGraphic,ftOraBlob,ftOraClob])
    then
      Target.AddField(Source.Fields[i].FieldName, Source.Fields[i].DataType, Source.Fields[i].Size);
  end;
  Target.open;

  while not Source.Eof do
  begin
    Target.Append;

    for i := 0 to Target.FieldCount - 1 do
    begin
       if Target.Fields[i].DataType in [ftString, ftMemo] then
          Target.Fields[i].AsString := Source.FieldByName(Target.Fields[i].FieldName).AsString
       else
          Target.Fields[i].AsVariant := Source.FieldByName(Target.Fields[i].FieldName).AsVariant;
    end;
    Target.Post;
    Source.Next;
  end;
  Source.First;
end; //CopyDataSet

procedure DuplicateCurrentRecord(aDataSet : TDataSet);
var 
  Data : array of variant; 
  aRecord : array of TVarRec; 
  i : integer; 
  max : integer; 
begin 
  max := aDataSet.fields.count -1; 
  // set the lenghth of the arecord array to be the same as the number of 
  // elements in the data array 
  SetLength(arecord,max+1); 
  SetLength(data,max+1); 

  // set the variant type pointers to the data array 
  for i := 0 to max do 
  begin 
    arecord[i].VType := vtVariant; 
    arecord[i].VVariant := @data[i]; 
  end; 

  // Copy the Record to the Array 
  for i := 0 to max do 
    Data[i] := aDataSet.fields[i].value; 

  // finally append the record in one go 
  //aDataSet.AppendRecord(aRecord);
  aDataSet.InsertRecord(aRecord); 
end; 

function GetInsertData(TableName: string; QTable: TOraQuery): string;
var
  i: integer;
  ins,val: string;
  FieldData: string;
begin
  with QTable do
  begin
    result := 'INSERT INTO '+TableName+ln;
    for i := 0 to FieldCount -1 do
    begin
      if UPPERCASE(Fields[i].FieldName) = 'ROWID' then continue;
      ins := ins + Fields[i].FieldName;
      FieldData := '';

      if Fields[i].Value = Null then
         FieldData := 'NULL'
      else
      case Fields[i].DataType of
        ftString, ftWideString:
           begin
               FieldData := Fields[i].AsString;
               FieldData := StringReplace(FieldData,'''','´',[rfReplaceAll]);
               FieldData := Str(FieldData);
           end;
        ftSmallint, ftInteger : FieldData := Fields[i].AsString;
        ftFloat,ftCurrency: FieldData := Fields[i].AsString; //Trim(Format('%8f', [Fields[i].AsFloat]));
        ftDate : FieldData := 'to_date('+Str(Fields[i].AsString)+', ''dd.mm.yyyy'')';
        ftTime : FieldData := FormatDateTime('hh:mm', Fields[i].AsDateTime);
        ftDateTime,ftTimeStamp : FieldData := 'to_date('+str(Fields[i].AsString)+', ''dd.mm.yyyy HH:MI:SS AM'')';
        ftLargeint : FieldData := Fields[i].AsString;
        ftMemo,ftBlob, ftTypedBinary, ftGraphic,ftOraBlob,ftOraClob  : FieldData := 'NULL';
        else
           FieldData := 'NULL';
      end; //case
      val := val + FieldData;
      if i <> FieldCount -1 then
      begin
        ins := ins + ', ';
        val := val + ', ';
      end;
    end; //for

  end; //QTable with  
  result := result +'  ( '+ins+ ' ) '+ln
                   +'VALUES '+ln
                   +'  ( '+val+ ' ); '+ln;
end;

function GetInsertSQLWithData(TableName: string; QTable: TOraQuery; SelectedList: TStringList): string;
var
  i: integer;
begin
  result := '';
  for i := 0 to SelectedList.Count -1 do
  begin
    QTable.Locate(QTable.Fields[0].FieldName, SelectedList[i], []);
    result := result + GetInsertData(TableName, QTable);
  end;
end; //GetInsertSQL


function GetInsertSQL(TableName: string; FieldList: TFieldDefs): string;
var
  i: integer;
  ins,val: string;
  ADataType: TFieldType;
begin
  result := 'INSERT INTO '+TableName+ln;
  for i := 0 to FieldList.Count -1 do
  begin
    if UPPERCASE(FieldList[i].Name) = 'ROWID' then continue;
    ins := ins + FieldList[i].Name;

    ADataType := TFieldType(FieldList[i].DataType);
    if (ADataType = ftOraBlob) then
       val := val + ' empty_blob() '
    else if (ADataType = ftOraClob) then
       val := val + ' empty_clob() '
    else
       val := val + ':'+FieldList[i].Name;

    if i <> FieldList.Count -1 then
    begin
      ins := ins + ', ';
      val := val + ', ';
    end;
  end;
  result := result +'  ( '+ins+ ' ) '+ln
                   +'VALUES '+ln
                   +'  ( '+val+ ' ) ';
end; //GetInsertSQL

function GetUpdateSQL(TableName: string; FieldList: TFieldDefs): string;
var
  i: integer;
  up: string;
  ADataType: TFieldType;
begin
  result := 'UPDATE '+TableName+ln
           +'SET '+ln;
  for i := 0 to FieldList.Count -1 do
  begin
    if UPPERCASE(FieldList[i].Name) = 'ROWID' then continue;

    ADataType := TFieldType(FieldList[i].DataType);
    if (ADataType = ftOraBlob) then
       up := up + FieldList[i].Name + ' empty_blob() '
    else if (ADataType = ftOraClob) then
       up := up + FieldList[i].Name + ' empty_clob() '
    else
       up := up + FieldList[i].Name + ' = :'+FieldList[i].Name;

    if i <> FieldList.Count -1 then
      up := up + ', ';
  end;

  result := result + up + ln
                   +' WHERE ROWID = :OLD_ROWID '+ln;
end; //GetUpdateSQL

function GetDeleteSQL(TableName: string; FieldList: TFieldDefs): string;
begin
  result := 'DELETE '+TableName+ln
           +' WHERE ROWID = :OLD_ROWID '+ln;
end; //GetDeleteSQL

function isNVL(value, newValue: variant): variant;
begin
  if VarIsNull(value) then result := newValue else result := value;
end;

function isNull(value:string): string;
begin
  if length(value) > 0 then result := value
    else result := '0';
end;

function isNullorZero(value,DefaultValue: string): boolean; overload;
begin
  if (value <> '') and (value <> '0') and( value <> DefaultValue) then result := true
    else result := false;
end;

function isNullorZero(value,DefaultValue: integer): boolean; overload;
begin
  if (value <> 0) and( value <> DefaultValue) then result := true
    else result := false;
end;

function isNullorZero(value,DefaultValue: Extended): boolean; overload;
begin
  if (value <> 0) and( value <> DefaultValue) then result := true
    else result := false;
end;


function ln: string;
begin
  result := #13#10;
end;

function Str(s: string): string;
begin
  result := #39 + s + #39;
end;

function Date(d: string): string;
begin
  result := 'to_date('+Str(d)+', ''dd.mm.yyyy'')';
end;

function CompareStr(str1, str2: string): boolean;
var
  s1,s2: string;
begin
  s1 := str1; s2 := str2;

  while Pos(#$D, S1) > 0 do delete(s1, Pos(#$D, S1), 1);
  while Pos(#$A, S1) > 0 do delete(s1, Pos(#$A, S1), 1);

  while Pos(#$D, S2) > 0 do delete(s2, Pos(#$D, S2), 1);
  while Pos(#$A, S2) > 0 do delete(s2, Pos(#$A, S2), 1);

  result := s1 = s2;
end;

procedure debug(txt: String);
begin
  if length(txt) = 0 then txt := '(debug: blank output?)';
  // Todo: not thread safe.
  dbgCounter := dbgCounter + 1;
  txt := Format(APPNAME+': %d %s', [dbgCounter, txt]);
  OutputDebugString(PChar(txt));
end;


function ExpectResultSet(ASql: String): Boolean;
const
  RESULTSET_KEYWORDS : array[0..9] of string[10] =
  (
   //'ANALYZE',
   'CALL',
   'CHECK',
   'DESC',
   'DESCRIBE',
   'EXECUTE',
   'HELP',
   'OPTIMIZE',
   'REPAIR',
   'SELECT',
   'SHOW'
  );
  NOTRESULTSET_SENTENCE : string[12] = 'INTO OUTFILE';
var
  kw : String;
  i : Integer;
begin
  Result := False;

  // Find keyword and check existance in const-array of resultset-keywords
  kw := UpperCase( getFirstWord( ASql ) );
  for i := Low(RESULTSET_KEYWORDS) to High(RESULTSET_KEYWORDS) do
  begin
    if kw = RESULTSET_KEYWORDS[i] then
    begin
      Result := True;
      break;
    end;
  end;
  if Pos(NOTRESULTSET_SENTENCE, UpperCase(ASql)) > 0 then Result := False;
end;


function ExpectScriptSet(ASql: String): Boolean;
const
  RESULTSET_KEYWORDS : array[0..3] of string[10] =
  (
   'DROP',
   'ALTER',
   'CREATE',
   'GRANT'
  );
  NOTRESULTSET_SENTENCE : string[12] = 'INTO OUTFILE';
var
  kw : String;
  i : Integer;
begin
  Result := False;
  kw := UpperCase( getFirstWord( ASql ) );
  for i := Low(RESULTSET_KEYWORDS) to High(RESULTSET_KEYWORDS) do
  begin
    if kw = RESULTSET_KEYWORDS[i] then
    begin
      Result := True;
      break;
    end;
  end;
  if Pos(NOTRESULTSET_SENTENCE, UpperCase(ASql)) > 0 then Result := False;
end;


{***
  Returns first word of a given text
  @param string Given text
  @return string First word-boundary
}
function getFirstWord( text: String ): String;
var
  i : Integer;
  wordChars : Set of Char;
begin
  result := '';
  text := trim( text );
  wordChars := ['a'..'z', 'A'..'Z', '0'..'9', '_', '-'];
  i := 1;

  // Find beginning of the first word, ignoring non-alphanumeric chars at the very start
  // @see bug #1692828
  while i < Length(text) do
  begin
    if (text[i] in wordChars) then
    begin
      // Found beginning of word!
      break;
    end;
    if i = Length(text)-1 then
    begin
      // Give up in the very last loop, reset counter
      // and break. We can't find the start of a word
      i := 1;
      break;
    end;
    inc(i);
  end;

  // Add chars as long as they're alpha-numeric
  while i < Length(text) do
  begin
    if (text[i] in wordChars) then
    begin
      result := result + text[i];
    end
    else
    begin
      // Stop here because we found a non-alphanumeric char.
      // This applies to all different whitespaces, brackets, commas etc.
      break;
    end;
    inc(i);
  end;
end;

function GetColumnValue(OraFieldName, Value: string): string;
begin
  if Value = 'NULL' then
  begin
    result := 'NULL';
    exit;
  end;
  if OraFieldName  = 'BFILE'        then result :='NULL';
  if OraFieldName  = 'BINARY_DOUBLE'then result :='NULL';
  if OraFieldName  = 'BINARY_FLOAT' then result :='NULL';
  if OraFieldName  = 'BLOB'         then result :='NULL';
  if OraFieldName  = 'CHAR'         then result :=str(Value);
  if OraFieldName  = 'CLOB'         then result :='NULL';
  if OraFieldName  = 'DATE'         then result :=Date(Value);
  if OraFieldName  = 'FLOAT'        then result :=Value;
  if OraFieldName  = 'LONG'         then result :=Value;
  if OraFieldName  = 'LONG RAW'     then result :='NULL';
  if OraFieldName  = 'MLSLABEL'     then result :='NULL';
  if OraFieldName  = 'NCHAR'        then result :=str(Value);
  if OraFieldName  = 'NCLOB'        then result :='NULL';
  if OraFieldName  = 'NUMBER'       then result :=value;
  if OraFieldName  = 'NVARCHAR2'    then result :=str(Value);
  if OraFieldName  = 'RAW'          then result :='NULL';
  if OraFieldName  = 'ROWID'        then result :='NULL';
  if OraFieldName  = 'URITYPE'      then result :='NULL';
  if OraFieldName  = 'UROWID'       then result :='NULL';
  if OraFieldName  = 'VARCHAR2'     then result :=str(Value);
  if OraFieldName  = 'CHAR VARYING' then result :=value;
  if OraFieldName  = 'CHARACTER'    then result :=str(Value);
  if OraFieldName  = 'CHARACTER VARYING' then result :=value;
  if OraFieldName  = 'DECIMAL'           then result :=value;
  if OraFieldName  = 'DOUBLE PRECISION'  then result :=value;
  if OraFieldName  = 'INT'               then result :=value;
  if OraFieldName  = 'INTEGER'           then result :=value;
  if OraFieldName  = 'NATIONAL CHAR'     then result :=value;
  if OraFieldName  = 'NATIONAL CHAR VARYING'     then result :=value;
  if OraFieldName  = 'NATIONAL CHARACTER'        then result :=value;
  if OraFieldName  = 'NATIONAL CHARACTER VARYING'then result :=value;
  if OraFieldName  = 'NCHAR VARYING'then result :=value;
  if OraFieldName  = 'NUMERIC'      then result :=value;
  if OraFieldName  = 'REAL'         then result :=value;
  if OraFieldName  = 'SMALLINT'     then result :=value;
  if OraFieldName  = 'VARCHAR'      then result :=str(value);
end;

function GetColumnType(OraFieldName: string): string;
begin
  if OraFieldName  = 'BFILE'        then result :='0000';
  if OraFieldName  = 'BINARY_DOUBLE'then result :='0000';
  if OraFieldName  = 'BINARY_FLOAT' then result :='0000';
  if OraFieldName  = 'BLOB'         then result :='0000';
  if OraFieldName  = 'CHAR'         then result :='1001';
  if OraFieldName  = 'CLOB'         then result :='0000';
  if OraFieldName  = 'DATE'         then result :='0000';
  if OraFieldName  = 'FLOAT'        then result :='1000';
  if OraFieldName  = 'LONG'         then result :='0000';
  if OraFieldName  = 'LONG RAW'     then result :='0000';
  if OraFieldName  = 'MLSLABEL'     then result :='0000';
  if OraFieldName  = 'NCHAR'        then result :='1000';
  if OraFieldName  = 'NCLOB'        then result :='0000';
  if OraFieldName  = 'NUMBER'       then result :='0110';
  if OraFieldName  = 'NVARCHAR2'    then result :='1000';
  if OraFieldName  = 'RAW'          then result :='1000';
  if OraFieldName  = 'ROWID'        then result :='0000';
  if OraFieldName  = 'URITYPE'      then result :='0000';
  if OraFieldName  = 'UROWID'       then result :='1000';
  if OraFieldName  = 'VARCHAR2'     then result :='1001';
  if OraFieldName  = 'CHAR VARYING' then result :='1000';
  if OraFieldName  = 'CHARACTER'    then result :='1000';
  if OraFieldName  = 'CHARACTER VARYING' then result :='1000';
  if OraFieldName  = 'DECIMAL'           then result :='0110';
  if OraFieldName  = 'DOUBLE PRECISION'  then result :='0000';
  if OraFieldName  = 'INT'               then result :='0000';
  if OraFieldName  = 'INTEGER'           then result :='0000';
  if OraFieldName  = 'NATIONAL CHAR'     then result :='1000';
  if OraFieldName  = 'NATIONAL CHAR VARYING'     then result :='1000';
  if OraFieldName  = 'NATIONAL CHARACTER'        then result :='1000';
  if OraFieldName  = 'NATIONAL CHARACTER VARYING'then result :='1000';
  if OraFieldName  = 'NCHAR VARYING'then result :='1000';
  if OraFieldName  = 'NUMERIC'      then result :='0110';
  if OraFieldName  = 'REAL'         then result :='0000';
  if OraFieldName  = 'SMALLINT'     then result :='0000';
  if OraFieldName  = 'VARCHAR'      then result :='1000';
end;

procedure DrawGradient(Canvas: TCanvas; const ARect: TRect;
  FromColor, ToColor: TColor; AStepCount: Integer; IsVertical: Boolean = False);
var
  SR: TRect;
  H, I: Integer;
  R, G, B: Byte;
  FromR, ToR, FromG, ToG, FromB, ToB: Byte;
begin
  FromR := GetRValue(FromColor);
  FromG := GetGValue(FromColor);
  FromB := GetBValue(FromColor);
  ToR := GetRValue(ToColor);
  ToG := GetGValue(ToColor);
  ToB := GetBValue(ToColor);
  SR := ARect;
  with ARect do
    if IsVertical then
      H := Bottom - Top
    else
      H := Right - Left;

  for I := 0 to AStepCount - 1 do
  begin
    if IsVertical then
      SR.Bottom := ARect.Top + MulDiv(I + 1, H, AStepCount)
    else
      SR.Right := ARect.Left + MulDiv(I + 1, H, AStepCount);
    with Canvas do
    begin
      R := FromR + MulDiv(I, ToR - FromR, AStepCount - 1);
      G := FromG + MulDiv(I, ToG - FromG, AStepCount - 1);
      B := FromB + MulDiv(I, ToB - FromB, AStepCount - 1);
      Brush.Color := RGB(R, G, B);
      FillRect(SR);
    end;
    if IsVertical then
      SR.Top := SR.Bottom
    else
      SR.Left := SR.Right;
  end;
end;

procedure   CodeColors(Form : TForm; Style   :   String;   RichE   :   TcxRichedit;
                                                    InVisible   :   Boolean);
  const
      //   ??...   
      CodeC1:   array[0..20]   of   String   =   ('#','$','(',')','*',',',
                      '.','/',':',';','[',']','{','}','<','>',
                      '-','=','+','''','@');
      CodeC3:   array[0..28]   of   String   =   (
                      'BFILE','BINARY_DOUBLE','BINARY_FLOAT','BLOB', 'CHAR','CLOB','DATE','FLOAT',
                      'LONG','LONG RAW','MLSLABEL','NCHAR','NCLOB','NUMBER','NVARCHAR2','RAW','ROWID',
                      'URITYPE','UROWID','VARCHAR2','CHAR VARYING','CHARACTER','DECIMAL','INT',
                      'INTEGER','NUMERIC','REAL','SMALLINT','VARCHAR');

      //   ???...   
      CodeC2:   array[0..68]   of   String   =   ('bitmap','partition','local',
                      'nologging','noparallel','referances','novalidate','sysnonym',
                      'monitoring','end','range','hash','subpartition',
                      'forward','function','by','implementation','interface',   
                      'is','nil','or','private','byte','using','to',   
                      'key','grant','unique','foreign','check','grant','alter','constraint',   
                      'primary','null','not','column','on','comment','tablespace',
                      'index','table','create','from','select', 'modify','default',
                      'disable', 'row', 'movement', 'nocache', 'nomonitoring', 'values',
                      'less', 'than', 'add', 'disabled','logging', 'view','as','replace',
                      'with', 'read', 'only','begin','exception','declare','procedure','function'  );
  var
      FoundAt   :   LongInt;   
      StartPos,   ToEnd,   i   :   integer;   
      OldCap,T   :   String;   
      FontC,   BackC,   C1,   C2   ,C3   ,strC,   strC1   :   TColor;
  begin
      OldCap   :=   Form.Caption;
      with RichE, RichE.Style, RichE.Properties  do
      begin
          Font.Name   :=   'Courier New';
          Font.Size   :=   10;
          if   WordWrap   then   WordWrap   :=   false;
          SelectAll;
          SelAttributes.color   :=   clBlack;
          SelAttributes.Style   :=   [];   
          SelStart   :=   0;   
          if   InVisible   then   
          begin   
              Visible   :=   False;   
              Form.Caption   :=   'Executing   Code   Coloring...';   
          end;   
      end;   
    
      BackC   :=   clWhite;   FontC   :=   clBlack;   
      C1   :=   clBlack;   C2   :=   clBlack;   C3   :=   clBlack;
      strC   :=   clBlue;   strC1   :=   clGray;
    
      if   Style   =   'Twilight'   then   
      begin   
          BackC   :=   clBlack;   FontC   :=   clWhite;   
          C1   :=   clLime;   C2   :=   clSilver;   C3   :=   clAqua;   
          strC   :=   clYellow;   strC1   :=   clRed;   
      end   
      else   
      if   Style   =   'Default'   then   
      begin   
          BackC   :=   clWhite;   FontC   :=   clBlack;
          C1   :=   clTeal;   C2   :=   clBlue;   C3   :=   clBlue;
          strC   :=   clMaroon;   strC1   :=   clSilver;   
      end   
      else   
      if   Style   =   'Ocean'   then   
      begin   
          BackC   :=   $00FFFF80;   FontC   :=   clBlack;   
          C1   :=   clMaroon;   C2   :=   clBlack;   C3   :=   clBlue;   
          strC   :=   clTeal;   strC1   :=   clBlack;   
      end   
      else   
      if   Style   =   'Classic'   then   
      begin   
          BackC   :=   clNavy;   FontC   :=   clYellow;   
          C1   :=   clLime;   C2   :=   clSilver;   C3   :=   clWhite;   
          strC   :=   clAqua;   strC1   :=   clSilver;   
      end   
      else   
      begin   
          with   RichE   do   
          begin   
              T   :=   '{'+'Style'+'   =   Invalid   Style   [Default,Classic,Twilight,Ocean]   ONLY!   }';
              Lines.Insert(0,T);   
              StartPos   :=   0;   
              ToEnd   :=   Length(Text)   -   StartPos;   
              FoundAt   :=   FindText(T,   StartPos,   ToEnd,   [stWholeWord]);   
              SelStart   :=   FoundAt;   
              SelLength   :=   Length(T);
              SelAttributes.Color   :=   clRed;
              SelAttributes.Style   :=   [fsBold];   
              StartPos   :=   0;   
              ToEnd   :=   Length(Text)   -   StartPos;   
              FoundAt   :=   FindText('ONLY!',   StartPos,   ToEnd,   [stWholeWord]);   
              SelStart   :=   FoundAt;   
              SelLength   :=   4;   
              SelAttributes.Color   :=   clRed;
              SelAttributes.Style   :=   [fsBold,fsUnderLine];   
          end;   
      end;   

      //RichE.SelectAll;
      //RichE.Style.color   :=   BackC;
      //RichE.SelAttributes.color   :=   FontC;
    
      for   i   :=   0   to   100   do
      begin   
          with   RichE   do   
          begin   
              StartPos   :=   0;   
              ToEnd   :=   Length(Text)   -   StartPos;   
              FoundAt   :=   FindText(IntToStr(i),   StartPos,   ToEnd,   [stWholeWord]);   
              while   (FoundAt   <>   -1)   do   
              begin   
                  SelStart   :=   FoundAt;   
                  SelLength   :=   Length(IntToStr(i));   
                  SelAttributes.Color   :=   C1;   
                  SelAttributes.Style   :=   [];   
                  StartPos   :=   FoundAt   +   Length(IntToStr(i));   
                  FoundAt   :=   FindText(IntToStr(i),   StartPos,   ToEnd,   [stWholeWord]);   
              end;   
          end;   
      end;

      for   i   :=   0   to   High(CodeC1)   do
      begin
          with   RichE   do
          begin
              StartPos   :=   0;
              ToEnd   :=   Length(Text)   -   StartPos;
              FoundAt   :=   FindText(CodeC1[i],   StartPos,   ToEnd,   []);
              while   (FoundAt   <>   -1)   do
              begin
                  SelStart   :=   FoundAt;
                  SelLength   :=   Length(CodeC1[i]);
                  SelAttributes.Color   :=   C2;
                  StartPos   :=   FoundAt   +   Length(CodeC1[i]);
                  FoundAt   :=   FindText(CodeC1[i],   StartPos,   ToEnd,   []);
              end;
          end;
      end;
      for   i   :=   0   to   High(CodeC2)  do
      begin   
          with   RichE   do   
          begin   
              StartPos   :=   0;   
              ToEnd   :=   Length(Text)   -   StartPos;   
              FoundAt   :=   FindText(CodeC2[i],   StartPos,   ToEnd,   [stWholeWord]);   
              while   (FoundAt   <>   -1)   do   
              begin   
                  SelStart   :=   FoundAt;   
                  SelLength   :=   Length(CodeC2[i]);   
                  SelAttributes.Color   :=   C3;   
                  SelAttributes.Style   :=   [];
                  StartPos   :=   FoundAt   +   Length(CodeC2[i]);   
                  FoundAt   :=   FindText(CodeC2[i],   StartPos,   ToEnd,   [stWholeWord]);   
              end;
          end;   
      end;
      for   i   :=   0   to   High(CodeC3)   do
      begin
          with   RichE   do
          begin
              StartPos   :=   0;
              ToEnd   :=   Length(Text)   -   StartPos;
              FoundAt   :=   FindText(CodeC3[i],   StartPos,   ToEnd,   [stWholeWord]);
              while   (FoundAt   <>   -1)   do
              begin
                  SelStart   :=   FoundAt;
                  SelLength   :=   Length(CodeC3[i]);
                  SelAttributes.Color   :=   clRed;
                  StartPos   :=   FoundAt   +   Length(CodeC3[i]);
                  FoundAt   :=   FindText(CodeC3[i],   StartPos,   ToEnd,   [stWholeWord]);
              end;
          end;
      end;
      Startpos   :=   0;   
      with   RichE   do   
      begin   
          FoundAt   :=   FindText('''',   StartPos,   Length(Text),   []);   
          while   FoundAt   <>   -1   do   
          begin   
              SelStart   :=   FoundAt;   
              Startpos   :=   FoundAt+1;   
              FoundAt   :=   FindText('''',   StartPos,   Length(Text),   []);   
              if   FoundAt   <>   -1   then   
              begin
                  SelLength   :=   (FoundAt   -   selstart)+1;   
                  SelAttributes.Style   :=   [];
                  SelAttributes.Color   :=   strC;   
                  StartPos   :=   FoundAt+1;   
                  FoundAt   :=   FindText('''',   StartPos,   Length(Text),   []);   
              end;   
          end;   
      end;   

      Startpos   :=   0;
      with   RichE   do
      begin
          FoundAt   :=   FindText('"',   StartPos,   Length(Text),   []);
          while   FoundAt   <>   -1   do
          begin
              SelStart   :=   FoundAt;
              Startpos   :=   FoundAt+1;
              FoundAt   :=   FindText('"',   StartPos,   Length(Text),   []);
              if   FoundAt   <>   -1   then
              begin
                  SelLength   :=   (FoundAt   -   selstart)+1;
                  SelAttributes.Style   :=   [];
                  SelAttributes.Color   :=   strC;
                  StartPos   :=   FoundAt+1;
                  FoundAt   :=   FindText('"',   StartPos,   Length(Text),   []);
              end;
          end;
      end;

      Startpos   :=   0;   
      with   RichE   do   
      begin   
          FoundAt   :=   FindText('/*',   StartPos,   Length(Text),   []);
          while   FoundAt   <>   -1   do
          begin
              SelStart   :=   FoundAt;
              Startpos   :=   FoundAt+1;
              FoundAt   :=   FindText('*/',   StartPos,   Length(Text),   [])+1;
              if   FoundAt   <>   -1   then   
              begin   
                  SelLength   :=   (FoundAt   -   selstart)+1;   
                  SelAttributes.Style   :=   [fsItalic];   
                  SelAttributes.Color   :=   clGreen;
                  StartPos   :=   FoundAt+1;   
                  FoundAt   :=   FindText('/*',   StartPos,   Length(Text),   []);   
              end;   
          end;   
      end;

      if   InVisible   then   
      begin   
          RichE.Visible   :=   True;   
          Form.Caption   :=   OldCap;   
      end;   
      RichE.SelStart   :=   0;
  end;
end.

