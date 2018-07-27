

import Foundation


extension String {
    func compare<T>(_ aString: T, options mask: String.CompareOptions, range: Range<String.Index>? = nil, locale: Locale? = nil) -> ComparisonResult where T : StringProtocol {
        return compare(aString, options: mask, range: range, locale: locale)
    }
}

let json = """
{
    "miniVersion" : "0.0.0.1",
    "currentVersion" : "0.0.0.3",
    "downloadUrl" : "test URL"
}
""".data(using: .utf8)!


public struct ServerVersionInfo : Codable {
    
    public var miniVersion      : Version
    public var currentVersion   : Version
    public var downloadUrl      : String
}

public struct Version: Codable {
    let info: String
    let major: String, date: String, env: String, minor: String
    let numbers: [String]
    
    public enum Index {
        case major, date, env, minor
    }
}

extension Version {
    public init(from decoder: Decoder) throws {
        let info = try decoder.singleValueContainer().decode(String.self)
        let result = info.components(separatedBy: ".")
        self.init(info: info, major: result[0], date: result[1], env: result[2], minor: result[3], numbers: result)
    }
    
    public func getString(with index : Index...) -> String {
    index.forEach{ print(numbers[$0.hashValue]) }
        
        
        return index.map { numbers[$0.hashValue] }.joined(separator: ".")
    }
    private var stringForCompare: String {
        return getString(with: .major, .minor)
    }
}
extension Version: CustomStringConvertible {
    public var description: String {
        return info
    }
}

extension Version: Comparable {
    public static func < (lhs: Version, rhs: Version) -> Bool {
        return true
    }
    
    public static func == (lhs: Version, rhs: Version) -> Bool {
        return lhs.stringForCompare.compare(rhs.stringForCompare, options: .numeric) == .orderedSame
    }
    
}

do {
    let server = try JSONDecoder().decode(ServerVersionInfo.self, from: json)
    print(server.currentVersion.date)
    print(server.miniVersion)
    let curr = server.currentVersion
    let mini = server.miniVersion
    print(curr == mini)
} catch { print(error) }



