unit StubEventHandler;

{$mode objfpc}{$H+}

interface

uses
      Classes, SysUtils,
      EventHandler, DomainEvents;

type
  TStubHandler = class(TInterfacedObject, IEventHandler)
    public
      Handled : Integer;
      procedure Handle(Event : TDomainEvent);
	end;

implementation

procedure TStubHandler.Handle(Event : TDomainEvent);
begin
    Handled := Handled + 1;
end;

end.

