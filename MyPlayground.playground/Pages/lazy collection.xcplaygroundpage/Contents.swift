import Foundation


extension String {
    func capturedGroups(with regexPattern: String) -> [String] {
        var results = [String]()
        
        guard let regex = try? NSRegularExpression(pattern: regexPattern, options: []),
            let match = regex.matches(in: self, options: [], range: NSRange(location:0, length: count)).first else { return [] }
        
        let lastRangeIndex = match.numberOfRanges - 1
        
        for i in 1...lastRangeIndex where lastRangeIndex >= 1 {
            let capturedGroupIndex = match.range(at: i)
            let matchedString = (self as NSString).substring(with: capturedGroupIndex)
            results.append(matchedString)
            
        }
        return results
    }
}
"https://mapp-spi-ios.xn--lwt4w556c9ycg58a.com".capturedGroups(with: "\\.(.*)").joined()

/* //
struct ProjectConfig {
    
    static var nameSpace : String? {
        return String(reflecting: self).components(separatedBy: ".").last
    }
}
print(ProjectConfig.nameSpace)
let projectConfig = ProjectConfig()
String(reflecting: projectConfig)
// */
 
