unit DomainEvents;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  Id;
type
  TDomainEvent = class(TObject)
  private
    FId : TId;
    procedure SetFId(NewId : TId);
  public
    property Id : TId read FId write SetFId;
    constructor Create; virtual;
  end;


implementation

procedure TDomainEvent.SetFId(NewId : TId);
begin
  if (FId <> Nil) then FId.Free;
  FId:=NewId;
end;

constructor TDomainEvent.Create;
begin
  Id:=TId.Create;
end;

end.

