import Foundation

public struct Regex {
    let pattern: String
}

public protocol Matchable : StringProtocol {
    var regex: Regex { get }
    func matches(with regex: Regex, options: NSRegularExpression.Options) -> [String]
    func capturedGroups(with regex: Regex, options: NSRegularExpression.Options) -> [String]
}

extension Matchable {
    public  var regex: Regex { return  Regex(pattern: String(self)) }
}

extension String: Matchable {
    
    public func capturedGroups(with regex: Regex, options: NSRegularExpression.Options = []) -> [String] {
        return Array(matches(with: regex, options: options)[1...])
        let m = matches(with: regex, options: options)
        return m.count>1 ? Array(m.dropFirst()) : []
    }
    
    public func matches(with regex: Regex, options: NSRegularExpression.Options = []) -> [String] {
        guard let match = (try? NSRegularExpression(pattern: regex.pattern, options: options))?.firstMatch(in: self, options: [], range: NSRange(startIndex..., in: self)) else { return [] }
        return (0..<match.numberOfRanges).compactMap {
            return match.range(at: $0).location == NSNotFound ? nil : Range(match.range(at: $0), in: self).flatMap { String(self[$0]) }
        }
    }
}

"string".capturedGroups(with: #"(^[a-zA-Z]$)"#.regex)


//
//func test1() {
//    let string = "localhost-error.xxx/iaj/adji/withdrawal"
//
//    let m = string.matches(with: "localhost-error.*/([^/]*)/(withdrawal|deposit)".regex)
//    let c = string.capturedGroups(with: "localhost-error.*/([^/]*)/(withdrawal|deposit)".regex)
//    print("matches: ", m)
//    print("groups: ", c)
//
//}
//func test2 (){
//    let string = "test"
//    let m = string.matches(with: "test".regex)
//    let c = string.capturedGroups(with: "test".regex)
//    print("matches: ", m)
//    print("groups: ", c)
//}
//
////test2()
//
//func test3() {
//    let string = "test"
//    let m = string.matches(with: "(test)".regex)
//    let c = string.capturedGroups(with: "(test)".regex)
//    print("matches: ", m)
//    print("groups: ", c)
//}
//
//["s", "g"] == ["s", "g"]
//string.capturedGroups(with: "localhost-error.*/([^/]*)/(withdrawal|deposit)".regex)
