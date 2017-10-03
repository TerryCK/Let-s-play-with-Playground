import UIKit
import Foundation

// design pattern Delegation

// 1. create an protocol with something you want

// 2.  comform the delegate protocol which can be delegated role and implement the protocol required

// 3. create variable with delegate protocol type.

// 4. get the reference and hook the delegate and be delegated role together.


// two object is independance by protocol as introduction media






// 1. create an protocol with something you want
protocol Delegate {
    func doAnimating()
    
}

class ViewClass: UIView {
    // do not controller logic in this class
    // set delegation point role
    
    var delegate: Delegate?
    // 3. create variable with delegate protocol type.
    
    func doSomethingWithDelegate() {
        guard let delegate = self.delegate else {
            print("delegate is nil")
            return
        }
        
        delegate.doAnimating() // 5. viewClass using viewController class func by delegating
    }
    
    
    
    
    
    
    
}

class ViewController: UIViewController, Delegate {
    //   2.  comform the delegate protocol which can be delegated role
    //   and implement the protocol required
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //         4. get the reference and hook the delegate and be delegated role together.
        let viewClass = ViewClass()
        viewClass.delegate = self
        
        viewClass.doSomethingWithDelegate()
        // call for viewClass delegate func
        
    }
    func doAnimating() {
        print("doing something in controller")
    }
    
}

// start with viewController when launch the app


let viewController = ViewController()

viewController.viewDidLoad()




