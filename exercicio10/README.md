# Exercício 10 — Potência de ventilador

O projeto estima a potência do ventilador para secagem de grãos, usando vazão,
altura, diâmetro do silo, rendimento e tipo de grão. Abra
[exercicio010.lpi](exercicio010.lpi) no Lazarus e execute com **F9**.

## Como usar

1. Informe vazão, altura, diâmetro e rendimento com valores maiores que zero.
2. Digite o rendimento como fração entre zero e um: por exemplo, `0,8` para 80%.
3. Selecione o tipo de grão e clique em **Calcular**.
4. Leia a potência calculada no campo de resultado. **Sair** fecha o programa.

## O que estudar

Em [exercicio10.pas](exercicio10.pas), procure `bPonteciaClick`. Observe os
vetores de coeficientes e o índice escolhido pelo tipo de grão. A rotina
calcula a área, a vazão específica e a potência em etapas.

O modelo e a expressão geométrica foram mantidos do enunciado original.
Confira as unidades e os coeficientes com o material da aula antes de usar os
resultados fora do contexto didático.

## Para praticar

- Compare o resultado usando dois tipos de grão e mantendo as demais entradas.
- Tente rendimento zero e maior que um; ambos devem ser recusados.
- Identifique no código qual elemento dos vetores é usado para cada tipo.
