import Cocoa

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) { //need to know is this an electric vehicle or not
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
    //if a child class doesn't have any custom init, it will inherit parent class's init
}

class Car2: Vehicle {
    let isC: Bool = false
}

let teslaX = Car(isElectric: true, isConvertible: false)
let tX = Car2(isElectric: true)
