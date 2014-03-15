unit ExListTest;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry,
  ExList, Id, Exceptions;

type

  { TExObjectListTest }

  TExObjectListTest= class(TTestCase)
  protected
    function CreateList: TExObjectList;
  published
    procedure Contains;
    procedure NotContains;
    procedure Get;
    procedure GetNotExistant;
    procedure GetNil;
  end;

implementation

function TExObjectListTest.CreateList: TExObjectList;
var
  List: TExObjectList;
begin
  List := TExObjectList.Create;
  List.OwnsObjects := true;
  List.Add(TId.CreateFromString('test'));
  Result:=List;
end;

procedure TExObjectListTest.Contains;
var
  List : TExObjectList;
  Id : TId;
begin
  List:=CreateList;
  Id := TId.CreateFromString('test');

  AssertTrue(List.Contains(Id));

  Id.Free;
  List.Free;
end;

procedure TExObjectListTest.NotContains;
var
  Id : TId;
  List : TExObjectList;
begin
  List := CreateList;
  Id := TId.CreateFromString('dupa');

  AssertFalse(List.Contains(Id));

  Id.Free;
  List.Free;
end;

procedure TExObjectListTest.Get;
var
  List : TExObjectList;
  Id : TId;
  Id2 : TId;
begin
  List:=CreateList;
  Id:=TId.CreateFromString('test');

  Id2:=List.Get(Id) as TId;

  AssertFalse(Id = Id2);

  List.Free;
  Id.Free;
end;

procedure TExObjectListTest.GetNotExistant;
var
  List : TExObjectList;
  Id : TId;
begin
  List:=CreateList;
  Id:=TId.CreateFromString('nic');

  AssertNull(List.Get(Id));

  List.Free;
  Id.Free;
end;

procedure TExObjectListTest.GetNil;
var
  List : TExObjectList;
begin
  List:=CreateList;

  try
    List.Get(Nil);
    Fail('EInvalidArgument should be thrown, got result instead');
  except
    on EInvalidArgument do;
  end;

  List.Free;
end;

initialization

  RegisterTest(TExObjectListTest);
end.

