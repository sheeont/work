unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TSaveForm }

  TSaveForm = class(TForm)
    AcceptButton: TButton;
    CancelButtonUnit4: TButton;
    EditUnit4: TEdit;
    Label1: TLabel;
    procedure AcceptButtonClick(Sender: TObject);
    procedure CancelButtonUnit4Click(Sender: TObject);
    procedure EditUnit4Change(Sender: TObject);
  private

  public

  end;

var
  SaveForm: TSaveForm;

implementation
uses Unit1;

{$R *.lfm}

{ TSaveForm }

// Сохранение ListBox'а в файл.
procedure TSaveForm.AcceptButtonClick(Sender: TObject);
begin
  Unit1.MainForm.SurnamesList.Items.SaveToFile(EditUnit4.Caption);
  ShowMessage('Успешно!');
  SaveForm.Close;
end;

// Закрытие формы.
procedure TSaveForm.CancelButtonUnit4Click(Sender: TObject);
begin
  SaveForm.Close;
end;

// Изменение состояния кнопки (disabled, когда поле edit пусто).
procedure TSaveForm.EditUnit4Change(Sender: TObject);
begin
  if EditUnit4.Caption = '' then begin
     AcceptButton.Enabled:= False;
   end
   else
       AcceptButton.Enabled:= True;
end;

end.

