unit IdTest;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, Model;

type

  TIdTest= class(TTestCase)
  published
    procedure EqualsOk;
    procedure CreateOk;
  end;

implementation

procedure TIdTest.EqualsOK;
var
  I1, I2, I3 : TId;
begin
  I1 := TId.CreateFromString('test');
  I2 := TId.CreateFromString('test');
  I3 := TId.CreateFromString('dupa');

  AssertTrue(i1.Equals(I2));
  AssertTrue(i2.Equals(I1));
  AssertFalse(i3.Equals(I1));
  AssertFalse(i3.Equals(I2));

  i1.Free;
  i2.Free;
  i3.Free;
end;

procedure TIdTest.CreateOk;
type
  TIdArray = Array [1..1000] of TId;
var
  Ids : TIdArray;
  i,j : Integer;
  test : Boolean;
begin
  for i := 1 to 1000 do
  begin
    Ids[i] := TId.Create;
  end;

  for i := 1 to 1000 do
    for j := 1 to 1000 do
    begin
      test := Ids[i].Equals(Ids[j]);
      if i <> j then
        AssertFalse(test)
      else
        AssertTrue(test);
    end;

  for i := 1 to 1000 do
  begin
    Ids[i].Free;
  end;
end;

initialization

  RegisterTest(TIdTest);
end.

