import Cocoa

class User {
    var username = "Anonymous"
    
    //deep copy
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1
var user3 = user1.copy()
user3.username = "Taylor"

print(user1.username)
print(user2.username)
print(user3.username)
