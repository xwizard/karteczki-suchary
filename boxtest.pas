unit BoxTest;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry,
  Model;
type

  TBoxTest= class(TTestCase)
  private
    Box : TBox;
  published
    procedure TestHookUp;
    procedure SetUp; override;
  end;

implementation

procedure TBoxTest.TestHookUp;
begin
  //Box.
end;

procedure TBoxTest.SetUp;
begin
  Box := Box.Create;
end;

initialization

  RegisterTest(TBoxTest);
end.

