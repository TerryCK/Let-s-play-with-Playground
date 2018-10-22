//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


protocol SBK {
    var member:String { get }
}

protocol DNG {
    var member: String { get }
}

class Asia: SBK, DNG {
    var member: String {
        return "terry"
    }
}


let asia = Asia()

(asia as SBK).member
(asia as DNG).member
