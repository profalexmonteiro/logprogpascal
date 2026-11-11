# Exercício 07 — Queda de pressão em grãos

O programa estima a queda de pressão com base no fluxo de ar, na altura da
massa de grãos e no tipo de grão selecionado. Abra
[exercicio07.lpi](exercicio07.lpi) no Lazarus e execute com **F9**.

## Como usar

1. Informe fluxo de ar e altura, ambos maiores que zero.
2. Selecione um dos tipos de grãos.
3. Clique em **Calcular** para ver a queda de pressão. Use **Limpar** para
   reiniciar ou **Sair** para fechar.

## O que estudar

Em [exercicio7.pas](exercicio7.pas), procure `bQuedaClick`. A estrutura
`case` seleciona os coeficientes correspondentes ao tipo de grão, que são
usados na fórmula do exercício. A saída não pode ser digitada diretamente.

Os coeficientes e o modelo matemático foram mantidos conforme o enunciado
original. Confira unidades e fórmula com o material da aula antes de interpretar
o resultado fora do contexto didático.

## Para praticar

- Calcule com o mesmo fluxo e altura para cada tipo de grão. Compare os valores.
- Tente calcular sem escolher um tipo de grão.
- Altere temporariamente um coeficiente e observe como isso afeta o resultado.
