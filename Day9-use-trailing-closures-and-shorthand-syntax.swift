import Cocoa

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let sorted = team.sorted(by: { (a: String, b: String) -> Bool in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    }
    
    return a < b
})
print(sorted)

//omit type
let sorted2 = team.sorted(by: { a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    }
    
    return a < b
})

//trailing closure syntax
let sorted3 = team.sorted { a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    }
    
    return a < b
}

//shorthand syntax
let sorted4 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}

let reverseTeam = team.sorted { $0 > $1 }

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
