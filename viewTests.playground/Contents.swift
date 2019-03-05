//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    private lazy var authorLabel: UILabel = {
          let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
        label.text = "Chen, Guan-Jhen 2017 Copyright"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    
    private lazy var availableLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
        label.text = "for test"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    
    lazy var stackView: UIStackView = {
        let stackView:  UIStackView = UIStackView(arrangedSubviews: [self.availableLabel, self.authorLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.backgroundColor = .green
        
        let height = stackView.arrangedSubviews.reduce(0) { (result, view) in
        return result + view.frame.height
        }
        print(height)
        stackView.frame = CGRect(x: 150, y: 200, width: 200, height: height)
        return stackView
    }()
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
/*
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        */
        view.addSubview(stackView)
        self.view = view
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


