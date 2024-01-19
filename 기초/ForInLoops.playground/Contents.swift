import UIKit

for _ in 1 ... 10 {
    print("Swift")
}
// _ => wildcard patter

let power = 10
var result = 1

for _ in 1 ... power {
    result *= 2
}
result

for num in stride(from: 0, to: 10, by: 2) {
    print(num)
}
print("\n")
for num in stride(from: 0, through: 10, by: 2) {
    print(num)
}
