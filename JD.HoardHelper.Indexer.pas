unit JD.HoardHelper.Indexer;

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections, System.Types,
  JD.HoardHelper, ActiveX;

type
  THHIndexFile = class;
  THHIndexFileItem = class;
  THHIndexerThread = class;
  THHIndexer = class;

  //Represents a single "libdata.hhi" file (JSON format)
  THHIndexFile = class(TObject)
  private
    FOwner: THHIndexer;
    FFilename: String;
    FLibName: String;
    procedure SetFilename(const Value: String);
    procedure SetLibName(const Value: String);
  public
    constructor Create(AOwner: THHIndexer);
    destructor Destroy; override;

    property Filename: String read FFilename write SetFilename;
    property LibName: String read FLibName write SetLibName;
  end;

  //Represents a single item within a "libdata.hhi" file
  THHIndexFileItem = class(TObject)
  private
    FOwner: THHIndexFile;
    FFilename: String;
    procedure SetFilename(const Value: String);
  public
    constructor Create(AOwner: THHIndexFile);
    destructor Destroy; override;

    property Filename: String read FFilename write SetFilename;
  end;

  THHIndexerThread = class(TThread)
  private
    FOwner: THHIndexer;
    FActive: Boolean;
    procedure Init;
    procedure Uninit;
    procedure ExecuteIndexing;
    procedure SetActive(const Value: Boolean);
  protected
    procedure Execute; override;
    function CheckActive: Boolean;
  public
    constructor Create(AOwner: THHIndexer); reintroduce;
    destructor Destroy; override;
    property Owner: THHIndexer read FOwner;

    property Active: Boolean read FActive write SetActive;
  end;

  THHIndexer = class(TComponent)
  private
    FHoardHelper: THoardHelper;
    procedure SetHoardHelper(const Value: THoardHelper);
  protected

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property HoardHelper: THoardHelper read FHoardHelper write SetHoardHelper;
  end;

implementation

{ THHIndexFile }

constructor THHIndexFile.Create(AOwner: THHIndexer);
begin
  FOwner:= AOwner;

end;

destructor THHIndexFile.Destroy;
begin

  inherited;
end;

procedure THHIndexFile.SetFilename(const Value: String);
begin
  FFilename := Value;
end;

procedure THHIndexFile.SetLibName(const Value: String);
begin
  FLibName := Value;
end;

{ THHIndexItem }

constructor THHIndexFileItem.Create(AOwner: THHIndexFile);
begin

end;

destructor THHIndexFileItem.Destroy;
begin

  inherited;
end;

procedure THHIndexFileItem.SetFilename(const Value: String);
begin
  FFilename := Value;
end;

{ THHIndexerThread }

constructor THHIndexerThread.Create(AOwner: THHIndexer);
begin
  inherited Create(True);
  FOwner:= AOwner;
end;

destructor THHIndexerThread.Destroy;
begin

  inherited;
end;

function THHIndexerThread.CheckActive: Boolean;
begin
  Result:= FActive and (not Terminated);
end;

procedure THHIndexerThread.Execute;
begin
  Init;
  try
    while not Terminated do begin
      if CheckActive then
        ExecuteIndexing;
      Sleep(1);
    end;
  finally
    Uninit;
  end;
end;

procedure THHIndexerThread.Init;
begin
  CoInitialize(nil);
  //TODO: Initialize everything...

end;

procedure THHIndexerThread.SetActive(const Value: Boolean);
begin
  FActive := Value;
end;

procedure THHIndexerThread.Uninit;
begin
  //TODO: Destroy everything...

  CoUninitialize;
end;

procedure THHIndexerThread.ExecuteIndexing;
begin
  //TODO: Perform actual indexing...

  //- Get list of all directories recursively...

  //- Loop all found directories...

    //- Open "libdata.hhi", create if doesn't exist...





end;

{ THHIndexer }

constructor THHIndexer.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor THHIndexer.Destroy;
begin

  inherited;
end;

procedure THHIndexer.SetHoardHelper(const Value: THoardHelper);
begin
  //TODO: Protect when something is active...
  FHoardHelper := Value;
end;

end.
