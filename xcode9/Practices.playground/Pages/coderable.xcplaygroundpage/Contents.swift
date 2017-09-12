import Foundation

struct Swifter: Decodable {
    let fullName: String
    let id: Int
    let twitter: URL
}

enum SwifterOrBool: Decodable {
    case swifter(Swifter)
    case bool(Bool)
}

extension SwifterOrBool {
    enum CodingKeys: String, CodingKey {
        case swifter, bool
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let swifter = try container.decodeIfPresent(Swifter.self, forKey: .swifter) {
            self = .swifter(swifter)
        } else {
            self = .bool(try container.decode(Bool.self, forKey: .bool))
        }
    }
}

let json = """
[{
"swifter": {
   "fullName": "Federico Zanetello",
   "id": 123456,
   "twitter": "http://twitter.com/zntfdr"
  }
},
{ "bool": true },
{ "bool": false },
{
"swifter": {
   "fullName": "Federico Zanetello",
   "id": 123456,
   "twitter": "http://twitter.com/zntfdr"
  }
}]
""".data(using: .utf8)! // our native (JSON) data

enum Enumation {
    case oneEnumation
}
let x = Enumation.self
let myEnumArray = try JSONDecoder().decode([SwifterOrBool].self, from: json) // decoding our data

myEnumArray.forEach { print($0) } // decoded!





























protocol Aprotocol {
    
}



class AProtocolClass:Aprotocol {
    
}
let aProtocolClass = AProtocolClass()

//let aProtocol:Aprotocol?

let _ = aProtocolClass.self is Aprotocol

let string = type(of: "")



let y = 1.1 is Double











