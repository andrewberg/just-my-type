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
    
    var cur_word: String    // holds current word in the test
    var speed: Int          // integer value for wpm value
    var total_words: Int    // hold total number of words typed
    var next_word: String
    
    /*if let path = Bundle.main.pathForResource("WordList", ofType: "rtf"){
        let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
        arrayOfStrings = data.components(separatedBy: "\n")
        print(arrayOfStrings)*/
   
    var wordArray: [String]
    // test array
    
    init(){
        self.cur_word = ""  // current word in test
        self.next_word = ""
        self.speed = 0      // initialize wpm to 0
        total_words = 0     // initialize total words typed to 0
        
        let path = Bundle.main.path(forResource: "WordList", ofType: "txt")
        let data = try! String(contentsOfFile:path!, encoding: String.Encoding.utf8)
        self.wordArray = data.components(separatedBy: "\n")
        self.cur_word = getRandomWord()
        self.next_word = getRandomWord()
    }
    
    func getCurrentWord() -> String {   // gets word currently being displayed
        return cur_word
    }
    
    func getNextWord() -> String {
        return next_word
    }
    
    func getTotalWords() -> Int {
        return total_words
    }
    
    func makeCurWordNextWord() {
        cur_word = next_word
    }
    
    func getRandomWord() -> String {    // gets a random word from the array to display
        //random number generation from size of the list of words
        let random = wordArray[Int(arc4random_uniform(UInt32(wordArray.count)))]
        next_word = random       // sets the current displayed word to the randomly chosen word from array
        return random           // returns the random word that was chosen
    }
    
    func isCorrect(str: String) -> Bool {
        // true if user types correct word
        // and increments total words completed by 1
        
        if (str == cur_word) {
            total_words += 1
            return true
        }
        
        return false
    }
    
    func resetTotalWords() { // Andrew Berg
        total_words = 0
    }
    
    func calculateWPM(time: Int) -> Double { // Andrew Berg
        let secsInMin = 60 // constant for seconds in a minute
        let WPM = round(100 * Double(getTotalWords())*(Double(time)/Double(secsInMin)))/100
        // calculates WPM rounded to two digits
        return WPM
    }
}





