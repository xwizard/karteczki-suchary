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

  { TBox }

  TBox = class(TObject)
  public
    constructor Create;
    destructor Destroy;
    procedure MoveCardToFirst(CardId : TId);
    procedure MoveCardToNext (CardId : TId);
    procedure AddToBox(BoxNumber : Integer; CardId : TId);
    function Contains(BoxNumber : Integer; CardId : TId) : Boolean;
  private
    FId : TId;
    Cards : TCardArray;
    procedure CheckCardExistence(var BoxHolding: Integer; var CardId: TId);
    function GetBoxHolding(Id : TId) : Integer;
    function ExtractCard(const BoxHolding: Integer;
      const CardId: TId) : TId;
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

function TBox.ExtractCard(const BoxHolding: Integer;
  const CardId: TId) : TId;
var
  AObject: TObject;
begin
  AObject:=Cards[BoxHolding].Get(CardId);
  if AObject = nil then raise EInvalidState('Card with id ' + CardId.ToString + ' '
    +'doesn''t exist in box!');
  Result:=Cards[BoxHolding].Extract(AObject as TId) as TId;
end;

procedure TBox.MoveCardToFirst(CardId : TId);
var
  BoxHolding : Integer;
  IdOnList : TId;
begin
  BoxHolding:=GetBoxHolding(CardId);
  CheckCardExistence(BoxHolding, CardId);
  IdOnList:=ExtractCard(BoxHolding, CardId);
  Cards[1].Add(IdOnList);
end;

procedure TBox.MoveCardToNext(CardId : TId);
var
  BoxHolding : Integer;
  IdOnList : TId;
begin
  BoxHolding:=GetBoxHolding(CardId);
  CheckCardExistence(BoxHolding, CardId);
  IdOnList:=ExtractCard(BoxHolding, CardId);
  Cards[BoxHolding+1].Add(IdOnList);
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
  if Id = Nil then raise EInvalidArgument.Create('Id cannot be Nil!');
  Result:=-1;
  for i:=1 to BOXES do
    if Cards[i].Contains(Id) then
    begin
      Result:=i;
      Break;
    end;
end;

procedure TBox.CheckCardExistence(var BoxHolding: Integer; var CardId: TId);
begin
  if BoxHolding < 1 then raise EInvalidState.Create('No box is holding card ' +
    CardId.ToString);
end;

end.

