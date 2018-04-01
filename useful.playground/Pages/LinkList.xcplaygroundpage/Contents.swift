import Foundation

//1 -> 2 -> 3  [3,2,1]
protocol LinkListable {
    associatedtype Value
    var value: Value { get }
    var reference: Self? { get }
}


class LinkListNode<T> {
    private(set) var value: T
    var reference: LinkListNode?
    init(value: T, reference: LinkListNode? = nil) {
        self.value = value
        self.reference = reference
    }
}



let given = (1...3).map { LinkListNode(value: $0) }
let stringArray = "Terry".map { LinkListNode.init(value: $0) }

for (index, element) in stringArray.enumerated() {
    element.reference = index < given.count - 1 ? stringArray[index + 1] : nil
}

print(stringArray)
let x = stringArray.flatMap {$0}
print(x)

//let given =  (1...3).reduce(into: LinkListNode<Int>(value: 0)) {
//    $0.reference = LinkListNode<Int>(value: $1)
//    }
//}


func listLinked<T>(node: LinkListNode<T>) -> [T]  {
    switch (node.reference) {
    case let element?: return listLinked(node: element) + [node.value]
    case nil         : return [node.value]
    }
}

var terryString = LinkListNode(value: Character("a"))

let given3 = "Terry".reduce(into: terryString) {
    $0.reference = LinkListNode(value: $1)
    $0 = $0.reference!
}


var a = LinkListNode(value: 0)
let given2 = (1...3).reduce(into: a) { (result, elem) in
    result.reference = LinkListNode(value: elem)
    result = result.reference!
}

func listLinked3<T>(node: LinkListNode<T>?) -> [T] {
    var result = [T]()
    listLinked2(node: node, temp: &result)
    return result
}

func listLinked2<T>(node: LinkListNode<T>?, temp: inout [T]) {
    switch node {
    case let element?:
        listLinked2(node: element.reference, temp: &temp)
        temp.append(element.value)
    case nil         : return
    }
}


//let result3 =  a.reference.map(listLinked)
let result3 = listLinked3(node: a.reference)



let result4 = listLinked3(node: terryString.reference )


extension Optional {
    func myMap<U>(_ function: (Wrapped) -> U) -> U?{
        switch self {
        case let element? : return function(element)
        default: return nil
        }
    }
}
//let result4 = [1,2,3].first.myMap(listLinked)




//let result = listLinked(node: given.first)
//let origin = given
//
//let result2 = listLinked3(node: given.first)






