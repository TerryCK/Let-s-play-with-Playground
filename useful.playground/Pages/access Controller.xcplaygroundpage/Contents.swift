struct Terry {
    
    
    
}

protocol SomeProtocol {
    
}

extension SomeProtocol {
    
}
struct Tony:SomeProtocol  {
    
}
extension Terry: SomeProtocol {
    
}


extension SomeProtocol where Self == Terry {
    
}
extension SomeProtocol where Self == Tony {
    
}
