import Foundation

extension Array where Element: Numeric & Comparable {
    func bubbleSort() -> Array {
        var result = self
        for outIndex in 0...count - 2 {
            for innerIndex in (outIndex + 1)...count - 1 where result[outIndex] > result[innerIndex] {
                (result[outIndex], result[innerIndex]) = (result[innerIndex], result[outIndex])
            }
        }
        return result
    }
    
    func bubbleSort(_ closure: (Element, Element) -> Bool) -> Array {
        var result = self
        for outIndex in 0...count - 2 {
            for innerIndex in (outIndex + 1)...count - 1 where closure(result[outIndex], result[innerIndex]) {
                (result[outIndex], result[innerIndex]) = (result[innerIndex], result[outIndex])
            }
            print(result)
        }
        return result
    }
}


[1,23,5,6,12].bubbleSort()
[10.2, 20.1, 30.0, 30.1, 20.9].bubbleSort()

[1,3,4,1].bubbleSort(<)




