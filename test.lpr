program test;

{$mode objfpc}{$H+}

uses
  Interfaces, Forms, GuiTestRunner, ModelTestCase;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.Run;
end.

