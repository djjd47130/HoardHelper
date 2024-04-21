object frmHHMain: TfrmHHMain
  Left = 0
  Top = 0
  Caption = 'JD Hoard Helper'
  ClientHeight = 563
  ClientWidth = 926
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MM
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 49
    Top = 0
    Width = 8
    Height = 563
    Align = alLeft
    Shape = bsLeftLine
    ExplicitHeight = 534
  end
  object pMain: TPanel
    Left = 334
    Top = 0
    Width = 592
    Height = 563
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
  end
  object pMenu: TPanel
    Left = 0
    Top = 0
    Width = 49
    Height = 563
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object btnMenuSettings: TJDFontButton
      Left = 0
      Top = 465
      Width = 49
      Height = 49
      Cursor = crHandPoint
      Action = actMenuSettings
      Align = alBottom
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61459
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
      Text = 'Settings...'
    end
    object btnMenuAbout: TJDFontButton
      Left = 0
      Top = 514
      Width = 49
      Height = 49
      Cursor = crHandPoint
      Action = actAbout
      Align = alBottom
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61529
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
      TabOrder = 6
      Text = 'About JD Hoard Helper...'
      ExplicitLeft = -6
      ExplicitTop = 520
    end
    object btnMenuHome: TJDFontButton
      Left = 0
      Top = 0
      Width = 49
      Height = 49
      Cursor = crHandPoint
      Action = actMenuHome
      Align = alTop
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61461
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
      Text = 'Home'
    end
    object btnMenuMedia: TJDFontButton
      Left = 0
      Top = 49
      Width = 49
      Height = 49
      Cursor = crHandPoint
      Action = actMenuMedia
      Align = alTop
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61451
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
      TabOrder = 1
      Text = 'Search Media'
    end
    object btnMenuLibs: TJDFontButton
      Left = 0
      Top = 98
      Width = 49
      Height = 49
      Cursor = crHandPoint
      Action = actMenuLibs
      Align = alTop
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61875
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
      Text = 'Manage Libraries'
      ExplicitLeft = -6
      ExplicitTop = 92
    end
    object btnMenuScript: TJDFontButton
      Left = 0
      Top = 196
      Width = 49
      Height = 49
      Cursor = crHandPoint
      Action = actMenuScript
      Align = alTop
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
      Text = 'Scripting'
      ExplicitTop = 147
    end
    object btnMenuDupeFinder: TJDFontButton
      Left = 0
      Top = 147
      Width = 49
      Height = 49
      Cursor = crHandPoint
      Action = actMenuDupeFinder
      Align = alTop
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61637
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
      TabOrder = 3
      Text = 'Duplicate Finder'
    end
  end
  object Acts: TActionList
    Left = 104
    Top = 57
    object actHelpContents: TAction
      Category = 'Help'
      Caption = 'Help Contents'
      Hint = 'Help Contents'
      ShortCut = 16496
      OnExecute = actHelpContentsExecute
    end
    object actAbout: TAction
      Category = 'Help'
      Caption = 'About JD Hoard Helper...'
      Hint = 'About JD Hoard Helper...'
      ShortCut = 24641
      OnExecute = actAboutExecute
    end
    object actMenuHome: TAction
      Category = 'Menu'
      Caption = 'Home'
      Hint = 'Home'
      ShortCut = 24648
      OnExecute = actMenuHomeExecute
    end
    object actMenuMedia: TAction
      Category = 'Menu'
      Caption = 'Search Media'
      Hint = 'Search Media'
      ShortCut = 24653
      OnExecute = btnMenuMediaClick
    end
    object actMenuLibs: TAction
      Category = 'Menu'
      Caption = 'Manage Libraries'
      Hint = 'Manage Libraries'
      ShortCut = 24652
      OnExecute = btnMenuLibsClick
    end
    object actMenuDupeFinder: TAction
      Category = 'Menu'
      Caption = 'Duplicate Finder'
      Hint = 'Duplicate Finder'
      OnExecute = actMenuDupeFinderExecute
    end
    object actMenuScript: TAction
      Category = 'Menu'
      Caption = 'Scripting'
      Hint = 'Scripting'
      OnExecute = actMenuScriptExecute
    end
    object actMenuSettings: TAction
      Category = 'Menu'
      Caption = 'Settings...'
      Hint = 'Settings...'
      ShortCut = 24659
      OnExecute = actMenuSettingsExecute
    end
  end
  object MM: TMainMenu
    Left = 152
    Top = 56
    object File1: TMenuItem
      Caption = 'File'
      object mFileSettings: TMenuItem
        Action = actMenuSettings
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        GroupIndex = 20
        Hint = 'Exit Application'
        OnClick = Exit1Click
      end
    end
    object Options2: TMenuItem
      Caption = 'Help'
      GroupIndex = 20
      object HelpContents1: TMenuItem
        Action = actHelpContents
        GroupIndex = 1
      end
      object HelpContents2: TMenuItem
        Caption = '-'
        GroupIndex = 1
      end
      object AboutJDHoardHelper1: TMenuItem
        Action = actAbout
        GroupIndex = 1
      end
    end
  end
end
