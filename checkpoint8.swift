import Cocoa

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var agent: String { get }
    func summary()
}

extension Building {
    func summary() {
        print("""
            Rooms: \(rooms)
            Cost: \(cost)
            Agent: \(agent)
        """)
    }
}

struct House: Building {
    let rooms: Int
    let cost: Int
    let agent: String
}
let white = House(rooms: 4, cost: 100, agent: "John Smith")
white.summary()

struct Office: Building {
    let rooms: Int
    let cost: Int
    let agent: String
}
let songren = Office(rooms: 20, cost: 200, agent: "Mike Jordan")
songren.summary()

