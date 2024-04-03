program JDHoardHelper;

uses
  Vcl.Forms,
  uHoardHelperMain in 'uHoardHelperMain.pas' {frmHoardHelperMain},
  uHoardHelperCtrl in 'uHoardHelperCtrl.pas' {dmHoardHelperCtrl: TDataModule},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Charcoal Dark Slate');
  Application.CreateForm(TdmHoardHelperCtrl, dmHoardHelperCtrl);
  Application.CreateForm(TfrmHoardHelperMain, frmHoardHelperMain);
  Application.Run;
end.
