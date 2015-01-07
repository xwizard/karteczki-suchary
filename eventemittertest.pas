unit EventEmitterTest;

{$mode objfpc}{$H+}

interface

uses
      Classes, SysUtils, fpcunit, testutils, testregistry,
      EventEmitter, EventHandler;

type

      TEventEmittertest= class(TTestCase)
      protected
            procedure SetUp; override;
            procedure TearDown; override;
      published
            procedure TestHookUp;
      end;

implementation

procedure TEventEmitterTest.TestHookUp;
begin
      Fail('Write your own test');
end;

procedure TEventEmitterTest.SetUp;
begin

end;

procedure TEventEmitterTest.TearDown;
begin

end;

initialization

      RegisterTest(TEventEmitterTest);
end.

