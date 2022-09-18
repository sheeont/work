unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TEditForm }

  TEditForm = class(TForm)
    AcceptButton: TButton;
    CancelButton: TButton;
    EditUnit3: TEdit;
    procedure AcceptButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure EditUnit3Change(Sender: TObject);
  private

  public

  end;

var
  EditForm: TEditForm;

implementation
uses Unit1;

{$R *.lfm}

{ TEditForm }

// Изменение состояния кнопки (disabled, когда поле edit пусто).
procedure TEditForm.EditUnit3Change(Sender: TObject);
begin
  if EditUnit3.Caption = '' then begin
     AcceptButton.Enabled:= False;
   end
   else
     AcceptButton.Enabled:= True;
end;

// Редактирование фамилии.
procedure TEditForm.AcceptButtonClick(Sender: TObject);
var
  index : Integer;
begin
  // Получаем индекс выбранной для редактирования строки, удаляем и ставим новую.
  index := Unit1.MainForm.SurnamesList.ItemIndex;
  Unit1.MainForm.SurnamesList.Items.Delete(index);
  Unit1.MainForm.SurnamesList.Items.Insert(index, EditUnit3.Caption);
  close;
end;

procedure TEditForm.CancelButtonClick(Sender: TObject);
begin
  EditForm.Close;
end;

end.

