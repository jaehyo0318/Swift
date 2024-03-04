import UIKit

struct Size {
    var width = 2.0
    var height = 3.1
}

extension Size {
    var area: Double {
        return width * height
    }
}

extension Size: Equatable {
    public static func == (lhs: Size, rhs: Size) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}
let s = Size()
s.width
s.height
s.area
    
