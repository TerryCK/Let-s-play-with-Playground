


enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
    
}

class VendingMachine {
    var inventory = [
        "可樂": Item(price: 25, count: 4),
        "洋芋片": Item(price: 35, count: 11),
        "巧克力": Item(price: 20, count: 7)
    ]
    
    
    
    var coninsDeposited = 0
    
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
        
    }
    
    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0  else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coninsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coninsDeposited )
        }
        
        coninsDeposited -= item.price
        item.count -= 1
        
        inventory[name] = item
        dispenseSnack(snack: name)
    }
}

var vendingMachine = VendingMachine()
vendingMachine.coninsDeposited = 36

do {
    try vendingMachine.vend(itemNamed: "洋芋片")
    
} catch VendingMachineError.invalidSelection {
    print("無此商品")
    
} catch VendingMachineError.outOfStock {
    print("商品已賣光")
    
} catch VendingMachineError.insufficientFunds(let conisNeeded) {
    print("金額不足，還差 \(conisNeeded) 個錢幣")
    
}
