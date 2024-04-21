inherited frmHHAbout: TfrmHHAbout
  Caption = 'About'
  ClientHeight = 307
  ClientWidth = 307
  ExplicitWidth = 323
  ExplicitHeight = 346
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 301
    Height = 30
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'About JD Hoard Helper'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 686
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 37
    Width = 301
    Height = 19
    Margins.Top = 1
    Margins.Bottom = 1
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Version 0.6 [BETA]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 8
    Top = 102
    Width = 291
    Height = 85
    Margins.Left = 8
    Margins.Right = 8
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'Have a huge horrible hideous hoard of data? Herd your heinous he' +
      'ctic hell of a hoard with the help this collection of media mana' +
      'gement tools!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
    ExplicitLeft = 3
    ExplicitTop = 68
    ExplicitWidth = 686
  end
  object Label4: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 58
    Width = 301
    Height = 19
    Margins.Top = 1
    Margins.Bottom = 1
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Created by Jerry Dodge'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label5: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 79
    Width = 301
    Height = 19
    Cursor = crHandPoint
    Margins.Top = 1
    Margins.Bottom = 1
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'https://jerryszone.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 15182194
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Layout = tlCenter
    StyleElements = [seClient, seBorder]
    OnClick = Label5Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 190
    Width = 307
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -3
    ExplicitTop = 145
    ExplicitWidth = 692
    object JDFontButton1: TJDFontButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 301
      Height = 35
      Action = frmHHMain.actHelpContents
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Image.AutoSize = False
      Image.Text = #57715
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -21
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Overlay.Text = #57715
      Overlay.Font.Charset = DEFAULT_CHARSET
      Overlay.Font.Color = clWindowText
      Overlay.Font.Height = -7
      Overlay.Font.Name = 'FontAwesome'
      Overlay.Font.Style = []
      Overlay.Font.Quality = fqAntialiased
      Overlay.Position = foNone
      Overlay.Margin = 3
      ImagePosition = fpImgNone
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 0
      Text = 'Help Contents'
      ExplicitLeft = 328
      ExplicitTop = 16
      ExplicitWidth = 100
      ExplicitHeight = 30
    end
  end
end
