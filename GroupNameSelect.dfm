inherited frmGroupNameSelect: TfrmGroupNameSelect
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FStat'
  ClientHeight = 313
  ClientWidth = 248
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 254
  ExplicitHeight = 341
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    Width = 248
    ExplicitWidth = 248
  end
  inherited pnlBottom: TPanel
    Top = 272
    Width = 248
    ExplicitTop = 272
    ExplicitWidth = 248
  end
  object dbgGroupName: TDBGrid
    Left = 8
    Top = 47
    Width = 153
    Height = 219
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnOk: TButton
    Left = 167
    Top = 210
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 167
    Top = 241
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object adotGroupName: TADOTable
    CursorType = ctStatic
    Left = 32
    Top = 184
  end
  object dsGroupName: TDataSource
    DataSet = adotGroupName
    Left = 32
    Top = 136
  end
end
