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
begin
  Box := TBox.Create;
  Box.AddToBox(1, TId.CreateFromString('ciach'));

  AssertTrue(Box.Contains(1, TId.CreateFromString('ciach')));

  Box.Free;
end;

initialization

  RegisterTest(TBoxTest);
end.

