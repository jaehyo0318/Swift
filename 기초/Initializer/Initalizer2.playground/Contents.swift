import UIKit


class SizeObj {
    var width = 0.0
    var height = 0.0
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    convenience init(value: Double) {
//        width = value
//        height = value
        self.init(width: value, height: value)
    }
}

struct SizeValue {
    var width = 0.0
    var height = 0.0
}

let s = SizeValue()
SizeObj(width: 0.0, height: 0.0)

