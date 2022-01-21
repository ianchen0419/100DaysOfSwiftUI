import Cocoa

/**
    - `private`: Don't let anything outside the struct use this.
    - `fileprivate`: Don't let anything outside the current file use this.
    - `public`: Let anyone, anywhere use this.
    - `private(set)`: Let anyone read this property while only let my inernal methods write it.
 */

struct BankAccount {
    private(set) var funds = 0 //access control
    
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
print(account.funds)
//account.funds -= 1000 //without private funds property is exposed externally
