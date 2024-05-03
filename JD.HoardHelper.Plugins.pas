unit JD.HoardHelper.Plugins;

interface

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes,
  JD.HoardHelper.Plugins.Intf,
  JD.Graphics;

type
  THHPlugin = class(TInterfacedObject, IHHPlugin)
  public
    function InitializePlugin: Integer; virtual; stdcall;
    function UninitializePlugin: Integer; virtual; stdcall;

    function GetPluginName: WideString; virtual; stdcall;
    function GetPluginID: WideString; virtual; stdcall;
    function GetPluginVendor: WideString; virtual; stdcall;
    function GetPluginVersion: WideString; virtual; stdcall;
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

end;

function THHPlugin.GetPluginName: WideString;
begin

end;

function THHPlugin.GetPluginVendor: WideString;
begin

end;

function THHPlugin.GetPluginVersion: WideString;
begin

end;

end.
