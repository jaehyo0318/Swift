import UIKit

var num: Int? = 123

if let n = num {
    print(n)
}

// 상수 이름을 같은걸로하면 생략가능
if let num {
    print(num)
}

var str: String? = "Swift"
guard let str2 = str else {
    str
    fatalError()
}
str2

let a: Int? = 12
let b: String? = "str"

if let a, let b, b.count > 2 {
    print(a, b)
}
