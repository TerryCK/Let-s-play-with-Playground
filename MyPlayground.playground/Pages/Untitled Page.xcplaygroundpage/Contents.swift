import Foundation
let lastLogin = Date(timeInterval: -1000, since: Date()) as NSDate
let timeInterval = lastLogin.timeIntervalSince(Date())
print(timeInterval)
