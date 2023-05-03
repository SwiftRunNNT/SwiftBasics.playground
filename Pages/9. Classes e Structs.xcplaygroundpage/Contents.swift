/*:
 [Enumerations](@previous)
 
 # Classes e Structs
 
 Classes e Structs são estruturas flexíveis que são parte essencial do código de nossos programas, você pode definir propriedades e métodos que adicionam funcionalidades as suas classes e estruturas.
 
 Na **Swift** não há necessidade de criar arquivos de interface e implementação separados, classes e structs são definidas em um único arquivo.
 
 ### Coisas em comum:
 
 * Definem propriedades
 * Definem métodos
 * Definem construtores
 * Podem ser extendidos para expandir funcionalidades
 * Podem assinar protocolos
 
 ### Diferencial de Classes:
 * Herança
 * Deinitializers permitem que instancias liberem recursos ao serem removidas
 * Type Casting permite que você avalie e interprete o tipo de uma instância de classe em tempo de execução
 * Mais de uma referência para a instância de uma classe

 Para definir uma classe ou struct, basta usar a palavra reservada `class` ou `struct` seguida de { para abrir o escopo de definição e } para fechar.
 
 > Structs são **Value Types** e são passados por cópia, enquanto classes são ** Reference Types ** e são passado por referência, o que significa que structs não aumentam contador de referência (ARC).

 > Prática: Defina uma classe e uma struct de algum objeto comum no seu dia a dia.
 */




/*:
 > Structs possuem inicializadores auto-gerados com todas as propriedades
 */

/*:
 > Prática: Atribua uma nova instância da sua struct a uma váriavel e faça o mesmo com a classe
 */


/*:
 > **Quando usar structs:**
 * Quando queremos encapsular dados relativamente simples
 * Quando Propriedades do modelo também são **Value Types**
 * Quando o modelo não precisa herdar nenhuma propriedade ou comportamentos de modelos existentes ( Pode ser alcançado através de protocolos também )
 * Quando os dados encapsulados devem ser copiados e não referenciados
 */




/*:
 ## Propriedades
 ### Stored Properties
 Uma constante ou variável que é parte de um instância de classe ou struct

 > Prática: adicione a classe e a struct que você criou caracteristicas do objeto real
 */


/*:
 ### Refêrencia vs Valor

 Em **Swift** Classes e Closures são Reference Types, todo o resto é Value Type
 > Prática: Crie uma váriavel atribua como valor, a váriavel que você instanciou a struct da prática acima, agora mude uma das propriedades dessa nova váriavel. Use a função `print` para analisar tanto a váriavel antiga como a nova. Faça o mesmo com a classe. Consegue perceber a diferença?
 */



/*
Isso acontece pois no caso a struct é um Value type o que quer dizer que ela é passada por cópia, quando atribuimos por exemplo a nossa váriavel que é uma struct para uma nova váriavel, o compilador realiza uma cópia fazendo com que caso você modifique qualquer uma das duas váriaveis, essa modificação não reflita na outra.
 Já classes são reference type, o que significa que independente de quantas váriaveis seja feitas com aquela instância inicial, todas irão apontar para o mesmo espaço de memória, logo quando ocorrer uma modificação, a mesma irá ser refletida em todos os locais que estiverem apontando pra ela.

 > Nem sempre o compilador vai de fato copiar o valor de uma struct, Collections por exemplo utilizam um mecanismo chamado Copy-on-write por motivos de otimização.
 */



/*:
 ### Lazy Stored Properties
 
 * É uma propriedade a qual seu valor só é calculado quando é usada a primeira vez
 * Usada onde valores iniciais dependem de fatores externos
 * Usada quando existe uma inicialização custosa ou complexa
 
 A palavra chave é `lazy`
 > Exemplo:
 */



/*:
 ### Computed Stored Properties
 
 * Não armazenam um valor propriamente dito
 * Provêm um getter e um setter que é opcional
 > Exemplo:
 */



/*:
 ### Read Only Computed Stored Properties
 
 * Computada apenas com o get
 > Exemplo:
 */



/*:
 ### Property Observers
 
 * Respondem a mudanças no valor de uma propriedade
 * São chamados sempre que o valor é atribuído, mesmo quando não difere do atual
 * Pode-se adicionar observers para propriedades herdadas
 * Podemos usar os observers willSet e didSet
 
 > Exemplo:
 */





/*:
 ## Métodos
 
 * Funções associadas a classes, structs ou enums

 Existem dois tipos de função:
 * A de instância que para ser usada é necessário que a classe ou a struct que a possuí seja instanciada.
 * A de tipo, onde não é necessário instanciar o tipo para usar e usam a palavra reservada `static` antes de sua declaração.
 > Prática: Declare uma struct ou uma classes chamada Employee, nela escreva uma função de instância que calcula o salário do funcionário e uma de tipo que retorna o imposto de acordo com um valor salarial passado via parâmetro.
 */






/*:
 ### Mutating
 Lembra que mais acima falamos sobre value type e reference type? Pois bem, value types não podem ter suas propriedades modificadas por métodos de instância, para isso, precisamos usar a palavra reservada `mutating` antes de `func`.
 > Prática: Crie uma Calculadora, que seja uma struct e mantenha como propriedade o resultado da última operação realizada.
 */




/*:
 
 
 ### Inicialização
 
 * a palavra chave é `init`
 * pode-se customizar a inicialização com passagem de parâmetros
 
 Você deve ter percebido que ao criar uma struct e definir propriedades dentro dela você consegue automaticamente instanciar através de um metódo com todas as propriedades como parâmetro, já para classes, você é sempre obrigado a definir um `init`, esse `init` da struct é chamado de `memberwise initializer`. Mas nem só pra isso servem os `inits` ele são ferramentas muito poderosas para o que chamamos de injeção de dependência, guarde esse termo na sua mente, você ainda vai ouvir falar bastante sobre ele.
 >Prática: Defina inicializadores para sua struct que receba só uma das propriedades como parâmetros e configure o restante das propriedades para receberem valores padrão. É uma ótima oportunidade para você utilizar parâmetros com valores `default`.
 */








/*:
 > Se seu modelo possuir propriedades que podem ser nulas, declare-as como optionals
 */


/*:
 ## Herança
 
 * Diferencia classes de outros tipos
 * Maneira de herdar métodos ou propriedades e outras características de outras classe

 Através da herança sua classe pode acessar metodos e propriedades da super classe de qual ela faz herança.

 > Na Swift não é permitido fazer múltiplas heranças.

 Para herdar de uma classe é necessário apenas que você coloque `:NomeDaSuperClass` após a declaração da sua classe.
 
 > Exemplo:
 */



/*:
 ### Override
 
 * Você pode sobreescrever, métodos e propriedades de classes herdadas

 Para isso basta escrever a palavra reservada `override` antes da declaração da função ou propriedade
 
 > Prática: Crie uma super classe Animal, com características comuns entre todos os animais e um metódo `communicate` que deve ser sobreescrito de acordo com as classes filhas que venham a herdar de Animal. Crie então uma classe para uma espécie específica de animal.
 */







/*:
 > Você pode tornar uma propriedade apenas de leitura para Read and Write através de override, porém não pode transformar uma propriedade Read and Write para apenas leitura
 */

/*:
 > Para prevenir que propriedades ou métodos sejam subscritos ou classes sejam herdadas, adicione o `final` antes da declaração da classe
 */


/*:
 ### Type Casting
 
 * `is` checa o tipo de um valor
 * `as` converte um valor para um tipo diferente
 
 Exemplo:

 ![](typeCasting.png)
 */





//: [Protocols](@next)
