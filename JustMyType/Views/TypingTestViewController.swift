//
//  TypingTestViewController.swift
//  JustMyType
//  Edited by Andrew Berg
//  Also edited by Asa Jenkins and Jorge Gonzalez
//  Created by Lauren Koulias on 9/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

class TypingTestViewController: UIViewController {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var wpmLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var textFieldRef: UITextField!
    @IBOutlet weak var amountOfMinutesStepper: UIStepper!
    @IBOutlet weak var RoundedLabel1: UILabel!
    @IBOutlet weak var RoundedLabel2: UILabel!
    @IBOutlet weak var segmentedMode: UISegmentedControl!
    
    let secsInMin = 60
    var type = TypingTest()
    var leader = Leaderboard()
    var clockRunning = false
    var clockDefault = 60
    var clock = 60
    var timer = Timer()
    
    @IBAction func textFieldAction(_ sender: AnyObject) {
        //linked to users text field
        
        if (!clockRunning) { // runs if clockRunning
            timer.invalidate() // makes sure timer is not running
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true) // makes a timer that calls timerAction every second
            clockRunning = true // sets clockRunning to true such that it won't call until
            // clockRunning is reset
        }
        
        if (textFieldRef.text != "")    //error check for blank text field
        {
            let entry = textFieldRef.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            // Andrew Berg - trims the entry of any white space
            if (type.isCorrect(str: entry!))    //if correct word moves to next word
            {
              updateLabels() //refactored by Andrew
            } else {
                // do nothing
                //print("not correct")
            }
        }
    }
  
    func timerAction() { // by Andrew Berg
        clock -= 1 // decrement clock
        timeLabel.text = String(clock) // set clock value to new clock value
        updateWPMLabel() // update WPM
        if (clock < 1) {
            timer.invalidate() // invalidate timer
            textFieldRef.isEnabled = false // set textfield to in-editable
            view.endEditing(true) // close keyboard
            clockRunning = false // reset clockRunning to false
            leader.enterScore(mode: "tt", name: Leaderboard.getUserName(), score: type.calculateWPM(time: clock, totalSecs: calculateStepperSecs()))
            // uses Leaderboard class to write to the leaderboards when the time is up
            Highscores.sharedInstance.ttUpdateAverage(score: type.calculateWPM(time: clock, totalSecs: calculateStepperSecs())) // update average storage
            Highscores.sharedInstance.ttUpdateHighscore(score: type.calculateWPM(time: clock, totalSecs: calculateStepperSecs()))
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {  // by Andrew Berg
        timer.invalidate() // insures only one timer is running
        clockDefault = Int(amountOfMinutesStepper.value) * secsInMin // casts stepper val to Int then by 60
        clock = clockDefault // sets clock value to the default value
        timeLabel.text = String(clock) // cast clock int to string and add to timeLabel
        clockRunning = false // sets clockRuning back to false
        textFieldRef.isEnabled = true // allows the textField to be editted
        type.resetTotalWords() // resets totalworld on the type object
        wpmLabel.text = "0" // reset WPMLabel to 0
        dismissKeyboard() // closes keyboard
        updateLabels() // calls updatelabels
    }
    
    func updateLabels() {
        type.makeCurWordNextWord() // move next word into cur word
        
        self.setStyledText()
        updateWPMLabel()
        textFieldRef.text = ""                  //clear users text field
    }
    
    func setStyledText() { // Lauren Koulias
        // Set color of first word
        let wordsToDisplay = type.getsWordsToDisplay()
        let wordToColor = type.getCurrentWord()
        let range = (wordsToDisplay as NSString).range(of: wordToColor)
        
        let coloredWordsToDisplay = NSMutableAttributedString.init(string: wordsToDisplay)
        coloredWordsToDisplay.addAttributes(
            [ //NSBackgroundColorAttributeName: UIColor.white,
              NSForegroundColorAttributeName: UIColor.white
            ], range: range)
        wordLabel.attributedText = coloredWordsToDisplay
    }
    
    func updateWPMLabel() { // Andrew Berg
        wpmLabel.text = String(type.calculateWPM(time: clock, totalSecs: calculateStepperSecs())) // calls member method to calc wpm
    }
    
    override func viewDidLoad() {       //verify view is loading
        super.viewDidLoad()
        self.setStyledText() //set starting view label with a random word
        textFieldRef.addTarget(self, action: #selector(self.textFieldAction(_:)), for: UIControlEvents.editingChanged)
        //^ checks if users textfield has changed, if so calls function for action
        timeLabel.text = String(clockDefault) // set clock value to default clock value
        wpmLabel.text = String(type.getTotalWords()) // set to zero because total words is 0
        //^ checks if users textfield has changed, if so calls function for action
        
        //Lauren Koulias
        RoundedLabel1.layer.masksToBounds = true;
        RoundedLabel1.layer.cornerRadius = 8.0;

        RoundedLabel2.layer.masksToBounds = true;
        RoundedLabel2.layer.cornerRadius = 8.0;
        
        self.view.backgroundColor = UIColor.themeChosen();
        self.RoundedLabel1.backgroundColor = UIColor.seasonColorThree();
        self.RoundedLabel2.backgroundColor = UIColor.seasonColorThree();
        
        // Andrew Berg
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TypingTestViewController.dismissKeyboard)) // when screen is tapped it will dismiss keyboard
        view.addGestureRecognizer(tap)

    }
    
    func dismissKeyboard() { // by Andrew Berg
        view.endEditing(true) // close keyboard
    }
    
    func calculateStepperSecs() -> Int { // Andrew Berg returns the amount of secs to run for
        return Int(amountOfMinutesStepper.value) * secsInMin
    }
    
    // Andrew Berg
    @IBAction func stepperChanged(_ sender: Any) {
        dismissKeyboard() // close keyboard
        resetButton(self) // if stepperChanged run the reset function
    }
    
    // Andrew Berg
    @IBAction func modeChanged(_ sender: Any) {
        if (segmentedMode.selectedSegmentIndex == 0) { // word
            type.setup(mode: "word")
            dismissKeyboard() // close keyboard
            resetButton(self) // if stepperChanged run the reset function
        } else if (segmentedMode.selectedSegmentIndex == 1) { // shake
            type.setup(mode: "shake")
            dismissKeyboard() // close keyboard
            resetButton(self) // if stepperChanged run the reset function
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
