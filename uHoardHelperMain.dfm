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
  OldCreateOrder = False
  OnCreate = FormCreate
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
    ExplicitLeft = 248
    ExplicitTop = 236
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
      Text = 'actNew'
      ExplicitLeft = -6
      ExplicitTop = -6
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
      Text = 'actOpen'
      ExplicitLeft = 43
      ExplicitTop = -6
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
      Text = 'actSave'
      ExplicitLeft = 104
      ExplicitTop = -6
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
      Text = 'actSaveAs'
      ExplicitLeft = 210
      ExplicitTop = -6
    end
    object JDFontButton5: TJDFontButton
      Left = 196
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
      Image.StandardColor = fcBlue
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
      Text = 'actExec'
      ExplicitLeft = 297
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
    ExplicitLeft = 320
    ExplicitTop = 304
    ExplicitWidth = 0
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
    ExplicitTop = 35
    ExplicitWidth = 769
    ExplicitHeight = 431
    object Splitter1: TSplitter
      Left = 0
      Top = 305
      Width = 863
      Height = 7
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      ExplicitTop = 309
    end
    object txtScript: TSynEdit
      Left = 0
      Top = 0
      Width = 863
      Height = 225
      Align = alTop
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      TabOrder = 0
      OnKeyUp = txtScriptKeyUp
      OnMouseUp = txtScriptMouseUp
      UseCodeFolding = True
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
      Options = [eoAutoIndent, eoDisableScrollArrows, eoDragDropEditing, eoEnhanceHomeKey, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoKeepCaretX, eoShowScrollHint, eoSmartTabDelete, eoTabIndent, eoTabsToSpaces, eoShowLigatures]
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
      Font.Name = 'Tahoma'
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
      Caption = 'actNew'
      Hint = 'New Script'
      ShortCut = 16462
      OnExecute = actNewExecute
    end
    object actOpen: TAction
      Caption = 'actOpen'
      Hint = 'Open Script...'
      ShortCut = 16463
      OnExecute = actOpenExecute
    end
    object actSave: TAction
      Caption = 'actSave'
      Hint = 'Save Script'
      ShortCut = 16467
      OnExecute = actSaveExecute
    end
    object actSaveAs: TAction
      Caption = 'actSaveAs'
      Hint = 'Save Script As...'
      ShortCut = 24659
      OnExecute = actSaveAsExecute
    end
    object actExec: TAction
      Caption = 'actExec'
      Hint = 'Execute Script'
      ShortCut = 120
      OnExecute = actExecExecute
    end
  end
  object dlgOpen: TOpenTextFileDialog
    DefaultExt = '.hhs'
    Filter = 'JD Hoard Helper Script (*.hhs)|*.hhs|All Fies (*.*)|*.*'
    Left = 528
    Top = 57
  end
  object dlgSave: TSaveTextFileDialog
    DefaultExt = '.hhs'
    Filter = 'JD Hoard Helper Script (*.hhs)|*.hhs|All Fies (*.*)|*.*'
    Left = 584
    Top = 57
  end
end
