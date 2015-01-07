unit EventEmitter;

{$mode objfpc}{$H+}

interface

uses
      Classes, SysUtils,
      ExList, EventHandler;

type
  generic TEventEmitter<T> = class(TObject)
    type IEventHandlerOfT = specialize IEventHandler<T>;
    private
      Handlers : TExObjectList; static;
    public
      function GetHandlers : TExObjectList; static;
      procedure Register(EventHandler : IEventHandlerOfT); static;
	end;

implementation

function TEventEmitter.GetHandlers : TExObjectList;
begin
  Result := Handlers;
end;

procedure TEventEmitter.Register(EventHandler : IEventHandlerOfT);
begin

end;

end.

