program JDHoardHelper;

uses
  Vcl.Forms,
  uHoardHelperMain in 'uHoardHelperMain.pas' {frmHoardHelperMain},
  uHHContext in 'uHHContext.pas' {HHContext: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  JD.HoardHelper in 'JD.HoardHelper.pas',
  uHoardHelperLibs in 'uHoardHelperLibs.pas' {frmLibs};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'JD Hoard Helper';
  TStyleManager.TrySetStyle('Charcoal Dark Slate');
  Application.CreateForm(TfrmHoardHelperMain, frmHoardHelperMain);
  Application.Run;
end.
