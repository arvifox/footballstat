unit test;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmTest = class(TForm)
    DBGrid1: TDBGrid;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOTable2: TADOTable;
    ADOTable3: TADOTable;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    ADOCommand1: TADOCommand;
    Edit1: TEdit;
    Edit2: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    StaticText1: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTest: TfrmTest;

implementation

uses DataModule, DBConst;

{$R *.dfm}

procedure TfrmTest.Button1Click(Sender: TObject);
var s: TStream;
    c: integer;
    st : ansistring;
begin
  adotable1.Open;
  if adotable1.RecordCount = 0 then
    adotable1.Insert;
  s := adotable1.CreateBlobStream(
    adotable1.FieldByName(T_Stage_Playoff_form), bmWrite);
  st := 'russia1234';
  c := Length(st);
  s.Write(c, sizeof(c));
  s.WriteBuffer(Pointer(st)^, c);
  s.Free;
  if adotable1.Modified then
    adotable1.Post;
end;

procedure TfrmTest.Button2Click(Sender: TObject);
var s : TStream;
    x : integer;
begin
  adotable1.Open;
  s := adotable1.CreateBlobStream(
    adotable1.FieldByName(T_Stage_Playoff_form), bmRead);
  s.ReadBuffer(x, sizeof(integer));
  label7.Caption := inttostr(x);
  s.ReadBuffer(x, sizeof(integer));
  label8.Caption := inttostr(x);
  s.Free;
end;

procedure TfrmTest.Button3Click(Sender: TObject);
var lNote: TLabel;
begin
  lNote := TLabel.Create(self);
  lNote.Parent := self;
  lNote.Name := 'qe';
  lNote.Left := 10;
  lNote.Top := 70;
  lNote.Width := 40;
  lNote.Height := 15;
  lNote.Visible := true;
end;

end.
