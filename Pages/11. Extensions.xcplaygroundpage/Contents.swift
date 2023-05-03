
import Foundation
/*:
 [Protocols](@previous)
 
 # Extensões
 * Adicionam novas funcionalidades a tipos existentes.
 * Permite extender tipos que não temos acesso ao código fonte.
 
 ### Podemos com extensões:
 
 1. Adicionar propriedades computadas de instância e tipo.
 2. Definir métodos de instância e de tipo.
 3. Prover novos iniciadores.
 4. Definir novos tipos aninhados.
 5. Fazer com que um tipo existente entre em conformidade com protocolos.
 6. Definir implementações padrão para métodos definidos em protocolos.
 */
/*:
 ### Sintaxe
 */

extension Double {
    var squared: Double {
        return self * self
    }
}

let number = 5.0
let squaredNumber = number.squared // 25.0



/*:
 ### Propriedades Computadas
 */

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

let x = 4
print(x.isEven) // Output: true

let y = 5
print(y.isEven) // Output: false


/*:
 ### Inicializadores
 */

extension Date {
    init(year: Int, month: Int, day: Int) {
        let calendar = Calendar(identifier: .gregorian)
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        self = calendar.date(from: components)!
    }
}

let myDate = Date(year: 2023, month: 5, day: 3)
print(myDate) // Output: 2023-05-03


/*:
 ### Métodos
 */

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
}

let str = "hello"
let capitalizedStr = str.capitalizeFirstLetter() // "Hello"


/*:
### Implementações padrão
 Graças a extensions, você pode prover a seus protocolos implementações padrões dos métodos definidos nele.
 */

protocol MyProtocol {
    func myMethod()
}

extension MyProtocol {
    func myMethod() {
        print("Implementação padrão de myMethod()")
    }
}

/*:
 ### Prática
 Utilize uma extensão para fornecer implementações padrões para alguns metódos dos protocolos criados na prática anterior de protocolos.
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

extension Song {
    var duration: Double {
        return 240.0 // Exemplo de duração em segundos
    }
}

print("Duração da música: \(mySong.duration) segundos")

let mySong = Song(title: "Shadow Moses")
mySong.play()


 //: [Tratamento de Erros](@next)



