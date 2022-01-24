import Cocoa

var quote = "   The truth is rarely pure and never simple   "
let trimmed1 = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmed1)

extension String {
    //only computed propery is allowed for extension property
    //stored property is now allowed for extension property
    
    //if you return a new value instead of replace with that, use -ed or -ing.
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let trimmed2 = quote.trimmed()
print(trimmed2)

//or trim string with a function
//global function
func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}
let trimmed3 = trim(quote)
print(trimmed3)

let lyrics = """
But I keep crusing
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
    //if we use customize init in a struct, swift will lose automatically memberwise init
    //if we use customize init in a extension, swift will not lose automatically memberwise init
//    init(title: String, pageCount: Int) {
//        self.title = title
//        self.pageCount = pageCount
//        self.readingHours = pageCount / 50
//    }
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Load of the Rings", pageCount: 1178, readingHours: 24)
let book2 = Book(title: "book2", pageCount: 100)
