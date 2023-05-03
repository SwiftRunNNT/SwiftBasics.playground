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

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sayHello() {
        print("Oi! Meu nome é \(name) e tenho \(age) anos.")
    }
}

struct PersonStruct {
    var name: String
    var age: Int
    
    func sayHello() {
        print("Oi! Meu nome é \(name) e tenho \(age) anos.")
    }
}



/*:
 > Structs possuem inicializadores auto-gerados com todas as propriedades
 */

let person = PersonStruct(name: "Lucas", age: 22)

/*:
 > Prática: Atribua uma nova instância da sua struct a uma váriavel e faça o mesmo com a classe
 */
let personNew  = Person(name: "João", age: 18)
let personNewNew = PersonStruct(name: "Anderson", age: 18)

/*:
 > **Quando usar structs:**
 * Quando queremos encapsular dados relativamente simples
 * Quando Propriedades do modelo também são **Value Types**
 * Quando o modelo não precisa herdar nenhuma propriedade ou comportamentos de modelos existentes ( Pode ser alcançado através de protocolos também )
 * Quando os dados encapsulados devem ser copiados e não referenciados
 */

struct Coordinate {
    var latitude: Double
    var longitude: Double
}



/*:
 ## Propriedades
 ### Stored Properties
 Uma constante ou variável que é parte de um instância de classe ou struct

 > Prática: adicione a classe e a struct que você criou caracteristicas do objeto real
 */

struct Car {
    var model: String
    var year: Int
}

/*:
 ### Refêrencia vs Valor

 Em **Swift** Classes e Closures são Reference Types, todo o resto é Value Type
 > Prática: Crie uma váriavel atribua como valor, a váriavel que você instanciou a struct da prática acima, agora mude uma das propriedades dessa nova váriavel. Use a função `print` para analisar tanto a váriavel antiga como a nova. Faça o mesmo com a classe. Consegue perceber a diferença?
 */

struct Book {
    var title: String
    var author: String
}

class Library {
    var books: [Book]
    
    init(books: [Book]) {
        self.books = books
    }
}

// Criando uma instância da struct
var book1 = Book(title: "O Hobbit", author: "J.R.R. Tolkien")
print("Book 1 - Title: \(book1.title), Author: \(book1.author)")

// Atribuindo a variável book2 o valor da variável book1
var book2 = book1

// Mudando o título do livro na variável book2
book2.title = "Senhor dos Anéis"

// Verificando as propriedades de book1 e book2
print("Book 1 - Title: \(book1.title), Author: \(book1.author)")
print("Book 2 - Title: \(book2.title), Author: \(book2.author)")

// Criando uma instância da classe
var library1 = Library(books: [book1])
print("Library 1 - Books: \(library1.books)")

// Atribuindo a variável library2 o valor da variável library1
var library2 = library1

// Adicionando um novo livro na variável library2
library2.books.append(Book(title: "A Batalha do Apocalipse", author: "Eduardo Spohr"))

// Verificando as propriedades de library1 e library2
print("Library 1 - Books: \(library1.books)")
print("Library 2 - Books: \(library2.books)")


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

class Persona {
    var name: String
    lazy var greeting: String = {
        return "Oi! Meu nome é (name)."
    }()
    
    init(name: String) {
        self.name = name
    }
}

let john = Persona(name: "Lucas")
print(john.greeting)
john.name = "Lucas Ferreira"
print(john.greeting)
/*:
 ### Computed Stored Properties
 
 * Não armazenam um valor propriamente dito
 * Provêm um getter e um setter que é opcional
 > Exemplo:
 */
import Foundation

struct Circle {
    var radius: Double
    
    var area: Double {
        get {
            return Double.pi * radius * radius
        }
        set {
            radius = sqrt(newValue / Double.pi)
        }
    }
}

var myCircle = Circle(radius: 5)
print(myCircle.area) // Saída: 78.53981633974483
myCircle.area = 50
print(myCircle.radius) // Saída: 3.989422804014327



/*:
 ### Read Only Computed Stored Properties
 
 * Computada apenas com o get
 > Exemplo:
 */

struct Cubo {
    var lado: Double
    
    var volume: Double {
        return lado * lado * lado
    }
}

var cubo1 = Cubo(lado: 5.0)
print(cubo1.volume) // Output: 125.0

/*:
 ### Property Observers
 
 * Respondem a mudanças no valor de uma propriedade
 * São chamados sempre que o valor é atribuído, mesmo quando não difere do atual
 * Pode-se adicionar observers para propriedades herdadas
 * Podemos usar os observers willSet e didSet
 
 > Exemplo:
 */

struct Temperature {
    var celsius: Double {
        didSet {
            if celsius < -273.15 {
                print("A temperatura não pode ser menor que -273.15 graus Celsius, o valor anterior será mantido.")
                celsius = oldValue
            }
        }
    }
    
    var fahrenheit: Double {
        get {
            return celsius * 9 / 5 + 32
        }
        set {
            celsius = (newValue - 32) * 5 / 9
        }
    }
    
    init(celsius: Double) {
        self.celsius = celsius
    }
}

var temperature = Temperature(celsius: 20)
print(temperature.celsius)   // 20.0
print(temperature.fahrenheit)   // 68.0

temperature.fahrenheit = 100
print(temperature.celsius)   // 37.77777777777778
print(temperature.fahrenheit)   // 100.0

temperature.celsius = -300
print(temperature.celsius)   // -273.15
print(temperature.fahrenheit)



/*:
 ## Métodos
 
 * Funções associadas a classes, structs ou enums

 Existem dois tipos de função:
 * A de instância que para ser usada é necessário que a classe ou a struct que a possuí seja instanciada.
 * A de tipo, onde não é necessário instanciar o tipo para usar e usam a palavra reservada `static` antes de sua declaração.
 > Prática: Declare uma struct ou uma classes chamada Employee, nela escreva uma função de instância que calcula o salário do funcionário e uma de tipo que retorna o imposto de acordo com um valor salarial passado via parâmetro.
 */


struct Employee {
    var name: String
    var hourlyRate: Double
    var hoursWorked: Double
    
    func calculateSalary() -> Double {
        return hourlyRate * hoursWorked
    }
    
    static func calculateTax(for salary: Double) -> Double {
        let taxRate = 0.2
        return salary * taxRate
    }
}




/*:
 ### Mutating
 Lembra que mais acima falamos sobre value type e reference type? Pois bem, value types não podem ter suas propriedades modificadas por métodos de instância, para isso, precisamos usar a palavra reservada `mutating` antes de `func`.
 > Prática: Crie uma Calculadora, que seja uma struct e mantenha como propriedade o resultado da última operação realizada.
 */

struct Calculator {
    var result: Double = 0.0
    
    mutating func add(_ num: Double) {
        result += num
    }
    
    mutating func subtract(_ num: Double) {
        result -= num
    }
    
    mutating func multiply(_ num: Double) {
        result *= num
    }
    
    mutating func divide(_ num: Double) {
        result /= num
    }
}

// Exemplo de uso:
var calc = Calculator()
calc.add(5)
print(calc.result) // imprime 5.0
calc.multiply(2)
print(calc.result) // imprime 10.0
calc.subtract(3)
print(calc.result) // imprime 7.0
calc.divide(2)
print(calc.result) // imprime 3.5



/*:
 
 
 ### Inicialização
 
 * a palavra chave é `init`
 * pode-se customizar a inicialização com passagem de parâmetros
 
 Você deve ter percebido que ao criar uma struct e definir propriedades dentro dela você consegue automaticamente instanciar através de um metódo com todas as propriedades como parâmetro, já para classes, você é sempre obrigado a definir um `init`, esse `init` da struct é chamado de `memberwise initializer`. Mas nem só pra isso servem os `inits` ele são ferramentas muito poderosas para o que chamamos de injeção de dependência, guarde esse termo na sua mente, você ainda vai ouvir falar bastante sobre ele.
 >Prática: Defina inicializadores para sua struct que receba só uma das propriedades como parâmetros e configure o restante das propriedades para receberem valores padrão. É uma ótima oportunidade para você utilizar parâmetros com valores `default`.
 */

struct Rectangle {
    var width: Double
    var height: Double
    var color: String
    
    init(width: Double = 0.0, height: Double = 0.0, color: String = "White") {
        self.width = width
        self.height = height
        self.color = color
    }
}

/*:
 > Se seu modelo possuir propriedades que podem ser nulas, declare-as como optionals
 */
class Personalid {
    var firstName: String
    var middleName: String?
    var lastName: String
    
    init(firstName: String, middleName: String?, lastName: String) {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
    }
}
let name = Personalid(firstName: "Lucas", middleName: nil, lastName: "Farreira")


/*:
 ## Herança
 
 * Diferencia classes de outros tipos
 * Maneira de herdar métodos ou propriedades e outras características de outras classe

 Através da herança sua classe pode acessar metodos e propriedades da super classe de qual ela faz herança.

 > Na Swift não é permitido fazer múltiplas heranças.

 Para herdar de uma classe é necessário apenas que você coloque `:NomeDaSuperClass` após a declaração da sua classe.
 
 > Exemplo:
 */

class Animalidade {
   var name: String
   var age: Int
   
   init(name: String, age: Int) {
      self.name = name
      self.age = age
   }
   
   func makeSound() {
      print("The animal makes a sound")
   }
}

class Cachorro: Animalidade {
   var breed: String
   
   init(name: String, age: Int, breed: String) {
      self.breed = breed
      super.init(name: name, age: age)
   }
   
   override func makeSound() {
      print("The dog barks")
   }
}


/*:
 ### Override
 
 * Você pode sobreescrever, métodos e propriedades de classes herdadas

 Para isso basta escrever a palavra reservada `override` antes da declaração da função ou propriedade
 
 > Prática: Crie uma super classe Animal, com características comuns entre todos os animais e um metódo `communicate` que deve ser sobreescrito de acordo com as classes filhas que venham a herdar de Animal. Crie então uma classe para uma espécie específica de animal.
 */

class Animal {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func communicate() {
        print("Eu faço barulho")
    }
}

class Dog: Animal {
    override func communicate() {
        print("Au au!")
    }
}

let dog = Dog(name: "Buddy", age: 3)
print(dog.communicate()) // Output: "Au au!"






/*:
 > Você pode tornar uma propriedade apenas de leitura para Read and Write através de override, porém não pode transformar uma propriedade Read and Write para apenas leitura
 */
class AnimalLeitura {
    private var _nome: String
    
    var nome: String {
        return _nome
    }
    
    init(nome: String) {
        self._nome = nome
    }
}

class Cachorrinho: AnimalLeitura {
    override init(nome: String) {
        super.init(nome: nome)
    }
}

/*:
 > Para prevenir que propriedades ou métodos sejam subscritos ou classes sejam herdadas, adicione o `final` antes da declaração da classe
 */

final class MyClass {
  final var myProperty = 42
  final func myMethod() {
    print("Hello, World!")
  }
}

/*:
 ### Type Casting
 
 * `is` checa o tipo de um valor
 * `as` converte um valor para um tipo diferente
 
 Exemplo:

 ![](typeCasting.png)
 */


var valor: Any = "10"

if valor is String {
    let valorString = valor as! String
    print("O valor é uma string: \(valorString)")
    // converte para inteiro e soma 1
    let valorInt = Int(valorString)! + 1
    print("O valor mais 1 é: \(valorInt)")
} else if valor is Int {
    let valorInt = valor as! Int
    print("O valor é um inteiro: \(valorInt)")
    // soma 1
    let novoValor = valorInt + 1
    print("O valor mais 1 é: \(novoValor)")
}




//: [Protocols](@next)
