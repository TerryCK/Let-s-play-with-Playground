import Foundation


class Benchmark {
    static func measure(times: Int = 10, id: String, block: () -> Void) -> Double {
        let begin = Date()
        (0...times).forEach { _ in
            block()
        }
        let timeElapsed = Date().timeIntervalSince(begin) * 1000 / Double(times)
        print("measure id:", id, "times: \(times)", "average:", timeElapsed, "ms")
        
        return timeElapsed
    }
}


import UIKit
// MARK: Legancy
extension UICollectionViewFlowLayout {
    
    func with(minimumLineSpacing: CGFloat) -> Self {
        self.minimumLineSpacing = minimumLineSpacing
        return self
    }
    
    func with(minimumInteritemSpacing: CGFloat) -> Self {
        self.minimumInteritemSpacing = minimumInteritemSpacing
        return self
    }
    
    func with(sectionInset: UIEdgeInsets) -> Self {
        self.sectionInset = sectionInset
        return self
    }
    
    func with(estimatedItemSize: CGSize) -> Self {
        self.estimatedItemSize = estimatedItemSize
        return self
    }
    
    func with(itemSize: CGSize) -> Self {
        self.itemSize = itemSize
        return self
    }
}







@dynamicMemberLookup
struct Builder<T> {
    let subject: T
    subscript<Value>(dynamicMember keyPath: WritableKeyPath<T, Value>) -> ((Value) -> Self) {
        var subjectCopy = subject
        return { value in
            subjectCopy[keyPath: keyPath] = value
            return Self(subject: subjectCopy)
        }
    }
}
extension Builder where T: AnyObject {
    subscript<Value>(dynamicMember keyPath: ReferenceWritableKeyPath<T, Value>) -> ((Value) -> Self) {
        return { value in
            self.subject[keyPath: keyPath] = value
            return self
        }
    }
}




protocol Person {
    var name: String { get set }
    var age: Int { get set }
    mutating func set(name: String) -> Self
    mutating func set(age: Int) -> Self
}

extension Person {
    mutating func set(name: String) -> Self {
        self.name = name
        return self
    }
    mutating func set(age: Int) -> Self {
        self.age = age
        return self
    }
}

struct PersonStruct {
    var name: String = ""
    var age: Int = 10
    
    func set(name: String) -> Self {
        return PersonStruct(name: name, age: age)
    }
    func set(age: Int) -> Self {
        return PersonStruct(name: name, age: age)
    }
}


class PersonClass {
    var name: String = ""
    var age: Int = 10
    
    lazy var closure: (String) -> PersonClass = { name in
        self.name = name
        return self
    }
    
 func set(name: String) -> Self {
        self.name = name
        return self
    }
    func set(age: Int) -> Self {
        self.age = age
        return self
    }
    func test(closure: () -> ()) {
        
    }
    
    
}


struct Apartment {
    var people: [PersonClass] = []
}
//Builder<Apartment>(subject: Apartment()).people()
let x = PersonClass()
let mirror = Mirror(reflecting: x)
dump(mirror.children)

let gg = Builder(subject: x).closure { $0; return PersonClass() }

//
//let a = Benchmark.measure(times: 10000, id: "PersonStruct") {
//    Builder(subject: PersonStruct()).age(10).name("terry").subject
//}
//
//let b = Benchmark.measure(times: 10000, id: "PersonClass") {
//    Builder(subject: PersonClass()).age(10).name("terry").subject
//}
//
//
//let c = Benchmark.measure(times: 10000, id: "PersonClass") {
//    PersonStruct().set(age: 10).set(name: "terry")
//}
//
//let d = Benchmark.measure(times: 10000, id: "PersonClass") {
//    PersonClass().set(age: 10).set(name: "terry")
//}
//


let dynamicMemberLookup = Benchmark.measure(times: 10, id: "dynamicMemberLookup") {
     _ = Builder<UICollectionViewFlowLayout>(subject: UICollectionViewFlowLayout())
    .minimumLineSpacing(50)
    .minimumInteritemSpacing(50)
    .sectionInset(.init(top: 10, left: 10, bottom: 10, right: 10))
    .estimatedItemSize(.init(width: 0, height: 0))
    .itemSize(.init(width: -1, height: 10))
    .subject
}

let builderChain =  Benchmark.measure(times: 10, id: "builderChain") {
    _ = UICollectionViewFlowLayout()
    .with(minimumInteritemSpacing: 50)
    .with(minimumLineSpacing: 50)
    .with(minimumInteritemSpacing: 50)
    .with(sectionInset: .init(top: 10, left: 10, bottom: 10, right: 10))
    .with(estimatedItemSize: .init(width: 0, height: 0))
    .with(itemSize: .init(width: 10, height: 10))
}
//
//
//
//
//let ratio = dynamicMemberLookup/builderChain
//
//print("\ndynamicMemberLookup / builderChain ratio:", ratio)
//
//
//
//
//
//let aSet = Array(1...10000)
//let bSet = Array(1...10000)
//var dic: [String: Int] = [:]
//Benchmark.measure(times: 10, id: "array") {
//    
//    aSet.forEach {
//        dic[String($0)] = $0
//    }
//    bSet.forEach {
//        dic[String($0)] = $0
//    }
//    
//}
//dic.count

import UIKit

class A {
    lazy var myButton: UIButton = {
        $0.setTitle("myButton", for: .normal)
        return $0
    }(UIButton())
}
