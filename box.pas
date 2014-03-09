unit Box;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Id,
  fgl;

type
  TCardList = specialize TFPGList<TId>;
  TCardMap = specialize TFPGMap<Integer, TCardList>;
  TBox = class(TObject)
  public
    constructor Create;
  private
    Id : TGuid;
    Cards : TCardMap;
  end;

implementation

constructor TBox.Create;
begin
  Cards := TCardMap.Create;
end;

end.

