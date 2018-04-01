import UIKit

protocol CellConfigurable: RawRepresentable {
    init(indexPath: IndexPath)
}

extension RawRepresentable where Self.RawValue == Int {
    static var allCase: [Self] { return all1() }
    
    var name: String { return String(describing: self) }
    
    // MARK: - Implement with recrusive
    static func all1(_ index: Int = 0, array: [Self] = [Self]()) -> [Self]  {
        return Self(rawValue: index) == nil ? array : all1(index + 1, array: array + [Self(rawValue: index)!])
    }
    


    static func all2(_ index: Int = 0, array: [Self] = [Self]()) -> [Self] {
        switch Self(rawValue: index) {
        case let element? : return all2(index + 1, array: array + [element])
        case nil          : return array
        }
    }
    
    //MARK: Implement with while loop
    static func all3() -> [Self] {
        var array = [Self]()
        var initialIndex = 0
        while let element = Self(rawValue: initialIndex) {
            array.append(element)
            initialIndex += 1
        }
        return array
    }
    
}

extension CellConfigurable where Self.RawValue == Int {
    init(indexPath: IndexPath) {
        let index = indexPath.row
        guard index >= 0, index < Self.allCase.count else {
            fatalError()
        }
        self = Self.allCase[index]
    }
    
}

//MARK - declaration
enum Planet: Int, CellConfigurable {
    case solar, mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
enum Weather: Int {
    case sunny, rain, cloudy
}

enum Animal: Int {
    case dog, cat, fish
}

//let testResult = Weather.allCase[5]


//print(Animal.allCase.map { $0.name } )
//let namesOfWeather = Weather.allCase.map { $0.name }
//print("weather:", namesOfWeather)
////MARK: - invoking
//
//print("count: ", Planet.allCase.count)

print("Planets1:", Planet.all1().map { $0.name } )
print("Planets2:", Planet.all2().map { $0.name } )
print("Planets3:", Planet.all3().map { $0.name } )
