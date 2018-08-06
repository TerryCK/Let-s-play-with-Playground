


import Foundation

precedencegroup CompositionPrecedence {
    associativity: left
}
infix operator |>: CompositionPrecedence


func |><T,V,Z>(lhs: @escaping (T)-> V, rhs: @escaping (V)-> Z) -> (T) -> Z {
    return { rhs(lhs($0)) }
}

func getString(a: Int) -> String {
    return String(a)
}

func getInt(a: Double) -> Int {
    return Int(a)
}

let x  = String.init(Int(10))
let prosess = getInt |> getString




switch Optional.some("faqs") {
case let x where ["x", "faqs"].contains(x): print("matched")
case "faqs": print("matched!")
default: print("not mached")
}
