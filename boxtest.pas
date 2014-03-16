unit BoxTest;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry,
  Box, Id, Exceptions;
type

  { TBoxTest }

  TBoxTest= class(TTestCase)
  private
    function CreateStubBox: TBox;
  published
    procedure AddCard;
    procedure MoveCardFromSecondToFirst;
    procedure MoveNonexistingCardToFirst;
    procedure MoveNilCardToFirst;
    procedure MoveToNext;
    procedure MoveNilToNext;
    procedure MoveNonexistingCardToNext;
  end;

implementation

function TBoxTest.CreateStubBox: TBox;
var
  Box: TBox;
  i : Integer;
begin
  Box := TBox.Create;
  for i := 1 to 5 do
      Box.AddToBox(i, TId.CreateFromString(IntToStr(i)));
  Result:=Box;
end;

procedure TBoxTest.AddCard;
var
  Box : TBox;
  Id : TId;
begin
  Box:=CreateStubBox;
  Id := TId.CreateFromString('1');

  AssertTrue(Box.Contains(1, Id));
  AssertFalse(Box.Contains(2, Id));

  Box.Free;
  Id.Free;
end;

procedure TBoxTest.MoveCardFromSecondToFirst;
var
  Box : TBox;
  Id : TId;
begin
  Box:=CreateStubBox;
  Id:=TId.CreateFromString('2');

  Box.MoveCardToFirst(Id);

  AssertTrue(Box.Contains(1, Id));
  AssertFalse(Box.Contains(2, Id));

  Box.Free;
  Id.Free;
end;

procedure TBoxTest.MoveNonexistingCardToFirst;
var
  Box : TBox;
  Id : TId;
begin
  Box:=CreateStubBox;
  Id:=TId.CreateFromString('dupa');

  try
    Box.MoveCardToFirst(Id);
    Fail('Test should throw EInvalidState!');
  except on EInvalidState do;
  end;

  Box.Free;
  Id.Free;
end;

procedure TBoxTest.MoveNilCardToFirst;
var
  Box : TBox;
begin
  Box:=CreateStubBox;
  try
    Box.MoveCardToFirst(Nil);
    Fail('Test should throw EInvalidArgument!');
  except on EInvalidArgument do;
  end;

  Box.Free;
end;

procedure TBoxTest.MoveToNext;
var
  Box : TBox;
  Id : TId;
begin
  Box:=CreateStubBox;
  Id:=TId.CreateFromString('2');

  Box.MoveCardToNext(Id);

  AssertFalse(Box.Contains(1, Id));
  AssertFalse(Box.Contains(2, Id));
  AssertTrue(Box.Contains(3, Id));

  Box.Free;
  Id.Free;
end;

procedure TBoxTest.MoveNilToNext;
var
  Box :TBox;
begin
  Box:=CreateStubBox;

  try
    Box.MoveCardToNext(Nil);
    Fail('Shoud throw EInvalidArgument');
  except on EInvalidArgument do;
  end;

  Box.Free;
end;

procedure TBoxTest.MoveNonexistingCardToNext;
var
  Box : TBox;
  Id : TId;
begin
  Box:=CreateStubBox;
  Id:=TId.CreateFromString('dupa');

  try
     Box.MoveCardToNext(Id);
     Fail('Should raise EInvalidState');
  except on EInvalidState do;
  end;

  Id.Free;
  Box.Free;
end;

initialization

  RegisterTest(TBoxTest);
end.

