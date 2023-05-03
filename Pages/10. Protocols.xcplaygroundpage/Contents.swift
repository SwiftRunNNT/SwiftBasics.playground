
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
protocol MyProtocol {
    var myVar: Int { get set }
    func myMethod()
}

class MyClass: MyProtocol {
    var myVar: Int = 0
    
    func myMethod() {
        print("My method was called")
    }
}

/*:
 ### Propriedades
 
 * Um protocolo pode requerer que os tipos que o adotam provenham propriedades de instância e de tipo.
 * Não se especifica se uma propriedade é armazenada ou computada
 * Apenas é especificado nome e tipo
 * Também especifica-se os acessos a propriedade (`{get}`, `{get set}`

 Exemplo:
 */

protocol Colorful {
    var color: String { get set }
}


/*:
 ### Métodos
 * Protocolos podem especificar métodos de instância e de tipo
 * Não é permitido definir valores padrão para parâmetros de métodos especificados em protocolos.
 
 > Protocolos podem especificar um inicializador para classes.
 > Sempre devemos marcar a implementação do iniciador com required.
 */

protocol Playable {
    func play()
}

class Song: Playable {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func play() {
        print("Tocando a musica: \(title)")
    }
}

let mySong = Song(title: "Shadow Moses")
mySong.play()


/*:
 ### Associated Types
 * São placeholders para tipos usados nas definições do protocolo;
 * O tipo só será definido quando o protocolo for adotado;
 * São definidos usando a palavra chave associatedtype;
 > 
 */

protocol Container {
    associatedtype Item
    
    var count: Int { get }
    mutating func append(_ item: Item)
    subscript(i: Int) -> Item { get }
}

class IntContainer: Container {
    typealias Item = Int
    
    private var items = [Item]()
    
    var count: Int {
        return items.count
    }
    
    func append(_ item: Item) {
        items.append(item)
    }
    
    subscript(i: Int) -> Item {
        return items[i]
    }
}


/*:
#### Prática:
 Imagine um ambiente de trabalho onde temos diferentes tipos de funcionários, mas todos eles possuem algumas caracteristicas obrigatórias, `nome`, `data de nascimento`, `departamento` e para controle da empresa é necessário existir um metódo que imprima esses dados de forma organizada.

 Os funcionários também possuem um `salário bruto` e uma maneira de calcular `encargos` desse salário.

 Divida esses dois tipos de dados em protocolos diferentes e crie algus tipos de funcionários que utilizam ambos os protocolos.

 Esses funcionários podem também pegar emprestados alguns itens, que são tipos diferentes de structs, e pra cada um desses tipos que ele pode pegar emprestado eles tem um `armario digital` que deve ser capaz de armazenar os itens em um array, gerar uma lista de todos os itens.

 Podemos por exemplo ter `eletronicos`, `livros`, etc. Use `associated types` para definir um protocolo para esse "armário"
 */

import Foundation

protocol Printable {
    func printData()
}

protocol SalaryCalculable {
    var grossSalary: Double { get set }
    func calculateTaxes() -> Double
}

protocol Locker {
    associatedtype ItemType
    var items: [ItemType] { get set }
    func listItems()
}

struct Electronic {
    let name: String
}

struct Book {
    let title: String
}

struct ElectronicLocker: Locker {
    var items: [Electronic]
    
    func listItems() {
        for item in items {
            print(item.name)
        }
    }
}

class Employee: Printable {
    var name: String
    var birthDate: Date
    var department: String
    
    init(name: String, birthDate: Date, department: String) {
        self.name = name
        self.birthDate = birthDate
        self.department = department
    }
    
    func printData() {
        print("Name: \(name)")
        print("Birth Date: \(birthDate)")
        print("Department: \(department)")
    }
}

class EmployeeWithLocker<ItemType>: Employee, SalaryCalculable where ItemType: Locker {
    var grossSalary: Double
    var locker: ItemType
    
    init(name: String, birthDate: Date, department: String, grossSalary: Double, locker: ItemType) {
        self.grossSalary = grossSalary
        self.locker = locker
        super.init(name: name, birthDate: birthDate, department: department)
    }
    
    func calculateTaxes() -> Double {
        return grossSalary * 0.2
    }
}

let electronicLocker = ElectronicLocker(items: [Electronic(name: "PC"), Electronic(name: "Laptop")])
let employeeWithElectronicLocker = EmployeeWithLocker(name: "Francisco Remo", birthDate: Date(), department: "TI", grossSalary: 5000.0, locker: electronicLocker)

employeeWithElectronicLocker.printData()
print("Gross Salary: \(employeeWithElectronicLocker.grossSalary)")
employeeWithElectronicLocker.locker.listItems()
print("Taxes: \(employeeWithElectronicLocker.calculateTaxes())")


//: [Extensions](@next)
