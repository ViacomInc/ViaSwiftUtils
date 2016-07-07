# ViaSwiftUtils

[![Swift 2.2](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)](https://swift.org/)

Swift Utilities written with and for Viacom Inc.

Examples of helpful methods:

```swift
import ViaSwiftUtils

let elements = [1, 2, 3, 4, 5, 6]
let firstLarger4 = elements.findFirst { $0 > 4 }

var mutableNumberList = [1, 2, 3, 4, 5, 6]
mutableNumberList.shuffleInPlace() //e.g. [4, 1, 5, 2, 6, 3]

let emojis = ["😀", "👀", "😱", "😡", "👀", "😀", "👀", "😱"]
let uniqueEmojis = emojis.unique() // ["😀", "👀", "😱", "😡"]

```

## Installation

### Via Cocoapods

```
pod 'ViaSwiftUtils', '0.0.1'
```


### Via Carthage

Add the following to your `Cartfile`

```
github "vimn-north/ViaSwiftUtils" ~> 0.0.1
```

### Importing

```swift
import ViaSwiftUtils
```


## License

ViaSwiftUtils is available under the APACHE 2.0 license. See the LICENSE file for more info.
