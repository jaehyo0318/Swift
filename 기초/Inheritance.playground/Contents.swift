import UIKit

var greeting = "Hello, playground"


class Figure {
    var name = "Unknown"
    
    init(name: String) {
        self.name = name
    }
        
    func draw() {
        print("draw \(name)")
    }
}

class Circle: Figure {
    var radius = 0.0
    
}

let c = Circle(name: "Circle")
c.radius

c.name
c.draw()

final class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
}

class Square: Rectangle {
    
}
