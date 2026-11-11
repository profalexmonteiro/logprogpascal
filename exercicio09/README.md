# Exercício 09 — Crescimento populacional em gráfico

Este projeto amplia o exercício de crescimento populacional ao desenhar as duas
populações em um gráfico. Abra [exercicio09.lpi](exercicio09.lpi) no Lazarus e
execute com **F9**. O projeto requer o pacote Lazarus **TAChartLazarusPkg**.

## Como usar

1. Informe populações iniciais positivas e taxas anuais não negativas.
2. Clique em **Calcular** para ver o tempo até A ultrapassar B e as curvas no
   gráfico.
3. Use **Limpar** para apagar valores e séries; **Sair** fecha o programa.

## O que estudar

Em [exercicio9.pas](exercicio9.pas), procure `bCalcularClick`. Além de chamar a
rotina compartilhada `SimularPopulacao`, o programa adiciona pontos às duas
séries do gráfico. Compare o resultado com o
[exercício 08](../exercicio08/README.md).

## Para praticar

- Faça dois cálculos seguidos. As linhas anteriores são apagadas?
- Limpe os dados e verifique se as séries também desaparecem.
- Compare o ponto em que A ultrapassa B com o tempo calculado.
- Tente um caso em que A já começa maior que B.
