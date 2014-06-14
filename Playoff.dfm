object frmPlayoff: TfrmPlayoff
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FStat'
  ClientHeight = 645
  ClientWidth = 949
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 949
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 604
    Width = 949
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object pnlTuning: TPanel
    Left = 0
    Top = 41
    Width = 949
    Height = 40
    Align = alTop
    TabOrder = 2
    object btnAddLabel: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Add label'
      TabOrder = 0
      OnClick = btnAddLabelClick
    end
    object btnAddPair: TButton
      Left = 89
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Add pair'
      TabOrder = 1
      OnClick = btnAddPairClick
    end
    object btnSave: TButton
      Left = 170
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object btnSetStage: TButton
      Left = 251
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Set stage'
      TabOrder = 3
      OnClick = btnSetStageClick
    end
  end
  object pnlPlayoff: TPanel
    Left = 0
    Top = 81
    Width = 949
    Height = 523
    Align = alClient
    TabOrder = 3
    OnDragDrop = pnlPlayoffDragDrop
    OnDragOver = pnlPlayoffDragOver
  end
  object pnlStage: TPanel
    Left = 240
    Top = 144
    Width = 262
    Height = 217
    DragMode = dmAutomatic
    TabOrder = 4
    Visible = False
    object dbgCpair: TDBGrid
      Left = 8
      Top = 8
      Width = 142
      Height = 169
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object dbgPair: TDBGrid
      Left = 156
      Top = 8
      Width = 98
      Height = 169
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object btnSet: TButton
      Left = 8
      Top = 183
      Width = 75
      Height = 25
      Caption = 'Set'
      TabOrder = 2
      OnClick = btnSetClick
    end
    object btnHide: TButton
      Left = 89
      Top = 183
      Width = 75
      Height = 25
      Caption = 'Hide'
      TabOrder = 3
      OnClick = btnHideClick
    end
  end
  object adotPlayoff: TADOTable
    Left = 528
    Top = 48
  end
  object dsCpair: TDataSource
    DataSet = adoqCpair
    Left = 624
    Top = 48
  end
  object dsPair: TDataSource
    DataSet = adoqPair
    Left = 704
    Top = 48
  end
  object adoqCpair: TADOQuery
    AfterScroll = adoqCpairAfterScroll
    Parameters = <>
    Left = 624
    Top = 96
  end
  object adoqPair: TADOQuery
    Parameters = <>
    Left = 704
    Top = 96
  end
end
