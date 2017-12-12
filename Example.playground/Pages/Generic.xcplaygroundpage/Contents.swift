import Foundation

class FOO<T> {
    var t: T?
    init(_ aT: T? = nil) {
        t = aT
    }
}

typealias Completed = () -> ()

class DEEMO_TEST {
    let f = FOO<Completed> ()
    func demo() {
        f.t!()
        f.t?()
        
    }
}


