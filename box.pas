unit Box;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  Id, Exceptions, ExList;

const
  BOXES : Integer = 5;

type
  TCardArray = Array[1..5] of TExObjectList;
  TBox = class(TObject)
  public
    constructor Create;
    destructor Destroy;
    procedure MoveCardToFirst(const CardId : TId);
    procedure AddToBox(BoxNumber : Integer; CardId : TId);
    function Contains(BoxNumber : Integer; CardId : TId) : Boolean;
  private
    FId : TId;
    Cards : TCardArray;
    function GetBoxHolding(Id : TId) : Integer;
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

procedure TBox.MoveCardToFirst(const CardId : TId);
var
  BoxHolding : Integer;
  IdOnList : TId;
  AObject : TObject;
begin
  BoxHolding:=GetBoxHolding(CardId);
  AObject:=Cards[BoxHolding].Get(CardId);
  if AObject = Nil then raise EInvalidState('Card with id ' + CardId.ToString + ' doesn''t exist in box!');
  IdOnList:=Cards[BoxHolding].Extract(AObject as TId) as TId;
  Cards[1].Add(IdOnList);
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

function TBox.GetBoxHolding(Id : TId) : Integer;
var
  i : Integer;
begin
  for i:=1 to BOXES do
    if Cards[i].Contains(Id) then
    begin
      Result:=i;
      Break;
    end;
end;

end.

