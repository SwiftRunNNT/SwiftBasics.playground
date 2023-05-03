/*:
 
 # Enumerations
 
 Um Enumeration define um tipo para um grupo de valores associados, permitindo trabalhar com eles de uma maneira type-safe dentro do seu código.
 
 Enumerations são tipos de primeira classe, ou seja:
 * Podem ser retorno de funções
 * Podem ser passados como paramêtros em funções
 * Podem ser construídos em tempo de execução
 
 Além de adotar funcionalidades tradicionalmente suportadas apenas por classes, tais quais:
 * Inits
 * Funções de instância e estáticas
 * Podem ser extendidos
 * Assinar protocolos
 * Possuír variavéis computadas
 
 
 ### Sintaxe
 */



/*:
 > **Prática:**
 > Vamos declarar um enumeration de pontos cardeais.
 */




/*:
 Cada enumeration define um novo tipo, e como outros tipos em Swift seus nomes devem começar com uma letra maiúscula.
 
 > **Prática:** Vamos agora atribuir a uma variável *direction* um *Cardinal*.
 */




/*:
 ### Switch e Enums
 Enums podem ser usados com Switches de maneira muito simples.
 
 > Um switch deve ser exaustivo quando utilizado enums, quando não for apropriado um caso para cada enum, você pode utilizar o *default*
 
 > **Prática:** Vamos criar um switch que imprima uma String de acordo com a checagem de um tipo *Cardinal*.
 */



/*:
 > Podemos também como comentado, atribuir variavéis computadas aos nossos Enums, falaremos um pouco mais sobre elas na próxima seção
 */




/*:
 ### Iterando entre cases de Enumeration
 
 Para alguns enums, é interessante que tenhamos uma coleção com todos os possiveis casos, para isso, tudo que você precisa fazer é assinar o protocolo `CaseIterable`.

 Para assinar um protocolo é necessário apenas que você adicione `: NomeDoProtocolo` após a declação do seu enum. (Iremos explorar protocolos mais a frente)
 
 > **Prática:**
 > Declare um Enum que assine o protocolo e use a propriedade `allCases` para iterar sob seus casos.
 */




/*:
 ### Associated Values
 No **Swift** Enumerations podem associar valores de qualquer tipo a seus cases.
 Isso permite:
 * Armazenar informações adicionais ao case
 * Informações variadas a cada uso dentro do código
 * Associar tipos diferentes para cada case
 
 Exemplo:

 ![Barcode](Barcode.png)
 ![QRCode](qrcode.png)
 */



/*:
 ### Raw Values
 
 Permite valores padrões para os cases de um enumeration.
 
 > Raw Values são sempre do mesmo tipo
 */



/*:
 > Atribuição implícita
 Você pode também incializar um enum através de seu `RawValue`
 */



//: [Classes e Structs](@next)
