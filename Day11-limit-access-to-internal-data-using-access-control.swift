import Cocoa

/**
    - `private`: Don't let anything outside the struct use this.
    - `fileprivate`: Don't let anything outside the current file use this.
    - `public`: Let anyone, anywhere use this.
    - `private(set)`: Let anyone read this property while only let my inernal methods write it.
 */

struct BankAccount {
    private var funds = 0 //access control
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)
if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}
//print(account.funds)
//account.funds -= 1000 //without private funds property is exposed externally

//Swift don't neet to init property, because all property is initialized beforehand (all default value is filled)
struct Dog1 {
    var name: String = "Moo" //no need to init
}
let moko1 = Dog1()

struct Dog2 {
    private var name: String = "Moo" //no need to init
}
let moko2 = Dog2()

//Swift NEED to init property, because one of these isn't asssigned value beforehandly
struct Dog3 {
    var name: String //need to init (because of no default value)
}
let moko3 = Dog3(name: "Moko")

//Swift need al init all property except wih private let (because Swift need to init var name, he also need to init others except with private let)
struct Dog4 {
    //private var age: Int = 6 //need to init (because of var name need init)
    private let age: Int = 6 //no need to init (becaues he is private let)
    var name: String //need to init (because of no default value)
}
let moko4 = Dog4(name: "Moko")

struct Dog5 {
    private var age: Int = 6
    var name: String
    init(name: String) {
        self.name = name
    }
}
let moko5 = Dog5(name: "Moko")

//Variadic functions
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(numbers: 1, 2, 3, 4, 5)

