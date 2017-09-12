
//: Playground - noun: a place where people can play

protocol Animal {
    var name: String { get }
    
}

protocol Flyable {
    
}

protocol Swimable {
    
}

extension Animal {
    var canFly: Bool { return false }
    var canSwim: Bool { return false }
    
}

extension Animal where Self: Flyable {
    var canFly: Bool { return true }
}
extension Animal where Self: Swimable {
    var canSwim: Bool { return true }
}


struct Parrot: Animal, Flyable{
    let name: String
}

struct Penguin: Animal, Flyable, Swimable {
    let name: String
}

struct Goldfish: Animal, Swimable {
    let name: String
}

let parrot = Parrot(name: "Terry")


parrot.name
parrot.canFly
parrot.canSwim

print(parrot.canFly)


