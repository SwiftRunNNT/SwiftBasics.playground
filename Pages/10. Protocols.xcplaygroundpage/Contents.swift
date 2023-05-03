
/*:
 [Classes e Structs](@previous)
 
 # Protocolos
 
 Definem um conjunto de métodos, propriedades e inicializadores
 
 * Podem ser adotados por classes, structs e enums
 * Quando tipo adota um protocolo é dito que está em conformidade com o protocolo
 
 > Para adotar um protocolo basta que você utilize a mesma notação da herança, após o nome do seu tipo `: NomeDoProtocolo`, ao contrário de classes, um tipo pode adicionar múltiplos protocolos.

 > Para definir um protocolo, utilize a palavra reservada `protocol` seguida do nome e então abra chaves para definir metódos e propriedades

 Exemplo:
 */



/*:
 ### Propriedades
 
 * Um protocolo pode requerer que os tipos que o adotam provenham propriedades de instância e de tipo.
 * Não se especifica se uma propriedade é armazenada ou computada
 * Apenas é especificado nome e tipo
 * Também especifica-se os acessos a propriedade (`{get}`, `{get set}`

 Exemplo:
 */



/*:
 ### Métodos
 * Protocolos podem especificar métodos de instância e de tipo
 * Não é permitido definir valores padrão para parâmetros de métodos especificados em protocolos.
 
 > Protocolos podem especificar um inicializador para classes.
 > Sempre devemos marcar a implementação do iniciador com required.
 */



/*:
 ### Associated Types
 * São placeholders para tipos usados nas definições do protocolo;
 * O tipo só será definido quando o protocolo for adotado;
 * São definidos usando a palavra chave associatedtype;
 > 
 */



/*:
#### Prática:
 Imagine um ambiente de trabalho onde temos diferentes tipos de funcionários, mas todos eles possuem algumas caracteristicas obrigatórias, `nome`, `data de nascimento`, `departamento` e para controle da empresa é necessário existir um metódo que imprima esses dados de forma organizada.

 Os funcionários também possuem um `salário bruto` e uma maneira de calcular `encargos` desse salário.

 Divida esses dois tipos de dados em protocolos diferentes e crie algus tipos de funcionários que utilizam ambos os protocolos.

 Esses funcionários podem também pegar emprestados alguns itens, que são tipos diferentes de structs, e pra cada um desses tipos que ele pode pegar emprestado eles tem um `armario digital` que deve ser capaz de armazenar os itens em um array, gerar uma lista de todos os itens.

 Podemos por exemplo ter `eletronicos`, `livros`, etc. Use `associated types` para definir um protocolo para esse "armário"
 */



//: [Extensions](@next)
