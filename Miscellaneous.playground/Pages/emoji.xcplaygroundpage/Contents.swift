enum Language: String {
    case english, chinese
}
let str: [String?] = ["chinese"]
let result = str.compactMap(Language.init)
str.compactMap { (<#String?#>) -> ElementOfResult? in
    <#code#>
}
str.flatMap { (<#String?#>) -> Sequence in
    <#code#>
}

