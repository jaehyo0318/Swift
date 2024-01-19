import UIKit

var str = "Helo, Swift String"
var emptyStr = ""
emptyStr = String()

let a = String(true)
let b = String(12)
let c = String(12.34)
let d = String(str)

let hex = String(123, radix: 16)

let repeatStr = String(repeating: "😏", count: 3)

let clap = "\u{1f44f}"

let e = "\(a) \(b)"
let f = a + b
str += "!!"

str.count
str.count != 0
str.isEmpty

str == "Apple"
"apple" != "Apple"

str.lowercased()
str.uppercased()
str.capitalized


for char in "Hello" {
    print(char)
}

let num = "123456789"
num.randomElement()
String(num.shuffled())
