import Foundation

struct Version {
    let major: Int, date: Int, env: Int, minor: Int
}

extension Version: OptionalComparable, CustomStringConvertible {
    
    static func == (lhs: Version, rhs: Version) -> Bool? {
        return lhs.major == rhs.major ? lhs.minor == rhs.minor : nil
    }
    
    var description: String {
        return "\(major).\(date).\(env).\(minor)"
    }
    
    static func <(lhs: Version, rhs: Version) -> Bool? {
        return lhs.major < rhs.major ? lhs.major < rhs.major : lhs.minor < rhs.minor
    }
}

extension Version {
    init?(array: [Int]) {
        guard array.count == 4 else { return nil }
        self.init(major: array[0], date: array[1], env: array[2], minor: array[3])
    }
    
    init?(string: String) {
        self.init(array: string.components(separatedBy: ".").compactMap(Int.init))
    }
}

protocol OptionalEquatable {
    static func ==(lhs: Self, rhs: Self) -> Bool?
    static func !=(lhs: Self, rhs: Self) -> Bool?
}

extension OptionalEquatable {
    static func !=(lhs: Self, rhs: Self) -> Bool? {
        guard let result = lhs == rhs else { return nil }
        return !result
    }
}

extension OptionalEquatable where Self: OptionalComparable {
    static func ==(lhs: Self, rhs: Self) -> Bool? {
        guard case let (less?, large?) = (lhs < rhs, lhs > rhs) else { return nil }
        return !(less != large)
    }
}

protocol OptionalComparable: OptionalEquatable {
    static func <(lhs: Self, rhs: Self) -> Bool?
    static func >(lhs: Self, rhs: Self) -> Bool?
    static func >=(lhs: Self, rhs: Self) -> Bool?
    static func <=(lhs: Self, rhs: Self) -> Bool?
}

extension OptionalComparable {
    static func >(lhs: Self, rhs: Self) -> Bool? {
        guard let result = lhs < rhs else { return nil }
        return !result
    }
    static func >=(lhs: Self, rhs: Self) -> Bool? {
        guard case let (compared?, equaled?) = (lhs < rhs, lhs == rhs) else { return nil }
        return !compared || equaled
        
    }
    static func <=(lhs: Self, rhs: Self) -> Bool? {
        guard case let (compared?, equaled?) = (lhs < rhs, lhs == rhs) else { return nil }
        return compared || equaled
    }
}


extension Optional: OptionalComparable where Wrapped: OptionalComparable {
    static func < (lhs: Optional<Wrapped>, rhs: Optional<Wrapped>) -> Bool? {
        guard case let (lhs?, rhs?) = (lhs, rhs) else { return nil }
        return lhs < rhs
    }
}

extension Optional: Comparable where Wrapped: Comparable {
    public static func < (lhs: Optional<Wrapped>, rhs: Optional<Wrapped>) -> Bool {
        return true
    }
}

struct X: OptionalComparable, Comparable {
    static func < (lhs: X, rhs: X) -> Bool? {
        return true
    }
    
    static func < (lhs: X, rhs: X) -> Bool {
        return false
    }
}


let x: X?  = X()
let y: X? = X()

y > x

//let versionString = "1.0.0.00"
//
//var version: Version?// = Version(string: versionString)
//
//var version2: Version? = Version(string: "1.0.0.203")
//
//
//version >= version2

