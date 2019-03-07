

import Foundation


public struct Regex {
    public let pattern: String
}

public protocol RegexMatchable : StringProtocol {
    static func ~=(regex: Regex, input: Self) -> Bool
    func match(regex: Regex) -> Bool
}


extension RegexMatchable {
    
    public var regex: Regex { return Regex(pattern: String(self)) }
    
    public func match(regex: Regex) -> Bool {
        return regex ~= self
    }
    
    public static func ~=(regex: Regex, input: Self) -> Bool {
        return String(input).range(of: regex.pattern, options: .regularExpression) != nil
    }
}
extension String: RegexMatchable {}

extension Optional where Wrapped: RegexMatchable {
    
    public static func ~=(regex: Regex, input: Optional<Wrapped>) -> Bool {
        return input?.match(regex: regex) ?? false
    }
}

extension Collection where Element == Regex {
    func contains(_ string: String) -> Bool {
        return reduce(false) { $0 || $1 ~= string }
    }
}



extension String {
    func match(regex: [Regex]) -> Bool {
        return regex.reduce(false) { $0 || $1 ~= self }
    }
}

let url = URL(string: "1234")
url?.absoluteString.contains("123")

let matchArray = ["123","y"].map { $0.regex }
matchArray.contains("12345")

switch url?.absoluteString {
    
case .some(let url) where url.match(regex: ["123".regex, "324".regex]): print(url)

case "1234"?: print(url)
    
    
default: print("mis Match")
}
