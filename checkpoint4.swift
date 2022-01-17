import Cocoa

enum myError: Error {
    case tooHigh, tooLow, noRoot
}

func makeRoot(_ number: Int) throws -> Int {
    if number > 10_000 {
        throw myError.tooHigh
    } else if number < 1 {
        throw myError.tooLow
    }
    
    var answer: Int = 0
    var temp = 0
    while answer == 0 {
        if temp * temp == number {
            answer = temp
        }

        if temp > 100 {
            throw myError.noRoot
        }
        temp += 1
    }
    return answer
}

do {
    let result = try makeRoot(100)
    print(result)
} catch {
    print("It's error: \(error)")
}

