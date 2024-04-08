unit uHoardHelperLibs;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.WinXCtrls, JD.Common, JD.Ctrls, JD.Ctrls.FontButton,
  JD.HoardHelper, System.Actions, Vcl.ActnList, RzShellDialogs;

type
  TfrmLibs = class(TForm)
    Panel1: TPanel;
    btnDone: TJDFontButton;
    pMain: TPanel;
    Label1: TLabel;
    Toolbar: TPanel;
    btnNewLib: TJDFontButton;
    btnEditLib: TJDFontButton;
    btnSaveLib: TJDFontButton;
    btnCancelLib: TJDFontButton;
    btnDeleteLib: TJDFontButton;
    lstLibraries: TListView;
    Acts: TActionList;
    actNew: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actSave: TAction;
    actCancel: TAction;
    Panel2: TPanel;
    txtName: TEdit;
    txtDir: TEdit;
    cboType: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnSelectDir: TJDFontButton;
    dlgSelectDir: TRzSelectFolderDialog;
    lblEditing: TLabel;
    actDone: TAction;
    procedure FormCreate(Sender: TObject);
    procedure btnSelectDirClick(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure lstLibrariesSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure actCancelExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actDoneExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FEditing: Boolean;
    FIsNew: Boolean;
    procedure UpdateActions; reintroduce;
    function HasDuplicateName(const N: String; Skip: THHLibrary = nil): Boolean;
    function HasDuplicateDir(const N: String; Skip: THHLibrary = nil): Boolean;
  public
    procedure Load;
  end;

var
  frmLibs: TfrmLibs;

implementation

{$R *.dfm}

procedure TfrmLibs.FormCreate(Sender: TObject);
begin
  pMain.Align:= alClient;
  lstLibraries.Align:= alClient;

  UpdateActions;
end;

procedure TfrmLibs.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FEditing then begin
    CanClose:= False;
    MessageDlg('Please save or cancel your changes first.', mtError, [mbOK], 0);
  end else begin
    CanClose:= True;
  end;
end;

procedure TfrmLibs.actCancelExecute(Sender: TObject);
var
  I: Integer;
begin
  FEditing:= False;
  I:= lstLibraries.ItemIndex;
  if I >= 0 then begin
    //Force refresh...
    lstLibraries.ItemIndex:= -1;
    lstLibraries.ItemIndex:= I;
  end;
  UpdateActions;
end;

procedure TfrmLibs.actDeleteExecute(Sender: TObject);
var
  L: THHLibrary;
begin
  if lstLibraries.Selected = nil then Exit;
  L:= THHLibrary(lstLibraries.Selected.Data);
  if MessageDlg('Are you sure you wish to delete selected library "'+L.Name+'"?',
    mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    HH.DeleteLibrary(lstLibraries.Selected.Index);
    HH.SaveSettings;
    Load;
  end;
  UpdateActions;
end;

procedure TfrmLibs.actDoneExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmLibs.actEditExecute(Sender: TObject);
begin
  FEditing:= True;
  FIsNew:= False;

  UpdateActions;
end;

procedure TfrmLibs.actNewExecute(Sender: TObject);
begin
  FEditing:= True;
  FIsNew:= True;
  txtName.Text:= '';
  cboType.ItemIndex:= -1;
  txtDir.Text:= '';
  UpdateActions;
end;

function TfrmLibs.HasDuplicateName(const N: String; Skip: THHLibrary = nil): Boolean;
var
  X: Integer;
  L: THHLibrary;
begin
  Result:= False;
  for X := 0 to HH.LibraryCount-1 do begin
    L:= HH.Libraries[X];
    if L <> Skip then begin
      if SameText(N, L.Name) then begin
        Result:= True;
        Break;
      end;
    end;
  end;
end;

function TfrmLibs.HasDuplicateDir(const N: String; Skip: THHLibrary): Boolean;
var
  X: Integer;
  L: THHLibrary;
begin
  Result:= False;
  for X := 0 to HH.LibraryCount-1 do begin
    L:= HH.Libraries[X];
    if L <> Skip then begin
      if SameText(N, L.Location) then begin
        //TODO: Also detect if one is INSIDE of the other...
        Result:= True;
        Break;
      end;
    end;
  end;
end;

procedure TfrmLibs.actSaveExecute(Sender: TObject);
var
  L: THHLibrary;
begin
  txtName.Text:= Trim(txtName.Text);

  if txtName.Text = '' then
    raise Exception.Create('Please enter a unique name for the library');

  if not FIsNew then
    L:= THHLibrary(lstLibraries.Selected.Data)
  else
    L:= nil;
  if HasDuplicateName(txtName.Text, L) then
    raise Exception.Create('Cannot create duplicate library name "'+txtName.Text+'"');
  if HasDuplicateDir(txtDir.Text, L) then
    raise Exception.Create('Cannot create library with duplicate path "'+txtDir.Text+'"');

  if not DirectoryExists(txtDir.Text) then
    raise Exception.Create('Invalid directory "'+txtDir.Text+'"');

  if cboType.ItemIndex = -1 then
    raise Exception.Create('Please select a library type');

  //TODO: Illegal chars in name...


  if FIsNew then begin
    L:= THHLibrary.Create;
    HH.AddLibrary(L);
  end;
  L.Name:= txtName.Text;
  L.LibraryType:= StrToLibType(cboType.Text);
  L.Location:= txtDir.Text;
  HH.SaveSettings;
  FEditing:= False;
  FIsNew:= False;
  Load;
  UpdateActions;
end;

procedure TfrmLibs.btnSelectDirClick(Sender: TObject);
begin
  dlgSelectDir.SelectedPathName:= txtDir.Text;
  if dlgSelectDir.Execute then begin
    txtDir.Text:= dlgSelectDir.SelectedPathName;
  end;
end;

procedure TfrmLibs.Load;
var
  X: Integer;
  L: THHLibrary;
  I: TListItem;
begin
  //Load libraries into list...
  lstLibraries.Items.Clear;
  for X := 0 to HH.LibraryCount-1 do begin
    L:= HH.Libraries[X];
    I:= lstLibraries.Items.Add;
    I.Caption:= L.Name;
    I.SubItems.Add(LibTypeToStr(L.LibraryType));
    I.SubItems.Add(L.Location);
    I.Data:= L;
  end;
  lstLibraries.ItemIndex:= -1;
  Self.lstLibrariesSelectItem(nil, nil, False);
  UpdateActions;
end;

procedure TfrmLibs.lstLibrariesSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  L: THHLibrary;
begin
  txtName.Text:= '';
  cboType.ItemIndex:= -1;
  txtDir.Text:= '';
  if Selected then begin
    L:= THHLibrary(Item.Data);
    txtName.Text:= L.Name;
    cboType.ItemIndex:= cboType.Items.IndexOf(LibTypeToStr(L.LibraryType));
    txtDir.Text:= L.Location;
  end;
  UpdateActions;
end;

procedure TfrmLibs.UpdateActions;
var
  X: Integer;
begin
  lstLibraries.Enabled:= (not FEditing);
  actNew.Enabled:= (not FEditing);
  actEdit.Enabled:= (not FEditing) and (lstLibraries.Selected <> nil);
  actDelete.Enabled:= (not FEditing) and (lstLibraries.Selected <> nil);
  actSave.Enabled:= FEditing;
  actCancel.Enabled:= FEditing;
  actDone.Enabled:= not FEditing;

  txtName.ReadOnly:= (not FEditing);
  cboType.Enabled:= FEditing;
  txtDir.ReadOnly:= (not FEditing);
  btnSelectDir.Enabled:= FEditing;

  if FEditing and FIsNew then begin
    lblEditing.Caption:= 'New Library';
    lblEditing.Font.Color:= clYellow;
  end else
  if FEditing and (not FIsNew) then begin
    lblEditing.Caption:= 'Edit Library';
    lblEditing.Font.Color:= clYellow;
  end else begin
    lblEditing.Caption:= 'View Library';
    lblEditing.Font.Color:= clLime;
  end;

  for X := 0 to Toolbar.ControlCount-1 do begin
    Toolbar.Controls[X].Invalidate;
  end;
  btnSelectDir.Invalidate;

end;

end.
