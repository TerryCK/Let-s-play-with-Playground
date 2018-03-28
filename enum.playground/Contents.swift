//: Playground - noun: a place where people can play

import UIKit

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 12321, 1)

switch productBarcode {
case let .upc(x , y, z, g):
    print(x,y,z,g)
default:
    print("nothing")
    break
}
