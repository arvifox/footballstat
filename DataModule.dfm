object dm: Tdm
  OldCreateOrder = False
  Height = 334
  Width = 607
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=H:\Programming\Foot' +
      'ball_Statistics\fs.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 8
  end
  object adotTable: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    Left = 96
    Top = 8
  end
  object dsSource: TDataSource
    DataSet = adotTable
    Left = 160
    Top = 8
  end
  object dsSource2: TDataSource
    DataSet = adotTable2
    Left = 160
    Top = 64
  end
  object adotTable2: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    Left = 96
    Top = 64
  end
  object dsSource3: TDataSource
    DataSet = adotTable3
    Left = 160
    Top = 120
  end
  object dsSource4: TDataSource
    DataSet = adotTable4
    Left = 160
    Top = 176
  end
  object adotTable3: TADOTable
    Connection = ADOConnection
    Left = 96
    Top = 120
  end
  object adotTable4: TADOTable
    Connection = ADOConnection
    Left = 96
    Top = 176
  end
end
