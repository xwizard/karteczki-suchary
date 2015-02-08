unit EventEmitterTest;

{$mode objfpc}{$H+}

interface

uses
      Classes, SysUtils, fpcunit, testutils, testregistry,
      EventEmitter, StubEventHandler, DomainEvents;

type
	TEventEmittertest= class(TTestCase)
      protected
            procedure SetUp; override;
            procedure TearDown; override;
      published
            procedure AddedHandlerShouldRemain;
      end;

implementation

procedure TEventEmitterTest.AddedHandlerShouldRemain;
var
  Handler : TStubHandler;
  Event : TDomainEvent;
begin
     Handler := TStubHandler.Create;
     Event := TDomainEvent.Create;
     TEventEmitter.Register(Handler);
     //TEventEmitter.FreeAllHandlers;
     Handler.Free;
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

