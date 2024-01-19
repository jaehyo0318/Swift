import UIKit

for index in 1 ... 10 {
    if index.isMultiple(of: 2) {
        continue
    }
    
    print(index)
}


for i in 1 ... 10 {
    print("OUTER LOOP", i)
    
    for j in 1 ... 10 {
        print("\tinner loop", j)
    }
}
