import Cocoa

let score = 10
let reallyBig = 100000000
let reallyBig2 = 100_000_000
let reallyBig3 = 1_00__00___00____00

print(reallyBig2)
print(reallyBig3)

let lowerScore = score - 2
let higherScore = score + 10
let doubleScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
counter = counter + 5
counter += 5 //compound assignment operators
counter *= 2
counter -= 2
counter /= 2

let number = 120
print(number.isMultiple(of: 3))
print(12.isMultiple(of: 3))
