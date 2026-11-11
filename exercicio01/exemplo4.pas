unit exemplo4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Entradas, Calculos;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    EgrausC: TEdit;
    EgrausF: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
   F, C : double;
begin
  try
       //recuperação de variáveis
       if not LerReal(EgrausF, 'Temperatura em Fahrenheit', F) then Exit;

       //processamento
       C := 5/9*(F-32);

       //saida
       if not ResultadoValido(C) then Exit;
       EgrausC.Text := FloatToStr(C);
  except
    on E: EMathError do
      ShowMessage('Os valores informados excedem os limites do calculo.');
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   C, F: double;
begin
  try
       //recuperação de entradas
       if not LerReal(EgrausC, 'Temperatura em Celsius', C) then Exit;

       //processamento
       F := 1.8*C+32;

       //Saída
       if not ResultadoValido(F) then Exit;
       EgrausF.Text := FloatToStr(F);
  except
    on E: EMathError do
      ShowMessage('Os valores informados excedem os limites do calculo.');
  end;
end;

end.
