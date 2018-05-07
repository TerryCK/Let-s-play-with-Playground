import UIKit

protocol TerryProtocol {
    var myProperty: Int { get }
    var enumProperty: A { get }
}

enum A {
    case b
    case c
}


class Terry: UIViewController, TerryProtocol{
    var myProperty: Int { return  10 }
    var enumProperty: A { return .b }
    func testfunc() -> Int {
        return myProperty
    }
}


class TerrySon: Terry {
    override var myProperty: Int { return 20 }
    override var enumProperty: A { return .c }
}

let terrySon = TerrySon()
terrySon.testfunc()
terrySon.enumProperty

