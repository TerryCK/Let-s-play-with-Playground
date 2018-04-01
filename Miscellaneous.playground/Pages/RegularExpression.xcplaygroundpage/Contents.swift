import Foundation

let string = "https://mapp-spi-ios.xn--lwt4w556c9ycg58a.com"


let goalDomainSuffix = "xn--lwt4w556c9ycg58a.com"




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
let regex = "\\.[A-Za-z0-9.-_\\-\\.]$"

let x = matches(for: regex, in: string).joined()


x == goalDomainSuffix




//sed -iE "s#\(^ *pod *'${PodName}' *,*\)\( *:git *=> *'.*' *,*\) *:[a-z]* *=> *'.*'.*#\1\2 :${GitCheckOutType} => '${Env}'#" ${Podfile}
//
//#sed -iE "s#\(^ *pod *'iOS-SPIService' *,*\)\( *:git *=> *'.*' *,*\) *:[a-z]* *=> *'.*'.*#\1\2 :branch => '${Env}'#" ${Podfile}

