unit JD.HoardHelper;

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections,
  uHHContext,
  XSuperObject,
  ActiveX;

type
  THHFile = class;
  THHLibrary = class;
  THoardHelper = class;
  THHScriptThread = class;

  TKillProc = procedure of object;

  THHLibraryType = (hhlGeneral, hhlMovies, hhlShows, hhlVideos, hhlMusic,
    hhlPictures, hhlDocuments, hhlApplications);

  THHFileType = (hhFile, hhFolder);

  THHWrapType = (hhwNone, hhwControl, hhwRightLine);

  THHFile = class(TObject)
  private
    FOwner: THHLibrary;
    FFilename: String;
    FFileType: THHFileType;
    procedure SetFilename(const Value: String);
    procedure SetFileType(const Value: THHFileType);
  public
    constructor Create(AOwner: THHLibrary);
    destructor Destroy; override;

    property Filename: String read FFilename write SetFilename;
    property FileType: THHFileType read FFileType write SetFileType;
  end;

  THHLibrary = class(TObject)
  private
    FName: String;
    FLocation: String;
    FLibraryType: THHLibraryType;
    FFilter: String;
    FCollectionsSubdir: Boolean;
    FStructure: String;
    procedure SetLibraryType(const Value: THHLibraryType);
    procedure SetLocation(const Value: String);
    procedure SetName(const Value: String);
    procedure SetFilter(const Value: String);
    procedure SetCollectionsSubdir(const Value: Boolean);
    procedure SetStructure(const Value: String);
  public
    property LibraryType: THHLibraryType read FLibraryType write SetLibraryType;
    property Location: String read FLocation write SetLocation;
    property Name: String read FName write SetName;
    property Filter: String read FFilter write SetFilter;
    property Structure: String read FStructure write SetStructure;
    property CollectionsSubdir: Boolean read FCollectionsSubdir write SetCollectionsSubdir;

    function LibPathToLocalPath(const Value: String): String;
    function LocalPathToLibPath(const Value: String): String;
  end;

  THoardHelper = class(TComponent)
  private
    FProfileName: String;
    FLibraries: TObjectList<THHLibrary>;
    FBackupLocation: String;
    FBackupEnabled: Boolean;
    FExecuting: Boolean;
    FOnPrintLn: THHPrintEvent;
    FOnStopped: TNotifyEvent;
    FOnStarted: TNotifyEvent;
    FWrapType: THHWrapType;
    FHighlighting: Boolean;
    FRightLine: Integer;
    FBackupsEnabled: Boolean;
    FBackupDirectory: String;
    FCommonLOC: Integer;
    FOnBeginUpdate: TNotifyEvent;
    FOnEndUpdate: TNotifyEvent;
    function GetLibrary(const Index: Integer): THHLibrary;
    procedure SetProfileName(const Value: String);
    procedure SetBackupEnabled(const Value: Boolean);
    procedure SetBackupLocation(const Value: String);
    procedure SetWrapType(const Value: THHWrapType);
    procedure SetHighlighting(const Value: Boolean);
    procedure SetRightLine(const Value: Integer);
    procedure SetBackupDirectory(const Value: String);
    procedure SetBackupsEnabled(const Value: Boolean);

    procedure LoadLibs(A: ISuperArray);
    procedure SaveLibs(var A: ISuperArray);

    procedure PrintLn(Sender: TObject; Context: THHContext;
      const Text: String);
    procedure EnsureCommonFile;

    procedure Started(Sender: TObject);
    procedure Stopped(Sender: TObject);
    procedure ThreadBeginUpdate(Sender: TObject);
    procedure ThreadEndUpdate(Sender: TObject);

  protected

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function SettingsFilename: String;
    function CommonFilename: String;
    procedure LoadSettings;
    procedure SaveSettings;
    function LibraryCount: Integer;
    function LibraryByName(const N: String): THHLibrary;
    procedure AddLibrary(L: THHLibrary);
    procedure DeleteLibrary(const Index: Integer);

    function FindLib(const Filename: String): THHLibrary;

    function Execute(const Script: String; const IncludeCommon: Boolean = True;
      const DemoMode: Boolean = True): TKillProc;
    procedure Compile(const Script: String; const IncludeCommon: Boolean = True);

    property Libraries[const Index: Integer]: THHLibrary read GetLibrary;
    property Executing: Boolean read FExecuting;
    property CommonLOC: Integer read FCommonLOC;
  published
    property ProfileName: String read FProfileName write SetProfileName;
    property BackupEnabled: Boolean read FBackupEnabled write SetBackupEnabled;
    property BackupLocation: String read FBackupLocation write SetBackupLocation;

    property WrapType: THHWrapType read FWrapType write SetWrapType;
    property Highlighting: Boolean read FHighlighting write SetHighlighting;
    property RightLine: Integer read FRightLine write SetRightLine;

    property BackupsEnabled: Boolean read FBackupsEnabled write SetBackupsEnabled;
    property BackupDirectory: String read FBackupDirectory write SetBackupDirectory;

    property OnPrintLn: THHPrintEvent read FOnPrintLn write FOnPrintLn;
    property OnStarted: TNotifyEvent read FOnStarted write FOnStarted;
    property OnStopped: TNotifyEvent read FOnStopped write FOnStopped;
    property OnBeginUpdate: TNotifyEvent read FOnBeginUpdate write FOnBeginUpdate;
    property OnEndUpdate: TNotifyEvent read FOnEndUpdate write FOnEndUpdate;
  end;

  //TODO: Change all scripting to execute within thread...
  THHScriptThread = class(TThread)
  private
    FHoardHelper: THoardHelper;
    FScript: String;
    FContext: THHContext;
    FOnPrintLn: THHPrintEvent;
    FSYNC_PrintLn: String;
    FOnStop: TNotifyEvent;
    FOnStart: TNotifyEvent;
    FOnBeginUpdate: TNotifyEvent;
    FOnEndUpdate: TNotifyEvent;
    FDemoMode: Boolean;
    procedure SYNC_PrintLn;
    procedure SYNC_Start;
    procedure SYNC_Stop;
    procedure SYNC_BeginUpdate;
    procedure SYNC_EndUpdate;
    procedure ContextPrintLn(Sender: TObject; Context: THHContext;
      const Text: String);
    procedure ContextBeginUpdate(Sender: TObject);
    procedure ContextEndUpdate(Sender: TObject);
    procedure SetOnStart(const Value: TNotifyEvent);
    procedure SetOnStop(const Value: TNotifyEvent);
    procedure SetDemoMode(const Value: Boolean);
  protected
    procedure Execute; override;
  public
    constructor Create(AHoardHelper: THoardHelper; const AScript: String); reintroduce;
    destructor Destroy; override;

    procedure Kill;

    property DemoMode: Boolean read FDemoMode write SetDemoMode;

    property OnStart: TNotifyEvent read FOnStart write SetOnStart;
    property OnStop: TNotifyEvent read FOnStop write SetOnStop;
    property OnPrintLn: THHPrintEvent read FOnPrintLn write FOnPrintLn;
    property OnBeginUpdate: TNotifyEvent read FOnBeginUpdate write FOnBeginUpdate;
    property OnEndUpdate: TNotifyEvent read FOnEndUpdate write FOnEndUpdate;
  end;

function HH: THoardHelper;
function TweakErrorLines(S: String; Offset: Integer): String;
function StrToLibType(const S: String): THHLibraryType;
function LibTypeToStr(const T: THHLibraryType): String;
function StrToWrapType(const S: String): THHWrapType;
function WrapTypeToStr(const T: THHWrapType): String;
function PathCombine(P1, P2: String): String;
function OpenFolderAndSelectFile(const FileName: String): boolean;

implementation

uses
  System.IOUtils,
  System.StrUtils,
  Winapi.Windows,
  Winapi.ShlObj,
  Winapi.ShellAPI;

var
  _HH: THoardHelper;

function HH: THoardHelper;
begin
  if _HH = nil then
    _HH:= THoardHelper.Create(nil);
  Result:= _HH;
end;

function TweakErrorLines(S: String; Offset: Integer): String;
const
  TXT = '[line: ';
var
  SP: Integer;
  P: Integer;
  T: String;
  LN: Integer;
begin
  //TODO: Tweak line # of errors to its offset...
  //EXCEPTION in script execution: Syntax Error: Argument 0 expects type "String" instead of "array of TRow" [line: 321, column: 13]
  //   [line: 321,
  //   Find "[line: "
  Result:= S;
  SP:= 1;
  while SP < Length(Result) do begin
    //Find next instance of TXT...
    P:= Pos(TXT, Result, SP);
    if P > 0 then begin
      //Found...
      SP:= P + Length(TXT);
      //Identify number just after it
      P:= Pos(',', Result, SP-1);
      T:= Copy(Result, SP, (P - SP));
      Delete(Result, SP, (P - SP));
      LN:= StrToIntDef(T, -1);
      if LN = -1 then Continue;

      //Convert line number with offset...
      LN:= LN - Offset;
      T:= IntToStr(LN);
      Insert(T, Result, SP);

    end else begin
      //Not found
      Exit;
    end;
  end;

end;

function StrToLibType(const S: String): THHLibraryType;
  procedure Chk(const N: String; const T: THHLibraryType);
  begin
    if SameText(S, N) then
      Result:= T;
  end;
begin
  Result:= hhlGeneral;
  Chk('General', hhlGeneral);
  Chk('Movies', hhlMovies);
  Chk('Shows', hhlShows);
  Chk('Videos', hhlVideos);
  Chk('Music', hhlMusic);
  Chk('Pictures', hhlPictures);
  Chk('Documents', hhlDocuments);
  Chk('Applications', hhlApplications);
end;

function LibTypeToStr(const T: THHLibraryType): String;
begin
  case T of
    hhlGeneral: Result:= 'General';
    hhlMovies: Result:= 'Movies';
    hhlShows: Result:= 'Shows';
    hhlVideos: Result:= 'Videos';
    hhlMusic: Result:= 'Music';
    hhlPictures: Result:= 'Pictures';
    hhlDocuments: Result:= 'Documents';
    hhlApplications: Result:= 'Applications';
  end;
end;

function StrToWrapType(const S: String): THHWrapType;
  procedure Chk(const N: String; const T: THHWrapType);
  begin
    if SameText(S, N) then
      Result:= T;
  end;
begin
  Result:= hhwNone;
  Chk('None', hhwNone);
  Chk('Control', hhwControl);
  Chk('Right Line', hhwRightLine);
end;

function WrapTypeToStr(const T: THHWrapType): String;
begin
  case T of
    hhwNone: Result:= 'None';
    hhwControl: Result:= 'Control';
    hhwRightLine: Result:= 'Right Line';
  end;
end;

function PathCombine(P1, P2: String): String;
var
  T: String;
begin
  //Last char of P1
  T:= Copy(P1, Length(P1), 1);
  if T = '\' then
    Delete(P1, Length(P1), 1);

  //First char of P2
  T:= Copy(P2, 1, 1);
  if T <> '\' then
    P2:= '\' + P2;

  //Combine
  Result:= P1 + P2;

end;

const
  OFASI_EDIT = $0001;
  OFASI_OPENDESKTOP = $0002;

{$IFDEF UNICODE}
function ILCreateFromPath(pszPath: PChar): PItemIDList stdcall; external shell32
  name 'ILCreateFromPathW';
{$ELSE}
function ILCreateFromPath(pszPath: PChar): PItemIDList stdcall; external shell32
  name 'ILCreateFromPathA';
{$ENDIF}
procedure ILFree(pidl: PItemIDList) stdcall; external shell32;
function SHOpenFolderAndSelectItems(pidlFolder: PItemIDList; cidl: Cardinal;
  apidl: pointer; dwFlags: DWORD): HRESULT; stdcall; external shell32;

function OpenFolderAndSelectFile(const FileName: String): boolean;
var
  IIDL: PItemIDList;
begin
  result := false;
  IIDL := ILCreateFromPath(PChar(FileName));
  if IIDL <> nil then
    try
      result := SHOpenFolderAndSelectItems(IIDL, 0, nil, 0) = S_OK;
    finally
      ILFree(IIDL);
    end;
end;

{ THoardHelper }

constructor THoardHelper.Create(AOwner: TComponent);
begin
  inherited;
  //FSettings:= THHSettings.Create;
  FLibraries:= TObjectList<THHLibrary>.Create(True);

end;

procedure THoardHelper.DeleteLibrary(const Index: Integer);
begin
  FLibraries.Delete(Index);
end;

destructor THoardHelper.Destroy;
begin

  FreeAndNil(FLibraries);
  //FreeAndNil(FSettings);
  inherited;
end;

procedure THoardHelper.EnsureCommonFile;
var
  L: TStringList;
begin
  if not FileExists(CommonFilename) then begin  
    L:= TStringList.Create;
    try
      L.SaveToFile(CommonFilename);
    finally
      L.Free;
    end;
  end;
end;

function THoardHelper.Execute(const Script: String;
  const IncludeCommon: Boolean = True; const DemoMode: Boolean = True): TKillProc;
var
  T: THHScriptThread;
  L: TStringList;
  Tmp: String;
begin
  Result:= nil;

  if FExecuting then
    raise Exception.Create('Cannot execute script while already executing.');
    
  FExecuting:= True; //This will get set later too, but may as well set it immediately.
  try    
    L:= TStringList.Create;
    try
      //Load the common script first...
      if IncludeCommon then begin
        EnsureCommonFile;
        L.LoadFromFile(CommonFilename);
      end;
      FCommonLOC:= L.Count;
      
      //Inject new script...
      L.Add(Script);
      
      //Create and start thread...
      T:= THHScriptThread.Create(nil, L.Text);
      T.DemoMode:= DemoMode;
      T.OnPrintLn:= PrintLn;
      T.OnStart:= Started;
      T.OnStop:= Stopped;
      T.OnBeginUpdate:= ThreadBeginUpdate;
      T.OnEndUpdate:= ThreadEndUpdate;
      T.FreeOnTerminate:= True;
      Result:= T.Kill;
      T.Start;
      //DO NOT REFERENCE T AFTER THIS POINT!!!
      
    finally
      L.Free;
    end;     
  except
    on E: Exception do begin
      FExecuting:= False;
      Tmp:= TweakErrorLines(E.Message, FCommonLOC);
      PrintLn(Self, nil, Tmp);
    end;
  end;
end;

procedure THoardHelper.AddLibrary(L: THHLibrary);
begin
  FLibraries.Add(L);
end;

function THoardHelper.GetLibrary(const Index: Integer): THHLibrary;
begin
  Result:= FLibraries[Index];
end;

function THoardHelper.LibraryByName(const N: String): THHLibrary;
var
  X: Integer;
begin
  Result:= nil;
  for X := 0 to FLibraries.Count-1 do begin
    if SameText(N, FLibraries[X].FName) then begin
      Result:= FLibraries[X];
      Break;
    end;
  end;
end;

function THoardHelper.LibraryCount: Integer;
begin
  Result:= FLibraries.Count;
end;

procedure THoardHelper.LoadSettings;
var
  Config: ISuperObject;
  O: ISuperObject;
begin
  if not FileExists(SettingsFilename) then begin
    //No file found, create default...

  end;
  Config:= TSuperObject.ParseFile(SettingsFilename);

  //General

  //Libraries
  LoadLibs(Config.A['libraries']);

  //Editor
  O:= Config.O['editor'];
  FWrapType:= StrToWrapType(O.S['wrap']);
  FRightLine:= O.I['rightLine'];
  FHighlighting:= O.B['highlighting'];

  //Backups
  O:= Config.O['backups'];
  FBackupsEnabled:= O.B['enabled'];
  FBackupDirectory:= O.S['directory'];

end;

{
function THoardHelper.LibPathToLocalPath(const Value: String): String;
var
  L: THHLibrary;
begin
  //Translate relative library path to absolute local path...
  //Split string by backslash (\) characters into array of String.
  //Require that first string in array be a unique library name.
  //The rest of the string is the relative path from that library.
  //Example: "D:\Media\Movies\SomeMovie.avi" --> ""Movies\SomeMovie.avi"
  L:= HH.FindLib(Value);
  if Assigned(L) then begin
    //Use library's path...
    Result:= Value;
    Delete(Result, 1, Length(L.Name));
    //For some reason TPath.Combine(L.Location, '\') returns just '\'!!!
    if Copy(Result, 1, 1) = '\' then
      Delete(Result, 1, 1);
    Result:= TPath.Combine(L.FLocation, Result);
  end;
end;

function THoardHelper.LocalPathToLibPath(const Value: String;
  const Lib: THHLibrary): String;
begin
  //Translate absolute local path to relative library path...
  //Split string by backslash (\) characters into array of String.
  //Convert absolute path to relative path within library.
  //The rest of the string is the relative path from that library.
  //Example: "Movies\SomeMovie.avi" --> "D:\Media\Movies\SomeMovie.avi"
  Result:= Value;
  //Remove lib path from filename...
  Delete(Result, 1, Length(Lib.FLocation));
  //Insert lib name instead...
  Result:= TPath.Combine(Lib.Name, Result);
end;
}

function THoardHelper.FindLib(const Filename: String): THHLibrary;
var
  LibName: String;
  X: Integer;
  Found: Boolean;

  Arr: TArray<String>;

begin
  Result:= nil;
  Arr:= SplitString(Filename+' ', '\');

  //First array element SHOULD be the library name...
  LibName:= Arr[0];

  //Library name cannot be blank
  if LibName = '' then begin
    raise Exception.Create('Missing library name in path "'+Filename+'".');
  end;

  //Lookup library name...
  Found:= False;
  for X := 0 to FLibraries.Count-1 do begin
    if SameText(LibName, FLibraries[X].Name) then begin
      Result:= FLibraries[X];
      Found:= True;
      Break;
    end;
  end;
  if not Found then begin
    raise Exception.Create('Invalid library name "'+LibName+'".');
  end;
end;

procedure THoardHelper.SaveSettings;
var
  Config: ISuperObject;
  A: ISuperArray;
  O: ISuperObject;
begin
  Config:= SO;
  //General

  //Libraries
  SaveLibs(A);
  Config.A['libraries']:= A;

  //Editor
  O:= SO;
  O.S['wrap']:= WrapTypeToStr(FWrapType);
  O.I['rightLine']:= FRightLine;
  O.B['highlighting']:= FHighlighting;
  Config.O['editor']:= O;

  //Backups
  O:= SO;
  O.B['enabled']:= FBackupsEnabled;
  O.S['directory']:= FBackupDirectory;
  Config.O['backups']:= O;

  Config.SaveTo(SettingsFilename, True);
end;

procedure THoardHelper.LoadLibs(A: ISuperArray);
var
  X: Integer;
  O: ISuperObject;
  L: THHLibrary;
begin
  FLibraries.Clear;
  for X := 0 to A.Length-1 do begin
    O:= A.O[X];
    L:= THHLibrary.Create;
    try
      L.FName:= O.S['name'];
      L.FLibraryType:= StrToLibType(O.S['type']);
      L.FLocation:= O.S['directory'];
      L.FFilter:= O.S['filter'];
      L.FStructure:= O.S['structure'];
      L.FCollectionsSubdir:= O.B['collsubdir'];
    finally
      FLibraries.Add(L);
    end;
  end;
end;

procedure THoardHelper.SaveLibs(var A: ISuperArray);
var
  O: ISuperObject;
  L: THHLibrary;
  X: Integer;
begin
  A:= SA([]);
  for X := 0 to FLibraries.Count-1 do begin
    L:= FLibraries[X];
    O:= SO;
    try
      O.S['name']:= L.FName;
      O.S['type']:= LibTypeToStr(L.FLibraryType);
      O.S['directory']:= L.FLocation;
      O.S['filter']:= L.FFilter;
      O.S['structure']:= L.FStructure;
      O.B['collsubdir']:= L.FCollectionsSubdir;
    finally
      A.Add(O);
    end;
  end;
end;

function THoardHelper.SettingsFilename: String;
begin
  Result:= TPath.GetHomePath;
  Result:= TPath.Combine(Result, 'JD Software');
  Result:= TPath.Combine(Result, 'JD Hoard Helper');
  Result:= TPath.Combine(Result, 'HHSettings.json');
end;

function THoardHelper.CommonFilename: String;
begin
  Result:= TPath.GetHomePath;
  Result:= TPath.Combine(Result, 'JD Software');
  Result:= TPath.Combine(Result, 'JD Hoard Helper');
  Result:= TPath.Combine(Result, 'Common.hhs');
end;

procedure THoardHelper.Compile(const Script: String; const IncludeCommon: Boolean = True);
var
  L: TStringList;
  C: THHContext;
begin
  C:= THHContext.Create(nil);
  try
    C.OnPrintLn:= PrintLn;
    L:= TStringList.Create;
    try
      if IncludeCommon then begin
        EnsureCommonFile;
        L.LoadFromFile(CommonFilename);
      end;
      L.Add(Script);
      C.Compile(L.Text);
    finally
      L.Free;
    end;
  finally
    C.Free;
  end;
end;

procedure THoardHelper.SetWrapType(const Value: THHWrapType);
begin
  FWrapType := Value;
end;

procedure THoardHelper.PrintLn(Sender: TObject; Context: THHContext;
  const Text: String);
begin
  if Assigned(FOnPrintLn) then
    FOnPrintLn(Sender, Context, Text);
  //TODO: Save to file if configured?
end;

procedure THoardHelper.Started(Sender: TObject);
begin
  FExecuting:= True;
  if Assigned(FOnStarted) then
    FOnStarted(Self);
end;

procedure THoardHelper.Stopped(Sender: TObject);
begin
  FExecuting:= False;
  if Assigned(FOnStopped) then
    FOnStopped(Self);
end;

procedure THoardHelper.ThreadBeginUpdate(Sender: TObject);
begin
  //TODO
  if Assigned(FOnBeginUpdate) then
    FOnBeginUpdate(Self);
end;

procedure THoardHelper.ThreadEndUpdate(Sender: TObject);
begin
  //TODO
  if Assigned(FOnEndUpdate) then
    FOnEndUpdate(Self);
end;

procedure THoardHelper.SetBackupDirectory(const Value: String);
begin
  FBackupDirectory := Value;
end;

procedure THoardHelper.SetBackupEnabled(const Value: Boolean);
begin
  FBackupEnabled := Value;
end;

procedure THoardHelper.SetBackupLocation(const Value: String);
begin
  FBackupLocation := Value;
end;

procedure THoardHelper.SetBackupsEnabled(const Value: Boolean);
begin
  FBackupsEnabled := Value;
end;

procedure THoardHelper.SetHighlighting(const Value: Boolean);
begin
  FHighlighting := Value;
end;

procedure THoardHelper.SetProfileName(const Value: String);
begin
  FProfileName := Value;
end;

procedure THoardHelper.SetRightLine(const Value: Integer);
begin
  FRightLine := Value;
end;

{ THoardHelperLibrary }

function THHLibrary.LibPathToLocalPath(const Value: String): String;
begin
  //Use library's path...
  Result:= Value;
  Delete(Result, 1, Length(FName));
  //For some reason TPath.Combine(L.Location, '\') returns just '\'!!!
  if Copy(Result, 1, 1) = '\' then
    Delete(Result, 1, 1);
  Result:= TPath.Combine(FLocation, Result);
end;

function THHLibrary.LocalPathToLibPath(const Value: String): String;
begin
  Result:= Value;
  //Remove lib path from filename...
  Delete(Result, 1, Length(FLocation));
  //Insert lib name instead...
  Result:= PathCombine(FName, Result);
end;

procedure THHLibrary.SetCollectionsSubdir(const Value: Boolean);
begin
  FCollectionsSubdir := Value;
end;

procedure THHLibrary.SetFilter(const Value: String);
begin
  FFilter := Value;
end;

procedure THHLibrary.SetLibraryType(
  const Value: THHLibraryType);
begin
  FLibraryType := Value;
end;

procedure THHLibrary.SetLocation(const Value: String);
begin
  FLocation := Value;
end;

procedure THHLibrary.SetName(const Value: String);
begin
  FName := Value;
end;

procedure THHLibrary.SetStructure(const Value: String);
begin
  FStructure := Value;
end;

{ THoardHelperFile }

constructor THHFile.Create(AOwner: THHLibrary);
begin
  FOwner:= AOwner;

end;

destructor THHFile.Destroy;
begin

  inherited;
end;

procedure THHFile.SetFilename(const Value: String);
begin
  FFilename := Value;
end;

procedure THHFile.SetFileType(const Value: THHFileType);
begin
  FFileType := Value;
end;

{ THHScriptThread }

constructor THHScriptThread.Create(AHoardHelper: THoardHelper; const AScript: String);
begin
  inherited Create(True);
  FHoardHelper:= AHoardHelper;
  FScript:= AScript;

end;

destructor THHScriptThread.Destroy;
begin

  inherited;
end;

procedure THHScriptThread.ContextBeginUpdate(Sender: TObject);
begin
  Synchronize(SYNC_BeginUpdate);
end;

procedure THHScriptThread.ContextEndUpdate(Sender: TObject);
begin
  Synchronize(SYNC_EndUpdate);
end;

procedure THHScriptThread.ContextPrintLn(Sender: TObject; Context: THHContext;
  const Text: String);
begin
  FSYNC_PrintLn:= Text;
  Synchronize(SYNC_PrintLn);
end;

procedure THHScriptThread.Execute;
var
  Res: String;
begin
  Synchronize(SYNC_Start);
  try
    CoInitialize(nil);
    try
      FContext:= THHContext.Create(nil);
      try
        FContext.OnPrintLn:= ContextPrintLn;
        FContext.OnBeginUpdate:= ContextBeginUpdate;
        FContext.OnEndUpdate:= ContextEndUpdate;
        try
          Res:= FContext.Exec(FScript, FDemoMode);
        except
          on E: Exception do begin
            Res:= 'EXCEPTION in script execution: '+E.Message;
            Res:= TweakErrorLines(Res, HH.CommonLOC);
            Self.ContextPrintLn(Self, FContext, Res);
          end;
        end;
      finally
        FreeAndNil(FContext);
      end;
    finally
      CoUninitialize;
    end;
  finally
    Synchronize(SYNC_Stop);
  end;
end;

procedure THHScriptThread.Kill;
begin
  FContext.StopExec;
  Terminate;
end;

procedure THHScriptThread.SetDemoMode(const Value: Boolean);
begin
  FDemoMode := Value;
end;

procedure THHScriptThread.SetOnStart(const Value: TNotifyEvent);
begin
  FOnStart := Value;
end;

procedure THHScriptThread.SetOnStop(const Value: TNotifyEvent);
begin
  FOnStop := Value;
end;

procedure THHScriptThread.SYNC_BeginUpdate;
begin
  if Assigned(FOnBeginUpdate) then
    FOnBeginUpdate(Self);
end;

procedure THHScriptThread.SYNC_EndUpdate;
begin
  if Assigned(FOnEndUpdate) then
    FOnEndUpdate(Self)
end;

procedure THHScriptThread.SYNC_PrintLn;
begin
  if Assigned(FOnPrintLn) then
    FOnPrintLn(Self, FContext, FSYNC_PrintLn);
end;

procedure THHScriptThread.SYNC_Start;
begin
  if Assigned(FOnStart) then
    FOnStart(Self);
end;

procedure THHScriptThread.SYNC_Stop;
begin
  if Assigned(FOnStop) then
    FOnStop(Self);
end;

initialization
  _HH:= nil;
finalization
  if Assigned(_HH) then
    FreeAndNil(_HH);
end.
