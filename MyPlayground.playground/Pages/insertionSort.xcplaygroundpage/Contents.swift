import Foundation

var numberLists : Array<Int> = [8, 2, 10, 9, 11, 1, 7, 3, 4]

extension Array where Element: BinaryInteger {
    func insertionSort(_ orderFunction: (Element, Element) -> Bool) -> Array {
        var array = self
        for index in 1..<count {
            var key = index
            let temp = array[key]
            while key > 0 && orderFunction(temp, array[key - 1 ]) {
                array[key] = array[key - 1]
                key -= 1
            }
            array[key] = temp
        }
        
        return array
    }
}


numberLists.insertionSort( < )
