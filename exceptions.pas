unit Exceptions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  EInvalidArgument = class(Exception);
  EInvalidState = class(Exception);

implementation

end.

