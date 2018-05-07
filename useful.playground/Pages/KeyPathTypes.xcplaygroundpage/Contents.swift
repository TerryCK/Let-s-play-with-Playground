import Foundation


//     AnyKeyPath
//        |
//        v
// PartialKeyPath<Root>
//        |
//        v
// KeyPath<Root, Value>
//        |
//        v
// WritableKeyPath<Root, Value>
//        |
//        v
// ReferenceWritableKeyPath<Root, Value>



class PeopleClass {
    let name: String? = nil
    var age: Int? = nil
}

struct PeopleStruct {
    let name: String?
    var age: Int?
}

let constRefKeyPathType =  \PeopleClass.name      // KeyPath<PeopleClass, String?>
type(of: constRefKeyPathType)

let varRefKeyPathType =  \PeopleClass.age         // ReferenceWritableKeyPath<PeopleClass, Int?>
type(of: varRefKeyPathType)


let constValueKeyPathType =  \PeopleStruct.name   // KeyPath<PeopleStruct, String?>
type(of: constValueKeyPathType)

let varValueKeyPathType =  \PeopleStruct.age      // WritableKeyPath<PeopleStruct, Int?>
type(of: constValueKeyPathType)


