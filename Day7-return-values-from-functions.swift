import Cocoa

let root = sqrt(169)
print(root)

func rollDice() -> Int {
    Int.random(in: 1...6)
}
let result = rollDice()
print(result)

func areLettersIdentical(str1: String, str2: String) -> Bool {
    str1.sorted() == str2.sorted() //if onln one single code, omit "return" is OK
}

let result2 = areLettersIdentical(str1: "abc", str2: "bac")
print(result2)

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

func sayHello() {
    return //exit immediately
}
