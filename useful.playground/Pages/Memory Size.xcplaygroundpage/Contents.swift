//MemoryLayout is an enum



struct Name {
    let name: String
    let age: Int
}

MemoryLayout<Int32>.size
MemoryLayout<Int64>.size

MemoryLayout<Int>.size
MemoryLayout<Int>.alignment
MemoryLayout<Int>.stride

MemoryLayout<Bool>.size


class CertifiedPuppy1 {
    let age: Int = 1
    let isTrained: Bool = true
    let isCertified: Bool = true
}


MemoryLayout<CertifiedPuppy1>.size        // 10
MemoryLayout<CertifiedPuppy1>.stride      // 16
MemoryLayout<CertifiedPuppy1>.alignment   // 8

struct CertifiedPuppy2 {
    let isTrained: Bool
    let age: Int
    let isCertified: Bool
}

MemoryLayout<CertifiedPuppy2>.size        // 17
MemoryLayout<CertifiedPuppy2>.stride      // 24
MemoryLayout<CertifiedPuppy2>.alignment   // 8

struct CertifiedPuppy3 {
    let isTrained: Bool
    let isCertified: Bool
    let age: Int
}

MemoryLayout<CertifiedPuppy3>.size        // 16
MemoryLayout<CertifiedPuppy3>.stride      // 16
MemoryLayout<CertifiedPuppy3>.alignment   // 8


