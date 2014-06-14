object frmPP: TfrmPP
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FStat'
  ClientHeight = 409
  ClientWidth = 297
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
  object Label1: TLabel
    Left = 8
    Top = 47
    Width = 24
    Height = 13
    Caption = 'From'
  end
  object Label2: TLabel
    Left = 8
    Top = 192
    Width = 12
    Height = 13
    Caption = 'To'
  end
  object Label3: TLabel
    Left = 260
    Top = 66
    Width = 22
    Height = 13
    Caption = 'Won'
  end
  object Label4: TLabel
    Left = 260
    Top = 211
    Width = 27
    Height = 13
    Caption = 'Home'
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 368
    Width = 297
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object dbgPpairFrom: TDBGrid
    Left = 8
    Top = 66
    Width = 142
    Height = 120
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dbgPpairTo: TDBGrid
    Left = 8
    Top = 211
    Width = 142
    Height = 120
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dbgPairFrom: TDBGrid
    Left = 156
    Top = 66
    Width = 98
    Height = 120
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dbgPairTo: TDBGrid
    Left = 156
    Top = 211
    Width = 98
    Height = 120
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cbWon: TCheckBox
    Left = 260
    Top = 85
    Width = 31
    Height = 17
    TabOrder = 6
  end
  object cbHome: TCheckBox
    Left = 260
    Top = 230
    Width = 31
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
    Top = 337
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 9
  end
  object dsPpairFrom: TDataSource
    DataSet = adoqPpairFrom
    Left = 56
    Top = 72
  end
  object dsPairFrom: TDataSource
    DataSet = adoqPairFrom
    Left = 192
    Top = 72
  end
  object dsPpairTo: TDataSource
    DataSet = adoqPpairTo
    Left = 56
    Top = 216
  end
  object dsPairTo: TDataSource
    DataSet = adoqPairTo
    Left = 192
    Top = 216
  end
  object adoqPpairFrom: TADOQuery
    AfterScroll = adoqPpairFromAfterScroll
    Parameters = <>
    Left = 56
    Top = 120
  end
  object adoqPairFrom: TADOQuery
    Parameters = <>
    Left = 192
    Top = 120
  end
  object adoqPpairTo: TADOQuery
    AfterScroll = adoqPpairToAfterScroll
    Parameters = <>
    Left = 56
    Top = 272
  end
  object adoqPairTo: TADOQuery
    Parameters = <>
    Left = 192
    Top = 272
  end
end
