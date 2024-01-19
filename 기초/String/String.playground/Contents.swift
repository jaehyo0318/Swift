import UIKit

var str = "12.34KB"

let size = 56.78
str = String(size) + "KB"
str = "\(size)KB"

String(format: "%.5fKB", size)

String(format: "Hello, %@", "karina")
String(format: "%d", 12)
String(format: "%f", 12.34)
String(format: "%.3f", 12.34)
String(format: "%10.3f", 12.34)
String(format: "%010.3f", 12.34)

String(format: "[%d]", 123)
String(format: "[%10d]", 123)
String(format: "[%-10d]", 123)

str = "\\"
print(str)
print("\"Hello\" he said.")

let str2 = """
\"""Hello\""" he said.
"""
print("----------str2-------------")
print(str2)

print(#""Hello"\#n he said."#)
print(###""Hello"\###n he said."###)

let value = 123
print(#"The value is \#(value)"#)

let str3 = #"""
"Hello"
he
said.
"""#
print(str3)
