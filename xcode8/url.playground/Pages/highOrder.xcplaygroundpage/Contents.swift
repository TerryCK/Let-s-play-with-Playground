import UIKit

let numbers = [[1,2], [3,4], [5,6]]

let joined = Array(numbers.joined())

let albums: [String?] = ["Fearless", nil, "Speak Now", nil, "Red"]

let result = albums.flatMap { $0 }

print(result)

let mapResult = albums.map { $0 }
print(mapResult)

