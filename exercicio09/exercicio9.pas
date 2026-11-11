unit exercicio9;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  ExtCtrls, TAGraph, TASeries, Entradas, Calculos;

type

  { TForm1 }

  TForm1 = class(TForm)
    bCalcular: TButton;
    Button2: TButton;
    Button3: TButton;
    Chart1: TChart;
    FlineB: TLineSeries;
    Fline: TLineSeries;
    Epopia: TEdit;
    Epopib: TEdit;
    Etaxaa: TEdit;
    Etaxab: TEdit;
    Etempo: TEdit;
    Epopa: TEdit;
    Epopb: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure bCalcularClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure InitLine;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.bCalcularClick(Sender: TObject);
var
  popiA, popiB, popA, popB, taxaA, taxaB: Double;
  tempo: Integer;
  erro: string;
  ano, limite: Integer;
  novaA, novaB: Double;

begin
  try
    if not LerPositivo(Epopia, 'Populacao inicial A', popiA) then Exit;
    if not LerPositivo(Epopib, 'Populacao inicial B', popiB) then Exit;
    if not LerNaoNegativo(Etaxaa, 'Taxa A', taxaA) then Exit;
    if not LerNaoNegativo(Etaxab, 'Taxa B', taxaB) then Exit;
    if not SimularPopulacao(popiA, popiB, taxaA, taxaB,
      tempo, popA, popB, erro) then
    begin
      ShowMessage(erro);
      Exit;
    end;
    Etempo.Text := IntToStr(tempo);
    Epopa.Text := FloatToStr(popA);
    Epopb.Text := FloatToStr(popB);

    // Reutiliza as series do formulario e inclui o ano da ultrapassagem.
    InitLine;
    Fline.Clear;
    FlineB.Clear;
    popA := popiA;
    popB := popiB;
    taxaA := 1 + taxaA / 100;
    taxaB := 1 + taxaB / 100;
    limite := Round(tempo * 1.4);
    for ano := 0 to limite do
    begin
      Fline.AddXY(ano, popA);
      FlineB.AddXY(ano, popB);
      if ano = limite then Break;
      if not ProximaPopulacao(popA, taxaA, novaA) or
        not ProximaPopulacao(popB, taxaB, novaB) then Break;
      popA := novaA;
      popB := novaB;
    end;
  except
    on E: EMathError do
      ShowMessage('Os valores informados excedem os limites do calculo.');
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Epopia.Text:='0';
  Epopib.Text:='0';
  Etaxaa.Text:='0';
  Etaxab.Text:='0';
  Etempo.Text:='0';
  Epopa.Text:='0';
  Epopb.Text:='0';
  Fline.Clear;
  FlineB.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.InitLine;
begin
  Fline.ShowLines := True;
  Fline.ShowPoints := False;
  Fline.Title := 'Pop. A';
  Fline.SeriesColor := clRed;
  FlineB.ShowLines := True;
  FlineB.ShowPoints := False;
  FlineB.Title := 'Pop. B';
  FlineB.SeriesColor := clGreen;
  Chart1.Legend.Visible := True;
end;

end.
