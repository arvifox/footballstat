object frmTournamentPattern: TfrmTournamentPattern
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FStat'
  ClientHeight = 384
  ClientWidth = 822
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 822
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 343
    Width = 822
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object pnlPattern: TPanel
    Left = 0
    Top = 41
    Width = 209
    Height = 302
    Align = alLeft
    TabOrder = 2
    object dbgPattern: TDBGrid
      Left = 1
      Top = 1
      Width = 207
      Height = 300
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pcPattern: TPageControl
    Left = 209
    Top = 41
    Width = 613
    Height = 302
    ActivePage = tsStage
    Align = alClient
    TabOrder = 3
    object tsOverview: TTabSheet
      Caption = 'Overview'
      object Label1: TLabel
        Left = 3
        Top = 6
        Width = 65
        Height = 13
        Caption = 'Pattern name'
      end
      object Label2: TLabel
        Left = 3
        Top = 33
        Width = 91
        Height = 13
        Caption = 'Pattern description'
      end
      object Label3: TLabel
        Left = 3
        Top = 60
        Width = 51
        Height = 13
        Caption = 'Team type'
      end
      object Label4: TLabel
        Left = 3
        Top = 87
        Width = 89
        Height = 13
        Caption = 'General team type'
      end
      object Label5: TLabel
        Left = 3
        Top = 113
        Width = 71
        Height = 13
        Caption = 'Age team type'
      end
      object Label6: TLabel
        Left = 3
        Top = 141
        Width = 70
        Height = 13
        Caption = 'Sex team type'
      end
      object dbePatternName: TDBEdit
        Left = 131
        Top = 3
        Width = 294
        Height = 21
        TabOrder = 0
      end
      object dbePatternDescription: TDBEdit
        Left = 131
        Top = 30
        Width = 294
        Height = 21
        TabOrder = 1
      end
      object dblcbTeamType: TDBLookupComboBox
        Left = 131
        Top = 57
        Width = 145
        Height = 21
        TabOrder = 2
      end
      object dblcbGeneralTeamType: TDBLookupComboBox
        Left = 131
        Top = 84
        Width = 145
        Height = 21
        TabOrder = 3
      end
      object dblcbAgeTeamType: TDBLookupComboBox
        Left = 131
        Top = 111
        Width = 145
        Height = 21
        TabOrder = 4
      end
      object dblcbSexTeamType: TDBLookupComboBox
        Left = 131
        Top = 138
        Width = 145
        Height = 21
        TabOrder = 5
      end
      object gbPatternField: TGroupBox
        Left = 282
        Top = 57
        Width = 185
        Height = 102
        Caption = 'Pattern Field'
        TabOrder = 6
        object clbField: TCheckListBox
          Left = 5
          Top = 18
          Width = 172
          Height = 77
          OnClickCheck = clbFieldClickCheck
          Align = alCustom
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object btnTournamentSave: TButton
        Left = 3
        Top = 224
        Width = 75
        Height = 25
        Caption = 'Save'
        TabOrder = 7
        OnClick = btnTournamentSaveClick
      end
    end
    object tsStage: TTabSheet
      Caption = 'Stage'
      ImageIndex = 1
      object tvStage: TTreeView
        Left = 0
        Top = 0
        Width = 153
        Height = 274
        Align = alLeft
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnChange = tvStageChange
      end
      object pcStage: TPageControl
        Left = 153
        Top = 0
        Width = 452
        Height = 274
        ActivePage = tsStageOverview
        Align = alClient
        TabOrder = 1
        object tsStageOverview: TTabSheet
          Caption = 'Overview'
          object Label9: TLabel
            Left = 5
            Top = 60
            Width = 37
            Height = 13
            Caption = 'Number'
          end
          object Label10: TLabel
            Left = 5
            Top = 87
            Width = 67
            Height = 13
            Caption = 'Number of lap'
          end
          object Label8: TLabel
            Left = 5
            Top = 33
            Width = 96
            Height = 13
            Caption = 'Stage pattern name'
          end
          object Label7: TLabel
            Left = 5
            Top = 6
            Width = 57
            Height = 13
            Caption = 'Stage name'
          end
          object dbeStageNoL: TDBEdit
            Left = 107
            Top = 84
            Width = 134
            Height = 21
            TabOrder = 0
          end
          object dblcbStageName: TDBLookupComboBox
            Left = 107
            Top = 3
            Width = 134
            Height = 21
            TabOrder = 1
          end
          object gbStageType: TGroupBox
            Left = 272
            Top = 0
            Width = 172
            Height = 246
            Align = alRight
            Caption = 'Stage type'
            TabOrder = 2
            object clbStageType: TCheckListBox
              Left = 2
              Top = 15
              Width = 168
              Height = 229
              OnClickCheck = clbStageTypeClickCheck
              Align = alClient
              ItemHeight = 13
              TabOrder = 0
            end
          end
          object dblcbStagePatternName: TDBLookupComboBox
            Left = 107
            Top = 30
            Width = 134
            Height = 21
            TabOrder = 3
          end
          object dbeStageNumber: TDBEdit
            Left = 107
            Top = 57
            Width = 134
            Height = 21
            TabOrder = 4
          end
          object btnStageSave: TButton
            Left = 3
            Top = 184
            Width = 75
            Height = 25
            Caption = 'Save'
            TabOrder = 5
            OnClick = btnStageSaveClick
          end
          object btnStageAdd: TButton
            Left = 3
            Top = 153
            Width = 75
            Height = 25
            Caption = 'Add'
            TabOrder = 6
            OnClick = btnStageAddClick
          end
          object btnStageAddChild: TButton
            Left = 84
            Top = 153
            Width = 75
            Height = 25
            Caption = 'Add Child'
            TabOrder = 7
            OnClick = btnStageAddChildClick
          end
          object btnStageDel: TButton
            Left = 84
            Top = 184
            Width = 75
            Height = 25
            Caption = 'Del'
            TabOrder = 8
            OnClick = btnStageDelClick
          end
        end
        object tsMove: TTabSheet
          Caption = 'Move'
          ImageIndex = 2
          object pcMove: TPageControl
            Left = 0
            Top = 0
            Width = 444
            Height = 246
            ActivePage = tsGP
            Align = alClient
            TabOrder = 0
            object tsGP: TTabSheet
              Caption = 'Group to Pair'
              object dbgMoveGP: TDBGrid
                Left = 0
                Top = 0
                Width = 436
                Height = 185
                Align = alTop
                DataSource = dsMoveGP
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
              end
              object btnAddMoveGP: TButton
                Left = 3
                Top = 191
                Width = 75
                Height = 25
                Caption = 'Add'
                TabOrder = 1
                OnClick = btnAddMoveGPClick
              end
              object btnEditMoveGP: TButton
                Left = 84
                Top = 191
                Width = 75
                Height = 25
                Caption = 'Edit'
                TabOrder = 2
                OnClick = btnEditMoveGPClick
              end
              object btnDelMoveGP: TButton
                Left = 165
                Top = 191
                Width = 75
                Height = 25
                Caption = 'Del'
                TabOrder = 3
                OnClick = btnDelMoveGPClick
              end
              object btnSaveMoveGP: TButton
                Left = 246
                Top = 191
                Width = 75
                Height = 25
                Caption = 'Save'
                TabOrder = 4
                OnClick = btnSaveMoveGPClick
              end
            end
            object tsPP: TTabSheet
              Caption = 'Pair to Pair'
              ImageIndex = 1
              object dbgMovePP: TDBGrid
                Left = 0
                Top = 0
                Width = 436
                Height = 185
                Align = alTop
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
              end
              object btnAddMovePP: TButton
                Left = 3
                Top = 190
                Width = 75
                Height = 25
                Caption = 'Add'
                TabOrder = 1
                OnClick = btnAddMovePPClick
              end
              object btnEditMovePP: TButton
                Left = 84
                Top = 190
                Width = 75
                Height = 25
                Caption = 'Edit'
                TabOrder = 2
                OnClick = btnEditMovePPClick
              end
              object btnDelMovePP: TButton
                Left = 165
                Top = 190
                Width = 75
                Height = 25
                Caption = 'Del'
                TabOrder = 3
                OnClick = btnDelMovePPClick
              end
              object btnSaveMovePP: TButton
                Left = 246
                Top = 190
                Width = 75
                Height = 25
                Caption = 'Save'
                TabOrder = 4
                OnClick = btnSaveMovePPClick
              end
            end
          end
        end
        object tsGroup: TTabSheet
          Caption = 'Group stage'
          ImageIndex = 1
          object dbgGroup: TDBGrid
            Left = 47
            Top = 3
            Width = 82
            Height = 174
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object btnAddGroup: TButton
            Left = 3
            Top = 3
            Width = 38
            Height = 25
            Caption = 'Add'
            TabOrder = 1
            OnClick = btnAddGroupClick
          end
          object btnDel: TButton
            Left = 3
            Top = 34
            Width = 38
            Height = 25
            Caption = 'Del'
            TabOrder = 2
            OnClick = btnDelClick
          end
          object btnSave: TButton
            Left = 3
            Top = 65
            Width = 38
            Height = 25
            Caption = 'Save'
            TabOrder = 3
            OnClick = btnSaveClick
          end
        end
        object tsPlayoff: TTabSheet
          Caption = 'Play-off'
          ImageIndex = 3
          object btnCreatePlayoff: TButton
            Left = 3
            Top = 3
            Width = 102
            Height = 25
            Caption = 'Create play-off'
            TabOrder = 0
            OnClick = btnCreatePlayoffClick
          end
        end
      end
    end
  end
  object adotTournamentPattern: TADOTable
    CursorType = ctStatic
    AfterScroll = adotTournamentPatternAfterScroll
    Left = 72
    Top = 96
  end
  object dsTournamentPattern: TDataSource
    DataSet = adotTournamentPattern
    Left = 72
    Top = 48
  end
  object dsTeamType: TDataSource
    DataSet = adotTeamType
    Left = 32
    Top = 144
  end
  object adotTeamType: TADOTable
    Left = 32
    Top = 192
  end
  object adotGeneralTeamType: TADOTable
    Left = 128
    Top = 192
  end
  object dsGeneralTeamType: TDataSource
    DataSet = adotGeneralTeamType
    Left = 128
    Top = 144
  end
  object dsAgeTeamType: TDataSource
    DataSet = adotAgeTeamType
    Left = 32
    Top = 240
  end
  object dsSexTeamType: TDataSource
    DataSet = adotSexTeamType
    Left = 128
    Top = 240
  end
  object adotAgeTeamType: TADOTable
    Left = 32
    Top = 288
  end
  object adotSexTeamType: TADOTable
    Left = 128
    Top = 288
  end
  object adotPatternField: TADOTable
    Left = 128
    Top = 336
  end
  object adoqStage: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 224
    Top = 288
  end
  object dsStage: TDataSource
    DataSet = adoqStage
    Left = 224
    Top = 240
  end
  object dsStageName: TDataSource
    DataSet = adotStageName
    Left = 296
    Top = 240
  end
  object adotStageName: TADOTable
    Left = 296
    Top = 288
  end
  object adotStagePatternName: TADOTable
    Left = 400
    Top = 272
  end
  object dsStagePatternName: TDataSource
    DataSet = adotStagePatternName
    Left = 400
    Top = 224
  end
  object adotStageType: TADOTable
    Left = 296
    Top = 336
  end
  object dsGroup: TDataSource
    DataSet = adoqGroup
    Left = 496
    Top = 240
  end
  object adoqGroup: TADOQuery
    Parameters = <>
    Left = 496
    Top = 288
  end
  object dsMoveGP: TDataSource
    DataSet = adoqMoveGP
    Left = 568
    Top = 240
  end
  object adoqMoveGP: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 568
    Top = 288
  end
  object adotStage: TADOTable
    Connection = dm.ADOConnection
    CursorType = ctStatic
    Left = 632
    Top = 288
  end
  object adoCommand: TADOCommand
    Parameters = <>
    Left = 232
    Top = 176
  end
  object adoqMovePP: TADOQuery
    Parameters = <>
    Left = 704
    Top = 288
  end
  object dsMovePP: TDataSource
    DataSet = adoqMovePP
    Left = 704
    Top = 240
  end
end
