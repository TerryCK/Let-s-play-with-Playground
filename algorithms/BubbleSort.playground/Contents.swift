
// Bubble sort


extension Array where Element: Comparable {
    func bubbleSort(by body: (Element, Element) -> Bool) -> Array {
        var destination = self
        for outter in 0..<count {
            for inner in 1..<count - outter where body(destination[inner], destination[inner-1]) {
                destination.swapAt(inner, inner-1)
            }
        }
    return destination
    }
    
    func bubbleSort2(by body: (Element, Element) -> Bool) -> Array {
        var destination = self
        for outter in 0..<count {
            for inner in 0..<count where body(destination[outter], destination[inner]) {
                destination.swapAt(inner, outter)
            }
        }
        return destination
    }
}

let x = [5,2,4,6,1,3].bubbleSort(by: <)
print(x)

let y = [5,2,4,6,1,3].bubbleSort2(by: <)
print(y)
