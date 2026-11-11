unit exercicio10;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Entradas, Calculos;

type

  { TForm1 }

  TForm1 = class(TForm)
    bPontecia: TButton;
    bSair: TButton;
    eVazao: TEdit;
    eAltura: TEdit;
    eDiametro: TEdit;
    eRendimento: TEdit;
    ePotencia: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rgTipo: TRadioGroup;
    procedure bPonteciaClick(Sender: TObject);
    procedure bSairClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  a, b: array [0..3] of double;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.bPonteciaClick(Sender: TObject);
var
  tg : integer;
  Q, Qa, hg, Pg, Pgm, Ds, Area,Pot, rv : double;

begin
  try
    //inicializar vetor
    a[0] := 0.772;
    a[1] := 0.583;
    a[2] := 0.333;
    a[3] := 0.825;

    b[0] := 0.197;
    b[1] := 0.512;
    b[2] := 0.302;
    b[3] := 0.164;

    //entrada de dados
    if not LerPositivo(eVazao, 'Vazao', Q) then Exit;
    if not LerPositivo(eAltura, 'Altura', hg) then Exit;
    if not LerPositivo(eDiametro, 'Diametro', Ds) then Exit;
    if not LerPositivo(eRendimento, 'Rendimento', rv) then Exit;
    if rv > 1 then
    begin
      ShowMessage('Informe o rendimento como fracao maior que zero e menor ou igual a 1.');
      Exit;
    end;
    tg := rgTipo.ItemIndex;
    if not SelecaoValida(tg, 4, 'o tipo de grao') then Exit;

    //processamento
    Area := Pi * sqr(Ds)/4*hg;
    if not ResultadoValido(Area) then Exit;
    if Area <= 0 then
    begin
      ShowMessage('As dimensoes sao muito pequenas para o calculo.');
      Exit;
    end;

    Qa := Q/Area;
    if not ResultadoValido(Qa) then Exit;
    if (1 + b[tg] * Qa) <= 1 then
    begin
      ShowMessage('A vazao especifica e muito pequena para o calculo.');
      Exit;
    end;

    Pgm := (sqr(Qa) * a[tg])/(Ln(1+b[tg]*Qa));

    Pg  := Pgm * hg;

    Pot := (Q * 1.2 * Pg)/rv;

    //saída
    if not ResultadoValido(Pot) then Exit;
    ePotencia.Text := FloatToStr(Pot);

  except
    on E: EMathError do
      ShowMessage('Os valores informados excedem os limites do calculo.');
  end;
end;

procedure TForm1.bSairClick(Sender: TObject);
begin
  close;
end;

end.
