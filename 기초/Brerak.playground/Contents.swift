import UIKit

let num = 2

switch num {
case 1 ... 10:
    print("begin block")
    
    if !num.isMultiple(of: 2) {
        break
    }
    
    print("end block")

default:
    break
}

print("Done")

for index in 1 ... 10 {
    print(index)
    
    if index > 1 {
        break
    }
}


for i in 1 ... 10 {
    print("OUTER LOOP", i)
    
    for j in 1 ... 10{
        print("\tinner loop", j)
        
        if j > 1 {
            break
        }
    }
}
