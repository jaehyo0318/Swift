import UIKit

enum Alignment: Int {
    case left
    case center = 100
    case right
}
// 값을 정해주지 않으면 0부터 1식 증가한 값이 자동저장

Alignment.left.rawValue
Alignment.center.rawValue
Alignment.right.rawValue

Alignment(rawValue: 0)
Alignment(rawValue: 200)

enum Weekday: String {
    case sunday
    case monday = "Mon"
    case tuesday
    case wendnesday
    case thursday
    case friday
    case saturday
}

Weekday.sunday.rawValue
Weekday.monday.rawValue

enum ControlChar: Character {
    case tab = "\t"
    case newLine = "\n"
}
