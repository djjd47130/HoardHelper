object frmScript: TfrmScript
  Left = 0
  Top = 0
  Caption = 'JD Hoard Helper'
  ClientHeight = 570
  ClientWidth = 918
  Color = clBlack
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 18
  object Toolbar: TPanel
    Left = 0
    Top = 0
    Width = 918
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = -5
    object Bevel1: TBevel
      AlignWithMargins = True
      Left = 199
      Top = 3
      Width = 6
      Height = 35
      Align = alLeft
      Shape = bsRightLine
    end
    object Bevel2: TBevel
      AlignWithMargins = True
      Left = 309
      Top = 3
      Width = 6
      Height = 35
      Align = alLeft
      Shape = bsRightLine
    end
    object Bevel3: TBevel
      AlignWithMargins = True
      Left = 468
      Top = 3
      Width = 6
      Height = 35
      Align = alLeft
      Shape = bsRightLine
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
      ExplicitLeft = 1
      ExplicitTop = -5
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
      Left = 367
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
      ExplicitLeft = 361
      ExplicitTop = -5
    end
    object JDFontButton6: TJDFontButton
      Left = 208
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
    end
    object JDFontButton7: TJDFontButton
      Left = 416
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
    end
    object JDFontButton8: TJDFontButton
      Left = 257
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
    end
    object JDFontButton9: TJDFontButton
      Left = 318
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Action = actCheckSyntax
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61528
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
      TabOrder = 8
      Text = 'Check Syntax (Compile)'
    end
    object JDFontButton10: TJDFontButton
      Left = 477
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Action = actFind
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61442
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
      TabOrder = 9
      Text = 'Find'
      ExplicitLeft = 568
      ExplicitTop = -5
    end
  end
  object pMain: TPanel
    Left = 0
    Top = 41
    Width = 882
    Height = 529
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitHeight = 509
    object Splitter1: TSplitter
      Left = 0
      Top = 258
      Width = 882
      Height = 10
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      ResizeStyle = rsUpdate
      ExplicitTop = 221
    end
    object txtOutput: TSynEdit
      Left = 0
      Top = 268
      Width = 882
      Height = 261
      Align = alBottom
      Color = 1907997
      ActiveLineColor = 3158064
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = []
      TabOrder = 0
      OnDblClick = txtOutputDblClick
      CodeFolding.GutterShapeSize = 11
      CodeFolding.CollapsedLineColor = clGrayText
      CodeFolding.FolderBarLinesColor = clGrayText
      CodeFolding.IndentGuidesColor = clGray
      CodeFolding.IndentGuides = True
      CodeFolding.ShowCollapsedLine = False
      CodeFolding.ShowHintMark = True
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
      Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceHomeKey, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
      ReadOnly = True
      RightEdge = 0
      RightEdgeColor = 4539717
      ScrollHintColor = 6828847
      SelectedColor.Background = 9201502
      TabWidth = 2
      WantTabs = True
      FontSmoothing = fsmClearType
      ExplicitTop = 248
    end
    object pScript: TPanel
      Left = 0
      Top = 0
      Width = 882
      Height = 201
      Align = alTop
      Caption = 'pScript'
      TabOrder = 1
      object Stat: TStatusBar
        Left = 1
        Top = 181
        Width = 880
        Height = 19
        Panels = <
          item
            Text = '[Cur Pos]'
            Width = 100
          end
          item
            Text = '[Modified]'
            Width = 100
          end
          item
            Text = '[Demo Mode]'
            Width = 100
          end
          item
            Text = '[Filename]'
            Width = 50
          end>
      end
      object txtScript: TSynEdit
        Left = 1
        Top = 1
        Width = 880
        Height = 152
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = 1907997
        ActiveLineColor = 4473924
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Consolas'
        Font.Style = []
        PopupMenu = popScript
        TabOrder = 1
        OnKeyUp = txtScriptKeyUp
        OnMouseUp = txtScriptMouseUp
        CodeFolding.GutterShapeSize = 11
        CodeFolding.CollapsedLineColor = clGrayText
        CodeFolding.FolderBarLinesColor = clGrayText
        CodeFolding.IndentGuidesColor = clGray
        CodeFolding.IndentGuides = True
        CodeFolding.ShowCollapsedLine = False
        CodeFolding.ShowHintMark = True
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
        Highlighter = DWSSyn
        Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceHomeKey, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoTabsToSpaces, eoTrimTrailingSpaces]
        RightEdge = 100
        RightEdgeColor = 4539717
        ScrollHintColor = 6828847
        SearchEngine = SynSearch
        SelectedColor.Background = 9201502
        TabWidth = 2
        WantTabs = True
        OnChange = txtScriptChange
        OnGutterGetText = txtScriptGutterGetText
        FontSmoothing = fsmClearType
      end
    end
  end
  object DWSSyn: TSynDWSSyn
    DefaultFilter = 'DWScript Files (*.dws;*.pas;*.inc)|*.dws;*.pas;*.inc'
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    CommentAttri.Foreground = clLime
    IdentifierAttri.Foreground = clSilver
    NumberAttri.Foreground = clMoneyGreen
    FloatAttri.Foreground = clMoneyGreen
    StringAttri.Foreground = 14449959
    SymbolAttri.Foreground = clWhite
    Left = 344
    Top = 72
  end
  object Acts: TActionList
    Left = 208
    Top = 73
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
    object actOpenCommon: TAction
      Category = 'File'
      Caption = 'Open Common Script'
      Hint = 'Open Common Script'
      ShortCut = 24655
      OnExecute = actOpenCommonExecute
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
    object actCheckSyntax: TAction
      Category = 'Script'
      Caption = 'Check Syntax (Compile)'
      Hint = 'Check Syntax (Compile)'
      ShortCut = 16504
      OnExecute = actCheckSyntaxExecute
    end
    object actFind: TAction
      Category = 'Search'
      Caption = 'Find'
      Hint = 'Find'
      ShortCut = 16454
      OnExecute = actFindExecute
    end
    object actFindNext: TAction
      Category = 'Search'
      Caption = 'Find Next'
      Hint = 'Find Next'
      ShortCut = 114
      OnExecute = actFindNextExecute
    end
    object actFindPrev: TAction
      Category = 'Search'
      Caption = 'Find Previous'
      Hint = 'Find Previous'
      ShortCut = 8306
      OnExecute = actFindPrevExecute
    end
    object actFindReplace: TAction
      Category = 'Search'
      Caption = 'Replace'
      Hint = 'Replace'
      ShortCut = 16456
      OnExecute = actFindReplaceExecute
    end
    object actFindReset: TAction
      Category = 'Search'
      Caption = 'Reset Search'
      Hint = 'Reset Search'
    end
    object actFindCaseSensitive: TAction
      Category = 'Search'
      Caption = 'Case Sensitive'
      Hint = 'Case Sensitive'
      OnExecute = actFindCaseSensitiveExecute
    end
    object actFindWholeWords: TAction
      Category = 'Search'
      Caption = 'Whole Words'
      Checked = True
      Hint = 'Whole Words'
      OnExecute = actFindWholeWordsExecute
    end
    object actGoToPos: TAction
      Caption = 'Go to Position'
      Hint = 'Go to Position'
      OnExecute = actGoToPosExecute
    end
    object actDemoMode: TAction
      Category = 'Script'
      Caption = 'Demo Mode'
      Checked = True
      Hint = 'Demo Mode'
      ShortCut = 16452
      OnExecute = actDemoModeExecute
    end
  end
  object MM: TMainMenu
    Left = 272
    Top = 72
    object Script1: TMenuItem
      Caption = 'Script'
      GroupIndex = 1
      object NewScript1: TMenuItem
        Action = actNew
      end
      object OpenCommonScript1: TMenuItem
        Action = actOpenCommon
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Action = actOpen
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
      object SaveScript1: TMenuItem
        Action = actSave
      end
      object SaveScript2: TMenuItem
        Action = actSaveAs
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      GroupIndex = 2
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
    end
    object Search1: TMenuItem
      Caption = 'Search'
      GroupIndex = 3
      object Find1: TMenuItem
        Action = actFind
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object FindNext1: TMenuItem
        Action = actFindNext
      end
      object FindPrevious1: TMenuItem
        Action = actFindPrev
      end
      object Replace1: TMenuItem
        Action = actFindReplace
      end
      object ResetSearch1: TMenuItem
        Action = actFindReset
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object CaseSensitive1: TMenuItem
        Action = actFindCaseSensitive
      end
      object Wrap1: TMenuItem
        Caption = 'Wrap'
        Checked = True
      end
    end
    object Run1: TMenuItem
      Caption = 'Run'
      GroupIndex = 4
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
        Action = actCheckSyntax
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object DemoMode1: TMenuItem
        Action = actDemoMode
      end
    end
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '.hhs'
    Filter = 'JD Hoard Helper Script (*.hhs)|*.hhs|All Fies (*.*)|*.*'
    Title = 'Open Script File'
    Left = 272
    Top = 129
  end
  object dlgSave: TSaveDialog
    DefaultExt = '.hhs'
    Filter = 'JD Hoard Helper Script (*.hhs)|*.hhs|All Fies (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save Script File'
    Left = 344
    Top = 129
  end
  object popScript: TPopupMenu
    Left = 208
    Top = 129
    object Undo2: TMenuItem
      Action = actUndo
    end
    object Redo3: TMenuItem
      Action = actRedo
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object ExecuteScript2: TMenuItem
      Action = actExec
    end
    object CheckSyntaxCompile1: TMenuItem
      Action = actCheckSyntax
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object Cut3: TMenuItem
      Action = actCut
    end
    object Copy1: TMenuItem
      Action = actCopy
    end
    object Paste3: TMenuItem
      Action = actPaste
    end
    object Delete1: TMenuItem
      Action = actDelete
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object SelectAll2: TMenuItem
      Action = actSelectAll
    end
  end
  object SynSearch: TSynEditSearch
    Left = 416
    Top = 73
  end
end
