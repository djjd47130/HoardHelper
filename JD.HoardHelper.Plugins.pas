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

procedure THHPlugin.RegisterLeftMenuItem(AItem: IHHPluginLeftMenuItem);
begin

end;

procedure THHPlugin.RegisterMainMenuItem(AItem: IHHPluginMainMenuItem);
begin

end;

function THHPlugin.UninitializePlugin: Integer;
begin

end;

procedure THHPlugin.UnregisterLeftMenuItem(AItem: IHHPluginLeftMenuItem);
begin

end;

procedure THHPlugin.UnRegisterMainMenuItem(AItem: IHHPluginMainMenuItem);
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
