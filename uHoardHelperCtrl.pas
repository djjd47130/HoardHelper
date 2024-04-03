unit uHoardHelperCtrl;

interface

uses
  System.SysUtils, System.Classes,
  dwsComp, dwsCompiler, dwsExprs, dwsSymbols;

type
  TdmHoardHelperCtrl = class(TDataModule)
    DWS: TDelphiWebScript;
    FileUtils: TdwsUnit;
    StrUtils: TdwsUnit;
    procedure FileUtilsFunctionsListFilesEval(info: TProgramInfo);
    procedure FileUtilsFunctionsExtractFileNameEval(info: TProgramInfo);
    procedure FileUtilsFunctionsExtractFilePathEval(info: TProgramInfo);
    procedure FileUtilsFunctionsExtractFileExtEval(info: TProgramInfo);
    procedure StrUtilsFunctionsCopyEval(info: TProgramInfo);
    procedure StrUtilsFunctionsPosEval(info: TProgramInfo);
    procedure StrUtilsFunctionsUpperCaseEval(info: TProgramInfo);
    procedure StrUtilsFunctionsLowerCaseEval(info: TProgramInfo);
    procedure StrUtilsFunctionsDeleteEval(info: TProgramInfo);
  private
    { Private declarations }
  public
    function Exec(const Expr: String): String;
  end;

var
  dmHoardHelperCtrl: TdmHoardHelperCtrl;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils, System.StrUtils, System.Math, System.Masks,
  System.Types;

function TdmHoardHelperCtrl.Exec(const Expr: String): String;
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

procedure TdmHoardHelperCtrl.StrUtilsFunctionsCopyEval(info: TProgramInfo);
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

procedure TdmHoardHelperCtrl.StrUtilsFunctionsDeleteEval(info: TProgramInfo);
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

procedure TdmHoardHelperCtrl.StrUtilsFunctionsLowerCaseEval(info: TProgramInfo);
begin
  Info.ResultAsString:= LowerCase(Info.ParamAsString[0]);
end;

procedure TdmHoardHelperCtrl.StrUtilsFunctionsPosEval(info: TProgramInfo);
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

procedure TdmHoardHelperCtrl.StrUtilsFunctionsUpperCaseEval(info: TProgramInfo);
begin
  Info.ResultAsString:= UpperCase(Info.ParamAsString[0]);
end;

procedure TdmHoardHelperCtrl.FileUtilsFunctionsExtractFileExtEval(
  info: TProgramInfo);
begin
  Info.ResultAsString:= ExtractFileExt(Info.ParamAsString[0]);
end;

procedure TdmHoardHelperCtrl.FileUtilsFunctionsExtractFileNameEval(
  info: TProgramInfo);
begin
  Info.ResultAsString:= ExtractFileName(Info.ParamAsString[0]);
end;

procedure TdmHoardHelperCtrl.FileUtilsFunctionsExtractFilePathEval(
  info: TProgramInfo);
begin
  Info.ResultAsString:= ExtractFilePath(Info.ParamAsString[0]);
end;

procedure TdmHoardHelperCtrl.FileUtilsFunctionsListFilesEval(info: TProgramInfo);
var
  Path: String;
  Mask: String;
  Rec: Boolean;
  MaskArray: TStringDynArray;
  Pred: TDirectory.TFilterPredicate;
  Arr: TArray<String>;
begin
  Path:= Info.ParamAsString[0];
  Mask:= Info.ParamAsString[1];
  Rec:= Info.ParamAsBoolean[2];
  MaskArray := SplitString(Mask, ';');
  //https://stackoverflow.com/questions/12726756/how-to-pass-multiple-file-extensions-to-tdirectory-getfiles
  Pred:=
    function(const Path: string; const SearchRec: TSearchRec): Boolean
    var
      Mask: string;
    begin
      for Mask in MaskArray do
        if MatchesMask(SearchRec.Name, Mask) then
          exit(True);
      exit(False);
    end;

  if Rec then
    Arr:= TDirectory.GetFiles(Path, TSearchOption.soAllDirectories, Pred)
  else
    Arr:= TDirectory.GetFiles(Path, Pred);

  Info.SetResultAsStringArray(Arr);

end;

end.
