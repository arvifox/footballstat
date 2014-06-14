object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'FStat'
  ClientHeight = 452
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object sbStatus: TStatusBar
    Left = 0
    Top = 424
    Width = 734
    Height = 28
    Panels = <>
  end
  object mmMain: TMainMenu
    Left = 664
    Top = 16
    object N1: TMenuItem
      Caption = 'Football'
      object miTournamentSelect: TMenuItem
        Caption = 'Tournaments'
        OnClick = miTournamentSelectClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miQuit: TMenuItem
        Caption = 'Exit'
        ShortCut = 32883
        OnClick = miQuitClick
      end
    end
    object miData: TMenuItem
      Caption = 'Data Directory'
      object miTypeData: TMenuItem
        Caption = 'Type data directory'
        OnClick = miTypeDataClick
      end
      object mGeography: TMenuItem
        Caption = 'Geography'
        OnClick = mGeographyClick
      end
      object miPeople: TMenuItem
        Caption = 'People'
        OnClick = miPeopleClick
      end
      object miOrganization: TMenuItem
        Caption = 'Organization'
        OnClick = miOrganizationClick
      end
      object miTournamentpattern: TMenuItem
        Caption = 'Tournament pattern'
        OnClick = miTournamentpatternClick
      end
      object miTournament: TMenuItem
        Caption = 'Tournament org'
      end
      object miTeam: TMenuItem
        Caption = 'Team'
      end
    end
    object miService: TMenuItem
      Caption = 'Service'
      object miOptions: TMenuItem
        Caption = 'Options'
        OnClick = miOptionsClick
      end
      object miTest: TMenuItem
        Caption = 'test'
        OnClick = miTestClick
      end
    end
    object miHelp: TMenuItem
      Caption = 'Help'
      object miAbout: TMenuItem
        Caption = 'About FStat'
      end
    end
  end
end
