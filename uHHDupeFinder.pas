unit uHHDupeFinder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHHEmbedBase, Vcl.Menus;

type
  TfrmHHDupeFinder = class(TfrmHHEmbedBase)
    MM: TMainMenu;
    DuplicateFinder1: TMenuItem;
    Search1: TMenuItem;
    N1: TMenuItem;
  private
    { Private declarations }
  public
    function MainMenu: TMainMenu; override;
  end;

var
  frmHHDupeFinder: TfrmHHDupeFinder;

implementation

{$R *.dfm}

{ TfrmHHDupeFinder }

function TfrmHHDupeFinder.MainMenu: TMainMenu;
begin
  Result:= MM;
end;

end.
