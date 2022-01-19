import Cocoa

struct Employee1 {
    let name: String
    var vacation: Int
}

var archer1 = Employee1(name: "Sterling Archer", vacation: 14)
archer1.vacation -= 5
print(archer1.vacation)
archer1.vacation -= 3
print(archer1.vacation) //lost initial vacation value

struct Employee {
    let name: String
    var vacationAllocated = 14 //stored property
    var vacationTaken = 0
    
    var vacationRemaining2: Int {
        vacationAllocated - vacationTaken
    }
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
        
    } //computed property, calculated directly when we run this code
}

var archer2 = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer2.vacationTaken += 4
print(archer2.vacationRemaining2)
archer2.vacationTaken += 4
print(archer2.vacationRemaining2)

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)
