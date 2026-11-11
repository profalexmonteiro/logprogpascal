# Curso de lógica de programação com Pascal

Este repositório reúne exemplos e exercícios usados em aulas de lógica de
programação. Os programas são aplicações de janela feitas com **Free Pascal** e
**Lazarus (LCL)**. Cada pasta contém um projeto independente que pode ser aberto,
executado e estudado sem precisar criar um projeto do zero.

> **Sugestão para quem está começando:** avance na ordem do roteiro, execute cada
> programa, teste entradas diferentes e acompanhe no código de onde vêm os dados,
> como são calculados e onde o resultado aparece.

## Preparar o ambiente e executar

1. Instale o Lazarus, incluindo o compilador Free Pascal e a biblioteca LCL.
   Os projetos foram criados com Lazarus 2.0.12; outras versões podem exigir
   ajustes.
2. Abra no Lazarus o arquivo `.lpi` indicado na tabela abaixo.
3. Execute com **F9**. Para testar, use valores válidos e inválidos, observe as
   mensagens e experimente os botões de limpar e sair.
4. O exercício 09 usa o pacote **TAChartLazarusPkg** para desenhar o gráfico.

Também é possível compilar pela linha de comando quando `lazbuild` estiver no
PATH:

```powershell
lazbuild exercicio01/exemplo04.lpi
```

Mantenha a pasta `comum/` na raiz do repositório. Os projetos a utilizam por meio
dos caminhos de busca já configurados.

## Roteiro de aprendizagem

| Etapa | Guia do projeto | Projeto para abrir | O que praticar |
| --- | --- | --- | --- |
| 1 | [exemplo02](exemplo02/README.md) | [exemplo02.lpi](exemplo02/exemplo02.lpi) | Entrada, variáveis reais, fórmula e saída: área de um triângulo |
| 2 | [exemplo03](exemplo03/README.md) | [exemplo03.lpi](exemplo03/exemplo03.lpi) | Números inteiros, validação e subtração: diferença entre anos |
| 3 | [exercicio01](exercicio01/README.md) | [exemplo04.lpi](exercicio01/exemplo04.lpi) | Fórmulas, conversão e eventos de botões: Celsius e Fahrenheit |
| 4 | [exercicio02](exercicio02/README.md) | [exemplo05.lpi](exercicio02/exemplo05.lpi) | Condições `if`, operadores lógicos e classificação de triângulos |
| 5 | [exercicio04](exercicio04/README.md) | [exercicio04.lpi](exercicio04/exercicio04.lpi) | Menu, procedimentos de evento e histórico de conversões |
| 6 | [exercicio05](exercicio05/README.md) | [exemplo06.lpi](exercicio05/exemplo06.lpi) | Decisões encadeadas, seleção e cálculo do IMC |
| 7 | [exercicio06](exercicio06/README.md) | [exercicio06.lpi](exercicio06/exercicio06.lpi) | Repetição `while`, sentinela, contador e média |
| 8 | [exercicio07](exercicio07/README.md) | [exercicio07.lpi](exercicio07/exercicio07.lpi) | Seleção `case` e aplicação de uma fórmula por tipo de grão |
| 9 | [exercicio08](exercicio08/README.md) | [exercicio08.lpi](exercicio08/exercicio08.lpi) | Simulação repetida, percentuais e condição de parada |
| 10 | [exercicio09](exercicio09/README.md) | [exercicio09.lpi](exercicio09/exercicio09.lpi) | Reutilização da simulação e apresentação dos dados em gráfico |
| 11 | [exercicio10](exercicio10/README.md) | [exercicio010.lpi](exercicio10/exercicio010.lpi) | Vetores, seleção por índice e composição de cálculos |

A numeração foi mantida como nos materiais originais: não há pastas
`exemplo01` ou `exercicio03`. Os nomes dos arquivos `.lpi` também podem diferir
do nome da pasta; use exatamente o caminho informado.

### Como ler um projeto Lazarus

- **`.lpi`**: configuração do projeto e caminhos das unidades.
- **`.lpr`**: ponto de entrada; inicializa a aplicação e abre o formulário.
- **`.pas`**: código Object Pascal. Procure a rotina associada ao botão ou menu
  para acompanhar o algoritmo.
- **`.lfm`**: descrição visual do formulário, seus campos, botões e ligações de
  eventos. No Lazarus, pode ser aberto pelo designer visual.

Nos exemplos de janela, um clique chama uma rotina como
`TForm1.Button1Click`. Dentro dela, procure o fluxo **entrada → processamento
→ saída**: ler os campos, validar e converter os valores, calcular e então
mostrar o resultado. O código de uma unidade costuma separar as declarações
(`interface`) da implementação (`implementation`).

A pasta [comum](comum) contém rotinas compartilhadas. `Entradas` ajuda a validar
valores e seleções na interface; `Calculos` centraliza a leitura de números e a
simulação de crescimento populacional. Leia essas rotinas quando quiser entender
como um comportamento é reaproveitado em mais de um exercício.

### Exercícios para praticar

Depois de executar cada programa, tente fazer uma pequena alteração e confira o
resultado:

- Na área do triângulo, troque a ordem dos cálculos e explique por que a área não
  muda.
- Na conversão de temperatura, converta um valor conhecido nos dois sentidos e
  confira se retorna ao valor inicial (considerando arredondamentos).
- Na classificação de triângulos, teste três lados iguais, dois iguais, três
  diferentes e valores que não podem formar um triângulo.
- Na média, informe várias notas, encerre com `-1` e confira a média; repita sem
  informar nenhuma nota.
- Na população, teste taxas iguais e populações iniciais em que A já é maior que B.
  Compare depois a tabela de resultados com o gráfico do exercício seguinte.
- Nos exercícios de grãos, localize os coeficientes no código e confira as
  unidades e fórmulas com o enunciado usado em aula antes de alterar os valores.

## Comportamentos importantes

- Campos numéricos aceitam ponto ou vírgula decimal, mas não separadores de
  milhares. Campos vazios, texto, `NaN` e infinito são rejeitados.
- Medidas e populações que entram em fórmulas específicas precisam ser positivas;
  taxas de crescimento podem ser zero, mas não negativas.
- No exercício 06, `-1` ou **Cancelar** encerra a coleta. As notas já informadas
  são preservadas; outras notas negativas são rejeitadas. Sem notas, quantidade
  e média são zero.
- Nos exercícios 08 e 09, a simulação procura o primeiro ano em que A fica maior
  que B. Se A já começa maior, o resultado é zero anos. Casos sem ultrapassagem,
  estouro numérico ou acima de 10.000 anos são informados.
- No exercício 10, rendimento é uma fração entre zero e um: `0,8` significa 80%.
- O exercício 05 mantém as faixas de IMC do material original para fins didáticos;
  elas não devem ser usadas como orientação médica.
- Os exercícios 07 e 10 mantêm os modelos e coeficientes fornecidos nos
  enunciados. Há uma diferença no coeficiente do arroz (`0.722` no exercício 07
  e `0.772` no exercício 10), e o exercício 10 conserva sua expressão geométrica
  original. Confira o enunciado antes de usar esses modelos fora da aula.

## Verificar os projetos

Com Python instalado, valide referências entre projetos, formulários, eventos e
links de documentação:

```powershell
python tests/verificar_estrutura.py
```

Os testes numéricos e de crescimento populacional podem ser executados sem
Lazarus, desde que o compilador `fpc` esteja no PATH:

```powershell
New-Item -ItemType Directory -Force tests/bin | Out-Null
fpc -B -Fucomum -FUtests/bin -FEtests/bin tests/regressao.pas
./tests/bin/regressao.exe
```

Para validar a interface, abra os projetos no Lazarus e teste entradas vazias,
texto, zero, cancelamento e ausência de seleção de grão ou sexo. No exercício 09,
faça mais de um cálculo, limpe o formulário e confira as séries do gráfico,
inclusive o ano da ultrapassagem.

Arquivos temporários de compilação em `lib/`, backups e sessões `.lps` não fazem
parte do material versionado. Os arquivos `.res`, ícones e formulários necessários
para abrir os projetos são mantidos.
