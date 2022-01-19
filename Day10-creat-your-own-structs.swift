import Cocoa

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) \(year) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int = 14 //if we made an Employee as "let", the property of Employee (name, vacationRemaining, .....) will also become CONSTANT
    //if default vale existing, property can be omit when init
    
    //if func need to write property, using mutating
    //mutating means: only let people call this if it's a variable
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough dats remaining.")
        }
    }
}
var archer3 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

//let archer2 = Employee(name: "Sterling Archer", vacationRemaining: 14)
//archer2.takeVacation(days: 5) //you can't taking mutating function on a constant
//print(archer2.vacationRemaining)

let a = 1
let b = 2.0
let c = Double.init(a) + b
let d = Double(a) + b

//syntax suger: Swift can omit .init
let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)
