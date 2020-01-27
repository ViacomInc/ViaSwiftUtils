//
//  String+Words.swift
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

import Foundation

public extension String {

    /// calculates the longest word in the sentence
    ///
    /// - returns: the longest word amongst source string sentence
    func longestWord() -> String {
        let range = startIndex..<endIndex
        var newLongestWord = ""

        self.enumerateSubstrings(in: range, options: .byWords) { substring, _, _, _ in
            if let word = substring {
                newLongestWord = word.count > newLongestWord.count ? word : newLongestWord
            }
        }

        return newLongestWord
    }

    /// counts all the words present in source sentence
    ///
    /// - returns: words count in a sentence
    func wordCount() -> Int {
        let range = startIndex..<endIndex
        var count = 0

        self.enumerateSubstrings(in: range, options: .byWords) { word, _, _, _ in
            if word != nil { count += 1 }
        }

        return count
    }

    /// checks if source sentence is a single word
    ///
    /// - returns: boolean value - true if sentence is a one word - false if not
    func isOneWord() -> Bool {
        return wordCount() == 1
    }
}
