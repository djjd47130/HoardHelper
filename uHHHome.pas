unit uHHHome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uHHEmbedBase, Vcl.ExtCtrls, JD.Common, JD.Ctrls, JD.Ctrls.Gauges, Vcl.StdCtrls,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart,
  JD.Graphics;

type
  TfrmHHHome = class(TfrmHHEmbedBase)
    pStatBar: TPanel;
    pIndexInfo: TPanel;
    Label1: TLabel;
    JDGauge2: TJDGauge;
    pMigrationInfo: TPanel;
    Label2: TLabel;
    JDGauge1: TJDGauge;
    Label3: TLabel;
    Label4: TLabel;
    Panel12: TPanel;
    Panel1: TPanel;
    chLibSizeComp: TChart;
    Series1: TPieSeries;
    procedure pStatBarResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHHHome: TfrmHHHome;

implementation

{$R *.dfm}

procedure TfrmHHHome.FormCreate(Sender: TObject);
begin
  inherited;
  chLibSizeComp.Color:= ColorManager.BaseColor;
end;

procedure TfrmHHHome.pStatBarResize(Sender: TObject);
var
  P: TPanel;
  X: Integer;
  C: TControl;
  W: Integer;
begin
  inherited;
  P:= TPanel(Sender);
  W:= P.ClientWidth div P.ControlCount;
  for X := 0 to P.ControlCount-1 do begin
    C:= P.Controls[X];
    C.Width:= W;
  end;
end;

end.
