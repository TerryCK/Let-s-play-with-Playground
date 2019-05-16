
import Foundation

let json = """
{
    "ManuFacturer" : "Cessna",
    "model" : "172 Skyawk",
    "seats" : 4,
    "additional" : 5
}
""".data(using: .utf8)!


let jsonArray =   """
[
    {
    "manuFacturer" : "Cessna",
    "model" : "172 Skyawk",
    "seats" : 4,
    },
    {
"manuFacturer" : "Piper",
    "model" : "PA-28 Cherokee",
    "seats" : 4
    }
]
""".data(using: .utf8)!

enum Seats: Int, Codable {
    case abc = 4
}

struct Plane: Codable {
    let manuFacturer: String, model: String, seats: Seats
    
    
    private enum CodingKeys: String, CodingKey {
        case ManuFacturer
        case model
        case seats
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.manuFacturer = try container.decode(String.self, forKey: .ManuFacturer)
        self.model = try container.decode(String.self, forKey: .model)
        self.seats = try container.decode(Seats.self, forKey: .seats)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(manuFacturer, forKey: .ManuFacturer)
        try container.encode(model, forKey: .model)
        try container.encode(seats, forKey: .seats)
    }
    
}
let x: String? = "x"
let y = "x"

x == y



//extension Plane {
//    //    var test: Int { return self.model.count    }
//}

let plane = try! JSONDecoder().decode(Plane.self, from: json)
plane.manuFacturer
plane.model
plane.seats


//
//let encoder = JSONEncoder()
//let reencodeJSON = try! encoder.encode(plane)
//
//print(String(data: reencodeJSON, encoding: .utf8)!)
//
//let planes = try! decoder.decode([Plane].self, from: jsonArray)
//
//
//let jsonDictionary =   """
//{ "planes" : [
//    {
//    "manuFacturer" : "Cessna",
//    "model" : "172 Skyawk",
//    "seats" : 4,
//    },
//    {
//"manuFacturer" : "Piper",
//    "model" : "PA-28 Cherokee",
//    "seats" : 4
//
//    }
//]
//}
//""".data(using: .utf8)!
//
//do {
//    let planeDics = try decoder.decode([String: [Plane]].self, from: jsonDictionary)
//    planeDics.forEach { print($0, $1) }
//} catch {
//    print(error.localizedDescription)
//}
//
////extension Dictionary : Decodable where Key : Decodable, Value : Decodable {
////    // ...
////}


let test = """
{
    "TransID" : "Cessna",
    "TransferMode" : "172 Skyawk",
    "CurrencyCode" : "RMB",
    "Amount"    : 11.44,
    "TransactionDate" : "2019-10-31 03:35:56",
    "ProcessingTimeInterval" : "245",
    "CurrentFrontEndData" : {
                                "Status" : "validating",
                                "Remark" : "Remark",
                                "Action" : "Action"
                            },
    "NextFrontEndData" : {
                                "Status" : "validating",
                                "Remark" : "Remark",
                                "Action" : "Action",
                            }

}
""".data(using: .utf8)!




let promotionPayload = """
[
    {
        "bannerUrl": "",
        "description": "",
        "name": "Lucky Wheel - SPPT20161108001",
        "promoCode": "SPPT20161108001"
                }, {
        "bannerUrl": "",
        "code": "en-gb",
        "description": "",
        "name": "Re-Deposit-REDP20162508001-20160825",
        "promoCode": "REDP20162508001"
    }
]
""".data(using: .utf8)!



struct WelcomeElement: Codable {
    let bannerURL, description, name, promoCode: String
    let code: String?
    
    enum CodingKeys: String, CodingKey {
        case bannerURL = "bannerUrl"
        case description, name, promoCode, code
    }
}


let object = try! JSONDecoder().decode([WelcomeElement].self, from: promotionPayload)
object.first?.code
object.last?.code





let dpPayload = """
   {
   
    "deposite": ["deposit"],
    }
""".data(using: .utf8)!



struct Terry: Decodable {
    let withdrawal: [String]?
}

let terry = try! JSONDecoder().decode(Terry.self, from: dpPayload)

terry.withdrawal
