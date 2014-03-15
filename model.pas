unit Model;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  Quiz, Box, Id, Exceptions;

type
  TQuiz = Quiz.TQuiz;
  TBox = Box.TBox;
  TId = Id.TId;

  EInvalidArgument = Exceptions.EInvalidArgument;

implementation

end.

