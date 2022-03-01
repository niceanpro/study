unit utest4;

// type, const, var, procedure, function 선언, 다른 unit에서 이곳에 정의된 것들을 사용할 수 있음, 단 uses절에 utest4를 추가해서 사용
interface
uses
  vcl.Dialogs;

type
  TDog = class
    Name:string;
    Age:byte;
    Address:string;
    function GetName:string; // default, compile시점에 자료 결정 됨
  end;

  TPerson = class(TObject)
    private           // 같은 유닛에서는 보임
      ttt:string;
//    strict private    // class내에서만 보임
//    protected
//    strict protected
//    published         // public 이지만 object inspect에서 보임
    public
      Name:string;
      Age:byte;
      Address:string;
      function GetName:string;
      constructor Create; virtual;
  end;

  TEmp = class (TPerson)
    office:string;
    function salary:integer; virtual; abstract;// virtual 속도 좋고, dynamic : 메모리 효율성 좋음
    constructor Create; override;
  end;

  TSalary = class sealed (TEmp)           // sealed를 붙이면 이 class는 하위 class를 더 확장하지 못함
    rank:string;
    function salary:integer; override;
    constructor Create; override; final;  // final은 하위에서 다시 재정의 하지 않겠다
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
  a:array of string;  // Dynamic 배열 선언
  a2:array of array of string;
  p:p_person;
  ps:pchar;   // 문자열 포인터 ( pansichar, pwidechar, puncodechar ) pchar = punicodechar
  v:temp;
  v1:variant;  // runtime시점에 결정 됨 : 문자, 숫자, 날짜, 배열, ole object


  procedure Test;
  function Add(x, y:integer):integer;
  function Divide(x, y : integer) : integer; overload;
  function Divide(x, y : real) :real; overload;
  // 위에서 선언된 루틴들을 구현하는 곳
  // type, const, var를 선언 가능 : 다른 유니트에서는 사용할 수 없고, 해당 유니트의 구현 부분에서만 사용
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
  // exit(x+y);   // 2010부터 exit(리턴값) 가능
end;

function Divide(x, y:integer):integer;
begin
  result := x div y;
end;


function Divide(x, y:real):real;
begin
  result := x / y;
end;

// option; Uses절을 만나면 실행 : 초기처리; 변수값을 지정, 메모리 할당
{ TDog }

// ctl + shift + c : 바디를 만들어 준다.
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
  rank := '하하하';
end;

function TSalary.salary: integer;
begin
  result := 30000;
end;

{ TEmp }

constructor TEmp.Create;
begin
  inherited;
  office := '데브기어';
end;

initialization
begin
  Countries[0] := '한국';
  Countries[1] := '미국';
  Countries[2] := '일본';

  SetLength(a, 2);    // Dynamic 배열에 메모리 할당
  SetLength(a, 3);    // 같은 메모리에서 메모리 size를 늘림
  SetLength(a2, 2, 3);
  a[0] := 'a';
  a2[0,0] := 'a2';

end;
// option
finalization

end.
