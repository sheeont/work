unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Menus;

type

  { TMainForm }

  TMainForm = class(TForm)
    AddButton: TButton;
    EditButton: TButton;
    DeleteButton: TButton;
    ListBoxHeader: TLabel;
    MainMenu1: TMainMenu;
    FileSettings: TMenuItem;
    Load: TMenuItem;
    Additional: TMenuItem;
    ClearList: TMenuItem;
    ExitMenu: TMenuItem;
    Save: TMenuItem;
    SurnamesList: TListBox;
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure ExitMenuClick(Sender: TObject);
    procedure LoadClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure SurnamesListClick(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation
uses Unit2, Unit3, Unit4, Unit5;

{$R *.lfm}

{ TMainForm }

// Добавление новой фамилии.
procedure TMainForm.AddButtonClick(Sender: TObject);
begin
  AddForm.Show();
end;

// Удаление фамилий.
procedure TMainForm.DeleteButtonClick(Sender: TObject);
begin
  SurnamesList.DeleteSelected();
end;

// Редактирование фамилии.
procedure TMainForm.EditButtonClick(Sender: TObject);
begin
  EditForm.show();
end;

// Выход из программы
procedure TMainForm.ExitMenuClick(Sender: TObject);
begin
  close;
end;

procedure TMainForm.LoadClick(Sender: TObject);
begin
  LoadForm.show();
end;

// Сохранение данных из ListBox в файл.
procedure TMainForm.SaveClick(Sender: TObject);
begin
  SaveForm.show();
end;


// Обработчик выбора строк.
procedure TMainForm.SurnamesListClick(Sender: TObject);
var
  // i - число для прохода по циклу, count - кол-во выбранных строк.
  i, count : Integer;
begin
  count := 0;
  for i:=0 to SurnamesList.Count - 1 do
     // Если выбрано несколько строк, то отключаем кнопку редактирования фамилии.
     if SurnamesList.Selected[i] then begin
        count += 1;
        if count >= 2 then begin
           EditButton.Enabled := False;
        end
        else
            EditButton.Enabled := True;
     end;
end;

end.

