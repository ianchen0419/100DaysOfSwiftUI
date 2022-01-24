import Cocoa

//Both Int and Bool conform to a protocol called equatable

func getRandomNumber() -> some Equatable { //some specific type equatable
//    Int.random(in: 1...6)
    Double.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

let num = getRandomNumber()

let num2: Int
