unit exemplo3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons, Entradas, Calculos;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  nasc, atual: Integer;
begin
  if not TryStrToInt(Trim(Edit1.Text), nasc) then
  begin
    ShowMessage('Informe um ano de nascimento inteiro valido.');
    Exit;
  end;
  if not TryStrToInt(Trim(Edit2.Text), atual) then
  begin
    ShowMessage('Informe um ano atual inteiro valido.');
    Exit;
  end;
  if (nasc < 1) or (atual < nasc) or (atual > 9999) then
  begin
    ShowMessage('Use anos entre 1 e 9999, com nascimento anterior ou igual ao ano atual.');
    Exit;
  end;
  Edit3.Text := IntToStr(atual - nasc);
end;

end.
