import Foundation
// Closure就是可以捕獲變量的函數，那麼，究竟在Swift裡，Closure和函數之間有什麼關係呢？

func makeCounter() -> () -> Int {
    var value = 0
    
    return {
        value += 1
        
        return value
    }
}

let counter1 = makeCounter()
let counter2 = makeCounter()

(0...2).forEach { _ in print(counter1()) } // 1 2 3
(0...5).forEach { _ in print(counter2()) } // 1 2 3 4 5 6


func makeCounterWithFunc() -> () -> Int {
    var value = 0
    
    func increment() -> Int {
        value += 1
        return value
    }
    
    return increment
}
// SE-0002 Removing currying func declaration syntax
// https://github.com/apple/swift-evolution/blob/master/proposals/0002-remove-currying.md

func curryingMul(_ a: Int) -> (Int) -> Int {
    func innerMul(_ b: Int) -> Int {
        return a * b
    }
    
    return innerMul
}
class Terry {
    var closure : () -> (Int)  {
        var count = 0
        
        return {
             count += 1
            return count
        }
    }
}

let closure2 = Terry().closure

closure2()

func mul(a:Int, b:Int) -> Int {
    return a * b
}

func div(a:Int, b:Int) -> Int {
    return a / b
}
var myOperator = mul

myOperator = div

myOperator(5,10)

// can't ignore _
// 一個函數加上它捕獲的變量一起，才算一個closure
(0...9).map { _ in arc4random() }


//fav.buttonPressed = { [weak counter] index in
//    counter?.buttonPressed(at: index)
//}
//class PressCounter {
//    var count = 0
//
//    func buttonPressed(at Index: Int) {
//        self.count += 1
//    }
//}
//let fav = FinishAlertView()
//var counter = PressCounter()
//class FinishAlertView {
//    var buttons: [String] = [ "Cancel", "The next" ]
//    var buttonPressed: ((Int) -> Void)?
//
//    func goToTheNext() {
//        buttonPressed?(1)
//    }
//}


func incremental(_ i: inout Int) -> Int {
    i = i + 1
    return i
}

var i = 0

incremental(&i) // 1
//
//這樣，i的值，就會變成1。對於&，如果你之前有過C/C++的編程經驗，一定會把它理解為是在傳遞變量i的地址，或者叫i的引用。這樣，我們才能讓修改在函數外生效。但事實並不如此，在Swift的官文文檔裡，我們可以找到一段這樣的描述：
//
// An in-out parameter has a value that is passed in to the function, is modified by the function, and is passed back out of the function to replace the original value.
//
//也就是說，管這個參數叫做inout而不是類似於ref之類的是有道理的，被inout修飾的參數只是被傳遞給函數，被修改後，再替換了初始值而已。當然，也許按引用傳遞是編譯器採取的某種優化手段，但是你不能依賴這個特性。總之，inout就真的只是in out而已。

// inout not pass memory address,


prefix func ++(i: inout Int) -> Int {
    i += 1
    return i
}

var terry = 1
++terry



// autoclosure
//func logicAnd(_ l: Bool, _ r: Bool) -> Bool {
//    guard l else { return false }
//
//    return r
//}


func logicAnd(_ l: Bool, _ r: @autoclosure ()-> Bool) -> Bool {
    guard l else { return false }
    
    return r()
}

let numbers: [Int] = []

if !numbers.isEmpty && numbers[0] > 0 {
    // This works
}


if logicAnd(!numbers.isEmpty, numbers[0] > 0) {
    // This failed
}

// closure implicity for escaping for optional closure

func calc(_ n: Int, by: ((Int) -> Int)?) -> Int {
    guard let by = by else { return n }
    
    return by(n)
}

//Closure默認不為non escaping的情況
//剛才我們提到過，作為函數參數的closure默認是non escaping屬性的。但在下面這兩種情況裡，closure默認是escaping屬性的：
//
//首先，所有自定義類型的closure屬性，默認是escaping的。例如：我們之前已經使用過的fav.buttonPressed，想想這也自然，畢竟我們把closure單獨保存了起來；
//

