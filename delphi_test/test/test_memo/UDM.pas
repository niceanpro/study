unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMSSQL, Data.DB, Datasnap.DBClient,
  SimpleDS, Data.SqlExpr, Data.SqlTimSt, Dialogs, Data.DBXMySQL, Data.FMTBcd,
  Datasnap.Provider;

type
  TDM = class(TDataModule)
    SQLConnection1: TSQLConnection;
    Insa: TSimpleDataSet;
    InsaSource: TDataSource;

//    property InsaID: TIntegerField read GetID write SetID;

//    function GetID; TIntegerField;
//    procedure SetID(Value; TIntegerFiled;


    Dept: TSimpleDataSet;
    DeptSource: TDataSource;
    InsaQuery: TSimpleDataSet;
    InsaQuerySource: TDataSource;
    SQLDataSet1: TSQLDataSet;
    SQLStoredProc1: TSQLStoredProc;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    SQLQuery1: TSQLQuery;
    SQLQuery1CODE: TStringField;
    SQLQuery1DEPT: TStringField;
    SQLQuery1SECTION: TStringField;
    ClientDataSet1CODE: TStringField;
    ClientDataSet1DEPT: TStringField;
    ClientDataSet1SECTION: TStringField;
    procedure InsaNewRecord(DataSet: TDataSet);
    procedure InsaBeforeInsert(DataSet: TDataSet);
    procedure InsaAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure InsaSourceStateChange(Sender: TObject);
    procedure InsaSourceDataChange(Sender: TObject; Field: TField);
    procedure DeptSourceDataChange(Sender: TObject; Field: TField);


  private
    { Private declarations }
    fInsaID : TIntegerField;

  published
    Property InsaID: TIntegerField read fInsaID;

  public
    { Public declarations }

{
    InsaNAME: TStringField;
    InsaAGE: TSmallintField;
    InsaDEPT_CODE: TStringField;
    InsaCLASS: TStringField;
    InsaIPSA_DATE: TSQLTimeStampField;
    InsaSALARY: TIntegerField;
    InsaPHOTO: TBlobField;
    InsaGRADE: TStringField;
    InsaTax: TFloatField;
}
  end;

var
  DM: TDM;
  TD: TTransactionDesc;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Uinsa;

{$R *.dfm}

procedure TDM.DeptSourceDataChange(Sender: TObject; Field: TField);
begin
  InsaQuery.Close;
  InsaQuery.DataSet.Params[0].AsString := Dept.FieldByName('code').AsString;
  InsaQuery.Open;
end;

procedure TDM.InsaAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  ShowMessage('????/???? ????');
end;

procedure TDM.InsaBeforeInsert(DataSet: TDataSet);
begin
  InsaForm.DBEdit1.SetFocus;
end;

procedure TDM.InsaNewRecord(DataSet: TDataSet);
begin
{
  InsaIpsa_date.value := DateTimetoSQLTimeStamp(now);
  InsaSalary.Value := 3000000;
  InsaGrade.Value := '1';
}
end;

procedure TDM.InsaSourceDataChange(Sender: TObject; Field: TField);
begin
  InsaForm.SpeedButton1.Enabled := not dm.Insa.Bof;
  InsaForm.SpeedButton2.Enabled := not dm.Insa.Bof;
  InsaForm.SpeedButton3.Enabled := not dm.Insa.Eof;
  InsaForm.SpeedButton4.Enabled := not dm.Insa.Eof;
end;

procedure TDM.InsaSourceStateChange(Sender: TObject);
begin
  InsaForm.Button1.Enabled := Dm.Insa.State = dsBrowse;
  InsaForm.Button2.Enabled := Dm.Insa.State = dsBrowse;
  InsaForm.Button3.Enabled := Dm.Insa.State in [dsInsert, dsEdit];
  InsaForm.Button4.Enabled := Dm.Insa.State in [dsInsert, dsEdit];

end;

initialization
begin
  TD.TransactionID := 1;
  TD.IsolationLevel := xilReadCommitted;
end;
end.
