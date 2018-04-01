enum dataSourct {
    case x
    static var y: Int {return 1}
}


let anyType: AnyObject = dataSourct.x as AnyObject

enum Test: Int {
    case A = 1, B = 3
}
[1,2,3].map(Test.init)
let x: Array<Int>? = [1,2,3]



let h = Array(1...100).filter { $0 > 1 }.first!
print(h)

let z = Array(1...100).first { $0 > 1 }!
print(z)


let y = [1,3,5,2].first { $0 > 1 }!
print(y)

var property: Int = 10
func property(x: Int) -> Int {
return 1
}

print(property)
print(property(x: 10))
let input: Int? = 1
let input2: Int? = nil
guard case let (x?,y?) = (input, input2) else {
    fatalError()
}
print(x,y)
