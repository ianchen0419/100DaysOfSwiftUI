import Cocoa

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

//1...12: range
for i in 1...12 {
    print("The \(i) times table")
    for j in 1...12 {
        print("   \(j) x \(i) is \(j * i)")
    }
}

//1 though 5
for i in 1...5 {
    print("Counting from 1 throung 5: \(i)")
}

//1 up to 5
for i in 1..<5 {
    print("Counting from 1 throung 5: \(i)")
}

var lyric = "Haters gonna"
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)

let names = ["Piper", "Alex", "Suzanne", "Gloria"]
print(names[0])
print(names[1...3])
print(names[1...])
