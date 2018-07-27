//: [Previous](@previous)

import Foundation


struct RegexPattern {
    let pattern: String
    init(_ pattern: String) {
        self.init(pattern)
    }
}

extension String {
    static func ~=(pattern: String, input: String) -> Bool {
        let x = input
        let y = pattern
        return input.range(of: pattern, options: .regularExpression) != nil
    }
    
    static func ~=(pattern: RegexPattern, input: String) -> Bool {
        let x = input
        let y = pattern.pattern
        return input.range(of: pattern.pattern, options: .regularExpression) != nil
    }
}

let string = "121113"

let pattern = RegexPattern("12.*3")


switch string {
case pattern: print("x")
default: print("")
}


protocol X {
    associatedtype Y
}

class Y: X {
    typealias Y = <#type#>
    
    
}
