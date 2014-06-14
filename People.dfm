object frmPeople: TfrmPeople
  Left = 0
  Top = 0
  Caption = 'FStat'
  ClientHeight = 467
  ClientWidth = 893
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
    Width = 893
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 426
    Width = 893
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object dbgPeople: TDBGrid
    Left = 177
    Top = 41
    Width = 249
    Height = 385
    Align = alLeft
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pcPeople: TPageControl
    Left = 426
    Top = 41
    Width = 467
    Height = 385
    ActivePage = tsPeople
    Align = alClient
    TabOrder = 3
    object tsPeople: TTabSheet
      Caption = 'Overview'
      object Label1: TLabel
        Left = 249
        Top = 6
        Width = 50
        Height = 13
        Caption = 'First name'
      end
      object Label2: TLabel
        Left = 249
        Top = 33
        Width = 49
        Height = 13
        Caption = 'Last name'
      end
      object Label3: TLabel
        Left = 249
        Top = 60
        Width = 48
        Height = 13
        Caption = 'Nick name'
      end
      object Label4: TLabel
        Left = 249
        Top = 87
        Width = 51
        Height = 13
        Caption = 'Shirt name'
      end
      object Label5: TLabel
        Left = 249
        Top = 114
        Width = 63
        Height = 13
        Caption = 'Display name'
      end
      object Label6: TLabel
        Left = 249
        Top = 141
        Width = 40
        Height = 13
        Caption = 'Birthday'
      end
      object Label7: TLabel
        Left = 249
        Top = 168
        Width = 31
        Height = 13
        Caption = 'Height'
      end
      object pnlPhoto: TPanel
        Left = 3
        Top = 3
        Width = 240
        Height = 315
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'No photo'
        TabOrder = 0
        object dbimPhoto: TDBImage
          Left = 5
          Top = 5
          Width = 225
          Height = 300
          DataSource = dsPeople
          Proportional = True
          Stretch = True
          TabOrder = 0
          OnDblClick = dbimPhotoDblClick
        end
      end
      object dbeHeight: TDBEdit
        Left = 320
        Top = 165
        Width = 136
        Height = 21
        TabOrder = 1
      end
      object dbeFirstname: TDBEdit
        Left = 320
        Top = 3
        Width = 136
        Height = 21
        TabOrder = 2
      end
      object dbeLastname: TDBEdit
        Left = 320
        Top = 30
        Width = 136
        Height = 21
        TabOrder = 3
      end
      object dbeNickname: TDBEdit
        Left = 320
        Top = 57
        Width = 136
        Height = 21
        TabOrder = 4
      end
      object dbeShirtname: TDBEdit
        Left = 320
        Top = 84
        Width = 136
        Height = 21
        TabOrder = 5
      end
      object dbeDisplayname: TDBEdit
        Left = 320
        Top = 111
        Width = 136
        Height = 21
        TabOrder = 6
      end
      object dbeBirthday: TDBEdit
        Left = 320
        Top = 138
        Width = 136
        Height = 21
        TabOrder = 7
      end
      object btnOpenMan: TButton
        Left = 3
        Top = 324
        Width = 75
        Height = 25
        Caption = 'Open man'
        TabOrder = 8
        OnClick = btnOpenManClick
      end
    end
  end
  object pnlSearch: TPanel
    Left = 0
    Top = 41
    Width = 177
    Height = 385
    Align = alLeft
    TabOrder = 4
    object gbByCitizenship: TGroupBox
      Left = 7
      Top = 6
      Width = 162
      Height = 243
      Caption = '      Search by citizenship'
      TabOrder = 0
      object cbByCitizenship: TCheckBox
        Left = 6
        Top = 0
        Width = 17
        Height = 17
        TabOrder = 0
        OnClick = cbByCitizenshipClick
      end
      object dbgCountry: TDBGrid
        Left = 8
        Top = 23
        Width = 145
        Height = 210
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object gbByAge: TGroupBox
      Left = 7
      Top = 255
      Width = 162
      Height = 58
      Caption = '      Search by age'
      TabOrder = 1
      object cbByAge: TCheckBox
        Left = 6
        Top = 0
        Width = 17
        Height = 17
        TabOrder = 0
        OnClick = cbByAgeClick
      end
    end
    object gbByPosition: TGroupBox
      Left = 7
      Top = 319
      Width = 162
      Height = 58
      Caption = '      Search by position'
      TabOrder = 2
      object cbByPosition: TCheckBox
        Left = 6
        Top = 0
        Width = 14
        Height = 17
        TabOrder = 0
        OnClick = cbByPositionClick
      end
      object dblcbByPosition: TDBLookupComboBox
        Left = 8
        Top = 23
        Width = 145
        Height = 21
        TabOrder = 1
        OnCloseUp = dblcbByPositionCloseUp
      end
    end
  end
  object dsPeople: TDataSource
    DataSet = adoqPeople
    Left = 208
    Top = 104
  end
  object adotPosition: TADOTable
    Left = 264
    Top = 216
  end
  object dsPosition: TDataSource
    DataSet = adotPosition
    Left = 208
    Top = 216
  end
  object adoqPeople: TADOQuery
    Parameters = <>
    Left = 264
    Top = 104
  end
  object opdPhoto: TOpenPictureDialog
    FilterIndex = 0
    Left = 696
    Top = 264
  end
end
