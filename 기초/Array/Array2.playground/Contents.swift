import UIKit

var mutableAlphabet = ["A", "B", "C"]
mutableAlphabet.append("E")
mutableAlphabet.append(contentsOf: ["F", "G"])

mutableAlphabet.insert("D",  at: 3)
mutableAlphabet.insert(contentsOf: ["a", "b", "c"], at: 0)

let a = ["A", "B", "C"]
let b = ["a", "b", "c"]

a == b
a != b

a.elementsEqual(b)
a.elementsEqual(b, by: {(lhs, rhs) -> Bool in
                return lhs.caseInsensitiveCompare(rhs) == .orderedSame})


let randomNumbers = [1, 2, 3, 1, 4, 5, 2, 6, 7, 5, 0]

randomNumbers.min()
a.min()

randomNumbers.max()

randomNumbers.contains(1)
let r = randomNumbers.contains(where: { $0.isMultiple(of: 2) })
r

randomNumbers.first{
    $0.isMultiple(of: 2)
}

randomNumbers.firstIndex{
    $0.isMultiple(of: 2)
}

randomNumbers.firstIndex(of: 7)

randomNumbers.firstIndex(of: 5)
randomNumbers.lastIndex(of: 5)

randomNumbers.sorted()
randomNumbers
let sorted = randomNumbers.sorted { $0 > $1 }
sorted

[Int](randomNumbers.sorted().reversed())

var mutableNums = randomNumbers
mutableNums.sort()
mutableNums.reverse()

mutableNums
mutableNums.swapAt(0, 1)

mutableNums.shuffle()
