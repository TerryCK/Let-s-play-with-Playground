import Foundation

final class Person {
    let name: String
    let age: Int
    let favoriteIceCream: String

    init(name: String, age: Int, favoriteIceCream: String) {
        self.age = age
        self.name = name
        self.favoriteIceCream = favoriteIceCream
    }
}

final class Box<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
}

final class TestContainerBox {
    var box: Box<Person>!
}


let terry = Person(name: "Terry", age: 10, favoriteIceCream: "Chocolate")

terry.name




























