import UIKit

let stock: Int? = nil

let optionalStr: String? =  nil

let a: Int? = nil
var b = a

let c: Optional<Int> = nil

print(b)
b = 123
print(b)
print(type(of: b))

// optional은 unwrapping(추출) 후 사용
//강제 추출
print(b!)
b = nil

if b != nil {
    print(b!)
}

b = 123
let before = b
let after = b!
print(type(of: before))
print(type(of: after))
