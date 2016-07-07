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
enum VideoEvent {
    case Started
    case Ended
}

struct VideoEventEventReceiver: ObserverType {
    let name: String
    
    func receive(event: VideoEvent) {
        print("\(name) received \(event)")
    }
}

struct Player: Observable {
    typealias Event = VideoEvent
    
    //    var observes: [ObserverType] = [] would not work, because ObserverType has an associated type
    var observers: [Event -> ()] = []
    
    mutating func register<O: ObserverType where O.Event == Event>(observer: O) {
        observers.append({ observer.receive($0) })
    }
    
    func fireEvent(event: VideoEvent) {
        for observer in observers { observer(event) }
    }
}

var player = Player()
let sko = VideoEventEventReceiver(name: "SKO")
var gallup = VideoEventEventReceiver(name: "Gallup")
player.register(sko)
player.register(gallup)
player.fireEvent(.Started)

print("weekday: \(NSDate().year)")

