import Cocoa

//double precision floating point number
let number = 0.1 + 0.2
print(number)

let a = 1
let b = 2.0
//let c = a + b //error
//type safety: can't mix int and double
let c = a + Int(b)
let d = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var name = "Nicolas Cage"
name = "John Travolta"
//name = 57

var rating = 5.0
rating *= 2

//CGFloat - Core Graphics
//Swift can auto change Double and CGFloat
