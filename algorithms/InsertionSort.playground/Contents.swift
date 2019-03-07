import Foundation
// InsertionSort

// Space complexity O(n)
// Time complexity worst case O(n^2)
// Average O(n^2)
extension Array where Element: Comparable {
    func insertionSort(by body: (Element, Element) -> Bool) -> Array {
        var destination = self
        for index in 1..<count {
            let currentPicked = destination[index]
            var lastSortedIndex = index - 1
            // handle insert
            while (0..<count).contains(lastSortedIndex) && body(currentPicked, destination[lastSortedIndex]) {
                destination[lastSortedIndex + 1] = destination[lastSortedIndex] // reorganize
                lastSortedIndex -= 1
            }
            destination[lastSortedIndex + 1] = currentPicked
        }
        return destination
    }
    
    func insertOnFront(element: Element, at index: Index) -> Array {
        var destination = self
        guard !isEmpty else {
            if index == 0 {
                return [element]
            } else {
            fatalError()
            }
        }
        switch index {
        case count:
            destination.append(element)
            return destination
        case 0..<count:
            var insertIndex = index - 1
            let key = destination[index]
            while insertIndex > 0 {
                destination[insertIndex + 1] = destination[insertIndex]
                insertIndex -= 1
            }
            destination[insertIndex] = key
            return destination
            
        default:
            fatalError("out of array index range")
        }
    }
}






let x = [5,2,4,6,1,3].insertionSort(by: <)
print(x)


// Reference : http://alrightchiu.github.io/SecondRound/comparison-sort-insertion-sortcha-ru-pai-xu-fa.html
