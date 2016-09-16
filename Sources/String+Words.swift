//
//  String+Words.swift
//  ViaSwiftUtils
//
//  Created by Mateusz Fidos on 15.09.2016.
//
//

import Foundation

extension String {

    /// calculates the longest word in the sentence
    ///
    /// - returns: the longest word amongst source string sentence
    func longestWord() -> String {
        let range = startIndex..<endIndex
        var newLongestWord = ""

        self.enumerateSubstrings(in: range, options: .byWords) { (substring, _, _, _) in
            if let word = substring {
                newLongestWord = word.characters.count > newLongestWord.characters.count ? word : newLongestWord
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

        self.enumerateSubstrings(in: range, options: .byWords) { (word, _, _, _) in
            if let _ = word {
                count += 1
            }
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
