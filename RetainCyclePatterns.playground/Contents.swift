// retain cycle
import Foundation


// Two object retain cycle pattern
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

var bob: Person? = Person(name: "Bob")
var kyotoTown: Departure? = Departure(address: "kyoto road")

bob?.departure = kyotoTown
kyotoTown?.resident = bob

bob = nil
kyotoTown = nil





// Single object retain cycle pattern

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









// closure retain cycle pattern

class People {
    
    var lastName: String
    var firstName: String
    
    lazy var name: () -> String = {
        // resolution 
        // [unowned self] in
        // [capture list] unowned(non-optional) or weak(optional)
        return self.firstName + " " + self.lastName
    }
    
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

people?.name()
people = nil




















