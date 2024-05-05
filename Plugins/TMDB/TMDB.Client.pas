unit TMDB.Client;

(*
  TMDB API Wrapper for Delphi
  Written by Jerry Dodge

  API Documentation:
  https://developer.themoviedb.org/reference/intro/getting-started

  Test IDs:
  - Movie - Star Wars = 11
  - TV Show - Star Trek - 253

*)

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections, System.Types,
  Winapi.Windows,
  XSuperObject,
  IdHTTP;

const
  TMDB_API_ROOT = 'https://api.themoviedb.org/3/';
  TMDB_API_USERAGENT = 'JD Hoard Helper (https://github.com/djjd47130/HoardHelper)';

type
  TTMDBClient = class;



  TTMDBService = class(TPersistent)
  private
    FOwner: TTMDBClient;
  public
    constructor Create(AOwner: TTMDBClient); virtual;
    destructor Destroy; override;
  end;



  TTMDBAccount = class(TTMDBService)
  public

  end;

  TTMDBAuthentication = class(TTMDBService)
  public

  end;

  TTMDBCertifications = class(TTMDBService)
  public
    function GetMovieCertifications: ISuperObject;
    function GetTVCertifications: ISuperObject;
  end;

  TTMDBChanges = class(TTMDBService)
  public

  end;

  TTMDBCollections = class(TTMDBService)
  public

  end;

  TTMDBCompanies = class(TTMDBService)
  public

  end;

  TTMDBConfiguration = class(TTMDBService)
  public
    function GetDetails: ISuperObject;
    function GetCountries: ISuperArray;
    function GetJobs: ISuperArray;
    function GetLanguages: ISuperArray;
    function GetPrimaryTranslations: ISuperArray;
    function GetTimeZones: ISuperArray;
  end;

  TTMDBCredits = class(TTMDBService)
  public
    function GetDetails(const CreditID: Integer): ISuperObject;
  end;

  TTMDBDiscover = class(TTMDBService)
  public

  end;

  TTMDBFind = class(TTMDBService)
  public

  end;

  TTMDBGenres = class(TTMDBService)
  public
    function GetMovieList(const Language: String = ''): ISuperArray;
    function GetTVList(const Language: String = ''): ISuperArray;
  end;

  TTMDBGuestSessions = class(TTMDBService)
  public

  end;

  TTMDBKeywords = class(TTMDBService)
  public

  end;

  TTMDBLists = class(TTMDBService)
  public

  end;

  TTMDBMovieLists = class(TTMDBService)
  public

  end;

  TTMDBMovies = class(TTMDBService)
  public
    function GetDetails(const MovieID: Integer; const AppendToResponse: String = '';
      const Language: String = ''): ISuperObject;
    function GetAlternativeTitles(const MovieID: Integer;
      const Country: String = ''): ISuperArray;
    function GetExternalIDs(const MovieID: Integer): ISuperObject;
    function GetImages(const MovieID: Integer; const IncludeImageLanguage: String = '';
      const Language: String = ''): ISuperObject;
    function GetKeywords(const MovieID: Integer): ISuperArray;
    function GetReleaseDates(const MovieID: Integer): ISuperArray;
    function GetTranslations(const MovieID: Integer): ISuperArray;
    function GetVideos(const MovieID: Integer; const Language: String = ''): ISuperArray;
    function GetWatchProviders(const MovieID: Integer): ISuperObject;
  end;

  TTMDBNetworks = class(TTMDBService)
  public
    function GetDetails(const NetworkID: Integer): ISuperObject;
    function GetAlternativeNames(const NetworkID: Integer): ISuperArray;
    function GetImages(const NetworkID: Integer): ISuperArray;
  end;

  TTMDBPeopleLists = class(TTMDBService)
  public

  end;

  TTMDBPeople = class(TTMDBService)
  public
    function GetDetails(const PersonID: Integer; const AppendToResponse: String = '';
      const Language: String = ''): ISuperObject;
    function GetImages(const PersonID: Integer): ISuperArray;
    function GetMovieCredits(const PersonID: Integer; const Language: String = ''): ISuperArray;
    function GetTVCredits(const PersonID: Integer; const Language: String = ''): ISuperArray;
  end;

  TTMDBReviews = class(TTMDBService)
  public

  end;

  TTMDBSearch = class(TTMDBService)
  public
    function SearchCollections(const Query: String; const IncludeAdult: Boolean = False;
      const Language: String = ''; const Page: Integer = 1; const Region: String = ''): ISuperObject;
    function SearchCompanies(const Query: String; const Page: Integer = 1): ISuperObject;
    function SearchKeywords(const Query: String; const Page: Integer = 1): ISuperObject;
    function SearchMovies(const Query: String; const IncludeAdult: Boolean = False;
      const Language: String = ''; const PrimaryReleaseYear: String = '';
      const Page: Integer = 1; const Region: String = ''; const Year: String = ''): ISuperObject;
    function SearchMulti(const Query: String; const IncludeAdult: Boolean = False;
      const Language: String = ''; const Page: Integer = 1): ISuperObject;
    function SearchPerson(const Query: String; const IncludeAdult: Boolean = False;
      const Language: String = ''; const Page: Integer = 1): ISuperObject;
    function SearchTV(const Query: String; const FirstAirDateYear: String = '';
      const IncludeAdult: Boolean = False; const Language: String = '';
      const Page: Integer = 1; const Year: String = ''): ISuperObject;
  end;

  TTMDBTrending = class(TTMDBService)
  public

  end;

  TTMDBTVSeriesLists = class(TTMDBService)
  public

  end;

  TTMDBTVSeries = class(TTMDBService)
  public
    function GetDetails(const SeriesID: Integer; const AppendToResponse: String = '';
      const Language: String = ''): ISuperObject;
    function GetAlternativeTitles(const SeriesID: Integer): ISuperArray;
    function GetContentRatings(const SeriesID: Integer): ISuperArray;
    function GetEpisodeGroups(const SeriesID: Integer): ISuperArray;
    function GetExternalIDs(const SeriesID: Integer): ISuperObject;
    function GetImages(const SeriesID: Integer; const IncludeImageLanguage: String = '';
      const Language: String = ''): ISuperArray;
    function GetKeywords(const SeriesID: Integer): ISuperArray;
    function GetTranslations(const SeriesID: Integer): ISuperArray;
    function GetVideos(const SeriesID: Integer; const IncludeVideoLanguage: String = '';
      const Language: String = ''): ISuperArray;
    function GetWatchProviders(const SeriesID: Integer): ISuperObject;
  end;

  TTMDBTVSeasons = class(TTMDBService)
  public
    function GetDetails(const SeriesID: Integer; const SeasonNumber: Integer;
      const AppendToResponse: String = ''; const Language: String = ''): ISuperObject;
    function GetExternalIDs(const SeriesID: Integer; const SeasonNumber: Integer): ISuperObject;
    function GetImages(const SeriesID: Integer; const SeasonNumber: Integer;
      const IncludeImageLanguage: String = ''; const Language: String = ''): ISuperObject;
    function GetTranslations(const SeriesID: Integer; const SeasonNumber: Integer): ISuperObject;
    function GetVideos(const SeriesID: Integer; const SeasonNumber: Integer;
      const IncludeVideoLanguage: String = ''; const Language: String = ''): ISuperObject;
    function GetWatchProviders(const SeriesID: Integer; const SeasonNumber: Integer;
      const Language: String = ''): ISuperObject;
  end;

  TTMDBTVEpisodes = class(TTMDBService)
  public
    function GetDetails(const SeriesID: Integer; const SeasonNumber: Integer;
      const EpisodeNumber: Integer; const AppendToResponse: String = '';
      const Language: String = ''): ISuperObject;
    function GetExternalIDs(const SeriesID: Integer; const SeasonNumber: Integer;
      const EpisodeNumber: Integer): ISuperObject;
    function GetImages(const SeriesID: Integer; const SeasonNumber: Integer;
      const EpisodeNumber: Integer; const IncludeImageLanguage: String = '';
      const Language: String = ''): ISuperArray;
    function GetTranslations(const SeriesID: Integer; const SeasonNumber: Integer;
      const EpisodeNumber: Integer): ISuperArray;
    function GetVideos(const SeriesID: Integer; const SeasonNumber: Integer;
      const EpisodeNumber: Integer; const IncludeVideoLanguage: String = '';
      const Language: String = ''): ISuperArray;
  end;

  TTMDBTVEpisodeGroups = class(TTMDBService)
  public
    function GetEpisodeGroups(const TVEpisodeGroupID: String): ISuperObject;
  end;

  TTMDBWatchProviders = class(TTMDBService)
  public
    function GetAvailableRegions(const Language: String = ''): ISuperArray;
    function GetMovieProviders(const Language: String = '';
      const WatchRegion: String = ''): ISuperArray;
    function GetTVProviders(const Language: String = '';
      const WatchRegion: String = ''): ISuperArray;
  end;





  TTMDBClient = class(TComponent)
  private
    FHTTP: TIdHTTP;
    FAPIKey: String;
    FAPIReadAccessToken: String;
    FConfiguration: TTMDBConfiguration;
    FGenres: TTMDBGenres;
    FMovies: TTMDBMovies;
    FPeople: TTMDBPeople;
    FNetworks: TTMDBNetworks;
    FSearch: TTMDBSearch;
    FTVSeries: TTMDBTVSeries;
    FTVSeasons: TTMDBTVSeasons;
    FWatchProviders: TTMDBWatchProviders;
    FTVEpisodes: TTMDBTVEpisodes;
    FCompanies: TTMDBCompanies;
    FCertifications: TTMDBCertifications;
    FCollections: TTMDBCollections;
    FAuthentication: TTMDBAuthentication;
    FChanges: TTMDBChanges;
    FCredits: TTMDBCredits;
    FAccount: TTMDBAccount;
    FTVEpisodeGroups: TTMDBTVEpisodeGroups;
    FDiscover: TTMDBDiscover;
    FFind: TTMDBFind;
    FGuestSessions: TTMDBGuestSessions;
    FKeywords: TTMDBKeywords;
    FLists: TTMDBLists;
    FMovieLists: TTMDBMovieLists;
    FPeopleLists: TTMDBPeopleLists;
    FTrending: TTMDBTrending;
    FReviews: TTMDBReviews;
    FTVSeriesLists: TTMDBTVSeriesLists;
    procedure SetAPIKey(const Value: String);
    procedure SetAPIReadAccessToken(const Value: String);
    function GetAppUserAgent: String;
    procedure SetAppUserAgent(const Value: String);
    function GetJSON(const Req: String; const Params: String = ''): ISuperObject;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property APIKey: String read FAPIKey write SetAPIKey;
    property APIReadAccessToken: String read FAPIReadAccessToken write SetAPIReadAccessToken;
    property AppUserAgent: String read GetAppUserAgent write SetAppUserAgent;

    property Account: TTMDBAccount read FAccount;
    property Authentication: TTMDBAuthentication read FAuthentication;
    property Certifications: TTMDBCertifications read FCertifications;
    property Changes: TTMDBChanges read FChanges;
    property Collections: TTMDBCollections read FCollections;
    property Companies: TTMDBCompanies read FCompanies;
    property Configuration: TTMDBConfiguration read FConfiguration;
    property Credits: TTMDBCredits read FCredits;
    property Discover: TTMDBDiscover read FDiscover;
    property Find: TTMDBFind read FFind;
    property Genres: TTMDBGenres read FGenres;
    property GuestSessions: TTMDBGuestSessions read FGuestSessions;
    property Keywords: TTMDBKeywords read FKeywords;
    property Lists: TTMDBLists read FLists;
    property MovieLists: TTMDBMovieLists read FMovieLists;
    property Movies: TTMDBMovies read FMovies;
    property Networks: TTMDBNetworks read FNetworks;
    property PeopleLists: TTMDBPeopleLists read FPeopleLists;
    property People: TTMDBPeople read FPeople;
    property Reviews: TTMDBReviews read FReviews;
    property Search: TTMDBSearch read FSearch;
    property Trending: TTMDBTrending read FTrending;
    property TVSeriesLists: TTMDBTVSeriesLists read FTVSeriesLists;
    property TVSeries: TTMDBTVSeries read FTVSeries;
    property TVSeasons: TTMDBTVSeasons read FTVSeasons;
    property TVEpisodes: TTMDBTVEpisodes read FTVEpisodes;
    property TVEpisodeGroups: TTMDBTVEpisodeGroups read FTVEpisodeGroups;
    property WatchProviders: TTMDBWatchProviders read FWatchProviders;

  end;

implementation

{ TTMDBClient }

constructor TTMDBClient.Create(AOwner: TComponent);
begin
  inherited;
  FHTTP:= TIdHTTP.Create(nil);
  FHTTP.Request.Accept:= 'application/json';
  AppUserAgent:= TMDB_API_USERAGENT;

  //TODO: HTTPS

  FAccount:= TTMDBAccount.Create(Self);
  FAuthentication:= TTMDBAuthentication.Create(Self);
  FCertifications:= TTMDBCertifications.Create(Self);
  FChanges:= TTMDBChanges.Create(Self);
  FCollections:= TTMDBCollections.Create(Self);
  FCompanies:= TTMDBCompanies.Create(Self);
  FConfiguration:= TTMDBConfiguration.Create(Self);
  FCredits:= TTMDBCredits.Create(Self);
  FDiscover:= TTMDBDiscover.Create(Self);
  FFind:= TTMDBFind.Create(Self);
  FGenres:= TTMDBGenres.Create(Self);
  FGuestSessions:= TTMDBGuestSessions.Create(Self);
  FKeywords:= TTMDBKeywords.Create(Self);
  FLists:= TTMDBLists.Create(Self);
  FMovieLists:= TTMDBMovieLists.Create(Self);
  FMovies:= TTMDBMovies.Create(Self);
  FNetworks:= TTMDBNetworks.Create(Self);
  FPeopleLists:= TTMDBPeopleLists.Create(Self);
  FPeople:= TTMDBPeople.Create(Self);
  FReviews:= TTMDBReviews.Create(Self);
  FSearch:= TTMDBSearch.Create(Self);
  FTrending:= TTMDBTrending.Create(Self);
  FTVSeriesLists:= TTMDBTVSeriesLists.Create(Self);
  FTVSeries:= TTMDBTVSeries.Create(Self);
  FTVSeasons:= TTMDBTVSeasons.Create(Self);
  FTVEpisodes:= TTMDBTVEpisodes.Create(Self);
  FTVEpisodeGroups:= TTMDBTVEpisodeGroups.Create(Self);
  FWatchProviders:= TTMDBWatchProviders.Create(Self);

end;

destructor TTMDBClient.Destroy;
begin

  FreeAndNil(FWatchProviders);
  FreeAndNil(FTVEpisodeGroups);
  FreeAndNil(FTVEpisodes);
  FreeAndNil(FTVSeasons);
  FreeAndNil(FTVSeries);
  FreeAndNil(FTVSeriesLists);
  FreeAndNil(FTrending);
  FreeAndNil(FSearch);
  FreeAndNil(FReviews);
  FreeAndNil(FPeople);
  FreeAndNil(FPeopleLists);
  FreeAndNil(FNetworks);
  FreeAndNil(FMovies);
  FreeAndNil(FMovieLists);
  FreeAndNil(FLists);
  FreeAndNil(FKeywords);
  FreeAndNil(FGuestSessions);
  FreeAndNil(FGenres);
  FreeAndNil(FFind);
  FreeAndNil(FDiscover);
  FreeAndNil(FCredits);
  FreeAndNil(FConfiguration);
  FreeAndNil(FCompanies);
  FreeAndNil(FCollections);
  FreeAndNil(FChanges);
  FreeAndNil(FCertifications);
  FreeAndNil(FAuthentication);
  FreeAndNil(FAccount);

  FreeAndNil(FHTTP);
  inherited;
end;

function TTMDBClient.GetAppUserAgent: String;
begin
  Result:= FHTTP.Request.RawHeaders.Values['User-Agent'];
end;

function TTMDBClient.GetJSON(const Req, Params: String): ISuperObject;
var
  R: String;
  U: String;
  S: String;
begin
  Result:= nil;
  R:= Req;
  if Copy(R, 1, 1) = '/' then
    Delete(R, 1, 1);
  U:= TMDB_API_ROOT + R + '?api_key=' + FAPIKey + Params;
  S:= FHTTP.Get(U);
  Result:= SO(S);
end;

procedure TTMDBClient.SetAPIKey(const Value: String);
begin
  FAPIKey := Value;
end;

procedure TTMDBClient.SetAPIReadAccessToken(const Value: String);
begin
  FAPIReadAccessToken := Value;
end;

procedure TTMDBClient.SetAppUserAgent(const Value: String);
begin
  FHTTP.Request.RawHeaders.Values['User-Agent']:= Value;
end;

{ TTMDBService }

constructor TTMDBService.Create(AOwner: TTMDBClient);
begin
  FOwner:= AOwner;
end;

destructor TTMDBService.Destroy;
begin

  inherited;
end;

{ TTMDBCertifications }

function TTMDBCertifications.GetMovieCertifications: ISuperObject;
begin

end;

function TTMDBCertifications.GetTVCertifications: ISuperObject;
begin

end;

{ TTMDBConfiguration }

function TTMDBConfiguration.GetDetails: ISuperObject;
begin
  Result:= FOwner.GetJSON('configuration');
end;

function TTMDBConfiguration.GetCountries: ISuperArray;
begin

end;

function TTMDBConfiguration.GetJobs: ISuperArray;
begin

end;

function TTMDBConfiguration.GetLanguages: ISuperArray;
begin

end;

function TTMDBConfiguration.GetPrimaryTranslations: ISuperArray;
begin

end;

function TTMDBConfiguration.GetTimeZones: ISuperArray;
begin

end;

{ TTMDBGenres }

function TTMDBGenres.GetMovieList(const Language: String): ISuperArray;
begin

end;

function TTMDBGenres.GetTVList(const Language: String): ISuperArray;
begin

end;

{ TTMDBMovies }

function TTMDBMovies.GetAlternativeTitles(const MovieID: Integer;
  const Country: String): ISuperArray;
begin

end;

function TTMDBMovies.GetDetails(const MovieID: Integer; const AppendToResponse,
  Language: String): ISuperObject;
begin

end;

function TTMDBMovies.GetExternalIDs(const MovieID: Integer): ISuperObject;
begin

end;

function TTMDBMovies.GetImages(const MovieID: Integer;
  const IncludeImageLanguage, Language: String): ISuperObject;
begin

end;

function TTMDBMovies.GetKeywords(const MovieID: Integer): ISuperArray;
begin

end;

function TTMDBMovies.GetReleaseDates(const MovieID: Integer): ISuperArray;
begin

end;

function TTMDBMovies.GetTranslations(const MovieID: Integer): ISuperArray;
begin

end;

function TTMDBMovies.GetVideos(const MovieID: Integer;
  const Language: String): ISuperArray;
begin

end;

function TTMDBMovies.GetWatchProviders(const MovieID: Integer): ISuperObject;
begin

end;

{ TTMDBNetworks }

function TTMDBNetworks.GetAlternativeNames(
  const NetworkID: Integer): ISuperArray;
begin

end;

function TTMDBNetworks.GetDetails(const NetworkID: Integer): ISuperObject;
begin

end;

function TTMDBNetworks.GetImages(const NetworkID: Integer): ISuperArray;
begin

end;

{ TTMDBPeople }

function TTMDBPeople.GetDetails(const PersonID: Integer; const AppendToResponse,
  Language: String): ISuperObject;
begin

end;

function TTMDBPeople.GetImages(const PersonID: Integer): ISuperArray;
begin

end;

function TTMDBPeople.GetMovieCredits(const PersonID: Integer;
  const Language: String): ISuperArray;
begin

end;

function TTMDBPeople.GetTVCredits(const PersonID: Integer;
  const Language: String): ISuperArray;
begin

end;

{ TTMDBSearch }

function TTMDBSearch.SearchCollections(const Query: String;
  const IncludeAdult: Boolean; const Language: String; const Page: Integer;
  const Region: String): ISuperObject;
begin

end;

function TTMDBSearch.SearchCompanies(const Query: String;
  const Page: Integer): ISuperObject;
begin

end;

function TTMDBSearch.SearchKeywords(const Query: String;
  const Page: Integer): ISuperObject;
begin

end;

function TTMDBSearch.SearchMovies(const Query: String;
  const IncludeAdult: Boolean; const Language, PrimaryReleaseYear: String;
  const Page: Integer; const Region, Year: String): ISuperObject;
begin

end;

function TTMDBSearch.SearchMulti(const Query: String;
  const IncludeAdult: Boolean; const Language: String;
  const Page: Integer): ISuperObject;
begin

end;

function TTMDBSearch.SearchPerson(const Query: String;
  const IncludeAdult: Boolean; const Language: String;
  const Page: Integer): ISuperObject;
begin

end;

function TTMDBSearch.SearchTV(const Query, FirstAirDateYear: String;
  const IncludeAdult: Boolean; const Language: String; const Page: Integer;
  const Year: String): ISuperObject;
begin

end;

{ TTMDBTVSeries }

function TTMDBTVSeries.GetAlternativeTitles(
  const SeriesID: Integer): ISuperArray;
begin

end;

function TTMDBTVSeries.GetContentRatings(const SeriesID: Integer): ISuperArray;
begin

end;

function TTMDBTVSeries.GetDetails(const SeriesID: Integer;
  const AppendToResponse, Language: String): ISuperObject;
begin

end;

function TTMDBTVSeries.GetEpisodeGroups(const SeriesID: Integer): ISuperArray;
begin

end;

function TTMDBTVSeries.GetExternalIDs(const SeriesID: Integer): ISuperObject;
begin

end;

function TTMDBTVSeries.GetImages(const SeriesID: Integer;
  const IncludeImageLanguage, Language: String): ISuperArray;
begin

end;

function TTMDBTVSeries.GetKeywords(const SeriesID: Integer): ISuperArray;
begin

end;

function TTMDBTVSeries.GetTranslations(const SeriesID: Integer): ISuperArray;
begin

end;

function TTMDBTVSeries.GetVideos(const SeriesID: Integer;
  const IncludeVideoLanguage, Language: String): ISuperArray;
begin

end;

function TTMDBTVSeries.GetWatchProviders(const SeriesID: Integer): ISuperObject;
begin

end;

{ TTMDBTVSeasons }

function TTMDBTVSeasons.GetDetails(const SeriesID, SeasonNumber: Integer;
  const AppendToResponse, Language: String): ISuperObject;
begin

end;

function TTMDBTVSeasons.GetExternalIDs(const SeriesID,
  SeasonNumber: Integer): ISuperObject;
begin

end;

function TTMDBTVSeasons.GetImages(const SeriesID, SeasonNumber: Integer;
  const IncludeImageLanguage, Language: String): ISuperObject;
begin

end;

function TTMDBTVSeasons.GetTranslations(const SeriesID,
  SeasonNumber: Integer): ISuperObject;
begin

end;

function TTMDBTVSeasons.GetVideos(const SeriesID, SeasonNumber: Integer;
  const IncludeVideoLanguage, Language: String): ISuperObject;
begin

end;

function TTMDBTVSeasons.GetWatchProviders(const SeriesID, SeasonNumber: Integer;
  const Language: String): ISuperObject;
begin

end;

{ TTMDBTVEpisodes }

function TTMDBTVEpisodes.GetDetails(const SeriesID, SeasonNumber,
  EpisodeNumber: Integer; const AppendToResponse,
  Language: String): ISuperObject;
begin

end;

function TTMDBTVEpisodes.GetExternalIDs(const SeriesID, SeasonNumber,
  EpisodeNumber: Integer): ISuperObject;
begin

end;

function TTMDBTVEpisodes.GetImages(const SeriesID, SeasonNumber,
  EpisodeNumber: Integer; const IncludeImageLanguage,
  Language: String): ISuperArray;
begin

end;

function TTMDBTVEpisodes.GetTranslations(const SeriesID, SeasonNumber,
  EpisodeNumber: Integer): ISuperArray;
begin

end;

function TTMDBTVEpisodes.GetVideos(const SeriesID, SeasonNumber,
  EpisodeNumber: Integer; const IncludeVideoLanguage,
  Language: String): ISuperArray;
begin

end;

{ TTMDBWatchProviders }

function TTMDBWatchProviders.GetAvailableRegions(
  const Language: String): ISuperArray;
begin

end;

function TTMDBWatchProviders.GetMovieProviders(const Language,
  WatchRegion: String): ISuperArray;
begin

end;

function TTMDBWatchProviders.GetTVProviders(const Language,
  WatchRegion: String): ISuperArray;
begin

end;

{ TTMDBCredits }

function TTMDBCredits.GetDetails(const CreditID: Integer): ISuperObject;
begin

end;

{ TTMDBTVEpisodeGroups }

function TTMDBTVEpisodeGroups.GetEpisodeGroups(
  const TVEpisodeGroupID: String): ISuperObject;
begin

end;

end.
