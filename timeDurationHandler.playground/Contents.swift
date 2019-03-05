//: Playground - noun: a place where people can play

import UIKit


let lastTimestamp = Date()



let gestruelockunlockTimerInMinuts: TimeInterval = 5

let duration = Date().timeIntervalSince(lastTimestamp) < gestruelockunlockTimerInMinuts*60
print(duration)

