import Foundation
import PlaygroundSupport

let firstQueue = DispatchQueue(label: "queue1", qos: DispatchQoS.userInitiated)
let secondQueue = DispatchQueue(label: "queue2", qos: DispatchQoS.userInitiated)
firstQueue.sync {
    for i in 0..<10 {
        print("🔷", i)
    }
}
secondQueue.sync {
    for i in 20..<30 {
        print("⚪️", i)
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true


