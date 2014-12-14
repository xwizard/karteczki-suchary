unit EventHandler;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DomainEvents;

type
  IEventHandler = interface
    procedure Handle(Event : TDomainEvent);
	end;

implementation

end.

