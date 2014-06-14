unit GroupToPair;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormPattern, ExtCtrls, StdCtrls, DBCtrls, Mask, DB, ADODB, Grids,
  DBGrids;

type
  TfrmGP = class(Tfrm)
    Label3: TLabel;
    adoqGroupStage: TADOQuery;
    dsGroupStage: TDataSource;
    dsGroupName: TDataSource;
    adoqGroupName: TADOQuery;
    dbgGroupStage: TDBGrid;
    dbgGroupName: TDBGrid;
    ePos: TEdit;
    dbgCpair: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    dsCpair: TDataSource;
    adoqCpair: TADOQuery;
    adoqPair: TADOQuery;
    dsPair: TDataSource;
    dbgPair: TDBGrid;
    Label4: TLabel;
    cbHome: TCheckBox;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure adoqGroupStageAfterScroll(DataSet: TDataSet);
    procedure adoqCpairAfterScroll(DataSet: TDataSet);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure GroupStageView;
    procedure GroupNameView;
    procedure CpairView;
    procedure PairView;
  public
    { Public declarations }
    tp, gst, gn, pos, cp, p: integer;
    h: boolean;
  end;

var
  frmGP: TfrmGP;

implementation

uses DataModule, DBConst;

{$R *.dfm}

procedure TfrmGP.adoqCpairAfterScroll(DataSet: TDataSet);
begin
  inherited;
  PairView;
end;

procedure TfrmGP.adoqGroupStageAfterScroll(DataSet: TDataSet);
begin
  inherited;
  GroupNameView;
end;

procedure TfrmGP.btnOkClick(Sender: TObject);
begin
  inherited;
  gst := adoqGroupStage.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
  gn := adoqGroupName.FieldByName(T_Stage_Group_Pattern + '.' + T_Stage_Group_Pattern_id).AsInteger;
  pos := strtoint(ePos.Text);
  cp := adoqCpair.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
  p := adoqPair.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
  h := cbHome.Checked;
end;

procedure TfrmGP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  adoqGroupName.Close;
  adoqPair.Close;
  adoqGroupStage.Close;
  adoqCpair.Close
end;

procedure TfrmGP.FormCreate(Sender: TObject);
begin
  inherited;
  tp := 0; gst := 0; gn := 0; pos := 0; cp := 0; p := 0;
  with adoqGroupStage, SQL do
  begin
    Connection := dm.ADOConnection;
    Clear;
    Add('select * from ' + T_Stage_Pattern);
    Add('left join ' + T_Stage_Name);
    Add('on ' + T_Stage_Name + '.' + T_Stage_Name_id + ' = ' +
        T_Stage_Pattern + '.' + T_Stage_Pattern_id_stage_name);
    Add('where ' + T_Stage_Pattern_id_tournament_pattern + ' = :tp');
    Add('and ' + T_Stage_Pattern_stage_pattern_type + ' = ' +
        inttostr(st_Group_Stage));
    Add('order by ' + T_Stage_Pattern_number + ' asc');
    dbgGroupStage.DataSource := dsGroupStage;
  end;
  with adoqGroupName, SQL do
  begin
    Connection := dm.ADOConnection;
    Clear;
    Add('select * from (' + T_Stage_Group_Pattern);
    Add('left join ' + T_Stage_Group_Name);
    Add('on ' + T_Stage_Group_Pattern + '.' + T_Stage_Group_Pattern_id_group_name +
        ' = ' + T_Stage_Group_Name + '.' + T_Stage_Group_Name_id + ')');
    Add('where ' + T_Stage_Group_Pattern_id_stage_pattern + ' = :sp');
    Add('order by ' + T_Stage_Group_Name_name + ' asc');
    dbgGroupName.DataSource := dsGroupName;
  end;
  with adoqCpair, SQL do
  begin
    Connection := dm.ADOConnection;
    clear;
    Add('select * from ' + T_Stage_Pattern);
    Add('left join ' + T_Stage_Name);
    Add('on ' + T_Stage_Name + '.' + T_Stage_Name_id + ' = ' +
        T_Stage_Pattern + '.' + T_Stage_Pattern_id_stage_name);
    Add('where ' + T_Stage_Pattern_id_tournament_pattern + ' = :tp');
    Add('and ' + T_Stage_Pattern_stage_pattern_type + ' = ' +
        inttostr(st_Contain_Pair));
    Add('order by ' + T_Stage_Pattern_number + ' asc');
    dbgCpair.DataSource := dsCpair;
  end;
  with adoqPair, SQL do
  begin
    Connection := dm.ADOConnection;
    Clear;
    Add('select * from ' + T_Stage_Pattern);
    Add('left join ' + T_Stage_Name);
    Add('on ' + T_Stage_Name + '.' + T_Stage_Name_id + ' = ' +
        T_Stage_Pattern + '.' + T_Stage_Pattern_id_stage_name);
    Add('where ' + T_Stage_Pattern_id_parent_stage + ' = :sp');
    Add('order by ' + T_Stage_Pattern_number + ' asc');
    dbgPair.DataSource := dsPair;
  end;
end;

procedure TfrmGP.FormShow(Sender: TObject);
begin
  inherited;
  GroupStageView;
  CpairView;
end;

procedure TfrmGP.CpairView;
var i: integer;
begin
  with adoqCpair do
  begin
    Parameters.ParamByName('tp').Value := tp;
    Open;
    for i := 0 to FieldCount - 1 do
      Fields.Fields[i].Visible := false;
    FieldByName(T_Stage_Name_stage_name).Visible := true;
    FieldByName(T_Stage_Name_stage_name).DisplayLabel := 'CPair stage';
    FieldByName(T_Stage_Name_stage_name).DisplayWidth := 17;
    if cp <> 0 then
      Locate(T_Stage_Pattern + '.' + T_Stage_Pattern_id,
             inttostr(cp), [loCaseInsensitive]);
  end;
end;

procedure TfrmGP.PairView;
var i: integer;
begin
  with adoqPair do
  begin
    Close;
    Parameters.ParamByName('sp').Value :=
      adoqCpair.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
    Open;
    for i := 0 to FieldCount - 1 do
      Fields.Fields[i].Visible := false;
    FieldByName(T_Stage_Name_stage_name).Visible := true;
    FieldByName(T_Stage_Name_stage_name).DisplayLabel := 'Pair name';
    FieldByName(T_Stage_Name_stage_name).DisplayWidth := 10;
    if p <> 0 then begin
      Locate(T_Stage_Pattern + '.' + T_Stage_Pattern_id,
             inttostr(p), [loCaseInsensitive]);
      cbHome.Checked := h;
    end;
  end;
end;

procedure TfrmGP.GroupStageView;
var i: integer;
begin
  with adoqGroupStage do
  begin
    Parameters.ParamByName('tp').Value := tp;
    Open;
    for i := 0 to FieldCount - 1 do
      Fields.Fields[i].Visible := false;
    FieldByName(T_Stage_Name_stage_name).Visible := true;
    FieldByName(T_Stage_Name_stage_name).DisplayLabel := 'Group stage';
    FieldByName(T_Stage_Name_stage_name).DisplayWidth := 10;
    if gst <> 0 then
      Locate(T_Stage_Pattern + '.' + T_Stage_Pattern_id,
             inttostr(gst), [loCaseInsensitive]);
  end;
end;

procedure TfrmGP.GroupNameView;
var i: integer;
begin
  with adoqGroupName do
  begin
    Close;
    Parameters.ParamByName('sp').Value :=
      adoqGroupStage.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
    Open;
    for i := 0 to FieldCount - 1 do
      Fields.Fields[i].Visible := false;
    FieldByName(T_Stage_Group_Name_name).Visible := true;
    FieldByName(T_Stage_Group_Name_name).DisplayLabel := 'Group name';
    FieldByName(T_Stage_Group_Name_name).DisplayWidth := 10;
    if gn <> 0 then begin
      Locate(T_Stage_Group_Pattern + '.' + T_Stage_Group_Pattern_id,
             inttostr(gn), [loCaseInsensitive]);
      ePos.Text := inttostr(pos);
    end;
  end;
end;

end.
