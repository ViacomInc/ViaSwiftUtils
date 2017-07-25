# ViaSwiftUtils

[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://swift.org/)

Swift Utilities written with and for Viacom Inc.

Examples of helpful methods:

```swift
import ViaSwiftUtils

// Shuffling of collections

var mutableNumberList = [1, 2, 3, 4, 5, 6]
mutableNumberList.shuffleInPlace() //e.g. [4, 1, 5, 2, 6, 3]

// getting unique items from sequences 

let emojis = ["😀", "👀", "😱", "😡", "👀", "😀", "👀", "😱"]
let uniqueEmojis = emojis.unique() // ["😀", "👀", "😱", "😡"]

// convenience optional unwrapping, asserts, i.e. crashes on debug but replaces with default value for production
// from [chapter 'When to Force Unwrap' from Advanced Swift](https://www.objc.io/books/advanced-swift/)

Int(s) !? (5, "Expected Integer")

// UIKit Helpers, like rounding the corners of an image

let image: UIImage = //...
let roundedImage = image.cornersRounded(usingRadius: 5.0)

// or continuously rotating a view

let spinner: UIView = //...

spinner.startRotating()
// ...
spinner.stopRotating()

```

## Installation

### Via Cocoapods

```
pod 'ViaSwiftUtils', '1.0.0'
```


### Via Carthage

Add the following to your `Cartfile`

```
github "vimn-north/ViaSwiftUtils" ~> 1.0.0
```

### Importing

```swift
import ViaSwiftUtils
```


## License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
