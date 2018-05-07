protocol EnumCollection : Hashable {
    static var allCases: [Self] { get }
}

extension EnumCollection {
    
    static var allCases: [Self] {
        let anySequence = AnySequence { () -> AnyIterator<Self> in
            var index = 0
            return AnyIterator {
                let current : Self = withUnsafePointer(to: &index) {
                    print($0)
                    return $0.withMemoryRebound(to: self, capacity: 1) {
                        
                        return $0.pointee } }
                //                print(current)
                guard current.hashValue == index else { return nil }
                index += 1
                return current
            }
        }
        return Array(anySequence)
    }
}

//
//struct MyStruct: Hashable, ExpressibleByStringLiteral {
//    let name: String
//    init(stringLiteral: StringLiteralType) { name = stringLiteral }
//    var hashValue: Int { return name.hashValue }
//    static func ==(rhs: MyStruct, lhs: MyStruct) -> Bool { return rhs.name == lhs.name }
//}
//
//enum NoRawValueDNAEnum          : EnumCollection            {  case A, G, C, T }
//NoRawValueDNAEnum.allCases
//
//enum IntRawValueDNAEnum         : Int, EnumCollection       {  case A, G, C, T }
//IntRawValueDNAEnum.allCases
//
//
//enum StringRawValueDNAEnum      : String, EnumCollection    {  case A, G, C, T  }
//StringRawValueDNAEnum.allCases
//
//
//enum MyStructRawValueDNAEnum    : MyStruct, EnumCollection {   case A, G, C, T
//
//    var rawValue: MyStruct {  return MyStruct(stringLiteral: String(describing: self)) }
//    init?(rawValue: RawValue) {
//        switch rawValue.name {
//        case "A": self = .A
//        case "G": self = .G
//        case "C": self = .C
//        case "T": self = .T
//        default: return nil
//        }
//    }
//}
//MyStructRawValueDNAEnum.allCases

enum MyDNA: EnumCollection {
    case A(Int)
    case G(Int)
    case C(Int)
    case T(Int)
    
    var hashValue: Int {
        switch self {
        case  .A(let x): return x.hashValue <= 1 ? x.hashValue : 0
        case  .G(_): return 1
        case  .C(_): return 2
        case  .T(_): return 3
        }
    }
    
    static func ==(lhs: MyDNA, rhs: MyDNA) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

MemoryLayout<MyDNA>.size
//MemoryLayout<MyStructRawValueDNAEnum>.size
let allcase = MyDNA.allCases

