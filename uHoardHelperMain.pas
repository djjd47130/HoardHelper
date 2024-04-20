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
  uHHContext,

  JD.CmdLine,

  Vcl.Themes,

  Vcl.Styles.Fixes,
  Vcl.Styles.Utils,

  Vcl.Styles.Hooks,
  Vcl.Styles.Utils.Menus,
  Vcl.Styles.Utils.Forms,
  Vcl.Styles.Utils.StdCtrls,
  Vcl.Styles.Utils.ComCtrls,
  Vcl.Styles.Utils.ScreenTips,
  Vcl.Styles.Utils.SysControls,
  Vcl.Styles.Utils.SysStyleHook,

  SynEditMiscClasses, SynEditSearch,
  SynEditOptionsDialog;

type
  TfrmHoardHelperMain = class(TForm)
    Toolbar: TPanel;
    pMain: TPanel;
    txtScript: TSynEdit;
    DWSSyn: TSynDWSSyn;
    Acts: TActionList;
    JDFontButton1: TJDFontButton;
    JDFontButton2: TJDFontButton;
    Splitter1: TSplitter;
    JDFontButton3: TJDFontButton;
    JDFontButton4: TJDFontButton;
    JDFontButton5: TJDFontButton;
    actNew: TAction;
    actOpen: TAction;
    actSave: TAction;
    actSaveAs: TAction;
    actExec: TAction;
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
    actCheckSyntax: TAction;
    JDFontButton9: TJDFontButton;
    txtOutput: TSynEdit;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    Bevel3: TBevel;
    JDFontButton10: TJDFontButton;
    popScript: TPopupMenu;
    Undo2: TMenuItem;
    Redo3: TMenuItem;
    N10: TMenuItem;
    ExecuteScript2: TMenuItem;
    CheckSyntaxCompile1: TMenuItem;
    N11: TMenuItem;
    Cut3: TMenuItem;
    Copy1: TMenuItem;
    Paste3: TMenuItem;
    Delete1: TMenuItem;
    N12: TMenuItem;
    SelectAll2: TMenuItem;
    SynSearch: TSynEditSearch;
    actFindNext: TAction;
    actFind: TAction;
    actFindPrev: TAction;
    actFindReplace: TAction;
    Search1: TMenuItem;
    Find1: TMenuItem;
    FindNext1: TMenuItem;
    FindPrevious1: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    Replace1: TMenuItem;
    actFindReset: TAction;
    actFindCaseSensitive: TAction;
    ResetSearch1: TMenuItem;
    CaseSensitive1: TMenuItem;
    HelpContents1: TMenuItem;
    HelpContents2: TMenuItem;
    AboutJDHoardHelper1: TMenuItem;
    N3: TMenuItem;
    actExit: TAction;
    Exit1: TMenuItem;
    Wrap1: TMenuItem;
    actFindWholeWords: TAction;
    actGoToPos: TAction;
    Stat: TStatusBar;
    pScript: TPanel;
    actDemoMode: TAction;
    N15: TMenuItem;
    DemoMode1: TMenuItem;
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
    procedure actCheckSyntaxExecute(Sender: TObject);
    procedure actFindNextExecute(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actFindPrevExecute(Sender: TObject);
    procedure actFindReplaceExecute(Sender: TObject);
    procedure actFindCaseSensitiveExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actFindWholeWordsExecute(Sender: TObject);
    procedure txtOutputDblClick(Sender: TObject);
    procedure actGoToPosExecute(Sender: TObject);
    procedure actDemoModeExecute(Sender: TObject);
  private
    FFilename: String;
    FModified: Boolean;
    FExecuting: Boolean;
    FFindText: String;
    //FFindPos: Integer;
    FKillProc: TKillProc;
    //FGotoPos: TPoint;
    procedure PrintLn(Sender: TObject; Context: THHContext;
      const Text: String);
    procedure Started(Sender: TObject);
    procedure Stopped(Sender: TObject);
    function CommonIsLoaded: Boolean;
    function GetScript: String;
    procedure HighlightMatch(const Position, Length: Integer);
    procedure HHBeginUpdate(Sender: TObject);
    procedure HHEndUpdate(Sender: TObject);
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
  uHoardHelperLibs,
  Clipbrd,
  StrUtils;

procedure TfrmHoardHelperMain.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown:= True;
  {$ENDIF}

  //FFindPos:= 0;
  TStyleManager.Engine.RegisterStyleHook(TCustomSynEdit, TScrollingStyleHook);

  pMain.Align:= alClient;
  txtScript.Align:= alClient;
  pScript.Align:= alClient;
  FFilename:= '';
  FModified:= False;

  HH.OnPrintLn:= PrintLn;
  HH.OnStarted:= Started;
  HH.OnStopped:= Stopped;
  HH.OnBeginUpdate:= HHBeginUpdate;
  HH.OnEndUpdate:= HHEndUpdate;
  HH.LoadSettings;

  //Open file from commandline...
  if CmdLine.OpenFilename <> '' then begin
    Load(CmdLine.OpenFilename);
  end;

  //WindowState:= wsMaximized;
  //TODO: Remember window state / size...
  Width:= 1180;
  Height:= 780;
  txtOutput.Height:= 350;

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
      //F.Save; //Already done within TfrmLibs form
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
    try
      FFilename:= Filename;
      txtScript.Lines.LoadFromFile(FFilename);
      txtOutput.Lines.Clear;
      FModified:= False;
      txtScript.UndoList.Clear;
      //txtScript.SetFocus;
    except
      on E: Exception do begin
        Result:= False;
        //TODO
      end;
    end;
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
    //txtScript.SetFocus;
  end;
  UpdateActions;
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

procedure TfrmHoardHelperMain.PrintLn(Sender: TObject; Context: THHContext;
  const Text: String);
//var
  //X: Integer;
begin
  //TODO: Detect associated action to attach to line...

  //TODO: Auto-separate line breaks...
  //Arr := SplitString(Text, sLineBreak);
  //for X := 0 to Length(Arr)-1 do begin
    //txtOutput.Lines.Append(Arr[X]);
  //end;
  txtOutput.Lines.Add(Text);
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

procedure TfrmHoardHelperMain.txtOutputDblClick(Sender: TObject);
var
  R: Integer;
  A: TAction;
begin
  //TODO: Triggery any action attached to row at caret...
  R:= txtOutput.CaretY;
  A:= TAction(txtOutput.Lines.Objects[R]);
  if Assigned(A) then begin
    if A.Enabled and A.Visible then
      A.Execute;
  end;
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
  if not txtScript.Focused then Exit;
  txtScript.PasteFromClipboard;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actRedoExecute(Sender: TObject);
begin
  Self.txtScript.Redo;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actFindReplaceExecute(Sender: TObject);
begin
  //
end;

procedure TfrmHoardHelperMain.actFindWholeWordsExecute(Sender: TObject);
begin
  actFindWholeWords.Checked:= not actFindWholeWords.Checked;
  SynSearch.Whole:= actFindWholeWords.Checked;
end;

procedure TfrmHoardHelperMain.actGoToPosExecute(Sender: TObject);
begin
  //TODO...

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
  if txtScript.Focused then
    txtScript.SelectAll
  else if txtOutput.Focused then
    txtOutput.SelectAll;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actStopExecute(Sender: TObject);
begin
  //TODO: Stop executing script (in thread)...
  if FExecuting then
    FKillProc;
end;

procedure TfrmHoardHelperMain.actUndoExecute(Sender: TObject);
begin
  Self.txtScript.Undo;
  UpdateActions;
end;

function TfrmHoardHelperMain.GetScript: String;
begin
  if txtScript.SelAvail then begin
    Result:= txtScript.SelText;
  end else begin
    Result:= txtScript.Lines.Text;
  end;
end;

procedure TfrmHoardHelperMain.actCheckSyntaxExecute(Sender: TObject);
begin
  txtOutput.Lines.Clear;
  HH.Compile(GetScript, not CommonIsLoaded);
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actCopyExecute(Sender: TObject);
begin
  if txtScript.Focused then
    txtScript.CopyToClipboard
  else if txtOutput.Focused then
    txtOutput.CopyToClipboard;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actCutExecute(Sender: TObject);
begin
  if not txtScript.Focused then Exit;
  txtScript.CutToClipboard;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actDeleteExecute(Sender: TObject);
begin
  if not txtScript.Focused then Exit;
  txtScript.SelText:= '';

  UpdateActions;
end;

procedure TfrmHoardHelperMain.actDemoModeExecute(Sender: TObject);
begin
  actDemoMode.Checked:= not actDemoMode.Checked;
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actExecExecute(Sender: TObject);
begin
  //Execute script...
  txtOutput.Lines.Clear;
  FKillProc:= HH.Execute(GetScript, True, actDemoMode.Checked);
  UpdateActions;
end;

procedure TfrmHoardHelperMain.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmHoardHelperMain.actFindCaseSensitiveExecute(Sender: TObject);
begin
  actFindCaseSensitive.Checked:= not actFindCaseSensitive.Checked;
  SynSearch.CaseSensitive:= actFindCaseSensitive.Checked;
end;

procedure TfrmHoardHelperMain.HHBeginUpdate(Sender: TObject);
begin
  txtScript.Lines.BeginUpdate;
end;

procedure TfrmHoardHelperMain.HHEndUpdate(Sender: TObject);
begin
  txtScript.Lines.EndUpdate;
end;

procedure TfrmHoardHelperMain.HighlightMatch(const Position, Length: Integer);
begin
  txtScript.SelStart:= Position;
  txtScript.SelLength:= Length;
end;

procedure TfrmHoardHelperMain.actFindExecute(Sender: TObject);
var
  S: String;
  P: Integer;
begin
  //Open find window (show on top)...
  S:= InputBox('Find', 'Enter your search:', txtScript.SelText);
  if S <> '' then begin
    Self.FFindText:= S;
    SynSearch.Pattern:= S;
    P:= SynSearch.FindFirst(S);
    HighlightMatch(P, Length(FFindText));
  end;
end;

procedure TfrmHoardHelperMain.actFindNextExecute(Sender: TObject);
var
  P: Integer;
begin
  P:= SynSearch.Next;
  HighlightMatch(P, Length(FFindText));

end;

procedure TfrmHoardHelperMain.actFindPrevExecute(Sender: TObject);
begin
  //
  SynSearch.Next
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

  actCheckSyntax.Enabled:= (not FExecuting);
  actExec.Enabled:= (not FExecuting) and (not CommonIsLoaded);
  actStop.Enabled:= FExecuting;
  actDemoMode.Enabled:= not FExecuting;

  actUndo.Enabled:= txtScript.CanUndo and (not FExecuting);
  actRedo.Enabled:= txtScript.CanRedo and (not FExecuting);
  actCut.Enabled:= txtScript.SelAvail and (not FExecuting);
  actCopy.Enabled:= txtScript.SelAvail and (not FExecuting);
  actPaste.Enabled:= txtScript.CanPaste and (not FExecuting);
  actDelete.Enabled:= txtScript.SelAvail and (not FExecuting);
  actSelectAll.Enabled:= (not FExecuting);

  //Caret Position
  Stat.Panels[0].Text:= 'Line '+IntToStr(txtScript.CaretY)+' Col '+IntToStr(txtScript.CaretX);

  //Modified
  if FModified then begin
    Stat.Panels[1].Text:= 'Modified';
  end else begin
    Stat.Panels[1].Text:= '';
  end;

  //Demo Mode
  if actDemoMode.Checked then begin
    Stat.Panels[2].Text:= 'DEMO MODE';
  end else begin
    Stat.Panels[2].Text:= 'LIVE MODE';
  end;


  //Filename
  if FFileName = '' then begin
    Stat.Panels[3].Text:= 'Untitled.hhs';
  end else begin
    Stat.Panels[3].Text:= ExtractFileName(FFilename);
  end;
  Self.Caption:= 'JD Hoard Helper - '+Stat.Panels[3].Text;

  for X := 0 to Toolbar.ControlCount-1 do begin
    TControl(Toolbar.Controls[X]).Invalidate;
  end;
end;

initialization
  UseLatestCommonDialogs:= True;

end.
