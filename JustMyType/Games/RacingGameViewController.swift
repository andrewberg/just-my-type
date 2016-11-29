//
//  RacingGameViewController.swift
//  JustMyType
//
//  Created by Lauren Koulias on 11/25/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//


import UIKit
import SpriteKit

class RacingGameViewController: UIViewController {
    @IBOutlet weak var wordToType: UILabel!
    @IBOutlet weak var usersWord: UITextField!
    var type = TypingTest()
    let scene = RacingGame(fileNamed:"RacingGame")
    var gameOver = true
    
    // Lauren Koulias
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Configure the view.
        let skView = self.view as! SKView
        //skView.showsFPS = true
        //skView.showsNodeCount = true
            
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
            
        /* Set the scale mode to scale to fit the window */
        scene?.scaleMode = .aspectFill
        scene?.viewController = self
            
        skView.presentScene(scene)
        
        // Set default word
        self.setStyledText()
        
        usersWord.addTarget(self, action: #selector(self.textFieldAction(_:)), for: UIControlEvents.editingChanged)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
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
        wordToType.attributedText = coloredWordsToDisplay
    }
    
    func updateLabels() {
        type.makeCurWordNextWord() // move next word into cur word
        
        self.setStyledText()
        usersWord.text = ""                  //clear users text field
    }

    // Lauren Koulias
    @IBAction func resetButtonClicked(_ sender: Any) {
        self.gameOver = true
        self.scene?.restartGame()
    }
    
    // Lauren Koulias
    @IBAction func textFieldAction(_ sender: Any) {
        if(self.gameOver) {
            scene?.startGame()
            self.gameOver = false
        }
        
        if (usersWord.text != "") {
            let entry = usersWord.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            // Andrew Berg - trims the entry of any white space
            if (type.isCorrect(str: entry!)) {
                self.scene?.moveCarTwoForward()
                updateLabels()
            }
        }
    }

}

