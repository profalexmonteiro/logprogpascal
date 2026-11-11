# Exemplo 02 — Área de um triângulo

Este programa calcula a área de um triângulo a partir da base e da altura.
Abra [exemplo02.lpi](exemplo02.lpi) no Lazarus e execute com **F9**.

## Como usar

1. Clique no botão de calcular área.
2. Informe a altura e depois a base, ambas maiores que zero.
3. Leia o resultado na mensagem apresentada. **Cancelar** encerra a entrada.

## O que estudar

A rotina `BitBtn1Click` em [exemplo2.pas](exemplo2.pas) ilustra entrada,
validação e processamento. A fórmula usada é:

```text
área = base × altura ÷ 2
```

O programa aceita ponto ou vírgula como separador decimal. Experimente base 10
e altura 4: a área deve ser 20.

## Para praticar

- Inverta a ordem dos pedidos de base e altura. O resultado muda?
- Tente informar zero, texto e um número decimal.
- Explique por que a área é dividida por dois.
