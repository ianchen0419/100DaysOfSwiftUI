import Cocoa

var beatles = ["John", "Paul", "George", "Ringo"]
var temperatures = [25.3, 28.2, 26.4]
var numbers = [4, 8, 15, 16, 23, 42]

beatles.append("Adrian")
//temperatures.append("Chris") //can't append String to [Double]

let firstBeatle = beatles[0]
let fistNumber = numbers[0]
//let notAllowed = firstBeatle numbers[0] //type safety

var scores = Array<Int>()
//<>: angle brackets, pulp fiction brackets
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

//[String]() equals to Array<String>
var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.remove(at: 2)
print(characters.count)
characters.removeAll()
print(characters.count)

let bondMovies = ["Casing Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Forzen"))

let cities = ["Lodon", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)
