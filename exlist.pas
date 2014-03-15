unit ExList;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, contnrs,
  Exceptions;

type
  TExObjectList = class(TFPObjectList)
    public
      function Contains(AObject : TObject) : Boolean;
      function Get(AObject : TObject) : TObject;
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

function TExObjectList.Get(AObject : TObject) : TObject;
var i : Integer;
begin
  if AObject = Nil then
    raise EInvalidArgument.Create('AObject cannot be Nil!');

  Result:=Nil;
  for i:= 0 to Count-1 do
  begin
    if Items[i] <> Nil then
      if Items[i].Equals(AObject) then
        begin
          Result:=Items[i];
          Break;
        end;
  end;
end;

end.

