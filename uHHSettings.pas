unit uHHSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHHEmbedBase, JD.Ctrls.PageMenu, JD.Graphics,
  Vcl.Themes, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, JD.Common, JD.Ctrls,
  JD.Ctrls.FontButton, Vcl.StdCtrls, RzShellDialogs, Vcl.Menus,
  uHHLibraries;

type
  TfrmHHSettings = class(TfrmHHEmbedBase)
    Pages: TPageControl;
    tabGeneral: TTabSheet;
    tabLibraries: TTabSheet;
    tabIndexing: TTabSheet;
    tabBackups: TTabSheet;
    tabScripting: TTabSheet;
    sbIndexing: TScrollBox;
    pEnableIndexing: TPanel;
    swEnableIndexing: TToggleSwitch;
    ScrollBox1: TScrollBox;
    pSyntaxHighlighting: TPanel;
    swSyntaxHighlighting: TToggleSwitch;
    pWordWrap: TPanel;
    swWordWrap: TToggleSwitch;
    ScrollBox2: TScrollBox;
    pAutoBackupsEnabled: TPanel;
    swAutoBackupsEnabled: TToggleSwitch;
    Panel2: TPanel;
    txtBackupDir: TEdit;
    btnSelectDir: TJDFontButton;
    Panel3: TPanel;
    ComboBox1: TComboBox;
    ScrollBox3: TScrollBox;
    Panel5: TPanel;
    ComboBox2: TComboBox;
    tabFilters: TTabSheet;
    dlgOpenDir: TFileOpenDialog;
    Panel1: TPanel;
    Label1: TLabel;
    Toolbar: TPanel;
    btnNewLib: TJDFontButton;
    btnEditLib: TJDFontButton;
    btnSaveLib: TJDFontButton;
    btnCancelLib: TJDFontButton;
    btnDeleteLib: TJDFontButton;
    lstFilters: TListView;
    pMenu: TPanel;
    JDFontButton1: TJDFontButton;
    JDFontButton2: TJDFontButton;
    JDFontButton3: TJDFontButton;
    JDFontButton4: TJDFontButton;
    JDFontButton5: TJDFontButton;
    JDFontButton6: TJDFontButton;
    btnPurgeBackups: TJDFontButton;
    tabMigration: TTabSheet;
    JDFontButton7: TJDFontButton;
    ScrollBox4: TScrollBox;
    pEnableMigration: TPanel;
    swEnableMigration: TToggleSwitch;
    Panel6: TPanel;
    ComboBox3: TComboBox;
    Panel4: TPanel;
    Edit1: TEdit;
    JDFontButton8: TJDFontButton;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure pEnableIndexingClick(Sender: TObject);
    procedure pSyntaxHighlightingClick(Sender: TObject);
    procedure pWordWrapClick(Sender: TObject);
    procedure btnSelectDirClick(Sender: TObject);
    procedure pAutoBackupsEnabledClick(Sender: TObject);
    procedure TabButtonClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure swWordWrapClick(Sender: TObject);
    procedure pEnableMigrationClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FLibs: TfrmLibs;
  public
    procedure ShowTab(const Index: Integer);
    procedure ShowSettings;
  end;

var
  frmHHSettings: TfrmHHSettings;

function ToggleSwitch(ASwitch: TToggleSwitch): Boolean;
function GetSwitch(ASwitch: TToggleSwitch): Boolean;
procedure SetSwitch(ASwitch: TToggleSwitch; ASwitched: Boolean);

implementation

{$R *.dfm}

uses
  uHHMain;

{ General }

function ToggleSwitch(ASwitch: TToggleSwitch): Boolean;
begin
  case ASwitch.State of
    tssOff: ASwitch.State:= tssOn;
    tssOn:  ASwitch.State:= tssOff;
  end;
  Result:= ASwitch.State = tssOn;
end;

function GetSwitch(ASwitch: TToggleSwitch): Boolean;
begin
  Result:= ASwitch.IsOn;
end;

procedure SetSwitch(ASwitch: TToggleSwitch; ASwitched: Boolean);
begin
  if ASwitched then
    ASwitch.State:= tssOn
  else
    ASwitch.State:= tssOff;
end;

{ TfrmHHSettings }

procedure TfrmHHSettings.FormCreate(Sender: TObject);
var
  X: Integer;
begin
  inherited;

  FLibs:= TfrmLibs.Create(tabLibraries);
  FLibs.Parent:= tabLibraries;
  FLibs.BorderStyle:= bsNone;
  FLibs.Align:= alClient;
  FLibs.Show;

  Pages.Align:= alClient;
  sbIndexing.Align:= alClient;
  for X := 0 to Pages.PageCount-1 do
    Pages.Pages[X].TabVisible:= False;
  ShowTab(0);

  btnPurgeBackups.Font.Color:= ColorManager.Color[fcRed];

end;

procedure TfrmHHSettings.FormShow(Sender: TObject);
begin
  inherited;
  FLibs.Load;
end;

procedure TfrmHHSettings.ShowSettings;
begin
  SetSwitch(swWordWrap, frmHHMain.Script.txtScript.WordWrap);

end;

procedure TfrmHHSettings.btnSelectDirClick(Sender: TObject);
begin
  inherited;
  dlgOpenDir.FileName:= txtBackupDir.Text;
  if dlgOpenDir.Execute then begin
    txtBackupDir.Text:= dlgOpenDir.FileName;
  end;
end;

procedure TfrmHHSettings.Panel1Click(Sender: TObject);
begin
  inherited;
  //TODO: Show details of backup data...

end;

procedure TfrmHHSettings.TabButtonClick(Sender: TObject);
var
  B: TJDFontButton;
begin
  inherited;
  B:= TJDFontButton(Sender);
  Self.ShowTab(B.Tag);
end;

procedure TfrmHHSettings.pAutoBackupsEnabledClick(Sender: TObject);
begin
  inherited;
  ToggleSwitch(swAutoBackupsEnabled);

end;

procedure TfrmHHSettings.pEnableIndexingClick(Sender: TObject);
begin
  inherited;
  ToggleSwitch(swEnableIndexing);

end;

procedure TfrmHHSettings.pEnableMigrationClick(Sender: TObject);
begin
  inherited;
  ToggleSwitch(swEnableMigration);

end;

procedure TfrmHHSettings.pSyntaxHighlightingClick(Sender: TObject);
begin
  inherited;
  ToggleSwitch(swSyntaxHighlighting);

end;

procedure TfrmHHSettings.pWordWrapClick(Sender: TObject);
begin
  inherited;
  ToggleSwitch(swWordWrap);

end;

procedure TfrmHHSettings.ShowTab(const Index: Integer);
var
  X: Integer;
  B: TJDFontButton;
begin
  Pages.ActivePageIndex:= Index;
  for X := 0 to pMenu.ControlCount-1 do begin
    if pMenu.Controls[X] is TJDFontButton then begin
      B:= TJDFontButton(pMenu.Controls[X]);
      if B.Tag = Index then begin
        B.Image.StandardColor:= fcOrange;
        B.Font.Color:= ColorManager.Color[fcOrange];
        //B.DrawStyle:= fdThemed;
        Caption:= 'Settings - '+B.Text;
      end else begin
        B.Image.StandardColor:= fcBlue; // fcGreen;
        B.Font.Color:= clWindowText;
        //B.DrawStyle:= fdTransparent;
      end;
    end;
  end;
end;

procedure TfrmHHSettings.swWordWrapClick(Sender: TObject);
begin
  inherited;
  frmHHMain.Script.txtScript.WordWrap:= GetSwitch(swWordWrap);
end;

end.
