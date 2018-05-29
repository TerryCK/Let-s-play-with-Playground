import Foundation

class AVLTree<T: Comparable> {
    var key: T?
    var left: AVLTree?
    var right: AVLTree?
}
// switch
class MaintenanceViewController {
    
}
class ForbiddenAccessViewController {
    
}
func string(str: String?) {
    switch str {
    case "xxx": print("3x")
    case NSStringFromClass(MaintenanceViewController.self): print("yes")
    default : break
    }
}


let x = NSStringFromClass(MaintenanceViewController.self)
print(x)

string(str: x)

//
//enum TransitionType : RawRepresentable {
//
//    case maintenance
//    case forbiddenAccess
//    case none
//
//    typealias RawValue = String?
//    init?(rawValue: RawValue) {
//        switch rawValue {
//        case NSStringFromClass(MaintenanceViewController.self)?: self = .maintenance
//        default: self = .none
//            <#code#>
//        }
//
//
//
//
//
//        if let string = rawValue {
//            switch string {
//            case NSStringFromClass(MaintenanceViewController.self):
//                self = .maintenance
//            case NSStringFromClass(ForbiddenAccessViewController.self):
//                self = .forbiddenAccess
//            default:
//                self = .none
//            }
//        } else {
//            self = .none
//        }
//    }
//    var rawValue: RawValue {
//
//        switch self {
//        case .maintenance:
//            return NSStringFromClass(MaintenanceViewController.self)
//        case .forbiddenAccess:
//            return NSStringFromClass(ForbiddenAccessViewController.self)
//        default:
//            return nil
//        }
//    }
//}


