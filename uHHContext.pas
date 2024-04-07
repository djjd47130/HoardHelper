unit uHHContext;

interface

uses
  System.SysUtils, System.Classes,
  Winapi.Windows,
  Vcl.Forms,
  dwsComp, dwsCompiler, dwsExprs, dwsSymbols, dwsErrors;

type
  THHContext = class;

  THHPrintEvent = procedure(Sender: TObject; Context: THHContext;
    const Text: String) of object;

  THHContext = class(TDataModule)
    DWS: TDelphiWebScript;
    FileUtils: TdwsUnit;
    StrUtils: TdwsUnit;
    HHUtils: TdwsUnit;
    IMDBUtils: TdwsUnit;
    procedure FileUtilsFunctionsListFilesEval(info: TProgramInfo);
    procedure FileUtilsFunctionsExtractFileNameEval(info: TProgramInfo);
    procedure FileUtilsFunctionsExtractFilePathEval(info: TProgramInfo);
    procedure FileUtilsFunctionsExtractFileExtEval(info: TProgramInfo);
    procedure StrUtilsFunctionsCopyEval(info: TProgramInfo);
    procedure StrUtilsFunctionsPosEval(info: TProgramInfo);
    procedure StrUtilsFunctionsUpperCaseEval(info: TProgramInfo);
    procedure StrUtilsFunctionsLowerCaseEval(info: TProgramInfo);
    procedure StrUtilsFunctionsDeleteEval(info: TProgramInfo);
    procedure FileUtilsFunctionsGetFileSizeEval(info: TProgramInfo);
    procedure FileUtilsFunctionsGetFileSizeStrEval(info: TProgramInfo);
    procedure HHUtilsFunctionsGetTickCountEval(info: TProgramInfo);
    procedure FileUtilsFunctionsFileExistsEval(info: TProgramInfo);
    procedure FileUtilsFunctionsDirExistsEval(info: TProgramInfo);
    procedure FileUtilsFunctionsPathCombineEval(info: TProgramInfo);
    procedure FileUtilsFunctionsGetParentDirEval(info: TProgramInfo);
    procedure FileUtilsFunctionsGetDirsEval(info: TProgramInfo);
    procedure FileUtilsFunctionsCopyFileEval(info: TProgramInfo);
    procedure HHUtilsFunctionsPrintLnEval(info: TProgramInfo);
    procedure FileUtilsFunctionsFileInUseEval(info: TProgramInfo);
    procedure FileUtilsFunctionsCreateDirEval(info: TProgramInfo);
    procedure FileUtilsFunctionsExtractFileNameWithoutExtEval(
      info: TProgramInfo);
    procedure FileUtilsFunctionsOpenFileEval(info: TProgramInfo);
    procedure FileUtilsFunctionsGetGenericFileTypeEval(info: TProgramInfo);
    procedure FileUtilsFunctionsMoveFileEval(info: TProgramInfo);
  private
    FOnPrintLn: THHPrintEvent;
    procedure DoPrintLn(const S: String);
  public
    function Exec(const Expr: String): String;
    procedure BackupFile(Context: THHContext; const Filename: String);
  published
    property OnPrintLn: THHPrintEvent read FOnPrintLn write FOnPrintLn;
  end;

var
  HHContext: THHContext;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils, System.StrUtils, System.Math, System.Masks,
  System.Types,
  ShellAPI;

function GetGenericFileType( AExtension: string ): string;
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

procedure THHContext.BackupFile(Context: THHContext; const Filename: String);
begin
  //TODO: If backups are enabled, copy this file to identical structure in backup directory.


end;

procedure THHContext.DoPrintLn(const S: String);
begin
  if Assigned(FOnPrintLn) then
    FOnPrintLn(Self, Self, S);
end;

function THHContext.Exec(const Expr: String): String;
var
  E: String;
  Prog: IdwsProgram;
  Exec: IdwsProgramExecution;
  Res: String;
begin
  E:= Expr;

  Prog:= DWS.Compile(E, '');
  if Prog.Msgs.Count > 0 then begin
    raise Exception.Create(Prog.Msgs.AsInfo);
  end else begin
    Exec:= prog.Execute;
    if Exec.Msgs.HasErrors then begin
      raise Exception.Create(Exec.Msgs.AsInfo);
    end else begin
      Res:= Exec.Result.ToString;
      //Res:= StringReplace(Res,#$D,'',[rfReplaceAll]);
      //Res:= StringReplace(Res,#$A,'',[rfReplaceAll]);
      Result:= Res;
    end;
  end;

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

procedure THHContext.StrUtilsFunctionsUpperCaseEval(info: TProgramInfo);
begin
  Info.ResultAsString:= UpperCase(Info.ParamAsString[0]);
end;

procedure THHContext.FileUtilsFunctionsCopyFileEval(info: TProgramInfo);
var
  S, D: String;
  O: Boolean;
begin
  Info.ResultAsBoolean:= False;
  try
    S:= Info.ParamAsString[0];
    D:= Info.ParamAsString[1];
    O:= Info.ParamAsBoolean[2];
    TFile.Copy(S, D, O);
    Info.ResultAsBoolean:= True;
  except
    on E: Exception do begin
      //TODO

    end;
  end;
end;

procedure THHContext.FileUtilsFunctionsCreateDirEval(info: TProgramInfo);
begin
  TDirectory.CreateDirectory(Info.ParamAsString[0]);
end;

procedure THHContext.FileUtilsFunctionsDirExistsEval(
  info: TProgramInfo);
begin
  Info.ResultAsBoolean:= DirectoryExists(Info.ParamAsString[0]);
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
begin
  Info.ResultAsBoolean:= FileExists(Info.ParamAsString[0]);
end;

procedure THHContext.FileUtilsFunctionsFileInUseEval(info: TProgramInfo);
var
  FN: String;
  F: File;
  R: Boolean;
begin
  R := False;
  FN:= Info.ParamAsString[0];
  try
    AssignFile(F, FN);
    FileMode := fmOpenRead;
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
begin
  Path:= Info.ParamAsString[0];
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

  //Set scripted function result
  Info.SetResultAsStringArray(Arr);

end;

procedure THHContext.FileUtilsFunctionsGetFileSizeEval(
  info: TProgramInfo);
var
  FN: String;
  FS: Int64;
begin
  FN:= Info.ParamAsString[0];
  FS:= FileSize(FN);
  Info.ResultAsInteger:= FS;
end;

procedure THHContext.FileUtilsFunctionsGetFileSizeStrEval(
  info: TProgramInfo);
var
  FN: String;
  FS: Int64;
  R: String;
begin
  FN:= Info.ParamAsString[0];
  FS:= FileSize(FN);
  R:= FormatFloat('#,###,###,###,###,##0 B', FS);
  Info.ResultAsString:= R;
end;

procedure THHContext.FileUtilsFunctionsGetGenericFileTypeEval(
  info: TProgramInfo);
begin
  Info.ResultAsString:= GetGenericFileType(Info.ParamAsString[0]);
end;

procedure THHContext.FileUtilsFunctionsGetParentDirEval(
  info: TProgramInfo);
var
  R: String;
begin
  R:= Info.ParamAsString[0];
  R:= ExcludeTrailingPathDelimiter(R);
  R:= TDirectory.GetParent(R);
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
begin
  Path:= Info.ParamAsString[0];
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

  //Set scripted function result
  Info.SetResultAsStringArray(Arr);

end;

procedure THHContext.FileUtilsFunctionsMoveFileEval(info: TProgramInfo);
begin
  //
end;

procedure THHContext.FileUtilsFunctionsOpenFileEval(info: TProgramInfo);
var
  FN: String;
begin
  FN:= Info.ParamAsString[0];
  ShellExecute(Application.Handle, 'open',
    PChar(FN),nil,nil,SW_SHOWNORMAL) ;
end;

procedure THHContext.FileUtilsFunctionsPathCombineEval(
  info: TProgramInfo);
begin
  Info.ResultAsString:= TPath.Combine(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure THHContext.HHUtilsFunctionsGetTickCountEval(
  info: TProgramInfo);
begin
  Info.ResultAsInteger:= GetTickCount;
end;

procedure THHContext.HHUtilsFunctionsPrintLnEval(info: TProgramInfo);
begin
  DoPrintLn(Info.ParamAsString[0]);
end;

end.
