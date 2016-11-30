//
//  BalloonViewController.swift
//  JustMyType
//
//  Created by Jorge Gonzalez on 11/15/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit
import SpriteKit

class BalloonViewController: UIViewController {
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var score: UILabel!
    
    var test = TypingTest()
    var time = Timer()
    var clock = 30
    var gameOver = false
    var clockRunning = true
    var gameScore = 0
    
    var color1 = UIColor.seasonColorOne()
    var color2 = UIColor.seasonColorTwo()
    var color3 = UIColor.seasonColorThree()
    
    @IBOutlet weak var word1: UILabel!
    @IBOutlet weak var word2: UILabel!
    @IBOutlet weak var word3: UILabel!
    @IBOutlet weak var timer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStyle()
        input.addTarget(self, action: #selector(self.textField(_:)), for: UIControlEvents.editingChanged)
    }
    
    @IBAction func textField(_ sender: Any) {
        if clockRunning && !gameOver {
            time.invalidate()
            time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction),
                                        userInfo: nil, repeats: true)
            clockRunning = false
        }
        
        if input.text != "" {
            let entry = input.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            
            if entry == word1.text {
                gameScore += 5
                score.text = "Score: " + String(gameScore)
                updateStyle(move: 60, down: 160, color: color1, word: word1)
                input.text = ""
            } else if entry == word2.text {
                gameScore += 5
                score.text = "Score: " + String(gameScore)
                updateStyle(move: 185, down: 160, color: color2, word: word2)
                input.text = ""
            } else if entry == word3.text {
                gameScore += 5
                score.text = "Score: " + String(gameScore)
                updateStyle(move: 310, down: 160, color: color3, word: word3)
                input.text = ""
            }
        }
    }
    
    func initStyle() {
        // draws 3 balloons at x,y positions
        word1.text = test.addRandomWordAndGetValue()
        word2.text = test.addRandomWordAndGetValue()
        word3.text = test.addRandomWordAndGetValue()
        
        drawBalloon(move:  60, down: 160, color: color1, word: word1)
        drawBalloon(move: 185, down: 160, color: color2, word: word2)
        drawBalloon(move: 310, down: 160, color: color3, word: word3)
        
        word1.layer.zPosition = 1;
        word2.layer.zPosition = 1;
        word3.layer.zPosition = 1;
        
        score.text = "Score: " + String(gameScore)
        timer.text = "Timer: " + String(clock)
    }
    
    func updateStyle(move: Int, down: Int, color: UIColor, word: UILabel) {
        word.text = test.addRandomWordAndGetValue()
        drawBalloon(move: move, down: down, color: color, word: word)
    }
    
    
    // draws the balloon - Asa Jenkins and Jorge Gonzalez
    func drawBalloon(move: Int, down: Int, color: UIColor, word: UILabel) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: move,y: down), radius: CGFloat(50),
                                      startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let label = CAShapeLayer()
        label.path = circlePath.cgPath
        label.fillColor =  color.cgColor
        label.strokeColor = color.cgColor
        label.lineWidth = 0.5
        
        addHandle(circleLayer: label ,move: move, down: down, color: color) // add handle to label
        view.layer.addSublayer(label)
    }
    
    func timerAction() {
        clock -= 1
        timer.text = "Timer: " + String(clock)
        if (clock == 0) {
            gameOver = true
            time.invalidate()           // invalidate timer
            input.isEnabled = false     // set textfield to in-editable
            view.endEditing(true)       // close keyboard
            clockRunning = false        // reset clockRunning to false
            Leaderboard.sharedInstance.enterScore(mode: "bl", name: Leaderboard.getUserName(), score: Double(gameScore))
        }
    }
    
    func addHandle(circleLayer: CAShapeLayer, move: Int, down: Int, color: UIColor) {
        // Draw the handle - Asa Jenkins and Jorge Gonzalez
        let trianglePath = UIBezierPath()
        
        // 1 move the (top) point
        trianglePath.move(to: CGPoint(x:move-1,y:down+40))
        
        // 2 add point (left)
        trianglePath.addLine(to: CGPoint(x:move+15,y:down+70))
        
        // 3 add point (right)
        trianglePath.addLine(to: CGPoint(x:move-15,y:down+70))
        
        let handle = CAShapeLayer()
        
        handle.path = trianglePath.cgPath
        handle.fillColor = color.cgColor
        handle.strokeColor = color.cgColor
        handle.lineWidth = 0.5
        circleLayer.addSublayer(handle)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
