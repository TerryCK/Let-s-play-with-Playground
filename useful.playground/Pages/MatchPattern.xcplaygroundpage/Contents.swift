
import Foundation
//: Match Pattern
enum Status {
    case on, off
}

let status = Status.off

status ~= .on
status ~= .off
//    .off ~= status wrong declaration

status == .on
status == .off

if case .off = status {
    print()
} else if case .on = status {
    print()
}


