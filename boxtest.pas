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
    procedure Advance;
    procedure AdvanceNil;
    procedure AdvanceNonExisting;
    procedure AdvanceFromLast;
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

procedure TBoxTest.Advance;
var
  Box : TBox;
  Id : TId;
begin
  Box:=CreateStubBox;
  Id:=TId.CreateFromString('2');

  Box.AdvanceCard(Id);

  AssertFalse(Box.Contains(1, Id));
  AssertFalse(Box.Contains(2, Id));
  AssertTrue(Box.Contains(3, Id));

  Box.Free;
  Id.Free;
end;

procedure TBoxTest.AdvanceNil;
var
  Box :TBox;
begin
  Box:=CreateStubBox;

  try
    Box.AdvanceCard(Nil);
    Fail('Shoud throw EInvalidArgument');
  except on EInvalidArgument do;
  end;

  Box.Free;
end;

procedure TBoxTest.AdvanceNonExisting;
var
  Box : TBox;
  Id : TId;
begin
  Box:=CreateStubBox;
  Id:=TId.CreateFromString('dupa');

  try
     Box.AdvanceCard(Id);
     Fail('Should raise EInvalidState');
  except on EInvalidState do;
  end;

  Id.Free;
  Box.Free;
end;

procedure TBoxTest.AdvanceFromLast;
var
  Box : TBox;
  Id : TId;
begin
  Box:=CreateStubBox;
  Id:=TId.CreateFromString('5');

  Box.AdvanceCard(Id);

  AssertFalse(Box.Contains(5, Id));

  Box.Free;
  Id.Free;
end;

initialization

  RegisterTest(TBoxTest);
end.

