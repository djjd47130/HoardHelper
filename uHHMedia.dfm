object frmHHMedia: TfrmHHMedia
  Left = 0
  Top = 0
  Caption = 'Search Media'
  ClientHeight = 553
  ClientWidth = 896
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pMain: TPanel
    Left = 0
    Top = 41
    Width = 896
    Height = 476
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    object pSearch: TPanel
      Left = 0
      Top = 0
      Width = 256
      Height = 476
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      Visible = False
      DesignSize = (
        256
        476)
      object Label1: TLabel
        Left = 16
        Top = 21
        Width = 37
        Height = 13
        Caption = 'Search:'
      end
      object Label2: TLabel
        Left = 16
        Top = 117
        Width = 28
        Height = 13
        Caption = 'Filter:'
      end
      object Label3: TLabel
        Left = 16
        Top = 71
        Width = 37
        Height = 13
        Caption = 'Library:'
      end
      object txtSearchText: TEdit
        Left = 16
        Top = 40
        Width = 225
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object txtSearchFilter: TEdit
        Left = 16
        Top = 136
        Width = 225
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object cboSearchLibrary: TComboBox
        Left = 16
        Top = 90
        Width = 225
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemIndex = 0
        TabOrder = 2
        Text = 'All Libraries'
        Items.Strings = (
          'All Libraries')
      end
      object CheckBox1: TCheckBox
        Left = 120
        Top = 117
        Width = 121
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = 'Inherit from Library'
        TabOrder = 3
      end
      object Panel1: TPanel
        Left = 0
        Top = 435
        Width = 256
        Height = 41
        Align = alBottom
        TabOrder = 4
        object JDFontButton5: TJDFontButton
          Left = 110
          Top = 1
          Width = 145
          Height = 39
          Cursor = crHandPoint
          Hint = 'Apply Search'
          Align = alRight
          DrawStyle = fdTransparent
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Image.AutoSize = False
          Image.Text = #61537
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
          ImagePosition = fpImgRight
          ShowHint = True
          SubTextFont.Charset = DEFAULT_CHARSET
          SubTextFont.Color = clGray
          SubTextFont.Height = -11
          SubTextFont.Name = 'Tahoma'
          SubTextFont.Style = []
          TabOrder = 0
          Text = 'Apply Search'
        end
      end
      object CheckBox2: TCheckBox
        Left = 168
        Top = 20
        Width = 73
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = 'Recursive'
        TabOrder = 5
      end
    end
    object lstMedia: TListView
      Left = 363
      Top = 0
      Width = 533
      Height = 476
      Align = alRight
      Checkboxes = True
      Columns = <
        item
          Caption = 'Filename'
          Width = 250
        end
        item
          Caption = 'Type'
          Width = 120
        end
        item
          Caption = 'Size'
          Width = 120
        end>
      TabOrder = 1
      ViewStyle = vsReport
    end
  end
  object Toolbar: TPanel
    Left = 0
    Top = 0
    Width = 896
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel1: TBevel
      AlignWithMargins = True
      Left = 52
      Top = 3
      Width = 6
      Height = 35
      Align = alLeft
      Shape = bsRightLine
      ExplicitLeft = 43
      ExplicitTop = 1
    end
    object Bevel2: TBevel
      AlignWithMargins = True
      Left = 162
      Top = 3
      Width = 6
      Height = 35
      Align = alLeft
      Shape = bsRightLine
      ExplicitLeft = 309
    end
    object JDFontButton1: TJDFontButton
      Left = 0
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
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
      TabOrder = 0
      Text = 'New Script'
      OnClick = JDFontButton1Click
    end
    object JDFontButton2: TJDFontButton
      Left = 61
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Hint = 'Auto Check Items'
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61510
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
      Text = 'Auto Check Items'
    end
    object JDFontButton3: TJDFontButton
      Left = 110
      Top = 0
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61561
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
  end
  object MM: TMainMenu
    Left = 288
    Top = 185
    object Media1: TMenuItem
      Caption = 'Media'
      GroupIndex = 1
      object Media2: TMenuItem
        Caption = 'Search Media'
      end
      object AutoCheckItems1: TMenuItem
        Caption = 'Auto-Check Items'
        object CheckAll1: TMenuItem
          Caption = 'Check All'
        end
        object CheckNone1: TMenuItem
          Caption = 'Check None'
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object FileType1: TMenuItem
          Caption = 'File Type'
          object MP4Files1: TMenuItem
            Caption = 'MP4 Files'
          end
          object MP4Files2: TMenuItem
            Caption = 'AVI Files'
          end
          object MKVFiles1: TMenuItem
            Caption = 'MKV Files'
          end
        end
      end
      object CheckedItems1: TMenuItem
        Caption = 'Checked Items'
        object Move1: TMenuItem
          Caption = 'Move'
          object oNewLocation1: TMenuItem
            Caption = 'To New Location...'
          end
          object N2: TMenuItem
            Caption = '-'
          end
          object N3: TMenuItem
            Caption = 'Into Subdirectory'
          end
          object UptoParentDirectory1: TMenuItem
            Caption = 'Up to Parent Directory'
          end
        end
        object Move2: TMenuItem
          Caption = 'Copy'
          object oLocation1: TMenuItem
            Caption = 'To Location...'
          end
          object oLocation2: TMenuItem
            Caption = '-'
          end
          object IntoSubdirectory1: TMenuItem
            Caption = 'Into Subdirectory'
          end
          object IntoSubdirectory2: TMenuItem
            Caption = 'Up to Parent Directory'
          end
        end
        object Delete1: TMenuItem
          Caption = 'Delete'
          object MovetoTrash1: TMenuItem
            Caption = 'Move to Trash'
          end
          object MovetoTrash2: TMenuItem
            Caption = 'Permanently (NO UNDO)'
          end
        end
      end
    end
  end
end
