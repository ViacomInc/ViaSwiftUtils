//: Playground - noun: a place where people can play

import UIKit
import ViaSwiftUtils

//CGRect
let rect = CGRect(x: 0, y: 0, width: 10, height: 5)
print("aspect ratio: \(rect.aspectRatio)")

let otherRect = CGRect(x: 5, y: -5, width: 20, height: 5)
print("combined: \(rect.linearCombined(with: otherRect, by: 0.5) )")

var mutableNumberList = [1, 2, 3, 4, 5, 6]
mutableNumberList.shuffleInPlace()

let emojis = ["😀", "👀", "😱", "😡", "👀", "😀", "👀", "😱"]
let uniqueEmojis = emojis.unique()

let image = #imageLiteral(resourceName: "puppy").cornersRounded(usingRadius: 100)

//Example type-safe Observer Pattern
enum VideoEvent {
    case started
    case ended
}

struct VideoEventEventReceiver: ObserverType {
    let name: String
    
    func receive(_ event: VideoEvent) {
        print("\(name) received \(event)")
    }
}

struct Player: Observable {
    typealias Event = VideoEvent
    
    //    var observes: [ObserverType] = [] would not work, because ObserverType has an associated type
    var observers: [(Event) -> Void] = []
    
    mutating func register<O: ObserverType>(_ observer: O) where O.Event == Event {
        observers.append({ observer.receive($0) })
    }
    
    func fire(event: VideoEvent) {
        for observer in observers { observer(event) }
    }
}

var player = Player()
let sko = VideoEventEventReceiver(name: "SKO")
var gallup = VideoEventEventReceiver(name: "Gallup")
player.register(sko)
player.register(gallup)
player.fire(event: .started)

Date().year
Date().dayOfWeek

let formatter = DateFormatter()
formatter.dateFormat = "y"
let twelveDays = 12 * TimeInterval.day
let minutes = twelveDays / TimeInterval.minute

let gregorian = Calendar(identifier: .gregorian)
let components = DateComponents(calendar: gregorian,
                                era: 0, year: 44, month: 3, day: 15, hour: 13)
let idesOfMarch = gregorian.date(from: components)!
let weekDay = idesOfMarch.dayOfWeek
let daysSince = idesOfMarch.days(to: Date())

formatter.string(from: idesOfMarch)
formatter.string(from: Date())

formatter.locale = NSLocale(localeIdentifier: "hi_IN") as Locale!

formatter.string(from: idesOfMarch)
formatter.string(from: Date())

var dict1 = ["One": 1, "Two": 2, "Three": 3]
let dict2 = ["Four": 10, "Five": 2, "Six": 3]

dict1.merge(dict2)

print(dict1)

let someString = "10"
let someInt = Int(someString) !? "Couldn't convert \(someString) to int"
