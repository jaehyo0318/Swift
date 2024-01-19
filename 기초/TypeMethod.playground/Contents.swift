import UIKit

class Circle {
    static let pi = 3.14
    var radius = 0.0

    func getArea() -> Double {
        return radius * radius * Circle.pi
    }
    
    static func printPi() {
        print(pi)
    }
}

Circle.printPi()
