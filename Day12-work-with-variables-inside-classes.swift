import Cocoa

class User {
    var name = "Paul"
}

let user = User()
user.name = "Taylor" //But let user is a constant...?
print(user.name)

var user2 = User()
user2.name = "Taylor"
user2 = User() //if we use let user2, we can't point it to other reference
print(user2.name)

/*
 * - Constant class with constant property: Signpost that always points to the same user, who always has the same name.
 * - Constant class with variable property: Signpost that always points to the same user, but their name can change.
 * - Variable class with constant property: Signpost that can point to different users, but their names naver change.
 * - Variable class with variable property: Signpost that can point to different users, and those users can also change their names.
 */

struct Animal {
    var name: String = "moko"
}
let dog = Animal()
print(dog.name)
//dog.name = "moo" //Constant struct with variable property can't allow property changed
var number = 5
number = 6
print(number)
