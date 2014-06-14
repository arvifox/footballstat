object frmMan: TfrmMan
  Left = 0
  Top = 0
  Caption = 'FStat'
  ClientHeight = 409
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 769
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 743
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 368
    Width = 769
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 381
    ExplicitWidth = 743
  end
  object pnlPhoto: TPanel
    Left = 8
    Top = 47
    Width = 240
    Height = 315
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'pnlPhoto'
    TabOrder = 2
    object dbimPhoto: TDBImage
      Left = 5
      Top = 5
      Width = 225
      Height = 300
      TabOrder = 0
    end
  end
  object pcMan: TPageControl
    Left = 254
    Top = 47
    Width = 507
    Height = 315
    ActivePage = tsOverview
    TabOrder = 3
    object tsOverview: TTabSheet
      Caption = 'Overview'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Label1: TLabel
        Left = 3
        Top = 6
        Width = 50
        Height = 13
        Caption = 'First name'
      end
      object Label2: TLabel
        Left = 3
        Top = 33
        Width = 49
        Height = 13
        Caption = 'Last name'
      end
      object Label3: TLabel
        Left = 3
        Top = 60
        Width = 48
        Height = 13
        Caption = 'Nick name'
      end
      object Label4: TLabel
        Left = 3
        Top = 87
        Width = 51
        Height = 13
        Caption = 'Shirt name'
      end
      object Label5: TLabel
        Left = 3
        Top = 114
        Width = 63
        Height = 13
        Caption = 'Display name'
      end
      object Label6: TLabel
        Left = 3
        Top = 141
        Width = 40
        Height = 13
        Caption = 'Birthday'
      end
      object Label7: TLabel
        Left = 3
        Top = 168
        Width = 31
        Height = 13
        Caption = 'Height'
      end
      object DBEdit1: TDBEdit
        Left = 96
        Top = 3
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 96
        Top = 30
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 96
        Top = 57
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 96
        Top = 84
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 96
        Top = 111
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 96
        Top = 138
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 96
        Top = 165
        Width = 121
        Height = 21
        TabOrder = 6
      end
    end
    object tsCareer: TTabSheet
      Caption = 'Career'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tsBiography: TTabSheet
      Caption = 'Biography'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
end
