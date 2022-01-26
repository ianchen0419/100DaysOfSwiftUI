import Cocoa

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOppisite = opposites["Peach"] //String? type: String or nil

//Any types of data can be optional: String, Bool, Enum, Struct, Double, Class, Array

//Unwrapping way 1: if let
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil
if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
var str2 = ""
var str3: String? = nil

var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil

//Swift didn't introduce optionals. It introduced non-optionals.

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil //number: Int?
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
    //unwrappedNumber: Int
    //unwrappedNumber will only exist in if scope
}

//shadowing
if let number = number {
    print(square(number: number))
    //unwrappedNumber: Int
}

import Cocoa

func findGreatestValuleInList(list: [Int]) -> Int? {
    if list.count == 0 {
        return nil
    }
    
    var greatestValue = -1
    for number in list {
        if number > greatestValue {
            greatestValue = number
        }
//        print(number)
    }
    
    return greatestValue
}
//findGreatestValuleInList(list: [1, 2, 3, 1, 10, 4, 200])
//findGreatestValuleInList(list: [])
//findGreatestValuleInList(list: [-3, -2, -1, 0, 1, 100, 2])
let maxx = [1, 2, 3].max() //Int?


