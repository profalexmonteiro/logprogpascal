# Exercício 08 — Crescimento populacional

Este projeto simula o crescimento anual de duas populações e calcula quantos
anos são necessários para A ficar maior que B. Abra
[exercicio08.lpi](exercicio08.lpi) no Lazarus e execute com **F9**.

## Como usar

1. Informe as populações iniciais de A e B, ambas maiores que zero.
2. Informe as taxas anuais de crescimento em porcentagem; uma taxa pode ser zero.
3. Clique em **Calcular** para ver o tempo e as populações finais.
4. Use **Limpar** para zerar os campos ou **Sair** para fechar.

Se A já começa maior que B, o tempo apresentado é zero. Se A não puder
ultrapassar B com as taxas informadas, ou a simulação ultrapassar os limites do
programa, uma mensagem explica o problema.

## O que estudar

Em [exercicio8.pas](exercicio8.pas), procure `Button1Click` e acompanhe a
chamada a `SimularPopulacao`, implementada na unidade compartilhada
[Calculos](../comum/calculos.pas). Observe como cada taxa percentual é
transformada em um fator anual.

## Para praticar

- Comece com populações iguais e taxas diferentes.
- Teste taxas iguais com A inicialmente menor que B.
- Teste `0` como taxa e explique o que acontece com a população correspondente.
