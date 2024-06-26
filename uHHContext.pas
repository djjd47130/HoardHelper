unit uHHContext;

interface

uses
  System.SysUtils, System.Classes,
  Winapi.Windows,
  Vcl.Forms,
  dwsComp, dwsCompiler, dwsExprs, dwsSymbols, dwsErrors, dwsDebugger,
  TagsLibrary,
  ID3v1Library,
  WMATagLibrary,
  WAVTagLibrary,
  OggVorbisAndOpusTagLibrary,
  MP4TagLibrary,
  FlacTagLibrary,
  APEv2Library, dwsFileSystem;

type
  THHContext = class;

  THHMediaAction = (maMove, maCopy, maEdit, maEditTags, maDelete);

  THHPrintEvent = procedure(Sender: TObject; Context: THHContext;
    const Text: String) of object;

  THHContext = class(TDataModule)
    DWS: TDelphiWebScript;
    FileUtils: TdwsUnit;
    StrUtils: TdwsUnit;
    HHUtils: TdwsUnit;
    TagUtils: TdwsUnit;
    NoFS: TdwsNoFileSystem;
    DataUtils: TdwsUnit;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure HHUtilsFunctionsGetTickCountEval(info: TProgramInfo);
    procedure HHUtilsFunctionsPrintLnEval(info: TProgramInfo);
    procedure HHUtilsFunctionsBeginPrintLnEval(info: TProgramInfo);
    procedure HHUtilsFunctionsEndPrintLnEval(info: TProgramInfo);
    procedure StrUtilsFunctionsCopyEval(info: TProgramInfo);
    procedure StrUtilsFunctionsPosEval(info: TProgramInfo);
    procedure StrUtilsFunctionsUpperCaseEval(info: TProgramInfo);
    procedure StrUtilsFunctionsLowerCaseEval(info: TProgramInfo);
    procedure StrUtilsFunctionsDeleteEval(info: TProgramInfo);
    procedure StrUtilsFunctionssLineBreakEval(info: TProgramInfo);
    procedure FileUtilsFunctionsListFilesEval(info: TProgramInfo);
    procedure FileUtilsFunctionsExtractFileNameEval(info: TProgramInfo);
    procedure FileUtilsFunctionsExtractFilePathEval(info: TProgramInfo);
    procedure FileUtilsFunctionsExtractFileExtEval(info: TProgramInfo);
    procedure FileUtilsFunctionsGetFileSizeEval(info: TProgramInfo);
    procedure FileUtilsFunctionsGetFileSizeStrEval(info: TProgramInfo);
    procedure FileUtilsFunctionsFileExistsEval(info: TProgramInfo);
    procedure FileUtilsFunctionsDirExistsEval(info: TProgramInfo);
    procedure FileUtilsFunctionsPathCombineEval(info: TProgramInfo);
    procedure FileUtilsFunctionsGetParentDirEval(info: TProgramInfo);
    procedure FileUtilsFunctionsGetDirsEval(info: TProgramInfo);
    procedure FileUtilsFunctionsCopyFileEval(info: TProgramInfo);
    procedure FileUtilsFunctionsFileInUseEval(info: TProgramInfo);
    procedure FileUtilsFunctionsCreateDirEval(info: TProgramInfo);
    procedure FileUtilsFunctionsExtractFileNameWithoutExtEval(
      info: TProgramInfo);
    procedure FileUtilsFunctionsOpenFileEval(info: TProgramInfo);
    procedure FileUtilsFunctionsGetGenericFileTypeEval(info: TProgramInfo);
    procedure FileUtilsFunctionsMoveFileEval(info: TProgramInfo);
    procedure FileUtilsFunctionsGetFileDateModifiedEval(info: TProgramInfo);
    procedure StrUtilsFunctionssTabEval(info: TProgramInfo);
    procedure StrUtilsFunctionsSplitStringEval(info: TProgramInfo);
    procedure FileUtilsFunctionsSaveTextFileEval(info: TProgramInfo);
    procedure FileUtilsFunctionsBackupFileEval(info: TProgramInfo);
    procedure TagUtilsFunctionsExtractID3v1Eval(info: TProgramInfo);
    procedure TagUtilsFunctionsGetTagsEval(info: TProgramInfo);
    procedure FileUtilsFunctionsRenameFileEval(info: TProgramInfo);
    procedure FileUtilsFunctionsRenameDirEval(info: TProgramInfo);
    procedure HHUtilsFunctionsGetLibFilterEval(info: TProgramInfo);
    procedure FileUtilsFunctionsOpenFileLocationEval(info: TProgramInfo);
    procedure FileUtilsFunctionsMakeFilterEval(info: TProgramInfo);
    procedure TagUtilsFunctionsExtractTagEval(info: TProgramInfo);
    procedure DataUtilsClassesTDataSetColMethodsGetAsStringEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure DataUtilsClassesTDataSetColMethodsSetAsStringEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure DataUtilsClassesTDataSetColMethodsGetAsIntegerEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure DataUtilsClassesTDataSetColMethodsSetAsIntegerEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure DataUtilsClassesTDataSetConstructorsCreateEval(Info: TProgramInfo;
      var ExtObject: TObject);
    procedure DataUtilsClassesTDataSetColConstructorsCreateEval(
      Info: TProgramInfo; var ExtObject: TObject);
    procedure FileUtilsFunctionsMoveFileUpAFolderEval(info: TProgramInfo);
  private
    FDemoMode: Boolean;
    FExec: IdwsProgramExecution;
    FOnPrintLn: THHPrintEvent;
    FOnBeginUpdate: TNotifyEvent;
    FOnEndUpdate: TNotifyEvent;
    function DemoStr: String;
  protected
    procedure DoPrintLn(const S: String); virtual;
    procedure DoBeginUpdate; virtual;
    procedure DoEndUpdate; virtual;
  public
    function Exec(const Expr: String; const DemoMode: Boolean = True): String;
    function Compile(const Expr: String; const DemoMode: Boolean = True): String;
    procedure StopExec;
    procedure BackupFile(Context: THHContext; const Filename: String; const Action: THHMediaAction);
    property IsDemoMode: Boolean read FDemoMode;
  published
    property OnPrintLn: THHPrintEvent read FOnPrintLn write FOnPrintLn;
    property OnBeginUpdate: TNotifyEvent read FOnBeginUpdate write FOnBeginUpdate;
    property OnEndUpdate: TNotifyEvent read FOnEndUpdate write FOnEndUpdate;
  end;

var
  HHContext: THHContext;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils, System.StrUtils, System.Math, System.Masks,
  System.Types,
  ShellAPI,
  JD.HoardHelper;

function GetGenericFileType(AExtension: string): string;
{ Get file type for an extension }
var
  AInfo: TSHFileInfo;
begin
  SHGetFileInfo( PChar( AExtension ), FILE_ATTRIBUTE_NORMAL, AInfo, SizeOf( AInfo ),
    SHGFI_TYPENAME or SHGFI_USEFILEATTRIBUTES );
  Result := AInfo.szTypeName;
end;

function FileSize(const aFilename: String): Int64;
var
  info: TWin32FileAttributeData;
begin
  result := -1; // Default value in case of failure
  if NOT GetFileAttributesEx(PChar(aFileName), GetFileExInfoStandard, @info) then
    EXIT; // Unable to get file attributes

  result := Int64(info.nFileSizeLow) or Int64(info.nFileSizeHigh shl 32);
end;

{ THHContext }

procedure THHContext.DataModuleCreate(Sender: TObject);
begin
  //
end;

procedure THHContext.DataModuleDestroy(Sender: TObject);
begin
  FExec:= nil;
end;

procedure THHContext.BackupFile(Context: THHContext; const Filename: String; const Action: THHMediaAction);
begin
  //TODO: If backups are enabled, copy this file to identical structure in backup directory.
  //TODO: Translate path...

end;

procedure THHContext.DataUtilsClassesTDataSetColConstructorsCreateEval(
  Info: TProgramInfo; var ExtObject: TObject);
begin
  //TODO: Create TDataSetCol...

end;

procedure THHContext.DataUtilsClassesTDataSetColMethodsGetAsIntegerEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  //TODO: Return value as integer...
end;

procedure THHContext.DataUtilsClassesTDataSetColMethodsGetAsStringEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  //TODO: Return value as string...
end;

procedure THHContext.DataUtilsClassesTDataSetColMethodsSetAsIntegerEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  //TODO: Set value as integer...
end;

procedure THHContext.DataUtilsClassesTDataSetColMethodsSetAsStringEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  //TODO: Set value as string...
end;

procedure THHContext.DataUtilsClassesTDataSetConstructorsCreateEval(
  Info: TProgramInfo; var ExtObject: TObject);
begin
  //TODO: Create TDataSet...
end;

procedure THHContext.DoBeginUpdate;
begin
  if Assigned(FOnBeginUpdate) then
    FOnBeginUpdate(Self);
end;

procedure THHContext.DoEndUpdate;
begin
  if Assigned(FOnEndUpdate) then
    FOnEndUpdate(Self);
end;

procedure THHContext.DoPrintLn(const S: String);
begin
  if Assigned(FOnPrintLn) then
    FOnPrintLn(Self, Self, S);
end;

function THHContext.Compile(const Expr: String; const DemoMode: Boolean = True): String;
var
  Prog: IdwsProgram;
begin
  DoPrintLn('Compiling script...');

  //Populate conditionals...
  DWS.Config.Conditionals.Clear;
  FDemoMode:= DemoMode;
  if DemoMode then begin
    DWS.Config.Conditionals.Add('DEMO');
  end;

  //Compile script...
  Prog:= DWS.Compile(Expr, '');
  if Prog.Msgs.Count > 0 then begin
    Result:= 'FAILED TO COMPILE:'+sLineBreak+sLineBreak+Prog.Msgs.AsInfo;
  end else begin
    Result:= 'Compiled successfully.';
  end;

  DoPrintLn(Result);
end;

function THHContext.Exec(const Expr: String; const DemoMode: Boolean = True): String;
var
  E: String;
  Prog: IdwsProgram;
  Res: String;
begin
  //Populate conditionals...
  DWS.Config.Conditionals.Clear;
  FDemoMode:= DemoMode;
  if DemoMode then begin
    DWS.Config.Conditionals.Add('DEMO');
  end;

  E:= Expr;
  Prog:= DWS.Compile(E, '');
  if Prog.Msgs.Count > 0 then begin
    raise Exception.Create(Prog.Msgs.AsInfo);
  end else begin
    FExec:= prog.Execute;
    if FExec.Msgs.HasErrors then begin
      raise Exception.Create(FExec.Msgs.AsInfo);
    end else begin
      Res:= FExec.Result.ToString;
      //Res:= StringReplace(Res,#$D,'',[rfReplaceAll]);
      //Res:= StringReplace(Res,#$A,'',[rfReplaceAll]);
      Result:= Res;
    end;
  end;
end;

procedure THHContext.StopExec;
begin
  FExec.Stop;
end;

procedure THHContext.StrUtilsFunctionsCopyEval(info: TProgramInfo);
var
  S: String;
  I: Integer;
  C: Integer;
begin
  S:= Info.ParamAsString[0];
  I:= Info.ParamAsInteger[1];
  C:= Info.ParamAsInteger[2];
  Info.ResultAsString:= Copy(S, I, C);
end;

procedure THHContext.StrUtilsFunctionsDeleteEval(info: TProgramInfo);
var
  S: String;
  I: Integer;
  C: Integer;
begin
  S:= Info.ParamAsString[0];
  I:= Info.ParamAsInteger[1];
  C:= Info.ParamAsInteger[2];
  Delete(S, I, C);
  Info.ParamAsString[0]:= S;
end;

procedure THHContext.StrUtilsFunctionsLowerCaseEval(info: TProgramInfo);
begin
  Info.ResultAsString:= LowerCase(Info.ParamAsString[0]);
end;

procedure THHContext.StrUtilsFunctionsPosEval(info: TProgramInfo);
var
  SS: String;
  S: String;
  O: Integer;
begin
  SS:= Info.ParamAsString[0];
  S:= Info.ParamAsString[1];
  O:= Info.ParamAsInteger[2];
  Info.ResultAsInteger:= Pos(SS, S, O);
end;

procedure THHContext.StrUtilsFunctionssLineBreakEval(info: TProgramInfo);
begin
  Info.ResultAsString:= sLineBreak;
end;

procedure THHContext.StrUtilsFunctionsSplitStringEval(info: TProgramInfo);
begin
  Info.ResultAsStringArray:= SplitString(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure THHContext.StrUtilsFunctionssTabEval(info: TProgramInfo);
begin
  Info.ResultAsString:= #9;
end;

procedure THHContext.StrUtilsFunctionsUpperCaseEval(info: TProgramInfo);
begin
  Info.ResultAsString:= UpperCase(Info.ParamAsString[0]);
end;

procedure THHContext.FileUtilsFunctionsBackupFileEval(info: TProgramInfo);
var
  L: THHLibrary;
  SFN, DFN: String;
begin
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
  SFN:= L.LibPathToLocalPath(Info.ParamAsString[0]);

  //TODO: Backup file (manually)...

end;

procedure THHContext.FileUtilsFunctionsCopyFileEval(info: TProgramInfo);
var
  L: THHLibrary;
  S, D: String;
  O: Boolean;
begin
  Info.ResultAsBoolean:= False;
  try
    L:= HH.FindLib(Info.ParamAsString[0]);
    if L = nil then
      raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
    S:= L.LibPathToLocalPath(Info.ParamAsString[0]);
    D:= L.LibPathToLocalPath(Info.ParamAsString[1]);
    O:= Info.ParamAsBoolean[2];
    TFile.Copy(S, D, O);
    Info.ResultAsBoolean:= True;
  except
    on E: Exception do begin
      raise Exception.Create('Failed to copy file: '+E.Message);
    end;
  end;
end;

procedure THHContext.FileUtilsFunctionsCreateDirEval(info: TProgramInfo);
var
  L: THHLibrary;
  T: String;
begin
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
  T:= L.LibPathToLocalPath(Info.ParamAsString[0]);
  Info.ResultAsBoolean:= ForceDirectories(T);
  //TDirectory.CreateDirectory(T);
end;

procedure THHContext.FileUtilsFunctionsDirExistsEval(
  info: TProgramInfo);
var
  L: THHLibrary;
  T: String;
begin
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
  T:= L.LibPathToLocalPath(Info.ParamAsString[0]);
  Info.ResultAsBoolean:= DirectoryExists(T);
end;

procedure THHContext.FileUtilsFunctionsExtractFileExtEval(
  info: TProgramInfo);
begin
  Info.ResultAsString:= ExtractFileExt(Info.ParamAsString[0]);
end;

procedure THHContext.FileUtilsFunctionsExtractFileNameEval(
  info: TProgramInfo);
begin
  Info.ResultAsString:= ExtractFileName(Info.ParamAsString[0]);
end;

procedure THHContext.FileUtilsFunctionsExtractFileNameWithoutExtEval(
  info: TProgramInfo);
begin
  Info.ResultAsString:= TPath.GetFileNameWithoutExtension(Info.ParamAsString[0]);
end;

procedure THHContext.FileUtilsFunctionsExtractFilePathEval(
  info: TProgramInfo);
begin
  Info.ResultAsString:= ExtractFilePath(Info.ParamAsString[0]);
end;

procedure THHContext.FileUtilsFunctionsFileExistsEval(
  info: TProgramInfo);
var
  L: THHLibrary;
  T: String;
begin
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
  T:= L.LibPathToLocalPath(Info.ParamAsString[0]);
  Info.ResultAsBoolean:= FileExists(T);
end;

procedure THHContext.FileUtilsFunctionsFileInUseEval(info: TProgramInfo);
var
  L: THHLibrary;
  FN: String;
  F: File;
  R: Boolean;
begin
  R := False;
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
  FN:= L.LibPathToLocalPath(Info.ParamAsString[0]);
  try
    AssignFile(F, FN);
    FileMode := fmOpenReadWrite; //fmOpenRead
    Reset(F);
    CloseFile(F);
  except
    R := True; // Exception occurred; file is in use
  end;
  Info.ResultAsBoolean:= R;
end;

procedure THHContext.FileUtilsFunctionsGetDirsEval(info: TProgramInfo);
const
  FILTER_SEPARATOR = ';';
var
  Path: String;
  Mask: String;
  Recurse: Boolean;
  MaskArray: TStringDynArray;
  Pred: TDirectory.TFilterPredicate;
  Arr: TArray<String>;
  X: Integer;
  L: THHLibrary;
begin
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Path);
  Path:= L.LibPathToLocalPath(Info.ParamAsString[0]);
  Mask:= Info.ParamAsString[1];
  Recurse:= Info.ParamAsBoolean[2];

  //https://stackoverflow.com/questions/12726756/how-to-pass-multiple-file-extensions-to-tdirectory-getfiles
  MaskArray := SplitString(Mask, FILTER_SEPARATOR);
  Pred:=
    function(const Path: string; const SearchRec: TSearchRec): Boolean
    var
      Mask: string;
    begin
      for Mask in MaskArray do
        if MatchesMask(SearchRec.Name, Mask) then
          Exit(True);
      Exit(False);
    end;

  //Recursive?
  if Recurse then
    Arr:= TDirectory.GetDirectories(Path, TSearchOption.soAllDirectories, Pred)
  else
    Arr:= TDirectory.GetDirectories(Path, Pred);

  //Translate all array items to relative lib paths...
  for X := 0 to Length(Arr)-1 do begin
    Arr[X]:= L.LocalPathToLibPath(Arr[X]);
  end;

  //Set scripted function result
  Info.SetResultAsStringArray(Arr);

end;

procedure THHContext.FileUtilsFunctionsGetFileDateModifiedEval(
  info: TProgramInfo);
var
  L: THHLibrary;
  T: String;
  DT: TDateTime;
begin
  L:= HH.FindLib(Info.ParamAsString[0]);
  T:= L.LibPathToLocalPath(Info.ParamAsString[0]);
  if FileAge(T, DT) then begin
    Info.ResultAsString:= FormatDateTime('yyyy-mm-dd hh:nn:ss', DT);
  end else begin
    Info.ResultAsString:= '';
  end;
end;

procedure THHContext.FileUtilsFunctionsGetFileSizeEval(
  info: TProgramInfo);
var
  L: THHLibrary;
  FN: String;
  FS: Int64;
begin
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
  FN:= L.LibPathToLocalPath(Info.ParamAsString[0]);
  FS:= FileSize(FN);
  Info.ResultAsInteger:= FS;
end;

function FormatFileSize(const bytes: Int64): string;
const
  KB = 1024;
  MB = KB * 1024;
  GB = MB * 1024;
begin
  if bytes < KB then
    Result := Format('%d bytes', [bytes])
  else if bytes < MB then
    Result := Format('%.2f KB', [bytes / KB])
  else if bytes < GB then
    Result := Format('%.2f MB', [bytes / MB])
  else
    Result := Format('%.2f GB', [bytes / GB]);
end;

procedure THHContext.FileUtilsFunctionsGetFileSizeStrEval(
  info: TProgramInfo);
var
  L: THHLibrary;
  FN: String;
  FS: Int64;
begin
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
  FN:= L.LibPathToLocalPath(Info.ParamAsString[0]);
  FS:= FileSize(FN);
  Info.ResultAsString:= FormatFileSize(FS);
end;

procedure THHContext.FileUtilsFunctionsGetGenericFileTypeEval(
  info: TProgramInfo);
begin
  Info.ResultAsString:= GetGenericFileType(Info.ParamAsString[0]);
end;

function GetParentDir(const Filename: String): String;
begin
  Result:= TDIrectory.GetParent(Filename);
end;

procedure THHContext.FileUtilsFunctionsGetParentDirEval(
  info: TProgramInfo);
var
  L: THHLibrary;
  R: String;
begin
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
  R:= L.LibPathToLocalPath(Info.ParamAsString[0]);
  R:= ExcludeTrailingPathDelimiter(R);
  R:= TDirectory.GetParent(R);
  R:= L.LocalPathToLibPath(R);
  Info.ResultAsString:= R;
end;

procedure THHContext.FileUtilsFunctionsListFilesEval(info: TProgramInfo);
const
  FILTER_SEPARATOR = ';';
var
  Path: String;
  Mask: String;
  Recurse: Boolean;
  MaskArray: TStringDynArray;
  Pred: TDirectory.TFilterPredicate;
  Arr: TArray<String>;
  L: THHLibrary;
  X: Integer;
begin
  //TODO: Translate path...
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Path);
  Path:= L.LibPathToLocalPath(Info.ParamAsString[0]);

  Mask:= Info.ParamAsString[1];
  Recurse:= Info.ParamAsBoolean[2];

  //https://stackoverflow.com/questions/12726756/how-to-pass-multiple-file-extensions-to-tdirectory-getfiles
  MaskArray := SplitString(Mask, FILTER_SEPARATOR);
  Pred:=
    function(const Path: string; const SearchRec: TSearchRec): Boolean
    var
      Mask: string;
    begin
      for Mask in MaskArray do
        if MatchesMask(SearchRec.Name, Mask) then
          Exit(True);
      Exit(False);
    end;

  //Recursive?
  if Recurse then
    Arr:= TDirectory.GetFiles(Path, TSearchOption.soAllDirectories, Pred)
  else
    Arr:= TDirectory.GetFiles(Path, Pred);

  //Translate all array items to relative lib paths...
  for X := 0 to Length(Arr)-1 do begin
    Arr[X]:= L.LocalPathToLibPath(Arr[X]);
  end;

  //Set scripted function result
  Info.SetResultAsStringArray(Arr);

end;

procedure THHContext.FileUtilsFunctionsMakeFilterEval(info: TProgramInfo);
var
  S, Flt, Res: String;
  Arr: TArray<String>;
  X: Integer;
begin
  S:= Info.ParamAsString[0];
  Flt:= Info.ParamAsString[1];
  Res:= '';
  Arr:= SplitString(Flt, ';');
  for X:= 0 to Length(Arr)-1 do begin
    if X > 0 then Res:= Res + ';';
    Res:= Res + '*' + S + Arr[X];
  end;
  Info.ResultAsString:= Res;
end;

procedure THHContext.FileUtilsFunctionsMoveFileEval(info: TProgramInfo);
begin
  //TODO: Move file...
  //TODO: Translate path...
end;

function THHContext.DemoStr: String;
begin
  if IsDemoMode then
    Result:= '[DEMO] ';
end;

procedure THHContext.FileUtilsFunctionsMoveFileUpAFolderEval(
  info: TProgramInfo);
var
  L: THHLibrary;
  Filename: String;
  FN: String;
  Result: String;
begin
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
  Filename:= L.LibPathToLocalPath(Info.ParamAsString[0]);
  if FileExists(Filename) then begin
    FN:= ExtractFileName(Filename);
    Result:= ExtractFilePath(Filename);
    Result:= L.LocalPathToLibPath(GetParentDir(Result));
    Result:= PathCombine(Result, FN);
    DoPrintLn(DemoStr+'MOVING file up a directory: "'+Filename+'" to "'+Result+'"');
    if not IsDemoMode then
      TFile.Move(Filename, Result);
  end else begin
    DoPrintLn('File '+Filename+' doesn''t exist!');
  end;
  Info.ResultAsString:= Result;
end;

procedure THHContext.FileUtilsFunctionsOpenFileEval(info: TProgramInfo);
var
  L: THHLibrary;
  FN: String;
begin
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
  FN:= L.LibPathToLocalPath(Info.ParamAsString[0]);
  ShellExecute(Application.Handle, 'open',
    PChar(FN),nil,nil,SW_SHOWNORMAL) ;
end;

procedure THHContext.FileUtilsFunctionsOpenFileLocationEval(info: TProgramInfo);
var
  L: THHLibrary;
  FN: String;
begin
  L:= HH.FindLib(Info.ParamAsString[0]);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
  FN:= L.LibPathToLocalPath(Info.ParamAsString[0]);
  Info.ResultAsBoolean:= OpenFolderAndSelectFile(FN);

end;

procedure THHContext.FileUtilsFunctionsPathCombineEval(
  info: TProgramInfo);
begin
  Info.ResultAsString:= PathCombine(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure THHContext.FileUtilsFunctionsRenameDirEval(info: TProgramInfo);
begin
  //TODO
end;

procedure THHContext.FileUtilsFunctionsRenameFileEval(info: TProgramInfo);
begin
  //TODO
end;

procedure THHContext.FileUtilsFunctionsSaveTextFileEval(info: TProgramInfo);
var
  FN: String;
  L: THHLibrary;
  SL: TStringList;
  Arr: TArray<String>;
  X: Integer;
  T: String;
begin
  FN:= Info.ParamAsString[0];
  L:= HH.FindLib(FN);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+Info.ParamAsString[0]);
  FN:= L.LibPathToLocalPath(FN);

  if not ForceDirectories(ExtractFilePath(FN)) then
    raise Exception.Create('Failed to create file directory.');

  if (Info.ParamAsBoolean[2] = False) and FileExists(FN) then
    raise Exception.Create('Cannot overwrite file.');

  SL:= TStringList.Create;
  try
    Arr:= Info.ParamAsVariant[1]; //TODO: How to read as string array?
    for X := 0 to Length(Arr)-1 do begin
      T:= Arr[X];
      SL.Append(T);
    end;
    SL.SaveToFile(FN);
  finally
    SL.Free;
  end;

end;

procedure THHContext.HHUtilsFunctionsBeginPrintLnEval(info: TProgramInfo);
begin
  //TODO
  if Assigned(FOnBeginUpdate) then
    FOnBeginUpdate(Self);
end;

procedure THHContext.HHUtilsFunctionsEndPrintLnEval(info: TProgramInfo);
begin
  //TODO
  if Assigned(FOnEndUpdate) then
    FOnEndUpdate(Self);
end;

procedure THHContext.HHUtilsFunctionsGetLibFilterEval(info: TProgramInfo);
var
  N: String;
  L: THHLibrary;
begin
  //Return filter string for given library name...
  N:= Info.ParamAsString[0];
  L:= HH.LibraryByName(N);
  if L = nil then
    raise Exception.Create('Library "'+N+'" not found!');
  Info.ResultAsString:= L.Filter;
end;

procedure THHContext.HHUtilsFunctionsGetTickCountEval(
  info: TProgramInfo);
begin
  Info.ResultAsInteger:= GetTickCount;
end;

procedure THHContext.HHUtilsFunctionsPrintLnEval(info: TProgramInfo);
var
  T: String;
begin
  T:= Info.ParamAsString[0];
  //TODO: Ensure line breaks are retained...
  //T:= StringReplace(T, 'sLineBreak', sLineBreak, [rfReplaceAll]);
  DoPrintLn(T);
end;

procedure THHContext.TagUtilsFunctionsExtractID3v1Eval(info: TProgramInfo);
var
  FN: String;
  L: THHLibrary;
  Data: TID3v1Tag;
  Arr: TArray<String>;
  procedure A(const N, V: String);
  begin
    SetLength(Arr, Length(Arr)+1);
    Arr[Length(Arr)-1]:= N+'='+V;
  end;
begin
  FN:= Info.ParamAsString[0];
  L:= HH.FindLib(FN);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+FN);
  FN:= L.LibPathToLocalPath(FN);
  if not FileExists(FN) then
    raise Exception.Create('File not found at path '+Info.ParamAsString[0]);

  Data:= TID3v1Tag.Create;
  try
    Data.LoadFromFile(FN);
    SetLength(Arr, 0);
    A('Filename', Info.ParamAsString[0]);
    A('Title', Data.Title);
    A('Artist', Data.Artist);
    A('Album', Data.Album);
    A('Year', Data.Year);
    A('Comment', Data.Comment);
    A('Track', Data.TrackString);
    A('Genre', Data.Genre);
    //TODO: Lyrics...
  finally
    Data.Free;
  end;

  Info.ResultAsStringArray:= Arr;

end;

procedure THHContext.TagUtilsFunctionsExtractTagEval(info: TProgramInfo);
var
  Tags: TArray<String>;
  Name: String;
  X, P: Integer;
  S, N, Result: String;
begin
  Result:= '';
  Tags:= Info.ParamAsScriptDynArray[0].ToStringArray;
  Name:= Info.ParamAsString[1];
  for X := 0 to Length(Tags)-1 do begin
    S:= Tags[X];
    P:= Pos('=', S);
    N:= Copy(S, 1, P-1);
    if SameText(N, Name) then begin
      Delete(S, 1, P);
      Result:= S;
      Break;
    end;
  end;
  Info.ResultAsString:= Result;
end;

procedure THHContext.TagUtilsFunctionsGetTagsEval(info: TProgramInfo);
var
  Tags: TTags;
  FN: String;
  L: THHLibrary;
  E: Integer;
  X: Integer;
  Arr: TArray<String>;
  procedure A(const N, V: String);
  begin
    SetLength(Arr, Length(Arr)+1);
    Arr[Length(Arr)-1]:= N+'='+V;
  end;
  procedure AN(const N: String);
  begin
    SetLength(Arr, Length(Arr)+1);
    Arr[Length(Arr)-1]:= N+'='+Tags.GetTag(N);
  end;
begin
  FN:= Info.ParamAsString[0];
  L:= HH.FindLib(FN);
  if L = nil then
    raise Exception.Create('Failed to find library for path '+FN);
  FN:= L.LibPathToLocalPath(FN);
  if not FileExists(FN) then
    raise Exception.Create('File not found at path '+Info.ParamAsString[0]);

  Tags:= TTags.Create;
  try
    Tags.LoadTags;
    E:= Tags.LoadFromFile(FN);
    if E = 0 then begin
      A('Filename', Info.ParamAsString[0]);
      //Populate array with name/value pairs of all tags...
      for X := 0 to Tags.Count-1 do begin
        A(Tags.Tags[X].Name, Tags.Tags[X].Value);
      end;
    end else begin
      //Error
      raise Exception.Create('Error code '+IntToStr(E)+' in loading tag data.');
    end;

  finally
    Tags.Free;
  end;

  Info.ResultAsStringArray:= Arr;

end;

end.
