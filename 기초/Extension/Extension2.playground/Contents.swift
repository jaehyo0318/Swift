import UIKit

extension Date {
    var year: Int {
        let cal = Calendar.current
        return cal.component(.year, from: self)
    }
}

let today = Date.now
today.year

extension Double {
    var radianValue: Double {
        return (Double.pi * self) / 180.0
    }
    
    var degreeValue: Double {
        return self * 180.0 / Double.pi
    }
}

let dv = 45.0
dv.radianValue.degreeValue

extension Double {
    func toFahrenheit() -> Double {
        return self * 9 / 5 + 32
    }
    
    func toCelsius() -> Double {
        return (self - 32) * 5 / 9
    }
    
    static func convertToFahrenheit(from celsius: Double) -> Double {
        return celsius.toFahrenheit()
    }
}

let c = 30.0
c.toFahrenheit()
Double.convertToFahrenheit(from: c)


extension String {
    static func random(length: Int, charactersIn chars: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") -> String {
        var randomString = String()
        randomString.reserveCapacity(length)
        
        for _ in 0 ..< length {
            guard let char = chars.randomElement()
            else{
                continue
            }
            randomString.append(char)
        }
        
        return randomString
    }
}

String.random(length: 5)
String.random(length: 5, charactersIn: "0123456789")
