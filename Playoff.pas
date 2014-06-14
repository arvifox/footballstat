unit Playoff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ADODB, DBCtrls, Grids, DBGrids;

type
  TfrmPlayoff = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlTuning: TPanel;
    pnlPlayoff: TPanel;
    btnAddLabel: TButton;
    btnAddPair: TButton;
    btnSave: TButton;
    adotPlayoff: TADOTable;
    pnlStage: TPanel;
    dbgCpair: TDBGrid;
    dbgPair: TDBGrid;
    dsCpair: TDataSource;
    dsPair: TDataSource;
    adoqCpair: TADOQuery;
    adoqPair: TADOQuery;
    btnSetStage: TButton;
    btnSet: TButton;
    btnHide: TButton;
    procedure btnAddLabelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlPlayoffDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure pnlPlayoffDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddPairClick(Sender: TObject);
    procedure btnSetStageClick(Sender: TObject);
    procedure btnSetClick(Sender: TObject);
    procedure btnHideClick(Sender: TObject);
    procedure adoqCpairAfterScroll(DataSet: TDataSet);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
    noEdit, noPair: integer;
    curPair: TPanel;
    procedure PlayoffDraw;
    procedure PlayoffSave;
    procedure PlayoffOpen;
    procedure LinkingComponents;
    procedure AddLabel(X, Y: Integer; Atext: string);
    Procedure AddPair(X, Y, idpair: Integer; ah: string);
    procedure PairOpen;
    procedure CpairOpen;
    procedure PairClick(Sender: TObject);
  public
    { Public declarations }
    ID, IDtp: integer;
  end;

var
  frmPlayoff: TfrmPlayoff;

implementation

uses DataModule, DBConst;

{$R *.dfm}

procedure TfrmPlayoff.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WndParent := 0;
end;

procedure TfrmPlayoff.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoqPair.Close;
  adoqCpair.Close;
  adotPlayoff.Close;
  Free;
  frmPlayoff := nil;
end;

procedure TfrmPlayoff.FormCreate(Sender: TObject);
begin
  LinkingComponents;
  curPair := nil;
end;

procedure TfrmPlayoff.PairOpen;
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
    FieldByName(T_Stage_Name_stage_name).DisplayLabel := 'Pair';
    FieldByName(T_Stage_Name_stage_name).DisplayWidth := 10;
  end;
end;

procedure TfrmPlayoff.CpairOpen;
var i: integer;
begin
  with adoqCpair do
  begin
    close;
    Parameters.ParamByName('tp').Value := Idtp;
    open;
    for i := 0 to FieldCount - 1 do
      Fields.Fields[i].Visible := false;
    FieldByName(T_Stage_Name_stage_name).Visible := true;
    FieldByName(T_Stage_Name_stage_name).DisplayLabel := 'Stage';
    FieldByName(T_Stage_Name_stage_name).DisplayWidth := 17;
  end;
end;

procedure TfrmPlayoff.FormShow(Sender: TObject);
begin
  noEdit := 0;
  noPair := 0;
  CpairOpen;
  PairOpen;
  PlayoffOpen;
end;

procedure TfrmPlayoff.PlayoffOpen;
begin
  with adotPlayoff do
  begin
    Open;
    if Locate(T_Stage_Playoff_id_stage_pattern , ID, [loCaseInsensitive])
    then
      PlayoffDraw
    else
    begin
      Insert;
      FieldByName(T_Stage_Playoff_id_stage_pattern).Value := ID;
      if Modified then Post;
    end;
  end;
end;

procedure TfrmPlayoff.AddLabel(X, Y: Integer; Atext: string);
var ed: TEdit;
begin
  ed := TEdit.Create(pnlPlayoff);
  ed.Parent := pnlPlayoff;
  ed.Name := 'edit' + inttostr(noEdit);
  inc(noEdit);
  ed.Left := X;
  ed.Top := Y;
  ed.Width := 130;
  ed.Text := Atext;
  ed.DragCursor := crDrag;
  ed.DragMode := dmAutomatic;
  ed.DragKind := dkDrag;
end;

Procedure TfrmPlayoff.AddPair(X, Y, idpair: Integer; ah: string);
var pn: TPanel;
    lb: TLabel;
    ed: TEdit;
begin
  pn := TPanel.Create(pnlPlayoff);
  pn.Parent := pnlPlayoff;
  pn.Name := 'panel' + inttostr(noPair);
  inc(noPair);
  pn.Left := x;
  pn.Top := y;
  pn.Height := 90;
  pn.Width := 130;
  pn.Caption := '';
  pn.DragCursor := crDrag;
  pn.DragMode := dmAutomatic;
  pn.DragKind := dkDrag;
  pn.Tag := idpair;
  pn.ShowHint := true;
  pn.Hint := ah;
  //
  lb := TLabel.Create(pn);
  lb.Parent := pn;
  lb.Name := 'home' + inttostr(noPair);
  lb.Align := alTop;
  lb.Alignment := taCenter;
  lb.Caption := 'Home team';
  lb.Font.Size := 12;
  //
  lb := TLabel.Create(pn);
  lb.Parent := pn;
  lb.Name := 'guest' + inttostr(noPair);
  lb.Align := alBottom;
  lb.Alignment := taCenter;
  lb.Caption := 'Guest team';
  lb.Font.Size := 12;
  //
  lb := TLabel.Create(pn);
  lb.Parent := pn;
  lb.Name := 'colon' + inttostr(noPair);
  lb.Caption := ':';
  lb.Font.Size := 10;
  lb.Top:= 26;
  lb.Left := 62;
  //
  ed := TEdit.Create(pn);
  ed.Parent := pn;
  ed.Name := 'gh' + inttostr(noPair);
  ed.Alignment := taRightJustify;
  ed.Text := '2';
  ed.Font.Size := 10;
  ed.Top:= 23;
  ed.Left := 35;
  ed.Height := 24;
  ed.Width := 21;
  ed.OnClick := PairClick;
  //
  ed := TEdit.Create(pn);
  ed.Parent := pn;
  ed.Name := 'gg' + inttostr(noPair);
  ed.Alignment := taLeftJustify;
  ed.Text := '2';
  ed.Font.Size := 10;
  ed.Top:= 23;
  ed.Left := 73;
  ed.Height := 24;
  ed.Width := 21;
  //
  lb := TLabel.Create(pn);
  lb.Parent := pn;
  lb.Name := 'aet' + inttostr(noPair);
  lb.Caption := 'a.e.t.';
  lb.Top:= 28;
  lb.Left := 100;
  //
  lb := TLabel.Create(pn);
  lb.Parent := pn;
  lb.Name := 'colonpso' + inttostr(noPair);
  lb.Caption := ':';
  lb.Font.Size := 8;
  lb.Top:= 53;
  lb.Left := 63;
  //
  ed := TEdit.Create(pn);
  ed.Parent := pn;
  ed.Name := 'ghpso' + inttostr(noPair);
  ed.Alignment := taRightJustify;
  ed.Text := '4';
  ed.Top:= 51;
  ed.Left := 35;
  ed.Height := 17;
  ed.Width := 21;
  //
  ed := TEdit.Create(pn);
  ed.Parent := pn;
  ed.Name := 'ggpso' + inttostr(noPair);
  ed.Alignment := taLeftJustify;
  ed.Text := '3';
  ed.Top:= 51;
  ed.Left := 73;
  ed.Height := 17;
  ed.Width := 21;
  //
  lb := TLabel.Create(pn);
  lb.Parent := pn;
  lb.Name := 'pso' + inttostr(noPair);
  lb.Caption := 'p.s.o.';
  lb.Top:= 53;
  lb.Left := 100;
end;

procedure TfrmPlayoff.PairClick(Sender: TObject);
begin
  curPair := TPanel(TEdit(Sender).Parent);
end;

procedure TfrmPlayoff.adoqCpairAfterScroll(DataSet: TDataSet);
begin
  PairOpen;
end;

procedure TfrmPlayoff.btnAddLabelClick(Sender: TObject);
begin
  AddLabel(10, 10, 'Label');
end;

procedure TfrmPlayoff.btnAddPairClick(Sender: TObject);
begin
  AddPair(30, 30, 0, '');
end;

procedure TfrmPlayoff.btnHideClick(Sender: TObject);
begin
  pnlStage.Hide;
end;

procedure TfrmPlayoff.btnSaveClick(Sender: TObject);
begin
  PlayoffSave;
end;

procedure TfrmPlayoff.btnSetClick(Sender: TObject);
begin
  if curPair = nil then
  begin
    ShowMessage('Pair not select');
    exit;
  end;
  curPair.Tag := adoqPair.FieldByName(
                 T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
  curPair.Hint := adoqCpair.FieldByName(T_Stage_Name_stage_name).AsString
                  + '; ' +
                  adoqPair.FieldByName(T_Stage_Name_stage_name).AsString;
end;

procedure TfrmPlayoff.btnSetStageClick(Sender: TObject);
begin
  pnlStage.Show;
end;

procedure TfrmPlayoff.LinkingComponents;
begin
  with adotPlayoff do
  begin
    Connection := dm.ADOConnection;
    TableName := T_Stage_Playoff;
  end;
  dbgCpair.DataSource := dsCpair;
  dbgPair.DataSource := dsPair;
  with adoqCpair, sql do
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
  with adoqPair, sql do
  begin
    Connection := dm.ADOConnection;
    clear;
    Add('select * from ' + T_Stage_Pattern);
    Add('left join ' + T_Stage_Name);
    Add('on ' + T_Stage_Name + '.' + T_Stage_Name_id + ' = ' +
        T_Stage_Pattern + '.' + T_Stage_Pattern_id_stage_name);
    Add('where ' + T_Stage_Pattern_id_parent_stage + ' = :sp');
    Add('order by ' + T_Stage_Pattern_number + ' asc');
  end;
end;

procedure TfrmPlayoff.PlayoffSave;
var PlayoffStream: TStream;
    i, j, x, y, c: integer;
    s : string;
begin
  with PlayoffStream do
  begin
    adotPlayoff.Edit;
    PlayoffStream := adotPlayoff.CreateBlobStream(
                     adotPlayoff.FieldByName(T_Stage_Playoff_form), bmWrite);
    WriteBuffer(noEdit, sizeof(integer));
    for i := 0 to pnlPlayoff.ComponentCount - 1 do
    begin
      if pnlPlayoff.Components[i] is TEdit then
      begin
        x := TEdit(pnlPlayoff.Components[i]).Left;
        y := TEdit(pnlPlayoff.Components[i]).top;
        WriteBuffer(x, sizeof(integer));
        WriteBuffer(y, sizeof(integer));
        s := TEdit(pnlPlayoff.Components[i]).Text;
        c := Length(s);
        WriteBuffer(c, sizeof(integer));
        c := sizeof(s[1]);
        WriteBuffer(c, sizeof(integer));
        for j := 1 to Length(s) do
          WriteBuffer(s[j], c); {WriteBuffer(PChar(s)^, c);}
      end;
    end;
    WriteBuffer(noPair, sizeof(integer));
    for i := 0 to pnlPlayoff.ComponentCount - 1 do
    begin
      if pnlPlayoff.Components[i] is TPanel then
      begin
        x := TPanel(pnlPlayoff.Components[i]).Left;
        y := TPanel(pnlPlayoff.Components[i]).top;
        WriteBuffer(x, sizeof(integer));
        WriteBuffer(y, sizeof(integer));
        c := TPanel(pnlPlayoff.Components[i]).Tag;
        WriteBuffer(c, sizeof(integer));
        s := TPanel(pnlPlayoff.Components[i]).Hint;
        c := Length(s);
        WriteBuffer(c, sizeof(integer));
        c := sizeof(s[1]);
        WriteBuffer(c, sizeof(integer));
        for j := 1 to Length(s) do
          WriteBuffer(s[j], c); {WriteBuffer(PChar(s)^, c);}
      end;
    end;
    Free;
    if adotPlayoff.Modified then adotPlayoff.post;
  end;
end;

procedure TfrmPlayoff.PlayoffDraw;
var PlayoffStream: TStream;
    i, j, x, y, l, c, no, ta: integer;
    s: string;
    ch: PChar;
begin
  PlayoffStream := adotPlayoff.CreateBlobStream(
                   adotPlayoff.FieldByName(T_Stage_Playoff_form), bmRead);
  new(ch);
  with PlayoffStream do
  begin
    ReadBuffer(no, sizeof(integer));
    for i := 0 to no - 1 do
    begin
      ReadBuffer(x, sizeof(integer));
      ReadBuffer(y, sizeof(integer));
      ReadBuffer(l, sizeof(integer));
      ReadBuffer(c, sizeof(integer));
      s := '';
      for j := 1 to l do
      begin
        ReadBuffer(ch^, c);
        s := s + ch^;
      end;
      AddLabel(x, y, s);
    end;
    ReadBuffer(no, sizeof(integer));
    for i := 0 to no - 1 do
    begin
      ReadBuffer(x, sizeof(integer));
      ReadBuffer(y, sizeof(integer));
      ReadBuffer(ta, sizeof(integer));
      ReadBuffer(l, sizeof(integer));
      ReadBuffer(c, sizeof(integer));
      s := '';
      for j := 1 to l do
      begin
        ReadBuffer(ch^, c);
        s := s + ch^;
      end;
      AddPair(x, y, ta, s);
    end;
    Free;
  end;
end;

procedure TfrmPlayoff.pnlPlayoffDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  x := round(x / 10) * 10;
  y := round(y / 10) * 10;
  TControl(Source).Left := x;
  TControl(Source).Top := y;
end;

procedure TfrmPlayoff.pnlPlayoffDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TEdit) or (Source is TPanel);
end;

end.
