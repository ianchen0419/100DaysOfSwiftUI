import Cocoa

func printSquare(of number: Int?) {
    
//    if let number = number {
//        print("\(number) x \(number) is \(number * number)")
//    } else {
//        return
//    }
    
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}

printSquare(of: 123)

var myVar: Int? = 3

if let unwrapped = myVar {
    //Run if myVar has a value inside
    print(unwrapped)
}


//guard let unwrapped = myVar else {
//    //Run if myBar doesn't have a value inside
//    return unwrapped //early return //happy path
//}

/**
 * - Swift requires you tu use `return` if a `guard` check fails.
 * - If the optional you're unwrapping has a value, you can user it after the `guard` code finishes.
 */
