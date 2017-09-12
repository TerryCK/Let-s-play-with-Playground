import UIKit


func post(with article: [String: String]) {
    guard let insidetitle = article["Title"]  else {
        
        return
    }
    
    guard let insideContent = article["Content"] else {
        return
    }
    print(insidetitle)
    print(insideContent)
}
let article = ["Title": "handsome", "Content": "this is content of article"]

post(with: article)

if #available(iOS 10, macOS 10.2, *) {
    
} else {
    
}



//function


func functionName(paramenter: Int) -> Int {
    // doing something
    
    return paramenter
}




// closure

let x:(Int) -> Int = { (Int) -> Int in
    return 1
}



let y = x(5)

print(y)




//
//func printInfo(name: String, age: Int, address: String? = nil) {
//    print("name: \(name) , age: \(age), Address: \(address)")
//}
//printInfo(name: "Terry", age: 25)




func sayHello(from someone: String, to anotherone: String) {
    print("\(someone) say hello to \(anotherone)")
    
}


sayHello(from: "Terry", to: "Bob")


func sum(_ input: Int ...) -> Int{
    return input.reduce(0, +)
}

sum(1,2,3,4,5,6)



// inout with function


func newNumber(number: inout Int) {
    number *= 2
}

//func noninout(number: Int){
//    number *= 2
//}
//
var n = 10
//noninout(number: n)
//print(n)

newNumber(number: &n)
print(n)










// multiple return by tuple



func findNumbers(number: Int) -> (Int, Int) {
    let n = number + 10
    return (n, number)
}

let number = findNumbers(number: 20)

print(number.0, number.1)






func fidNumbersAnother(number: Int) -> (origin: Int, alternative: Int) {
    let alter = number + 10
    return (number, alter)
}


let number2 = fidNumbersAnother(number: 10)

func pass(_ number:  (Int, String )) -> () {
    return
}






func findnumbers3(arr: [Int] ) -> (Int, Int)? {
    if arr.isEmpty {
        return nil
    }
    
    let n = arr.first! + 10
    let n2 = arr[0] + 100
    
    return (n, n2)
}


let finded = findnumbers3(arr: [1,2])







let non = findnumbers3(arr: [])
let b = Void.self




// function type

func addTen(_ x: Int) -> Int {
    return x + 10
}

//var mathFunction: (Int) -> Int

addTen(2)
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}







func stepFoward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(forward: Bool) -> (Int) -> Int {
    return forward ? stepFoward : stepBackward
}

let forwordSwitch = true

let moveDirection = chooseStepFunction(forward: forwordSwitch)

moveDirection(0)






// closure

//
//    { (參數) -> 返回型別 in
//
//    內部執行程式
//    }

var mathFunction: (Int) -> Int

func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(mathFunction: +, 1, 2)

printMathResult(mathFunction: { $0 + $1 } , 1, 2)

printMathResult(mathFunction: { (p1: Int, p2: Int) -> Int in
    return p1 + p2
}, 1, 2)
















let intArr = [1,2]
let sums = intArr.reduce(0, +)

func someFunction(_ closure: (Int) -> ()) {
    print("in some function")
    
    closure(10)
    // code
}

// using

someFunction { x  in
    // closure in
    print(x ,"in call closure")
    
}

typealias Response = String
typealias Error = String
typealias DataString = String

class ClassA {
    init () { print("init A") }
    
    func download(dataString: DataString? = nil, response: Response? = nil, error: Error? = nil , _ completed:  (DataString?, Response?, Error?) -> Bool) -> Bool {
        
        return completed(dataString, response, error)
        
    }
    deinit { print("A died") }
}


class G {
    let classA: ClassA!
    
    init () {
        self.classA = ClassA()
        print("init G")
    }
  
    func perform() -> Bool? {
     
        let flag = classA.download(dataString: "data string", response: "response String", error: "error String") { (dataString, response, error) -> Bool in
                
                print("data: \(dataString!), response: \(response!), error: \(error!)")
                return true
        }
        return flag
    }
    
    
    
    
    
    
    //someFunction()
    deinit {
        
        print("G died")
    }
    
}







var g: G? = G()
g?.perform()



























let someValue = 10




extension Comparable {
    /// Returns a Boolean value indicating whether a value is included in a
    /// range.
    ///
    /// You can use this pattern matching operator (`~=`) to test whether a value
    /// is included in a range. The following example uses the `~=` operator to
    /// test whether an integer is included in a range of single-digit numbers.
    ///
    ///     let chosenNumber = 3
    ///     if chosenNumber ~= 0...9 {
    ///         print("\(chosenNumber) is a single digit.")
    ///     }
    ///     // Prints "3 is a single digit."
    ///
    /// - Parameters:
    ///   - lhs: A value to match against `rhs`.
    ///   - rhs: A range.
    public static func ~=(lhs: Self, rhs: ClosedRange<Self>) -> Bool {
        return rhs ~= lhs
    }
}



if someValue ~= 1...20 {
    
}

