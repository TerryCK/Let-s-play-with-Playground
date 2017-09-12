import UIKit


// exercise 1

var aGlobalParameter = 10 // global variable

// Global function with name globalClosure
func globalClosure() -> Void {
    print("value of a \(aGlobalParameter)")
}
func someFunctionWithGlobalClosure() -> Void {
    globalClosure()
}
aGlobalParameter = 14
someFunctionWithGlobalClosure()// Prints: value of a 14


















// exercise 2

var bGlobalParameter = 10 // global variable
// Global function with name closureToPass
func bGlobalClosure() -> Void {
    print("value of a \(bGlobalParameter)")
}
func bSomeFunctionWithGlobalClosure() {
//    var bGlobalParameter = 5    // named same global parameter
    bGlobalClosure()
}
bGlobalParameter = 14
bSomeFunctionWithGlobalClosure() // Prints: value of a 14 , not 5

























var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
    somefunctionPerformingAsyncTask()
}
func somefunctionPerformingAsyncTask() {
    // do some task
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        completionHandlers.first?()
        print("completion")
    }
}
//someFunctionWithEscapingClosure(completionHandler: { () -> Void in
//    print("Task completed")
//})

someFunctionWithEscapingClosure{ () -> Void in
    print("Task completed")
} // trail closure

print("Task Started")
// In console you will see log in this order
//Task Started
//Task completed

















func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()  // returns a value of 10
incrementByTen()  // returns a value of 20
let incrementByTwo = makeIncrementer(forIncrement: 2)
incrementByTwo()  // returns a value of 2
incrementByTwo()  // returns a value of 4




























