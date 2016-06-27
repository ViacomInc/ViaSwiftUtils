//
//  Shuffled.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 27/06/16.
//
//

import XCTest
@testable import ViaSwiftUtils

class CollectionShuffledTest: XCTestCase {
    
    func test1() {
        //given a shuffled
        var mutableNumberList = [1, 2, 3, 4, 5, 6]
        let originalNumbers = mutableNumberList
        mutableNumberList.shuffleInPlace()

        //shuffled array should have the same amount of elements
        XCTAssertEqual(originalNumbers.count, mutableNumberList.count, "Expected equal count of shuffled Collection to Original")
    }
    
    
}