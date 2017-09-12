


enum AccountError: Error {
    case nameEmpty
    case passwordEmpty(userName: String)
    case empty
    case exceptError
}
struct User {
    let name: String?
    let password: String?
    
    init(name: String? = nil, password: String? = nil) {
        self.name = name
        
        self.password = password
    }
}

func login(user: User) throws {
    
    switch (user.name, user.password) {
    case (nil, nil):
        throw AccountError.empty
    case (nil, let password?):
        print(password, "name is empty")
        throw AccountError.nameEmpty
    case (let matchedName?, nil):
        print(matchedName, "password is empty")
        throw AccountError.passwordEmpty(userName: matchedName)
    case (let matchedName?, let matchedPassword?):
        print("login success, hello! \(matchedName), your password is: \(matchedPassword)")
    default:
        throw AccountError.exceptError
    }
}

let terry = User(name: "terry", password: "2341")




let emptyUser = User()

do {
    try login(user: User(name: "Terry", password: nil))
} catch AccountError.nameEmpty {
    
} catch AccountError.passwordEmpty(let error) {
    print(error)
}



func log(_ description: () throws -> String) rethrows -> () {
    print(try description())
}

func nonThrowing() -> String {
    return "Hello"
}

enum LogError : Error {
    case someError
}

func throwing() throws -> String {
    // Do stuff....
    throw LogError.someError
}

log(nonThrowing)
try log(throwing)
