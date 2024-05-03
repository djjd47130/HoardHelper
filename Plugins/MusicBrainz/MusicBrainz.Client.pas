unit MusicBrainz.Client;

{
  API Documentation:
  https://musicbrainz.org/doc/MusicBrainz_API

  We have 13 resources on our API which represent core entities in our database:
  area, artist, event, genre, instrument, label, place, recording, release, release-group, series, work, url
  ... rating, tag, collection ... discid, isrc, iswc
  https://musicbrainz.org/doc/MusicBrainz_Entity

  - GET lookup
  - GET browse
  - GET search

}

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections, System.Types,
  Winapi.Windows,
  XSuperObject,
  IdHTTP;

const
  MB_API_ROOT = 'https://musicbrainz.org/ws/2/';
  MB_API_USERAGENT = 'JD Hoard Helper/0.7 (jerry@jerrydodge.com)';

type

  TMusicBrainzEntityType = (etArea, etArtist, etEvent, etGenre, etInstrument,
    etLabel, etPlace, etRecording, etRelease, etReleaseGroup, etSeries,
    etWork, etURL,
    etRating, etTag, etCollection,
    etDiscID, etISRC, etISWC);

  TMusicBrainzEntity = class(TObject)
  public
    function Lookup(const MBID: String; const Inc: String = ''): ISuperObject;
    function Browse(const BrowseEntity: TMusicBrainzEntityType;
      const Offset: Integer = 0; const Inc: String = ''): ISuperObject;
    function Search(const Query: String; const Offset: Integer = 0): ISuperObject;
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
    FPageSizeGenre: Integer;
    function GetAppUserAgent: String;
    procedure SetAppUserAgent(const Value: String);
    function CheckLimiting: Boolean;
    procedure SetSecondsLimit(const Value: Single);
    function GetJSON(const Req: String): ISuperObject;
    procedure SetPageSizeGenre(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure GetGenres(AList: TStrings; const Offset: Integer = 0;
      const ClearList: Boolean = False);

  published
    property AppUserAgent: String read GetAppUserAgent write SetAppUserAgent;
    property SecondsLimit: Single read FSecondsLimit write SetSecondsLimit;
    property PageSizeGenre: Integer read FPageSizeGenre write SetPageSizeGenre;
  end;


implementation

{ TMusicBrainzEntity }

function TMusicBrainzEntity.Browse(const BrowseEntity: TMusicBrainzEntityType;
  const Offset: Integer; const Inc: String): ISuperObject;
begin

end;

function TMusicBrainzEntity.Lookup(const MBID, Inc: String): ISuperObject;
begin

end;

function TMusicBrainzEntity.Search(const Query: String;
  const Offset: Integer): ISuperObject;
begin

end;

{ TMusicBrainzClient }

constructor TMusicBrainzClient.Create(AOwner: TComponent);
begin
  inherited;
  FHTTP:= TIdHTTP.Create(nil);
  FHTTP.Request.Accept:= 'application/json';
  AppUserAgent:= MB_API_USERAGENT;
  //TODO: HTTPS...

  FReqMsec:= GetTickCount;
  FSecondsLimit:= 1;
end;

destructor TMusicBrainzClient.Destroy;
begin

  FreeAndNil(FHTTP);
  inherited;
end;

function TMusicBrainzClient.GetAppUserAgent: String;
begin
  Result:= FHTTP.Request.RawHeaders.Values['User-Agent'];
end;

procedure TMusicBrainzClient.SetPageSizeGenre(const Value: Integer);
begin
  FPageSizeGenre := Value;
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
    J:= GetJSON('/genre/all?limit='+IntToStr(FPageSizeGenre)+'&offset='+IntToStr(Offset));
    A:= J.A['genres'];
    for X := 0 to A.Length-1 do begin
      O:= A.O[X];
      AList.Append(O.S['name']);
    end;
  end;
end;

end.
