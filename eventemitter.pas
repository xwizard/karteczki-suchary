unit EventEmitter;

{$mode objfpc}{$H+}

interface

uses
      Classes, SysUtils,
      ExList;

type
  TEventEmitter = class(TObject)
    private
      Handlers : TExObjectList; Static;
    public
      function GetHandlers : TExObjectList; Static;
	end;

implementation

function TEventEmitter.GetHandlers : TExObjectList;
begin
  Result := Handlers;
end;

end.

