
import UIKit

class BaseViewController {
    
    var basicProperty: Int {
        return 10
    }
    required init(coder: NSCoder) {
        fatalError()
    }
    
    init() {
//        print(basicProperty)
    }
    
     final func calculator(with x: Int) -> Int {
        return basicProperty
    }
}

class SubViewController : BaseViewController {
    override var basicProperty: Int {
        return 20
    }
  
}


let subViewController = SubViewController()

subViewController.calculator(with: 0)
