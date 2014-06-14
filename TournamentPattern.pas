unit TournamentPattern;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, DB, ADODB, Grids, DBGrids, ComCtrls, StdCtrls,
  Mask, CheckLst;

type

  PStage = ^TStage;
  TStage = record
    id: integer;
    name: string;
    idp: integer;
  end;

  TfrmTournamentPattern = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    adotTournamentPattern: TADOTable;
    pnlPattern: TPanel;
    dbgPattern: TDBGrid;
    dsTournamentPattern: TDataSource;
    pcPattern: TPageControl;
    tsOverview: TTabSheet;
    tsStage: TTabSheet;
    dbePatternName: TDBEdit;
    dbePatternDescription: TDBEdit;
    dblcbTeamType: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dblcbGeneralTeamType: TDBLookupComboBox;
    dblcbAgeTeamType: TDBLookupComboBox;
    dblcbSexTeamType: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    dsTeamType: TDataSource;
    adotTeamType: TADOTable;
    adotGeneralTeamType: TADOTable;
    dsGeneralTeamType: TDataSource;
    dsAgeTeamType: TDataSource;
    dsSexTeamType: TDataSource;
    adotAgeTeamType: TADOTable;
    adotSexTeamType: TADOTable;
    clbField: TCheckListBox;
    adotPatternField: TADOTable;
    gbPatternField: TGroupBox;
    tvStage: TTreeView;
    adoqStage: TADOQuery;
    dblcbStageName: TDBLookupComboBox;
    dblcbStagePatternName: TDBLookupComboBox;
    dbeStageNumber: TDBEdit;
    dbeStageNoL: TDBEdit;
    dsStage: TDataSource;
    dsStageName: TDataSource;
    adotStageName: TADOTable;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    adotStagePatternName: TADOTable;
    dsStagePatternName: TDataSource;
    gbStageType: TGroupBox;
    clbStageType: TCheckListBox;
    adotStageType: TADOTable;
    pcStage: TPageControl;
    tsStageOverview: TTabSheet;
    tsGroup: TTabSheet;
    dbgGroup: TDBGrid;
    dsGroup: TDataSource;
    tsMove: TTabSheet;
    btnAddGroup: TButton;
    btnDel: TButton;
    btnSave: TButton;
    adoqGroup: TADOQuery;
    btnStageSave: TButton;
    btnStageAdd: TButton;
    btnStageAddChild: TButton;
    btnStageDel: TButton;
    btnTournamentSave: TButton;
    pcMove: TPageControl;
    tsGP: TTabSheet;
    tsPP: TTabSheet;
    dbgMoveGP: TDBGrid;
    dsMoveGP: TDataSource;
    adoqMoveGP: TADOQuery;
    adotStage: TADOTable;
    btnAddMoveGP: TButton;
    btnEditMoveGP: TButton;
    btnDelMoveGP: TButton;
    btnSaveMoveGP: TButton;
    adoCommand: TADOCommand;
    dbgMovePP: TDBGrid;
    btnAddMovePP: TButton;
    btnEditMovePP: TButton;
    btnDelMovePP: TButton;
    btnSaveMovePP: TButton;
    adoqMovePP: TADOQuery;
    dsMovePP: TDataSource;
    tsPlayoff: TTabSheet;
    btnCreatePlayoff: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure clbFieldClickCheck(Sender: TObject);
    procedure tvStageChange(Sender: TObject; Node: TTreeNode);
    procedure adotTournamentPatternAfterScroll(DataSet: TDataSet);
    procedure btnSaveClick(Sender: TObject);
    procedure btnAddGroupClick(Sender: TObject);
    procedure dblcbGroupNameCloseUp(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnStageSaveClick(Sender: TObject);
    procedure clbStageTypeClickCheck(Sender: TObject);
    procedure btnStageAddClick(Sender: TObject);
    procedure btnStageAddChildClick(Sender: TObject);
    procedure btnStageDelClick(Sender: TObject);
    procedure btnTournamentSaveClick(Sender: TObject);
    procedure btnSaveMoveGPClick(Sender: TObject);
    procedure btnDelMoveGPClick(Sender: TObject);
    procedure btnAddMoveGPClick(Sender: TObject);
    procedure btnEditMoveGPClick(Sender: TObject);
    procedure btnDelMovePPClick(Sender: TObject);
    procedure btnSaveMovePPClick(Sender: TObject);
    procedure btnAddMovePPClick(Sender: TObject);
    procedure btnEditMovePPClick(Sender: TObject);
    procedure btnCreatePlayoffClick(Sender: TObject);
  private
    { Private declarations }
    procedure LinkingComponents;
    procedure SettingInterface;
    procedure LoadPatternFieldList;
    procedure CheckPatternFieldList;
    procedure LoadStageType;
    procedure CheckStageType;
    procedure LoadGroupStage;
    procedure CheckingStageType;
    procedure MoveGP;
    procedure MoveGPreOpen;
    procedure MovePP;
    procedure MovePPreOpen;
  public
    { Public declarations }
    procedure LoadStageTreeView(Atv: TTreeView);
  end;

var
  frmTournamentPattern: TfrmTournamentPattern;

implementation

uses DataModule, DBConst, GroupNameSelect, GroupToPair, PairToPair, Playoff;

{$R *.dfm}

{ TfrmTournamentPattern }

procedure TfrmTournamentPattern.MovePPreOpen;
begin
  adoqMovePP.Close;
  adoqMovePP.Parameters.ParamByName('idtp').Value :=
    adotTournamentPattern.FieldByName(T_Tournament_Pattern_id).AsInteger;
  adoqMovePP.Open;
end;

procedure TfrmTournamentPattern.MoveGPreOpen;
begin
  adoqMoveGP.Close;
  adoqMoveGP.Parameters.ParamByName('idtp').Value :=
    adotTournamentPattern.FieldByName(T_Tournament_Pattern_id).AsInteger;
  adoqMoveGP.Open;
end;

procedure TfrmTournamentPattern.MovePP;
var fi: TIntegerField;
    fs: TStringField;
    i: integer;
begin
  with adoqMovePP, sql do
  begin
    close;
    Clear;
    Add('select *');
    Add('from ' + T_Stage_Pattern_Move_PP);
    Add('left join ' + T_Stage_Pattern);
    Add('on ' + T_Stage_Pattern + '.' + T_Stage_Pattern_id + ' = ' +
        T_Stage_Pattern_Move_PP + '.' + T_Stage_Pattern_Move_PP_id_pair_from);
    Add('where ' + T_Stage_Pattern_id_tournament_pattern + ' = :idtp');
    FieldDefs.Update;
    FieldDefs.Find(T_Stage_Pattern_Move_PP + '.' +
                   T_Stage_Pattern_Move_PP_id).CreateField(adoqMovePP);
    FieldDefs.Find(T_Stage_Pattern_Move_PP_id_pair_from).CreateField(adoqMovePP);
    FieldDefs.Find(T_Stage_Pattern_Move_PP_id_pair_to).CreateField(adoqMovePP);
    FieldDefs.Find(T_Stage_Pattern_id_stage_name).CreateField(adoqMovePP);
    FieldDefs.Find(T_Stage_Pattern_id_parent_stage).CreateField(adoqMovePP);
    fi := TIntegerField.Create(adoqMovePP);
    fi.FieldName := 'id_stage_name_pp_from';
    fi.Name := adoqMovePP.Name + fi.FieldName;
    fi.DataSet := adoqMovePP;
    fi.FieldKind := fkLookup;
    fi.LookupDataSet := adotStage;
    fi.LookupKeyFields := T_Stage_Pattern_id;
    fi.LookupResultField := T_Stage_Pattern_id_stage_name;
    fi.KeyFields := T_Stage_Pattern_id_parent_stage;
    fs := TStringField.Create(adoqMovePP);
    fs.FieldName := 'ppair_from_stage_name';
    fs.Name := adoqMovePP.Name + fs.FieldName;
    fs.DataSet := adoqMovePP;
    fs.FieldKind := fkLookup;
    fs.LookupDataSet := adotStageName;
    fs.LookupKeyFields := T_Stage_Name_id;
    fs.LookupResultField := T_Stage_Name_stage_name;
    fs.KeyFields := 'id_stage_name_pp_from';
    fs := TStringField.Create(adoqMovePP);
    fs.FieldName := 'pair_from_stage_name';
    fs.Name := adoqMovePP.Name + fs.FieldName;
    fs.DataSet := adoqMovePP;
    fs.FieldKind := fkLookup;
    fs.LookupDataSet := adotStageName;
    fs.LookupKeyFields := T_Stage_Name_id;
    fs.LookupResultField := T_Stage_Name_stage_name;
    fs.KeyFields := T_Stage_Pattern_id_stage_name;
    FieldDefs.Find(T_Stage_Pattern_Move_PP_won).CreateField(adoqMovePP);
    fi := TIntegerField.Create(adoqMovePP);
    fi.FieldName := 'id_stage_name_p_to';
    fi.Name := adoqMovePP.Name + fi.FieldName;
    fi.DataSet := adoqMovePP;
    fi.FieldKind := fkLookup;
    fi.LookupDataSet := adotStage;
    fi.LookupKeyFields := T_Stage_Pattern_id;
    fi.LookupResultField := T_Stage_Pattern_id_stage_name;
    fi.KeyFields := T_Stage_Pattern_Move_PP_id_pair_to;
    fi := TIntegerField.Create(adoqMovePP);
    fi.FieldName := 'id_pp_to';
    fi.Name := adoqMovePP.Name + fi.FieldName;
    fi.DataSet := adoqMovePP;
    fi.FieldKind := fkLookup;
    fi.LookupDataSet := adotStage;
    fi.LookupKeyFields := T_Stage_Pattern_id;
    fi.LookupResultField := T_Stage_Pattern_id_parent_stage;
    fi.KeyFields := T_Stage_Pattern_Move_PP_id_pair_to;
    fi := TIntegerField.Create(adoqMovePP);
    fi.FieldName := 'id_stage_name_pp_to';
    fi.Name := adoqMovePP.Name + fi.FieldName;
    fi.DataSet := adoqMovePP;
    fi.FieldKind := fkLookup;
    fi.LookupDataSet := adotStage;
    fi.LookupKeyFields := T_Stage_Pattern_id;
    fi.LookupResultField := T_Stage_Pattern_id_stage_name;
    fi.KeyFields := 'id_pp_to';
    fs := TStringField.Create(adoqMovePP);
    fs.FieldName := 'ppair_to_stage_name';
    fs.Name := adoqMovePP.Name + fs.FieldName;
    fs.DataSet := adoqMovePP;
    fs.FieldKind := fkLookup;
    fs.LookupDataSet := adotStageName;
    fs.LookupKeyFields := T_Stage_Name_id;
    fs.LookupResultField := T_Stage_Name_stage_name;
    fs.KeyFields := 'id_stage_name_pp_to';
    fs := TStringField.Create(adoqMovePP);
    fs.FieldName := 'pair_to_stage_name';
    fs.Name := adoqMovePP.Name + fs.FieldName;
    fs.DataSet := adoqMovePP;
    fs.FieldKind := fkLookup;
    fs.LookupDataSet := adotStageName;
    fs.LookupKeyFields := T_Stage_Name_id;
    fs.LookupResultField := T_Stage_Name_stage_name;
    fs.KeyFields := 'id_stage_name_p_to';
    FieldDefs.Find(T_Stage_Pattern_Move_PP_home).CreateField(adoqMovePP);
    for i := 0 to adoqMovePP.FieldCount - 1 do
      adoqMovePP.Fields.Fields[i].Visible := false;
    FieldByName('pair_from_stage_name').Visible := true;
    FieldByName('pair_from_stage_name').DisplayLabel:= 'Pair from';
    FieldByName('pair_from_stage_name').DisplayWidth:= 6;
    FieldByName('pair_to_stage_name').Visible := true;
    FieldByName('pair_to_stage_name').DisplayLabel:= 'Pair to';
    FieldByName('pair_to_stage_name').DisplayWidth:= 6;
    FieldByName('ppair_from_stage_name').Visible := true;
    FieldByName('ppair_from_stage_name').DisplayLabel := 'Stage from';
    FieldByName('ppair_from_stage_name').DisplayWidth := 17;
    FieldByName('ppair_to_stage_name').Visible := true;
    FieldByName('ppair_to_stage_name').DisplayLabel := 'Stage to';
    FieldByName('ppair_to_stage_name').DisplayWidth := 17;
    FieldByName(T_Stage_Pattern_Move_PP_home).Visible := true;
    FieldByName(T_Stage_Pattern_Move_PP_home).DisplayLabel := 'H/G';
    FieldByName(T_Stage_Pattern_Move_PP_home).DisplayWidth := 7;
    TBooleanField(FieldByName(
                  T_Stage_Pattern_Move_PP_home)).DisplayValues := 'Home;Guest';
    FieldByName(T_Stage_Pattern_Move_PP_won).Visible := true;
    FieldByName(T_Stage_Pattern_Move_PP_won).DisplayLabel := 'W/L';
    TBooleanField(FieldByName(
                  T_Stage_Pattern_Move_PP_won)).DisplayValues := 'Won;Lost';
    FieldByName(T_Stage_Pattern_Move_PP_won).DisplayWidth := 7;
  end;
end;

procedure TfrmTournamentPattern.MoveGP;
var fi: TIntegerField;
    fs: TStringField;
    i: integer;
begin
  with adoqMoveGP do
  begin
    close;
    sql.Clear;
    sql.Add('select *');
    sql.Add('from (((' + T_Stage_Pattern_Move_GP);
    sql.Add('left join ' + T_Stage_Group_Pattern);
    sql.Add('on ' + T_Stage_Pattern_Move_GP + '.' +
            T_Stage_Pattern_Move_GP_id_group_pattern + ' = ' +
            T_Stage_Group_Pattern + '.' + T_Stage_Group_Pattern_id + ')');
    sql.Add('left join ' + T_Stage_Pattern);
    sql.Add('on ' + T_Stage_Pattern + '.' + T_Stage_Pattern_id + ' = ' +
            T_Stage_Group_Pattern + '.' +
            T_Stage_Group_Pattern_id_stage_pattern + ')');
    sql.Add('left join ' + T_Stage_Group_Name);
    sql.Add('on ' + T_Stage_Group_Name + '.' + T_Stage_Group_Name_id + ' = ' +
            T_Stage_Group_Pattern + '.' +
            T_Stage_Group_Pattern_id_group_name + ')');
    sql.Add('left join ' + T_Stage_Name);
    sql.Add('on ' + T_Stage_Name + '.' + T_Stage_Name_id + ' = ' +
            T_Stage_Pattern + '.' + T_Stage_Pattern_id_stage_name);
    sql.Add('where ' + T_Stage_Pattern_id_tournament_pattern + ' = :idtp');
    FieldDefs.Update;
    FieldDefs.Find(T_Stage_Pattern_Move_GP + '.' +
                   T_Stage_Pattern_Move_GP_id).CreateField(adoqMoveGP);
    FieldDefs.Find(T_Stage_Name_stage_name).CreateField(adoqMoveGP);
    FieldDefs.Find(T_Stage_Group_Name_name).CreateField(adoqMoveGP);
    FieldDefs.Find(T_Stage_Pattern_Move_GP_position).CreateField(adoqMoveGP);
    FieldDefs.Find(T_Stage_Pattern_Move_GP_id_pair).CreateField(adoqMoveGP);
    FieldDefs.Find(T_Stage_Group_Pattern + '.' +
                   T_Stage_Group_Pattern_id).CreateField(adoqMoveGP);
    FieldDefs.Find(T_Stage_Pattern + '.' +
                   T_Stage_Pattern_id).CreateField(adoqMoveGP);
    fi := TIntegerField.Create(adoqMoveGP);
    fi.FieldName := 'id_stage_name';
    fi.Name := adoqMoveGP.Name + fi.FieldName;
    fi.DataSet := adoqMoveGP;
    fi.FieldKind := fkLookup;
    fi.LookupDataSet := adotStage;
    fi.LookupKeyFields := T_Stage_Pattern_id;
    fi.LookupResultField := T_Stage_Pattern_id_stage_name;
    fi.KeyFields := T_Stage_Pattern_Move_GP_id_pair;
    fs := TStringField.Create(adoqMoveGP);
    fs.FieldName := 'pair_stage_name';
    fs.Name := adoqMoveGP.Name + fs.FieldName;
    fs.DataSet := adoqMoveGP;
    fs.FieldKind := fkLookup;
    fs.LookupDataSet := adotStageName;
    fs.LookupKeyFields := T_Stage_Name_id;
    fs.LookupResultField := T_Stage_Name_stage_name;
    fs.KeyFields := 'id_stage_name';
    fi := TIntegerField.Create(adoqMoveGP);
    fi.FieldName := 'id_parent_stage';
    fi.Name := adoqMoveGP.Name + fi.FieldName;
    fi.DataSet := adoqMoveGP;
    fi.FieldKind := fkLookup;
    fi.LookupDataSet := adotStage;
    fi.LookupKeyFields := T_Stage_Pattern_id;
    fi.LookupResultField := T_Stage_Pattern_id_parent_stage;
    fi.KeyFields := T_Stage_Pattern_Move_GP_id_pair;
    fi := TIntegerField.Create(adoqMoveGP);
    fi.FieldName := 'id_stage_name2';
    fi.Name := adoqMoveGP.Name + fi.FieldName;
    fi.DataSet := adoqMoveGP;
    fi.FieldKind := fkLookup;
    fi.LookupDataSet := adotStage;
    fi.LookupKeyFields := T_Stage_Pattern_id;
    fi.LookupResultField := T_Stage_Pattern_id_stage_name;
    fi.KeyFields := 'id_parent_stage';
    fs := TStringField.Create(adoqMoveGP);
    fs.FieldName := 'cpair_stage_name';
    fs.Name := adoqMoveGP.Name + fs.FieldName;
    fs.DataSet := adoqMoveGP;
    fs.FieldKind := fkLookup;
    fs.LookupDataSet := adotStageName;
    fs.LookupKeyFields := T_Stage_Name_id;
    fs.LookupResultField := T_Stage_Name_stage_name;
    fs.KeyFields := 'id_stage_name2';
    FieldDefs.Find(T_Stage_Pattern_Move_GP_home).CreateField(adoqMoveGP);
    for i := 0 to adoqMoveGP.FieldCount - 1 do
      adoqMoveGP.Fields.Fields[i].Visible := false;
    adoqMoveGP.FieldByName(T_Stage_Pattern_Move_GP_position).Visible := true;
    adoqMoveGP.FieldByName(T_Stage_Pattern_Move_GP_home).Visible := true;
    adoqMoveGP.FieldByName(T_Stage_Group_Name_name).Visible := true;
    adoqMoveGP.FieldByName(T_Stage_Name_stage_name).Visible := true;
    adoqMoveGP.FieldByName('pair_stage_name').Visible := true;
    adoqMoveGP.FieldByName('cpair_stage_name').Visible := true;
    adoqMoveGP.FieldByName(T_Stage_Pattern_Move_GP_position).DisplayLabel := 'Pos';
    adoqMoveGP.FieldByName(T_Stage_Pattern_Move_GP_position).DisplayWidth := 5;
    adoqMoveGP.FieldByName(T_Stage_Pattern_Move_GP_home).DisplayLabel := 'H/G';
    TBooleanField(adoqMoveGP.FieldByName(
      T_Stage_Pattern_Move_GP_home)).DisplayValues := 'Home;Guest';
    adoqMoveGP.FieldByName(T_Stage_Pattern_Move_GP_home).DisplayWidth := 9;
    adoqMoveGP.FieldByName(T_Stage_Group_Name_name).DisplayLabel := 'Group';
    adoqMoveGP.FieldByName(T_Stage_Group_Name_name).DisplayWidth := 10;
    adoqMoveGP.FieldByName(T_Stage_Name_stage_name).DisplayLabel := 'Stage';;
    adoqMoveGP.FieldByName(T_Stage_Name_stage_name).DisplayWidth := 14;
    adoqMoveGP.FieldByName('pair_stage_name').DisplayLabel := 'Pair';
    adoqMoveGP.FieldByName('pair_stage_name').DisplayWidth:= 5;
    adoqMoveGP.FieldByName('cpair_stage_name').DisplayLabel := 'Cpair';
    adoqMoveGP.FieldByName('cpair_stage_name').DisplayWidth := 15;
  end;
end;

procedure TfrmTournamentPattern.FormCreate(Sender: TObject);
begin
  LinkingComponents;
  MoveGP;
  MovePP;
end;

procedure TfrmTournamentPattern.FormShow(Sender: TObject);
begin
  tsGroup.TabVisible := false;
  adotTeamType.Open;
  adotGeneralTeamType.Open;
  adotAgeTeamType.Open;
  adotSexTeamType.Open;
  adotPatternField.Open;
  LoadPatternFieldList;
  adotStageType.Open;
  LoadStageType;
  adotStageName.Open;
  adotStagePatternName.Open;
  adotStageType.Open;
  adotStage.Open;
  adotTournamentPattern.Open;
  SettingInterface;
  CheckPatternFieldList;
  LoadStageTreeView(tvStage);
  CheckStageType;
end;

procedure TfrmTournamentPattern.LinkingComponents;
begin
  adoCommand.Connection := dm.ADOConnection;
  adotTournamentPattern.Connection := dm.ADOConnection;
  adotTournamentPattern.TableName := T_Tournament_Pattern;
  dbgPattern.DataSource := dsTournamentPattern;
  dbePatternName.DataSource := dsTournamentPattern;
  dbePatternName.DataField := T_Tournament_Pattern_tournament_pattern_name;
  dbePatternDescription.DataSource := dsTournamentPattern;
  dbePatternDescription.DataField := T_Tournament_Pattern_pattern_description;
  adotTeamType.Connection := dm.ADOConnection;
  adotTeamType.TableName := T_Team_Type;
  dblcbTeamType.ListSource := dsTeamType;
  dblcbTeamType.ListField := T_Team_Type_team_type;
  dblcbTeamType.KeyField := T_Team_Type_id;
  dblcbTeamType.DataSource := dsTournamentPattern;
  dblcbTeamType.DataField := T_Tournament_Pattern_id_team_type;
  adotGeneralTeamType.Connection := dm.ADOConnection;
  adotGeneralTeamType.TableName := T_Team_Type_General;
  dblcbGeneralTeamType.ListSource := dsGeneralTeamType;
  dblcbGeneralTeamType.ListField := T_Team_Type_General_team_type_general;
  dblcbGeneralTeamType.KeyField := T_Team_Type_General_id;
  dblcbGeneralTeamType.DataSource := dsTournamentPattern;
  dblcbGeneralTeamType.DataField := T_Tournament_Pattern_id_team_type_general;
  adotAgeTeamType.Connection := dm.ADOConnection;
  adotAgeTeamType.TableName := T_Team_Type_Age;
  dblcbAgeTeamType.ListSource := dsAgeTeamType;
  dblcbAgeTeamType.ListField := T_Team_Type_Age_team_type_age;
  dblcbAgeTeamType.KeyField := T_Team_Type_Age_id;
  dblcbAgeTeamType.DataSource := dsTournamentPattern;
  dblcbAgeTeamType.DataField := T_Tournament_Pattern_id_team_type_age;
  adotSexTeamType.Connection := dm.ADOConnection;
  adotSexTeamType.TableName := T_Team_Type_Sex;
  dblcbSexTeamType.ListSource := dsSexTeamType;
  dblcbSexTeamType.ListField := T_Team_Type_Sex_team_type_sex;
  dblcbSexTeamType.KeyField := T_Team_Type_Sex_id;
  dblcbSexTeamType.DataSource := dsTournamentPattern;
  dblcbSexTeamType.DataField := T_Tournament_Pattern_id_team_type_sex;
  adotPatternField.Connection := dm.ADOConnection;
  adotPatternField.TableName := T_Tournament_Pattern_Field;
  adoqStage.Connection := dm.ADOConnection;
  dbeStageNumber.DataSource := dsStage;
  dbeStageNumber.DataField := T_Stage_Pattern_number;
  dbeStageNoL.DataSource := dsStage;
  dbeStageNoL.DataField := T_Stage_Pattern_number_of_lap;
  adotStageName.Connection := dm.ADOConnection;
  adotStageName.TableName := T_Stage_Name;
  dblcbStageName.ListSource := dsStageName;
  dblcbStageName.ListField := T_Stage_Name_stage_name;
  dblcbStageName.KeyField := T_Stage_Name_id;
  dblcbStageName.DataSource := dsStage;
  dblcbStageName.DataField := T_Stage_Pattern_id_stage_name;
  adotStagePatternName.Connection := dm.ADOConnection;
  adotStagePatternName.TableName := T_Stage_Pattern_Name;
  dblcbStagePatternName.ListSource := dsStagePatternName;
  dblcbStagePatternName.ListField := T_Stage_Pattern_Name_stage_pattern_name;
  dblcbStagePatternName.KeyField := T_Stage_Pattern_Name_id;
  dblcbStagePatternName.DataSource := dsStage;
  dblcbStagePatternName.DataField := T_Stage_Pattern_id_stage_pattern_name;
  adotStageType.Connection := dm.ADOConnection;
  adotStageType.TableName := T_Stage_Pattern_Type;
  dbgGroup.DataSource := dsGroup;
  adoqGroup.Connection := dm.ADOConnection;
  dbgMoveGP.DataSource := dsMoveGP;
  adoqMoveGP.Connection := dm.ADOConnection;
  adotStage.Connection := dm.ADOConnection;
  adotStage.TableName := T_Stage_Pattern;
  dbgMovePP.DataSource := dsMovePP;
  adoqMovePP.Connection := dm.ADOConnection;
end;

procedure TfrmTournamentPattern.clbFieldClickCheck(Sender: TObject);
begin
  adotPatternField.RecNo := clbField.ItemIndex + 1;
  adotTournamentPattern.Edit;
  if clbField.Checked[clbField.ItemIndex] then
    adotTournamentPattern.FieldByName(
      T_Tournament_Pattern_tournament_pattern_field).AsInteger :=
    adotTournamentPattern.FieldByName(
      T_Tournament_Pattern_tournament_pattern_field).AsInteger +
    adotPatternField.FieldByName(
      T_Tournament_Pattern_Field_field_code).AsInteger
  else
    adotTournamentPattern.FieldByName(
      T_Tournament_Pattern_tournament_pattern_field).AsInteger :=
    adotTournamentPattern.FieldByName(
      T_Tournament_Pattern_tournament_pattern_field).AsInteger -
    adotPatternField.FieldByName(
      T_Tournament_Pattern_Field_field_code).AsInteger;
  adotTournamentPattern.Post;
end;

procedure TfrmTournamentPattern.clbStageTypeClickCheck(Sender: TObject);
begin
  adotStageType.RecNo := clbStageType.ItemIndex + 1;
  adoqStage.Edit;
  if clbStageType.Checked[clbStageType.ItemIndex] then
    adoqStage.FieldByName(
      T_Stage_Pattern_stage_pattern_type).AsInteger :=
    adoqStage.FieldByName(
      T_Stage_Pattern_stage_pattern_type).AsInteger +
    adotStageType.FieldByName(
      T_Stage_Pattern_Type_type_code).AsInteger
  else
    adoqStage.FieldByName(
      T_Stage_Pattern_stage_pattern_type).AsInteger :=
    adoqStage.FieldByName(
      T_Stage_Pattern_stage_pattern_type).AsInteger -
    adotStageType.FieldByName(
      T_Stage_Pattern_Type_type_code).AsInteger;
  adoqStage.Post;
end;

procedure TfrmTournamentPattern.dblcbGroupNameCloseUp(Sender: TObject);
begin
  if adoqGroup.Modified then adoqGroup.Post;
  LoadGroupStage;
end;

procedure TfrmTournamentPattern.adotTournamentPatternAfterScroll(
  DataSet: TDataSet);
begin
  CheckPatternFieldList;
  LoadStageTreeView(tvStage);
  MoveGPreOpen;
  MovePPreOpen;
end;

procedure TfrmTournamentPattern.btnStageAddChildClick(Sender: TObject);
var idp: string;
begin
  idp := adoqStage.FieldByName(T_Stage_Pattern_id).AsString;
  adoqStage.Close;
  adoqStage.SQL.Clear;
  adoqStage.SQL.Add('insert into ' + T_Stage_Pattern + '(' +
                    T_Stage_Pattern_id_tournament_pattern + ', ' +
                    T_Stage_Pattern_id_parent_stage + ')');
  adoqStage.SQL.Add('values (' +
                    adotTournamentPattern.FieldByName(T_Tournament_Pattern_id).AsString +
                    ', ' + idp + ')');
  adoqStage.ExecSQL;
  LoadStageTreeView(tvStage);
end;

procedure TfrmTournamentPattern.btnStageAddClick(Sender: TObject);
var idp: string;
begin
  idp := adoqStage.FieldByName(T_Stage_Pattern_id_parent_stage).AsString;
  if idp = '' then idp := '0';
  adoqStage.Close;
  adoqStage.SQL.Clear;
  adoqStage.SQL.Add('insert into ' + T_Stage_Pattern + '(' +
                    T_Stage_Pattern_id_tournament_pattern + ', ' +
                    T_Stage_Pattern_id_parent_stage + ')');
  adoqStage.SQL.Add('values (' +
                    adotTournamentPattern.FieldByName(T_Tournament_Pattern_id).AsString +
                    ', ' + idp + ')');
  adoqStage.ExecSQL;
  LoadStageTreeView(tvStage);
end;

procedure TfrmTournamentPattern.btnStageDelClick(Sender: TObject);
var id: string;
begin
  if tvStage.Selected.Count <> 0 then
  begin
    MessageDlg('Node has child. Can''t delete', mtError,[mbOK],0);
    exit;
  end;
  id := adoqStage.FieldByName(T_Stage_Pattern_id).AsString;
  adoqStage.Close;
  adoqStage.SQL.Clear;
  adoqStage.SQL.Add('delete from ' + T_Stage_Pattern);
  adoqStage.SQL.Add('where ' + T_Stage_Pattern_id + ' = ' + id);
  adoqStage.ExecSQL;
  LoadStageTreeView(tvStage);
end;

procedure TfrmTournamentPattern.btnAddGroupClick(Sender: TObject);
var idg: integer;
begin
  if frmGroupNameSelect.ShowModal <> mrOK then exit;
  idg := frmGroupNameSelect.ID;
  adoqgroup.Close;
  adoqGroup.SQL.Clear;
  adoqGroup.SQL.Add('insert into ' + T_Stage_Group_Pattern + '(' +
                    T_Stage_Group_Pattern_id_group_name + ', ' +
                    T_Stage_Group_Pattern_id_stage_pattern + ')');
  adoqGroup.SQL.Add('values (' +
                    inttostr(idg) + ', ' +
                    adoqStage.FieldByName(T_Stage_Pattern_id).AsString +
                    ')');
  adoqGroup.ExecSQL;
  LoadGroupStage;
end;

procedure TfrmTournamentPattern.btnAddMoveGPClick(Sender: TObject);
begin
  with frmGP do
  begin
    tp := adotTournamentPattern.FieldByName(T_Tournament_Pattern_id).AsInteger;
    gst := 0; gn := 0; pos := 0; cp := 0; p := 0;
    if ShowModal <> mrOk then exit;
    adoCommand.CommandText :=
          'insert into ' + T_Stage_Pattern_Move_GP + '(' +
          T_Stage_Pattern_Move_GP_id_group_pattern + ', ' +
          T_Stage_Pattern_Move_GP_position + ', ' +
          T_Stage_Pattern_Move_GP_id_pair + ', ' +
          T_Stage_Pattern_Move_GP_home + ')' + 'values (' +
          inttostr(gn) + ', ' +
          inttostr(pos) + ', ' +
          inttostr(p) + ', ' +
          booltostr(h, true) + ')';
    adoCommand.Execute;
  end;
  MoveGPreOpen;
end;

procedure TfrmTournamentPattern.btnAddMovePPClick(Sender: TObject);
begin
  with frmPP do
  begin
    tp := adotTournamentPattern.FieldByName(T_Tournament_Pattern_id).AsInteger;
    ppf := 0; ppt := 0; pf := 0; pt := 0;
    if ShowModal <> mrOk then exit;
    adoCommand.CommandText :=
          'insert into ' + T_Stage_Pattern_Move_PP + '(' +
          T_Stage_Pattern_Move_PP_id_pair_from + ', ' +
          T_Stage_Pattern_Move_PP_won + ', ' +
          T_Stage_Pattern_Move_PP_id_pair_to + ', ' +
          T_Stage_Pattern_Move_PP_home + ')' + 'values (' +
          inttostr(pf) + ', ' +
          booltostr(w, true) + ', ' +
          inttostr(pt) + ', ' +
          booltostr(h, true) + ')';
    adoCommand.Execute;
  end;
  MovePPreOpen;
end;

procedure TfrmTournamentPattern.btnCreatePlayoffClick(Sender: TObject);
begin
  if frmPlayoff = nil then
    frmPlayoff := TfrmPlayoff.Create(Application);
  frmPlayoff.ID := adoqStage.FieldByName(T_Stage_Pattern_id).AsInteger;
  frmPlayoff.IDtp := adotTournamentPattern.
                     FieldByName(T_Tournament_Pattern_id).AsInteger;
  frmPlayoff.Show;
end;

procedure TfrmTournamentPattern.btnEditMoveGPClick(Sender: TObject);
begin
  with frmGP do
  begin
    tp := adotTournamentPattern.FieldByName(T_Tournament_Pattern_id).AsInteger;
    gst := adoqMoveGP.FieldByName(
             T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
    gn := adoqMoveGP.FieldByName(
            T_Stage_Group_Pattern + '.' + T_Stage_Group_Pattern_id).AsInteger;
    pos := adoqMoveGP.FieldByName(T_Stage_Pattern_Move_GP_position).AsInteger;
    cp := adoqMoveGP.FieldByName('id_parent_stage').AsInteger;
    p := adoqMoveGP.FieldByName(T_Stage_Pattern_Move_GP_id_pair).AsInteger;
    h := adoqMoveGP.FieldByName(T_Stage_Pattern_Move_GP_home).AsBoolean;
    if ShowModal <> mrOk then exit;
    adoCommand.CommandText :=
        'update ' + T_Stage_Pattern_Move_GP + ' set ' +
        T_Stage_Pattern_Move_GP_id_group_pattern + ' = ' + inttostr(gn) + ', '+
        T_Stage_Pattern_Move_GP_position + ' = ' + inttostr(pos) + ', ' +
        T_Stage_Pattern_Move_GP_id_pair + ' = ' + inttostr(p) +  ', ' +
        T_Stage_Pattern_Move_GP_home + ' = ' + booltostr(h, true) +
        ' where ' + T_Stage_Pattern_Move_GP_id + ' = ' +
        adoqMoveGP.FieldByName(T_Stage_Pattern_Move_GP + '.' +
                               T_Stage_Pattern_Move_GP_id).AsString;
    adoCommand.Execute;
  end;
  MoveGPreOpen;
end;

procedure TfrmTournamentPattern.btnEditMovePPClick(Sender: TObject);
begin
  with frmPP do
  begin
    tp := adotTournamentPattern.FieldByName(T_Tournament_Pattern_id).AsInteger;
    ppf := adoqMovePP.FieldByName(T_Stage_Pattern_id_parent_stage).AsInteger;
    pf := adoqMovePP.FieldByName(T_Stage_Pattern_Move_PP_id_pair_from).AsInteger;
    ppt := adoqMovePP.FieldByName('id_pp_to').AsInteger;
    pt := adoqMovePP.FieldByName(T_Stage_Pattern_Move_PP_id_pair_to).AsInteger;
    w := adoqMovePP.FieldByName(T_Stage_Pattern_Move_PP_won).AsBoolean;
    h := adoqMovePP.FieldByName(T_Stage_Pattern_Move_PP_home).AsBoolean;
    if ShowModal <> mrOk then exit;
    adoCommand.CommandText :=
        'update ' + T_Stage_Pattern_Move_PP + ' set ' +
        T_Stage_Pattern_Move_PP_id_pair_from + ' = ' + inttostr(pf) + ', '+
        T_Stage_Pattern_Move_PP_won + ' = ' + booltostr(w, true) + ', ' +
        T_Stage_Pattern_Move_PP_id_pair_to + ' = ' + inttostr(pt) +  ', ' +
        T_Stage_Pattern_Move_PP_home + ' = ' + booltostr(h, true) +
        ' where ' + T_Stage_Pattern_Move_PP_id + ' = ' +
        adoqMovePP.FieldByName(T_Stage_Pattern_Move_PP + '.' +
                               T_Stage_Pattern_Move_PP_id).AsString;
    adoCommand.Execute;
  end;
  MovePPreOpen;
end;

procedure TfrmTournamentPattern.btnDelClick(Sender: TObject);
var id: string;
begin
  id := adoqGroup.FieldByName(T_Stage_Group_Pattern + '.' +
                              T_Stage_Group_Pattern_id).AsString;
  adoqGroup.close;
  adoqGroup.SQL.Clear;
  adoqGroup.SQL.Add('delete from '+ T_Stage_Group_Pattern);
  adoqGroup.SQL.Add('where ' + T_Stage_Group_Pattern_id +
                    ' = ' + id);
  adoqGroup.ExecSQL;
  LoadGroupStage;
end;

procedure TfrmTournamentPattern.btnDelMoveGPClick(Sender: TObject);
begin
  adoqMoveGP.Delete;
end;

procedure TfrmTournamentPattern.btnDelMovePPClick(Sender: TObject);
begin
  adoqMovePP.Delete;
end;

procedure TfrmTournamentPattern.btnSaveClick(Sender: TObject);
begin
  if adoqGroup.Modified then adoqGroup.Post;
end;

procedure TfrmTournamentPattern.btnSaveMoveGPClick(Sender: TObject);
begin
  if adoqMoveGP.Modified then adoqMoveGP.Post;
end;

procedure TfrmTournamentPattern.btnSaveMovePPClick(Sender: TObject);
begin
  if adoqMovePP.Modified then adoqMovePP.Post;
end;

procedure TfrmTournamentPattern.btnStageSaveClick(Sender: TObject);
begin
  if adoqStage.Modified then adoqStage.Post;
  LoadStageTreeView(tvStage);
end;

procedure TfrmTournamentPattern.btnTournamentSaveClick(Sender: TObject);
begin
  if adotTournamentPattern.Modified then
    adotTournamentPattern.Post;
end;

procedure TfrmTournamentPattern.CheckPatternFieldList;
var i: integer;
begin
  adotPatternField.First;
  for i := 0 to adotPatternField.RecordCount - 1 do
  begin
    if adotPatternField.FieldByName(
         T_Tournament_Pattern_Field_field_code).AsInteger
       and
       adotTournamentPattern.FieldByName(
         T_Tournament_Pattern_tournament_pattern_field).AsInteger
       =
       adotPatternField.FieldByName(
         T_Tournament_Pattern_Field_field_code).AsInteger
    then clbField.Checked[i] := true
    else clbField.Checked[i] := false;
    adotPatternField.Next;
  end;
end;

procedure TfrmTournamentPattern.LoadPatternFieldList;
var i: integer;
begin
  clbField.Items.Clear;
  adotPatternField.First;
  for i := 0 to adotPatternField.RecordCount - 1 do
  begin
    clbField.Items.Add(adotPatternField.FieldByName(
      T_Tournament_Pattern_Field_field_name).AsString);
    adotPatternField.Next;
  end;
end;

procedure TfrmTournamentPattern.CheckStageType;
var i: integer;
begin
  adotStageType.First;
  for i := 0 to adotStageType.RecordCount - 1 do
  begin
    if adoqStage.FieldByName(
         T_Stage_Pattern_stage_pattern_type).AsInteger
       and
       adotStageType.FieldByName(
         T_Stage_Pattern_Type_type_code).AsInteger
       =
       adotStageType.FieldByName(
         T_Stage_Pattern_Type_type_code).AsInteger
    then clbStageType.Checked[i] := true
    else clbStageType.Checked[i] := false;
    adotStageType.Next;
  end;
end;

procedure TfrmTournamentPattern.LoadStageType;
begin
  clbStageType.Items.Clear;
  adotStageType.First;
  while not adotStageType.Eof do
  begin
    clbStageType.Items.Add(adotStageType.FieldByName(
      T_Stage_Pattern_Type_type_name).AsString);
    adotStageType.Next;
  end;
end;

procedure TfrmTournamentPattern.LoadStageTreeView(Atv: TTreeView);
var sl: TList;
    ts: PStage;
    j: integer;

    procedure lid(tr: TTreeNode; pid: integer);
    var i: integer;
        n: TtreeNode;
        pi: PInteger;
    begin
      for i := 0 to sl.count - 1 do
        if pstage(sl[i])^.idp = pid then
        begin
          n := tvstage.Items.AddChild(tr, pstage(sl[i])^.name);
          if n.Data = nil then
          begin
            New(pi);
            n.Data := pi;
          end;
          PInteger(n.Data)^ := pstage(sl[i])^.id;
          lid(n, pstage(sl[i])^.id);
        end;
    end;

begin
  Atv.Items.Clear;
  sl := tlist.Create;
  adoqStage.Close;
  adoqStage.SQL.Clear;
  adoqStage.SQL.Add('select * from ' + T_Stage_Pattern);
  adoqStage.SQL.Add('left join ' + T_Stage_Name);
  adoqStage.SQL.Add('on ' + T_Stage_Pattern + '.' + T_Stage_Pattern_id_stage_name +
    ' = ' + T_Stage_Name + '.' + T_Stage_Name_id);
  adoqStage.SQL.Add('where ' + T_Stage_Pattern_id_tournament_pattern +
    ' = ' + adotTournamentPattern.FieldByName(T_Tournament_Pattern_id).AsString);
  adoqStage.SQL.Add('order by ' + T_Stage_Pattern + '.' + T_Stage_Pattern_number + ' asc');
  adoqStage.Open;
  adoqStage.First;
  while not adoqStage.Eof do
  begin
    New(ts);
    ts^.id := adoqStage.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
    ts^.name := adoqStage.FieldByName(T_Stage_Name_stage_name).AsString;
    ts^.idp := adoqStage.FieldByName(T_Stage_Pattern_id_parent_stage).AsInteger;
    sl.Add(ts);
    adoqStage.Next;
  end;
  lid(nil, 0);
  for j := sl.Count - 1 downto 0 do
  begin
    ts := sl[j];
    sl.Delete(j);
    Dispose(ts);
  end;
  Atv.OnChange(Atv, Atv.Items.Item[0]);
end;

procedure TfrmTournamentPattern.SettingInterface;
var i: integer;
begin
  for i := 0 to adotTournamentPattern.FieldCount - 1 do
    adotTournamentPattern.Fields.Fields[i].Visible := false;
  adotTournamentPattern.FieldByName(
    T_Tournament_Pattern_tournament_pattern_name).Visible := true;
  adotTournamentPattern.FieldByName(
    T_Tournament_Pattern_tournament_pattern_name).DisplayLabel := 'Pattern name';
  adotTournamentPattern.FieldByName(
    T_Tournament_Pattern_tournament_pattern_name).DisplayWidth := 25;
end;

procedure TfrmTournamentPattern.tvStageChange(Sender: TObject; Node: TTreeNode);
begin
  adoqStage.Close;
  adoqStage.SQL.Clear;
  adoqStage.SQL.Add('select * from ' + T_Stage_Pattern);
  adoqStage.SQL.Add('where ' + T_Stage_Pattern_id + ' = ' +
    inttostr(PInteger(Node.Data)^));
  adoqStage.Open;
  CheckStageType;
  CheckingStageType;
end;

procedure TfrmTournamentPattern.CheckingStageType;
begin
  if adoqStage.FieldByName(
       T_Stage_Pattern_stage_pattern_type).AsInteger and
     st_Group_Stage =
     st_Group_Stage
  then begin
    tsGroup.TabVisible := true;
    LoadGroupStage;
  end
  else begin
    tsGroup.TabVisible := false;
    adoqGroup.Close;
  end;
  if adoqStage.FieldByName(
       T_Stage_Pattern_stage_pattern_type).AsInteger and
     st_Playoff =
     st_Playoff
  then tsPlayoff.TabVisible := true
  else tsPlayoff.TabVisible := false;
end;

procedure TfrmTournamentPattern.LoadGroupStage;
var i: integer;
begin
  adoqGroup.Close;
  adoqGroup.SQL.Clear;
  adoqGroup.SQL.Add('select *');
  adoqGroup.SQL.Add('from ' + T_Stage_Group_Pattern);
  adoqGroup.SQL.Add('left join ' + T_Stage_Group_Name);
  adoqGroup.SQL.Add('on ' + T_Stage_Group_Pattern +
                    '.' + T_Stage_Group_Pattern_id_group_name + ' = ' +
                    T_Stage_Group_Name + '.' + T_Stage_Group_Name_id);
  adoqGroup.SQL.Add('where ' + T_Stage_Group_Pattern_id_stage_pattern +
                    ' = ' + adoqStage.FieldByName(T_Stage_Pattern_id).AsString);
  adoqGroup.SQL.Add('order by ' + T_Stage_Group_Name_name + ' asc');
  adoqGroup.Open;
  for i := 0 to adoqGroup.FieldCount - 1 do
    adoqGroup.Fields.Fields[i].Visible := false;
  adoqGroup.FieldByName(T_Stage_Group_Name_name).Visible := true;
  adoqGroup.FieldByName(T_Stage_Group_Name_name).DisplayLabel := 'Name';
  adoqGroup.FieldByName(T_Stage_Group_Name_name).DisplayWidth := 7;
end;

end.
