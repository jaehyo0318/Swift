import UIKit

class Size {
    var width = 0.0
    var height = 0.0
    
    func calcArea() -> Double {
        return width * height
    }
    
    var area: Double {
        return calcArea()
    }
    
    func update(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func doSomething() {
        let c = { self.width * self.height }
    }
    
    static let unit = ""
        
    static func doSomething() {
//        self.height => error
        self.unit
        unit
    }
}

struct Size2 {
    var width = 0.0
    var height = 0.0
    
    mutating func reset(value: Double) {
        self = Size2(width: value, height: value)
    }
}
