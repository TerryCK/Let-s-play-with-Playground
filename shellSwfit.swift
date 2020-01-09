#!/usr/bin/env swift

import Foundation

print("hello world!!")

for argument in CommandLine.arguments {
    print(argument)
}

let sema = DispatchSemaphore(value: 0)

URLSession.shared.dataTask(with: URL(string: "https://www.google.com")!) { (data, _, _) in
    print(data!)
    print("success")
    sema.signal()
}.resume()
sema.wait()
