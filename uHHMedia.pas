unit uHHMedia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JD.Common, JD.Ctrls,
  JD.Ctrls.FontButton, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  uHHEmbedBase, Vcl.Menus;

type
  TfrmHHMedia = class(TfrmHHEmbedBase)
    pMain: TPanel;
    pSearch: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtSearchText: TEdit;
    txtSearchFilter: TEdit;
    cboSearchLibrary: TComboBox;
    CheckBox1: TCheckBox;
    lstMedia: TListView;
    Toolbar: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    JDFontButton1: TJDFontButton;
    JDFontButton2: TJDFontButton;
    JDFontButton3: TJDFontButton;
    Panel1: TPanel;
    JDFontButton5: TJDFontButton;
    MM: TMainMenu;
    Media1: TMenuItem;
    Media2: TMenuItem;
    AutoCheckItems1: TMenuItem;
    FileType1: TMenuItem;
    MP4Files1: TMenuItem;
    MP4Files2: TMenuItem;
    MKVFiles1: TMenuItem;
    CheckAll1: TMenuItem;
    CheckNone1: TMenuItem;
    N1: TMenuItem;
    CheckedItems1: TMenuItem;
    Move1: TMenuItem;
    Move2: TMenuItem;
    Delete1: TMenuItem;
    oNewLocation1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    UptoParentDirectory1: TMenuItem;
    oLocation1: TMenuItem;
    oLocation2: TMenuItem;
    IntoSubdirectory1: TMenuItem;
    IntoSubdirectory2: TMenuItem;
    MovetoTrash1: TMenuItem;
    MovetoTrash2: TMenuItem;
    CheckBox2: TCheckBox;
    Panel12: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure JDFontButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function MainMenu: TMainMenu; override;
  end;

var
  frmHHMedia: TfrmHHMedia;

implementation

{$R *.dfm}

procedure TfrmHHMedia.FormCreate(Sender: TObject);
begin
  pMain.Align:= alClient;
  lstMedia.Align:= alClient;
end;

procedure TfrmHHMedia.JDFontButton1Click(Sender: TObject);
begin
  pSearch.Visible:= not pSearch.Visible;
end;

function TfrmHHMedia.MainMenu: TMainMenu;
begin
  Result:= MM;
end;

end.
