unit exercicio7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Entradas, Calculos;

type

  { TForm1 }

  TForm1 = class(TForm)
    bQueda: TButton;
    bLimpar: TButton;
    bSair: TButton;
    eFluxo: TEdit;
    eAltura: TEdit;
    eQueda: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    procedure bLimparClick(Sender: TObject);
    procedure bQuedaClick(Sender: TObject);
    procedure bSairClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.bQuedaClick(Sender: TObject);
var
  tg : integer;
  Q, hg, Pg : double;
  a, b : double;
begin
  try
    //entrada
    if not LerPositivo(eFluxo, 'Fluxo de ar', Q) then Exit;
    if not LerPositivo(eAltura, 'Altura', hg) then Exit;
    tg := RadioGroup1.ItemIndex;
    if not SelecaoValida(tg, 4, 'o tipo de grao') then Exit;

    //processamento
    case tg of
         0:begin
           a := 0.722;
           b := 0.197;
         end;
         1:begin
           a := 0.583;
           b := 0.512;
         end;
         2: begin
           a := 0.333;
           b := 0.302;
         end;
         3: begin
           a := 0.825;
           b := 0.164;
         end;
    end;

    if (1 + b * Q) <= 1 then
    begin
      ShowMessage('O fluxo de ar e muito pequeno para o calculo.');
      Exit;
    end;
    Pg := (a*sqr(Q)*hg)/ln(1+b*Q);
    if not ResultadoValido(Pg) then Exit;

    //saida
    eQueda.Text:= FloatToStr( Pg );
  except
    on E: EMathError do
      ShowMessage('Os valores informados excedem os limites do calculo.');
  end;
end;

procedure TForm1.bSairClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.bLimparClick(Sender: TObject);
begin
  eQueda.Text := '0';
  eAltura.Text := '0';
  eFluxo.Text  := '0';
  RadioGroup1.ItemIndex := -1;
end;

end.
