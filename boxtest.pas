unit BoxTest;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry,
  Model;
type

  TBoxTest= class(TTestCase)
  published
    procedure AddCard;
  end;

implementation

procedure TBoxTest.AddCard;
var
  Box : TBox;
  Id : TId;
begin
  Box := TBox.Create;
  Box.AddToBox(1, TId.CreateFromString('ciach'));
  Id := TId.CreateFromString('ciach');

  AssertTrue(Box.Contains(1, Id));
  AssertFalse(Box.Contains(2, Id));

  Box.Free;
end;

initialization

  RegisterTest(TBoxTest);
end.

