import Foundation
enum Animal: Equatable {
    static func ==(lhs: Animal, rhs: Animal) -> Bool {
        return lhs == rhs
    }
    
    case dog(String)
    case cat(String)
}
let animals: [Animal] = [.dog("Growlithe"), .dog("Rockruff")]
let hasCat = animals.contains { $0 == .cat("") }      // compile error

