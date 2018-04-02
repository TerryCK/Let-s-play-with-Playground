let numberDictionary =
    ["one": 1, "two": 2, "three": 3, "four": 4]
let evenColl =
    numberDictionary.lazy.filter { $0.1 % 2 == 0 }

let duplicates = [("a", 1), ("b", 2), ("a", 3), ("b", 4)]
// fatal error: Duplicate values for key: 'a'
//let letters = Dictionary(uniqueKeysWithValues: duplicates)
let letters = Dictionary(duplicates,
                         uniquingKeysWith: { (first, _) in first })
// ["b": 2, "a": 1]
//let letters = Dictionary(duplicates, uniquingKeysWith: max)
// ["b": 4, "a": 3]
let names = ["Aaron", "Abe", "Bain", "Bally", "Bald", "Mars", "Nacci"]
let groupedNames = Dictionary(grouping: names, by: { $0.first! })
// ["B": ["Bain", "Bally", "Bald"], "A": ["Aaron", "Abe"], "M": ["Mars"], "N": ["Nacci"]]
let filtered = numberDictionary.filter { $0.value % 2 == 0 }

// Array<(Key, Value)> in Swift 3
// Dictionary<String, Int> in Swift 4
type(of: filtered)


let dictionary = [1: "One", 2: "Two"]
let mapped = dictionary.mapValues { $0.lowercased() }
print(mapped)
//mapped // [2: "two", 3: "three", 1: "one"]

