/*:
 [Operadores Básicos](@previous)
 
 # Estruturas Condicionais
 
 Em alguns casos é ideal que um certo trecho de código seja executado apenas se alguma condição for satisfeita. Para esses casos **Swift** oferece duas estruturas condicionais básicas: `if` e `switch`.
 
 
 # If
 
 Na sua forma mais simples o `if` checa se uma condição é verdadeira e executa um trecho de código em seguida.
 
 > **Prática:**
 > Criar uma variável que armazena a temperatura atual em Fortaleza e em seguida exibe uma mensagem se a temperatura for maior que 30 graus.
 */




/*:
 ### else
 Também é possível oferecer um conjunto de alternativos de condições usando as contruções `else` e `else if`.
 
 > **Prática:**
 > Adicionar uma condição que verifica se a temperatura está entre 20 e 30 graus, uma condição `else` e por fim exibir uma mensagem apropriada para cada condição.
 
 > **Bônus:**
 > Pesquisar como verificar se a temperatura está entre 20 e 30 graus usando Intervalos.
 */





/*:
 ### Operadoes ternários.
 Para uma verificação simples que retornam algum valor *Swift* oferece os operadores ternários. Sua contrução obedece o seguinte padrão: *<checagem> ? <retorno-verdadeiro> : <retorno-falso>*
 
 > **Prática:**
 > Usar o operador ternário para verificar se a temperatura em Fortaleza está abaixo de 10 graus e exibir a mensagem apropriada.
 */



/*:
 # Switch
 `switch` são usados para comparar uma variável a um conjunto possível de padrões.
 
 > Um `switch` deve conter todas as possibilidades de valores para a variável que está sendo avaliada.
 
 > **Prática:**
 > Vamos criar um `switch` para verificar a nossa temperatura e exibir uma mensagem apropriada.
 */




/*:
 ### Range
 Além de valores simples é possível usar `switch` para verificar se um determinado valor está contido em um intervalo.
 
 > **Prática:**
 > Ao invés de checar os valores um por um da temperatura, vamos tentar definir mensagens para intervalos especificos de temperatura.
 */



/*:
 ### Tuplas
 Também é possível avaliar *tuplas* de valores em um `switch`.
 
 > **Prática:**
 > Para um ponto (x, y) representado por uma tupla, verificar se esse ponto está na origem, no eixo-x, no eixo-y e o quadrante que o ponto está contido.
 
 ![](coordinateGraphSimple.png)
 */




//: [Coleções](@next)
