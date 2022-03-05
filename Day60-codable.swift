import Foundation

struct User: Codable {
    var firstName: String
    var lastName: String
}

let str = """
{
    "first_name": "Andrew",
    "last_name": "Glouberman"
}
"""

let data = Data(str.utf8)

do {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let user = try decoder.decode(User.self, from: data)
    print("Hi, I'm \(user.firstName) \(user.lastName)")
} catch {
    print("Whoops: \(error.localizedDescription)")
}

struct User2: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }
    
    var firstName: String
    var lastName: String
}

let str2 = """
{
    "first": "Andrew"
    "last": "Glouberman"
}
"""
let data2 = Data(str2.utf8)

do {
    let decoder = JSONDecoder()
    
    let user = try decoder.decode(User2.self, from: data2)
    print("Hi, I'm \(user.firstName) \(user.lastName)")
} catch {
    print("Whoops: \(error.localizedDescription)")
}
