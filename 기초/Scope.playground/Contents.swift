import UIKit

let g1 = 1
print(g2)
// print(local1) => x

func doSomething() {
    print(g1)
    print(g2)
    
    let local1 = 3
    let g1 = 6
    print(g1)
    // print(local2) => x
    
    if true {
        print(local1)
        // print(local2) => x
        let local3 = 5
    }
    
    let local2 = 4
    // print(local3) => x
    
}
// let g1 = 456 => x
let g2 = 2
print(g1)

struct Scope {
    // print(g1) => x
    var a = g1
    
    
    func doSomething() {
        
    }
}

print("doSomething()")
doSomething()
print("scope", Scope().a)
