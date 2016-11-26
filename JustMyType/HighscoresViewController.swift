//
//  HighscoresViewController.swift
//  JustMyType
//
//  Created by Andrew Berg on 11/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

class HighscoresViewController: UIViewController {

    // Andrew Berg
    @IBOutlet weak var leaderboardsButton: RoundedButton!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var highestWPMLabel: UILabel!
    @IBOutlet weak var backgroundLabel: UILabel!
    @IBAction func resetAverage(_ sender: Any) {
        Highscores.sharedInstance.ttResetAverage()
        averageLabel.text = "Average: 0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Andrew Berg
        averageLabel.text = "Average: \(roundTo2(val: Highscores.sharedInstance.ttGetAverage()))"
        highestWPMLabel.text = "Highest WPM: \(roundTo2(val: Highscores.sharedInstance.ttGetHighscore()))"
        
        //Lauren Koulias
        setButtonColors();
        self.view.backgroundColor = UIColor.themeChosen();
        
        backgroundLabel.layer.masksToBounds = true;
        backgroundLabel.layer.cornerRadius = 8.0;
        
        backgroundLabel.backgroundColor = UIColor.appColorSpring3();
        leaderboardsButton.backgroundColor = UIColor.appColorSpring3();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func roundTo2(val: Double) -> Double {
        let result = Double(round(100 * val)/100)
        return result
    }
    
    func setButtonColors() {
        //Lauren Koulias
        leaderboardsButton.backgroundColor = UIColor.seasonColorOne()
    }

}
