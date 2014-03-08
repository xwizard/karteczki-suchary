program test;

{$mode objfpc}{$H+}

uses
  Interfaces, Forms, GuiTestRunner, QuizTestCase, Model;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.MainForm.Height := 450;
  Application.Run;
end.

