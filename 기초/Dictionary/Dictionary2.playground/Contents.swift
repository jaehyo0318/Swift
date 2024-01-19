import UIKit

var mutableDict = [String: String]()

mutableDict["A"] = "Apple"
mutableDict["B"] = "Banana"

mutableDict.count
mutableDict

mutableDict["B"] = "Ball"

mutableDict.count
mutableDict

mutableDict.updateValue("City", forKey: "C")
mutableDict

mutableDict.updateValue("Circle", forKey: "C")
mutableDict

mutableDict["B"] = nil
mutableDict

mutableDict["Z"] = nil

mutableDict.removeValue(forKey: "A")
mutableDict.removeValue(forKey: "A")

mutableDict.removeAll()


let first = ["A": "Apple", "B": "Banana", "C": "City"]
let second = ["A": "Apple", "C": "City", "B": "Banana"]

first == second


let find: ((key: String, value: String)) -> Bool = {
    $0.key == "B" || $0.value.contains("i")
}


first.contains(where: find)

first.first(where: find)

first.filter(find)
