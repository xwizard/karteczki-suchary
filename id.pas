unit Id;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TId = class(TObject)
    private
      Value : String;
    public
      constructor CreateFromString(arg : String);
      constructor Create;
      function Equals(Obj: TObject): boolean; override;
      function ToString: ansistring; override;
  end;


implementation

constructor TId.Create;
var
  Guid : TGuid;
begin
  CreateGUID(Guid);
  Value := GUIDToString(Guid);
end;

constructor TId.CreateFromString(arg : String);
begin
  Value := arg;
end;

function TId.Equals(Obj: TObject): boolean;
var
  Id : TId;
begin
  If Obj is TId then
  begin
    Id := Obj as TId;
    Equals := Value = Id.Value;
  end else
    Equals := false
end;

function TId.ToString: AnsiString;
begin
  Result := Value;
end;

end.

