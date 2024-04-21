program JDHoardHelper;

uses
  Vcl.Forms,
  uHHScript in 'uHHScript.pas' {frmScript},
  uHHContext in 'uHHContext.pas' {HHContext: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  JD.HoardHelper in 'JD.HoardHelper.pas',
  uHoardHelperLibs in 'uHoardHelperLibs.pas' {frmLibs},
  JD.CmdLine in 'JD.CmdLine.pas',
  uHoardHelperFind in 'uHoardHelperFind.pas' {frmFind},
  XSuperObject in 'XSuperObject.pas',
  JD.HoardHelper.Indexer in 'JD.HoardHelper.Indexer.pas',
  uHHMainNEW in 'uHHMainNEW.pas' {frmHHMain},
  uHHEmbedBase in 'uHHEmbedBase.pas' {frmHHEmbedBase},
  uHHMedia in 'uHHMedia.pas' {frmHHMedia},
  uHHHome in 'uHHHome.pas' {frmHHHome},
  uHHSettings in 'uHHSettings.pas' {frmHHSettings},
  uHHDupeFinder in 'uHHDupeFinder.pas' {frmHHDupeFinder},
  uHHAbout in 'uHHAbout.pas' {frmHHAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.Title := 'JD Hoard Helper';
  Application.CreateForm(TfrmHHMain, frmHHMain);
  Application.Run;
end.
