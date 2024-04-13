unit uHoardHelperFind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JD.Common, JD.Ctrls,
  JD.Ctrls.FontButton, Vcl.ExtCtrls;

type
  TfrmFind = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    btnFind: TJDFontButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFind: TfrmFind;

implementation

{$R *.dfm}

end.
