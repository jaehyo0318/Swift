import UIKit

protocol Resettable {
    mutating func reset()
}

protocol Resettable2 {
    static func reset()
}

struct Size: Resettable {
    var width = 0.0
    var height = 0.0
    
    mutating func reset() {
        width = 0.0
        height = 0.0
    }
}

class Size2: Resettable, Resettable2{
    var width = 0.0
    var height = 0.0
    
    func reset() {
        width = 0.0
        height = 0.0
    }
    
    class func reset() {
        
    }
}

