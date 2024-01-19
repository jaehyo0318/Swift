import UIKit

struct First {
    let a: Int
    let b: Int
    let c: Int
}

let f = First(a: 1, b: 2, c: 3)

struct Second {
    let a: Int = 0
    let b: Int = 1
    let c: Int
}

let s = Second(c: 3)

struct Third {
    var a: Int = 0
    var b: Int = 1
    var c: Int
}

extension Third {
    init(value: Int) {
        a = value
        b = value
        c = value
    }
}

let t = Third(a: 1, b: 2, c: 3)
