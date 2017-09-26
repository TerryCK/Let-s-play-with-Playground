import UIKit
var str = "hello"

var newStr = str + " Terry"

for charater in newStr.characters {
    print(charater)
}


let newTypeString = NSString(string: newStr)
newTypeString.substring(to: 5)
newTypeString.substring(from: 6)

NSString(string: newTypeString.substring(from: 6)).substring(to: 3)
newTypeString.substring(with: NSRange(location: 6, length: 3))

if newTypeString.contains("Terry") {
    print("Terry")
}

newTypeString.components(separatedBy: " ")
