unit JD.HoardHelper.Indexer;

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections, System.Types,
  JD.HoardHelper, ActiveX,
  XSuperObject;

type
  THHIndexFile = class;
  THHIndexFileItem = class;
  THHIndexerThread = class;
  THHIndexer = class;

  //Represents a single "libdata.hhi" file (JSON format)
  THHIndexFile = class(TObject)
  private
    FOwner: THHIndexerThread;
    FFilename: String;
    FLibName: String;
    FItems: TObjectList<THHIndexFileItem>;
    procedure SetFilename(const Value: String);
    procedure SetLibName(const Value: String);
  public
    constructor Create(AOwner: THHIndexerThread);
    destructor Destroy; override;

    property Filename: String read FFilename write SetFilename;
    property LibName: String read FLibName write SetLibName;
  end;

  //Represents a single item within a "libdata.hhi" file
  THHIndexFileItem = class(TObject)
  private
    FOwner: THHIndexFile;
    FFilename: String;
    FTags: TStringList;
    FExtInfo: String;
    procedure SetFilename(const Value: String);
    function GetTags: TStrings;
    procedure SetTags(const Value: TStrings);
  public
    constructor Create(AOwner: THHIndexFile);
    destructor Destroy; override;

    property Filename: String read FFilename write SetFilename;
    property ExtInfo: String read FExtInfo;
    property Tags: TStrings read GetTags write SetTags;
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

constructor THHIndexFile.Create(AOwner: THHIndexerThread);
begin
  FOwner:= AOwner;
  FItems:= TObjectList<THHIndexFileItem>.Create(True);
end;

destructor THHIndexFile.Destroy;
begin

  FreeAndNil(FItems);
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
  FOwner:= AOwner;
  FTags:= TStringList.Create;

end;

destructor THHIndexFileItem.Destroy;
begin

  FreeAndNil(FTags);
  inherited;
end;

procedure THHIndexFileItem.SetFilename(const Value: String);
begin
  FFilename := Value;
end;

function THHIndexFileItem.GetTags: TStrings;
begin
  Result:= TStrings(FTags);
end;

procedure THHIndexFileItem.SetTags(const Value: TStrings);
begin
  FTags.Assign(Value);
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

  //- Loop all libraries...

    //- Get list of all files in library recursively...

    //- Loop all files found...

      //- Extract tag data from each file...

      //- Add file and tag data to new JSON array...

    //- Update "libdata.hhi" in library root with new JSON array...





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
