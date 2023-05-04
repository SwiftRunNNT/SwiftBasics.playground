import Foundation
/*:
 [Extensions](@previous)
 # Tratamento de Erros

 Em Swift, erros são representados por valores em que o tipo estão conformes com protocolo Error. Esse protocolo indica que um tipo pode ser usado para tratamento de erros.

 Enums são a melhor estrutura para modelar um grupo de erros semelhantes, ou relacionados a uma mesma operação, com valores associados que fornecem uma informação adicional sobre a natureza do erro comunicado. Por exemplo, podemos representar as condições de erro de uma maquina de vendas.
*/

enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
}


/*:
 Lançar (em inglês, throw) um erro permite que o programa indique que algo inesperado aconteceu e que o fluxo normal foi interrompido. O termo "throw" é usado em Swift para lançar um erro. Por exemplo, o seguinte código lança um erro para indicar que é necessário inserir 5 moedas na maquina de vendas:
*/

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard coinsDeposited >= item.price else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}

/*:
 ## Propagando erros usando Throwing Functions.
 
 Para indicar que uma função, método ou inicializador pode lançar um erro, é necessário escrever a palavra reservada "throw" na declaração da função depois dos seus parâmetros. Uma função marcada com a palavra "throws" é chamada Throwing Function. Se a função especifica um tipo de retorno, escreve-se "throws" antes da seta de retorno (->).
 
    func capazDeLancarErros() throws -> String
    func incapazDeLancarErros() -> String
 
 Uma throwing function propaga os erros que são lançados dentro de seu escopo para o escopo acima (escopo em que a throwing function foi chamada).
 Somente throwing functions podem propagar erros. Quaisquer erros que forem lançados dentro de uma função que não tem a palavra "throws" na sua declaração deve ser tratado dentro do escopo da própria função.
 
 No exemplo abaixo, a classe VendingMachine tem um método vend(itemNamed:) que lança o VendingMachineError para cada caso de erro especificado.
*/

let machine = VendingMachine()
machine.coinsDeposited = 20

do {
    try machine.vend(itemNamed: "Gum")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}

/*:
 A implementação da função vend(itemNamed:) usa o termo guard para sair do escopo do método e lançar os erros caso a caso.
 
Porque a função sell(itemNamed:) propaga qualquer erro que lançar, qualquer código que chama esse método deve obrigatoriamente tratar o erro lançado, seja com do-catch, try? ou try!, ou continuar propagando o erro lançado. Por exemplo, a função abaixo buyFavoriteSnack(person:vendingMachine:) lança erros, e qualquer erro que a função sell(itemNamed:) lançar vai propagar para o escopo em que a função buyFavoriteSnack(person:vendingMachine:) é chamada.
*/

func buyFavoriteSnack(name: String, vendingMachine: VendingMachine) throws {
    let snackName = try vendingMachine.vend(itemNamed: name)
    print("Comprando \(snackName)...")
}


/*:
 Nesse exemplo, a função buyFavoriteSnack(person: vendingMachine:) busca pelo item favorito da pessoa especificada nos parametros, e tenta compra-lo chamando a função vend(itemNamed:),que também lança erros. Já que a função sell(itemNamed:) é uma throwing function, ela deve ser chamada com a palavra reservada try antes dela.
 
 Throwing initializers podem propagar erros da mesma maneira que throwing functions. Por exemplo, o inicializador para o struct PurchasedSnack na lista abaixo chama uma throwing function como parte de sua inicialização, e trata qualquer erro que for lançado propagando esse erro para o escopo que chamou o seu initializer.
*/

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}


/*:
 ## Tratando Erros usando Do-Catch
 
 No exemplo abaixo, a função buyFavoriteSnack(person:vendingMachine:) é chamada com a expressão "try" porque a função pode lançar um erro. Se um erro for lançado, a execução do código imediatamente entra no escopo do "catch" com o erro específico como parametro.
*/

let favoriteSnacks = ["Alice": "Chips", "Bob": "Licorice", "Eve": "Pretzels"]
let vendingMachine = VendingMachine()
var purse = 11

struct PurchaseError: Error {
    var message: String
}

do {
    try buyFavoriteSnack(name: "Alice", vendingMachine: vendingMachine)
    print("Yum, that was delicious!")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    let purchaseError = PurchaseError(message: "Error: \(error)")
    throw purchaseError
}
/*:
 ## Desacoplando o tratamento de erros
 
 O catch não precisa necessariamente tratar todos os erros possíveis em um lugar só. Se algum erro não for tratado, ele será propagado para o escopo acima dele. Nesse caso, o escopo acima é obrigado a tratar o erro que foi lançado.
*/
enum MyError: Error {
    case divisionByZero
}


func divideNumbers(_ x: Int, by y: Int) throws -> Int {
    guard y != 0 else {
        throw MyError.divisionByZero
    }
    
    return x / y
}

func exampleFunction() {
    do {
        let result = try divideNumbers(10, by: 0)
        print("Resultado: \(result)")
    } catch MyError.divisionByZero {
        print("Erro: divisão por zero.")
    } catch {
        print("Erro desconhecido: \(error)")
    }
}

exampleFunction()

/*:
 ## Tratando todos os casos de erro da mesma maneira
*/

enum MyErrorNew: Error {
    case divisionByZero
    case invalidNumber
}

func divideNumbersNew(_ x: Int, by y: Int) throws -> Int {
    guard y != 0 else {
        throw MyError.divisionByZero
    }
    guard x > 0 && x < 100 else {
        throw MyErrorNew.invalidNumber
    }
    
    return x / y
}

func exampleFunctionNew() {
    do {
        let result = try divideNumbers(10, by: 0)
        print("Resultado: \(result)")
    } catch {
        print("Erro: \(error)")
    }
}


/*:
 ## Desabilitando propagação de erros
*/

func printNumber(_ number: Int) {
    do {
        try divideNumbers(10, by: 0)
        print("Resultado: \(number)")
    } catch {
        print("Ocorreu um erro: \(error)")
    }
}


/*:
## Especificando Cleanup Actions

A palavra reservada "defer"
É possível definir que algumas linhas de código devem ser obrigatoriamente executadas exatamente antes de um erro ser lançado dentro de uma função usando a palavra reservada "defer". Assim, é possível fazer qualquer cleanup ou ação necessária indenpendentemente de um erro ser lançado ou não. Por exemplo, você pode usar o defer com um código que fecha um arquivo caso haja algum erro durante a sua edição.

Ações definidas dentro do escopo do defer não devem conter break, return, continue, ou throw. Além disso, são executadas em ordem inversa, ou seja, de cima pra baixo. A última linha de código executa primeiro, depois a penúltima, e assim por diante até chegar na primeira linha de código do defer.
*/

func exampleFunctionNewOld() {
    defer {
        print("Ação executada com sucesso!")
    }
    
    print("Iniciando a função...")
    
    // Alguma ação que pode lançar erro
    let x = 10
    let y = 0
    let result = x / y
    
    print("Resultado: \(result)")
}


/*:
 # Exemplo da Máquina de Café

 ## Enum que define tipos de erro possíveis
*/

enum CoffeeMachineError: Error {
    case invalidCoffee
    case notEnoughMoney
    case outOfStock
}


/*:
 ## Enum que representa os tipos de cafés, estoque, e preço.
 Feito com fins didáticos. Na prática isso não faz sentido. Normalmente esse tipo de info vem de um servidor e fica persistida no App com CoreData ou FileManager.
*/
enum CoffeeType: String {
    case espresso = "Espresso"
    case americano = "Americano"
    case latte = "Latte"
}

class CoffeeMachine {
    private var stock: [CoffeeType: Int]
    private var price: [CoffeeType: Double]
    
    init(stock: [CoffeeType: Int], price: [CoffeeType: Double]) {
        self.stock = stock
        self.price = price
    }
    
    func buyCoffee(_ coffee: CoffeeType, with coins: Double) throws -> String {
        guard let currentStock = stock[coffee], currentStock > 0 else {
            throw CoffeeMachineError.outOfStock
        }
        
        guard let currentPrice = price[coffee], coins >= currentPrice else {
            throw CoffeeMachineError.notEnoughMoney
        }
        
        defer {
            print("Obrigado por usar a nossa máquina de café!")
        }
        
        // Realiza a venda
        stock[coffee]! -= 1
        let change = coins - currentPrice
        
        return "Aqui está o seu \(coffee.rawValue). Troco: R$\(String(format: "%.2f", change))"
    }
}



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

let stock: [CoffeeType: Int] = [.espresso: 5, .americano: 5, .latte: 5]
let price: [CoffeeType: Double] = [.espresso: 2.0, .americano: 3.0, .latte: 4.0]

let machineCoffe = CoffeeMachine(stock: stock, price: price)

do {
    let coffee = try machineCoffe.buyCoffee(.latte, with: 5.0)
    print(coffee)
} catch CoffeeMachineError.outOfStock {
    print("Desculpe, o café de sua escolha está fora de estoque.")
} catch CoffeeMachineError.notEnoughMoney {
    print("Você inseriu um valor insuficiente.")
} catch {
    print("Ocorreu um erro desconhecido: \(error).")
}


/*:
 É possível fazer várias chamadas a _Throwing Functions_ usando _try_ dentro de um mesmo _do-catch_
 
 Nesse caso, o primeiro erro que for lançado desviará a execução para dentro do _catch_, independentemente de em qual função ele ocorrer. A execução dos _try_ anteriores ao que lançou erro não é afetada.
 */


//: [Generics](@next)
