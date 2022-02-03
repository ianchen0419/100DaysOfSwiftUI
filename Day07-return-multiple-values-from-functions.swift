import Cocoa

func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

func getUser1() -> [String] {
    ["Taylor", "Swift"]
}
let user1 = getUser1()
print("Name: \(user1[0]) \(user1[1])")

func getUser2() -> [String: String] {
    ["firstName": "Taylor", "lastName": "Swift"]
}
let user2 = getUser2()
print("Name: \(user2["firstName", default: "?"]) \(user2["lastName", default: "?"])")

//tuple
func getUser3() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}
let user3 = getUser3()
print("Name: \(user3.firstName) \(user3.lastName)")

func getUser4() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift") //can omit label name
}
let user4 = getUser4()
print("Name: \(user4.firstName) \(user4.lastName)")

func getUser5() -> (String, String) {  //also can use nameless parameter
    ("Taylor", "Swift")
}
let user5 = getUser5()
print("Name: \(user5.0) \(user5.1)")

let firstName1 = user4.firstName
let lastName1 = user4.lastName

let (firstName2, lastName2) = getUser3() //destructuring
print("Name: \(firstName2) \(lastName2)")

//if you don't need lastName
let (firstName3, _) = getUser3()
print("Name: \(firstName3)")
