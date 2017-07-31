//////
//////import UIKit
////////
////////
////////
////////let now = Date()
////////let calendar = Calendar.current
////////let hour = calendar.component(.hour, from: now)
////////let minutes = calendar.component(.minute, from: now)
////////let seconds = calendar.component(.second, from: now)
//////////print("calendar:" , calendar)
//////////print("hours = \(hour):\(minutes):\(seconds)")
////////
////////
////////
//////////  public func timeIntervalSince(_ date: Date) -> TimeInterval
////////
////////let nowAfterAnHour = Date.init(timeIntervalSinceNow: 3600)
////////
////////
////////
////////
////////nowAfterAnHour.timeIntervalSinceNow
////////
////////
////////
////////protocol TimerDelegate: class {
////////    func timer() -> Bool
////////    var foo: Int { get }
////////}
////////
////////class TimerImplement: TimerDelegate {
////////   var foo: Int = 10
////////    func timer() -> Bool {
////////        foo += 10
////////        return true
////////    }
////////}
////////
////////
////////
//////////class B {
//////////func test() {
//////////
//////////    weak var delegate: TimerDelegate?
//////////
//////////
//////////        print(switcher.timer())
//////////    }
//////////
//////////
//////////}
//////////let a = TimerImplement()
//////////
//////////let b = B()
//////////b.delegate = a
//////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
//////////  Part1:
////////
////////
//////////  code in the same file
////////protocol DelegateProtocol: class {
////////    func 說英語()
////////}
////////
////////
////////
////////class 本國人 {
////////    weak var 語言:DelegateProtocol?
////////
////////}
////////
////////
////////
////////
//////////  code in another file
////////class 歪國人翻譯: DelegateProtocol {
////////
////////    let 實體的本國人 = 本國人()
////////
////////    實體的本國人.語言 = self
////////
////////    func 說英語() {
////////        //do something
////////    }
////////}
////////
////////
////////
////////
////////
////////
////////
////////
////////////Part2:
//////////
//////////
////////////  code in the same file
//////////protocol DelegateProtocol: class {
//////////    func method()
//////////}
//////////
//////////class B {
//////////
//////////    weak var delegate:DelegateProtocol?
//////////
//////////    init() {
//////////        let a = A()
//////////        self.delegate = a
//////////    }
//////////}
//////////
//////////
//////////
////////////  code in another file
//////////class A: DelegateProtocol {
//////////
//////////    func method() {
//////////       print("do something")
//////////    }
//////////
//////////
//////////}
//////////
//////////let b = B()
//////////b.delegate?.method()
//////////
//////////
//////////
//////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
//////
//////let arr:[Int] = []
//////
//////for element in arr {
//////    element
//////}
//////func request(){
////////    var apiA:[Int]? = [1,2,3,4,5]
////////    var apiB:[Int]? = [1,2,3,4,5]
////////    var apiC:[Int]? = [1,2,3,4,5]
////////    var apiD:[Int]? = [1,2,3,4,5]
////////    var apiE:[Int]? = [1,2,3,4,5]
////////    url = URL("SS")
////////    URLSession.shared.dataTask(with: url, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
//////
//////    let array = [1,2,3,4,5].map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)
//////
//////    {}
//////    
//////    
//////}
////
////
////extension Array where Element : Hashable {
////    func combineHashString() -> String {
////        return self.reduce("test : ") { (str, element) -> String in
////            return str + "\(element.hashValue)"
////        }
////    }
////
////}
////let stringArray = Array(repeating: "TT", count: 5)
////
////stringArray.combineHashString()
////
////
////struct Dog {
////    var name: String
////}
////
////
////
////extension Dog : Hashable {
////    var hashValue: Int {
////        return self.name.hashValue
////    }
////
////    static func ==(lhs: Dog, rhs: Dog) -> Bool {
////        return lhs.hashValue == rhs.hashValue
////    }
////}
////
////
////
////let dog = Dog(name: "kitty")
////
////dog.hashValue
//
//let first = ["Sulaco", "Nostromo"]
//let second = ["X-Wing", "TIE Fighter"]
//let third = first + second





























