import UIKit

class Position {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    convenience init(x: Double) {
        self.init(x: x, y: 0.0)
    }
}

Position(x: 12, y: 2.3)
Position(x: 12)


class Figure {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "unknown")
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Rectangle: Figure {
    var width: Double = 12
    var height: Double = 34
    
//    init(name: String, width: Double, height: Double) {
//        self.width = width
//        self.height = height
//        super.init(name: name)
//    }
//
//    override init(name: String) {
//        width = 0
//        height = 0
//        super.init(name: name)
//    }
    
    init() {
        width = 0.0
        height = 0.0
        super.init(name: "unkown")
    }
    
    required init(name: String) {
        width = 0.0
        height = 0.0
        super.init(name: name)
    }
}


