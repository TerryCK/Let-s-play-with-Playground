
import Foundation
// declaration
extension Bundle {
    class func selfBundle<Metadata: AnyObject>(typeof metadata: Metadata) -> Bundle {
        return Bundle(for: type(of: metadata.self))
    }
}
class MyClass {
    func aFunc()-> Bundle {
        return Bundle(for: type(of: self))
    }
    func bundle(_ bundle: Bundle) -> Bundle {
        return bundle
    }
}
// usage
let myClass = MyClass()
let afunc = myClass.aFunc()
print("")
let bundle = myClass.bundle(.selfBundle(typeof: myClass))
// Verify
bundle === afunc






