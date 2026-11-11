unit exercicio02;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Entradas, Calculos;

type

  { TForm1 }

  TForm1 = class(TForm)
    Btriangulo: TButton;
    Blimpar: TButton;
    Bsair: TButton;
    EladoA: TEdit;
    EladoB: TEdit;
    EladoC: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MResultado: TMemo;
    procedure BlimparClick(Sender: TObject);
    procedure BsairClick(Sender: TObject);
    procedure BtrianguloClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtrianguloClick(Sender: TObject);
var
  a, b, c, maior, x, y: Double;
begin
  if not LerPositivo(EladoA, 'Lado A', a) then Exit;
  if not LerPositivo(EladoB, 'Lado B', b) then Exit;
  if not LerPositivo(EladoC, 'Lado C', c) then Exit;
  maior := a; x := b; y := c;
  if b > maior then begin maior := b; x := a; y := c; end;
  if c > maior then begin maior := c; x := a; y := b; end;
  MResultado.Clear;
  // Subtracao evita o transbordamento de uma soma de lados muito grandes.
  if maior - x >= y then
    MResultado.Lines.Add('Os lados nao formam um triangulo.')
  else if (a = b) and (b = c) then
    MResultado.Lines.Add('Triangulo equilatero.')
  else if (a = b) or (a = c) or (b = c) then
    MResultado.Lines.Add('Triangulo isosceles.')
  else
    MResultado.Lines.Add('Triangulo escaleno.');
end;

procedure TForm1.BlimparClick(Sender: TObject);
begin
  EladoA.Text := '0';
  EladoB.Text := '0';
  EladoC.Text := '0';
  MResultado.Clear;
  EladoA.SetFocus;
end;

procedure TForm1.BsairClick(Sender: TObject);
begin
  Close;
end;

end.
