import UIKit

var str = "Hello"
str.append(", ")
str

let s = str.appending("Swift")
str
s
// append()은 원본을 바꿈, appending()은 원본을 바꾸지 않고 복사본을 만듦

"File size: ".appendingFormat("%.1f", 12.345)


var str2 = "Hello Swift"
str2.insert(",", at: str2.index(str2.startIndex, offsetBy: 5))

if let s2Index = str2.firstIndex(of: "S") {
    str2.insert(contentsOf: "Awesome ", at: s2Index)
}
print(str2)


