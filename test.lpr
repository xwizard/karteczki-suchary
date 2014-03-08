program test;

{$mode objfpc}{$H+}

uses
  Interfaces, Forms, GuiTestRunner, QuizTestCase;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.Run;
end.

