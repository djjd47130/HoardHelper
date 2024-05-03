library HHMusicBrainz;

uses
  System.SysUtils,
  System.Classes,
  JD.HoardHelper.Plugins.Intf in '..\..\JD.HoardHelper.Plugins.Intf.pas',
  JD.HoardHelper.Plugins in '..\..\JD.HoardHelper.Plugins.pas',
  MusicBrainz.Client in 'MusicBrainz.Client.pas';

{$R *.res}

var
  _Plugin: THHPlugin;

function HHInitializePlugin: IHHPlugin; stdcall;
begin
  _Plugin:= THHPlugin.Create;
  _Plugin.InitializePlugin;
  Result:= _Plugin;
end;

procedure HHUninitializePlugin; stdcall;
begin
  _Plugin.UninitializePlugin;
  FreeAndNil(_Plugin);
end;

exports
  HHInitializePlugin,
  HHUninitializePlugin;


//TODO: Implement integration with MusicBrainz API for looking up music metadata


begin
end.
