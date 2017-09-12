//struct Animal {
//    let name: String
//
//    init?(name: String) {
//        if name.isEmpty { return nil }
//        self.name = name
//    }
//}
//
//let lion = Animal(name: "Lino")
//
//print(lion!)
//
//let anotherAnimal = Animal(name: "")
//if  anotherAnimal?.name == nil {
//    print("is empty")
//}
//
//
//
//
//
//
//enum TemperatureUnit {
//    case kelvin, celsius, fahrenheit
//    init?(symbol: Character) {
//        switch symbol {
//        case "K":
//            self = .kelvin
//        case "C":
//            self = .celsius
//        case "F":
//            self = .fahrenheit
//        default:
//            return nil
//        }
//    }
//}
//
//
//enum anotherTemperatureUnit: String {
//    case kelvin = "K", celsius = "C" , fahrenheit = "F"
//
//}
//
//let oneUnit = TemperatureUnit(symbol: "K")
//oneUnit
//
//
//let anotherOneUnit = anotherTemperatureUnit(rawValue: "K")
//
//
//
//
//
//
//
//
//
//class OneCharacter {
//    let name: String
//    init?(name: String) {
//        if name.isEmpty { return nil }
//        self.name = name
//    }
//}
//
//
//class AnotherCharacter: OneCharacter {
//    let attackSpeed : Int
//    init?(name:String, attackSpeed: Int) {
//        if attackSpeed < 1 { return nil }
//        self.attackSpeed = attackSpeed
//        super.init(name: name)
//    }
//}
//
//
//let anotherCharacter =  AnotherCharacter(name: "", attackSpeed: 1)
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    deinit {
//        print("person deinit")
//    }
//
//    var apartment: Apartment?
//}
//
//
//class Apartment {
//
//    let unit: String
//    init(unit: String) {
//        self.unit = unit
//    }
//    deinit {
//        print("apartment deinit")
//    }
//    var tenant: Person?
//}
//
//
//
//var joe: Person? = Person(name: "Joe")
//var apartment: Apartment? = Apartment(unit: "5A")
//
//joe!.apartment = apartment
//apartment!.tenant = joe
//
//joe = nil
//apartment = nil
//
//
//
//
//func networking( closure:(_ data: String, _ response: String) -> ()) -> () {
//    let data = "data"
//    let response = "response"
//    print("networking")
//    closure(data, response)
//}
//
//networking { (data, response) in
//    print(data,response)
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//let arrayInt = [1,2,3,4,5]
//for (index, value) in arrayInt.enumerated() {
//
//    if value == arrayInt.last {
//        print(arrayInt[index])
//
//    }
//
//}
//
//
//arrayInt.last
//
//
//
//
//
//
//
//
//
//
//
//
















func function(completeHandler: ()->()) {
    print("do somthing")
    completeHandler()
}


function {
    print("completed")
}





















