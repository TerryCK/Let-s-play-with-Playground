import Foundation
import PlaygroundSupport



//: semaphore 
let higherPriority = DispatchQueue.global(qos: .userInitiated)
let lowerPriority = DispatchQueue.global(qos: .utility)

let semaphore = DispatchSemaphore(value: 1)

func asyncPrint(queue: DispatchQueue, symbol: String) {
    queue.async {
        print("\(symbol) waiting")
        semaphore.wait()  // requesting the resource
        
        for i in 0...10 {
            print(symbol, i)
        }
        
        print("\(symbol) signal")
        semaphore.signal() // releasing the resource
    }
}

asyncPrint(queue: higherPriority, symbol: "🔴")
asyncPrint(queue: lowerPriority, symbol: "🔵")

PlaygroundPage.current.needsIndefiniteExecution = true

