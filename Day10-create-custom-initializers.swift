import Cocoa

struct Player1 {
    let name: String
    let number: Int
}

let player1 = Player1(name: "Megan R", number: 15) //memberewise initializer

struct Player2 {
    let name: String
    let number: Int
    
    //specially no func keyword
    init(name: String, number: Int) { //no explicit return type here
        self.name = name
        self.number = number
        //need to init all propertiew
        //and then, run method
    }
}

struct Player {
    let name: String
    let number: Int
    
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)
