object frmTournamentSelect: TfrmTournamentSelect
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FStat'
  ClientHeight = 444
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 686
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object gbOrgType: TGroupBox
    Left = 0
    Top = 41
    Width = 241
    Height = 362
    Align = alLeft
    Caption = 'Organization'
    TabOrder = 1
    object rgListType: TRadioGroup
      Left = 3
      Top = 49
      Width = 233
      Height = 40
      BiDiMode = bdLeftToRight
      Caption = 'View'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'List'
        'Tree')
      ParentBiDiMode = False
      TabOrder = 0
    end
    object dbgrOrganization: TDBGrid
      Left = 2
      Top = 95
      Width = 237
      Height = 265
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object dblcbOrgType: TDBLookupComboBox
      Left = 3
      Top = 22
      Width = 233
      Height = 21
      DropDownRows = 15
      TabOrder = 2
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 403
    Width = 686
    Height = 41
    Align = alBottom
    TabOrder = 2
  end
  object gbTournaments: TGroupBox
    Left = 241
    Top = 41
    Width = 445
    Height = 362
    Align = alClient
    Caption = 'Tournaments'
    TabOrder = 3
    object Label1: TLabel
      Left = 2
      Top = 97
      Width = 75
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'All tournaments'
    end
    object dbgrTournamentOrg: TDBGrid
      Left = 2
      Top = 15
      Width = 441
      Height = 82
      Align = alTop
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object dbgrAllTournaments: TDBGrid
      Left = 2
      Top = 110
      Width = 441
      Height = 209
      Align = alClient
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object pnlTournamentManagement: TPanel
      Left = 2
      Top = 319
      Width = 441
      Height = 41
      Align = alBottom
      TabOrder = 2
      object btnTournamentOpen: TButton
        Left = 4
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Open'
        TabOrder = 0
        OnClick = btnTournamentOpenClick
      end
    end
  end
end
