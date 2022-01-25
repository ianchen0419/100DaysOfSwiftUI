import Cocoa

//protocol oriented programming, pop
extension Collection {
    var isNotEmpty: Bool {
//        return self.isEmpty == false
//        self.isEmpty == false
        isEmpty == false
    }
}
//Array, Set, Dictionary are confrom to a built-in protocol "Collection"

let guests = ["Mario", "Luigi", "Peach"]

//if guests.isEmpty == false {
//    print("Guest count: \(guests.count)")
//}

//if !guests.isEmpty {
//    print("Guest count: \(guests.count)")
//}

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}
let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()
