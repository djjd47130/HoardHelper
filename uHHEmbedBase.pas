unit uHHEmbedBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmHHEmbedBase = class;

  TfrmHHEmbedBaseClass = class of TfrmHHEmbedBase;

  TfrmHHEmbedBase = class(TForm)
  private
    function GetCaption: String;
    procedure SetCaption(const Value: String);
  public
    property Caption: String read GetCaption write SetCaption;
    procedure CloseQuery(var CanClose: Boolean); virtual;
    function MainMenu: TMainMenu; virtual;
  end;

var
  frmHHEmbedBase: TfrmHHEmbedBase;

implementation

{$R *.dfm}

uses
  uHHMainNew;

{ TfrmHHEmbedBase }

procedure TfrmHHEmbedBase.CloseQuery(var CanClose: Boolean);
begin
  CanClose:= True;
end;

function TfrmHHEmbedBase.GetCaption: String;
begin
  Result:= inherited Caption;
end;

function TfrmHHEmbedBase.MainMenu: TMainMenu;
begin
  Result:= nil;
end;

procedure TfrmHHEmbedBase.SetCaption(const Value: String);
begin
  inherited Caption:= Value;
  frmHHMain.UpdateCaption(Value);
end;

end.
