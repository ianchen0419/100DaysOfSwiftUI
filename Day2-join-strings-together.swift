import Cocoa

let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

//operator overloading: "+" can use on Int/Double addition also on string joining

let luggageCode = "1" + "2" + "3" + "4" + "5"
//"12" + "3" + "4" + "5"
//"123" + "4" + "5"
//"1234" + "5"
//"12345"

//string interpolation: better than "+" operator
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old"
print(message)

let number = 11
let missionMessage = "Apollo" + String(number) + "landed on the moon."

print("5 x 5 is \(5 * 5)")
