import Foundation

//: ## Retain cycle

//: ## Two object retain cycle pattern
class Person: NSObject {
    var name: String
    var departure: Departure?
    init(name:String) {
        self.name = name
    }
    deinit {
        print("person deinit")
    }
}

class Departure: NSObject {
    
    var resident: Person?
    //      resolution
    //      weak var resident: Person?
    var address: String
    init(address: String) {
        self.address = address
    }
    deinit {
        print("Departure deinit")
    }
}

var terry: Person? = Person(name: "Terry")
var kyotoTown: Departure? = Departure(address: "kyoto road")

terry?.departure = kyotoTown
kyotoTown?.resident = terry

terry = nil
kyotoTown = nil





//: ## Single object retain cycle pattern

class A {
    var a: A?
    //      resolution
    //      weak var a: A?
    
    init() {
        print("init class A")
    }
    
    deinit {
        print("deinit class A")
    }
}

var a: A? = A()
a?.a = a
a = nil









class B {
    var reference: (() -> Void)?
}
//: ## Closure retain cycle pattern
class People {
    var lastName: String
    var firstName: String
//    lazy var name: () -> String = {
//        // resolution
//        // [unowned self] in
//        // [capture list] unowned(non-optional) or weak(optional)
//        return self.firstName + " " + self.lastName
//    }
    
    lazy var name: String = {
        // resolution
        // [unowned self] in
        // [capture list] unowned(non-optional) or weak(optional)
        return self.firstName + " " + self.lastName
    }()
    
    lazy var object: B = { // [unowned self] in
        let b = B()
        b.reference = { print(self) }
        return b
    }()
    
    init(firstName: String, lastName: String) {
        self.lastName = lastName
        self.firstName = firstName
        print("init People")
    }
    
    deinit {
        print("deinit People")
    }
}

var people: People? = People(firstName: "Bob", lastName: "Chen")
people?.object
people = nil






//
//
////  unowned scenario
//
//class Customer {
//    let name: String
//    var creditCard: CreditCard?
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    deinit {
//        print("Custom name: \(name) was deinitialized")
//    }
//}
//
//class CreditCard {
//    let number: Int64
//    unowned let owner: Customer
//    
//    init(number: Int64, owner: Customer) {
//        self.number = number
//        self.owner = owner
//    }
//    deinit {
//        print("card number: \(number) was deinitialized")
//    }
//}
//
//
//var bill: Customer? = Customer(name: "Bill")
//
//bill?.creditCard = CreditCard(number: 123_456_789_123, owner: bill!)
//
//
//print(bill?.creditCard?.number)
//
//print(bill?.creditCard?.owner)
//
//
//bill = nil





//: ## Combined unowned and implicity unwrapped optional property

class Country: NSObject {
    let name: String
    var capitalCity: City!
    
    init(name: String, capitalName: String) {
        
        self.name = name
        super.init()
        self.capitalCity = City(name: capitalName, country: self)
        
    }
    
    deinit {
        print("the country \(name) is deinitialized")
    }
    
    override var debugDescription: String {
        return "\(name) has capital city \(capitalCity.name)"
    }
}

class City {
    let name: String
    let country: Country
    
    init(name:String, country: Country) {
        self.name = name
        self.country = country
    }
    deinit {
        print("the city \(name) is deinitialized")
    }
}


let country = Country(name: "Taiwan", capitalName: "Taipei")

print(country.debugDescription)









class Observation: NSObject {
    @objc dynamic var oberservableProperty: String? = ""
}
let x = Observation()
class Observer {
    private var observation: NSKeyValueObservation?
    init() {
        self.observation = x.observe(\.oberservableProperty, changeHandler: { [unowned self] (ob, change) in
            print(self)
        })
    }
    
    deinit {
        print("deinit Observer")
    }
}


var observer:Observer?  = Observer()
//x.oberservableProperty = "x"
observer = nil
x.oberservableProperty = "x"
