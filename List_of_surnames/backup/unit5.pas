unit Unit5;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TLoadForm }

  TLoadForm = class(TForm)
    AcceptButton: TButton;
    CancelButtonUnit5: TButton;
    EditUnit5: TEdit;
    Label1: TLabel;
    procedure AcceptButtonClick(Sender: TObject);
    procedure CancelButtonUnit5Click(Sender: TObject);
    procedure EditUnit5Change(Sender: TObject);
  private

  public

  end;

var
  LoadForm: TLoadForm;

implementation
uses Unit1;

{$R *.lfm}

{ TLoadForm }

// Выгрузка данных из файла
procedure TLoadForm.AcceptButtonClick(Sender: TObject);
var
  sList : TStringList;
begin
  sList := TStringList.Create;
  sList.LoadFromFile(EditUnit5.Caption);
  if sList.Count <> 0 then begin
    Unit1.MainForm.SurnamesList.Items.LoadFromFile(EditUnit5.Caption);
    ShowMessage('Успешно!');
    LoadForm.Close;
  end
  else
    ShowMessage('Файл пуст или отсутствует!');
end;

// Закрытие формы
procedure TLoadForm.CancelButtonUnit5Click(Sender: TObject);
begin
  LoadForm.Close;
end;

// Изменение состояния кнопки (disabled, когда поле edit пусто).
procedure TLoadForm.EditUnit5Change(Sender: TObject);
begin
  if EditUnit5.Caption = '' then begin
     AcceptButton.Enabled:= False;
   end
   else
       AcceptButton.Enabled:= True;
end;

end.

