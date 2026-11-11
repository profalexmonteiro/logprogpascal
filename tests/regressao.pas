program Regressao;

{$mode objfpc}{$H+}

uses SysUtils, Math, Calculos;

var
  Total, Anos: Integer;
  Valor, A, B: Double;
  Erro: string;
  FormatoOriginal: TFormatSettings;

procedure Verificar(Condicao: Boolean; const Nome: string);
begin
  Inc(Total);
  if not Condicao then
  begin
    WriteLn('FALHOU: ', Nome);
    Halt(1);
  end;
end;

begin
  Total := 0;
  Verificar(TentarNumero('1,5', Valor), 'virgula decimal');
  Verificar(Abs(Valor - 1.5) < 1E-12, 'valor com virgula');
  Verificar(TentarNumero(' 1.5 ', Valor), 'ponto e espacos');
  Verificar(Abs(Valor - 1.5) < 1E-12, 'valor com ponto');
  Verificar(TentarNumero('-1', Valor), 'sentinela numerica');
  Verificar(Valor = -1, 'valor da sentinela');
  Verificar(not TentarNumero('', Valor), 'campo vazio');
  Verificar(not TentarNumero('abc', Valor), 'texto');
  Verificar(not TentarNumero('1.234,5', Valor), 'separadores misturados');
  Verificar(not TentarNumero('1,2,3', Valor), 'separadores repetidos');
  Verificar(not TentarNumero('NaN', Valor), 'NaN');
  Verificar(not TentarNumero('Inf', Valor), 'infinito');
  Verificar(not TentarNumero('1e9999', Valor), 'expoente fora do limite');
  FormatoOriginal := DefaultFormatSettings;
  try
    DefaultFormatSettings.DecimalSeparator := ',';
    Verificar(TentarNumero('1.5', Valor), 'ponto em sistema com virgula');
    Verificar(TentarNumero('1,5', Valor), 'virgula em sistema com virgula');
  finally
    DefaultFormatSettings := FormatoOriginal;
  end;
  Verificar(not SimularPopulacao(0, 0, 0, 0, Anos, A, B, Erro), 'zeros iniciais');
  Verificar(Erro <> '', 'mensagem de entrada invalida');
  Verificar(not SimularPopulacao(100, 200, 1, 1, Anos, A, B, Erro), 'taxas iguais');
  Verificar(not SimularPopulacao(100, 200, 1, 2, Anos, A, B, Erro), 'A cresce menos');
  Verificar(not SimularPopulacao(100, 200, -1, 2, Anos, A, B, Erro), 'taxa negativa');
  Verificar(SimularPopulacao(200, 100, 0, 0, Anos, A, B, Erro), 'A ja ultrapassou');
  Verificar((Anos = 0) and (A = 200) and (B = 100), 'resultado inicial preservado');
  Verificar(SimularPopulacao(100, 200, 100, 0, Anos, A, B, Erro), 'ultrapassagem');
  Verificar((Anos = 2) and (A = 400) and (B = 200), 'igualdade nao ultrapassa');
  Verificar(SimularPopulacao(100, 100, 1, 0, Anos, A, B, Erro), 'populacoes iguais');
  Verificar(Anos = 1, 'ultrapassagem apos um ano');
  Verificar(not SimularPopulacao(1, 2, 0.000001, 0, Anos, A, B, Erro), 'limite de anos');
  Verificar(Anos = MaxAnosSimulacao, 'limite respeitado');
  Verificar(not ProximaPopulacao(1E308, 2, Valor), 'overflow da populacao');
  Verificar(not SimularPopulacao(1E308, 1.5E308, 100, 0, Anos, A, B, Erro), 'overflow');
  Verificar(ProximaPopulacao(100, 1.5, Valor), 'crescimento de um ano');
  Verificar(Valor = 150, 'valor do crescimento');
  WriteLn(Total, ' verificacoes passaram.');
end.
