////import UIKit
////import PlaygroundSupport
//////var liveView: PlaygroundLiveViewable? { get set }
////
////let window = UIView(frame: CGRect(x: 0, y: 0, width: 320 , height: 568))
////window.backgroundColor = .white
////
////
////PlaygroundPage.current.liveView = window
////
//
//
//
//func fizzbuzz(num: Int) {
//    switch (num % 3 == 0, num % 5 == 0) {
//    case (true, true):
//
//    print("fizz", "buzz")
//        
//    case (true, false):
//        print("fizz")
//        
//    case (false, true):
//        print("buzz")
//    default:
//        print("default")
//    }
//}
//
//fizzbuzz(num: 10)
//fizzbuzz(num: 15)
//
//fizzbuzz(num: 1)
//
//
//
//let name: String? = "Terry"
//let password: String? = nil
//
//
//switch (name, password) {
//case let (name?, password?) :
//    print("Hello, \(name)")
//case let (name, .none):
//    print("plase enter your password")
//default:
//    print("who are you?")
//    
//    
//}
//
////
////if case let (matchedName?, matchedPassword?) = (name, password) {
////    print("\n", matchedName, matchedPassword, "\n")
////}
//
//import Foundation
//
////let data: [Any?] = ["Bill", nil , 69, "Ted"]
////
////for case let datum? in data {
////    print(datum)
////}
////
////for datum in data {
////    print(datum)
////}
//
//enum Media {
//    case Book(title: String, author: String, year: Int)
//    case Movie(title: String, director: String, year: Int)
//    case WebSite(urlString: String)
//}
//
//
//let mediaList: [Media] = [
//    .Book(title: "Harry Potter and the Philosopher's Stone", author: "J.K. Rowling", year: 1997),
//    .Movie(title: "Harry Potter and the Philosopher's Stone", director: "Chris Columbus", year: 2001),
//    .Book(title: "Harry Potter and the Chamber of Secrets", author: "J.K. Rowling", year: 1999),
//    .Movie(title: "Harry Potter and the Chamber of Secrets", director: "Chris Columbus", year: 2002),
//    .Book(title: "Harry Potter and the Prisoner of Azkaban", author: "J.K. Rowling", year: 1999),
//    .Movie(title: "Harry Potter and the Prisoner of Azkaban", director: "Alfonso Cuarón", year: 2004),
//    .Movie(title: "J.K. Rowling: A Year in the Life", director: "James Runcie", year: 2007),
//    .WebSite(urlString: "https://en.wikipedia.org/wiki/List_of_Harry_Potter-related_topics")
//]
//
//
//for case let Media.Movie(title, director, year) in mediaList where director == "Chris Columbus" {
//    print("- \(title) (\(year))")
//}
//
//
//for media in mediaList {
//    if case let Media.Movie(title, director, year) = media  {
//       
//        if director == "Chris Columbus" {
//            print(title)
//            
//        }
//    }
//}
//
//
//struct Person {
//    var name: String {
//        willSet {
//        print(newValue)
//        }
//    }
//}
//
//
//var terry = Person(name: "terry")
//
//terry.name = "bob"
//
//
//var first = [1, 2, 3]
//var second = ["one", "two", "three"]
//var third = Array(zip(first, second))
//print()
//
//
////let names = ["Pilot": "Wash", "Doctor": "Simon"]
////
////for (key, value) in names.enumerated() {
////    let testVar = value
////}
////
//
//
//
//let string: String = String(describing: String.self)
//print(string)
//
//
//struct Spaceship {
//    fileprivate(set) var name = "Serenity"
//}
//
//var serenity = Spaceship()
//serenity.name = "Jayne's Chariot"
//print(serenity.name)
//
//
//import Foundation
//let data: [Any?] = ["Bill", nil, 69, "Ted"]
//
//for datum in data where datum is String? {
//    print(datum)
//}
//
//for case let .some(datum) in data where datum is String {
//    print(datum)
//}
//
//enum Planet: Int {
//    case Mercury = 1
//    case Venus
//    case Earth
//    case Mars
//}
//
//let test = Planet(rawValue: 3)
//
//
//
//
//
//
//
//let i = 101
//
//if case 100...101 = i {
//    print("Hello, world!")
//} else {
//    print("Goodbye, world!")
//}
//
//
//
//
//
//
//func getNumber() -> Int {
//    print("Fetching number...")
//    return 5
//}
//
//func printStatement(_ result: @autoclosure () -> Bool) {
//    // print("Here is the number: \(result())")
//    
//    print("Nothing to see here.")
//}
//
//printStatement(getNumber() == 5)
//
//var spaceships1 = Set<String>()
//spaceships1.insert("Serenity")
//spaceships1.insert("Enterprise")
//spaceships1.insert("TARDIS")
//
//let spaceships2 = spaceships1
//
//if spaceships1.isSubset(of: spaceships2) {
//    print("This is a subset")
//} else {
//    print("This is not a subset")
//}


let i = 11
let j = 21

let name = 9...11 ~= i ? j % 2 == 1 ? "Larry" : "Laura" : "Libby"



if 9...11 ~= i {
    if j % 2 == 1 {
        "Larry"
    } else {
         "Laura"
    }
   
} else {
    "Libby"
}





let names = ["Pilot": "Wash", "Doctor": "Simon"]

for (key, value) in names.enumerated() {
    
    let x = key
    let testVar = value
}


enum WeatherType {
    case cloudy(coverage: Int)
    case sunny
    case windy
    
}

let today = WeatherType.cloudy(coverage: 10)

if case let .cloudy(coverageMatched) = today {
    print(coverageMatched)
}


 













