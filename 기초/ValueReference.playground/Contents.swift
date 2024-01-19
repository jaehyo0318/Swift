import UIKit

struct PositionValue {
    var x = 0.0
    var y = 0.0
}

class PositionObject {
    var x = 0.0
    var y = 0.0
}

var v = PositionValue()
var o = PositionObject()

var v2 = v
var o2 = o
v2.x = 12
v2.y = 34

v
v2

o2.x = 1.2
o2.y = 2.3
o
o2
