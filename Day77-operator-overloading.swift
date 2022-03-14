import Foundation

extension Int {
    static func *(lhs: Int, rhs: Double) -> Double {
        return Double(lhs) * rhs
    }
}

extension BinaryInteger {
    static func *(lhs: Self, rhs: Double) -> Double {
        return Double(lhs) * rhs
    }
    
    static func *(lhs: Double, rhs: Self) -> Double {
        return lhs * Double(rhs)
    }
}

let exampleInt: Int64 = 50_000_000_000_000_001
print(exampleInt)

let result = exampleInt * 1.0
print(String(format: "%.0f", result))
