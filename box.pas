unit Box;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Id, ExList;

const
  BOXES : Integer = 5;

type
  TCardArray = Array[1..5] of TExObjectList;
  TBox = class(TObject)
  public
    constructor Create;
    destructor Destroy;
    procedure MoveCardToFirst(CardId : TId);
    procedure AddToBox(BoxNumber : Integer; CardId : TId);
    function Contains(BoxNumber : Integer; CardId : TId) : Boolean;
  private
    Id : TGuid;
    Cards : TCardArray;
  end;

implementation

constructor TBox.Create;
var
  i : Integer;
begin
  for i := 1 to BOXES do
  begin
    Cards[i] := TExObjectList.Create;
    Cards[i].OwnsObjects := True;
  end;
end;

destructor TBox.Destroy;
var
  i : Integer;
begin
  for i:=1 to BOXES do
    Cards[i].Free;
end;

procedure TBox.MoveCardToFirst(CardId : TId);
begin

end;

procedure TBox.AddToBox(BoxNumber : Integer; CardId : TId);
begin
     Cards[BoxNumber].Add(CardId);
end;
function TBox.Contains(BoxNumber : Integer; CardId : TId) : Boolean;
var
  i : Integer;
begin
  Result := Cards[BoxNumber].Contains(CardId);
end;

end.

