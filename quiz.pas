unit Quiz;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fgl;

type
  TQuiz = class(TObject)
  private
    Cards: specialize TFPGList<Integer>;
  published
  end;

implementation

end.

