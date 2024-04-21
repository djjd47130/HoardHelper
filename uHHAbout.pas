unit uHHAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHHEmbedBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  JD.Common, JD.Ctrls, JD.Ctrls.FontButton;

type
  TfrmHHAbout = class(TfrmHHEmbedBase)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    JDFontButton1: TJDFontButton;
    Label4: TLabel;
    Label5: TLabel;
    procedure Label5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHHAbout: TfrmHHAbout;

implementation

{$R *.dfm}

uses
  uHHMainNEW;

procedure TfrmHHAbout.Label5Click(Sender: TObject);
begin
  inherited;
  //TODO: Navigate to jerryszone.com in default browser...

end;

end.
