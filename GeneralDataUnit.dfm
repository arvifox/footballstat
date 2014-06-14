object frmGeneralData: TfrmGeneralData
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FStat'
  ClientHeight = 401
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbTypeDataDirectory: TListBox
    Left = 0
    Top = 41
    Width = 161
    Height = 319
    Align = alLeft
    ExtendedSelect = False
    ItemHeight = 13
    Items.Strings = (
      'Card reason'
      'Card type'
      'Condition type'
      'Distance pass'
      'Distance type'
      'Foul type'
      'Injury type'
      'Match events type'
      'Match result'
      'Post'
      'Organization type'
      'Pass result'
      'Penalty attack'
      'Penalty goalkeeper'
      'Place type'
      'Position classic'
      'Position play'
      'Referee match type'
      'Shot result'
      'Stage group name'
      'Stage name'
      'Stage pattern name'
      'Stage pattern type'
      'Statistics data'
      'Statistics type'
      'Substitution reason'
      'Team type'
      'Team type age'
      'Team type general'
      'Team type sex'
      'Tournament officials type'
      'Tournament pattern field')
    TabOrder = 0
    OnClick = lbTypeDataDirectoryClick
    ExplicitHeight = 410
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 360
    Width = 595
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 451
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 41
    Align = alTop
    TabOrder = 2
  end
  object dbgTypeData: TDBGrid
    Left = 167
    Top = 47
    Width = 395
    Height = 163
    DataSource = dm.dsSource
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
