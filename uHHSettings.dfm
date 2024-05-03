inherited frmHHSettings: TfrmHHSettings
  Caption = 'Settings'
  ClientHeight = 464
  ClientWidth = 857
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 873
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 13
  object Pages: TPageControl
    Left = 0
    Top = 33
    Width = 857
    Height = 400
    ActivePage = tabFilters
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tabGeneral: TTabSheet
      Caption = 'tabGeneral'
      ExplicitWidth = 858
      ExplicitHeight = 340
      object sbGeneral: TScrollBox
        Left = 0
        Top = 0
        Width = 849
        Height = 281
        VertScrollBar.Tracking = True
        Align = alTop
        BorderStyle = bsNone
        TabOrder = 0
        ExplicitWidth = 858
        object Panel5: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 50
          Width = 843
          Height = 41
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Application Theme'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 852
          object ComboBox2: TComboBox
            AlignWithMargins = True
            Left = 642
            Top = 5
            Width = 198
            Height = 27
            Margins.Top = 5
            Margins.Bottom = 5
            Align = alRight
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = 'Carbon'
            Items.Strings = (
              'Carbon')
            ExplicitLeft = 651
          end
        end
        object Panel10: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 843
          Height = 41
          Align = alTop
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'UNDER DEVELOPMENT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          StyleElements = [seClient, seBorder]
          ExplicitWidth = 852
        end
        object pRememberSize: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 97
          Width = 843
          Height = 41
          Cursor = crHandPoint
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Remember Size and Position'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ExplicitTop = 162
          ExplicitWidth = 852
          object swRememberSize: TToggleSwitch
            AlignWithMargins = True
            Left = 760
            Top = 3
            Height = 33
            Align = alRight
            TabOrder = 0
            ExplicitLeft = 772
            ExplicitTop = 0
            ExplicitHeight = 21
          end
        end
      end
    end
    object tabLibraries: TTabSheet
      Caption = 'tabLibraries'
      ImageIndex = 1
      ExplicitWidth = 858
      ExplicitHeight = 340
    end
    object tabIndexing: TTabSheet
      Caption = 'tabIndexing'
      ImageIndex = 2
      ExplicitWidth = 858
      ExplicitHeight = 340
      object sbIndexing: TScrollBox
        Left = 0
        Top = 0
        Width = 849
        Height = 249
        VertScrollBar.Tracking = True
        Align = alTop
        BorderStyle = bsNone
        TabOrder = 0
        ExplicitWidth = 858
        object pEnableIndexing: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 50
          Width = 843
          Height = 41
          Cursor = crHandPoint
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Enable Indexing'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = pEnableIndexingClick
          ExplicitWidth = 852
          object swEnableIndexing: TToggleSwitch
            AlignWithMargins = True
            Left = 760
            Top = 3
            Height = 33
            Align = alRight
            TabOrder = 0
            OnClick = swEnableIndexingClick
            ExplicitLeft = 772
            ExplicitTop = 0
            ExplicitHeight = 21
          end
        end
        object Panel4: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 97
          Width = 843
          Height = 41
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Index Data Location'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ExplicitWidth = 852
          object Edit1: TEdit
            AlignWithMargins = True
            Left = 394
            Top = 5
            Width = 405
            Height = 29
            Margins.Top = 5
            Margins.Bottom = 5
            Align = alRight
            ReadOnly = True
            TabOrder = 0
            Text = 'D:\Media\Index'
            ExplicitLeft = 403
            ExplicitHeight = 27
          end
          object JDFontButton8: TJDFontButton
            Left = 802
            Top = 0
            Width = 41
            Height = 39
            Cursor = crHandPoint
            Hint = 'Browse...'
            Align = alRight
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
            Text = 'btnSelectDir'
            ExplicitLeft = 805
          end
        end
        object Panel9: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 843
          Height = 41
          Align = alTop
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'UNDER DEVELOPMENT - Build index of media meta data / tags'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          StyleElements = [seClient, seBorder]
          OnClick = pAutoBackupsEnabledClick
          ExplicitWidth = 852
        end
      end
    end
    object tabMigration: TTabSheet
      Caption = 'tabMigration'
      ImageIndex = 6
      ExplicitWidth = 858
      ExplicitHeight = 340
      object sbMigration: TScrollBox
        Left = 0
        Top = 0
        Width = 849
        Height = 273
        VertScrollBar.Tracking = True
        Align = alTop
        BorderStyle = bsNone
        TabOrder = 0
        ExplicitWidth = 858
        object pEnableMigration: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 50
          Width = 843
          Height = 41
          Cursor = crHandPoint
          Hint = 
            'Activate the mechanism to automatically organize your heaping ho' +
            'ard'
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Enable Media Migration'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = pEnableMigrationClick
          ExplicitWidth = 852
          object swEnableMigration: TToggleSwitch
            AlignWithMargins = True
            Left = 760
            Top = 3
            Height = 33
            Hint = 
              'Activate the mechanism to automatically organize your heaping ho' +
              'ard'
            Align = alRight
            TabOrder = 0
            OnClick = swEnableMigrationClick
            ExplicitLeft = 772
            ExplicitTop = 0
            ExplicitHeight = 21
          end
        end
        object Panel6: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 97
          Width = 843
          Height = 41
          Hint = 'How to handle original hoard during migration'
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Migration Method'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          ExplicitWidth = 852
          object ComboBox3: TComboBox
            AlignWithMargins = True
            Left = 567
            Top = 5
            Width = 273
            Height = 27
            Hint = 'How to handle original hoard during migration'
            Margins.Top = 5
            Margins.Bottom = 5
            Align = alRight
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = 'Leave In Place (Organize)'
            Items.Strings = (
              'Leave In Place (Organize)'
              'Copy Media (Keep Original)'
              'Move Data (Permanent)')
            ExplicitLeft = 576
          end
        end
        object Panel8: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 843
          Height = 41
          Align = alTop
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 
            'UNDER DEVELOPMENT - Automatically migrate media to new folder st' +
            'ructure'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          StyleElements = [seClient, seBorder]
          OnClick = pAutoBackupsEnabledClick
          ExplicitWidth = 852
        end
      end
    end
    object tabBackups: TTabSheet
      Caption = 'tabBackups'
      ImageIndex = 3
      ExplicitWidth = 858
      ExplicitHeight = 340
      object sbBackups: TScrollBox
        Left = 0
        Top = 0
        Width = 849
        Height = 289
        Align = alTop
        BorderStyle = bsNone
        TabOrder = 0
        ExplicitWidth = 858
        object pAutoBackupsEnabled: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 97
          Width = 843
          Height = 41
          Cursor = crHandPoint
          Hint = 'Enable automatic backups during file operations'
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Auto Backups Enabled'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = pAutoBackupsEnabledClick
          ExplicitWidth = 852
          object swAutoBackupsEnabled: TToggleSwitch
            AlignWithMargins = True
            Left = 760
            Top = 3
            Height = 33
            Hint = 'Enable automatic backups during file operations'
            Align = alRight
            TabOrder = 0
            OnClick = swAutoBackupsEnabledClick
            ExplicitLeft = 772
            ExplicitTop = 0
            ExplicitHeight = 21
          end
        end
        object Panel2: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 144
          Width = 843
          Height = 41
          Hint = 'Choose the location where files shall be  backed up'
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Backup Location'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          ExplicitWidth = 852
          object txtBackupDir: TEdit
            AlignWithMargins = True
            Left = 394
            Top = 5
            Width = 405
            Height = 29
            Hint = 'Choose the location where files shall be  backed up'
            Margins.Top = 5
            Margins.Bottom = 5
            Align = alRight
            ReadOnly = True
            TabOrder = 0
            Text = 'D:\Media\Backup'
            ExplicitLeft = 403
            ExplicitHeight = 27
          end
          object btnSelectDir: TJDFontButton
            Left = 802
            Top = 0
            Width = 41
            Height = 39
            Cursor = crHandPoint
            Hint = 'Choose the location where files shall be  backed up'
            Align = alRight
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
            Text = 'btnSelectDir'
            OnClick = btnSelectDirClick
            ExplicitLeft = 811
          end
        end
        object Panel3: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 191
          Width = 843
          Height = 41
          Hint = 'How to handle files which have already been backed up previously'
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'If Backup Already Exists'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          ExplicitWidth = 852
          object ComboBox1: TComboBox
            AlignWithMargins = True
            Left = 642
            Top = 5
            Width = 198
            Height = 27
            Hint = 'How to handle files which have already been backed up previously'
            Margins.Top = 5
            Margins.Bottom = 5
            Align = alRight
            Style = csDropDownList
            ItemIndex = 1
            TabOrder = 0
            Text = 'Create Copies'
            Items.Strings = (
              'Ignore'
              'Create Copies'
              'Overwrite')
            ExplicitLeft = 643
            ExplicitTop = 2
          end
        end
        object Panel1: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 50
          Width = 843
          Height = 41
          Cursor = crHandPoint
          Hint = 'The amount of data currently in your backup directory'
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Current Backup Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = Panel1Click
          ExplicitWidth = 852
          object Label1: TLabel
            AlignWithMargins = True
            Left = 729
            Top = 3
            Width = 111
            Height = 33
            Hint = 'The amount of data currently in your backup directory'
            Align = alRight
            Alignment = taRightJustify
            Caption = '0 Files (0 MB)'
            ParentShowHint = False
            ShowHint = True
            Layout = tlCenter
            ExplicitLeft = 738
            ExplicitHeight = 19
          end
          object btnPurgeBackups: TJDFontButton
            AlignWithMargins = True
            Left = 643
            Top = 3
            Width = 80
            Height = 33
            Cursor = crHandPoint
            Hint = 'Delete all backup files'
            Align = alRight
            DrawStyle = fdHybrid
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
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
            ShowHint = True
            StyleColors = [scBack, scFrame]
            SubTextFont.Charset = DEFAULT_CHARSET
            SubTextFont.Color = clGray
            SubTextFont.Height = -11
            SubTextFont.Name = 'Tahoma'
            SubTextFont.Style = []
            TabOrder = 0
            TabStop = False
            Text = 'Purge'
            ExplicitLeft = 652
          end
        end
        object Panel7: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 843
          Height = 41
          Align = alTop
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'UNDER DEVELOPMENT - Automatic backups during file operations'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          StyleElements = [seClient, seBorder]
          OnClick = pAutoBackupsEnabledClick
          ExplicitWidth = 852
        end
      end
    end
    object tabScripting: TTabSheet
      Caption = 'tabScripting'
      ImageIndex = 4
      ExplicitWidth = 858
      ExplicitHeight = 340
      object sbScripting: TScrollBox
        Left = 0
        Top = 0
        Width = 849
        Height = 273
        VertScrollBar.Tracking = True
        Align = alTop
        BorderStyle = bsNone
        TabOrder = 0
        ExplicitWidth = 858
        object pSyntaxHighlighting: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 50
          Width = 843
          Height = 41
          Cursor = crHandPoint
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Syntax Highlighting'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = pSyntaxHighlightingClick
          ExplicitWidth = 852
          object swSyntaxHighlighting: TToggleSwitch
            AlignWithMargins = True
            Left = 760
            Top = 3
            Height = 33
            Align = alRight
            State = tssOn
            TabOrder = 0
            ExplicitLeft = 772
            ExplicitTop = 0
            ExplicitHeight = 21
          end
        end
        object pWordWrap: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 97
          Width = 843
          Height = 41
          Cursor = crHandPoint
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Word Wrap'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = pWordWrapClick
          ExplicitWidth = 852
          object swWordWrap: TToggleSwitch
            AlignWithMargins = True
            Left = 760
            Top = 3
            Height = 33
            Align = alRight
            TabOrder = 0
            OnClick = swWordWrapClick
            ExplicitLeft = 772
            ExplicitTop = 0
            ExplicitHeight = 21
          end
        end
        object Panel11: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 843
          Height = 41
          Align = alTop
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'UNDER DEVELOPMENT - Settings to control scripting behavior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          StyleElements = [seClient, seBorder]
          OnClick = pAutoBackupsEnabledClick
          ExplicitWidth = 852
        end
        object Panel13: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 144
          Width = 843
          Height = 41
          Cursor = crHandPoint
          Hint = 'Open the common script which is included in all executions'
          Align = alTop
          Alignment = taLeftJustify
          BevelEdges = [beBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Open Common Script'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = Panel13Click
          ExplicitTop = 161
        end
      end
    end
    object tabFilters: TTabSheet
      Caption = 'tabFilters'
      ImageIndex = 5
      ExplicitWidth = 858
      ExplicitHeight = 340
      object lstFilters: TListView
        AlignWithMargins = True
        Left = 3
        Top = 91
        Width = 843
        Height = 254
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Caption = 'Name'
            Width = 150
          end
          item
            Caption = 'Filter'
            Width = 400
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HideSelection = False
        HotTrackStyles = [htHandPoint, htUnderlineHot]
        Items.ItemData = {
          05B20000000200000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
          000B56006900640065006F002000460069006C0065007300112A002E004D0050
          0034003B002A002E004100560049003B002A002E004D004B0056001859CD1800
          000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000000B4100750064006900
          6F002000460069006C0065007300112A002E004D00500033003B002A002E0057
          00410056003B002A002E0057004D0041004828A83EFFFFFFFF}
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
        ExplicitTop = 47
        ExplicitWidth = 824
        ExplicitHeight = 222
      end
      object Toolbar: TPanel
        Left = 0
        Top = 47
        Width = 849
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ExplicitWidth = 858
        object btnNewLib: TJDFontButton
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
      object Panel12: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 843
        Height = 41
        Align = alTop
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = 
          'UNDER DEVELOPMENT - A central registration of file extension fil' +
          'ters'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        StyleElements = [seClient, seBorder]
        ExplicitWidth = 852
      end
    end
  end
  object pMenu: TPanel
    Left = 0
    Top = 0
    Width = 857
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 866
    object JDFontButton1: TJDFontButton
      Left = 0
      Top = 0
      Width = 117
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Image.AutoSize = False
      Image.Text = #61612
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
      Margin = 8
      Spacing = 8
      StyleColors = [scBack, scFrame]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 0
      Text = 'General'
      OnClick = TabButtonClick
    end
    object JDFontButton2: TJDFontButton
      Tag = 1
      Left = 117
      Top = 0
      Width = 117
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Image.AutoSize = False
      Image.Text = #61451
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
      Margin = 8
      Spacing = 8
      StyleColors = [scBack, scFrame]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 1
      Text = 'Libraries'
      OnClick = TabButtonClick
    end
    object JDFontButton3: TJDFontButton
      Tag = 2
      Left = 234
      Top = 0
      Width = 117
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Image.AutoSize = False
      Image.Text = #61485
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
      Margin = 8
      Spacing = 8
      StyleColors = [scBack, scFrame]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 2
      Text = 'Indexing'
      OnClick = TabButtonClick
    end
    object JDFontButton4: TJDFontButton
      Tag = 4
      Left = 481
      Top = 0
      Width = 117
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Image.AutoSize = False
      Image.Text = #61714
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
      Margin = 8
      Spacing = 8
      StyleColors = [scBack, scFrame]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 4
      Text = 'Backups'
      OnClick = TabButtonClick
    end
    object JDFontButton5: TJDFontButton
      Tag = 5
      Left = 598
      Top = 0
      Width = 117
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
      Margin = 8
      Spacing = 8
      StyleColors = [scBack, scFrame]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 5
      Text = 'Scripting'
      OnClick = TabButtonClick
    end
    object JDFontButton6: TJDFontButton
      Tag = 6
      Left = 715
      Top = 0
      Width = 117
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Image.AutoSize = False
      Image.Text = #61616
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
      Margin = 8
      Spacing = 8
      StyleColors = [scBack, scFrame]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 6
      Text = 'Filters'
      OnClick = TabButtonClick
    end
    object JDFontButton7: TJDFontButton
      Tag = 3
      Left = 351
      Top = 0
      Width = 130
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Image.AutoSize = False
      Image.Text = #61561
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
      Margin = 8
      Spacing = 8
      StyleColors = [scBack, scFrame]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 3
      Text = 'Migration'
      OnClick = TabButtonClick
    end
  end
  object dlgOpenDir: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Left = 40
    Top = 56
  end
end
