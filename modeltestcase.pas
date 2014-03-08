unit ModelTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry,
  Model;

type

  TQuizTest= class(TTestCase)
  private
    Quiz: TQuiz;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestHookUp;
  end;

implementation

procedure TQuizTest.TestHookUp;
begin
  Fail('Write your own test');
end;

procedure TQuizTest.SetUp;
begin

end;

procedure TQuizTest.TearDown;
begin

end;

initialization

  RegisterTest(TQuizTest);
end.

