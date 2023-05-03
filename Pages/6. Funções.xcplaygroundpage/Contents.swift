/*:
 [Controle de Fluxo](@previous)
 
 # Funções
 
 Funções são conjuntos de código auto-contidos que realizam uma determinada tarefa. Funções são identificadas por um nome, que deve explicitar o seu propósito. É possível "chamar" as funções definidas por seu nome, para que realizem sua tarefa quando for necessário.
 
 > ![](Functions.png)
 
 > **Prática:**
 > Declare uma função chamada de `sayHello` que irá receber um parâmetro `name` do tipo `String` e irá retornar uma saudação com o nome recebido.
 */



/*:
 Para declararmos funções com mais de um parâmetro, basta separarmos os parâmetros por virgulas.
 
 > **Prática:**
 > Adicione um novo parâmetro a declaração da função `sayHello` e modifique o retorno da função de acordo com esse parâmetro.
 */







/*:
 > **Prática:**
 > Declare uma função chamada de `sum` que irá receber 2 números inteiros e irá retornar a soma dos 2 valores.
 
 */





/*:
 ### Tipos de retornos
 
 Funções podem retornar qualquer um dos tipos de dados citados nas lições anteriores, entre eles estão: Tuplas, Intervalos (Range), Enumerados e estruturas definidas pelo programador.
 
 ### Parâmetros nomeados
 
 Assim como é Objective-C, parâmetros em Swift são nomeados. Cada parâmetro em uma função possui um **nome externo** que é usado por quem chama a função e um **nome interno** que é usado internamente na implementação da função.
 
 > Nomes externos podem ser omitidos usando um _. Caso nenhum **nome externo** seja especificado o **nome interno** será utilizado também no uso da função.
 
 > **Prática:**
 > Vamos criar um função chamada `sayHi(to:and:)` que irá imprimir uma saudação para os nomes recebidos.
 */





/*:
 
 > **Prática:**
 > Vamos criar um função chamada `greet(_:)` que irá imprimir uma saudação para o nome recebido, porém ela não deve conter nome externo.
 */





/*:
 ### Parâmetros In-Out
 
 Por padrão os valores dos parâmetros em funções são cópias imutáveis dos valores originais que foram recebidos. Ocorrendo um erro em tempo de compilação se tentarmos muda-los, mas em alguns casos é desejável que as alterações feitas dentro de uma função sejam propagadas além da sua execução e isso é possível anotando nossos parâmetros como `inout`.
 
 > Parâmetros `inout` não são passados por referência, na verdade em Swift é usado um modelo copy-in copy-out, onde os valores alterados dentro da função são copiados de volta a variável original.
 
 > **Prática:**
 > Declare uma função que receba dois números `inout` e faça a troca de seus valores, em seguida verificar se seus valores foram trocados.
 */






/*:
 # Tipos de funções
 
 Diferente de outras linguagens, na **Swift** funções possuem um tipo que é composto pelo tipos dos seus parâmetros e o tipo do seu retorno. Dessa forma é possível passar funções como parâmetro para outras funções, retornar funções a partir de outras funções e atribuir funções para outras variáveis.
 
 Para a função `sayHello` podemos expressar o seu tipo com a seguinte notação.
 ````
 (String) -> (String)
 ````
 Para a função `sayHello(_:alreadyGreeted:)` podemos expressar o seu tipo com a seguinte notação.
 ````
 (String, Bool) -> (String)
 ````
 
 > **Prática:**
 > Para cada função declarada anteiormente criar uma variável compatível com o tipo da função.
 */





/*:
 # Closures
 
 Agora que entendemos como expressar funções como tipo e atribuir funções à variáveis podemos passar e retornar funções a partir de outras funções. Esse tipo de comportamento recebe a denominação de **closures**. Closures são blocos de códigos auto-contidos que podem ser usados durante a execução da sua aplicação e uma de suas principais caracteristicas é a habilidade de capturar e referenciar variáveis no contexto em que foram definidas.
 
 ### map, filter & reduce
 
 Para entendermos melhor como **closures** funcionam vamos aplicá-las em um contexto funcional usando as funções `map`, `filter` e `reduce`.
 
 ### map
 Muitas vezes é necessário realizar transformação de valores em Arrays e geralmente realizamos essa tarefa iterando nossa coleção e armazenando as transformações em um Array auxiliar. Com a função `map` podemos realizar essas mesmas transformações de forma mais segura e menos verbosa.
 
 > **Prática:**
 > Declare um Array de Inteiros e aplique uma transformação usando `map` que retorne um Array que contenha cada valor ao quadrado.
 */





/*:
 ### filter
 Outra operação bastante comum é criar um novo Array a partir de elementos que atendam a uma certa condição. Para isso temos a função `filter` que recebe como parâmetro uma função que retorna um booleano indicando se o valor avaliado deve ser incluido no Array resultante.
 
 > **Prática:**
 > Filtrar os números pares do Array de Inteiros criado anteriormente.
 */







/*:
 ### reduce
 Por fim temos `reduce`, essa função é usada para combinar os elementos de um Array em um novo valor. Começamos com fornecendo um valor inicial e uma função que irá combinar os valores subsequentes.
 
 > **Prática:**
 > Realizar a soma dos Inteiros do Array declarado anteriormente.
 */






/*:
 > **Prática:**
 > Implemente a função filter do zero.
 */




//: [Optionals](@next)

