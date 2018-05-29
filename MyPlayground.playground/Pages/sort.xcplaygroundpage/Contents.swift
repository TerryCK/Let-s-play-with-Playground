

import Foundation

let array = [8, 2, 10, 9, 11, 1, 7, 3, 4]

func sort(array: [Int], orderFunction: (Int, Int) -> Bool) -> [Int] {
    var tempArray = array
    
    for index in 1..<tempArray.count {
        var innerIndex = index
        
        while innerIndex > 0 && orderFunction(tempArray[innerIndex], tempArray[innerIndex - 1]) {
            (tempArray[innerIndex - 1], tempArray[innerIndex]) = (tempArray[innerIndex], tempArray[innerIndex - 1])
            innerIndex -= 1
        }
        
    }
    return tempArray
}

sort(array: array, orderFunction: <)


extension Array where Element: BinaryInteger {
    
    func insertionSort(with orderFunction: (Element, Element) -> Bool) -> Array {
        var temp = self
        for index in 1..<temp.count {
            var innerIndex = index
            while innerIndex > 0 && orderFunction(temp[innerIndex], temp[innerIndex - 1]){
                (temp[innerIndex], temp[innerIndex - 1]) = (temp[innerIndex - 1], temp[innerIndex])
                innerIndex -= 1
            }
        }
        return temp
    }
}


[8, 2, 10, 9, 11, 1, 7, 3, 4].insertionSort(with: <)
