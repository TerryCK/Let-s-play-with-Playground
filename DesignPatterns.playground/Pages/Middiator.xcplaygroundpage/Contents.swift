//: ## 中介者模式（Mediator Pattern）
//: * 解決什麼問題：同類對象之間的通信問題。
//: * 優點：使用中介者模式之後，對象之間不需要保持聯繫，只需要通過中介者對象來交互。
//: *   何時不該用：如果需要讓一個對象給一組互不相關的對象發送通知時，則應該使用觀察者模式。

struct TestPosition {
    var x: Int
}

struct Position {
    var x: Int
}

class TestCar {
   
    var carName: String
    var currentPosition: TestPosition
    private var otherCars: [TestCar]
    
    init(carName: String, position:TestPosition) {
        self.carName = carName
        self.currentPosition = position
        self.otherCars = [TestCar]()
    }
    
    // 加入關注的汽車對象
    func addCarsInArea(cars:TestCar...) {
        for car in cars {
            otherCars.append(car)
        }
    }
    
    // 當有車輛改變位置時，檢查是不是太靠近了。
    func checkIsOtherCarsTooClose(car:TestCar) -> Bool {
        return currentPosition.x - car.currentPosition.x < 5
    }
    
    // 更新目前車輛的位置
    func changePosition(newPosition:TestPosition) {
        self.currentPosition = newPosition
        
        for car in otherCars {
            if car.checkIsOtherCarsTooClose(car: self) {
                print("\(carName), 慢一點，太靠近 \(car.carName) 了")
            }
        }
        print("\(carName) 移動到了位置 \(currentPosition.x)")
    }
    
}


let stoneTestCar = TestCar(carName: "Stone Car", position: TestPosition(x: 0))
let woodTestCar  = TestCar(carName: "Wood Car", position: TestPosition(x:10))
let ironTestCar  = TestCar(carName: "Iron Car", position: TestPosition(x:20))
let waterTestCar = TestCar(carName: "Water Car", position: TestPosition(x:30))

stoneTestCar.addCarsInArea(cars: woodTestCar, ironTestCar, waterTestCar)
woodTestCar.addCarsInArea(cars: stoneTestCar, ironTestCar, waterTestCar)
ironTestCar.addCarsInArea(cars: stoneTestCar, woodTestCar, waterTestCar)
waterTestCar.addCarsInArea(cars: stoneTestCar, woodTestCar, ironTestCar)

//
//woodTestCar.changePosition(newPosition: TestPosition(x: 15))




protocol Peer {
    var name:String {get}
    func checkIsOtherCarsTooClose(position: Position) -> Bool
}

protocol Mediator {
    func registerPeer(peer:Peer)
    func unregisterPeer(peer:Peer)
    func changePosition(peer:Peer, pos: Position) -> Bool
}



class CarMediator: Mediator {
    private var peers:[String:Peer]
    
    init() {
        peers = [String :Peer]()
        
    }
    
    func registerPeer(peer: Peer) {
        self.peers[peer.name] = peer
    }
    
    func unregisterPeer(peer: Peer) {
        self.peers.removeValue(forKey: peer.name)
    }
    
    func changePosition(peer: Peer, pos: Position) -> Bool {
        for storedPeer in peers.values {
            if peer.name != storedPeer.name && storedPeer.checkIsOtherCarsTooClose(position: pos) {
                return true
            }
        }
        return false
    }
    
    
}


class Car: Peer {
    var name:String
    var currentPosition:Position
    var mediator:Mediator
    
    init(name: String, pos: Position, mediator: Mediator) {
        self.name = name
        self.currentPosition = pos
        self.mediator = mediator
        
        mediator.registerPeer(peer: self)
    }
    
    func checkIsOtherCarsTooClose(position: Position) -> Bool {
        return abs(position.x - self.currentPosition.x) < 5
    }
    
    func changePosition(newPosition:Position) {
        self.currentPosition = newPosition
        print("\(name) 移動到了 \(self.currentPosition.x)")
        
        if(mediator.changePosition(peer: self, pos: self.currentPosition)) {
            print("\(name) 太靠近其他車了，慢一點)")
        }
    }
    
}



let mediator:Mediator = CarMediator()

let stoneCar = Car(name: "Stone Car", pos: Position(x:0), mediator: mediator)
let woodCar = Car(name: "Wood Car", pos: Position(x:10), mediator: mediator)
let ironCar = Car(name: "Iron Car", pos: Position(x:20), mediator: mediator)
let waterCar = Car(name: "Water Car", pos: Position(x:30), mediator: mediator)

woodCar.changePosition(newPosition: Position(x: 17))
