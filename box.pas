unit Box;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Id,
  fgl;

type
  TCardList = specialize TFPGObjectList<TId>;
  TCardMap = specialize TFPGMap<Integer, TCardList>;
  TBox = class(TObject)
  public
    constructor Create;
    destructor Destroy;
  private
    Id : TGuid;
    Cards : TCardMap;
  end;

implementation

constructor TBox.Create;
begin
  Cards := TCardMap.Create;
end;

destructor TBox.Destroy;
begin
  Cards.Free;
end;

end.

