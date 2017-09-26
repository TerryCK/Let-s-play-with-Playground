
import Foundation
import UIKit

extension Collection where Iterator.Element: BinaryInteger {
    func countOddEven() -> (odd: Int, even: Int) {
        var even = 0
        var odd = 0
        for value in self {
            if value % 2 == 0 {
                even += 1
            } else {
                odd += 1
            }
        }
        return (odd: odd, even: even)
    }
}

extension BinaryInteger {
    func square() -> Self {
        return self * self
    }
}

extension BinaryInteger {
    func clamp(low: Self, high : Self) -> Self {
        return max(low, min(self, high))
    }
}

let volume = 10.clamp(low: 5, high: 20)
let x = 3.clamp(low: 5, high: 10)
let y = 800.clamp(low: 5, high: 100)





extension Equatable {
    func matches(array items: [Self]) -> Bool {
        for item in items {
            if item != self {
                return false
            }
        }
        return true
    }
}

extension Comparable {
    func lessThan(array itmes: [Self]) -> Bool {
        for item in itmes {
            if item <= self {
                return false
            }
        }
        return true
    }
}



5.lessThan(array: [6,7,8,9,10])

5.lessThan(array: [5,6,7])
"cat".lessThan(array: ["dog", "fish", "gorilla"])





extension Collection where Iterator.Element: Equatable {
    func myContain(element: Iterator.Element) -> Bool {
        for item in self {
            if item == element {
                return true
            }
        }
        return false
    }
}




extension Collection where Iterator.Element: Comparable {
    func fuzzMatches(_ other: Self) -> Bool {
        let usSorted = self.sorted()
        let otherSorted = other.sorted()
        return usSorted == otherSorted
        
    }
}

[1,2,3].fuzzMatches([1,2,3])
[1,2,3].fuzzMatches([2,3,1])


extension Collection where Iterator.Element == String {
    func averageLength() -> Double {
        var sum = 0
        var count = 0
        for item in self {
            sum += item.count
            count += 1
        }
        return Double(sum) / Double(count)
        
    }
}


["你好嗎","我很好", "ok"].averageLength()

extension Collection where Iterator.Element: BinaryInteger {
    //    func myCalculator(element: Iterator.Element) -> Bool {
    //        var counter = 0
    //        let reference = String(self)
    //
    //}
}

extension BinaryInteger  {
    func myCalcultor(elements: [Self]) -> Int {
        let refer:Character = Character(String(describing: self))
        var count:Int = 0
        
        for element in elements {
            String(describing: element).forEach {
                if $0 == refer {
                    count += 1
                }
            }
        }
        return count
    }
}

5.myCalcultor(elements: [5,555,5555,555])
1.myCalcultor(elements: [10,1,0,5])
5.myCalcultor(elements: [5,3,5,1,5])
5.myCalcultor(elements: [5,15,55,555])





extension Collection where Iterator.Element: BinaryInteger {
    func number(of arg: Int) -> Int {
        var count: Int = 0
        let ref = Character(String(describing: arg))
        for element in self {
            let str = String(describing: element)
            for letter in str.characters {
                if letter == ref {
                    count += 1
                }
            }
        }
        return count
    }
}

[12,32,34,1,23,124,12,3].number(of: 2)



extension Array where Element: Equatable {
    func uniqueValue() -> [Element] {
        var result = [Element]()
        for item in self {
            if !result.contains(item) {
                result.append(item)
            }
        }
    return result
    }
    
}


[1,23,21,412,312].uniqueValue()
[1,2,3,12,3,4].uniqueValue().count
[1,2,3,12,3,4].count

//extension Array where Element: Comparable {
//    func isSorted() -> Bool {
//        return self == self.sorted()
//    }
//}

[1,3,2,5].isSorted()
[1,2,3,4,5].isSorted()



extension Collection where Iterator.Element: Comparable {
    func isSorted() -> Bool {
        return Array(self) == self.sorted()
    }
}



