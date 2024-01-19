import UIKit

protocol Figure {
    static var name: String { get set }
}

struct Rectangle: Figure {
    static var name = "Rect"
}

struct Triangle: Figure {
    static var name = "Triangle"
}

class Circle: Figure {
    class var name: String {
        get{
            return "Circle"
        }
        set {
            
        }
    }
}
