
import Foundation

let json = """
{
    "manuFacturer" : "Cessna",
    "model" : "172 Skyawk",
    "seats" : 4
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


struct Plane: Codable {
    let manuFacturer: String, model: String, seats: Seats
    
      var test: Int { return self.model.count    }
//
//    private enum CodingKeys: String, CodingKey {
//        case manuFacturer
//        case model
//        case seats
//    }
    /*
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.manuFacturer = try container.decode(String.self, forKey: .manuFacturer)
        self.model = try container.decode(String.self, forKey: .model)
        self.seats = try container.decode(Seats.self, forKey: .seats)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.manuFacturer, forKey: .manuFacturer)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.seats, forKey: .seats)
    }
     */
}


enum Seats: Int, Codable {
    case abc = 4
}

extension Plane {
//    var test: Int { return self.model.count    }
}
let decoder = JSONDecoder()
let plane = try! decoder.decode(Plane.self, from: json)
plane.manuFacturer
plane.model
plane.seats
plane.test


let encoder = JSONEncoder()
let reencodeJSON = try! encoder.encode(plane)

print(String(data: reencodeJSON, encoding: .utf8)!)

let planes = try! decoder.decode([Plane].self, from: jsonArray)


let jsonDictionary =   """
{ "planes" : [
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
}
""".data(using: .utf8)!
do {
let planeDics = try decoder.decode([String: [Plane]].self, from: jsonDictionary)
planeDics.forEach { print($0, $1) }
} catch {
    print(error.localizedDescription)
}

//extension Dictionary : Decodable where Key : Decodable, Value : Decodable {
//    // ...
//}
