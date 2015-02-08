unit EventEmitter;

{$mode objfpc}{$H+}

interface

uses
      Classes, SysUtils,
      ExList, EventHandler;

type

	{ TEventEmitter }

  TEventEmitter = class(TObject)
    private
      class var Handlers : TExObjectList;
    public
      class function GetHandlers : TExObjectList; static;
      class procedure Register(EventHandler : IEventHandler); static;
      class procedure FreeAllHandlers; static;
	end;

implementation

class function TEventEmitter.GetHandlers : TExObjectList;
begin
  Result := Handlers;
end;

class procedure TEventEmitter.Register(EventHandler : IEventHandler);
begin
      if Handlers = Nil then
        Handlers := TExObjectList.Create;
end;

class procedure TEventEmitter.FreeAllHandlers;
begin
  if Handlers <> Nil then
    Handlers.Clear;
end;

end.

