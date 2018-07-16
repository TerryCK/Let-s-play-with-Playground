import Foundation

let versionA = [2,5]
let versionB = [1,4]




let x = zip([2,5], [1,4])
print(x)
let result = x.reduce(false) {
    print($1.0, $1.1)
   return $0 || $1.0 < $1.1 }

print(result)


func compare(_ aVersion: [Int], _ closure: (Int, Int) -> Bool, _ bVersion: [Int]) -> Bool {
    return zip(aVersion, bVersion).reduce(false) { $0 || closure($1.0, $1.1) }
}



compare(versionA, >, versionB)



