//
//  ThreadSafeArray.swift
//  iOS-SPIService
//
//  Created by Kelly Chuang on 30/11/2017.
//

import Foundation

public class ThreadSafeArray<T> : ExpressibleByArrayLiteral {
    
    public required init(arrayLiteral elements: T...) {
        self.array = elements
    }
    public init() {
        self.array = [T]()
    }
    
    fileprivate var array : [T]
    
    private lazy var queue = {
        return DispatchQueue(label: "\(Bundle(for: type(of: self))).\(String(describing: type(of: self)))", attributes: .concurrent)
    }()
    
    fileprivate func sync<T>(execute block: () -> T?) -> T? {
        var result : T?
        queue.sync { result = block() }
        return result
    }
    
    fileprivate func async(execute block: @escaping ()->Swift.Void) {
        queue.async(flags: .barrier, execute: block)
    }
    
    var isEmpty: Bool {
        return sync { array.isEmpty }!
    }
    
    var count: Int {
        return sync { array.count }!
    }
    
    var first: T? {
        return sync { array.first }
    }
    
    var last: T? {
        return sync { array.last }
    }
    
    func forEach(_ body: (T) -> Void) {
        sync { array.forEach(body) }
    }
    
    subscript(index: Int) -> T {
        get {
            return sync { array[index] }!
        }
        set {
            async { self.array[index] = newValue }
        }
    }
    
    func removeFirst() {
        async { self.array.removeFirst() }
    }
    
    func removeLast() {
        async { self.array.removeLast() }
    }
    
    func append(_ element: T) {
        async { self.array.append(element) }
    }
    
    func append(_ elements: [T]) {
        async { self.array += elements }
        
    }
    
    func insert(_ newElement: T, at i: Int) {
        async { self.array.insert(newElement, at: i) }
    }
}

struct ThreadSafeOrderedSet<Element: Hashable> {
    private var set: Set<Element> = []
    
    init() { }
    
    public init(arrayLiteral elements: Element...) {
        self.init()
        self.set = Set(elements)
    }

    
    private let queue: DispatchQueue = DispatchQueue(label: "ThreadSafeOrderedSet", attributes: .concurrent)
}


//SetAlgebra
extension ThreadSafeOrderedSet: SetAlgebra {
    func intersection(_ other: ThreadSafeOrderedSet<Element>) -> ThreadSafeOrderedSet<Element> {
        return self
    }
    
    func symmetricDifference(_ other: ThreadSafeOrderedSet<Element>) -> ThreadSafeOrderedSet<Element> {
         return self
    }
    
    mutating func insert(_ newMember: Element) -> (inserted: Bool, memberAfterInsert: Element) {
         return (inserted: true, memberAfterInsert: newMember)
    }
    
    mutating func remove(_ member: Element) -> Element? {
        return nil
    }
    
    mutating func update(with newMember: Element) -> Element? {
        return nil
    }
    
    mutating func formUnion(_ other: ThreadSafeOrderedSet<Element>) {
        async(object: &self) {
            <#code#>
        }
    }
    
    mutating func formIntersection(_ other: ThreadSafeOrderedSet<Element>) {
        
    }
    
    mutating func formSymmetricDifference(_ other: ThreadSafeOrderedSet<Element>) {
        
    }
    
    
    private  func async(object: inout ThreadSafeOrderedSet, execute block: @escaping ()->Swift.Void) {
        queue.async(flags: .barrier, execute: block)
    }
    
    private func sync<T>(block: () -> T?) -> T {
        var result: T?
        queue.sync { result = block() }
        return result!
    }
    
    func contains(_ member: Element) -> Bool {
        return sync { self.set.contains(member) }
    }
    
    func union(_ other: ThreadSafeOrderedSet<Element>) -> ThreadSafeOrderedSet<Element> {
        return sync { ThreadSafeOrderedSet(self.set.union(other.set)) }
    }
    
//    func intersection(_ other: ThreadSafeOrderedSet<Element>) -> ThreadSafeOrderedSet<Element> {
//        return sync { .init(set: self.set.intersection(other.set)) }
//    }
//
//    func symmetricDifference(_ other: ThreadSafeOrderedSet<Element>) -> ThreadSafeOrderedSet<Element> {
//        return sync { .init(set: self.set.symmetricDifference(other.set)) }
//    }
//
//    @discardableResult
//    func insert(_ newMember: Element) -> (inserted: Bool, memberAfterInsert: Element) {
//        guard set.contains(newMember) else { return (inserted: false, memberAfterInsert: newMember) }
//        async { self.set.insert(newMember) }
//        return (inserted: true, memberAfterInsert: newMember)
//    }
//
//    func remove(_ member: Element) -> Element? {
//        guard set.contains(member) else { return nil }
//        async { self.set.insert(member) }
//        return member
//    }
//
//    func update(with newMember: Element) -> Element? {
//        guard set.contains(newMember) else { return nil }
//        async { self.set.update(with: newMember)  }
//        return newMember
//    }
//
//    func formUnion(_ other: ThreadSafeOrderedSet<Element>) {
//        async { self.set.formUnion(other.set)  }
//    }
//
//    func formIntersection(_ other: ThreadSafeOrderedSet<Element>) {
//        async { self.set.formIntersection(other.set)  }
//    }
//
//    func formSymmetricDifference(_ other: ThreadSafeOrderedSet<Element>) {
//        async { self.set.formSymmetricDifference(other.set)  }
//    }
}



public class ThreadSafeOrderedSeClasst<T> : ThreadSafeArray<T> where T : Hashable {
    
    public required init(arrayLiteral elements: T...) {
        super.init()
        self.array += elements
    }
    
    override func append(_ element: T) {
        async { self.addUnique(element) }
    }
    
    override func append(_ elements: [T]) {
        async {
            elements.forEach { self.addUnique($0) }
        }
    }
    
    override func insert(_ newElement: T, at i: Int) {
        async {  self.insertUnique(newElement, at: i) }
    }
    
    func remove(_ element: T) {
        async {
            self.drop(element)
        }
    }
    
    private func drop(_ element: T) {
        if let index = self.array.index(of: element) {
            self.array.remove(at: index)
        }
    }
    
    private func insertUnique(_ newElement: T, at i: Int) {
        if !array.contains(newElement) {
            array.insert(newElement, at: i)
        }
    }
    
    private func addUnique(_ element: T) {
        if !array.contains(element) {
            array.append(element)
        }
    }
}


var set: Set<Int> = [2,1,3,52,7,10]
let sorted = set.sorted()
set.first
set.insert(4)
