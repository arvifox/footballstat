object frmMatch: TfrmMatch
  Left = 0
  Top = 0
  Caption = 'FStat'
  ClientHeight = 592
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbtHomeTeam: TDBText
    Left = 104
    Top = 47
    Width = 65
    Height = 17
    DataField = 'hometeamname'
    DataSource = dsMatch
  end
  object dbtGuestTeam: TDBText
    Left = 528
    Top = 47
    Width = 65
    Height = 17
    DataField = 'guestteamname'
    DataSource = dsMatch
  end
  object Label1: TLabel
    Left = 8
    Top = 104
    Width = 29
    Height = 13
    Caption = 'Match'
  end
  object Label2: TLabel
    Left = 192
    Top = 104
    Width = 39
    Height = 13
    Caption = 'Referee'
  end
  object Label3: TLabel
    Left = 200
    Top = 136
    Width = 28
    Height = 13
    Caption = 'coach'
  end
  object Label4: TLabel
    Left = 296
    Top = 160
    Width = 57
    Height = 13
    Caption = 'city stadium'
  end
  object Label5: TLabel
    Left = 152
    Top = 184
    Width = 36
    Height = 13
    Caption = #1089#1090#1072#1076#1080#1103
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 701
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 551
    Width = 701
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object pcMatch: TPageControl
    Left = 0
    Top = 212
    Width = 701
    Height = 339
    ActivePage = tsOverview
    Align = alBottom
    TabOrder = 2
    object tsOverview: TTabSheet
      Caption = 'Overview'
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid1: TDBGrid
        Left = 80
        Top = 40
        Width = 577
        Height = 169
        DataSource = dsMatch
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tsLineup: TTabSheet
      Caption = 'Line-up'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tsReport: TTabSheet
      Caption = 'Report'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tsOfficials: TTabSheet
      Caption = 'Officials'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tsStatistics: TTabSheet
      Caption = 'Statistics'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tsPreview: TTabSheet
      Caption = 'Preview'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tsSummary: TTabSheet
      Caption = 'Summary'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tsQuotes: TTabSheet
      Caption = 'Quotes'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object dbeGoalHome: TDBEdit
    Left = 256
    Top = 44
    Width = 25
    Height = 21
    DataField = 'goal_home_team'
    DataSource = dsMatch
    TabOrder = 3
  end
  object dbeGoalGuest: TDBEdit
    Left = 320
    Top = 44
    Width = 25
    Height = 21
    DataField = 'goal_guest_team'
    DataSource = dsMatch
    TabOrder = 4
  end
  object dbeNumber: TDBEdit
    Left = 43
    Top = 101
    Width = 30
    Height = 21
    DataField = 'match_number'
    DataSource = dsMatch
    TabOrder = 5
  end
  object dbeDate: TDBEdit
    Left = 8
    Top = 128
    Width = 121
    Height = 21
    DataField = 'match_date'
    DataSource = dsMatch
    TabOrder = 6
  end
  object dbeTime: TDBEdit
    Left = 8
    Top = 155
    Width = 121
    Height = 21
    DataField = 'match_time_begin'
    DataSource = dsMatch
    TabOrder = 7
  end
  object adotMatch: TADOTable
    Connection = dm.ADOConnection
    CursorType = ctStatic
    TableName = 'T_Match'
    Left = 608
    Top = 96
    object adotMatchid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object adotMatchid_home_team: TIntegerField
      FieldName = 'id_home_team'
      Visible = False
    end
    object adotMatchhometeamname: TStringField
      FieldKind = fkLookup
      FieldName = 'hometeamname'
      LookupDataSet = adotTeam
      LookupKeyFields = 'id'
      LookupResultField = 'team_name'
      KeyFields = 'id_home_team'
      Size = 30
      Lookup = True
    end
    object adotMatchid_guest_team: TIntegerField
      FieldName = 'id_guest_team'
      Visible = False
    end
    object adotMatchguestteamname: TStringField
      FieldKind = fkLookup
      FieldName = 'guestteamname'
      LookupDataSet = adotTeam
      LookupKeyFields = 'id'
      LookupResultField = 'team_name'
      KeyFields = 'id_guest_team'
      Size = 30
      Lookup = True
    end
    object adotMatchgoal_home_team: TIntegerField
      FieldName = 'goal_home_team'
    end
    object adotMatchgoal_guest_team: TIntegerField
      FieldName = 'goal_guest_team'
    end
    object adotMatchid_tournament: TIntegerField
      FieldName = 'id_tournament'
      Visible = False
    end
    object adotMatchid_stage_pattern: TIntegerField
      FieldName = 'id_stage_pattern'
      Visible = False
    end
    object adotMatchmatch_date: TDateTimeField
      FieldName = 'match_date'
    end
    object adotMatchmatch_time_begin: TDateTimeField
      FieldName = 'match_time_begin'
    end
    object adotMatchmatch_number: TIntegerField
      FieldName = 'match_number'
    end
    object adotMatchid_stadium: TIntegerField
      FieldName = 'id_stadium'
      Visible = False
    end
    object adotMatchtactical_lineup: TWideMemoField
      FieldName = 'tactical_line-up'
      Visible = False
      BlobType = ftWideMemo
    end
    object adotMatchid_match_result: TIntegerField
      FieldName = 'id_match_result'
      Visible = False
    end
    object adotMatchadd_time1: TIntegerField
      FieldName = 'add_time1'
      Visible = False
    end
    object adotMatchadd_time2: TIntegerField
      FieldName = 'add_time2'
      Visible = False
    end
    object adotMatchadd_extra_time1: TWideStringField
      FieldName = 'add_extra_time1'
      Visible = False
      Size = 255
    end
    object adotMatchadd_extra_time2: TWideStringField
      FieldName = 'add_extra_time2'
      Visible = False
      Size = 255
    end
    object adotMatchaet: TBooleanField
      FieldName = 'aet'
      Visible = False
    end
    object adotMatchpso: TBooleanField
      FieldName = 'pso'
      Visible = False
    end
    object adotMatchpso_home_team: TIntegerField
      FieldName = 'pso_home_team'
      Visible = False
    end
    object adotMatchpso_guest_team: TIntegerField
      FieldName = 'pso_guest_team'
      Visible = False
    end
  end
  object dsMatch: TDataSource
    DataSet = adotMatch
    Left = 528
    Top = 96
  end
  object adotTeam: TADOTable
    Connection = dm.ADOConnection
    CursorType = ctStatic
    TableName = 'T_Team'
    Left = 432
    Top = 96
  end
end
