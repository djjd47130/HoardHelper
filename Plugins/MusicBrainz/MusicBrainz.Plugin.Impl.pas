unit MusicBrainz.Plugin.Impl;

interface

uses
  System.Classes, System.SysUtils, System.Types, System.Generics.Collections,
  JD.HoardHelper.Plugins.Intf;

type
  THHPlugin = class(TInterfacedObject, IHHPlugin)
  public
    function InitializePlugin: Integer; virtual; stdcall;
    function UninitializePlugin: Integer; virtual; stdcall;

    function GetPluginName: WideString; virtual; stdcall;
    function GetPluginID: WideString; virtual; stdcall;
    function GetPluginVendor: WideString; virtual; stdcall;
    function GetPluginVersion: WideString; virtual; stdcall;

    procedure RegisterLeftMenuItem(AItem: IHHPluginLeftMenuItem); stdcall;
    procedure UnregisterLeftMenuItem(AItem: IHHPluginLeftMenuItem); stdcall;

    procedure RegisterMainMenuItem(AItem: IHHPluginMainMenuItem); stdcall;
    procedure UnRegisterMainMenuItem(AItem: IHHPluginMainMenuItem); stdcall;
  end;


implementation

{ THHPlugin }

function THHPlugin.InitializePlugin: Integer;
begin

end;

function THHPlugin.UninitializePlugin: Integer;
begin

end;

function THHPlugin.GetPluginID: WideString;
begin
  Result:= '{6E24DAEF-623B-412A-9B25-1D673F5A886D}';
end;

function THHPlugin.GetPluginName: WideString;
begin
  Result:= 'MusicBrainz API';
end;

function THHPlugin.GetPluginVendor: WideString;
begin
  Result:= 'Jerry Dodge';
end;

function THHPlugin.GetPluginVersion: WideString;
begin
  Result:= '0.1';
end;

procedure THHPlugin.RegisterLeftMenuItem(AItem: IHHPluginLeftMenuItem);
begin

end;

procedure THHPlugin.RegisterMainMenuItem(AItem: IHHPluginMainMenuItem);
begin

end;

procedure THHPlugin.UnregisterLeftMenuItem(AItem: IHHPluginLeftMenuItem);
begin

end;

procedure THHPlugin.UnRegisterMainMenuItem(AItem: IHHPluginMainMenuItem);
begin

end;

end.
