// Main idea: A key path from a specific root type to a specific resulting value type.
// reference: https://developer.apple.com/documentation/swift/keypath


// Create two struct, and use keypath with subscript
// an example struct
struct Player {
    var name: String
    var rank: String
}

// another example struct, this time with a method
struct Cavaliers {
    var name: String
    var maxPoint: Double
    var captain: Player
    
    func goTomaxPoint() {
        print("\(name) is now travelling at warp \(maxPoint)")
    }
    
    subscript(keyPath: AnyKeyPath) -> String {
        return "a"
    }
}

// create instances of those two structs
let james = Player(name: "Lebron", rank: "Captain")
let irving = Cavaliers(name: "Kyrie", maxPoint: 9.975, captain: james)

// grab a reference to the `goTomaxPoint()` method
let score = irving.goTomaxPoint

// call that reference
score()


// Usage: keyPath
let nameKeyPath = \Cavaliers.name
let maxPointKeyPath = \Cavaliers.maxPoint
let captainName = \Cavaliers.captain.name

let cavaliersName = irving[keyPath: nameKeyPath]
let cavaliersMaxPoint = irving[keyPath: maxPointKeyPath]
let cavaliersNameCaptain = irving[keyPath: captainName]
