object frmHoardHelperMain: TfrmHoardHelperMain
  Left = 0
  Top = 0
  Caption = 'JD Hoard Helper'
  ClientHeight = 570
  ClientWidth = 930
  Color = clBlack
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MM
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 18
  object Toolbar: TPanel
    Left = 0
    Top = 0
    Width = 930
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel1: TBevel
      AlignWithMargins = True
      Left = 199
      Top = 3
      Width = 9
      Height = 35
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 236
      ExplicitTop = 0
    end
    object Bevel2: TBevel
      AlignWithMargins = True
      Left = 312
      Top = 3
      Width = 9
      Height = 35
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 266
      ExplicitTop = 0
    end
    object JDFontButton1: TJDFontButton
      Left = 0
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Action = actNew
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61543
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -21
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcGreen
      Overlay.Text = #57715
      Overlay.Font.Charset = DEFAULT_CHARSET
      Overlay.Font.Color = clWindowText
      Overlay.Font.Height = -7
      Overlay.Font.Name = 'FontAwesome'
      Overlay.Font.Style = []
      Overlay.Font.Quality = fqAntialiased
      Overlay.Position = foNone
      Overlay.Margin = 3
      ImagePosition = fpImgOnly
      ShowHint = True
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 0
      Text = 'New Script'
    end
    object JDFontButton2: TJDFontButton
      Left = 49
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Action = actOpen
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61564
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -21
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcOrange
      Overlay.Text = #57715
      Overlay.Font.Charset = DEFAULT_CHARSET
      Overlay.Font.Color = clWindowText
      Overlay.Font.Height = -7
      Overlay.Font.Name = 'FontAwesome'
      Overlay.Font.Style = []
      Overlay.Font.Quality = fqAntialiased
      Overlay.Position = foNone
      Overlay.Margin = 3
      ImagePosition = fpImgOnly
      ShowHint = True
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 1
      Text = 'Open Script...'
    end
    object JDFontButton3: TJDFontButton
      Left = 98
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Action = actSave
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61639
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -21
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcGreen
      Overlay.Text = #57715
      Overlay.Font.Charset = DEFAULT_CHARSET
      Overlay.Font.Color = clWindowText
      Overlay.Font.Height = -7
      Overlay.Font.Name = 'FontAwesome'
      Overlay.Font.Style = []
      Overlay.Font.Quality = fqAntialiased
      Overlay.Position = foNone
      Overlay.Margin = 3
      ImagePosition = fpImgOnly
      ShowHint = True
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 2
      Text = 'Save Script'
    end
    object JDFontButton4: TJDFontButton
      Left = 147
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Action = actSaveAs
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61639
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -21
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcGreen
      Overlay.Text = #61564
      Overlay.Font.Charset = DEFAULT_CHARSET
      Overlay.Font.Color = clWindowText
      Overlay.Font.Height = -13
      Overlay.Font.Name = 'FontAwesome'
      Overlay.Font.Style = []
      Overlay.Font.Quality = fqAntialiased
      Overlay.StandardColor = fcOrange
      Overlay.Position = foBottomRight
      Overlay.Margin = 3
      ImagePosition = fpImgOnly
      ShowHint = True
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 3
      Text = 'Save Script As...'
    end
    object JDFontButton5: TJDFontButton
      Left = 324
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Action = actExec
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61515
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -21
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcGreen
      Overlay.Text = #57715
      Overlay.Font.Charset = DEFAULT_CHARSET
      Overlay.Font.Color = clWindowText
      Overlay.Font.Height = -7
      Overlay.Font.Name = 'FontAwesome'
      Overlay.Font.Style = []
      Overlay.Font.Quality = fqAntialiased
      Overlay.Position = foNone
      Overlay.Margin = 3
      ImagePosition = fpImgOnly
      ShowHint = True
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 4
      Text = 'Execute Script'
      ExplicitLeft = 312
      ExplicitTop = 3
    end
    object JDFontButton6: TJDFontButton
      Left = 211
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Action = actUndo
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61714
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -21
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcGreen
      Overlay.Text = #57715
      Overlay.Font.Charset = DEFAULT_CHARSET
      Overlay.Font.Color = clWindowText
      Overlay.Font.Height = -7
      Overlay.Font.Name = 'FontAwesome'
      Overlay.Font.Style = []
      Overlay.Font.Quality = fqAntialiased
      Overlay.Position = foNone
      Overlay.Margin = 3
      ImagePosition = fpImgOnly
      ShowHint = True
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 5
      Text = 'Undo'
      ExplicitLeft = 205
    end
    object JDFontButton7: TJDFontButton
      Left = 373
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Action = actStop
      Align = alLeft
      DrawStyle = fdTransparent
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61517
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -21
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcRed
      Overlay.Text = #57715
      Overlay.Font.Charset = DEFAULT_CHARSET
      Overlay.Font.Color = clWindowText
      Overlay.Font.Height = -7
      Overlay.Font.Name = 'FontAwesome'
      Overlay.Font.Style = []
      Overlay.Font.Quality = fqAntialiased
      Overlay.Position = foNone
      Overlay.Margin = 3
      ImagePosition = fpImgOnly
      ShowHint = True
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 6
      Text = 'Stop Exec'
      ExplicitLeft = 269
      ExplicitTop = 3
    end
    object JDFontButton8: TJDFontButton
      Left = 260
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Action = actRedo
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61540
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -21
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcGreen
      Overlay.Text = #57715
      Overlay.Font.Charset = DEFAULT_CHARSET
      Overlay.Font.Color = clWindowText
      Overlay.Font.Height = -7
      Overlay.Font.Name = 'FontAwesome'
      Overlay.Font.Style = []
      Overlay.Font.Quality = fqAntialiased
      Overlay.Position = foNone
      Overlay.Margin = 3
      ImagePosition = fpImgOnly
      ShowHint = True
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 7
      Text = 'Redo'
      ExplicitLeft = 266
      ExplicitTop = -6
    end
  end
  object Stat: TStatusBar
    Left = 0
    Top = 551
    Width = 930
    Height = 19
    Panels = <
      item
        Text = '[Cur Pos]'
        Width = 80
      end
      item
        Text = '[Modified]'
        Width = 80
      end
      item
        Text = '[Filename]'
        Width = 50
      end>
  end
  object pMain: TPanel
    Left = 0
    Top = 41
    Width = 863
    Height = 510
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 0
      Top = 305
      Width = 863
      Height = 7
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      ResizeStyle = rsUpdate
      ExplicitTop = 309
    end
    object txtScript: TSynEdit
      Left = 0
      Top = 0
      Width = 863
      Height = 225
      Align = alTop
      Color = clBlack
      ActiveLineColor = 3158064
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      TabOrder = 0
      OnKeyUp = txtScriptKeyUp
      OnMouseUp = txtScriptMouseUp
      UseCodeFolding = False
      BorderStyle = bsNone
      Gutter.BorderStyle = gbsNone
      Gutter.Color = clBlack
      Gutter.BorderColor = clSilver
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWhite
      Gutter.Font.Height = -16
      Gutter.Font.Name = 'Consolas'
      Gutter.Font.Style = []
      Gutter.Font.Quality = fqClearTypeNatural
      Gutter.ShowLineNumbers = True
      Gutter.Gradient = True
      Gutter.GradientStartColor = clBlack
      Gutter.GradientEndColor = 4539717
      Gutter.Bands = <
        item
          Kind = gbkMarks
          Width = 13
        end
        item
          Kind = gbkLineNumbers
        end
        item
          Kind = gbkFold
        end
        item
          Kind = gbkTrackChanges
        end
        item
          Kind = gbkMargin
          Width = 3
        end>
      Highlighter = SynDWSSyn1
      Lines.Strings = (
        'procedure ListFilesInFolder(Dir: String);'
        'var'
        '  F: Array of String;'
        '  X: Integer;'
        'begin'
        '  F:= GetFiles(Dir, '#39'*.avi;*.mp4;*.mkv'#39', True);'
        '  PrintLn('#39'Files found: '#39'+IntToStr(Length(F)));'
        '  for X := 0 to Length(F)-1 do begin'
        '    PrintLn('#39'- '#39'+ExtractFileName(F[X]));'
        '  end;'
        'end;'
        ''
        'ListFilesInFolder('#39'M:\Media\Videos\Movies'#39');')
      Options = [eoAutoIndent, eoDisableScrollArrows, eoDragDropEditing, eoEnhanceHomeKey, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoKeepCaretX, eoShowScrollHint, eoSmartTabDelete, eoTabIndent, eoTabsToSpaces, eoShowLigatures, eoWrapWithRightEdge]
      RightEdge = 70
      RightEdgeColor = 4539717
      ScrollHintColor = 6828847
      SelectedColor.Background = 9201502
      SelectedColor.Alpha = 0.400000005960464500
      TabWidth = 2
      WantTabs = True
      OnChange = txtScriptChange
    end
    object txtOutput: TMemo
      Left = 0
      Top = 312
      Width = 863
      Height = 198
      Align = alBottom
      BorderStyle = bsNone
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
      WordWrap = False
      StyleElements = [seFont, seBorder]
    end
  end
  object SynDWSSyn1: TSynDWSSyn
    DefaultFilter = 'DWScript Files (*.dws;*.pas;*.inc)|*.dws;*.pas;*.inc'
    CommentAttri.Foreground = clLime
    IdentifierAttri.Foreground = clSilver
    NumberAttri.Foreground = clMoneyGreen
    FloatAttri.Foreground = clMoneyGreen
    StringAttri.Foreground = 14449959
    SymbolAttri.Foreground = clWhite
    Left = 536
    Top = 256
  end
  object Acts: TActionList
    Left = 600
    Top = 257
    object actNew: TAction
      Category = 'File'
      Caption = 'New Script'
      Hint = 'New Script'
      ShortCut = 16462
      OnExecute = actNewExecute
    end
    object actOpen: TAction
      Category = 'File'
      Caption = 'Open Script...'
      Hint = 'Open Script...'
      ShortCut = 16463
      OnExecute = actOpenExecute
    end
    object actSave: TAction
      Category = 'File'
      Caption = 'Save Script'
      Hint = 'Save Script'
      ShortCut = 16467
      OnExecute = actSaveExecute
    end
    object actSaveAs: TAction
      Category = 'File'
      Caption = 'Save Script As...'
      Hint = 'Save Script As...'
      ShortCut = 24659
      OnExecute = actSaveAsExecute
    end
    object actExec: TAction
      Category = 'Script'
      Caption = 'Execute Script'
      Hint = 'Execute Script'
      ShortCut = 120
      OnExecute = actExecExecute
    end
    object actStop: TAction
      Category = 'Script'
      Caption = 'Stop Exec'
      Enabled = False
      Hint = 'Stop Exec'
      ShortCut = 121
      OnExecute = actStopExecute
    end
    object actLibraries: TAction
      Category = 'Options'
      Caption = 'Manage Libraries'
      Hint = 'Manage Libraries'
      ShortCut = 16460
      OnExecute = actLibrariesExecute
    end
    object actUndo: TAction
      Category = 'Edit'
      Caption = 'Undo'
      Hint = 'Undo'
      ShortCut = 16474
      OnExecute = actUndoExecute
    end
    object actRedo: TAction
      Category = 'Edit'
      Caption = 'Redo'
      Hint = 'Redo'
      ShortCut = 24666
      OnExecute = actRedoExecute
    end
    object actCut: TAction
      Category = 'Edit'
      Caption = 'Cut'
      Hint = 'Cut'
      ShortCut = 16472
      OnExecute = actCutExecute
    end
    object actCopy: TAction
      Category = 'Edit'
      Caption = 'Copy'
      Hint = 'Copy'
      ShortCut = 16451
      OnExecute = actCopyExecute
    end
    object actPaste: TAction
      Category = 'Edit'
      Caption = 'Paste'
      Hint = 'Paste'
      ShortCut = 16474
      OnExecute = actPasteExecute
    end
    object actDelete: TAction
      Category = 'Edit'
      Caption = 'Delete'
      Hint = 'Delete'
      ShortCut = 16430
      OnExecute = actDeleteExecute
    end
    object actSelectAll: TAction
      Category = 'Edit'
      Caption = 'Select All'
      Hint = 'Select All'
      ShortCut = 16449
      OnExecute = actSelectAllExecute
    end
    object actOpenCommon: TAction
      Category = 'File'
      Caption = 'Open Common Script'
      Hint = 'Open Common Script'
      ShortCut = 24655
      OnExecute = actOpenCommonExecute
    end
  end
  object dlgOpen: TOpenTextFileDialog
    DefaultExt = '.hhs'
    Filter = 'JD Hoard Helper Script (*.hhs)|*.hhs|All Fies (*.*)|*.*'
    Title = 'Open Script File'
    Left = 528
    Top = 57
  end
  object dlgSave: TSaveTextFileDialog
    DefaultExt = '.hhs'
    Filter = 'JD Hoard Helper Script (*.hhs)|*.hhs|All Fies (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save Script File'
    Left = 584
    Top = 57
  end
  object MM: TMainMenu
    Left = 712
    Top = 56
    object File1: TMenuItem
      Caption = 'File'
      object File2: TMenuItem
        Action = actNew
      end
      object OpenCommonScript1: TMenuItem
        Action = actOpenCommon
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object OpenRecent1: TMenuItem
        Caption = 'Open Recent'
        object ManageRecents1: TMenuItem
          Caption = 'Manage Recents...'
          ShortCut = 24658
        end
        object ManageRecents2: TMenuItem
          Caption = '-'
        end
      end
      object N2: TMenuItem
        Action = actOpen
      end
      object SaveScript1: TMenuItem
        Action = actSave
      end
      object SaveScript2: TMenuItem
        Action = actSaveAs
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Undo1: TMenuItem
        Action = actUndo
      end
      object Redo1: TMenuItem
        Action = actRedo
      end
      object Redo2: TMenuItem
        Caption = '-'
      end
      object Cut1: TMenuItem
        Action = actCut
      end
      object Cut2: TMenuItem
        Action = actCopy
      end
      object Paste1: TMenuItem
        Action = actPaste
      end
      object Paste2: TMenuItem
        Action = actDelete
      end
      object SelectAll1: TMenuItem
        Action = actSelectAll
      end
      object N3: TMenuItem
        Caption = '-'
      end
    end
    object Script1: TMenuItem
      Caption = 'Script'
      object ExecuteScript1: TMenuItem
        Action = actExec
      end
      object StopExec1: TMenuItem
        Action = actStop
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = 'Compile Only'
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      object ManageLibraries1: TMenuItem
        Action = actLibraries
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object WordWrap1: TMenuItem
        Caption = 'Word Wrap'
        object None1: TMenuItem
          Caption = 'None'
          Checked = True
        end
        object None2: TMenuItem
          Caption = 'Editor Width'
        end
        object RightLine1: TMenuItem
          Caption = 'Right Line'
        end
      end
      object AutoBackups1: TMenuItem
        Caption = 'Auto Backups'
        object Enabled1: TMenuItem
          Caption = 'Enabled'
          GroupIndex = 1
        end
        object Enabled2: TMenuItem
          Caption = 'Disabled'
          Checked = True
          GroupIndex = 1
        end
        object N4: TMenuItem
          Caption = '-'
          GroupIndex = 1
        end
        object SelectBackupDirectory1: TMenuItem
          Caption = 'Select Backup Directory...'
          GroupIndex = 1
        end
      end
      object Editor1: TMenuItem
        Caption = 'Editor'
        object SyntaxHighlighting1: TMenuItem
          Caption = 'Syntax Highlighting'
          Checked = True
        end
      end
      object Index1: TMenuItem
        Caption = 'Index'
        object Enabled3: TMenuItem
          Caption = 'Enabled'
        end
        object N6: TMenuItem
          Caption = '-'
        end
        object N7: TMenuItem
          Caption = 'Index Now'
        end
      end
    end
    object Options2: TMenuItem
      Caption = 'Help'
    end
  end
end
