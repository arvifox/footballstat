unit GroupNameSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormPattern, ExtCtrls, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TfrmGroupNameSelect = class(Tfrm)
    adotGroupName: TADOTable;
    dsGroupName: TDataSource;
    dbgGroupName: TDBGrid;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID: integer;
  end;

var
  frmGroupNameSelect: TfrmGroupNameSelect;

implementation

uses DataModule, DBConst;

{$R *.dfm}

procedure TfrmGroupNameSelect.btnCancelClick(Sender: TObject);
begin
  inherited;
  if adotGroupName.Modified then adotGroupName.Post;
end;

procedure TfrmGroupNameSelect.btnOkClick(Sender: TObject);
begin
  inherited;
  if adotGroupName.Modified then adotGroupName.Post;
  ID := adotGroupName.FieldByName(T_Stage_Group_Name_id).AsInteger;
end;

procedure TfrmGroupNameSelect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adotGroupName.Close;
end;

procedure TfrmGroupNameSelect.FormCreate(Sender: TObject);
begin
  inherited;
  with adotGroupName do
  begin
    Connection := dm.ADOConnection;
    TableName := T_Stage_Group_Name;
    FieldDefs.Update;
    fieldDefs.Find(T_Stage_Group_Name_id).CreateField(adotGroupName);
    fieldDefs.Find(T_Stage_Group_Name_name).CreateField(adotGroupName);
    FieldByName(T_Stage_Group_Name_id).Visible := false;
    FieldByName(T_Stage_Group_Name_name).DisplayLabel := 'Group name';
    FieldByName(T_Stage_Group_Name_name).DisplayWidth := 15;
  end;
  dbgGroupName.DataSource :=dsGroupName;
end;

procedure TfrmGroupNameSelect.FormShow(Sender: TObject);
begin
  inherited;
  ID := 0;
  adotGroupName.Open;
  adotGroupName.Sort := T_Stage_Group_Name_name + ' ASC';
end;

end.
