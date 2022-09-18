unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TAddForm }

  TAddForm = class(TForm)
    AddButtonUnit2: TButton;
    CancelButtonUnit2: TButton;
    EditUnit2: TEdit;
    procedure AddButtonUnit2Click(Sender: TObject);
    procedure CancelButtonUnit2(Sender: TObject);
    procedure CancelButtonUnit2Click(Sender: TObject);
    procedure EditUnit2Change(Sender: TObject);
  private

  public

  end;

var
  AddForm: TAddForm;

implementation
uses Unit1;

{$R *.lfm}

{ TAddForm }

// Добавление новой фамилии.
procedure TAddForm.AddButtonUnit2Click(Sender: TObject);
begin
  Unit1.MainForm.SurnamesList.Items.Add(EditUnit2.Caption);
  ShowMessage('Успешно!');
  close;
end;

// Выход из формы
procedure TAddForm.CancelButtonUnit2Click(Sender: TObject);
begin
  AddForm.Close;
end;

// Изменение состояния кнопки (disabled, когда поле edit пусто).
procedure TAddForm.EditUnit2Change(Sender: TObject);
begin
   if EditUnit2.Caption = '' then begin
     AddButtonUnit2.Enabled:= False;
   end
   else
       AddButtonUnit2.Enabled:= True;
end;

end.

