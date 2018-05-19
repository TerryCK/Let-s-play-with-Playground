//
//func terry(x: Int?, closure: (Bool) -> Void) {
////    defer { print("test") }
//    if let x = x {
//        print(x)
//        closure(true)
//        print(x)
//    }
//    closure(false)
//}
//
//func closure(bool: Bool) {
//    print(bool)
//}
//
//
//terry(x: 10, closure: closure)

class A {
    var errCode: Int = 10
    
    convenience init(errCode: Int? = 10) {
        self.init()
        guard let errCode = errCode else { return }
        self.errCode = errCode
    }
    
    convenience init(errorCode: Int? = nil) {
        self.init()
        errorCode.map { self.errCode = $0 }
    }
}

let a = A(errorCode: nil).errCode



