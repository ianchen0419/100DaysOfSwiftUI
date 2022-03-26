import Foundation

// filter
let numbers = [1, 2, 3, 4, 5]
var evens = [Int]()

for number in numbers {
    if number.isMultiple(of: 2) {
        evens.append(number)
    }
}

let evens2 = numbers.filter { $0.isMultiple(of: 2) }

// map
let numbers2 = ["1", "2", "fish", "3"]
let evensMap = numbers2.map(Int.init)
let evensCompactMap = numbers2.compactMap(Int.init)

print(evensMap) // [Optional(1), Optional(2), nil, Optional(3)]
print(evensCompactMap) // [1, 2, 3]

// result

// Optional Enum: .nome for nil, .some for associated value
// Result Enum: .success for associated value, .failure for another associated value

// Optional has syntax sugar such as `if let` and optional chaining, while Result doesn't have

enum NetworkError: Error {
    case badURL
}

func createResult() -> Result<String, NetworkError> {
    return .failure(.badURL)
}

let result = createResult() // result initialize for normal function
//print(result)

do {
    let successString = try result.get()
    print(successString)
} catch {
    print("Oops! There was an error")
}

let url = URL(string: "https://www.hackingwithswift.com/")!
let result2 = Result { try String(contentsOf: url) } // result initialize for throwing closure
//print(result2)
//result2 will be Result<String, Error>, without specify Error type

// Result.map(): if success, transform success value into a different kind of value
// Result.mapError(): if failure, transform Error from one type to another
