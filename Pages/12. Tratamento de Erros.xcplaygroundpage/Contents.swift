import Foundation
/*:
 [Extensions](@previous)
 # Tratamento de Erros

 Em Swift, erros são representados por valores em que o tipo estão conformes com protocolo Error. Esse protocolo indica que um tipo pode ser usado para tratamento de erros.

 Enums são a melhor estrutura para modelar um grupo de erros semelhantes, ou relacionados a uma mesma operação, com valores associados que fornecem uma informação adicional sobre a natureza do erro comunicado. Por exemplo, podemos representar as condições de erro de uma maquina de vendas.
*/



/*:
 Lançar (em inglês, throw) um erro permite que o programa indique que algo inesperado aconteceu e que o fluxo normal foi interrompido. O termo "throw" é usado em Swift para lançar um erro. Por exemplo, o seguinte código lança um erro para indicar que é necessário inserir 5 moedas na maquina de vendas:
*/



/*:
 ## Propagando erros usando Throwing Functions.
 
 Para indicar que uma função, método ou inicializador pode lançar um erro, é necessário escrever a palavra reservada "throw" na declaração da função depois dos seus parâmetros. Uma função marcada com a palavra "throws" é chamada Throwing Function. Se a função especifica um tipo de retorno, escreve-se "throws" antes da seta de retorno (->).
 
    func capazDeLancarErros() throws -> String
    func incapazDeLancarErros() -> String
 
 Uma throwing function propaga os erros que são lançados dentro de seu escopo para o escopo acima (escopo em que a throwing function foi chamada).
 Somente throwing functions podem propagar erros. Quaisquer erros que forem lançados dentro de uma função que não tem a palavra "throws" na sua declaração deve ser tratado dentro do escopo da própria função.
 
 No exemplo abaixo, a classe VendingMachine tem um método vend(itemNamed:) que lança o VendingMachineError para cada caso de erro especificado.
*/



/*:
 A implementação da função vend(itemNamed:) usa o termo guard para sair do escopo do método e lançar os erros caso a caso.
 
Porque a função sell(itemNamed:) propaga qualquer erro que lançar, qualquer código que chama esse método deve obrigatoriamente tratar o erro lançado, seja com do-catch, try? ou try!, ou continuar propagando o erro lançado. Por exemplo, a função abaixo buyFavoriteSnack(person:vendingMachine:) lança erros, e qualquer erro que a função sell(itemNamed:) lançar vai propagar para o escopo em que a função buyFavoriteSnack(person:vendingMachine:) é chamada.
*/



/*:
 Nesse exemplo, a função buyFavoriteSnack(person: vendingMachine:) busca pelo item favorito da pessoa especificada nos parametros, e tenta compra-lo chamando a função vend(itemNamed:),que também lança erros. Já que a função sell(itemNamed:) é uma throwing function, ela deve ser chamada com a palavra reservada try antes dela.
 
 Throwing initializers podem propagar erros da mesma maneira que throwing functions. Por exemplo, o inicializador para o struct PurchasedSnack na lista abaixo chama uma throwing function como parte de sua inicialização, e trata qualquer erro que for lançado propagando esse erro para o escopo que chamou o seu initializer.
*/



/*:
 ## Tratando Erros usando Do-Catch
 
 No exemplo abaixo, a função buyFavoriteSnack(person:vendingMachine:) é chamada com a expressão "try" porque a função pode lançar um erro. Se um erro for lançado, a execução do código imediatamente entra no escopo do "catch" com o erro específico como parametro.
*/



/*:
 ## Desacoplando o tratamento de erros
 
 O catch não precisa necessariamente tratar todos os erros possíveis em um lugar só. Se algum erro não for tratado, ele será propagado para o escopo acima dele. Nesse caso, o escopo acima é obrigado a tratar o erro que foi lançado.
*/



/*:
 ## Tratando todos os casos de erro da mesma maneira
*/



/*:
 ## Desabilitando propagação de erros
*/



/*:
## Especificando Cleanup Actions

A palavra reservada "defer"
É possível definir que algumas linhas de código devem ser obrigatoriamente executadas exatamente antes de um erro ser lançado dentro de uma função usando a palavra reservada "defer". Assim, é possível fazer qualquer cleanup ou ação necessária indenpendentemente de um erro ser lançado ou não. Por exemplo, você pode usar o defer com um código que fecha um arquivo caso haja algum erro durante a sua edição.

Ações definidas dentro do escopo do defer não devem conter break, return, continue, ou throw. Além disso, são executadas em ordem inversa, ou seja, de cima pra baixo. A última linha de código executa primeiro, depois a penúltima, e assim por diante até chegar na primeira linha de código do defer.
*/



/*:
 # Exemplo da Máquina de Café

 ## Enum que define tipos de erro possíveis
*/



/*:
 ## Enum que representa os tipos de cafés, estoque, e preço.
 Feito com fins didáticos. Na prática isso não faz sentido. Normalmente esse tipo de info vem de um servidor e fica persistida no App com CoreData ou FileManager.
*/



/*:
 ## Função comprar café
 
 Essa função é do tipo _Throwing Function_ que pode lançar erros especificados em algum enum. No nosso caso, erros descritos no enum CoffeeMachineError.
 
 Entrada:
 - coffee: tipo de café que se deseja comprar
 - coins: dinheiro inserido na maquina
*/



/*:
 ## Chamada da Função e Tratamento de Erros em Swift
 
 A chamada de uma _Throwing Function_ sempre requer a palavra reservada _try_ antes dela.
 
 Caso a função _Throwing Function_ execute sem erros, o código entra no escopo da palavra reservada _do_ e executa todos os comandos descritos nele. Caso ocorra algum erro, a execução da _Throwing Function_ é interrompida e desviada para o escopo do _catch_, executando os códigos escritos dentro do catch.
*/



/*:
 É possível fazer várias chamadas a _Throwing Functions_ usando _try_ dentro de um mesmo _do-catch_
 
 Nesse caso, o primeiro erro que for lançado desviará a execução para dentro do _catch_, independentemente de em qual função ele ocorrer. A execução dos _try_ anteriores ao que lançou erro não é afetada.
 */


//: [Generics](@next)
