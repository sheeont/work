unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TMainForm }

  TMainForm = class(TForm)
    GoToNextButton: TButton;
    EditMainForm: TEdit;
    LabelMainForm: TLabel;
    procedure GoToNextButtonClick(Sender: TObject);
    procedure EditMainFormChange(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation
uses Unit2;

{$R *.lfm}

{ TMainForm }

// Обновление состояния кнопки.
procedure TMainForm.EditMainFormChange(Sender: TObject);
begin
  if EditMainForm.Caption = '' then begin
     GoToNextButton.Enabled:= False;
   end
   else
     GoToNextButton.Enabled:= True;
end;

procedure TMainForm.GoToNextButtonClick(Sender: TObject);
begin
  FileFormatForm.Show();
  MainForm.Close();
end;

end.

