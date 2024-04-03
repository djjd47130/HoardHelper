unit uHoardHelperMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, SynEdit,
  SynEditHighlighter, SynEditCodeFolding, SynHighlighterPas, SynHighlighterDWS,
  System.Actions, Vcl.ActnList, JD.Common, JD.Ctrls, JD.Ctrls.FontButton,
  Vcl.StdCtrls, Vcl.ExtDlgs;

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
  private
    FFilename: String;
    FModified: Boolean;
  public
    function New: Boolean;
    function Load(const Filename: String): Boolean;
    function SaveToFile(const Filename: String): Boolean;
    function Save: Boolean;
    function SaveAs: Boolean;
    procedure UpdateActions;
    property Modified: Boolean read FModified;
  end;

var
  frmHoardHelperMain: TfrmHoardHelperMain;

implementation

{$R *.dfm}

uses
  uHoardHelperCtrl;

procedure TfrmHoardHelperMain.actNewExecute(Sender: TObject);
begin
  New;
end;

procedure TfrmHoardHelperMain.actOpenExecute(Sender: TObject);
begin
  if dlgOpen.Execute then begin
    Load(dlgOpen.FileName);
  end;
end;

procedure TfrmHoardHelperMain.actSaveAsExecute(Sender: TObject);
begin
  SaveAs;
end;

procedure TfrmHoardHelperMain.actSaveExecute(Sender: TObject);
begin
  Save;
end;

procedure TfrmHoardHelperMain.FormCreate(Sender: TObject);
begin
  pMain.Align:= alClient;
  txtScript.Align:= alClient;
  FFilename:= '';
  FModified:= False;
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
    txtScript.SetFocus;
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
  //TODO
  actSave.Enabled:= FModified;
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

procedure TfrmHoardHelperMain.actExecExecute(Sender: TObject);
var
  E, R: String;
begin
  E:= txtScript.Lines.Text;
  try
    R:= dmHoardHelperCtrl.Exec(E);
    txtOutput.Lines.Text:= R;
  except
    on E: Exception do begin
      txtOutput.Lines.Text:= E.Message;
    end;
  end;
  UpdateActions;
end;

end.
