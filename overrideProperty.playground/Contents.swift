import Foundation

class A {
    var x: String = ""
}

class B: A {
    var string: String = ""
    
    override var x: String {
        set { string = newValue }
        
        get { return string }
    }
}



let b = B()
b.x = "10"
print(b.string)

