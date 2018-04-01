enum Name: Int, CustomStringConvertible {
    case Terry, Tony
    var description: String {
        return "\(self.rawValue)"
    }
}

print(Name.Terry)
