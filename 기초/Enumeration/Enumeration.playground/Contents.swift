import UIKit

enum Aligment {
    case left
    case center
    case right
}

var textAlignment = Aligment.center
textAlignment = .left

if textAlignment == .center {
    print("center")
}

switch textAlignment {
case .left:
    print("left")
case .center:
    print("center")
case .right:
    print("right")
}

"A".caseInsensitiveCompare("a") == .orderedSame
