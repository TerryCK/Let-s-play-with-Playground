import UIKit
import Foundation


func aFunctionWithaValueType() {
    let value = 10
    
    let x = 20
    
    sizeof(value)
    sizeof(x)
    //    print("number1 in aFunction():", number1)
    //    let size = sizeof(number1)
}

func aFunctionWithaReferenceType() {
    let view = UIView()
    sizeof(view)
    //    let size = sizeof(view)
}


let referenceFunction = aFunctionWithaReferenceType
let valuetypeFunction = aFunctionWithaValueType

sizeof(referenceFunction)
sizeof(valuetypeFunction)
referenceFunction()
valuetypeFunction()









report_memory()






func funcWithValueType() {
    var s = 1
    NSString(format: "%p", address(&s))
    
    var sCopybyValue = s
    NSString(format: "%p", address(&sCopybyValue))
    
}


func funcWithRefType() {
    var obj = NSObject()
    NSString(format: "%p", addressHeap(obj))
    withUnsafePointer(to: &obj) { print("address:", $0)    }
    var objCopyRef = obj
    withUnsafePointer(to: &objCopyRef) { print("address:", $0)   }
    NSString(format: "%p", addressHeap(objCopyRef))
 
}


funcWithValueType()
funcWithRefType()
sizeof(String.self)





//
//class aClassWithValueType {
//     let x = 10
//     let y = x
//}

//
//
//class aClassWithRefType {
//     let view = UIView()
//    lazy var view2: UIView {  return self.view }
//    func a() {
//        print(view2)
//    }
//    
////    func a() {
////        let view = UIView()
//////        let view2 = view
////        print(view)
////    }
//}
//class_getInstanceSize(aClassWithRefType.self)
//class_getInstanceSize(aClassWithValueType.self)
//
////
//aFunctionWithaValueType()
//aFunctionWithaReferenceType()





import UIKit


func address(_ o: UnsafeRawPointer) -> Int {
    return unsafeBitCast(o, to: Int.self)
}

func addressHeap<T: AnyObject>(_ o: T) -> Int {
    return unsafeBitCast(o, to: Int.self)
}

let aInt = "1"
print(address(aInt))


//struct myStruct {
//    var a: Int
//}
//
//class myClas {
//    
//}
////struct
//var struct1 = myStruct(a: 5)
//var struct2 = struct1
////print(NSString(format: "%p", address(&struct1))) // -> "0x10f1fd430\n"
////print(NSString(format: "%p", address(&struct2))) // -> "0x10f1fd438\n"
//
////String
//var s = "A String"
//var aa = s
//
//print("")
//print(NSString(format: "%p", address(&s))) // -> "0x10f43a430\n"
//print(NSString(format: "%p", address(&aa))) // -> "0x10f43a448\n"
//print("above is unique memory address with value type\n")
////Class
//var class1 = myClas()
//var class2 = class1
//print(NSString(format: "%p", addressHeap(class1))) // -> 0x7fd5c8700970
//print(NSString(format: "%p", addressHeap(class2))) // -> 0x7fd5c8700970
//print("above is pointing in the same address with reference type \n")
//
//
//var x = 10.0
//sizeof(address(&x))
//sizeof(addressHeap(class2))
////Unmanaged.passUnretained(class1).toOpaque()
////Unmanaged.passUnretained(class2).toOpaque()
//
//




func sizeof <T> (_ : T.Type) -> Int
{
    return (MemoryLayout<T>.size)
}

func sizeof <T> (_ : T) -> Int
{
    return (MemoryLayout<T>.size)
}

func sizeof <T> (_ value : [T]) -> Int
{
    return (MemoryLayout<T>.size * value.count)
}


















func report_memory() {
    var taskInfo = mach_task_basic_info()
    var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
    let kerr: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
        $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
            task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
        }
    }
    
    if kerr == KERN_SUCCESS {
        print("Memory used in bytes: \(taskInfo.resident_size)")
    }
    else {
        print("Error with task_info(): " +
            (String(cString: mach_error_string(kerr), encoding: String.Encoding.ascii) ?? "unknown error"))
    }
}
