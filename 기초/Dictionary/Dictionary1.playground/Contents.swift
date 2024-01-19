import UIKit

var dict = ["A": "Apple", "B": "Banana"]
dict = [:]

let dict1 = Dictionary<String, String>()
let dict2 = [String: String]()

dict = [:]
dict = [String: String]()
dict = Dictionary<String, String> ()

let words = ["A": "Apple", "B": "Banana", "C": "City"]
words.count
words.isEmpty

words["A"]
words["Apple"]

let a = words["E"]
let b = words["E", default: "Empty"]

for i in words.keys {
    print(i)
}

for i in words.values {
    print(i)
}

for i in words.keys.sorted() {
    print(i)
}

let keys = Array(words.keys)
let values = Array(words.values)
