import Foundation

enum Status: Int {
    case modified, create
}

struct Model {
    var property: Int {
        didSet{ self.status = .modified }
    }
    var modelName: String {
        didSet{ self.status = .modified }
    }
    var status: Status
    
    init(_ property: Int, modelName: String, status: Status = .create) {
        self.property = property
        self.modelName = modelName
        self.status = status
    }
}

extension Model: Equatable  {
    
    var hashValue: Int { return property ^ modelName.hashValue }
    
    static func ==(lhs: Model, rhs: Model) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}




var model1 = Model.init(1, modelName: "Model1")

var nonModifiedModel = Model.init(1, modelName: "Model2")



model1.status
model1.property = 10
model1.status

let modifiedArray: [Model] = [model1, nonModifiedModel].filter { $0.status == .modified }

modifiedArray.forEach {
    print("model name:", $0.modelName, "be modified")
}






























class MyInt {
    var property: Int
    init(property: Int) {
        self.property = property
    }
}


struct StructInt {
    var property: MyInt
}


let myInt = MyInt(property: 10)
let structInt = StructInt(property: myInt)

structInt.property.property = 20
myInt.property = 20

print(myInt.property)










