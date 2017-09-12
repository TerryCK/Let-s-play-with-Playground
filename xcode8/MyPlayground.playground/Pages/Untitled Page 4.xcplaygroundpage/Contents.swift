class Country {
    let name: String
    
    var capitalCity: City!
    
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    
    
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
        
    }
    
    
}


var country = Country(name: "Japan", capitalName: "Tokyo")
country.capitalCity
country.name


/// closure strong reference

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = { [unowned self] in
        
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
        
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("deinit")
    }
}


var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello, world")

print(paragraph!.asHTML)


paragraph = nil




class Room {
    let name: String
    init(name: String) { self.name = name }
}


class NewPerson {
    var residence: NewResidence?
    
}

class NewResidence {
    var rooms = [Room]()
    var numberOfRooms : Int {
        return rooms.count
    }
    
    subscript(i:Int) -> Room {
        get {
            return rooms[i]
        }
        set  {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("有\(numberOfRooms)間房間")
    }
}

let jack = NewPerson()

if let firstRoomName = jack.residence?[0].name {
    print("第一個房間")
} else {
    print("無法")
}










let jackHouse = NewResidence()
jackHouse.rooms.append(Room(name: "bedroom"))
jackHouse.rooms.append(Room(name: "showerRoom"))


jack.residence = jackHouse

jack.residence?.rooms[0].name














var testScores = [
    "Dave" : [86, 82, 84],
    "Bev"  : [79, 94, 81]
]

testScores["Dave"]?[0] = 91

testScores["Bev"]?[0] += 1
testScores["Dave"]

































