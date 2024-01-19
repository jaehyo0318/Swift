import UIKit

protocol Figure {
    var name: String { get }
    init(n: String)
}

struct Rectangle: Figure {
    var name: String
    init(n: String) {
        name = n
    }
}
class Circle: Figure {
    var name: String
    required init(n: String) {
        name = n
    }
}

final class Triangle: Figure {
    var name: String
    init(n: String) {
        name = n
    }
}

class Oval: Circle {
    var prop: Int
    init() {
        prop = 0
        super.init(n: "Oval")
    }
    
    required convenience init(n: String) {
        self.init()
    }
}

protocol Grayscale {
    init?(white: Double)
}

struct Color: Grayscale {
    init(white: Double) {

    }
}
