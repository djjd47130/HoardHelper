unit uHoardHelperSvcMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs;

type
  THoardHelperSvc = class(TService)
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  HoardHelperSvc: THoardHelperSvc;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  HoardHelperSvc.Controller(CtrlCode);
end;

function THoardHelperSvc.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

end.
