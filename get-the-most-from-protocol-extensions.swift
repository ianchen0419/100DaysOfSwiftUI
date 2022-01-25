import Cocoa

//extension Int {
//    func squared() -> Int {
//        self * self
//    }
//}

extension Numeric {
    func squared() -> Self {
        self * self
    }
}
//self means the current value
//Self means the current type

let wholeNumber = 5
print(wholeNumber.squared())

//struct User: Equatable, Comparable {
struct User: Comparable { //protocol inheritance
    let name: String
    
    //use static so that we dont need to init a user to use func <, we can use it directly
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}

//lhs: left hand side
//func <(lhs: User, rhs: User) -> Bool {
//    lhs.name < rhs.name
//}

let user1 = User(name: "Link")
let user2 = User(name: "Zelda")
print(user1 == user2)
print(user1 != user2)
print(user1 < user2)
print(user1 <= user2)
print(user1 > user2)
print(user1 >= user2)
