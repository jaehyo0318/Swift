import UIKit

var str = "Hello, Objective-C"

if let range = str.range(of: "Objective-C") {
    str.replaceSubrange(range, with: "Swift")
}
str

if let range = str.range(of: "Hello") {
    let s = str.replacingCharacters(in: range, with: "Hi")
    
    s
    str
}

var s = str.replacingOccurrences(of: "Swift", with: "Awesome Swift")
s

s = str.replacingOccurrences(of: "swift", with: "Awesome Swift")
s

s = str.replacingOccurrences(of: "swift", with: "Awesome Swift", options: [.caseInsensitive])
s

var str2 = "Hello, Awesome Swift!!!"

let lastCharIndex = str2.index(before: str2.endIndex)

var removed = str2.remove(at: lastCharIndex)
removed
str2

removed = str2.removeFirst()
removed
str2

str2.removeFirst(2)
str2

str2.removeLast()
str2

str2.removeLast(2)
str2

if let range = str2.range(of: "Awesome") {
    str2.removeSubrange(range)
    str2
}

str2.removeAll(keepingCapacity: true)
// keepingCapacity: true => 메모리공간은 지우지 않고 남겨둠


str2 = "Hello, Awesome Swift!!!"

var substr = str2.dropLast()
substr = str2.dropLast(3)
substr = str2.dropFirst()
substr = str2.dropFirst(7)
substr = str2.drop{ $0 != "," }
str2
