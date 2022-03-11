import UIKit

// 1. rethrows
enum Failure: Error {
    case badNetwork(message: String)
    case broken
}

func fetchRemote() throws -> String {
    // complicated, failable work here
    throw Failure.badNetwork(message: "Firewall error.")
}

func fetchLocal() -> String {
    // this won't throw
    return "Taylor"
}

func fetchUserData(using closure: () throws -> String) rethrows {
    let userData = try closure()
    print("User data received: \(userData)")
}

fetchUserData(using: fetchLocal)

do {
    try fetchUserData(using: fetchRemote)
} catch Failure.badNetwork(let message) {
    print(message)
} catch {
    print("Fetch error.")
}

// 2. precondition
func average(of scores: [Int]) -> Double {
    precondition(scores.count > 0, "You must provide at least one score.")
    let sum = scores.reduce(0, +)
    return Double(sum) / Double(scores.count)
}

let scores = [100, 80, 90]
let avg = average(of: [])
print(avg)

// 3. StaticString: String typed by hand
let regex1 = try! NSRegularExpression(pattern: "[a-z]at")

extension NSRegularExpression {
    convenience init(_ pattern: StaticString) {
        do {
            try self.init(pattern: "\(pattern)")
        } catch {
            preconditionFailure("Illegal regex: \(pattern).")
        }
        
    }
}

let regex2 = NSRegularExpression("[a-z]at")

// Map
extension Sequence {
    public func myMap<T>(
        _ transform: (Element) throws -> T
    ) rethrows -> [T] {
        var result = [T]()
        
        for item in self {
            result.append(try transform(item))
        }
        
        return result
    }
}

// reserveCapacity
var allLuckyNumbers = [Int]()

func pickLuckyNumbers() {
    let size = allLuckyNumbers.count + 10
    allLuckyNumbers.reserveCapacity(size)
    
    for _ in 1...10 {
        allLuckyNumbers.append(Int.random(in: 0...50))
    }
}

for _ in 1...52 {
    pickLuckyNumbers() // Dont' do this
}

// Sequence
extension Sequence {
    func myAllSatisfy(
        _ predicate: (Element) throws -> Bool
    ) rethrows -> Bool {
        for item in self {
            if try predicate(item) == false {
                return false
            }
        }
        
        return true
    }
}

// composition
let albums = ["Red", "Fearless", "Reputation"]
print(albums.contains("Reputation"))

let phrase = "My favorite album is Reputation"
print(phrase.contains("Reputation"))

let containAny = albums.contains(where: phrase.contains)
print(containAny)

// function composition operator
precedencegroup CompositionPrecedence {
    associativity: left
}

infix operator >>>: CompositionPrecedence

public func >>><T, U, V>(
    f: @escaping (T) -> U,
    g: @escaping (U) -> V
) -> ((T) -> V) {
    return { g(f($0)) }
}

func generateRandomNumber(max: Int) -> Int {
    let number = Int.random(in: 0...max)
    print("Using number: \(number)")
    return number
}

func calculateFactors(number: Int) -> [Int] {
    return (1...number).filter { number % $0 == 0 }
}

func reduceToString(numbers: [Int]) -> String {
    return numbers.reduce("Factors: ") {
        $0 + String($1) + " "
    }
}

let combined = generateRandomNumber >>> calculateFactors >>> reduceToString
print(combined(100))
