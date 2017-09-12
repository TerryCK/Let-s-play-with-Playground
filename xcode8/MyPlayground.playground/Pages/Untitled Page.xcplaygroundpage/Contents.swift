//// tuple 
//
//let myinfo = ("Terry", 27, 175)
//
//myinfo.0
//
//let (name, age, myheight) = myinfo
//
//let (_, _, height) = myinfo
//height
//
//let herinfo = (name:"Bob", age: 24, height: 175)
//
//herinfo.age
//
//let constant: Int
//
//constant = 1
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////
//
//var score = 25
//
//if score < 60 {
//    score += 50
//    
//} else {
//    score += 20
//}
//
//var score2 = 25
//
//score2 += (score2<60) ? 50 : 20
//
//print(score2)
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//// optional type
//
//var optionalIntNone: Int?
//var optionalInt: Int? = 10
//
//
//
//
//let parameter = optionalInt ?? 0
//let parameter2 = optionalIntNone ?? 5
//
//optionalIntNone == nil ? 0 : optionalIntNone!
//
//let defaultColor = "red"
//var userDefinedColor: String?
//var colorToUse = userDefinedColor ?? defaultColor
//
//userDefinedColor = "green"
//
//colorToUse = userDefinedColor ?? defaultColor
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//// Strings
//
//let someString = "Some string literal value"
//
//// Initialize string
//
//var emptyString = ""
//var anotherEmptyString = String()
//
//// mutable string 
//var variableString = "Book"
//
//let constantString = variableString
//
//variableString = "cat" + " " + constantString
//
//
//
//for Character in variableString.characters {
//    print(Character)
//}
//
//
//var arrString = ["Apple", "Egg"]
//var arrStringAnother = ["Banana", "Origin"]
//arrString += arrStringAnother
//arrString.insert("Melon", at: 0)
//let x = arrStringAnother.remove(at: 0)
//arrString
//
//print(arrString.removeLast())
//print(x)
//
//let set: Set = [1,2,3,4,5]
//let set2: Set = [2,4,12,3,51,21,4]
//set.forEach {
//print($0)
//}
//
//
//
//
//
//
//
//
//
//
//
//// dictionary
//
//
//var someDic = [String: String]()
//var anotherDic: Dictionary<String, String>
//
//someDic["String"] = "String"
//
//
//
//someDic = [:]
//
//
//someDic = ["Terry": "handosme", "Bob": "Great", "jerry": "badman"]
//
//someDic.count
//
//
//
//
////hight order function
//
//typealias callerType = (String, String) -> String
//
//func caller(function: callerType) -> Void {
//    let result = function("Hello", "David")
//    print(result)
//}
//caller(function: { $0 + " " + $1 })
//
//typealias completed = () -> ()
//typealias respons = String
//typealias data = Data
//typealias error = Error
//func download(complietedHandler: @escaping (respons , data,             error?) -> ()) {
//    
//    complietedHandler()
//}
//
//
//download
//
//
//
//
//
//
//
//
