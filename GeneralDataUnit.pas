unit GeneralDataUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TfrmGeneralData = class(TForm)
    lbTypeDataDirectory: TListBox;
    pnlBottom: TPanel;
    pnlTop: TPanel;
    dbgTypeData: TDBGrid;
    procedure lbTypeDataDirectoryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    slTypeTableName: TStringList;
  public
    { Public declarations }
  end;

var
  frmGeneralData: TfrmGeneralData;

implementation

uses DataModule, MainUnit, DBConst;

{$R *.dfm}

procedure TfrmGeneralData.FormCreate(Sender: TObject);
begin
  slTypeTableName := TStringList.Create;
  slTypeTableName.Add(T_Card_Reason);
  slTypeTableName.Add(T_Card_Type);
  slTypeTableName.Add(T_Condition_Type);
  slTypeTableName.Add(T_Distance_Pass);
  slTypeTableName.Add(T_Distance_Type);
  slTypeTableName.Add(T_Foul_Type);
  slTypeTableName.Add(T_Injury_Type);
  slTypeTableName.Add(T_Match_Events_Type);
  slTypeTableName.Add(T_Match_Result);
  slTypeTableName.Add(T_Org_Post);
  slTypeTableName.Add(T_Org_Type);
  slTypeTableName.Add(T_Pass_Result);
  slTypeTableName.Add(T_Penalty_Attack);
  slTypeTableName.Add(T_Penalty_Goalkeeper);
  slTypeTableName.Add(T_Place_Type);
  slTypeTableName.Add(T_Position_Classic);
  slTypeTableName.Add(T_Position_Play);
  slTypeTableName.Add(T_Referee_Match_Type);
  slTypeTableName.Add(T_Shot_Result);
  slTypeTableName.Add(T_Stage_Group_Name);
  slTypeTableName.Add(T_Stage_Name);
  slTypeTableName.Add(T_Stage_Pattern_Name);
  slTypeTableName.Add(T_Stage_Pattern_Type);
  slTypeTableName.Add(T_Statistics_Data_Numerical);
  slTypeTableName.Add(T_Statistics_Type_Numerical);
  slTypeTableName.Add(T_Substitution_Reason);
  slTypeTableName.Add(T_Team_Type);
  slTypeTableName.Add(T_Team_Type_Age);
  slTypeTableName.Add(T_Team_Type_General);
  slTypeTableName.Add(T_Team_Type_Sex);
  slTypeTableName.Add(T_Tournament_Officials_Type);
  slTypeTableName.Add(T_Tournament_Pattern_Field);
end;

procedure TfrmGeneralData.FormDestroy(Sender: TObject);
begin
  slTypeTableName.Free;
end;

procedure TfrmGeneralData.lbTypeDataDirectoryClick(Sender: TObject);
begin
  dm.adotTable.Active := false;
  dm.adotTable.TableName := slTypeTableName.Strings[lbTypeDataDirectory.ItemIndex];
  dm.adotTable.Active := true;
  dm.adotTable.FieldByName('id').Visible := false;
  dm.adotTable.Fields.Fields[1].DisplayLabel :=
    lbTypeDataDirectory.Items.Strings[lbTypeDataDirectory.ItemIndex];
  dm.adotTable.Fields.Fields[1].DisplayWidth := 25;
end;

end.
