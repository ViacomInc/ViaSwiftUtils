//: Playground - noun: a place where people can play

import UIKit
import ViaSwiftUtils

//CGRect
let rect = CGRect(x: 0, y: 0, width: 10, height: 5)
print("aspect ratio: \(rect.aspectRatio)")

let otherRect = CGRect(x: 5, y: -5, width: 20, height: 5)
print("combined: \(rect.linearCombinedWith(otherRect, by: 0.5) )")

var mutableNumberList = [1,2,3,4,5,6]
mutableNumberList.shuffleInPlace()
