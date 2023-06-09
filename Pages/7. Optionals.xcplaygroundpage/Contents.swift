/*:
 [Funções](@previous)
 
 # Optionals
 
 Diferente de outras linguagens **Swift** possui uma estrutura específica para trabalhar com a ausência de valores. **Optionals**, são usados para indicar que existe a possibilidade de certo valor estar ausente e que este caso deve ser tratado corretamente pelo desenvolvedor. Valores opcionais são identificados adicionando `?` após o tipo da variável.
 
 > **Prática:**
 > Imprima um número Inteiro criado a partir da conversão de uma String.
 */




/*:
 ### nil
 
 Usamos a palavra reservada `nil` para indicar que um objeto não possui nenhum valor associado. Vale ressaltar que só é possível atribuir `nil` a uma variável se esta for um **Optional**. No momento de sua declaração, variáveis opcionais que não possuem uma valor, terão o valor `nil` atribuído por padrão.
 
 ### Unwrapping
 Se pensarmos em **Optionals** como um container que pode conter ou não o valor desejado, então precisamos de uma forma para verificar e obter o valor que esse container possui. Para acessar o valor que está contido em um **Optional** basta adicionarmos `!` ao final da variável que estamos acessando.
 
 > **Prática:**
 > Acessar e imprimir o valor que está contido na variável criada na prática anteior.
 */





/*:
 A técnica acima é denominada de **Forced-Unwrapping** e serve para extrair valores de variáveis opcionais. Apesar de ser uma maneira prática de obter o valor desejado, se tentarmos realizar o **Forced-Unwrapping** em uma variável que não contenha nenhum valor em nossa aplicação isso irá resultar em um erro em tempo de execução. Uma maneira mais segura de acessar valore opcionais é primeiramente verificando se essa variável é diferente de `nil` e em seguida acessar o valor guardado.
 
 ````
 if possivelInteiro != nil {
 
 print(possivelInteiro!)
 
 }
 ````
 
 ### if-let
 Para evitar todo o trabalho citado acima, **Swift** oferece a construção `if-let` que realiza o **Unwrap** se a variável opcional contém algum valor associado.
 
 > **Prática:**
 > Use a contrução `if-let` para verificar se a variável declara anteriormente possui um valor.
 */






/*:
 ### if-let com validação
 Usando essa mesma construção podemos adicionar testes booleanos com a cláusula `,` para selecionar os casos em que o trecho de código dentro do `if` será executado.
 
 > **Prática:**
 > Use a contrução `if-let ,` para verificar se a variável declara anteriormente é par ou ímpar.
 */







/*:
 ### guard
 As variáveis que são criadas nas contruções `if-let` são apenas válidas no escopo do `if-let` que foram declaradas. Muitas vezes é desejável que o escopo de uma variável "retirada" de um Optional vá além do `if-let`, para isso podemos contar com a construção `guard`. As contruções `guard` seguem o padrão abaixo - Um teste booleano ou **Unwrap** deve ser feito e em casos positivos o código que vem após o `guard` é executado, caso contrário o trecho de código dentro do `guard` é executado e logo em seguida deve sair escopo atual.
 
 ````
 guard let inteiro = possivelInteiro else {
 
 return
 
 }
 
 print("O valor obtido é \(inteiro)")
 ````
 
 > **Prática:**
 > Imprima um número Decimal criado a partir da conversão de uma String, usando a construção `guard`
 */






/*:
 ### Implicitly Unwrapped Optionals
 
 Também é possível identificar valores opcionais adicionando `!` após o tipo da variável. Essa notação permite que variáveis opcionais sejam acessadas sem a necessidade de seram "desempacotadas", essa abordagem é mais simples que as anteriores, mas não é recomendada pois acessar variáveis opcionais que não contenham valor resultará em um erro em tempo de execução.
 
 > É um prática comum declarar IBOutlet's como **Implicitly Unwrapped Optionals**
 
 > **Prática:**
 > Declara uma variável opcional usando a notação de **Implicitly Unwrapped Optionals**.
 */






/*:
 ### Valor padrão
 
 É possível informar qual o valor padrão deve ser utilizado no lugar daquele optional
 
 > Para informar o valor padrão se utiliza a notação ?? **
 
 > **Prática:**
 > Declare e print um optional utilizando o valor padrão**.
 */




//: [Enumerations](@next)
