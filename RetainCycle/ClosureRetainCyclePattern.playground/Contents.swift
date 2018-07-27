
//: ## Closure retain cycle pattern
class People {
    var lastName: String
    var firstName: String
    lazy var name: () -> String = {
        // Solution
        // [unowned self] in
        // describing: [capture list] unowned(non-optional) or weak(optional)
        return self.firstName + " " + self.lastName
    }
    init(firstName: String, lastName: String) {
        self.lastName = lastName
        self.firstName = firstName
        print("init People")
    }
    deinit {
        print("deinit People")
    }
}

var people: People? = People(firstName: "Bob", lastName: "Chen")
people?.name()
people = nil
