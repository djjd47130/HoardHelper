unit JD.HoardHelper.Plugins.Intf;

interface

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes,
  JD.Graphics;

type
  //Integration with a single glyph icon
  IHHGlyph = interface
    ['{6616AB00-FFB5-44C3-9F93-54DBB69AC20E}']
    function GetChar: WideString; stdcall;
    procedure SetChar(const Value: WideString); stdcall;
    function GetFontName: WideString; stdcall;
    procedure SetFontName(const Value: WideString); stdcall;
    function GetFontSize: Integer; stdcall;
    procedure SetFontSize(const Value: Integer); stdcall;
    function GetColor: TColor; stdcall;
    procedure SetColor(const Value: TColor); stdcall;
    function GetStandardColor: TJDStandardColor; stdcall;
    procedure SetStandardColor(const Value: TJDStandardColor); stdcall;
    function GetUseStandardColor: Boolean; stdcall;
    procedure SetUseStandardColor(const Value: Boolean); stdcall;

  end;

  //Integration with app left menu
  IHHPluginLeftMenuItem = interface
    ['{230AA0D6-9256-466C-B522-0DE21CAFCCED}']
    function GetCaption: WideString; stdcall;
    procedure SetCaption(const Value: WideString); stdcall;
    function GetGlyph: IHHGlyph; stdcall;
    procedure SetGlyph(const Value: IHHGlyph); stdcall;

    property Ception: WideString read GetCaption write SetCaption;
    property Glyph: IHHGlyph read GetGlyph write SetGlyph;
  end;

  //Integration with app main menu
  IHHPluginMainMenuItem = interface
    ['{DF7FFDF0-49B1-449C-B709-453A59A5C85D}']
    function GetCaption: WideString; stdcall;
    procedure SetCaption(const Value: WideString); stdcall;
    function GetParent: IHHPluginMainMenuItem; stdcall;
    procedure SetParent(const Value: IHHPluginMainMenuItem); stdcall;
    function GetIndex: Integer; stdcall;

    property Ception: WideString read GetCaption write SetCaption;
    property Parent: IHHPluginMainMenuItem read GetParent write SetParent;
    property Index: Integer read GetIndex;
  end;

  //Integration with service - allows devs to run a background thread
  IHHPluginServiceThread = interface
    ['{31F26FD9-F9F9-4ACC-94AA-FE8C1750D1CE}']
    procedure Execute; stdcall;
  end;



  //Integration entry point
  IHHPlugin = interface
    ['{1D5AB004-8EBB-481A-A156-DDA2413BA20C}']
    function InitializePlugin: Integer; stdcall;
    function UninitializePlugin: Integer; stdcall;

    function GetPluginName: WideString; stdcall;
    function GetPluginID: WideString; stdcall;
    function GetPluginVendor: WideString; stdcall;
    function GetPluginVersion: WideString; stdcall;



    procedure RegisterLeftMenuItem(AItem: IHHPluginLeftMenuItem); stdcall;
    procedure UnregisterLeftMenuItem(AItem: IHHPluginLeftMenuItem); stdcall;

    procedure RegisterMainMenuItem(AItem: IHHPluginMainMenuItem); stdcall;
    procedure UnRegisterMainMenuItem(AItem: IHHPluginMainMenuItem); stdcall;
  end;





{
TODO:
- Central plugin interface - IHHPlugin
- Integration with application left menu
- Integration with application main menu
- Integration with Indexing services
  - Metadata via Plex, TMDB, Last.FM, etc.


}

implementation

end.
