# ViaSwiftUtils

[![Swift 2.2](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)](https://swift.org/)

Swift Utilities written with and for Viacom Inc.

Examples of helpful methods:

```swift
import ViaSwiftUtils

let elements = [1, 2, 3, 4, 5, 6]
let firstLarger4 = elements.findFirst { $0 > 4 }

var mutableNumberList = [1,2,3,4,5,6]
mutableNumberList.shuffleInPlace() //e.g. [4, 1, 5, 2, 6, 3]

let moreElements = [1, 2, 3, -1, 5, 3, 1, 2, 3, -1]
let uniqueElements = moreElements.unique() // [1, 2, 3, -1, 5]

```


## License

ViaSwiftUtils is available under the MIT license. See the LICENSE file for more info.
