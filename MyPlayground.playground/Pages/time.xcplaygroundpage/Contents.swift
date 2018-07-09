import Foundation
let day: Double = 24*60*60

let lastLogin = Date(timeInterval: TimeInterval(-1 * day), since: Date()) as NSDate
let nowTime = Date()

let timeInterval = nowTime.timeIntervalSince(lastLogin as Date)
print("now Time:", nowTime)

print("lastLogin:", lastLogin)

print(timeInterval)

let ns: NSNumber = 10
let int = Int(truncating: ns)


var x : Int16




