
import UIKit

protocol CellConfigurable: RawRepresentable {
    init(indexPath: IndexPath)
}

extension RawRepresentable where Self.RawValue == Int {
    static var allCases: [Self] { return allCases() }
    
    var caseName: String { return String(describing: self) }
    
    init?(caseName: String) {
        let currectCase = Self.allCases.first { $0.caseName == caseName }
        if let currectCase =  currectCase {
            self = currectCase
        } else {
            return nil
        }
    }
    
    static func allCases(_ index: Int = 0, array: [Self] = [Self]()) -> [Self] {
        switch Self(rawValue: index) {
        case let element? : return allCases(index + 1, array: array + [element])
        case nil          : return array
        }
    }
}

extension CellConfigurable where Self.RawValue == Int {
    init(indexPath: IndexPath) {
        guard 0...Self.allCases.count ~= indexPath.row else {
            fatalError()
        }
        self = Self.allCases[indexPath.row]
    }
   
}

//MARK - declaration
enum Planet: Int, CellConfigurable {
    case solar, mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let gg  = Planet(caseName: "solar")
enum Weather: Int {
    case sunny, rain, cloudy
}

let x = Planet.allCases.map { $0.caseName }

enum SPIService {
    case connection
    case error(Int)
}

enum TerryErrorCode: Int {
    case Timeout, ITG0005

    init(spiError: SPIService, override: TerryErrorCode...) {
        switch spiError {
        case .connection: self = .Timeout
        case .error(let error): self = TerryErrorCode.init(rawValue: error) ?? .ITG0005
        }
    }
    
}
enum SPIError: Int {
     case ITG550, ITG551, TimeOut, ITG18213
    static var x: [SPIError] = [ITG550, ITG551]
     var errorCodeType: ErrorCodeType {
        if SPIError.x.contains(self) {
            return .forbidden
        
        
    }
}
enum ErrorCodeType: Int {
    case forbidden, kickout, normal
}

enum Forbidden: Int {
    case ITG550, ITG551
}


