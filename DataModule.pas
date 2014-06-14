unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection: TADOConnection;
    dsSource: TDataSource;
    adotTable: TADOTable;
    dsSource2: TDataSource;
    adotTable2: TADOTable;
    dsSource3: TDataSource;
    dsSource4: TDataSource;
    adotTable3: TADOTable;
    adotTable4: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
