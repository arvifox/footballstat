unit Organization;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls;

type
  TfrmOrganization = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    tvOrganization: TTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrganization: TfrmOrganization;

implementation

{$R *.dfm}

end.
