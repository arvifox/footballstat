object frmTest: TfrmTest
  Left = 0
  Top = 0
  Caption = 'frmTest'
  ClientHeight = 568
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 743
    Top = 115
    Width = 31
    Height = 13
    Caption = 'Label7'
  end
  object Label8: TLabel
    Left = 743
    Top = 134
    Width = 31
    Height = 13
    Caption = 'Label8'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 657
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 488
    Top = 134
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 488
    Top = 165
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 488
    Top = 196
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 3
    OnClick = Button3Click
  end
  object DBGrid2: TDBGrid
    Left = 280
    Top = 256
    Width = 494
    Height = 178
    DataSource = DataSource2
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 696
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'qwert'
  end
  object Edit2: TEdit
    Left = 696
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '21'
  end
  object Panel1: TPanel
    Left = 16
    Top = 456
    Width = 713
    Height = 81
    TabOrder = 7
    DesignSize = (
      713
      81)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 56
      Height = 13
      Caption = '15.06.2010'
    end
    object Label2: TLabel
      Left = 88
      Top = 8
      Width = 28
      Height = 13
      Caption = '20:00'
    end
    object Label3: TLabel
      Left = 672
      Top = 8
      Width = 31
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Label3'
      ExplicitLeft = 680
    end
    object Label4: TLabel
      Left = 216
      Top = 27
      Width = 31
      Height = 13
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 344
      Top = 27
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Label5'
    end
    object Label6: TLabel
      Left = 320
      Top = 27
      Width = 4
      Height = 13
      Caption = ':'
    end
    object Label9: TLabel
      Left = 296
      Top = 27
      Width = 6
      Height = 13
      Caption = '2'
    end
    object StaticText1: TStaticText
      Left = 528
      Top = 16
      Width = 97
      Height = 33
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'sdfj;lasfj dfjisdf lksdfhksdjf '
      TabOrder = 0
    end
  end
  object ADOTable1: TADOTable
    Connection = dm.ADOConnection
    CursorType = ctStatic
    TableName = 'T_Stage_Playoff'
    Left = 48
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 48
    Top = 208
  end
  object ADOTable2: TADOTable
    Connection = dm.ADOConnection
    CursorType = ctStatic
    TableName = 'T_Stage_Group_Pattern'
    Left = 128
    Top = 152
  end
  object ADOTable3: TADOTable
    Connection = dm.ADOConnection
    CursorType = ctStatic
    TableName = 'T_Stage_Pattern'
    Left = 256
    Top = 136
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id from t_stage_pattern'
      'where (stage_pattern_type = 2)')
    Left = 376
    Top = 136
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 128
    Top = 208
  end
  object ADOCommand1: TADOCommand
    Connection = dm.ADOConnection
    Parameters = <>
    Left = 632
    Top = 136
  end
end
