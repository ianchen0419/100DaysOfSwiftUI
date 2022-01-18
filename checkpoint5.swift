import Cocoa

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func printLuckyNumbers (_ numbers: [Int]) {
    let oddNumbers = numbers.filter({ (param) -> Bool in
        if (param.isMultiple(of: 2)) {
            return false
        } else {
            return true
        }
    })
    
    let sortedNumbers = oddNumbers.sorted(by: { (param1, param2) -> Bool in
        if(param1 > param2) {
            return false
        } else {
            return true
        }
    })
    
    let finalString = sortedNumbers.map({ (param) -> String in
        return "\(param) is a lucky number"
    })
    print(finalString)
}

func printLuckyNumbers2 (_ numbers: [Int]) {
    let oddNumbers = numbers.filter { !$0.isMultiple(of: 2) }
    
    let sortedNumbers = oddNumbers.sorted { $0 < $1 }
    
    let finalString = sortedNumbers.map { "\($0) is a lucky number" }
    
    print(finalString)
}
printLuckyNumbers2(luckyNumbers)

