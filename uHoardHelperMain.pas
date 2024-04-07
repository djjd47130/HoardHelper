unit uHoardHelperMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  SynEdit, SynEditHighlighter, SynEditCodeFolding, SynHighlighterPas, SynHighlighterDWS,
  System.Actions, Vcl.ActnList,
  JD.Common, JD.Ctrls, JD.Ctrls.FontButton,
  Vcl.StdCtrls, Vcl.ExtDlgs, Vcl.Menus,
  JD.HoardHelper,
  uHHContext;

type
  TfrmHoardHelperMain = class(TForm)
    Toolbar: TPanel;
    Stat: TStatusBar;
    pMain: TPanel;
    txtScript: TSynEdit;
    SynDWSSyn1: TSynDWSSyn;
    Acts: TActionList;
    JDFontButton1: TJDFontButton;
    JDFontButton2: TJDFontButton;
    txtOutput: TMemo;
    Splitter1: TSplitter;
    JDFontButton3: TJDFontButton;
    JDFontButton4: TJDFontButton;
    JDFontButton5: TJDFontButton;
    actNew: TAction;
    actOpen: TAction;
    actSave: TAction;
    actSaveAs: TAction;
    actExec: TAction;
    dlgOpen: TOpenTextFileDialog;
    dlgSave: TSaveTextFileDialog;
    Bevel1: TBevel;
    Bevel2: TBevel;
    JDFontButton6: TJDFontButton;
    MM: TMainMenu;
    File1: TMenuItem;
    File2: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    SaveScript1: TMenuItem;
    SaveScript2: TMenuItem;
    Edit1: TMenuItem;
    Script1: TMenuItem;
    Options1: TMenuItem;
    Options2: TMenuItem;
    Undo1: TMenuItem;
    Redo1: TMenuItem;
    Redo2: TMenuItem;
    Cut1: TMenuItem;
    Cut2: TMenuItem;
    Paste1: TMenuItem;
    Paste2: TMenuItem;
    N3: TMenuItem;
    ExecuteScript1: TMenuItem;
    WordWrap1: TMenuItem;
    None1: TMenuItem;
    None2: TMenuItem;
    RightLine1: TMenuItem;
    AutoBackups1: TMenuItem;
    Enabled1: TMenuItem;
    Enabled2: TMenuItem;
    N4: TMenuItem;
    SelectBackupDirectory1: TMenuItem;
    Editor1: TMenuItem;
    SyntaxHighlighting1: TMenuItem;
    OpenRecent1: TMenuItem;
    ManageRecents1: TMenuItem;
    ManageRecents2: TMenuItem;
    ManageLibraries1: TMenuItem;
    N5: TMenuItem;
    Index1: TMenuItem;
    Enabled3: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    JDFontButton7: TJDFontButton;
    actStop: TAction;
    actLibraries: TAction;
    JDFontButton8: TJDFontButton;
    actUndo: TAction;
    actRedo: TAction;
    StopExec1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    actCut: TAction;
    actCopy: TAction;
    actPaste: TAction;
    actDelete: TAction;
    actSelectAll: TAction;
    SelectAll1: TMenuItem;
    actOpenCommon: TAction;
    OpenCommonScript1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actExecExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure txtScriptChange(Sender: TObject);
    procedure txtScriptMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure txtScriptKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure actStopExecute(Sender: TObject);
    procedure actLibrariesExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure actRedoExecute(Sender: TObject);
    procedure actCutExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure actPasteExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actOpenCommonExecute(Sender: TObject);
  private
    FFilename: String;
    FModified: Boolean;
    FExecuting: Boolean;
    procedure PrintLn(Sender: TObject; Context: THHContext;
      const Text: String);
    procedure Started(Sender: TObject);
    procedure Stopped(Sender: TObject);
    function CommonIsLoaded: Boolean;
  public
    function New: Boolean;
    function Load(const Filename: String): Boolean;
    function SaveToFile(const Filename: String): Boolean;
    function Save: Boolean;
    function SaveAs: Boolean;
    procedure UpdateActions; reintroduce;
    property Modified: Boolean read FModified;
  end;

var
  frmHoardHelperMain: TfrmHoardHelperMain;

implementation

{$R *.dfm}

uses
  uHoardHelperLibs;

procedure TfrmHoardHelperMain.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown:= True;
  {$ENDIF}
  pMain.Align:= alClient;
  txtScript.Align:= alClient;
  FFilename:= '';
  FModified:= False;

  HH.OnPrintLn:= PrintLn;
  HH.OnStarted:= Started;
  HH.OnStopped:= Stopped;

  HH.LoadSettings;

  UpdateActions;
end;

procedure TfrmHoardHelperMain.FormDestroy(Sender: TObject);
begin
  HH.SaveSettings;
end;

procedure TfrmHoardHelperMain.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Modified then begin
    case MessageDlg('Would you like to save changes before closing?',
      mtWarning, [mbYes,mbNo,mbCancel], 0) of
      mrYes: begin
        CanClose:= Save;
      end;
      mrNo: begin
        CanClose:= True;
      end;
      else begin
        CanClose:= False;
      end;
    end;
  end else begin
    CanClose:= True;
  end;
end;

procedure TfrmHoardHelperMain.actLibrariesExecute(Sender: TObject);
var
  F: TfrmLibs;
begin
  F:= TfrmLibs.Create(nil);
  try
    F.Load;
    if F.ShowModal = mrOK then begin
      //F.Save;
    end;
  finally
    F.Free;
  end;
end;

procedure TfrmHoardHelperMain.actNewExecute(Sender: TObject);
begin
  New;
end;

function TfrmHoardHelperMain.CommonIsLoaded: Boolean;
begin
  Result:= SameText(HH.CommonFilename, Self.FFilename);
end;

procedure TfrmHoardHelperMain.actOpenCommonExecute(Sender: TObject);
begin
  if Load(HH.CommonFilename) then begin
    PrintLn(nil, nil, 'COMMON script open for editing - cannot be executed.');
  end;
end;

procedure TfrmHoardHelperMain.actOpenExecute(Sender: TObject);
begin
  if dlgOpen.Execute then begin
    Load(dlgOpen.FileName);
  end;
end;

procedure TfrmHoardHelperMain.actPasteExecute(Sender: TObject);
begin
  txtScript.PasteFromClipboard;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actRedoExecute(Sender: TObject);
begin
  Self.txtScript.Redo;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actSaveAsExecute(Sender: TObject);
begin
  SaveAs;
end;

procedure TfrmHoardHelperMain.actSaveExecute(Sender: TObject);
begin
  Save;
end;

procedure TfrmHoardHelperMain.actSelectAllExecute(Sender: TObject);
begin
  txtScript.SelectAll;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actStopExecute(Sender: TObject);
begin
  //TODO: Stop executing script (in thread)...

end;

procedure TfrmHoardHelperMain.actUndoExecute(Sender: TObject);
begin
  Self.txtScript.Undo;
  UpdateActions;
end;

function TfrmHoardHelperMain.Load(const Filename: String): Boolean;
begin
  if FModified then begin
    case MessageDlg('Save changes to current script?', mtConfirmation, [mbYes,mbNo,mbCancel], 0) of
      mrYes: begin
        Result:= Save;
      end;
      mrNo: begin
        Result:= True;
      end;
      else begin
        Result:= False;
      end;
    end;
  end else begin
    Result:= True;
  end;
  if Result then begin
    //Open script from file...
    FFilename:= Filename;
    txtScript.Lines.LoadFromFile(FFilename);
    txtOutput.Lines.Clear;
    FModified:= False;
    txtScript.UndoList.Clear;
    txtScript.SetFocus;
  end;
  UpdateActions;
end;

function TfrmHoardHelperMain.New: Boolean;
begin
  if FModified then begin
    case MessageDlg('Save changes to current script?', mtConfirmation, [mbYes,mbNo,mbCancel], 0) of
      mrYes: begin
        Result:= Save;
      end;
      mrNo: begin
        Result:= True;
      end;
      else begin
        Result:= False;
      end;
    end;
  end else begin
    Result:= True;
  end;
  if Result then begin
    //Prepare new blank script...
    txtScript.Lines.Clear;
    txtOutput.Lines.Clear;
    FFilename:= '';
    FModified:= False;
    txtScript.UndoList.Clear;
    txtScript.SetFocus;
  end;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.PrintLn(Sender: TObject; Context: THHContext;
  const Text: String);
begin
  txtOutput.Lines.Append(Text);
end;

function TfrmHoardHelperMain.Save: Boolean;
begin
  if FFilename = '' then begin
    Result:= SaveAs;
  end else begin
    Result:= SaveToFile(FFilename);
  end;
end;

function TfrmHoardHelperMain.SaveAs: Boolean;
begin
  Result:= False;
  dlgSave.FileName:= FFilename;
  if dlgSave.Execute then begin
    Result:= SaveToFile(dlgSave.FileName);
  end;
end;

function TfrmHoardHelperMain.SaveToFile(const Filename: String): Boolean;
begin
  txtScript.Lines.SaveToFile(Filename);
  FFilename:= Filename;
  FModified:= False;
  Result:= True;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.Started(Sender: TObject);
begin
  FExecuting:= True;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.Stopped(Sender: TObject);
begin
  FExecuting:= False;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.txtScriptChange(Sender: TObject);
begin
  FModified:= True;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.txtScriptKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  UpdateActions;
end;

procedure TfrmHoardHelperMain.txtScriptMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UpdateActions;
end;

procedure TfrmHoardHelperMain.UpdateActions;
var
  X: Integer;
begin

  //TODO: Handle FExecuting...

  txtScript.Enabled:= (not FExecuting);

  actNew.Enabled:= (not FExecuting);
  actOpen.Enabled:= (not FExecuting);
  actSave.Enabled:= FModified and (not FExecuting);
  actSaveAs.Enabled:= (not FExecuting);
  actExec.Enabled:= (not FExecuting) and (not CommonIsLoaded);
  actStop.Enabled:= FExecuting;

  actUndo.Enabled:= txtScript.CanUndo and (not FExecuting);
  actRedo.Enabled:= txtScript.CanRedo and (not FExecuting);
  actCut.Enabled:= txtScript.SelAvail and (not FExecuting);
  actCopy.Enabled:= txtScript.SelAvail and (not FExecuting);
  actPaste.Enabled:= txtScript.CanPaste and (not FExecuting);
  actDelete.Enabled:= txtScript.SelAvail and (not FExecuting);
  actSelectAll.Enabled:= (not FExecuting);

  Stat.Panels[0].Text:= 'Line '+IntToStr(txtScript.CaretY)+' Col '+IntToStr(txtScript.CaretX);
  if FModified then begin
    Stat.Panels[1].Text:= 'Modified';
  end else begin
    Stat.Panels[1].Text:= '';
  end;
  if FFileName = '' then begin
    Stat.Panels[2].Text:= 'Untitled.hhs';
  end else begin
    Stat.Panels[2].Text:= ExtractFileName(FFilename);
  end;
  Self.Caption:= 'JD Hoard Helper - '+Stat.Panels[2].Text;

  for X := 0 to Toolbar.ControlCount-1 do begin
    TControl(Toolbar.Controls[X]).Invalidate;
  end;
end;

procedure TfrmHoardHelperMain.actCopyExecute(Sender: TObject);
begin
  txtScript.CopyToClipboard;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actCutExecute(Sender: TObject);
begin
  txtScript.CutToClipboard;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actDeleteExecute(Sender: TObject);
begin
  txtScript.SelText:= '';
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actExecExecute(Sender: TObject);
begin
  txtOutput.Lines.Clear;
  HH.Execute(txtScript.Lines.Text);
  UpdateActions;
end;

end.
