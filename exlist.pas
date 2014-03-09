unit ExList;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, contnrs;

type
  TExObjectList = class(TFPObjectList)
    public
      function Contains(AObject : TObject) : Boolean;
  end;

implementation

function TExObjectList.Contains(AObject : TObject) : Boolean;
var
  i : Integer;
begin
  Result := False;
  for i := 0 to Count-1 do
  begin
    if Items[i] <> Nil then
    begin
      if Items[i].Equals(AObject) then
      begin
        Result := True;
        Break;
      end;
    end;
  end;
end;

end.

