import Foundation

enum Animal {

    case dog(String)
    case cat(String)
}
let animals: [Animal] = [.dog("Growlithe"), .dog("Rockruff")]
let hasCat = animals.contains { (animal) in
    if case .cat = animal {
        return true
    }
    return false
    
    
}      // compile error


