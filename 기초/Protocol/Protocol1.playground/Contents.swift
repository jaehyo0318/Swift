import UIKit

protocol Something {
    func doSomething()
}

struct Size: Something {
    func doSomething() {
        
    }
}

protocol SomethingObject: AnyObject, Something {
    
}
// AnyObject를 상속하면 클래스에서만 가능
//struct Value: SomethingObject {
//
//}

class Object: SomethingObject {
    func doSomething() {
        
    }
}
