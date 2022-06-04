import UIKit

//@propertyWrapper
//struct TwelveOrLess {
//    private var number = 0
//    var wrappedValue: Int {
//        get { return number }
//        set { number = min(newValue, 12) }
//    }
//}
//
//
//struct SmallRectangle {
//    @TwelveOrLess var height: Int
//    @TwelveOrLess var width: Int
//}
//
//var rectangle = SmallRectangle()
//print(rectangle.height)
//// Prints "0"
//
//rectangle.height = 10
//print(rectangle.height)
//// Prints "10"
//
//rectangle.height = 24
//print(rectangle.height)
//// Prints "12"
//
//struct SmallRectangle {
//    private var _height = TwelveOrLess()
//    private var _width = TwelveOrLess()
//    var height: Int {
//        get { return _height.wrappedValue }
//        set { _height.wrappedValue = newValue }
//    }
//    var width: Int {
//        get { return _width.wrappedValue }
//        set { _width.wrappedValue = newValue }
//    }
//}


@propertyWrapper
struct SmallNumber {
    private var number: Int
    private(set) var projectedValue: Bool

    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }

    init() {
        self.number = 0
        self.projectedValue = false
    }
}
struct SomeStructure {
    @SmallNumber var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)
// Prints "false"

print(someStructure.someNumber)
// prints "4"

someStructure.someNumber = 55
print(someStructure.$someNumber)
// Prints "true"

