object frmOptions: TfrmOptions
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Options'
  ClientHeight = 305
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 160
    ExplicitTop = 96
    ExplicitWidth = 185
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 264
    Width = 768
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 248
    ExplicitTop = 280
    ExplicitWidth = 185
  end
  object pnlDatabase: TPanel
    Left = 121
    Top = 41
    Width = 647
    Height = 223
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 133
    ExplicitTop = 47
    ExplicitWidth = 625
    ExplicitHeight = 274
    object sbtnBrowseDB: TSpeedButton
      Left = 587
      Top = 20
      Width = 23
      Height = 22
    end
    object sbtnNewDB: TSpeedButton
      Left = 616
      Top = 20
      Width = 23
      Height = 22
    end
    object rgDBMS: TRadioGroup
      Left = 6
      Top = 48
      Width = 635
      Height = 59
      Align = alCustom
      Caption = 'DBMS'
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'MS Access'
        'Oracle'
        'Firebird'
        'Interbase'
        'IBM DB2'
        'MS SQL Server'
        'PostgreSQL'
        'MySQL')
      TabOrder = 0
    end
    object ledDB: TLabeledEdit
      Left = 6
      Top = 20
      Width = 575
      Height = 22
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Database'
      TabOrder = 1
    end
  end
  object tvOptions: TTreeView
    Left = 0
    Top = 41
    Width = 121
    Height = 223
    Align = alLeft
    Indent = 19
    TabOrder = 3
    Items.NodeData = {
      03010000002E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      0000000000010844006100740061006200610073006500}
    ExplicitTop = 35
    ExplicitHeight = 308
  end
end
