unit Match;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, DBCtrls, Mask, DB, ADODB, Grids,
  DBGrids;

type
  TfrmMatch = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pcMatch: TPageControl;
    tsLineup: TTabSheet;
    tsReport: TTabSheet;
    tsOfficials: TTabSheet;
    tsStatistics: TTabSheet;
    tsPreview: TTabSheet;
    tsSummary: TTabSheet;
    tsQuotes: TTabSheet;
    dbtHomeTeam: TDBText;
    dbtGuestTeam: TDBText;
    tsOverview: TTabSheet;
    dbeGoalHome: TDBEdit;
    dbeGoalGuest: TDBEdit;
    adotMatch: TADOTable;
    dsMatch: TDataSource;
    adotMatchid: TAutoIncField;
    adotMatchid_home_team: TIntegerField;
    adotMatchid_guest_team: TIntegerField;
    adotMatchgoal_home_team: TIntegerField;
    adotMatchgoal_guest_team: TIntegerField;
    adotMatchid_tournament: TIntegerField;
    adotMatchid_stage_pattern: TIntegerField;
    adotMatchmatch_date: TDateTimeField;
    adotMatchmatch_time_begin: TDateTimeField;
    adotMatchmatch_number: TIntegerField;
    adotMatchid_stadium: TIntegerField;
    adotMatchtactical_lineup: TWideMemoField;
    adotMatchid_match_result: TIntegerField;
    adotMatchadd_time1: TIntegerField;
    adotMatchadd_time2: TIntegerField;
    adotMatchadd_extra_time1: TWideStringField;
    adotMatchadd_extra_time2: TWideStringField;
    adotMatchaet: TBooleanField;
    adotMatchpso: TBooleanField;
    adotMatchpso_home_team: TIntegerField;
    adotMatchpso_guest_team: TIntegerField;
    adotTeam: TADOTable;
    adotMatchhometeamname: TStringField;
    adotMatchguestteamname: TStringField;
    Label1: TLabel;
    dbeNumber: TDBEdit;
    dbeDate: TDBEdit;
    dbeTime: TDBEdit;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
  public
    { Public declarations }
    IDMatch: integer;
  end;

var
  frmMatch: TfrmMatch;

implementation

uses DataModule, MainUnit, DBConst;

{$R *.dfm}

{ TfrmMatch }

procedure TfrmMatch.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  //Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TfrmMatch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  free;
  frmMatch := nil;
end;

procedure TfrmMatch.FormShow(Sender: TObject);
begin
  adotMatch.TableName := T_Match;
  adotMatch.Active := true;
  adotMatch.First;
  while not adotMatch.Eof do
  begin
    if adotMatch.FieldValues['id'] = IDMatch then
      break;
    adotMatch.Next;
  end;

end;

end.
