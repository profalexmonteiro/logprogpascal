unit Calculos;

{$mode objfpc}{$H+}

interface

uses SysUtils, Math;

const
  MaxAnosSimulacao = 10000;

function TentarNumero(const Texto: string; out Valor: Double): Boolean;
function ProximaPopulacao(Atual, Fator: Double; out Proxima: Double): Boolean;
function SimularPopulacao(InicialA, InicialB, TaxaA, TaxaB: Double;
  out Anos: Integer; out FinalA, FinalB: Double; out Erro: string): Boolean;

implementation

function TentarNumero(const Texto: string; out Valor: Double): Boolean;
var
  Formato: TFormatSettings;
  Normalizado: string;
begin
  // Aceita ponto OU virgula decimal, sem separadores de milhares.
  Valor := 0;
  Formato := DefaultFormatSettings;
  Formato.DecimalSeparator := '.';
  Normalizado := StringReplace(Trim(Texto), ',', '.', [rfReplaceAll]);
  try
    Result := TryStrToFloat(Normalizado, Valor, Formato);
    if Result then
      Result := not (IsNan(Valor) or IsInfinite(Valor));
  except
    on E: EMathError do Result := False;
  end;
  if not Result then Valor := 0;
end;

function ProximaPopulacao(Atual, Fator: Double; out Proxima: Double): Boolean;
begin
  Result := False;
  Proxima := 0;
  if IsNan(Atual) or IsInfinite(Atual) or IsNan(Fator) or
    IsInfinite(Fator) or (Atual <= 0) or (Fator < 1) then Exit;
  if Atual > MaxDouble / Fator then Exit;
  Proxima := Atual * Fator;
  Result := not (IsNan(Proxima) or IsInfinite(Proxima));
end;

function SimularPopulacao(InicialA, InicialB, TaxaA, TaxaB: Double;
  out Anos: Integer; out FinalA, FinalB: Double; out Erro: string): Boolean;
var
  FatorA, FatorB, NovaA, NovaB: Double;
begin
  Result := False;
  Anos := 0;
  FinalA := InicialA;
  FinalB := InicialB;
  Erro := '';
  if IsNan(InicialA) or IsInfinite(InicialA) or
    IsNan(InicialB) or IsInfinite(InicialB) or
    IsNan(TaxaA) or IsInfinite(TaxaA) or
    IsNan(TaxaB) or IsInfinite(TaxaB) or
    (InicialA <= 0) or (InicialB <= 0) or (TaxaA < 0) or (TaxaB < 0) then
  begin
    Erro := 'Informe populacoes positivas e taxas de crescimento nao negativas.';
    Exit;
  end;
  FatorA := 1 + TaxaA / 100;
  FatorB := 1 + TaxaB / 100;
  if (InicialA <= InicialB) and (FatorA <= FatorB) then
  begin
    Erro := 'A cidade A nao ultrapassa B com essas populacoes e taxas.';
    Exit;
  end;
  while FinalA <= FinalB do
  begin
    if Anos >= MaxAnosSimulacao then
    begin
      Erro := 'A simulacao excede o limite de 10000 anos.';
      Exit;
    end;
    if not ProximaPopulacao(FinalA, FatorA, NovaA) or
      not ProximaPopulacao(FinalB, FatorB, NovaB) then
    begin
      Erro := 'As populacoes excedem o limite numerico do programa.';
      Exit;
    end;
    FinalA := NovaA;
    FinalB := NovaB;
    Inc(Anos);
  end;
  Result := True;
end;

end.
