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
    procedure SetLibraryType(const Value: THHLibraryType);
    procedure SetLocation(const Value: String);
    procedure SetName(const Value: String);
  public
    property LibraryType: THHLibraryType read FLibraryType write SetLibraryType;
    property Location: String read FLocation write SetLocation;
    property Name: String read FName write SetName;
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
    procedure SetProfileName(const Value: String);
    procedure SetBackupEnabled(const Value: Boolean);
    procedure SetBackupLocation(const Value: String);
    procedure LoadLibs(A: ISuperArray);

    procedure PrintLn(Sender: TObject; Context: THHContext;
      const Text: String);
    procedure Started(Sender: TObject);
    procedure Stopped(Sender: TObject);
    
    function GetLibrary(const Index: Integer): THHLibrary;
    procedure SaveLibs(var A: ISuperArray);
    procedure SetWrapType(const Value: THHWrapType);
    procedure SetHighlighting(const Value: Boolean);
    procedure SetRightLine(const Value: Integer);
    procedure SetBackupDirectory(const Value: String);
    procedure SetBackupsEnabled(const Value: Boolean);
    procedure EnsureCommonFile;
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
    function TranslateLibPath(const Path: String): String;

    procedure Execute(const Script: String);

    property Libraries[const Index: Integer]: THHLibrary read GetLibrary;
    property Executing: Boolean read FExecuting;
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
    procedure SYNC_PrintLn;
    procedure SYNC_Start;
    procedure SYNC_Stop;
    procedure ContextPrintLn(Sender: TObject; Context: THHContext;
      const Text: String);
    procedure SetOnStart(const Value: TNotifyEvent);
    procedure SetOnStop(const Value: TNotifyEvent);
  protected
    procedure Execute; override;
  public
    constructor Create(AHoardHelper: THoardHelper; const AScript: String); reintroduce;
    destructor Destroy; override;

    property OnStart: TNotifyEvent read FOnStart write SetOnStart;
    property OnStop: TNotifyEvent read FOnStop write SetOnStop;
    property OnPrintLn: THHPrintEvent read FOnPrintLn write FOnPrintLn;
  end;

function HH: THoardHelper;
function StrToLibType(const S: String): THHLibraryType;
function LibTypeToStr(const T: THHLibraryType): String;
function StrToWrapType(const S: String): THHWrapType;
function WrapTypeToStr(const T: THHWrapType): String;

implementation

uses
  System.IOUtils;

var
  _HH: THoardHelper;

function HH: THoardHelper;
begin
  if _HH = nil then
    _HH:= THoardHelper.Create(nil);
  Result:= _HH;
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

procedure THoardHelper.Execute(const Script: String);
var
  T: THHScriptThread;
  L: TStringList;
begin
  if FExecuting then
    raise Exception.Create('Cannot execute script while already executing.');
    
  FExecuting:= True; //This will get set later too, but may as well set it immediately.
  try    
    L:= TStringList.Create;
    try
      //Load the common script first...
      EnsureCommonFile;
      L.LoadFromFile(CommonFilename);
      
      //Inject new script...
      L.Add(Script);
      
      //Create and start thread...
      T:= THHScriptThread.Create(nil, L.Text);
      T.OnPrintLn:= PrintLn;
      T.OnStart:= Started;
      T.OnStop:= Stopped;
      T.FreeOnTerminate:= True;
      T.Start;
      //DO NOT REFERENCE T AFTER THIS POINT!!!
      
    finally
      L.Free;
    end;     
  except
    on E: Exception do begin
      FExecuting:= False;
      PrintLn(Self, nil, E.Message);
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

function THoardHelper.TranslateLibPath(const Path: String): String;
begin
  //TODO: Return a translated absolute path based on libraries
  //For example, if there's a library named "Movies" at "D:\Media\Movies\", then
  //a path of "Movies\Star Wars" would become "D:\Media\Movies\Star Wars\".
  //This is necessary for filesystem security, restricting users to ONLY
  //perform file operations on files within registered libraries.

end;

{ THoardHelperLibrary }

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
        try
          Res:= FContext.Exec(FScript);
        except
          on E: Exception do begin
            Self.ContextPrintLn(Self, FContext, 'EXCEPTION in script execution: '+E.Message);
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

procedure THHScriptThread.SetOnStart(const Value: TNotifyEvent);
begin
  FOnStart := Value;
end;

procedure THHScriptThread.SetOnStop(const Value: TNotifyEvent);
begin
  FOnStop := Value;
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
