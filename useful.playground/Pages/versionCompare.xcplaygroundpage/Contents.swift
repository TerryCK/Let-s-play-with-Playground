
import Foundation

fileprivate func < <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?): return l < r
    case (nil, _?)   : return true
    default          : return false
    }
}

fileprivate func > <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?): return l > r
    default          : return rhs < lhs
    }
}

typealias Version = String

fileprivate extension Version {
    var toVersionIntArray: [Int] {
        return self.components(separatedBy: ".").flatMap(Int.init)
    }
}

class VersionUpdator {
    
    static func versionCompareWithKeyPath(_ aVersion: Version, bVersion: Version) -> ComparisonResult {
        
        let (aVersions, bVersions) = (aVersion.toVersionIntArray, bVersion.toVersionIntArray)
        let (first, last) = (\[Int].first, \[Int].last)
        
        func compara(with keyPath: KeyPath<[Int], Int?>) -> ComparisonResult? {
            guard aVersions[keyPath: keyPath] != bVersions[keyPath: keyPath] else { return nil }
            return aVersions[keyPath: keyPath] > bVersions[keyPath: keyPath] ? .orderedDescending : .orderedAscending
        }
        
        return compara(with: first) ?? compara(with: last) ?? .orderedSame
    }
    
    
    static func versionCompare(_ aVersion:String, bVersion:String) -> ComparisonResult {
       
        let aVersions = aVersion.components(separatedBy: ".").flatMap(Int.init)
        let bVersions = bVersion.components(separatedBy: ".").flatMap(Int.init)
        
        if aVersions.first != bVersions.first {
            return aVersions.first > bVersions.first ? .orderedDescending : .orderedAscending
        }
        
        if aVersions.last != bVersions.last {
            return aVersions.last > bVersions.last  ? .orderedDescending : .orderedAscending
        }
          return .orderedSame
    }
    
    
        static func versionCompareOrigin(_ aVersion:String, bVersion:String) -> ComparisonResult {
        if aVersion.components(separatedBy: ".").first != bVersion.components(separatedBy: ".").first {
            return Int(aVersion.components(separatedBy: ".").first!) >
                Int(bVersion.components(separatedBy: ".").first!) ?
                    .orderedDescending : .orderedAscending
        }

        if aVersion.components(separatedBy: ".").last != bVersion.components(separatedBy: ".").last {
            return Int(aVersion.components(separatedBy: ".").last!)! >
                Int(bVersion.components(separatedBy: ".").last!)! ?
                    .orderedDescending : .orderedAscending
        }

        return .orderedSame
    }
    
}

let versionA = "12.0927.2.55"
let versionB = "1.0927.2.54"


VersionUpdator.versionCompare(versionA, bVersion: versionB) ==
VersionUpdator.versionCompareWithKeyPath(versionA, bVersion: versionB)


enum VersionUpdatorTerry {
    case suggest, latest, force
}

print(type(of: VersionUpdatorTerry.self))




