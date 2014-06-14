object frmGeography: TfrmGeography
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FStat'
  ClientHeight = 358
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 317
    Width = 624
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object lbGeographyDataDirectory: TListBox
    Left = 0
    Top = 41
    Width = 121
    Height = 276
    Align = alLeft
    ItemHeight = 13
    Items.Strings = (
      'Continent'
      'Country'
      'City'
      'Stadium')
    TabOrder = 2
  end
end
