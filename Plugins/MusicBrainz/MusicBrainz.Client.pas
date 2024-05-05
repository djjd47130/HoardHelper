unit MusicBrainz.Client;

(*
  MusicBrainz API Wrapper for Delphi
  Written by Jerry Dodge

  API Documentation:
  https://musicbrainz.org/doc/MusicBrainz_API

*)

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections, System.Types,
  Winapi.Windows,
  XSuperObject,
  IdHTTP;

const
  MB_API_ROOT = 'https://musicbrainz.org/ws/2/';
  MB_API_USERAGENT = 'JD Hoard Helper (https://github.com/djjd47130/HoardHelper)';
  MB_API_DEF_PAGE_SIZE = 20;

type
  TMusicBrainzEntity = class;
  TMusicBrainzGenreEntity = class;
  TMusicBrainzEntities = class;
  TMusicBrainzClient = class;


  TMusicBrainzEntityType = (etArea, etArtist, etEvent, etGenre, etInstrument,
    etLabel, etPlace, etRecording, etRelease, etReleaseGroup, etSeries,
    etWork, etURL,
    etRating, etTag, etCollection,
    etDiscID, etISRC, etISWC);

  TMusicBrainzEntity = class(TPersistent)
  private
    FOwner: TMusicBrainzEntities;
    FEntityType: TMusicBrainzEntityType;
    FPageSize: Integer;
    function APIClient: TMusicBrainzClient;
    procedure SetPageSize(const Value: Integer);
    function LimitStr: String;
  public
    constructor Create(AOwner: TMusicBrainzEntities;
      const AEntityType: TMusicBrainzEntityType);


    function EntityTypeStr: String;

    function Lookup(const MBID: String; const Inc: String = ''): ISuperObject;
    function Browse(const BrowseEntity: TMusicBrainzEntityType;
      const Offset: Integer = 0; const Inc: String = ''): ISuperObject;
    function Search(const Query: String; const Offset: Integer = 0): ISuperObject;
  published
    property PageSize: Integer read FPageSize write SetPageSize;
  end;

  TMusicBrainzGenreEntity = class(TPersistent)
  private
    FOwner: TMusicBrainzEntities;
    FPageSize: Integer;
    procedure SetPageSize(const Value: Integer);
  public
    constructor Create(AOwner: TMusicBrainzEntities);
    function Lookup(const MBID: String; const Inc: String = ''): ISuperObject;
  published
    property PageSize: Integer read FPageSize write SetPageSize;
  end;

  TMusicBrainzEntities = class(TPersistent)
  private
    FOwner: TMusicBrainzClient;
    FGenre: TMusicBrainzGenreEntity;
    FInstrument: TMusicBrainzEntity;
    FSeries: TMusicBrainzEntity;
    FReleaseGroup: TMusicBrainzEntity;
    FRecording: TMusicBrainzEntity;
    FRelease: TMusicBrainzEntity;
    FLabel: TMusicBrainzEntity;
    FArtist: TMusicBrainzEntity;
    FWork: TMusicBrainzEntity;
    FEvent: TMusicBrainzEntity;
    FArea: TMusicBrainzEntity;
    FURL: TMusicBrainzEntity;
    FPlace: TMusicBrainzEntity;

    FRating: TMusicBrainzEntity;
    FCollection: TMusicBrainzEntity;
    FTag: TMusicBrainzEntity;
    FISRC: TMusicBrainzEntity;
    FISWC: TMusicBrainzEntity;
    FDiscID: TMusicBrainzEntity;

  public
    constructor Create(AOwner: TMusicBrainzClient);
    destructor Destroy; override;

  published
    property Area: TMusicBrainzEntity read FArea;
    property Artist: TMusicBrainzEntity read FArtist;
    property Event: TMusicBrainzEntity read FEvent;
    property Genre: TMusicBrainzGenreEntity read FGenre;
    property Instrument: TMusicBrainzEntity read FInstrument;
    property MusicLabel: TMusicBrainzEntity read FLabel;
    property Place: TMusicBrainzEntity read FPlace;
    property Recording: TMusicBrainzEntity read FRecording;
    property Release: TMusicBrainzEntity read FRelease;
    property ReleaseGroup: TMusicBrainzEntity read FReleaseGroup;
    property Series: TMusicBrainzEntity read FSeries;
    property Work: TMusicBrainzEntity read FWork;
    property URL: TMusicBrainzEntity read FURL;

    property Rating: TMusicBrainzEntity read FRating;
    property Tag: TMusicBrainzEntity read FTag;
    property Collection: TMusicBrainzEntity read FCollection;

    property DiscID: TMusicBrainzEntity read FDiscID;
    property ISRC: TMusicBrainzEntity read FISRC;
    property ISWC: TMusicBrainzEntity read FISWC;
  end;

  TMusicBrainzGenre = class(TObject)
  private
    FID: String;
    FName: String;
    FDisambiguation: String;
  public
    property ID: String read FID;
    property Name: String read FName;
    property Disambiguation: String read FDisambiguation;
  end;

  TMusicBrainzClient = class(TComponent)
  private
    FHTTP: TIdHTTP;
    FReqMsec: DWORD;
    FSecondsLimit: Single;
    FEntities: TMusicBrainzEntities;
    function GetAppUserAgent: String;
    procedure SetAppUserAgent(const Value: String);
    function CheckLimiting: Boolean;
    procedure SetSecondsLimit(const Value: Single);
    function GetJSON(const Req: String): ISuperObject;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    //TODO: Migrate into new entity structure
    procedure GetGenres(AList: TStrings; const Offset: Integer = 0;
      const ClearList: Boolean = False);

  published
    property AppUserAgent: String read GetAppUserAgent write SetAppUserAgent;
    property SecondsLimit: Single read FSecondsLimit write SetSecondsLimit;

    property Entities: TMusicBrainzEntities read FEntities;
  end;

function MusicBrainzEntityTypeToStr(const Value: TMusicBrainzEntityType): String;
function MusicBrainzStrToEntityType(const Value: String): TMusicBrainzEntityType;

implementation

function MusicBrainzEntityTypeToStr(const Value: TMusicBrainzEntityType): String;
begin
  case Value of
    etArea: Result:= 'area';
    etArtist: Result:= 'artist';
    etEvent: Result:= 'event';
    etGenre: Result:= 'genre';
    etInstrument: Result:= 'instrument';
    etLabel: Result:= 'label';
    etPlace: Result:= 'place';
    etRecording: Result:= 'recording';
    etRelease: Result:= 'release';
    etReleaseGroup: Result:= 'release-group';
    etSeries: Result:= 'series';
    etWork: Result:= 'work';
    etURL: Result:= 'url';
    etRating: Result:= 'rating';
    etTag: Result:= 'tag';
    etCollection: Result:= 'collection';
    etDiscID: Result:= 'discid';
    etISRC: Result:= 'isrc';
    etISWC: Result:= 'iswc';
  end;
end;

function MusicBrainzStrToEntityType(const Value: String): TMusicBrainzEntityType;
begin

end;

{ TMusicBrainzEntity }

constructor TMusicBrainzEntity.Create(AOwner: TMusicBrainzEntities;
  const AEntityType: TMusicBrainzEntityType);
begin
  FOwner:= AOwner;
  FEntityType:= AEntityType;
  FPageSize:= MB_API_DEF_PAGE_SIZE;
end;

procedure TMusicBrainzEntity.SetPageSize(const Value: Integer);
begin
  FPageSize := Value;
end;

function TMusicBrainzEntity.EntityTypeStr: String;
begin
  Result:= MusicBrainzEntityTypeToStr(FEntityType);
end;

function TMusicBrainzEntity.LimitStr: String;
begin
  Result:= 'limit='+IntToStr(Self.FPageSize);
end;

function TMusicBrainzEntity.APIClient: TMusicBrainzClient;
begin
  Result:= FOwner.FOwner;
end;

function TMusicBrainzEntity.Browse(const BrowseEntity: TMusicBrainzEntityType;
  const Offset: Integer; const Inc: String): ISuperObject;
var
  URL: String;
begin
  if APIClient.CheckLimiting then begin

  end;
end;

function TMusicBrainzEntity.Lookup(const MBID, Inc: String): ISuperObject;
var
  URL: String;
begin
  if APIClient.CheckLimiting then begin
    URL:= EntityTypeStr+'/'+MBID+'?inc='+Inc;
    Result:= APIClient.GetJSON(URL);
  end;
end;

function TMusicBrainzEntity.Search(const Query: String;
  const Offset: Integer): ISuperObject;
var
  URL: String;
begin
  if APIClient.CheckLimiting then begin
    URL:= EntityTypeStr+'?query='+Query+'&'+LimitStr;
    Result:= APIClient.GetJSON(URL);
  end;
end;

{ TMusicBrainzGenreEntity }

constructor TMusicBrainzGenreEntity.Create(AOwner: TMusicBrainzEntities);
begin
  FOwner:= AOwner;
  FPageSize:= MB_API_DEF_PAGE_SIZE;
end;

function TMusicBrainzGenreEntity.Lookup(const MBID, Inc: String): ISuperObject;
begin
  {
  if CheckLimiting then begin
    //https://musicbrainz.org/ws/2/genre/all?limit=50&fmt=json
    Result:= GetJSON('/genre/all?limit='+IntToStr(FPageSizeGenre)+'&offset='+IntToStr(Offset));
  end;
  }
end;

procedure TMusicBrainzGenreEntity.SetPageSize(const Value: Integer);
begin
  FPageSize := Value;
end;

{ TMusicBrainzEntities }

constructor TMusicBrainzEntities.Create(AOwner: TMusicBrainzClient);
begin
  FOwner:= AOwner;

  FGenre:= TMusicBrainzGenreEntity.Create(Self);
  FInstrument:= TMusicBrainzEntity.Create(Self, etInstrument);
  FSeries:= TMusicBrainzEntity.Create(Self, etSeries);
  FReleaseGroup:= TMusicBrainzEntity.Create(Self, etReleaseGroup);
  FRecording:= TMusicBrainzEntity.Create(Self, etRecording);
  FRelease:= TMusicBrainzEntity.Create(Self, etRelease);
  FLabel:= TMusicBrainzEntity.Create(Self, etLabel);
  FArtist:= TMusicBrainzEntity.Create(Self, etArtist);
  FWork:= TMusicBrainzEntity.Create(Self, etWork);
  FEvent:= TMusicBrainzEntity.Create(Self, etEvent);
  FArea:= TMusicBrainzEntity.Create(Self, etArea);
  FURL:= TMusicBrainzEntity.Create(Self, etURL);
  FPlace:= TMusicBrainzEntity.Create(Self, etPlace);

  FRating:= TMusicBrainzEntity.Create(Self, etRating);
  FTag:= TMusicBrainzEntity.Create(Self, etTag);
  FCollection:= TMusicBrainzEntity.Create(Self, etCollection);

  FDiscID:= TMusicBrainzEntity.Create(Self, etDiscID);
  FISRC:= TMusicBrainzEntity.Create(Self, etISRC);
  FISWC:= TMusicBrainzEntity.Create(Self, etISWC);
end;

destructor TMusicBrainzEntities.Destroy;
begin
  FreeAndNil(FGenre);
  FreeAndNil(FInstrument);
  FreeAndNil(FSeries);
  FreeAndNil(FReleaseGroup);
  FreeAndNil(FRecording);
  FreeAndNil(FRelease);
  FreeAndNil(FLabel);
  FreeAndNil(FArtist);
  FreeAndNil(FWork);
  FreeAndNil(FEvent);
  FreeAndNil(FArea);
  FreeAndNil(FURL);
  FreeAndNil(Place);

  FreeAndNil(FRating);
  FreeAndNil(FTag);
  FreeAndNil(FCollection);

  FreeAndNil(FDiscID);
  FreeAndNil(FISRC);
  FreeAndNil(FISWC);

  inherited;
end;

{ TMusicBrainzClient }

constructor TMusicBrainzClient.Create(AOwner: TComponent);
begin
  inherited;
  FHTTP:= TIdHTTP.Create(nil);
  FHTTP.Request.Accept:= 'application/json';
  AppUserAgent:= MB_API_USERAGENT;
  //TODO: HTTPS...

  FEntities:= TMusicBrainzEntities.Create(Self);

  FReqMsec:= GetTickCount;
  FSecondsLimit:= 1;
end;

destructor TMusicBrainzClient.Destroy;
begin

  FreeAndNil(FEntities);

  FreeAndNil(FHTTP);
  inherited;
end;

function TMusicBrainzClient.GetAppUserAgent: String;
begin
  Result:= FHTTP.Request.RawHeaders.Values['User-Agent'];
end;

procedure TMusicBrainzClient.SetSecondsLimit(const Value: Single);
begin
  FSecondsLimit := Value;
end;

procedure TMusicBrainzClient.SetAppUserAgent(const Value: String);
begin
  FHTTP.Request.RawHeaders.Values['User-Agent']:= Value;
end;

function TMusicBrainzClient.CheckLimiting: Boolean;
var
  T: DWORD;
begin
  //Rate limiting: https://musicbrainz.org/doc/MusicBrainz_API/Rate_Limiting
  T:= GetTickCount;
  Result:= (T - FReqMsec) >= FSecondsLimit;
  if not Result then
    raise Exception.Create('Sorry, MusicBrainz has a limit of 1 request per '+
      FormatFloat('0.###', FSecondsLimit)+' second(s)');
  FReqMsec:= T;
end;

function TMusicBrainzClient.GetJSON(const Req: String): ISuperObject;
var
  R: String;
  U: String;
  S: String;
begin
  Result:= nil;
  R:= Req;
  if Copy(R, 1, 1) = '/' then
    Delete(R, 1, 1);
  U:= MB_API_ROOT + R;
  S:= FHTTP.Get(U);
  Result:= SO(S);
end;

procedure TMusicBrainzClient.GetGenres(AList: TStrings; const Offset: Integer = 0;
  const ClearList: Boolean = False);
var
  J, O: ISuperObject;
  A: ISuperArray;
  X: Integer;
begin
  if CheckLimiting then begin
    if ClearList then
      AList.Clear;
    //https://musicbrainz.org/ws/2/genre/all?limit=50&fmt=json
    J:= GetJSON('/genre/all?limit='+IntToStr(20)+'&offset='+IntToStr(Offset));
    A:= J.A['genres'];                    //TODO
    for X := 0 to A.Length-1 do begin
      O:= A.O[X];
      AList.Append(O.S['name']);
    end;
  end;
end;

end.
