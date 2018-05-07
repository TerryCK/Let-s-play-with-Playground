import Foundation
protocol Terryable {
    func terry()
}

extension Terryable {
    func terry() {
        print("Extension Terry")
    }
}

extension Terryable where Self: TerrySon {
    func terry() {
        print("Extension Terry's son ")
    }
}

class Terry: Terryable {
    
}

class TerrySon: Terry {
    
}

let terryson = TerrySon()
terryson.terry()
