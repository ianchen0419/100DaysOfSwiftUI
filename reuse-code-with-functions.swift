import Cocoa

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, buy you")
    print("can also set a custom range if you want.")
}

showWelcome()

let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

let roll = Int.random(in: 1...20) //in: configuration in function
//let roll = Int.random()


func printTimesTables(number: Int, end: Int) { //(number: Int, end: Int): parameters: placeholder
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}
printTimesTables(number: 5, end: 20) //(number: 5, end: 5): arguments: actual value
