import UIKit

var greeting = "Hello, playground"


class Figure {
    var name = "Unknown"
    
    init(name: String) {
        self.name = name
    }
        
    final func draw() {
        print("draw \(name)")
    }
}

class Circle: Figure {
    final var radius = 0.0
    
    var diameter: Double {
        return radius * 2
    }
    
//    override func draw() {
//        super.draw()
//        print("🔵")
//    }
}

let c = Circle(name: "Circle")
//c.draw()

class Oval: Circle {
//    override var radius: Double {
//        willSet {
//            print(newValue)
//        }
//        didSet {
//            (oldValue)
//        }
//    }
    
    override var diameter: Double {
        get {
            return super.diameter
        }
        set {
            super.radius = newValue / 2
        }
    }
}

let o = Oval(name: "Oval")
o.radius
o.radius = 5
o.draw()
