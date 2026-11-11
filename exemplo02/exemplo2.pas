unit exemplo2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons, Entradas, Calculos;

type

  { TForm1 }

  TForm1 = class(TForm)
    bbSair: TButton;
    BitBtn1: TBitBtn;
    procedure bbSairClick(Sender: TObject);
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
  texto: string;
  area, base, altura: Double;
begin
  try
    if not InputQuery('Area do triangulo', 'Altura:', texto) then Exit;
    if not TentarNumero(texto, altura) or (altura <= 0) then
    begin
      ShowMessage('Informe uma altura numerica maior que zero.');
      Exit;
    end;
    texto := '';
    if not InputQuery('Area do triangulo', 'Base:', texto) then Exit;
    if not TentarNumero(texto, base) or (base <= 0) then
    begin
      ShowMessage('Informe uma base numerica maior que zero.');
      Exit;
    end;
    area := (base / 2) * altura;
    if not ResultadoValido(area) then Exit;
    ShowMessage('A area do triangulo e: ' + FloatToStr(area));
  except
    on E: EMathError do
      ShowMessage('Os valores informados excedem os limites do calculo.');
  end;
end;

procedure TForm1.bbSairClick(Sender: TObject);
begin
  close;
end;

end.
