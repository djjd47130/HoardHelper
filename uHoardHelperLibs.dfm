object frmLibs: TfrmLibs
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'JD Hoard Helper Libraries'
  ClientHeight = 524
  ClientWidth = 758
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 479
    Width = 758
    Height = 45
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 405
    ExplicitWidth = 602
    object btnDone: TJDFontButton
      Left = 673
      Top = 1
      Width = 84
      Height = 43
      Cursor = crHandPoint
      Action = actDone
      Align = alRight
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61452
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
      Margin = 8
      ShowHint = True
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 0
      Text = 'Done'
      ExplicitLeft = 517
    end
  end
  object pMain: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 435
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 602
    ExplicitHeight = 361
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 758
      Height = 33
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Configure your media libraries'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitTop = -24
      ExplicitWidth = 605
    end
    object Toolbar: TPanel
      Left = 0
      Top = 33
      Width = 758
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitWidth = 602
      object lblEditing: TLabel
        AlignWithMargins = True
        Left = 581
        Top = 3
        Width = 174
        Height = 35
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'View Library'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        StyleElements = [seClient, seBorder]
        ExplicitLeft = 456
      end
      object btnNewLib: TJDFontButton
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
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 0
        Text = 'New Library'
      end
      object btnEditLib: TJDFontButton
        Left = 49
        Top = 0
        Width = 49
        Height = 41
        Cursor = crHandPoint
        Action = actEdit
        Align = alLeft
        DrawStyle = fdTransparent
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61504
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -21
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcYellow
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
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 1
        Text = 'Edit Library'
      end
      object btnSaveLib: TJDFontButton
        Left = 147
        Top = 0
        Width = 49
        Height = 41
        Cursor = crHandPoint
        Action = actSave
        Align = alLeft
        DrawStyle = fdTransparent
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61452
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
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 3
        Text = 'Save Library'
      end
      object btnCancelLib: TJDFontButton
        Left = 196
        Top = 0
        Width = 49
        Height = 41
        Cursor = crHandPoint
        Action = actCancel
        Align = alLeft
        DrawStyle = fdTransparent
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61453
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
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 4
        Text = 'Cancel Changes'
      end
      object btnDeleteLib: TJDFontButton
        Left = 98
        Top = 0
        Width = 49
        Height = 41
        Cursor = crHandPoint
        Action = actDelete
        Align = alLeft
        DrawStyle = fdTransparent
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61544
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
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 2
        Text = 'Delete Library'
      end
    end
    object lstLibraries: TListView
      AlignWithMargins = True
      Left = 3
      Top = 77
      Width = 752
      Height = 222
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = 'Name'
          Width = 150
        end
        item
          Caption = 'Type'
          Width = 150
        end
        item
          Caption = 'Path'
          Width = 400
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      HideSelection = False
      HotTrackStyles = [htHandPoint, htUnderlineHot]
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 1
      ViewStyle = vsReport
      OnSelectItem = lstLibrariesSelectItem
      ExplicitLeft = 5
    end
    object Panel2: TPanel
      Left = 0
      Top = 346
      Width = 758
      Height = 89
      Align = alBottom
      TabOrder = 2
      ExplicitTop = 272
      ExplicitWidth = 602
      DesignSize = (
        758
        89)
      object Label2: TLabel
        Left = 18
        Top = 16
        Width = 67
        Height = 13
        Caption = 'Library Name:'
      end
      object Label3: TLabel
        Left = 505
        Top = 16
        Width = 64
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Library Type:'
        ExplicitLeft = 380
      end
      object Label4: TLabel
        Left = 18
        Top = 51
        Width = 80
        Height = 13
        Caption = 'Library Location:'
      end
      object txtName: TEdit
        Left = 112
        Top = 13
        Width = 358
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 0
        ExplicitWidth = 202
      end
      object txtDir: TEdit
        Left = 112
        Top = 48
        Width = 596
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 1
        ExplicitWidth = 440
      end
      object cboType: TComboBox
        Left = 597
        Top = 13
        Width = 147
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        Enabled = False
        TabOrder = 2
        Items.Strings = (
          'General'
          'Movies'
          'Shows'
          'Videos'
          'Music'
          'Pictures'
          'Documents'
          'Applications')
        ExplicitLeft = 441
      end
      object btnSelectDir: TJDFontButton
        Left = 714
        Top = 48
        Width = 30
        Height = 21
        Cursor = crHandPoint
        Hint = 'Browse...'
        Anchors = [akTop, akRight]
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61564
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -16
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
        TabOrder = 3
        Text = 'btnSelectDir'
        OnClick = btnSelectDirClick
        ExplicitLeft = 558
      end
    end
  end
  object Acts: TActionList
    Left = 432
    Top = 176
    object actNew: TAction
      Caption = 'New Library'
      Hint = 'New Library'
      ShortCut = 16462
      OnExecute = actNewExecute
    end
    object actEdit: TAction
      Caption = 'Edit Library'
      Enabled = False
      Hint = 'Edit Library'
      ShortCut = 16453
      OnExecute = actEditExecute
    end
    object actDelete: TAction
      Caption = 'Delete Library'
      Enabled = False
      Hint = 'Delete Library'
      ShortCut = 46
      OnExecute = actDeleteExecute
    end
    object actSave: TAction
      Caption = 'Save Library'
      Enabled = False
      Hint = 'Save Library'
      ShortCut = 16467
      OnExecute = actSaveExecute
    end
    object actCancel: TAction
      Caption = 'Cancel Changes'
      Enabled = False
      Hint = 'Cancel Changes'
      ShortCut = 27
      OnExecute = actCancelExecute
    end
    object actDone: TAction
      Caption = 'Done'
      Hint = 'Done'
      OnExecute = actDoneExecute
    end
  end
  object dlgSelectDir: TRzSelectFolderDialog
    Title = 'Select Library Location'
    ToolBtnVisualStyle = vsGradient
    Left = 360
    Top = 320
  end
end
