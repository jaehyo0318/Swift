import UIKit

func validate(name: String) {
    guard name.count > 6 else {
        print("too short")
        return
    }
    
    guard name.count < 15 else {
        print("too long")
        return
    }
    
    print("Ok")
}

validate(name: "karina")
validate(name: "seojaehyo")
validate(name: "aaaaaaaaaaaaaaaa")

