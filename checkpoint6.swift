import Cocoa

struct Car {
    let modal: String
    let seats: Int
    private let gearRange: ClosedRange = 1...10
    var gear: Int = 2
    
    mutating func addGear(_ number: Int) {
        let newGear = gear + number
        if gearRange.contains(newGear) {
            gear = newGear
        } else {
            print("The new gear is invalid.")
        }
    }
    
    mutating func deductGear(_ number: Int) {
        let newGear = gear - number
        if gearRange.contains(newGear) {
            gear = newGear
        } else {
            print("The new gear is invalid.")
        }
    }
}

var int1: Int = -1
print(int1)

var mark = Car(modal: "toyota", seats: 4)
mark.addGear(10)
mark.deductGear(1)
print(mark.gear)
