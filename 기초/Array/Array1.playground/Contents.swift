import UIKit

let numArray = [1, 2, 3]
let multi = [[1, 2, 3], [4, 5, 6]]

let strArray: Array<String>
let strArray2: [String]

let nums = [1, 2, 3]
let emptyArray: [Int] = []
let emptyArray2 = Array<Int>()
let emptyArray3 = [Int]()

let zeroArray = [Int](repeating: 0, count: 10)

nums.count
nums.count == 0
nums.isEmpty
emptyArray.isEmpty

let fruits = ["Apple", "Banana", "Melon"]
fruits[0]
fruits[2]
fruits[0...1]

fruits[fruits.startIndex]
fruits[fruits.index(before: fruits.endIndex)]

fruits.first
fruits.last

let list = ["A", "B", "C", "D", "E"]
list[0...2]
list[2...]
list[...2]

list.prefix(30)
list.prefix(upTo: 3)
list.prefix(through: 3)

let r = list.prefix { $0 != "C"}

list.suffix(3)
list.suffix(from: 3)
