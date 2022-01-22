import Cocoa

class Animal {
    let legs: Int
    
    func speak() {
        print("speak something...")
    }
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Cat: Animal {
    let isTame: Bool
    
    override func speak(){
        print("meow~~")
    }
    
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Persian: Cat {
    init() {
        super.init(isTame: true)
    }
}

class Lion: Cat {
    init() {
        super.init(isTame: false)
    }
}

class Dog: Animal {
    override func speak() {
        print("barking!!")
    }
    init() {
        super.init(legs: 4)
    }
}

class Corgi: Dog {
    
}

class Poodle: Dog {
    
}


let moko = Animal(legs: 4)
print(moko.legs)
