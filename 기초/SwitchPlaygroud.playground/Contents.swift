import UIKit

let num = 1

switch num {
case 1:
    print("one")
case 2, 3:
    print("two or three")
default:
    break
}

let temperature = Int.random(in: -10 ... 30)

switch temperature {
case ...10:
    print("cold")
case 11...20:
    print("cool")
case 21...27:
    print("warm")
case 28...:
    print("hot")
default:
    break
}

let attempts = 10

switch attempts {
case ...9:
    print("warning")
case 10:
    print("locked")
    fallthrough
default:
    print("send warning email")
}
