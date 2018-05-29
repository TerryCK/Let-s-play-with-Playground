import Foundation


extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illeagal regular expression: \(pattern).")
        }
    }
    
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}


let testString = "hat"

let range = NSRange(location: 0, length: testString.utf16.count)
let regex = NSRegularExpression("[a-z]at")

regex.firstMatch(in: testString, options: [], range: range) != nil


regex.matches("xxat")

extension String {
    static func ~= (lhs: String, rhs: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
        let range = NSRange(location: 0, length: lhs.utf16.count)
        return regex.firstMatch(in: lhs, options: [], range: range) != nil
    }
}


"AEB" ~= "A(CD|EF)B"

"cad" ~= "ca[a-z]*d"
"cad" ~= "ca[a-z]+d"
"cad" ~= "ca[a-z]?d"

@objc class Message: NSObject {
    @objc  var channel: Channel = Channel()
    
}

@objc class Channel: NSObject {
    
}

print("\(#keyPath(Message.channel))")






let a = "1.0929.3.3"
let b = "1.0929.3.1"
func compare(aVersion: String, bVersion: String) -> ComparisonResult {
    
    func compare(lhs: Int?, rhs: Int?) -> ComparisonResult? {
        if lhs != rhs, case let (lhs?, rhs?) = (lhs, rhs) {
            return lhs > rhs ? .orderedDescending : .orderedAscending
        }
        return nil
    }
    
    #if swift(>=4.1)
    let versionA = aVersion.components(separatedBy: ".").compactMap(Int.init)
    let versionB = bVersion.components(separatedBy: ".").compactMap(Int.init)
    #else
    let versionA = aVersion.components(separatedBy: ".").flatMap(Int.init)
    let versionB = bVersion.components(separatedBy: ".").flatMap(Int.init)
    #endif
    
    return compare(lhs: versionA.first, rhs: versionB.first) ??
        compare(lhs: versionA.last, rhs: versionB.last) ??
        .orderedSame
}

let result = compare(aVersion: a, bVersion: b)
print(String(describing: result.rawValue))


protocol Terry {
    
}

extension Terry {
    static var name: String { return "x" }
    
    func x() {
        print(Self.name)
    }
}


struct X : Terry {
    
}


let x = X()

x.x()
