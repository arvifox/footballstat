unit Tournament;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls, DBCtrls, DB, ADODB,
  Mask, jpeg, ExtDlgs;

type

   TMatch = class
     private
       id, idht, idgt, gh, gg, n, psogh, psogg: integer;
       d, t: TDateTime;
       aet, pso: boolean;
       hn, gn: string;
     public
       constructor Create(Aid, Aidht, Aidgt: integer; Ahn, Agn: string);
       destructor Destroy; override;
   end;

  TfrmTournament = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    tvStage: TTreeView;
    pcTournament: TPageControl;
    tsMatch: TTabSheet;
    dsTournament: TDataSource;
    adotTournament: TADOTable;
    adotTeam: TADOTable;
    btnOpenMatch: TButton;
    dsApplicationTeam: TDataSource;
    tsPlayer: TTabSheet;
    DBGrid2: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid3: TDBGrid;
    cbByposition: TCheckBox;
    cbByteam: TCheckBox;
    cbByAgeOver: TCheckBox;
    cbByAgeUnder: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    pnlStages: TPanel;
    adoqStage: TADOQuery;
    tsTournamentOverview: TTabSheet;
    dbeTournamentName: TDBEdit;
    tsApplicationTeams: TTabSheet;
    labSeason: TLabel;
    dbeSeasonY: TDBEdit;
    pnlTournamentTop: TPanel;
    imEmblem: TImage;
    pnlTounamentName: TPanel;
    dbeSeasonYY: TDBEdit;
    labYY: TLabel;
    opdOpen: TOpenPictureDialog;
    adoq: TADOQuery;
    dsSeason: TDataSource;
    adotSeason: TADOTable;
    labHost: TLabel;
    mHost: TMemo;
    dbgApplicationTeam: TDBGrid;
    adoqApplicationTeam: TADOQuery;
    tsStatistics: TTabSheet;
    sbMatch: TScrollBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tvStageChange(Sender: TObject; Node: TTreeNode);
    procedure imEmblemDblClick(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
    lMatch: TList;
    procedure LinkingComponents;
    procedure TournamentLocate;
    procedure LoadStage;
    procedure LoadTournamentEmblem;
    procedure LoadTournamentField;
    procedure LoadTournamentSeason(tpf: integer);
    procedure LoadTournamentHostCountry(tpf: integer);
    procedure LoadApplicationTeamT;
    procedure LoadApplicationTeamS;
    procedure CheckStageTypeTab;
    procedure TabInvisible;
    procedure LoadMatchFromChildStage(Ast: integer);
    procedure LoadMatchFromStage(Ast: integer);
    procedure LoadMatchFromAllStage(Ast: integer);
    procedure lMatchFree;
    procedure lMatchClear;
    procedure ShowAllMatch;
    procedure ClearAllMatch;
    procedure ShowMatch(Am: TMatch);
  public
    { Public declarations }
    IDTournament: integer;

  end;

var
  frmTournament: TfrmTournament;

implementation

uses MainUnit, DataModule, Match, DBConst, TournamentPattern;

{$R *.dfm}

procedure TfrmTournament.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  //Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TfrmTournament.FormCreate(Sender: TObject);
begin
  LinkingComponents;
  lMatch := Tlist.Create;
end;

procedure TfrmTournament.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adotTournament.Close;
  lMatchFree;
  free;
  frmTournament := nil;
end;

procedure TfrmTournament.FormShow(Sender: TObject);
begin
  adotTeam.Open;
  TournamentLocate;
  LoadTournamentEmblem;
  LoadTournamentField;
  LoadStage;
end;

procedure TfrmTournament.LinkingComponents;
var f: TStringField;
begin
  adoq.Connection := dm.ADOConnection;
  with adotTournament do
  begin
    Connection := dm.ADOConnection;
    TableName := T_Tournament;
  end;
  with dbeTournamentName do
  begin
    DataSource := dsTournament;
    DataField := T_Tournament_tournament_name;
    Font.Size := 14;
  end;
  with adoqStage do
  begin
    Connection := dm.ADOConnection;
  end;
  with adotSeason do
  begin
    Connection := dm.ADOConnection;
  end;
  dbeSeasonY.DataSource := dsSeason;
  dbeSeasonYY.DataSource := dsSeason;
  with adoqApplicationTeam do
  begin
    Connection := dm.ADOConnection;
  end;
  dbgApplicationTeam.DataSource := dsApplicationTeam;
  with adotTeam do
  begin
    Connection := dm.ADOConnection;
    TableName := T_Team;
  end;
end;

procedure TfrmTournament.ClearAllMatch;
var i: integer;
begin
  for i := sbMatch.ComponentCount - 1 downto 0 do
    TPanel(sbMatch.Components[i]).Free;
end;

procedure TfrmTournament.ShowMatch(Am: TMatch);
var pn: TPanel;
    l: TLabel;
begin
  pn := TPanel.Create(sbMatch);
  pn.Parent := sbMatch;
  pn.Name := 'panel' + inttostr(Am.id);
  pn.Align := alTop;
  pn.Height := 60;
  pn.Caption := '';
  l := TLabel.Create(pn);
  l.Parent := pn;
  l.Name := 'date' + inttostr(Am.id);
  l.Caption := DateToStr(Am.d);
  l.Top := 5;
  l.Left := 5;
  l.AutoSize := true;
  l := TLabel.Create(pn);
  l.Parent := pn;
  l.Name := 'time' + inttostr(Am.id);
  l.Caption := TimeToStr(Am.t);
  l.Top := 5;
  l.Left := 85;
  l.AutoSize := true;
  l := TLabel.Create(pn);
  l.Parent := pn;
  l.Name := 'number' + inttostr(Am.id);
  l.Caption := IntToStr(Am.n);
  l.Top := 5;
  l.Left := pn.Width - l.Width - 5;
  l.AutoSize := true;
  l.Anchors := [akTop, akRight];
  l := TLabel.Create(pn);
  l.Parent := pn;
  l.Name := 'colon' + inttostr(Am.id);
  l.Caption := ':';
  l.Top := 15;
  l.Left := pn.Width div 2;
  l.AutoSize := true;
  l := TLabel.Create(pn);
  l.Parent := pn;
  l.Name := 'gh' + inttostr(Am.id);
  l.Caption := inttostr(Am.gh);
  l.Top := 15;
  l.AutoSize := false;
  l.Width := 15;
  l.Alignment := taRightJustify;
  l.Left := pn.Width div 2 - l.Width * 2;
  l := TLabel.Create(pn);
  l.Parent := pn;
  l.Name := 'gg' + inttostr(Am.id);
  l.Caption := inttostr(Am.gg);
  l.Top := 15;
  l.AutoSize := false;
  l.Width := 15;
  l.Alignment := taLeftJustify;
  l.Left := pn.Width div 2 + l.Width;
  l := TLabel.Create(pn);
  l.Parent := pn;
  l.Name := 'hn' + inttostr(Am.id);
  l.Caption := Am.hn;
  l.Top := 15;
  l.AutoSize := false;
  l.Width := 90;
  l.Alignment := taRightJustify;
  l.Left := pn.Width div 2 - 40 - 90;
  l := TLabel.Create(pn);
  l.Parent := pn;
  l.Name := 'gn' + inttostr(Am.id);
  l.Caption := Am.gn;
  l.Top := 15;
  l.AutoSize := false;
  l.Width := 90;
  l.Alignment := taLeftJustify;
  l.Left := pn.Width div 2 + 40;
  if Am.aet then
  begin
    l := TLabel.Create(pn);
    l.Parent := pn;
    l.Name := 'aet' + inttostr(Am.id);
    l.Caption := 'a.e.t.';
    l.Top := 25;
    l.Left := pn.Width div 2 - 12;
    l.AutoSize := true;
  end;
  if Am.pso then
  begin
    l := TLabel.Create(pn);
    l.Parent := pn;
    l.Name := 'colonpso' + inttostr(Am.id);
    l.Caption := ':';
    l.Top := 35;
    l.Left := pn.Width div 2;
    l.AutoSize := true;
    l := TLabel.Create(pn);
    l.Parent := pn;
    l.Name := 'ghpso' + inttostr(Am.id);
    l.Caption := inttostr(Am.psogh);
    l.Top := 35;
    l.AutoSize := false;
    l.Width := 15;
    l.Alignment := taRightJustify;
    l.Left := pn.Width div 2 - l.Width * 2;
    l := TLabel.Create(pn);
    l.Parent := pn;
    l.Name := 'ggpso' + inttostr(Am.id);
    l.Caption := inttostr(Am.psogg);
    l.Top := 35;
    l.AutoSize := false;
    l.Width := 15;
    l.Alignment := taLeftJustify;
    l.Left := pn.Width div 2 + l.Width;
    l := TLabel.Create(pn);
    l.Parent := pn;
    l.Name := 'pso' + inttostr(Am.id);
    l.Caption := 'pso';
    l.Top := 45;
    l.Left := pn.Width div 2 - 7;
    l.AutoSize := true;
  end;
end;

procedure TfrmTournament.ShowAllMatch;
var i: integer;
begin
  for i := 0 to lMatch.Count -1 do
    ShowMatch(lMatch[i]);
end;

procedure TfrmTournament.LoadMatchFromAllStage(Ast: integer);
begin
  LoadMatchFromStage(Ast);
  LoadMatchFromChildStage(Ast);
end;

procedure TfrmTournament.LoadMatchFromStage(Ast: integer);
var sf: TStringField;
    m: TMatch;
begin
  with adoq, sql do
  begin
    Close;
    Clear;
    Add('select * from ' + T_Match);
    Add('where ' + T_Match_id_tournament + ' = ' +
        inttostr(IDTournament));
    Add('and ' + T_Match_id_stage_pattern + ' = ' +
        inttostr(Ast));
    FieldDefs.Update;
    FieldDefs.Find(T_Match_id).CreateField(adoq);
    FieldDefs.Find(T_Match_id_home_team).CreateField(adoq);
    FieldDefs.Find(T_Match_id_guest_team).CreateField(adoq);
    FieldDefs.Find(T_Match_goal_home_team).CreateField(adoq);
    FieldDefs.Find(T_Match_goal_guest_team).CreateField(adoq);
    FieldDefs.Find(T_Match_match_date).CreateField(adoq);
    FieldDefs.Find(T_Match_match_time_begin).CreateField(adoq);
    FieldDefs.Find(T_Match_match_number).CreateField(adoq);
    FieldDefs.Find(T_Match_aet).CreateField(adoq);
    FieldDefs.Find(T_Match_pso).CreateField(adoq);
    FieldDefs.Find(T_Match_pso_home_team).CreateField(adoq);
    FieldDefs.Find(T_Match_pso_guest_team).CreateField(adoq);
    sf := TStringField.Create(adoq);
    sf.FieldName := 'home_team_name';
    sf.Name := adoq.Name + sf.FieldName;
    sf.DataSet := adoq;
    sf.FieldKind := fkLookup;
    sf.LookupDataSet := adotTeam;
    sf.LookupKeyFields := T_Team_id;
    sf.LookupResultField := T_Team_team_name;
    sf.KeyFields := T_Match_id_home_team;
    sf := TStringField.Create(adoq);
    sf.FieldName := 'guest_team_name';
    sf.Name := adoq.Name + sf.FieldName;
    sf.DataSet := adoq;
    sf.FieldKind := fkLookup;
    sf.LookupDataSet := adotTeam;
    sf.LookupKeyFields := T_Team_id;
    sf.LookupResultField := T_Team_team_name;
    sf.KeyFields := T_Match_id_guest_team;
    Open;
    First;
    while not eof do
    begin
      m := Tmatch.Create(FieldByName(T_Match_id).AsInteger,
                         FieldByName(T_Match_id_home_team).AsInteger,
                         FieldByName(T_Match_id_guest_team).AsInteger,
                         FieldByName('home_team_name').AsString,
                         FieldByName('guest_team_name').AsString);
      m.gh := FieldByName(T_Match_goal_home_team).AsInteger;
      m.gg := FieldByName(T_Match_goal_guest_team).AsInteger;
      m.n := FieldByName(T_Match_match_number).AsInteger;
      m.psogh := FieldByName(T_Match_pso_home_team).AsInteger;
      m.psogg := FieldByName(T_Match_pso_guest_team).AsInteger;
      m.d := FieldByName(T_Match_match_date).AsDateTime;
      m.t := FieldByName(T_Match_match_time_begin).AsDateTime;
      m.aet := FieldByName(T_Match_aet).AsBoolean;
      m.pso := FieldByName(T_Match_pso).AsBoolean;
      lMatch.Add(m);
      Next;
    end;
    Close;
    adoq.Fields.Clear;
  end;
end;

procedure TfrmTournament.LoadMatchFromChildStage(Ast: integer);
var sl: TList;
    ts: PStage;
    j: integer;

    procedure lid(pid: integer);
    var i: integer;
        n: TtreeNode;
        pi: PInteger;
    begin
      for i := 0 to sl.count - 1 do
        if pstage(sl[i])^.idp = pid then
        begin
          LoadMatchFromStage(pstage(sl[i])^.id);
          lid(pstage(sl[i])^.id);
        end;
    end;

begin
  sl := tlist.Create;
  with adoq, sql do
  begin
    Close;
    Clear;
    Add('select * from ' + T_Stage_Pattern);
    Add('where ' + T_Stage_Pattern_id_tournament_pattern +
        ' = ' + inttostr(IDTournament));
    Open;
    First;
    while not Eof do
    begin
      New(ts);
      ts^.id := FieldByName(T_Stage_Pattern_id).AsInteger;
      ts^.idp := FieldByName(T_Stage_Pattern_id_parent_stage).AsInteger;
      sl.Add(ts);
      Next;
    end;
    Close;
  end;
  lid(Ast);
  for j := sl.Count - 1 downto 0 do
  begin
    ts := sl[j];
    sl.Delete(j);
    Dispose(ts);
  end;
end;

procedure TfrmTournament.LoadApplicationTeamT;
begin
  with adoqApplicationTeam, sql do
  begin
    close;
    clear;
    Add('select ' + T_Team_team_name);
    Add('from ' + T_Team);
    Add('right join ' + T_Application_Team_T);
    Add('on ' + T_Team + '.' + T_Team_id + ' = ' +
        T_Application_Team_T + '.' + T_Application_Team_T_id_team);
    Add('where ' + T_Application_Team_T_id_tournament +
        ' = ' + inttostr(IDTournament));
    open;
  end;
end;

procedure TfrmTournament.LoadApplicationTeamS;
begin
  with adoqApplicationTeam, sql do
  begin
    close;
    clear;
    Add('select ' + T_Team_team_name);
    Add('from ' + T_Team);
    Add('right join ' + T_Application_Team_S);
    Add('on ' + T_Team + '.' + T_Team_id + ' = ' +
        T_Application_Team_S + '.' + T_Application_Team_S_id_team);
    Add('where ' + T_Application_Team_S_id_tournament +
        ' = ' + inttostr(IDTournament));
    Add('and ' + T_Application_Team_S_id_stage + ' = ' +
        adoqStage.FieldByName(T_Stage_Pattern_id).AsString);
    open;
  end;
end;

procedure TfrmTournament.LoadTournamentField;
var tpf: Integer;
begin
  with adoq, sql do
  begin
    Clear;
    Add('select ' + T_Tournament_Pattern_tournament_pattern_field);
    Add('from ' + T_Tournament_Pattern);
    Add('left join ' + T_Tournament);
    Add('on ' + T_Tournament_Pattern + '.' + T_Tournament_Pattern_id +
        ' = ' + T_Tournament + '.' + T_Tournament_id_tournament_pattern);
    Add('where ' + T_Tournament + '.' + T_Tournament_id +
        ' = ' + inttostr(IDTournament));
    open;
    tpf := adoq.FieldByName(T_Tournament_Pattern_tournament_pattern_field).AsInteger;
    close;
  end;
  LoadTournamentSeason(tpf);
  LoadTournamentHostCountry(tpf);
end;

procedure TfrmTournament.LoadTournamentSeason(tpf: integer);
begin
  if tpf and fc_Season_y = fc_Season_y then
  begin
    labSeason.Visible := true;
    dbeSeasonY.Visible := true;
    adotSeason.TableName := T_Tournament_Field_Season_y;
    dbeSeasonY.DataField := T_Tournament_Field_Season_y_tournament_year;
  end
  else
    if tpf and fc_Season_yy = fc_Season_yy then
    begin
      labSeason.Visible := true;
      dbeSeasonY.Visible := true;
      labYY.Visible := true;
      dbeSeasonYY.Visible := true;
      adotSeason.TableName := T_Tournament_Field_Season_yy;
      dbeSeasonY.DataField := T_Tournament_Field_Season_yy_year_from;
      dbeSeasonYY.DataField := T_Tournament_Field_Season_yy_year_to;
    end;
  adotSeason.Open;
  if not adotSeason.Locate(T_Tournament_Field_Season_y_id_tournament,
                           IDTournament, [loCaseInsensitive]) then
  begin

  end;
end;

procedure TfrmTournament.LoadTournamentHostCountry(tpf: integer);
begin
  if tpf and fc_Season_host = fc_Season_host then
    with adoq, sql do
    begin
      clear;
      Add('select ' + T_Geography_name);
      Add('from ' + T_Geography);
      Add('right join ' + T_Tournament_Field_Host_Country);
      Add('on ' + T_Geography + '.' + T_Geography_id +
          ' = ' + T_Tournament_Field_Host_Country + '.' +
          T_Tournament_Field_Host_Country_id_geography);
      Add('where ' + T_Tournament_Field_Host_Country_id_tournament +
          ' = ' + inttostr(IDTournament));
      open;
      mHost.Lines.Clear;
      first;
      while not Eof do
      begin
        mHost.Lines.Add(FieldByName(T_Geography_name).asstring);
        Next;
      end;
      close;
    end;
end;

procedure TfrmTournament.LoadTournamentEmblem;
var stream: TStream;
    mf: TMemoField;
begin
  if adotTournament.FieldByName(T_Tournament_emblem).IsNull then exit;
  mf := TMemoField(adotTournament.FieldByName(T_Tournament_emblem));
  stream := TMemoryStream.Create;
  mf.SaveToStream(stream);
  stream.Seek(0, soFromBeginning);
  imEmblem.Picture.Graphic.LoadFromStream(stream);
  stream.Free;
end;

procedure TfrmTournament.imEmblemDblClick(Sender: TObject);
var mf: TMemoField;
begin
  if opdOpen.Execute then
  begin
    adotTournament.Edit;
    mf := TMemoField(adotTournament.FieldByName(T_Tournament_emblem));
    mf.LoadFromFile(opdOpen.FileName);
    if adotTournament.Modified then adotTournament.Post;
    imEmblem.Picture.LoadFromFile(opdOpen.FileName);
  end;
end;

procedure TfrmTournament.TournamentLocate;
begin
  adotTournament.Open;
  adotTournament.Locate(T_Tournament_id, IDTournament, [loCaseInsensitive]);
  adotTournament.FieldByName(T_Tournament_tournament_name).Alignment := taCenter;
end;

procedure TfrmTournament.tvStageChange(Sender: TObject; Node: TTreeNode);
begin
  if Node.Data <> nil then
    with adoqStage do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ' + T_Stage_Pattern);
      SQL.Add('where ' + T_Stage_Pattern_id + ' = ' +
              inttostr(PInteger(Node.Data)^));
      Open;
    end
  else adoqStage.Close;
  CheckStageTypeTab;
end;

procedure TfrmTournament.CheckStageTypeTab;
begin
  adoqApplicationTeam.Close;
  TabInvisible;
  if not adoqStage.Active then
  begin
    tsTournamentOverview.TabVisible := true;
    tsApplicationTeams.TabVisible := true;
    LoadApplicationTeamT;
  end
  else
  begin
    tsMatch.TabVisible := true;
    lMatchClear;
    LoadMatchFromAllStage(adoqStage.FieldByName(T_Stage_Pattern_id).AsInteger);
    ClearAllMatch;
    ShowAllMatch;
    if adoqStage.FieldByName(T_Stage_Pattern_stage_pattern_type).AsInteger
       and st_Application_Team = st_Application_Team then
    begin
      tsApplicationTeams.TabVisible := true;
      LoadApplicationTeamS;
    end;
    if adoqStage.FieldByName(T_Stage_Pattern_stage_pattern_type).AsInteger
       and st_Application_Player = st_Application_Player then
    begin
      tsPlayer.TabVisible := true;
    end;
  end;
end;

procedure TfrmTournament.TabInvisible;
var i: integer;
begin
  for i := 0 to pcTournament.PageCount - 1 do
    pcTournament.Pages[i].TabVisible := false;
end;

procedure TfrmTournament.LoadStage;
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
          n := tvStage.Items.AddChild(tr, pstage(sl[i])^.name);
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
  tvStage.Items.Clear;
  tvStage.Items.AddChild(nil, adotTournament.FieldByName(
                              T_Tournament_tournament_name).AsString);
  sl := tlist.Create;
  adoqStage.Close;
  adoqStage.SQL.Clear;
  adoqStage.SQL.Add('select * from ' + T_Stage_Pattern);
  adoqStage.SQL.Add('left join ' + T_Stage_Name);
  adoqStage.SQL.Add('on ' + T_Stage_Pattern + '.' + T_Stage_Pattern_id_stage_name +
    ' = ' + T_Stage_Name + '.' + T_Stage_Name_id);
  adoqStage.SQL.Add('where ' + T_Stage_Pattern_id_tournament_pattern +
    ' = ' + adotTournament.FieldByName(T_Tournament_id_tournament_pattern).AsString);
  adoqStage.SQL.Add('order by ' + T_Stage_Pattern + '.' + T_Stage_Pattern_number + ' asc');
  adoqStage.Open;
  adoqStage.First;
  while not adoqStage.Eof do
  begin
    if adoqStage.FieldByName(
       T_Stage_Pattern_stage_pattern_type).AsInteger
       and st_Pair <> st_Pair then
    begin
      New(ts);
      ts^.id := adoqStage.FieldByName(T_Stage_Pattern + '.' + T_Stage_Pattern_id).AsInteger;
      ts^.name := adoqStage.FieldByName(T_Stage_Name_stage_name).AsString;
      ts^.idp := adoqStage.FieldByName(T_Stage_Pattern_id_parent_stage).AsInteger;
      sl.Add(ts);
    end;
    adoqStage.Next;
  end;
  lid(tvStage.Items.Item[0], 0);
  for j := sl.Count - 1 downto 0 do
  begin
    ts := sl[j];
    sl.Delete(j);
    Dispose(ts);
  end;
  tvStage.OnChange(tvStage, tvStage.Items.Item[0]);
end;

{ TMatch }

constructor TMatch.Create(Aid, Aidht, Aidgt: integer; Ahn, Agn: string);
begin
  id := Aid;
  idht := Aidht;
  idgt := Aidgt;
  hn := Ahn;
  gn := Agn;
end;

destructor TMatch.Destroy;
begin
  inherited;
end;

procedure TfrmTournament.lMatchFree;
begin
  lMatchClear;
  lMatch.Free;
  lMatch := nil;
end;

procedure TfrmTournament.lMatchClear;
var i: integer;
begin
  for i := lMatch.Count - 1 downto 0 do
    TMatch(lMatch[i]).Free;
  lMatch.Clear;
end;

end.
