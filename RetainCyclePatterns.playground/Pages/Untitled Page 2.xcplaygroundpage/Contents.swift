enum Terry: Hashable {
    case name(String)
    case age(Int)
    
    var hashValue: Int {
        switch self {
        case let .age(age): return age.hashValue
        case let .name(name): return name.hashValue
        }
    }
    
}

Terry.age(10).hashValue
