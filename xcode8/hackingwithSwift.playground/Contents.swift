import UIKit

typealias Distance = Double

struct Position {
    var x: Double
    var y: Double
}

extension Position {
    func within(range: Distance) -> Bool {
        return sqrt(x * x + y * y) <= range
    }
}


struct Ship {
    var position: Position
    var firingRange: Distance
    var unsafeRange: Distance
}

extension Ship {
    func canEngage(ship target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= firingRange
    }
}

extension Ship {
    func canSafelyEngage(ship target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= firingRange && targetDistance > unsafeRange
    }
}


//extension Ship {
//    func canSafelyEngage(ship target: Ship, friendly: Ship) -> Bool {
//        let dx = target.position.x - position.x
//        let dy = target.position.y - position.y
//        let targetDistance = sqrt(dx * dx + dy * dy)
//        let friendlyDx = friendly.position.x - target.position.x
//        let friendlyDy = friendly.position.y - target.position.y
//        let friendlyDistance = sqrt(friendlyDx * friendlyDx +
//            friendlyDy * friendlyDy)
//        return targetDistance <= firingRange
//            && targetDistance > unsafeRange
//            && (friendlyDistance > unsafeRange)
//    }
//}


extension Position {
    func minus(_ p: Position) -> Position {
        return Position(x: x - p.x, y: y - p.y)
    }
    var length: Double {
        return sqrt(x * x + y * y)
    }
}


extension Ship {
    func canSafelyEngage2(ship target: Ship, friendly: Ship) -> Bool {
        let targetDistance = target.position.minus(position).length
        let friendlyDistance = friendly.position.minus(target.position).length
        return targetDistance <= firingRange
            && targetDistance > unsafeRange
            && (friendlyDistance > unsafeRange)
    }
}

typealias Region = (Position) -> Bool

func circle(radius: Distance) -> Region {
    return { point in point.length <= radius }
}


func circle2(radius: Distance, center: Position) -> Region {
    return { point in point.minus(center).length <= radius }
}

func shift(_ region: @escaping Region, by offset: Position) -> Region {
    return { point in region(point.minus(offset)) }
}

func invert(_ region: @escaping Region) -> Region {
    return { point in !region(point) }
}

let shifted = shift(circle(radius: 10), by: Position(x: 5, y: 5))


let ship:Ship = Ship(position: Position(x: 10, y: 10), firingRange: 10, unsafeRange: 5)





var students = ["Ben", "Ivy", "Jordell", "Maxime"]
if let i = students.index(of: "Maxime") {
    students[i] = "Max"
    print(i)
}
print(students)
// Prints "["Ben", "Ivy", "Jordell", "Max"]"





















