

enum Life {
    case cycle
}

var x : Life? = .cycle

x == .cycle

x = nil

x == .cycle


let array1: [Int?] = [1,2,3,4,5]
let array2 = array1

[array1, array2].flatMap { $0 }.flatMap { $0 }.forEach { print($0) }




