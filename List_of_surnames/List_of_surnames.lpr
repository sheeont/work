program List_of_surnames;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, Unit2, Unit3, Unit4, Unit5
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddForm, AddForm);
  Application.CreateForm(TEditForm, EditForm);
  Application.CreateForm(TSaveForm, SaveForm);
  Application.CreateForm(TLoadForm, LoadForm);
  Application.Run;
end.

