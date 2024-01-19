import UIKit
class Person1 {
    let name: String = "Jeahyo"
    var age: Int = 27
}


struct Person2 {
    let name: String = "Karina"
    var age: Int = 25
}

let p1 = Person1()
p1.name
p1.age
p1.age = 25

let p2 = Person1()
// p2.age = 23 => p2가 상수여서 오류, Person2가 구조체라 그럼

struct Img {
    init() {
        print("new img")
    }
}

struct BlogPost {
    let title: String = "Title"
    let content: String = "Content"
    lazy var attachment: Img = Img()
    
    let date: Date = Date()
    lazy var formattedDate: String = {
       let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .medium
        return f.string(from: date)
    }()
}

var post = BlogPost()
post.attachment
post.date
post.formattedDate
