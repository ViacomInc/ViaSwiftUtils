# ViaSwiftUtils

[![Swift 4.0.2](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)](https://swift.org/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/ViaSwiftUtils.svg?style=flat)](http://cocoapods.org/pods/ViaSwiftUtils)
[![Platform](https://img.shields.io/cocoapods/p/ViaSwiftUtils.svg?style=flat)](http://cocoapods.org/pods/ViaSwiftUtils)
[![Build Status](https://travis-ci.org/ViacomInc/ViaSwiftUtils.svg?branch=master)](https://travis-ci.org/ViacomInc/ViaSwiftUtils)
[![License](https://img.shields.io/cocoapods/l/ViaSwiftUtils.svg?style=flat)](http://cocoapods.org/pods/ViaSwiftUtils)

What can `ViaSwiftUtils` do for you? Here are some examples we compiled:


Tired of spelling out `NSLocalizedString` every time you localize a string?
```swift
title = "HomePage.title".localized
print(title) // 'Main', '頭版', 'صفحه نخست', 'Startseite'
```

--------

Want to find the longest word in a string?
```swift
print(germanText.longestWord())
// 'Verkehrsinfrastrukturfinanzierungsgesellschaft'
```

--------

Need an array (or any other `MutableCollection`) shuffled? [^3]
```swift
var numbers = [1, 2, 3, 4, 5, 6]
numbers.shuffleInPlace() //e.g. [4, 1, 5, 2, 6, 3]
```

--------

Want all the unique entries in a `Sequence` with `Hashable` elements?
```swift
let emojis = ["😀", "👀", "😱", "😡", "👀", "😀", "👀", "😱"]
let uniqueEmojis = emojis.unique() // ["😀", "👀", "😱", "😡"]
```

--------

Is dealing with `TimeInterval` inconvenient?
```swift
let twelveDays = 12 * TimeInterval.day
let minutes = twelveDays / TimeInterval.minute // 17280
```

--------

Need to create an image with rounded corners from an existing image?

![Rounded image](/Images/puppy.png)

--------

Does one of the views in your app need to rotate?
```swift
someView.startRotating()
// ...
someView.stopRotating()
```

--------

And more date helper methods & variables:
```swift
let components = DateComponents(calendar: gregorian, era: 0,
                                year: 44, month: 3, day: 15, hour: 13)
let idesOfMarch = gregorian.date(from: components)!
let weekDay = idesOfMarch.dayOfWeek // 6
let daysSince = idesOfMarch.days(to: Date()) // 752533
```

&nbsp;

These are just a few examples. We are expanding the library continuously and we accept Pull-Requests ☺️  

&nbsp;


## How to install [ViaSwiftUtils](https://github.com/ViacomInc/ViaSwiftUtils)

&nbsp;

#### Via Cocoapods
Add the following line to your `Podfile`.
Remember you'll need to enable `use_frameworks!`.
```
pod 'ViaSwiftUtils', '1.0.2'
```


#### Via Carthage
Add the following line to your `Cartfile`
```
github "ViacomInc/ViaSwiftUtils" ~> 1.0.2
```

#### Via Swift package manager

Add the following to your `Package.swift` dependencies
```swift
.Package(url: "https://github.com/ViacomInc/ViaSwiftUtils", majorVersion: 1, minor: 0),
```
I should mention that only the `Foundation` functions that are part of `ViaSwiftUtils` work via SPM, as `UIKit` is not available on Linux or MacOS.


#### Importing
After you installed the framework via one of the 3 above methods, import it in your `.swift` file.
```swift
import ViaSwiftUtils
```

&nbsp;


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
