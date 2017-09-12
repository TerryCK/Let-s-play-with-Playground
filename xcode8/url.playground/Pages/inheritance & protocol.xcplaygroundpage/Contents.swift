
import Foundation

protocol AProtocolable {
    func AFunction()
    
}
extension AProtocolable {
    func AFunction() {
        print("gg")
    }
}
class MyClass: AProtocolable {
    let name: String
    init(name: String ) {
        self.name = name
    }
}

let myClass = MyClass(name: "Terry")

myClass.name
myClass.AFunction()


class mySubclass: MyClass {
    
}

let subClass = mySubclass(name: "Terry2")
subClass.AFunction()

