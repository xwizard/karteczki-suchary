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
    procedure TearDown; override;
  end;

implementation

procedure TBoxTest.TestHookUp;
begin

end;

initialization

  RegisterTest(TBoxTest);
end.

