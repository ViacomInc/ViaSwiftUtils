//
//  String+WordsTest.swift
//  ViaSwiftUtils
//
//  Created by Mateusz Fidos on 15.09.2016.
//
//

import XCTest
@testable import ViaSwiftUtils

class String_WordsTest: XCTestCase {

    /*
        longestWord()
     */
    func test_longestWordWithSuccessScenario() {
        //Given:
        let source = "This is a test string"
        let longestWordToCompare = "string"

        //When:
        let longestWordCalculated = source.longestWord()

        //Then:
        XCTAssertEqual(longestWordToCompare, longestWordCalculated)
    }

    func test_longestWordWithFailureScenario() {
        //Given:
        let source = "This is a test string"
        let notTheLongestWord = "test"

        //When:
        let longestWordCalculated = source.longestWord()

        //Then:
        XCTAssertNotEqual(notTheLongestWord, longestWordCalculated)
    }

    func test_longestWordWithCommaSuccessScenario() {
        //Given:
        let source = "This is just, a test"
        let longestWordToCompare = "This"

        //When:
        let longestWordCalculated = source.longestWord()

        //Then:
        XCTAssertEqual(longestWordToCompare, longestWordCalculated)
    }

    func test_longestWordWithCommaFailureScenario() {
        //Given:
        let source = "This is just, a test"
        let notTheLongestWord = "just"

        //When:
        let longestWordCalculated = source.longestWord()

        //Then:
        XCTAssertNotEqual(notTheLongestWord, longestWordCalculated)
    }

    /*
        wordCount()
     */

    func test_wordCountWithSuccessScenario() {
        //Given:
        let source = "This is a test string"

        //When:
        let wordCount = source.wordCount()

        //Then:
        XCTAssertEqual(wordCount, 5)
    }

    func test_wordCountWithFailureScenario() {
        //Given:
        let source = "This is a test string"

        //When:
        let wordCount = source.wordCount()

        //Then:
        XCTAssertNotEqual(wordCount, 2)
    }

    func test_wordCountWithCommaSuccessScenario() {
        //Given:
        let source = "This is a test,string"

        //When:
        let wordCount = source.wordCount()

        //Then:
        XCTAssertEqual(wordCount, 5)
    }

    func test_wordCountWithCommaFailureScenario() {
        //Given:
        let source = "This is a test,string"

        //When:
        let wordCount = source.wordCount()

        //Then:
        XCTAssertNotEqual(wordCount, 4)
    }

    /*
        isOneWord()
     */

    func test_isOneWordWithSuccessScenario() {
        //Given:
        let source = "Thisisateststring"

        //When:
        let isOneWord = source.isOneWord()

        //Then:
        XCTAssertTrue(isOneWord)
    }

    func test_isOneWordWithFailureScenario() {
        //Given:
        let source = "This is a test string"

        //When:
        let isOneWord = source.isOneWord()

        //Then:
        XCTAssertFalse(isOneWord)
    }

    func test_isOneWordWithCommaFailureScenario() {
        //Given:
        let source = "This,is,a,test,string"

        //When:
        let isOneWord = source.isOneWord()

        //Then:
        XCTAssertFalse(isOneWord)
    }

    func test_isOneWordWithFailureScenario_Japanese() {
        //Given:
        let source = "あなたはそれを行うべきではありません"

        //When:
        let isOneWord = source.isOneWord()

        //Then:
        XCTAssertFalse(isOneWord)
    }
}
