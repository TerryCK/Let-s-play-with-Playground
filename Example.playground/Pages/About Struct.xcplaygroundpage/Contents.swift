import Foundation

let numbers: NSMutableArray = [1, 2, 3, 4, 5]

for _ in numbers {
// Will CRASH when iterating
    numbers.removeLastObject()
}

