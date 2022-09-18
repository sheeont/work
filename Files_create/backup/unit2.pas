unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFileFormatForm }

  TFileFormatForm = class(TForm)
    AcceptButton: TButton;
    EditFormatForm: TEdit;
    LabelFormatForm: TLabel;
    procedure AcceptButtonClick(Sender: TObject);
    procedure EditFormatFormChange(Sender: TObject);
  private

  public

  end;

var
  FileFormatForm: TFileFormatForm;

implementation
uses Unit1;

{$R *.lfm}

{ TFileFormatForm }

// Обновление состояния кнопок.
procedure TFileFormatForm.EditFormatFormChange(Sender: TObject);
begin
  if EditFormatForm.Caption = '' then begin
     AcceptButton.Enabled:= False;
   end
   else
     AcceptButton.Enabled:= True;
end;

// Создание файлов, проверка правильности ввода.
procedure TFileFormatForm.AcceptButtonClick(Sender: TObject);
var
  i, filesNum : Integer;
  res : string;
  hasLetter, hasNumber, hasSpace : boolean;
begin
  hasLetter := false; hasNumber := false; hasSpace := false;
  // Валидация данных.
  res := EditFormatForm.Caption;
  if res[1] = '.' then begin
     for i:= 2 to length(res) - 1 do
     begin
       // Формат файла может состоять только из букв и цифр, проверим это.
       if (res[i] >= '0') and (res[i] <= '9') then
          hasNumber := true;
       if ((res[i] >= 'A') and (res[i] <= 'Z')) or ((res[i] >= 'a') and (res[i] <= 'z')) then
          hasLetter := true;
       if res[i] = ' ' then begin
          hasSpace := true;
          ShowMessage(BoolToStr(hasSpace) + 'Есть пробел');
       end;
     end;
     if hasSpace then begin
        ShowMessage('Ошибка! Формат файла может состоять только из букв и цифр!');
     end
     // Если валидация прошла успешно, то создаём файлы.
     else if (hasLetter and hasNumber) or hasLetter then begin
        filesNum := StrToInt(MainForm.EditMainForm.Caption);
        for i := 0 to filesNum - 1 do begin
          TFileStream.Create(IntToStr(i + 1) + res, fmCreate);
        end;
        ShowMessage('Успешно!');
        close;
     end
     else
        ShowMessage('Ошибка! Проверьте правильность ввода формата.');
  end;
end;

end.

