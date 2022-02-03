import Cocoa

//step 1: define possible error
enum PasswordError: Error {
    case short, obvious
}

//step 2: trigger errors by function
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

//step 3: handle error by function
//do {
//    try someRiskyWord()
//} catch {
//    print("Handle errors here")
//}
let string = "12345"
do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

let string2 = "123455"
let result2 = try! checkPassword(string2) //try! means this function is safe with no errors. if not, app will crash
print("Password rating: \(result2)")

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please user a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}


do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

