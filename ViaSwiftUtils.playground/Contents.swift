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

let emojis = ["😀", "👀", "😱", "😡", "👀", "😀", "👀", "😱"]
let uniqueEmojis = emojis.unique()

let image = UIImage(named: "puppy")
let roundedCornerImage = image?.cornersRounded(usingRadius: 100)

//Example type-safe Observer Pattern
struct DateEventReceiver: ObserverType {
    let name: String
    
    func receive(event: NSDate) {
        print("\(name) received \(event)")
    }
}

struct DateEventGenerator: Observable {
    typealias Event = NSDate
    
    var observers: [NSDate -> ()] = []
    
    mutating func register<O: ObserverType where O.Event == Event>(observer: O) {
        observers.append({ observer.receive($0) })
    }
    
    func fireEvent(event: NSDate) {
        for observer in observers { observer(event) }
    }
}

var generator = DateEventGenerator()
let receiver1 = DateEventReceiver(name: "adam")
let receiver2 = DateEventReceiver(name: "eve")
generator.register(receiver1)
generator.register(receiver2)
generator.fireEvent(NSDate())

