import Cocoa

/**
 * `self` - The current *value* of a struct.    eg: `55`, `Hello`, `true`
 * `Self` - The current *type* of a struct      eg: `Int`, `String`, `Bool`
 */

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
    
    func read(){
        print(Self.studentCount)
//        print(School.studentCount)
    }
    
    //static means both studentCount and add() belong to the School struct itself, not to an individual instance of s School
}

let holyport = School()
holyport.read()


School.add(student: "Taylor Swift")
print(School.studentCount)
School.studentCount = 10 //can change the property because no let/var variable
print(School.studentCount)

let eton = School()
eton.read()

/**
 * It is impossible to access a non-static property/method from a static property/method. It's not make sense because we don't know the non-static propert/method is refer to which instance?
 * It is possible if access a static property/method from a non-static property/method.
 */

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
    
}

//AppData.version

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "gwehxx24th")
}
//Employee.example
