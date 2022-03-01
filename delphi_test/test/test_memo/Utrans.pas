unit Utrans;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TTransForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    DBGrid2: TDBGrid;
    Delete_Query: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransForm: TTransForm;

implementation

{$R *.dfm}

uses UDM;

procedure TTransForm.Button1Click(Sender: TObject);
begin
  DM.SQLConnection1.StartTransaction(TD);
  try
    try
      Delete_Query.Close;
      Delete_Query.SQL.Clear;
      Delete_Query.SQL.Add('delete from insa where dept_code = :code');
      Delete_Query.Params[0].AsString := DM.Dept.FieldByName('CODE').AsString;
      Delete_Query.ExecSQL;
    except
      ShowMessage('사원 삭제 오류');
      raise;
    end;

    try
      Dm.Dept.Delete;
      Dm.Dept.ApplyUpdates(-1);
    except
      ShowMessage('부서 삭제 오류');
      raise;
    end;
    DM.SQLConnection1.Commit(TD);
  except
    DM.SQLConnection1.Rollback(TD);
  end;
  Dm.Dept.Refresh;
  Dm.Insa.Refresh;
end;

procedure TTransForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
