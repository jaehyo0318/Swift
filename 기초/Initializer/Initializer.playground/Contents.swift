import UIKit

class Position {
    var x: Double
    var y: Double
    
    init() {
        x = 0.0
        y = 0.0
    }
    
    init(value: Double) {
        x = value
        y = value
    }
}

let p1 = Position()
let p2 = Position(value: 1.2)
p1.x
p1.y
p2.x
p2.y

