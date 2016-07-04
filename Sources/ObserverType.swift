//
//  ObserverType.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 04/07/16.
//
//

import Foundation

public protocol ObserverType {
    associatedtype Event
    
    func receive(event: Event)
}
