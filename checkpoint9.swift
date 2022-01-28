import Cocoa

func randonNumber(_ inputs: [Int]?) -> Int {
    inputs?.randomElement() ?? Int.random(in: 1...100)
}

let test = [1,2,3]
test.randomElement()

randonNumber([5,4,3,2,1])
randonNumber([])
randonNumber(nil)
