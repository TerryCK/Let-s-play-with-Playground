


import Foundation
import PlaygroundSupport

// updata UI in main queue
DispatchQueue.global(qos: .background).async {
   // do something for execute in background
    DispatchQueue.main.async {
        // do something for update UI
    }
}


//  MARK: Priority QoS
//  case background
//  case utility
//  case `default`
//  case userInitiated
//  case userInteractive
//  case unspecified


// delay execute time

let delay = DispatchTime.now() + DispatchTimeInterval.seconds(60)
// let delay = DispatchTime.now() + 3.0
// public func +(time: DispatchTime, seconds: Double) -> DispatchTime


DispatchQueue.main.asyncAfter(deadline: delay) {
    // implemention task
}

// MARK: Group
let group =  DispatchGroup()

group.enter()
group.notify(queue: DispatchQueue.main) {
    print("notify",Date())
}
 group.leave()

//let queueBook = DispatchQueue(label: "Book")
//queueBook.async  {
//    print("book", Date())
//}
//let queueVideo = DispatchQueue(label: "Video")
//
//queueVideo.async {
//    sleep(1)
// print("Video",Date())
//
//}




//class X {
//    var width: Int  = 0 {
//        didSet {
//            print(width)
//        }
//    }
//}
//
//let x = X()
//
//x.width = 10
//x.width = 10


//public func sync(execute workItem: DispatchWorkItem)
//
//public func async(execute workItem: DispatchWorkItem)

//
//let workItem = DispatchWorkItem {
//    // task
//    sleep(1)
//    print("done")
//}
//
//let myQueue = DispatchQueue(label: "my.queue", qos: .default, attributes: .concurrent)
//
//myQueue.async(execute: workItem)
//
//print("before, workItem")
//
//workItem.wait()
//
//print("after wait")
//
//
//
//// barrier
//
//let write = DispatchWorkItem(flags: .barrier) {
//    // write data
//    // thread safe guarantee when data writting without data reading at the same time
//}
//let dataQueue = DispatchQueue(label: "data", qos: .default, attributes: .concurrent)
//
//dataQueue.async(execute: write)
//
//// MARK: semaphore, for thrad safety
//// image close interval with train road
//
//let semaphore = DispatchSemaphore(value: 5)
//// in this interval for 5 space available
//
//semaphore.wait()
//// semaphore count -1
//
//semaphore.signal()
//// semaphore count +1





PlaygroundPage.current.needsIndefiniteExecution = true


