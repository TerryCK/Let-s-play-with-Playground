//: Playground - noun: a place where people can play

import UIKit



let numbers = [[1,2,3,],[4,5,6], [6,7,8]]

//let joineds = Array(numbers.joined())

let joined = numbers.joined()

print(joined)





// POP and OOP

class MyClass {
    func method() {
        print("myClass method execute")
    }
}

class MySubclass: MyClass {
    override func method() {
        print("subclass method execute")
    }
}

protocol MyProtocol {
    func myMethod()
}

extension MyProtocol {
    //default myProtocol
    // property  methods
    func myMethod(){
        print("default method execute")
    }
}


struct MyStruct: MyProtocol {
    func myMethod() {
        print("struct override method execute")
    }
}


struct MyStruct2: MyProtocol {
    
}

let myClass = MyClass()
let mySubclass = MySubclass()

myClass.method()
mySubclass.method()

let myStruct = MyStruct()
let myStruct2 = MyStruct2()

myStruct.myMethod()
myStruct2.myMethod()



