import Cocoa

/**
 *  Different between class and struct
 *   - You can make one class build upon functionality in another class.
 *   - Swift won't generate a memberwise initializer for classes. You need either provide custom init() or assign default value for every property.
 *   - If you copy an instance of a classed, both copies share the same data.
 *   - We can add a deinitialzer to run when the final copy is destroyed.
 *   - Constant classed instances can have their variable properties changed.
 */

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10
