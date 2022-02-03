import Cocoa

func greetUser() {
    print("Hi there!")
}

greetUser()
var greetCopy = greetUser //when user function copy, don't user parenthese
var greetCopy2: () -> Void = greetUser //open and closed parens
greetCopy()
//types matter, but names don't matter

let sayHello1 = {
    print("Hi there!")
} //closure

sayHello1()

let sayHello = {(name: String) -> String in //in is a mark, marking the end of parameter and return
    "Hi \(name)!"
} //closure with parameter and return
sayHello("Taylor") //notice: paramter name missing!

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989) //when function copy happened, original external parameter will missing
print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captionFirstSorted(name1: String, name2: String) -> Bool { //return true if name1 should come before name2
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

let captainFirstTeam1 = team.sorted(by: captionFirstSorted)
print(captainFirstTeam1)

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeam)

