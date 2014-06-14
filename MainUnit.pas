unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls;

type
  TfrmMain = class(TForm)
    mmMain: TMainMenu;
    miData: TMenuItem;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    sbStatus: TStatusBar;
    miService: TMenuItem;
    miOptions: TMenuItem;
    mGeography: TMenuItem;
    miTypeData: TMenuItem;
    N1: TMenuItem;
    miQuit: TMenuItem;
    miTournamentSelect: TMenuItem;
    miPeople: TMenuItem;
    miOrganization: TMenuItem;
    miTournamentpattern: TMenuItem;
    miTournament: TMenuItem;
    N2: TMenuItem;
    miTeam: TMenuItem;
    miTest: TMenuItem;
    procedure miTypeDataClick(Sender: TObject);
    procedure miOptionsClick(Sender: TObject);
    procedure miQuitClick(Sender: TObject);
    procedure mGeographyClick(Sender: TObject);
    procedure miOrganizationClick(Sender: TObject);
    procedure miTournamentpatternClick(Sender: TObject);
    procedure miTournamentSelectClick(Sender: TObject);
    procedure miPeopleClick(Sender: TObject);
    procedure miTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DataModule, GeneralDataUnit, Options, Geography, Organization,
  TournamentPattern, TournamentSelect, People, test;

{$R *.dfm}

procedure TfrmMain.miQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.miTestClick(Sender: TObject);
begin
  frmTest.showmodal;
end;

procedure TfrmMain.miTournamentpatternClick(Sender: TObject);
begin
  frmTournamentPattern.ShowModal;
end;

procedure TfrmMain.miTypeDataClick(Sender: TObject);
begin
  frmGeneralData.ShowModal;
end;

procedure TfrmMain.miTournamentSelectClick(Sender: TObject);
begin
  frmTournamentSelect.ShowModal;
end;

procedure TfrmMain.mGeographyClick(Sender: TObject);
begin
  frmGeography.ShowModal;
end;

procedure TfrmMain.miOptionsClick(Sender: TObject);
begin
  frmOptions.ShowModal;
end;

procedure TfrmMain.miOrganizationClick(Sender: TObject);
begin
  frmOrganization.ShowModal;
end;

procedure TfrmMain.miPeopleClick(Sender: TObject);
begin
  frmPeople.ShowModal;
end;

end.
