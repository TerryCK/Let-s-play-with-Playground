import UIKit

let uiArray = [UIView(), UIView()]
uiArray.map { Optional($0) }.forEach { print($0) }

