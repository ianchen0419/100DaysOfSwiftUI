import Cocoa

//try! means this function is safe with no errors. if not, app will crash
//try? optional try, if the function has no errors, it will return optional return type (Bool/Int/...). if not, nill will be return back.
//try? will never let us know the error type

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)") //only care about user string is come back or not
}

//print(try? getUser(id: 23))
do {
    let user = try getUser(id: 23)
    print(user)
} catch {
    print(error)
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)
