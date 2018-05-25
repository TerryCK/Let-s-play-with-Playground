struct Name {
    let prefix, fullName, prefixName: String
}


extension Name {
    init(prefix: String = "Mr.", fullName: String) {
        let prfixName = "\(prefix) \(fullName)"
        self.init(prefix: prefix, fullName: fullName, prefixName: prfixName)
    }
    
    init(prefix: String = "Mr.", firstName: String, lastName: String) {
        let fullName = "\(firstName) \(lastName)"
        self.init(prefix: prefix, fullName: fullName)
    }
}
let name = Name(firstName: "Steve", lastName: "Jobs")

print(name.prefixName)
