protocol EnumCollection : Hashable {}

extension EnumCollection {
    static func cases() -> AnySequence<Self> {
        typealias S = Self
        return AnySequence { () -> AnyIterator<S> in
            
            var raw = 0
            print(raw)
            let anyIterator = AnyIterator { () -> Self? in
                let current : Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: S.self, capacity: 1) { $0.pointee } }
                print(current, raw)
                guard current.hashValue == raw else { return nil }
                raw += 1
                return current
            }
            print("after,", raw)
            return anyIterator
        }
    }
}
enum RNA: String {
    case U, G, C, A
}

RNA.U.hashValue
RNA.U.rawValue.hashValue
enum Terry: EnumCollection {
    var hashValue: Int { return 0}
    
    static func ==(lhs: Terry, rhs: Terry) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    case age(Int)
}


enum DNA: EnumCollection {
    case T, G, C, A
}

let result = DNA.cases()

let cases = Array(result)
cases.first?.hashValue


RNA.A.hashValue
RNA.C.hashValue

