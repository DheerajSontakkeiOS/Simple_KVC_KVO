# Simple_KVC_KVO
KVC allows you to get and set properties using string keys at runtime.

Example:
person.setValue("John", forKey: "name")

Useful for:
# Dynamic model changes
# Serialization
# Mapping JSON or dictionaries
# Interfacing with Objective-C frameworks

🔹 Key-Value Observing (KVO)

KVO allows an object to observe changes to another object's properties.
Example:
observation = person.observe(\.age) { object, change in
    print("Age changed!")
}

Useful for:
# UIKit APIs like UIScrollView, AVPlayer, CALayer, etc.
# Legacy Objective-C code
# Reactive UI updates in UIKit
❗ Why Use @objc class Person: NSObject?
KVO & KVC rely on the Objective-C runtime, not native Swift mechanisms.
To enable them:
✔ NSObject
Provides the underlying KVO/KVC infrastructure.
✔ @objc
Exposes the class and properties to Objective-C runtime.
✔ dynamic
Forces dynamic dispatch (required for KVO notifications).
Final requirement:
@objc class Person: NSObject {
    @objc dynamic var name: String
    @objc dynamic var age: Int
}
