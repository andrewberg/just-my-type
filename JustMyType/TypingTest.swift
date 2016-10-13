//
//  TypingTest.swift
//  JustMyType
//
//  Created by Andrew on 10/12/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import Foundation

// TypeClass by Andrew and Andre
// string for current word

// getter and setter for the current word

// array of random words
// function to return a group of random words with a given size
// function to check if the current word was typed correctly
// function to advance to the next word
// function to grab a random word from an array
// function to shuffle around the source array and place into a new array

class TypingTest {
    
    var cur_word: String
    var speed: Int
    var total_words: Int
    var wordArray: [String] = ["eggs", "milk", "library", "shoes", "table", "blah", "words"]
    //Possible Linked database for more words

    init(){
        self.cur_word = "" //current word in test
        self.speed = 0
        total_words = 0
    }
    
    func getCurrentWord() -> String {   //gets word
        return cur_word
    }
    
    func getRandomWord() -> String {
        
        //random number generation from size of the list of words
        let random = wordArray[Int(arc4random_uniform(UInt32(wordArray.count)))]
        
        cur_word = random
        return random
    }
    
    
    func isCorrect(str: String) -> Bool {
        //true if user types correct word
        //and adds to total words completed
        
        if (str == cur_word) {
            total_words += 1
            return true
        }
        return false
    }
    
}




