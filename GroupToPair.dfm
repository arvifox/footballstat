inherited frmGP: TfrmGP
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FStat'
  ClientHeight = 408
  ClientWidth = 296
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 302
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 216
    Top = 66
    Width = 69
    Height = 13
    Caption = 'Group position'
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 47
    Width = 24
    Height = 13
    Caption = 'From'
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 192
    Width = 12
    Height = 13
    Caption = 'To'
  end
  object Label4: TLabel [3]
    Left = 261
    Top = 211
    Width = 27
    Height = 13
    Caption = 'Home'
  end
  inherited pnlTop: TPanel
    Width = 296
    ExplicitWidth = 296
  end
  inherited pnlBottom: TPanel
    Top = 367
    Width = 296
    ExplicitTop = 367
    ExplicitWidth = 296
  end
  object dbgGroupStage: TDBGrid
    Left = 8
    Top = 66
    Width = 98
    Height = 120
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dbgGroupName: TDBGrid
    Left = 112
    Top = 66
    Width = 98
    Height = 120
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ePos: TEdit
    Left = 216
    Top = 85
    Width = 69
    Height = 21
    TabOrder = 4
    Text = '1'
  end
  object dbgCpair: TDBGrid
    Left = 8
    Top = 211
    Width = 143
    Height = 120
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dbgPair: TDBGrid
    Left = 157
    Top = 211
    Width = 98
    Height = 120
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cbHome: TCheckBox
    Left = 261
    Top = 230
    Width = 25
    Height = 17
    TabOrder = 7
  end
  object btnOk: TButton
    Left = 8
    Top = 337
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 8
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 89
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 9
  end
  object adoqGroupStage: TADOQuery
    AfterScroll = adoqGroupStageAfterScroll
    Parameters = <>
    Left = 32
    Top = 72
  end
  object dsGroupStage: TDataSource
    DataSet = adoqGroupStage
    Left = 32
    Top = 120
  end
  object dsGroupName: TDataSource
    DataSet = adoqGroupName
    Left = 136
    Top = 120
  end
  object adoqGroupName: TADOQuery
    Parameters = <>
    Left = 136
    Top = 72
  end
  object dsCpair: TDataSource
    DataSet = adoqCpair
    Left = 40
    Top = 280
  end
  object adoqCpair: TADOQuery
    AfterScroll = adoqCpairAfterScroll
    Parameters = <>
    Left = 40
    Top = 232
  end
  object adoqPair: TADOQuery
    Parameters = <>
    Left = 192
    Top = 232
  end
  object dsPair: TDataSource
    DataSet = adoqPair
    Left = 192
    Top = 280
  end
end
