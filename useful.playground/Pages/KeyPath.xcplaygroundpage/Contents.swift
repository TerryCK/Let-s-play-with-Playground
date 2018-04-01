//: [Previous](@previous)

import Foundation

//struct Person {
//    var socialSecurityNumber: String
//    var name: String
//}
//
//struct Book {
//    var isbn: String
//    var title: String
//}


//protocol Identifiable {
//    var id: String { get set }
//}

protocol Identifiable {
    associatedtype ID
    static var idKey: WritableKeyPath<Self, ID> { get }
}

struct Person: Identifiable {
    static let idKey = \Person.socialSecurityNumber
    var socialSecurityNumber: String
    var name: String
}

struct Book: Identifiable {
    static let idKey = \Book.isbn
    var isbn: String
    var title: String
}

func printID<T: Identifiable>(thing: T) {
    print(thing[keyPath: T.idKey])
}

let taylor = Person(socialSecurityNumber: "555-55-5555", name: "Taylor Swift")

printID(thing: taylor)
