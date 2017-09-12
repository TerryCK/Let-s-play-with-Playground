class SimpleMath {
    var num = 500
    subscript(times: String) -> Int {
        get {
            print(times)
            return num * 2
        }
        set{
            num *= newValue
        }}
    subscript(divided: Int) -> Int {
        return num / divided
    }
}

let oneMath = SimpleMath()
print(oneMath["sxxx"])
print(oneMath[5])
print(oneMath["23"] = 10)
print(oneMath.num)





