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










class Tutorial: Codable {
    let title: String
    let author: String
    let editor: String
    let type: String
    let publishDate: Date
    
    init(title: String, author: String, editor: String, type: String, publishDate: Date) {
        self.title = title
        self.author = author
        self.editor = editor
        self.type = type
        self.publishDate = publishDate
    }
}

let tutorial = Tutorial(title: "What's New in Swift 4?", author: "Cosmin Pupăză", editor: "Simon Ng", type: "Swift", publishDate: Date())

let encoder = JSONEncoder()
let data = try encoder.encode(tutorial)
let string = String(data: data, encoding: .utf8)


let decoder = JSONDecoder()
let decodedData = try decoder.decode(Tutorial.self, from: data)
let info = "\(decodedData.title)"






























class Author {
    let name: String
    let tutorial: Tutorial
    
    init(name: String, tutorial: Tutorial) {
        self.name = name
        self.tutorial = tutorial
    }
}
let author = Author(name: "Cosmin Pupăză", tutorial: tutorial)





let authorNameKeyPath = \Author.name
let authorName = author[keyPath: authorNameKeyPath]





let tutorialTitleKeyPath = \Author.tutorial.title
let title = author[keyPath: tutorialTitleKeyPath]
//author[keyPath: tutorialTitleKeyPath] = "title change"


//print(author[keyPath: tutorialTitleKeyPath])














class JukeBox {
    var song: String
    
    init(song: String) {
        self.song = song
    }
}

let jukeBox = JukeBox(song: "Nothing else matters")
let jukeBoxSongKeyPath = \JukeBox.song

jukeBox[keyPath: jukeBoxSongKeyPath] = "Stairway to heaven"



//protocol Drawable {}
//protocol Colourable {}
//class Shape {}
//class Line {}
//
//class cicle: Shape, Drawable , Colourable {}
//
//
//class Circle: Shape, Drawable, Colourable {}
//class Rectangle: Shape, Drawable, Colourable {}
//class Square: Shape, Drawable, Colourable {}
//
//class StraightLine: Line, Drawable {}
//class DottedLine: Line, Drawable {}
//
//let circle: Circle
//let rectangle: Rectangle
//let square: Square
//
//let straightLine: StraightLine
//let dottedLine: DottedLine
//
//
//
//let newCircle: Drawable & Colourable
//let newRectangle: Drawable & Colourable
//let newSquare: Drawable & Colourable


//
//typealias DrawableColourable = Drawable & Colourable
//
//let anotherCircle: DrawableColourable
//let anotherRectangle: DrawableColourable
//let anotherSquare: DrawableColourable



let array = [1,3,23,12,123,123,212,3]
let halfIndex = (array.count - 1) / 2
let openFirstHalf = array[0..<halfIndex]
let closedFirstHalf = array[0...halfIndex]


let openFirstSlice = array[..<halfIndex]



for (index, value) in zip(1..., array) {
    print("\(index): \(value)")
}

//image the iterator is a "pointer"


let tupleArray = [("Monday", 30),  ("Tuesday", 25),  ("Wednesday", 27),  ("Thursday", 20),  ("Friday", 24),  ("Saturday", 22),  ("Sunday", 26)]
let dictionary = Dictionary(uniqueKeysWithValues: tupleArray)

let keys = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
let values = [30, 25, 27, 20, 24, 22, 26]
let newDictionary = Dictionary(uniqueKeysWithValues: zip(keys, values))

let anotherDictionary = Dictionary(uniqueKeysWithValues: zip(1..., values))

let duplicatesArray = [("Monday", 30),  ("Tuesday", 25),  ("Wednesday", 27), ("Thursday", 20),  ("Friday",   24),  ("Saturday", 22),  ("Sunday", 26),  ("Monday", 28)]
let noDuplicatesDictionary = Dictionary(duplicatesArray, uniquingKeysWith: min)

let duplicateTuples = [("Monday", 28),  ("Tuesday", 27)]
var mutatingDictionary = Dictionary(uniqueKeysWithValues: tupleArray)
mutatingDictionary.merge(duplicateTuples, uniquingKeysWith: min)
let updatedDictionary = mutatingDictionary.merging(duplicateTuples, uniquingKeysWith: min)












var seasons = ["Spring" : 20, "Summer" : 30, "Autumn" : 10]
seasons["Autumn", default: 0] += 5

let winterTemperature = seasons["Winter", default: 0]






let mappedArray = seasons.map{season in (season.key, season.value * 2)}

print(mappedArray)

mappedArray.forEach { (key, value) in
    print("\(key):, \(value)")
}

let scores = [7, 20, 5, 30, 100, 40, 200]
let groupedDictionary = Dictionary(grouping: scores) { String($0).count }

groupedDictionary.forEach { (key, value) in
    print("\(key):, \(value)")
}



let multiLineStringSwift4 = """
You can display strings
on multiple lines by placing a
\""" delimiter on a separate line
both right at the beginning
and exactly at the very
end of it
and don't have to "escape" double quotes
"" in Swift 4.
"""

print(multiLineStringSwift4)




let swift4String = "Swift 4"
let filteredSwift4String = swift4String.filter{Int(String($0)) == nil}
print(filteredSwift4String)

