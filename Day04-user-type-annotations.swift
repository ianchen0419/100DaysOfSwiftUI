import Cocoa

//type annotation vs type inference
let surname: String = "Lasso"
var score: Int = 0

let playerName: String = "Roy"
let luckNumber: Int = 13
let pi: Double = 3.141
let isAuthenticated: Bool = true

var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@ianchen0419"]
var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Girl, Woman, Other",
])

var soda: [String] = ["Cole", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = UIStyle.light
style = .dark

let username: String
//lots of complex logic
username = "@ianchen0419"
//username = "taylerswift13"
//lots of complex logic
print(username)

//let scores: Int = "Zero"

var percentage: Double = 99
print(percentage)
