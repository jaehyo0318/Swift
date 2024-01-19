import UIKit

struct Person {
    var name: String
    var age: Int
    
    func speak() {
        print("Hello")
    }
    
}

let p = Person(name: "Jaehyo", age: 50)
p.name
p.age
p.speak()


class CPerson {
    var name: String = "Karina"
    var age: Int = 25
        
    func speak() {
        print("Hello")
    }
}

let cp = CPerson()
p.name
p.age
p.speak()
