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
    var type = TypingTest()
    var clockRunning = false
    var clockDefault = 60
    var clock = 60
    var timer = Timer()
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var wpmLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var textFieldRef: UITextField!
    
    @IBAction func textFieldAction(_ sender: AnyObject) {
        //linked to users text field
        
        if (!clockRunning) {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            clockRunning = true
        }
        
        if (textFieldRef.text != "")    //error check for blank text field
        {
            if (type.isCorrect(str: textFieldRef.text!))    //if correct word moves to next word
            {
              updateLabels() //refactored by Andrew
            } else {
                // do nothing
                print("not correct")
            }
        }
    }
  
    func timerAction() { // by Andrew Berg
        clock -= 1 // decrement clock
        timeLabel.text = String(clock) // set clock value to new clock value
        if (clock < 1) {
            timer.invalidate() // invalidate timer
            textFieldRef.isEnabled = false // set textfield to in-editable
            view.endEditing(true) // close keyboard
            clockRunning = false // reset clockRunning to false
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {  // by Andrew Berg
        timer.invalidate() // insures only one timer is running
        clock = clockDefault // sets clock value to the default value
        timeLabel.text = String(clock) // cast clock int to string and add to timeLabel
        clockRunning = false // sets clockRuning back to false
        type.resetTotalWords() // resets totalworld on the type object
        updateLabels() // calls updatelabels
    }
    
    func updateLabels() {
        wordLabel.fadeOut()
        type.makeCurWordNextWord() // move next word into cur word
        wordLabel.text = type.getCurrentWord() + " " + type.getRandomWord()   //grab new word for wordlabel
        wpmLabel.text = String(type.getTotalWords()) // update wpmlabel text
        wordLabel.fadeIn()
        textFieldRef.text = ""                  //clear users text field
    }
    
    
    override func viewDidLoad() {       //verify view is loading
        super.viewDidLoad()
        wordLabel.text = type.getCurrentWord() + " " + type.getNextWord() //set starting view label with a random word
        textFieldRef.addTarget(self, action: #selector(self.textFieldAction(_:)), for: UIControlEvents.editingChanged)
        //^ checks if users textfield has changed, if so calls function for action
        timeLabel.text = String(clockDefault) // set clock value to default clock value
        wpmLabel.text = String(type.getTotalWords()) // set to zero because total words is 0
        //^ checks if users textfield has changed, if so calls function for action
        
        self.view.backgroundColor = UIColor.appColorSpring1();
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
