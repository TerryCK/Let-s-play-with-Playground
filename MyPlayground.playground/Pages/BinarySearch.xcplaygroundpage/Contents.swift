
import Foundation


// Binary search require a sequence of sorted / O(log n)
// Linear search not require a sequence of sorted
extension Array where Element: BinaryInteger {
    func linearSearch(for element: Element) -> Int? {
        var track = 0
        for index in 0..<count {
            track += 1
            if self[index] == element {
                print(element)
                return index
            }
            
        }
        defer { print(track) }
        return nil
    }
}

[11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23].linearSearch(for: 23)



extension Array where Element: BinaryInteger {
    
    func binarySearch(key: Element, range: Range<Int>) -> Int? {
        guard range.lowerBound <= range.upperBound else {
            return nil
        }
        
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        if self[midIndex] == key {
            return midIndex
        } else {
            let subRange: Range<Int> = self[midIndex] > key ? range.lowerBound ..< midIndex :  midIndex + 1 ..< range.upperBound
            return binarySearch(key: key, range: subRange)
        }
    }
    
    func binarySearch(key: Element) -> Int? {
        var lowerBound = 0
        var upperBound = count
        while lowerBound < upperBound {
            let midIndex = lowerBound + (upperBound - lowerBound) / 2
            switch self[midIndex] {
            case key    :    return midIndex
            case ..<key : lowerBound = midIndex + 1
            default     :  upperBound = midIndex
            }
        }
        return nil
    }
}

let array2 = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

let range: Range<Int> = 0..<array2.count
array2.binarySearch(key: 23, range: range)

[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67].binarySearch(key: 23)
