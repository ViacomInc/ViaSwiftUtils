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
        XCTAssertEqual(NSCalendar.currentYear.characters.count, 4, "Expected currentyear to have 4 characters")
    }
    
}
