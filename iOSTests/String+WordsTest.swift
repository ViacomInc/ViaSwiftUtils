//
//  String+WordsTest.swift
//  ViaSwiftUtils
//
//  Copyright 2017 Viacom, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

@testable import ViaSwiftUtils
import XCTest

class StringWordsTest: XCTestCase {

    /*
        longestWord()
     */
    func test_longestWordWithSuccessScenario() {
        // Given:
        let source = "This is a test string"
        let longestWordToCompare = "string"

        // When:
        let longestWordCalculated = source.longestWord()

        // Then:
        XCTAssertEqual(longestWordToCompare, longestWordCalculated)
    }

    func test_longestWordWithFailureScenario() {
        // Given:
        let source = "This is a test string"
        let notTheLongestWord = "test"

        // When:
        let longestWordCalculated = source.longestWord()

        // Then:
        XCTAssertNotEqual(notTheLongestWord, longestWordCalculated)
    }

    func test_longestWordWithCommaSuccessScenario() {
        // Given:
        let source = "This is just, a test"
        let longestWordToCompare = "This"

        // When:
        let longestWordCalculated = source.longestWord()

        // Then:
        XCTAssertEqual(longestWordToCompare, longestWordCalculated)
    }

    func test_longestWordWithCommaFailureScenario() {
        // Given:
        let source = "This is just, a test"
        let notTheLongestWord = "just"

        // When:
        let longestWordCalculated = source.longestWord()

        // Then:
        XCTAssertNotEqual(notTheLongestWord, longestWordCalculated)
    }

    /*
        wordCount()
     */

    func test_wordCountWithSuccessScenario() {
        // Given:
        let source = "This is a test string"

        // When:
        let wordCount = source.wordCount()

        // Then:
        XCTAssertEqual(wordCount, 5)
    }

    func test_wordCountWithFailureScenario() {
        // Given:
        let source = "This is a test string"

        // When:
        let wordCount = source.wordCount()

        // Then:
        XCTAssertNotEqual(wordCount, 2)
    }

    func test_wordCountWithCommaSuccessScenario() {
        // Given:
        let source = "This is a test,string"

        // When:
        let wordCount = source.wordCount()

        // Then:
        XCTAssertEqual(wordCount, 5)
    }

    func test_wordCountWithCommaFailureScenario() {
        // Given:
        let source = "This is a test,string"

        // When:
        let wordCount = source.wordCount()

        // Then:
        XCTAssertNotEqual(wordCount, 4)
    }

    /*
        isOneWord()
     */

    func test_isOneWordWithSuccessScenario() {
        // Given:
        let source = "Thisisateststring"

        // When:
        let isOneWord = source.isOneWord()

        // Then:
        XCTAssertTrue(isOneWord)
    }

    func test_isOneWordWithFailureScenario() {
        // Given:
        let source = "This is a test string"

        // When:
        let isOneWord = source.isOneWord()

        // Then:
        XCTAssertFalse(isOneWord)
    }

    func test_isOneWordWithCommaFailureScenario() {
        // Given:
        let source = "This,is,a,test,string"

        // When:
        let isOneWord = source.isOneWord()

        // Then:
        XCTAssertFalse(isOneWord)
    }

    func test_isOneWordWithFailureScenario_Japanese() {
        // Given:
        let source = "あなたはそれを行うべきではありません"

        // When:
        let isOneWord = source.isOneWord()

        // Then:
        XCTAssertFalse(isOneWord)
    }
}
