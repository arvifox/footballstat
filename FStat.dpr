program FStat;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {frmMain},
  DataModule in 'DataModule.pas' {dm: TDataModule},
  GeneralDataUnit in 'GeneralDataUnit.pas' {frmGeneralData},
  Options in 'Options.pas' {frmOptions},
  Geography in 'Geography.pas' {frmGeography},
  Organization in 'Organization.pas' {frmOrganization},
  TournamentPattern in 'TournamentPattern.pas' {frmTournamentPattern},
  TournamentSelect in 'TournamentSelect.pas' {frmTournamentSelect},
  Tournament in 'Tournament.pas' {frmTournament},
  Match in 'Match.pas' {frmMatch},
  People in 'People.pas' {frmPeople},
  DBConst in 'DBConst.pas',
  Man in 'Man.pas' {frmMan},
  test in 'test.pas' {frmTest},
  FormPattern in 'FormPattern.pas' {frm},
  GroupNameSelect in 'GroupNameSelect.pas' {frmGroupNameSelect},
  GroupToPair in 'GroupToPair.pas' {frmGP},
  PairToPair in 'PairToPair.pas' {frmPP},
  Playoff in 'Playoff.pas' {frmPlayoff};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Football Statistics';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmGeneralData, frmGeneralData);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmGeography, frmGeography);
  Application.CreateForm(TfrmOrganization, frmOrganization);
  Application.CreateForm(TfrmTournamentSelect, frmTournamentSelect);
  Application.CreateForm(TfrmTournamentPattern, frmTournamentPattern);
  Application.CreateForm(TfrmPeople, frmPeople);
  Application.CreateForm(TfrmTest, frmTest);
  Application.CreateForm(Tfrm, frm);
  Application.CreateForm(TfrmGroupNameSelect, frmGroupNameSelect);
  Application.CreateForm(TfrmGP, frmGP);
  Application.CreateForm(TfrmPP, frmPP);
  Application.Run;
end.
