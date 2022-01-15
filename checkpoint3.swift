import Cocoa

//fizzbuzz

//for i in 1...100 {
//    if i % 3 == 0 && i % 5 != 0 {
//        print("Fizz")
//    } else if i % 5 == 0 && i % 3 != 0 {
//        print("Buzz")
//    } else if i % 3 == 0 && i % 5 == 0 {
//        print("FizzBuss")
//    } else {
//        print(i)
//    }
//}

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) && !i.isMultiple(of:53) {
        print("Fizz")
    } else if i.isMultiple(of: 5) && !i.isMultiple(of: 3) {
        print("Buss")
    } else {
        print(i)
    }
}
