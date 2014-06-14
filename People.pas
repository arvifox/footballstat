unit People;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, Grids, DBGrids, DBCtrls, ComCtrls, StdCtrls,
  ExtDlgs, pngimage, Mask;

type
  TfrmPeople = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    dbgPeople: TDBGrid;
    dsPeople: TDataSource;
    pcPeople: TPageControl;
    tsPeople: TTabSheet;
    gbByPosition: TGroupBox;
    cbByPosition: TCheckBox;
    dblcbByPosition: TDBLookupComboBox;
    adotPosition: TADOTable;
    dsPosition: TDataSource;
    adoqPeople: TADOQuery;
    gbByAge: TGroupBox;
    cbByAge: TCheckBox;
    gbByCitizenship: TGroupBox;
    cbByCitizenship: TCheckBox;
    dbgCountry: TDBGrid;
    pnlSearch: TPanel;
    opdPhoto: TOpenPictureDialog;
    pnlPhoto: TPanel;
    dbeHeight: TDBEdit;
    dbimPhoto: TDBImage;
    dbeFirstname: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbeLastname: TDBEdit;
    dbeNickname: TDBEdit;
    dbeShirtname: TDBEdit;
    dbeDisplayname: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbeBirthday: TDBEdit;
    Label7: TLabel;
    btnOpenMan: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbByPositionClick(Sender: TObject);
    procedure cbByAgeClick(Sender: TObject);
    procedure cbByCitizenshipClick(Sender: TObject);
    procedure dblcbByPositionCloseUp(Sender: TObject);
    procedure adotCountryAfterScroll(DataSet: TDataSet);
    procedure dbimPhotoDblClick(Sender: TObject);
    procedure btnOpenManClick(Sender: TObject);
  private
    { Private declarations }
    procedure LinkingComponents;
    function CreateSQLPeople: TStrings;
    procedure ExecSQLPeople;
  public
    { Public declarations }
  end;

var
  frmPeople: TfrmPeople;

implementation

uses DataModule, MainUnit, DBConst, Man;

{$R *.dfm}

procedure TfrmPeople.LinkingComponents;
begin
  adoqPeople.Connection := dm.ADOConnection;
  dbgPeople.DataSource := dsPeople;

  adotPosition.Connection := dm.ADOConnection;
  adotPosition.TableName := T_Position_Classic;
  adotPosition.FieldDefs.Update;
  adotPosition.FieldDefs.Find(T_Position_Classic_classic_position_name).
    CreateField(adotPosition);
  adotPosition.FieldDefs.Find(T_Position_Classic_id).CreateField(adotPosition);
  dblcbByPosition.ListSource := dsPosition;
  dblcbByPosition.ListField := T_Position_Classic_classic_position_name;
  dblcbByPosition.KeyField:= T_Position_Classic_id;

  dbimPhoto.DataField := T_People_photo;
  dbeFirstname.DataSource := dsPeople;
  dbeFirstname.DataField := T_People_first_name;
  dbeLastname.DataSource := dsPeople;
  dbeLastname.DataField := T_People_last_name;
  dbeNickname.DataSource := dsPeople;
  dbeNickname.DataField := T_People_nick_name;
  dbeShirtname.DataSource := dsPeople;
  dbeShirtname.DataField := T_People_shirt_name;
  dbeDisplayname.DataSource := dsPeople;
  dbeDisplayname.DataField := T_People_display_name;
  dbeBirthday.DataSource := dsPeople;
  dbeBirthday.DataField := T_People_birthday;
  dbeHeight.DataSource := dsPeople;
  dbeHeight.DataField := T_People_height;
end;

procedure TfrmPeople.adotCountryAfterScroll(DataSet: TDataSet);
begin
  if cbByCitizenship.Checked then ExecSQLPeople;
end;

procedure TfrmPeople.btnOpenManClick(Sender: TObject);
begin
  if frmMan = nil then
    frmMan := TfrmMan.Create(Application);
  frmMan.IDMan := adoqPeople.FieldByName(T_People_id).Value;
  frmMan.Show;
end;

procedure TfrmPeople.cbByAgeClick(Sender: TObject);
begin
  ExecSQLPeople;
end;

procedure TfrmPeople.cbByPositionClick(Sender: TObject);
begin
  ExecSQLPeople;
end;

procedure TfrmPeople.cbByCitizenshipClick(Sender: TObject);
begin
  ExecSQLPeople;
end;

function TfrmPeople.CreateSQLPeople: TStrings;
var noc: integer;
begin
  noc := 0;
  result := TStringList.Create;
  result.Add('select * from ' + T_People);
  if cbByCitizenship.Checked then
  begin
    result.Add('inner join ' + T_People_Citizenship);
    result.Add('on ' + T_People + '.' + T_People_id + ' = ' +
               T_People_Citizenship + '.' + T_People_Citizenship_id_man);
    result.Add('where ');
//    result.Add(adotCountry.FieldByName(T_Country_id).AsString + ' = ' +
//               T_People_Citizenship + '.' + T_People_Citizenship_id_country);
    inc(noc);
  end;
  if cbByPosition.Checked then
  begin
    if noc = 0 then result.Add('where ')
               else result.Add(' and ');
    result.Add(T_People_id_position_classic +
               ' = ' + adotPosition.FieldByName(T_Position_Classic_id).AsString);
  end;
end; {CreateSQLPeople}

procedure TfrmPeople.dbimPhotoDblClick(Sender: TObject);
begin
  opdPhoto.Filter := 'All (*.bmp;*.ico;*.emf;*.wmf)|*.bmp;*.ico;*.emf;*.wmf';
  if opdPhoto.Execute then begin
    dbimPhoto.Picture.LoadFromFile(opdPhoto.FileName);
    adoqPeople.Edit;
    TMemoField(adoqPeople.FieldByName(T_People_photo)).LoadFromFile(opdPhoto.FileName);
    if adoqPeople.Modified then adoqPeople.Post;
  end;
end;

procedure TfrmPeople.dblcbByPositionCloseUp(Sender: TObject);
begin
  if cbByPosition.Checked then ExecSQLPeople;
end;

procedure TfrmPeople.ExecSQLPeople;
var str: TStrings;
    i: integer;
begin
  adoqPeople.Close;
  str := CreateSQLPeople;
  adoqPeople.SQL.Clear;
  adoqPeople.SQL.AddStrings(str);
  str.Free;
  adoqPeople.Open;
  for i := 0 to adoqPeople.FieldCount - 1 do
    adoqPeople.Fields.Fields[i].Visible := false;
  adoqPeople.FieldByName(T_People_display_name).Visible := true;
  adoqPeople.FieldByName(T_People_display_name).DisplayWidth := 35;
  adoqPeople.FieldByName(T_People_display_name).DisplayLabel := 'Display name';
end; {ExecSQLPeople}

procedure TfrmPeople.FormCreate(Sender: TObject);
begin
  LinkingComponents;
end; {FormCreate}

procedure TfrmPeople.FormShow(Sender: TObject);
begin
  adotPosition.Open;
  ExecSQLPeople;
end;

end.
