import UIKit

class Sample {
    var data = 0
    static var sharedData = 123
    
    func doSomething() {
        print(data)
        
        Sample.sharedData
    }
        
    func call() {
        doSomething()
    }
}

let a  = Sample()
a.data
a.doSomething()
a.call()

struct Size {
    var width = 0.0
    var height = 0.0
    
    mutating func enlarge() {
        width += 1.0
        height += 1.0
    }
}
var s = Size()
s.enlarge()
