unit PairToPair;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, ADODB;

type
  TfrmPP = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    dbgPpairFrom: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    dbgPpairTo: TDBGrid;
    dbgPairFrom: TDBGrid;
    dbgPairTo: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    cbWon: TCheckBox;
    cbHome: TCheckBox;
    btnOk: TButton;
    btnCancel: TButton;
    dsPpairFrom: TDataSource;
    dsPairFrom: TDataSource;
    dsPpairTo: TDataSource;
    dsPairTo: TDataSource;
    adoqPpairFrom: TADOQuery;
    adoqPairFrom: TADOQuery;
    adoqPpairTo: TADOQuery;
    adoqPairTo: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure adoqPpairFromAfterScroll(DataSet: TDataSet);
    procedure adoqPpairToAfterScroll(DataSet: TDataSet);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure PpairFromView;
    procedure PairFromView;
    procedure PpairToView;
    procedure PairToView;
  public
    { Public declarations }
    tp, ppf, ppt, pf, pt: integer;
    w, h: boolean;
  end;

var
  frmPP: TfrmPP;

implementation

uses DataModule, DBConst;

{$R *.dfm}

procedure TfrmPP.adoqPpairFromAfterScroll(DataSet: TDataSet);
begin
  PairFromView;
end;

procedure TfrmPP.adoqPpairToAfterScroll(DataSet: TDataSet);
begin
  PairToView;
end;

procedure TfrmPP.btnOkClick(Sender: TObject);
begin
//
  ppf := adoqPpairFrom.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
  ppt := adoqPpairTo.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
  pf := adoqPairFrom.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
  pt := adoqPairTo.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
  w := cbWon.Checked;
  h := cbHome.Checked;
end;

procedure TfrmPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoqPpairTo.Close;
  adoqPpairFrom.Close;
  adoqPairFrom.Close;
  adoqPairTo.Close;
end;

procedure TfrmPP.FormCreate(Sender: TObject);
begin
  ppf := 0; ppt := 0; pf := 0; pt := 0; w := false; h := false;
  dbgPpairFrom.DataSource := dsPpairFrom;
  dbgPairFrom.DataSource := dsPairFrom;
  dbgPpairTo.DataSource := dsPpairTo;
  dbgPairTo.DataSource := dsPairTo;
  with adoqPpairFrom, sql do
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
  end;
  with adoqPairFrom, sql do
  begin
    Connection := dm.ADOConnection;
    Clear;
    Add('select * from ' + T_Stage_Pattern);
    Add('left join ' + T_Stage_Name);
    Add('on ' + T_Stage_Name + '.' + T_Stage_Name_id + ' = ' +
        T_Stage_Pattern + '.' + T_Stage_Pattern_id_stage_name);
    Add('where ' + T_Stage_Pattern_id_parent_stage + ' = :sp');
    Add('order by ' + T_Stage_Pattern_number + ' asc');
  end;
  with adoqPpairTo, sql do
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
  end;
  with adoqPairTo, sql do
  begin
    Connection := dm.ADOConnection;
    Clear;
    Add('select * from ' + T_Stage_Pattern);
    Add('left join ' + T_Stage_Name);
    Add('on ' + T_Stage_Name + '.' + T_Stage_Name_id + ' = ' +
        T_Stage_Pattern + '.' + T_Stage_Pattern_id_stage_name);
    Add('where ' + T_Stage_Pattern_id_parent_stage + ' = :sp');
    Add('order by ' + T_Stage_Pattern_number + ' asc');
  end;
end;

procedure TfrmPP.FormShow(Sender: TObject);
begin
  PpairFromView;
  PpairToView;
end;

procedure TfrmPP.PpairFromView;
var i: integer;
begin
  with adoqPpairFrom do
  begin
    Parameters.ParamByName('tp').Value := tp;
    Open;
    for i := 0 to FieldCount - 1 do
      Fields.Fields[i].Visible := false;
    FieldByName(T_Stage_Name_stage_name).Visible := true;
    FieldByName(T_Stage_Name_stage_name).DisplayLabel := 'CPairF stage';
    FieldByName(T_Stage_Name_stage_name).DisplayWidth := 17;
    if ppf <> 0 then
      Locate(T_Stage_Pattern + '.' + T_Stage_Pattern_id,
             inttostr(ppf), [loCaseInsensitive]);
  end;
end;

procedure TfrmPP.PairFromView;
var i: integer;
begin
  with adoqPairFrom do
  begin
    Close;
    Parameters.ParamByName('sp').Value :=
      adoqPpairFrom.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
    Open;
    for i := 0 to FieldCount - 1 do
      Fields.Fields[i].Visible := false;
    FieldByName(T_Stage_Name_stage_name).Visible := true;
    FieldByName(T_Stage_Name_stage_name).DisplayLabel := 'PairF name';
    FieldByName(T_Stage_Name_stage_name).DisplayWidth := 10;
    if pf <> 0 then begin
      Locate(T_Stage_Pattern + '.' + T_Stage_Pattern_id,
             inttostr(pf), [loCaseInsensitive]);
      cbWon.Checked := w;
    end;
  end;
end;

procedure TfrmPP.PpairToView;
var i: integer;
begin
  with adoqPpairTo do
  begin
    Parameters.ParamByName('tp').Value := tp;
    Open;
    for i := 0 to FieldCount - 1 do
      Fields.Fields[i].Visible := false;
    FieldByName(T_Stage_Name_stage_name).Visible := true;
    FieldByName(T_Stage_Name_stage_name).DisplayLabel := 'CPairT stage';
    FieldByName(T_Stage_Name_stage_name).DisplayWidth := 17;
    if ppt <> 0 then
      Locate(T_Stage_Pattern + '.' + T_Stage_Pattern_id,
             inttostr(ppt), [loCaseInsensitive]);
  end;
end;

procedure TfrmPP.PairToView;
var i: integer;
begin
  with adoqPairTo do
  begin
    Close;
    Parameters.ParamByName('sp').Value :=
      adoqPpairTo.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
    Open;
    for i := 0 to FieldCount - 1 do
      Fields.Fields[i].Visible := false;
    FieldByName(T_Stage_Name_stage_name).Visible := true;
    FieldByName(T_Stage_Name_stage_name).DisplayLabel := 'PairT name';
    FieldByName(T_Stage_Name_stage_name).DisplayWidth := 10;
    if pt <> 0 then
    begin
      Locate(T_Stage_Pattern + '.' + T_Stage_Pattern_id,
             inttostr(pt), [loCaseInsensitive]);
      cbHome.Checked := h;
    end;
  end;
end;

end.
