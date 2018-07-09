import Foundation

extension Array where Element: Numeric & Comparable {
    func bubbleSorted() -> Array {
        var result = self
        for outIndex in 0...count - 2 {
            for innerIndex in (outIndex + 1)...count - 1 where result[outIndex] > result[innerIndex] {
                (result[outIndex], result[innerIndex]) = (result[innerIndex], result[outIndex])
            }
        }
        return result
    }
    
    func bubbleSorted(by closure: (Element, Element) -> Bool) -> Array {
        var result = self
        for outIndex in 0...count - 2 {
            for innerIndex in (outIndex + 1)...count - 1 where closure(result[outIndex], result[innerIndex]) {
                (result[outIndex], result[innerIndex]) = (result[innerIndex], result[outIndex])
            }
            
        }
        return result
    }
    
    
    func insertSorted() -> Array {
        var result = self
        for outIndex in 2...count - 1 {
            let key = self[outIndex]
            var index = outIndex - 1
            while index > 0 && result[index] > key {
                result[index + 1] = result[index]
                index -= 1
            }
            result[index + 1] = key
        }
        return result
    }
    
    func insertSorted(by closure: (Element, Element) -> Bool) -> Array {
        var result = self
        for outIndex in 0...count - 1 {
            let key = self[outIndex]
            var index = outIndex - 1
            while index >= 0 && closure(result[index], key) {
                result[index + 1] = result[index]
                index -= 1
            }
            result[index + 1] = key
            print(result)
        }
        return result
    }
}


[1,23,5,6,12].bubbleSorted()
[10.2, 20.1, 30.0, 30.1, 20.9].bubbleSorted()

[1,3,4,2].bubbleSorted(by: <)


[10.2, 20.1, 30.0, 30.1, 20.9].insertSorted()
[1,3,4,2].insertSorted(by: <)


