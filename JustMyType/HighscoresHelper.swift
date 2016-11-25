//
//  HighscoresHelper.swift
//  JustMyType
//
//  Created by Andrew on 11/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import Foundation

// Andrew
class Highscores {
    
    // singleton for data for highscores
    static let sharedInstance: Highscores = {
        let instance = Highscores()
        return instance
    }()
    
    init() {
    }

    // updates the average from double
    func ttUpdateAverage(score: Double) {
        let userDefaults = UserDefaults.standard
        var average = userDefaults.double(forKey: "averageWPM")
        var totalGames = userDefaults.integer(forKey: "ttTotalGames")
        
        if (totalGames == 0) { // first game
            average = score
            totalGames = 1
        } else { // multiple games
            var total = average * Double(totalGames) // grab total from stored values
            total += score // add total to scores
            totalGames += 1 // increment totalGames
            average = total/Double(totalGames) // calculates new average
        }
        userDefaults.setValue(average, forKey: "averageWPM") // stores average
        userDefaults.setValue(totalGames, forKey: "ttTotalGames") // stores total games
    }
    
    func ttUpdateHighscore(score: Double) {
        let curHighscore = ttGetHighscore()
        if (score > curHighscore) {
            ttSetHighscore(val: score)
        }
    }
    
    func ttResetAverage() {
        UserDefaults.standard.setValue(0, forKey: "averageWPM")
        UserDefaults.standard.setValue(0, forKey: "ttTotalGames")
    }
    
    func ttGetAverage() -> Double {
        return UserDefaults.standard.double(forKey: "averageWPM")
    }
    
    func ttSetAverage(val: Double) {
        UserDefaults.standard.setValue(val, forKey: "averageWPM")
    }
    
    func ttGetTotalGames() -> Int {
        return UserDefaults.standard.integer(forKey: "ttTotalGames")
    }
    
    func ttTotalResetTotalGames() {
        UserDefaults.standard.setValue(0, forKey: "ttTotalGames")
    }
    
    func ttIncTotalGames() {
        let val = ttGetTotalGames()
        UserDefaults.standard.setValue(val+1, forKey: "ttTotalGames")
    }
    
    func ttGetHighscore() -> Double {
        return UserDefaults.standard.double(forKey: "ttHighScore")
    }
    
    func ttSetHighscore(val: Double) {
        UserDefaults.standard.setValue(val, forKey: "ttHighScore")
    }
    
}
