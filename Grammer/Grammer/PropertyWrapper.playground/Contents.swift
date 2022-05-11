import UIKit

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrapperValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}


