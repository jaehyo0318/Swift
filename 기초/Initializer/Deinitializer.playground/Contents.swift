import UIKit

class Size {
    var width = 0.0
    var height = 0.0
}

class Position {
    var x = 0.0
    var y = 0.0
}

class Rect {
    var origin = Position()
    var size = Size()
    
    deinit {
        print("deinit \(self)")
    }
}

var r: Rect? = Rect()
r = nil
