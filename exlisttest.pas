unit ExListTest;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, ExList, Model;

type

  { TExObjectListTest }

  TExObjectListTest= class(TTestCase)
  protected
    function CreateList: TExObjectList;
  published
    procedure Contains;
    procedure NotContains;
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

initialization

  RegisterTest(TExObjectListTest);
end.

