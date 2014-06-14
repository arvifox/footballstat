unit Man;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, ComCtrls, StdCtrls, Mask;

type
  TfrmMan = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlPhoto: TPanel;
    dbimPhoto: TDBImage;
    pcMan: TPageControl;
    tsOverview: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    tsCareer: TTabSheet;
    tsBiography: TTabSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
  public
    { Public declarations }
    IDMan: integer;
  end;

var
  frmMan: TfrmMan;

implementation

{$R *.dfm}

{ TfrmMan }

procedure TfrmMan.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WndParent := 0;
end;

procedure TfrmMan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMan.Free;
  frmMan := nil;
end;

end.
