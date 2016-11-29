//
//  BasketballViewController.swift
//  JustMyType
//  Richard Nelson
//  Created by Bradley Close on 11/9/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//
import UIKit

class BasketballViewController: UIViewController {
    var clockRunning = false
    var test = TypingTest()
    var clock = 30
    var score = 0
    var counter = 1
    var animationTimer = Timer()
    var timer = Timer()
    var isAnimating = false
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var threeTimes: UILabel!
    @IBOutlet weak var shotClock: UIImageView!
    @IBOutlet weak var gameAnimation: UIImageView!
    //https://dribbble.com/shots/1256215-Jump-Shot-Animated-GIF?list=popular&offset=0  
    //Basketball gif created by Frasier Davidson
    
    @IBAction func playAgain(_ sender: Any) {
      self.viewDidLoad()
        clock = 30
        counter = 1
        score = 0
    }
    @IBAction func textField(_ sender: Any) {
        if (!clockRunning) { // runs if clockRunning
            timer.invalidate() // makes sure timer is not running
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true) // makes a timer that calls timerAction every second
            clockRunning = true // sets clockRunning to true such that it won't call until
            // clockRunning is reset
        }
        
        if (userInput.text != "")    //error check for blank text field
        {
            let entry = userInput.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            // Andrew Berg - trims the entry of any white space
            if (test.isCorrect(str: entry!))    //if correct word moves to next word
            {
                if isAnimating{
                    animationTimer.invalidate()
                    counter = 0
                    isAnimating = false
                }
                animationTimer = Timer.scheduledTimer(timeInterval: 0.00004, target: self, selector: #selector(animate), userInfo: nil, repeats: true)
                isAnimating = true
                if (clock > 5){
                score += 1
                scoreLabel.text = String(score)
                test.makeCurWordNextWord() // move next word into cur word
                self.setStyledText()
                userInput.text = ""
                }
                else
                {
                    score += 3
                    scoreLabel.text = String(score)
                    test.makeCurWordNextWord() // move next word into cur word
                    self.setStyledText()
                    userInput.text = ""
                }
            }
            else {
                // do nothing
                //print("not correct")
            }
        }
    }
    
    func animate(){
        
        isAnimating = true
        gameAnimation.image = UIImage(named: "frame_\(counter)_delay-0.04s.gif")
        counter += 1
        if counter == 98 {
            counter = 0
            isAnimating = false
            animationTimer.invalidate()
        }
    }
    func updateLabels(){
        test.makeCurWordNextWord()
        self.setStyledText()
        userInput.text = ""
        
    }
    
    func setStyledText() { // Lauren Koulias
        // Set color of first word
        let wordsToDisplay = test.getsWordsToDisplay()
        let wordToColor = test.getCurrentWord()
        let range = (wordsToDisplay as NSString).range(of: wordToColor)
        
        let coloredWordsToDisplay = NSMutableAttributedString.init(string: wordsToDisplay)
        coloredWordsToDisplay.addAttributes(
            [ //NSBackgroundColorAttributeName: UIColor.white,
                NSForegroundColorAttributeName: UIColor.white
            ], range: range)
        wordLabel.attributedText = coloredWordsToDisplay
    }
    func timerAction(){
        clock -= 1
        timeLabel.text = String(clock)
        if(clock < 6)
        {
            threeTimes.text = "3X Score"
        }
        if (clock < 1) {
            animationTimer.invalidate()
            timer.invalidate() // invalidate timer
            userInput.isEnabled = false // set textfield to in-editable
            view.endEditing(true) // close keyboard
            clockRunning = false // reset clockRunning to false
            gameAnimation.image = UIImage(named: "frame_0_delay-0.04s.gif")
            threeTimes.text = ""
            Leaderboard.sharedInstance.enterScore(mode: "bb", name: Leaderboard.getUserName(), score: Double(score))
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInput.isEnabled = true
        userInput.text = ""
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Court")
        self.view.insertSubview(backgroundImage, at: 0)
        self.setStyledText()
        userInput.addTarget(self, action: #selector(self.textField(_:)), for: UIControlEvents.editingChanged)
        //^ checks if users textfield has changed, if so calls function for action
        timeLabel.text = "30" // set clock value to default clock value
        scoreLabel.text = "0" // set to zero 
        shotClock.layer.zPosition = 1
        scoreLabel.layer.zPosition = 2
        timeLabel.layer.zPosition = 2
        gameAnimation.layer.zPosition=0
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
