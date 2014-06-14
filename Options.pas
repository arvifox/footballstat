unit Options;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  TfrmOptions = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlDatabase: TPanel;
    tvOptions: TTreeView;
    rgDBMS: TRadioGroup;
    ledDB: TLabeledEdit;
    sbtnBrowseDB: TSpeedButton;
    sbtnNewDB: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;

implementation

{$R *.dfm}

end.
