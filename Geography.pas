unit Geography;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids;

type
  TfrmGeography = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    lbGeographyDataDirectory: TListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeography: TfrmGeography;

implementation

uses DataModule, MainUnit, DBConst;

{$R *.dfm}

end.
