unit Udata;

interface

uses
  vcl.Dialogs;

type
  TDog = class
    Name : String;
    Age : byte;
    Address : String;
    function GetName : String;
  end;

  TPerson = class(TObject)
    private
      ttt: string;
    strict private
      ttt2: String;
    public
      Name : String;
      Age : byte;
      Address : String;
      Constructor Create ; virtual;
      function GetName : String;
  end;

  TEmp = class(TPerson)
    office : String;
    Constructor Create ; override;
    function Salary : integer; virtual; abstract; // dynamic
  end;

  TSalary = class(TEmp)
    rank : String;
    Constructor Create ; override; final;
    function Salary : integer; override;
  end;

  THour = class sealed(TEmp)
    hour : integer;
    rate : integer;
    Constructor Create; override;
    function Salary : Integer; override;
  end;

  Country = array [0..2] of string;
  Person = record
    Name: String;
    Age : Byte;
    Address : String;
  end;

  p_person = ^Person;

var
  Countries:Country;
  p:p_person;
  i : integer = 10;

procedure Test;
function Add(x, y : Integer) : integer;
function Divide(x, y : integer) : integer; overload;
function Divide(x, y : real) : real; overload;

implementation
var
  j : integer;

procedure Test;
var
  k : integer;
begin
  ShowMessage('Test');
end;

function Add(x, y : integer) : integer;
begin
  result := x + y;
end;

function Divide(x, y : integer) : integer;
begin
  result := x div y;
end;

function Divide(x, y : real) : real;
begin
  result := x / y;
end;

{ TDog }

function TDog.GetName: String;
begin
  Result := Name;
end;

{ TPerson }

constructor TPerson.Create;
begin
  Name := 'kim';
  Age := 40;
  Address := 'Any Where';
end;

function TPerson.GetName: String;
begin
  Result := Name;
end;

{ TEmp }

constructor TEmp.Create;
begin
  inherited;
  Office := '가산동';
end;

{ TSalary }

constructor TSalary.Create;
begin
  inherited;
  rank := '대리';
end;

function TSalary.Salary: integer;
begin
  Salary := 5000000;
  Result := Salary;
end;

{ THour }

constructor THour.Create;
begin
  inherited;
  hour := 8;
  rate := 10000;
end;

function THour.Salary: Integer;
begin
  Result := hour * rate;
end;

initialization
begin
  Countries[0] := 'korea';
  Countries[1] := 'japan';
  Countries[2] := 'usa';
end;
end.
