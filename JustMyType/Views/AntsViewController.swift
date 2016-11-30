//
//  AntsViewController.swift
//
//
//  Created by Andre De Greef on 11/28/16.
//
//
import UIKit

class AntsViewController: UIViewController {
    // stuff
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
    @IBOutlet weak var shotClock: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var ant: UIImageView!
    @IBOutlet weak var ant2: UIImageView!
    //@IBOutlet weak var threeTimes: UILabel!
    //@IBOutlet weak var gameAnimation: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.ant.center.x += view.bounds.height
        self.ant2.center.x += view.bounds.height
        
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [], animations: {
            self.ant.center.x -= self.view.bounds.height
            }, completion: nil)
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [], animations: {
            self.ant2.center.x -= self.view.bounds.height
            }, completion: nil)
    }
    
    
    @IBAction func textField(_ sender: Any) {
        if (!clockRunning) {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            // makes a timer that calls timerAction every second
            
            clockRunning = true
            
            // sets clockRunning to true such that it won't call until
            // clockRunning is reset
        }
        
        
        //Andre De Greef
        
        if (userInput.text != "")    //error check input
        {
            let entry = userInput.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

            if (test.isCorrect(str: entry!))    //if correct word move to next
            {
                //animation of ants
                // ant1 gone
                UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    //fade out ant
                    self.ant.alpha = 0.0
                    }, completion: {
                        (finished: Bool) -> Void in
                        // fade in ant
                        self.ant.alpha = 1.0
                        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                            //move ant 2 back
                            self.ant2.transform = CGAffineTransform(translationX: -100, y: 0)
                            //fade in ant
                            }, completion: {
                                (finished: Bool) -> Void in
                        
                        })
                        self.ant2.transform = CGAffineTransform.identity
                })
                score += 1
                scoreLabel.text = String(score)
                test.makeCurWordNextWord() // move next word into cur word
                self.setStyledText()
                userInput.text = ""
                
            }
            else {
                //error
                
            }
        }
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
            // threeTimes.text = "3X Score"
        }
        if (clock < 1) {
            animationTimer.invalidate()
            timer.invalidate() // invalidate timer
            userInput.isEnabled = false // set textfield to in-editable
            view.endEditing(true) // close keyboard
            clockRunning = false // reset clockRunning to false
            Leaderboard.sharedInstance.enterScore(mode: "bb", name: Leaderboard.getUserName(), score: Double(score))
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "antsBack")
        self.view.insertSubview(backgroundImage, at: 0)
        self.setStyledText()
        userInput.addTarget(self, action: #selector(self.textField(_:)), for: UIControlEvents.editingChanged)
        //^ checks if users textfield has changed, if so calls function for action
        timeLabel.text = "30" // set clock value to default clock value
        scoreLabel.text = "0" // set to zero
        shotClock.layer.zPosition = 1
        scoreLabel.layer.zPosition = 2
        timeLabel.layer.zPosition = 2
        //i gameAnimation.layer.zPosition=0
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
}

