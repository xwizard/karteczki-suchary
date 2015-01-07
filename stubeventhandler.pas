unit StubEventHandler;

{$mode objfpc}{$H+}

interface

uses
      Classes, SysUtils,
      EventHandler, DomainEvents;

type
  generic TStubHandler<T> = class(TInterfacedObject, specialize IEventHandler<T>)
    public
      Handled : Integer;
      procedure Handle(Event : T);
	end;

implementation

procedure TStubHandler.Handle(Event : T);
begin
    Handled := Handled + 1;
end;

end.

