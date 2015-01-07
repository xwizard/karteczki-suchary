unit EventHandler;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DomainEvents;

type
  generic IEventHandler<T> = interface
    procedure Handle(Event : T);
	end;

implementation

end.

