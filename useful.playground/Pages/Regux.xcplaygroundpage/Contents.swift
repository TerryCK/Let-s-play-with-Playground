import Foundation


func matches(for regex: String, in text: String) -> [String] {
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}




let string = "https://mapp-spi-ios.xn--lwt4w556c9ycg58a.com"
let goalDomainSuffix = "xn--lwt4w556c9ycg58a.com"


let regex = "\\.[A-Za-z0-9.-_\\-]+\\.[A-Za-z]{1,3}$"
let x = matches(for: regex, in: string).joined().dropFirst()

x == goalDomainSuffix


extension String {
    func capturedGroups(withRegex pattern: String) -> [String] {
        var results = [String]()
        var regex: NSRegularExpression
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { return [] }
        
        let range = NSRange(location:0,
                            length: count)
        
        let matches = regex.matches(in: self,
                                    options: [],
                                    range: range)
        
        guard let match = matches.first else { return [] }
        
        let lastRangeIndex = match.numberOfRanges - 1
        
        
        for i in 1...lastRangeIndex where lastRangeIndex >= 1 {
            let capturedGroupIndex = match.range(at: i)
            let matchedString = (self as NSString).substring(with: capturedGroupIndex)
            results.append(matchedString)
            
        }
        
        return results
    }
    
}

string.capturedGroups(withRegex: "\\.(.*)")

string.capturedGroups(withRegex: "\\.(.*)").joined() == goalDomainSuffix


let  dic = ["s": 10]

