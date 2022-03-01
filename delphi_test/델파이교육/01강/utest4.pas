unit utest4;

// type, const, variable, porcedure, function ����
// �ٸ� ����Ʈ���� �̰��� ���ǵ� var, procedure, function ����� �� ����
// ��, uses����  utest4�� �߰��ؾ� ��
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TDOG = class(TObject)
    Name : string;
    Age : byte;
    Address : string;
    function GetName:string;
  end;

  TPerson = class(TObject)
    private
      ttt: integer;
    strict private
      tt2 : integer;
    public
      Name : string;
      Age : byte;
      Address : string;
      function GetName:string;
      constructor Create; virtual;
//    protected

//    strict protected

//f    published

  end;

  TEmp = class(TPerson)
    office : string;
    function salary: integer; virtual; abstract; // dynamic
    constructor Create; override;
  end;

  TS = class(TEmp)
    rank : string;
    function salary: integer; override;
    constructor Create; override;
  end;
  TH = class sealed (TEmp)
    hrs : integer;
    rate : integer;
    function salary: integer; override; final;
    constructor Create; override;
  end;

  Country = array [0..2] of string;
  Person = record
    Name : string;
    Age : Byte;
    Address: string;
  end;

  p_person = ^Person;

  TForm4 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  s:string;

  i: integer = 100;
  t:tdatetime;
  b:boolean;
  Countries : Country;
  a: array of string;
  a2 : array of array of string;
  p : p_person;
  ps : pchar;   //pansichar, pwidechar, puncodechar
  v:temp;
  vi:variant;

  procedure Test;
  // ������ ����� ��ƾ���� �����ϴ� ��
  // Type, const, var, ���� : �ٸ� unit������ ����� �� ���� �ش� ����Ʈ�� �����κп����� ��밡��

  function Add(x,y : integer) : integer;
  function Divide(x, y : integer) : integer; overload;
  function Divide(x, y : real) : real; overload;

implementation
var
  j: integer;

procedure Test;
var
  k: integer;
begin
  ShowMessage('test called');
end;

function Add(x, y : integer) : integer;
begin
//  Add := x + y;
  Result := x + y;
  // exit(x+y);
end;

function Divide(x, y : integer) : integer;
begin
//  Add := x + y;
  Result := x div y;
  // exit(x+y);
end;


function Divide(x, y : real) : real;
begin
//  Add := x + y;
  Result := x / y;
  // exit(x+y);
end;

{ TPerson }

constructor TPerson.Create;
begin
  name := 'kim';
  age := 20;
  Address := 'AnyWhere';
end;

function TPerson.GetName: string;
begin
  ttt := 3;
  result := Name;
end;

{ TDOG }

function TDOG.GetName: string;
begin
  result := self.Name;
end;

{ TS }

constructor TS.Create;
begin
  inherited;
  rank := 'employee';
end;

function TS.salary: integer;
begin
  result := 300;
end;

{ TH }

constructor TH.Create;
begin
  inherited;
  hrs := 10;
  rate := 2000;
end;

function TH.salary: integer;
begin
  result := hrs * rate;
end;

{ TEmp }

constructor TEmp.Create;
begin
  inherited;
  office := '������';
end;

initialization
begin
    Countries[0] := '�ѱ�';
    Countries[1] := '�̱�';
    Countries[2] := '�Ϻ�';
    SetLength(a,2);
    Setlength(a2, 2, 2);

    a[0] := 'a';
    a2[0,0] := 'a2';

end;
finalization

{$R *.dfm}

end.
