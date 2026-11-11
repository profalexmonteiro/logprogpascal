unit Entradas;

{$mode objfpc}{$H+}

interface

uses SysUtils, Math, StdCtrls, Dialogs, Calculos;

function LerReal(Campo: TEdit; const Nome: string; out Valor: Double): Boolean;
function LerPositivo(Campo: TEdit; const Nome: string; out Valor: Double): Boolean;
function LerNaoNegativo(Campo: TEdit; const Nome: string; out Valor: Double): Boolean;
function SelecaoValida(Indice, Quantidade: Integer; const Nome: string): Boolean;
function ResultadoValido(Valor: Double): Boolean;

implementation

function LerReal(Campo: TEdit; const Nome: string; out Valor: Double): Boolean;
begin
  Result := TentarNumero(Campo.Text, Valor);
  if not Result then
  begin
    ShowMessage('Informe um numero valido para ' + Nome + '.');
    Campo.SetFocus;
  end;
end;

function LerPositivo(Campo: TEdit; const Nome: string; out Valor: Double): Boolean;
begin
  Result := LerReal(Campo, Nome, Valor);
  if not Result then Exit;
  Result := Valor > 0;
  if not Result then
  begin
    ShowMessage(Nome + ' deve ser maior que zero.');
    Campo.SetFocus;
  end;
end;

function LerNaoNegativo(Campo: TEdit; const Nome: string; out Valor: Double): Boolean;
begin
  Result := LerReal(Campo, Nome, Valor);
  if not Result then Exit;
  Result := Valor >= 0;
  if not Result then
  begin
    ShowMessage(Nome + ' nao pode ser negativo.');
    Campo.SetFocus;
  end;
end;

function SelecaoValida(Indice, Quantidade: Integer; const Nome: string): Boolean;
begin
  Result := (Indice >= 0) and (Indice < Quantidade);
  if not Result then ShowMessage('Selecione ' + Nome + '.');
end;

function ResultadoValido(Valor: Double): Boolean;
begin
  Result := not (IsNan(Valor) or IsInfinite(Valor));
  if not Result then ShowMessage('O resultado excede o limite numerico do programa.');
end;

end.
