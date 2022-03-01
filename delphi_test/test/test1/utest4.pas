unit utest4;

// type, const, var, procedure, function ����, �ٸ� unit���� �̰��� ���ǵ� �͵��� ����� �� ����, �� uses���� utest4�� �߰��ؼ� ���
interface
uses
  vcl.Dialogs;

type
  TDog = class
    Name:string;
    Age:byte;
    Address:string;
    function GetName:string; // default, compile������ �ڷ� ���� ��
  end;

  TPerson = class(TObject)
    private           // ���� ���ֿ����� ����
      ttt:string;
//    strict private    // class�������� ����
//    protected
//    strict protected
//    published         // public ������ object inspect���� ����
    public
      Name:string;
      Age:byte;
      Address:string;
      function GetName:string;
      constructor Create; virtual;
  end;

  TEmp = class (TPerson)
    office:string;
    function salary:integer; virtual; abstract;// virtual �ӵ� ����, dynamic : �޸� ȿ���� ����
    constructor Create; override;
  end;

  TSalary = class sealed (TEmp)           // sealed�� ���̸� �� class�� ���� class�� �� Ȯ������ ����
    rank:string;
    function salary:integer; override;
    constructor Create; override; final;  // final�� �������� �ٽ� ������ ���� �ʰڴ�
  end;

  Thour = class sealed(TEmp)
    hrs:integer;
    rate:integer;
    function salary:integer; override;
    constructor Create; override;
  end;

  Country = array[0..2] of string; // 2 dimention : array[0..2, 0..3]
  c2 = array[0..2, 0..3] of string;

  Person = record
    Name:string;
    Age:byte;
    Address:string;
  end;
  p_person = ^Person;

var
  s:string;   // unicodeString;
  i:integer = 100;  // nativeInt
  t:tdatetime;
  b:boolean;
  Countries:Country;
  a:array of string;  // Dynamic �迭 ����
  a2:array of array of string;
  p:p_person;
  ps:pchar;   // ���ڿ� ������ ( pansichar, pwidechar, puncodechar ) pchar = punicodechar
  v:temp;
  v1:variant;  // runtime������ ���� �� : ����, ����, ��¥, �迭, ole object


  procedure Test;
  function Add(x, y:integer):integer;
  function Divide(x, y : integer) : integer; overload;
  function Divide(x, y : real) :real; overload;
  // ������ ����� ��ƾ���� �����ϴ� ��
  // type, const, var�� ���� ���� : �ٸ� ����Ʈ������ ����� �� ����, �ش� ����Ʈ�� ���� �κп����� ���
implementation

var
  j:integer;
procedure Test;
var
  k:integer;
begin
  ShowMessage('test called');
end;

function Add(x, y:integer):integer;
begin
  //Add := x + y;
  Result := x + y;
  // exit(x+y);   // 2010���� exit(���ϰ�) ����
end;

function Divide(x, y:integer):integer;
begin
  result := x div y;
end;


function Divide(x, y:real):real;
begin
  result := x / y;
end;

// option; Uses���� ������ ���� : �ʱ�ó��; �������� ����, �޸� �Ҵ�
{ TDog }

// ctl + shift + c : �ٵ� ����� �ش�.
function TDog.GetName: string;
begin
  result := Self.Name;
end;


{ TPerson }

constructor TPerson.Create;
begin
  Name := 'kim';
  age := 30;
  Address := 'seoul';
end;

function TPerson.GetName: string;
begin
  result := self.Name;
end;

{ Thour }

constructor Thour.Create;
begin
  inherited;
  hrs := 10;
  rate := 5000;
end;

function Thour.salary: integer;
begin
  result := hrs*rate;
end;

{ TSalary }

constructor TSalary.Create;
begin
  inherited;
  rank := '������';
end;

function TSalary.salary: integer;
begin
  result := 30000;
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

  SetLength(a, 2);    // Dynamic �迭�� �޸� �Ҵ�
  SetLength(a, 3);    // ���� �޸𸮿��� �޸� size�� �ø�
  SetLength(a2, 2, 3);
  a[0] := 'a';
  a2[0,0] := 'a2';

end;
// option
finalization

end.