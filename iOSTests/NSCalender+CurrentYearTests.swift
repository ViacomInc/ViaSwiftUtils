//
//  NSCalender+CurrentYear.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 12/07/16.
//
//

import XCTest
@testable import ViaSwiftUtils

class NSCalender_CurrentYearTests: XCTestCase {
    
    func test1_CurrentYear() {
        //given the current date
        let currentYear = NSDate().localizedYear
        
        //then
        XCTAssertEqual(currentYear.characters.count, 4, "Expected currentyear to have 4 characters")

        //given the fall of the west roman empire
        let fallOfRome = NSDate(timeIntervalSince1970: -NSTimeInterval.year * (1970 - 476))
        
        //when converting to localized string
        let localizedString = fallOfRome.localizedYear

        print("localizedString: \(localizedString)")
        //then
        XCTAssertEqual(localizedString.characters.count, 3, "Expected year of the fall of west rome to have 3 characters")
    }
    
}
