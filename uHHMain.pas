unit uHHMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus,
  System.Actions,
  Vcl.ActnList, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ExtCtrls,
  JD.CmdLine,
  JD.HoardHelper,
  uHHEmbedBase,
  uHHHome,
  uHHMedia,
  uHHLibraries,
  uHHDupeFinder,
  uHHScript,
  uHHSettings,
  uHHAbout,
  JD.Common, JD.Ctrls, JD.Graphics, JD.Ctrls.FontButton;

type
  TfrmHHMain = class(TForm)
    pMain: TPanel;
    pMenu: TPanel;
    btnMenuHome: TJDFontButton;
    btnMenuMedia: TJDFontButton;
    Bevel1: TBevel;
    Acts: TActionList;
    MM: TMainMenu;
    File1: TMenuItem;
    mFileSettings: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Options2: TMenuItem;
    HelpContents1: TMenuItem;
    HelpContents2: TMenuItem;
    AboutJDHoardHelper1: TMenuItem;
    actHelpContents: TAction;
    actAbout: TAction;
    actMenuSettings: TAction;
    actMenuHome: TAction;
    actMenuMedia: TAction;
    actMenuLibs: TAction;
    btnMenuSettings: TJDFontButton;
    btnMenuAbout: TJDFontButton;
    btnMenuScript: TJDFontButton;
    actMenuScript: TAction;
    btnMenuDupeFinder: TJDFontButton;
    actMenuDupeFinder: TAction;
    procedure FormCreate(Sender: TObject);
    procedure btnMenuMediaClick(Sender: TObject);
    procedure actMenuHomeExecute(Sender: TObject);
    procedure actMenuSettingsExecute(Sender: TObject);
    procedure actMenuScriptExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actMenuDupeFinderExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actHelpContentsExecute(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    FScreens: TObjectList<TfrmHHEmbedBase>;
    FCurScreen: TfrmHHEmbedBase;
    FHome: TfrmHHHome;
    FMedia: TfrmHHMedia;
    FDupeFinder: TfrmHHDupeFinder;
    FScript: TfrmScript;
    FSettings: TfrmHHSettings;
    FAbout: TfrmHHAbout;
    function Embed(AClass: TfrmHHEmbedBaseClass): TfrmHHEmbedBase;
    procedure HideAll;
  public
    procedure ShowScreen(Inst: TfrmHHEmbedBase; Btn: TJDFontButton = nil);
    procedure UpdateCaption(S: String);
    property Script: TfrmScript read FScript;
  end;

var
  frmHHMain: TfrmHHMain;

implementation

uses
  Vcl.Themes, Vcl.Styles;

{$R *.dfm}

function TfrmHHMain.Embed(AClass: TfrmHHEmbedBaseClass): TfrmHHEmbedBase;
begin
  Result:= AClass.Create(pMain);
  Result.BorderStyle:= bsNone;
  Result.Parent:= pMain;
  Result.Align:= alClient;
  FScreens.Add(Result);
end;

procedure TfrmHHMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmHHMain.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  //ReportMemoryLeaksOnShutdown:= True;
  //DISABLED TEMPORARILY - The gauge control has a memory leak...
  {$ENDIF}

  //Setup UI
  Width:= 1200;
  Height:= 800;
  ColorManager.BaseColor:= TStyleManager.ActiveStyle.GetStyleColor(TStyleColor.scWindow);
  pMain.Align:= alClient;

  //Load configuration settings
  HH.LoadSettings;

  //Create and embed permanent screens
  FScreens:= TObjectList<TfrmHHEmbedBase>.Create(False);
  FSettings:= TfrmHHSettings(Embed(TfrmHHSettings));
  FHome:= TfrmHHHome(Embed(TfrmHHHome));
  FMedia:= TfrmHHMedia(Embed(TfrmHHMedia));
  FDupeFinder:= TfrmHHDupeFinder(Embed(TfrmHHDupeFinder));
  FScript:= TfrmScript(Embed(TfrmScript));
  FAbout:= TfrmHHAbout(Embed(TfrmHHAbout));

  //Open file from commandline...
  if CmdLine.OpenFilename <> '' then begin
    try
      FScript.Load(CmdLine.OpenFilename);
      Self.actMenuScript.Execute;
    except
      on E: Exception do begin
        MessageDlg('Failed to open file: '+E.Message, mtError, [mbOK], 0);
      end;
    end;
  end else begin
    //Show home screen by default
    ShowScreen(FHome, btnMenuHome);
  end;

end;

procedure TfrmHHMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FScreens);
end;

procedure TfrmHHMain.HideAll;
var
  X: Integer;
begin
  for X := 0 to FScreens.Count-1 do
    FScreens[X].Hide;
  for X := 0 to pMenu.ControlCount-1 do begin
    if pMenu.Controls[X] is TJDFontButton then begin
      TJDFontButton(pMenu.Controls[X]).DrawStyle:= fdTransparent;
      TJDFontButton(pMenu.Controls[X]).Image.StandardColor:= fcBlue;
    end;
  end;

end;

procedure TfrmHHMain.actAboutExecute(Sender: TObject);
begin
  //TODO
  ShowScreen(FAbout, btnMenuAbout);
end;

procedure TfrmHHMain.actHelpContentsExecute(Sender: TObject);
begin
  //TODO
end;

procedure TfrmHHMain.actMenuDupeFinderExecute(Sender: TObject);
begin
  ShowScreen(FDupeFinder, btnMenuDupeFinder);
end;

procedure TfrmHHMain.actMenuHomeExecute(Sender: TObject);
begin
  ShowScreen(FHome, btnMenuHome);
end;

procedure TfrmHHMain.btnMenuMediaClick(Sender: TObject);
begin
  ShowScreen(FMedia, btnMenuMedia);
end;

procedure TfrmHHMain.actMenuScriptExecute(Sender: TObject);
begin
  ShowScreen(FScript, btnMenuScript);
end;

procedure TfrmHHMain.actMenuSettingsExecute(Sender: TObject);
begin
  //TODO: Show settings...
  ShowScreen(FSettings, btnMenuSettings);
end;

procedure TfrmHHMain.ShowScreen(Inst: TfrmHHEmbedBase; Btn: TJDFontButton = nil);
begin
  HideAll;

  if FCurScreen <> nil then
    if FCurScreen.MainMenu <> nil then
      MM.Unmerge(FCurScreen.MainMenu);

  FCurScreen:= Inst;

  if FCurScreen.MainMenu <> nil then
    MM.Merge(FCurScreen.MainMenu);

  Inst.Show;
  UpdateCaption(Inst.Caption);
  if Assigned(Btn) then begin
    //Btn.DrawStyle:= fdThemed;
    Btn.Image.StandardColor:= fcOrange;
  end;
end;

procedure TfrmHHMain.UpdateCaption(S: String);
begin
  Caption:= 'JD Hoard Helper - '+S;
end;

end.
