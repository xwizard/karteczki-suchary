unit BoxTest;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry,
  Box, Id;
type

  { TBoxTest }

  TBoxTest= class(TTestCase)
  private
    function CreateStubBox: TBox;
  published
    procedure AddCard;
    procedure MoveCardFromSecondToFirst;
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

initialization

  RegisterTest(TBoxTest);
end.

