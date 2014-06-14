unit TournamentSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids;

type
  TfrmTournamentSelect = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    rgListType: TRadioGroup;
    gbOrgType: TGroupBox;
    dbgrOrganization: TDBGrid;
    dblcbOrgType: TDBLookupComboBox;
    dbgrTournamentOrg: TDBGrid;
    dbgrAllTournaments: TDBGrid;
    gbTournaments: TGroupBox;
    Label1: TLabel;
    pnlTournamentManagement: TPanel;
    btnTournamentOpen: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnTournamentOpenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTournamentSelect: TfrmTournamentSelect;

implementation

uses DataModule, MainUnit, Tournament, DBConst;

{$R *.dfm}

procedure TfrmTournamentSelect.btnTournamentOpenClick(Sender: TObject);
begin
  if frmTournament = nil then
    frmTournament := TfrmTournament.Create(Application);
  frmTournament.IDTournament := dm.adotTable4.FieldValues['id'];
  frmTournament.Show;
end;

procedure TfrmTournamentSelect.FormShow(Sender: TObject);
begin
  dm.adotTable.Active := false;
  dm.adotTable.TableName := T_Org_Type;
  dm.adotTable.Active := true;

  dm.adotTable2.Active := false;
  dm.adotTable2.TableName := T_Organization;
  dm.adotTable2.MasterSource := dm.dsSource;
  dm.adotTable2.IndexFieldNames := 'id_org_type';
  dm.adotTable2.MasterFields := 'id';
  dm.adotTable2.Active := true;
  dbgrOrganization.DataSource := dm.dsSource2;
  dblcbOrgType.ListSource := dm.dsSource;
  dblcbOrgType.ListField := 'org_type_name';
  dblcbOrgType.KeyField := 'id';

  dm.adotTable3.Active := false;
  dm.adotTable3.TableName := T_Tournament_Organization;
  dm.adotTable3.MasterSource := dm.dsSource2;
  dm.adotTable3.IndexFieldNames := 'id_organization';
  dm.adotTable3.MasterFields := 'id';
  dm.adotTable3.Active := true;
  dbgrTournamentOrg.DataSource := dm.dsSource3;

  dm.adotTable4.Active := false;
  dm.adotTable4.TableName := T_Tournament;
  dm.adotTable4.MasterSource := dm.dsSource3;
  dm.adotTable4.IndexFieldNames := 'id_tournament_organization';
  dm.adotTable4.MasterFields := 'id';
  dm.adotTable4.Active := true;
  dbgrAllTournaments.DataSource := dm.dsSource4;
end;

end.
