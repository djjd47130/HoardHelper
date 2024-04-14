program JDHoardHelper;

uses
  Vcl.Forms,
  uHoardHelperMain in 'uHoardHelperMain.pas' {frmHoardHelperMain},
  uHHContext in 'uHHContext.pas' {HHContext: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  JD.HoardHelper in 'JD.HoardHelper.pas',
  uHoardHelperLibs in 'uHoardHelperLibs.pas' {frmLibs},
  JD.CmdLine in 'JD.CmdLine.pas',
  uHoardHelperFind in 'uHoardHelperFind.pas' {frmFind};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.Title := 'JD Hoard Helper';
  Application.CreateForm(TfrmHoardHelperMain, frmHoardHelperMain);
  Application.CreateForm(TfrmFind, frmFind);
  Application.Run;
end.
