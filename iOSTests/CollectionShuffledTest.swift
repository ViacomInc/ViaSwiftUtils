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
    
    func test1_shuffle() {
        //given a shuffled
        var mutableNumberList = [1, 2, 3, 4, 5, 6]
        let originalNumbers = mutableNumberList
        
        //when shuffled
        mutableNumberList.shuffleInPlace()

        //then array should have the same amount of elements
        XCTAssertEqual(originalNumbers.count, mutableNumberList.count,
                       "Expected equal count of shuffled Collection to Original")
    }
    
    func test2_same_elements() {
        //given hundred random arrays
        for _ in 0..<100 {
            let array = (0..<100).map({_ in  return -100 + Int(arc4random()%200) })
            var shuffledArray = array

            //when shuffled
            shuffledArray.shuffleInPlace()

            //then each element should occurs in equally often in both original and shuffled array
            for element in array.unique() {
                XCTAssertEqual(shuffledArray.filter({element == $0}).count, array.filter({element == $0}).count,
                               "Expected the same elements in the shuffled array as in the original")
            }
        }
    }
}
