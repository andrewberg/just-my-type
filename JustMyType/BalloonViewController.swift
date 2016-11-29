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
    var gameScore = 0
    
    var color1 = UIColor.seasonColorOne()
    var color2 = UIColor.seasonColorTwo()
    var color3 = UIColor.seasonColorThree()

    @IBOutlet weak var word1: UILabel!
    @IBOutlet weak var word2: UILabel!
    @IBOutlet weak var word3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStyle()
        word1.text = test.getCurrentWord()
        word2.text = test.displayedWords[1]
        word3.text = test.displayedWords[2]
        
        word1.layer.zPosition = 1;
        word2.layer.zPosition = 1;
        word3.layer.zPosition = 1;

        
        input.addTarget(self, action: #selector(self.textField(_:)), for: UIControlEvents.editingChanged)
    }
    
    @IBAction func textField(_ sender: Any) {
        if input.text != "" {
            let entry = input.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            
            if test.isCorrect(str: entry!) {
                gameScore += 5
                score.text = String(gameScore)
                test.makeCurWordNextWord()
                updateStyle()
                input.text = ""
            }
        }
    }
    
    func initStyle() {
        // draws 3 balloons at x,y positions
        
        addBalloon(move: 60, down: 160, color: color1)
        addBalloon(move: 180, down: 160, color: color2)
        addBalloon(move: 310, down: 160, color: color3)
        score.text = String(gameScore)
    }
    
    func updateStyle() {
        let temp = color1
        color1 = color2
        color2 = color3
        color3 = temp
        
        addBalloon(move: 60, down: 160, color: color1)
        addBalloon(move: 180, down: 160, color: color2)
        addBalloon(move: 310, down: 160, color: color3)
        
        word1.text = test.getCurrentWord()
        word2.text = test.displayedWords[1]
        word3.text = test.displayedWords[2]
    }
    
    // adds a single balloon at x,y positions - Asa
    func addBalloon(move: Int, down: Int, color: UIColor) {
        drawBalloon(move: move, down: down, color: color)
    }
    
    
    // draws the balloon - Asa
    func drawBalloon(move: Int, down: Int, color: UIColor) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: move,y: down), radius: CGFloat(45), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let label = CAShapeLayer()
        label.path = circlePath.cgPath
        
        label.fillColor =  color.cgColor
        label.strokeColor = color.cgColor
        label.lineWidth = 0.5
        addHandle(circleLayer: label ,move: move, down: down, color: color) // add handle to label
        view.layer.addSublayer(label)
    }
    
    // draws the handle - Asa
    func addHandle(circleLayer: CAShapeLayer, move: Int, down: Int, color: UIColor){
        let trianglePath = UIBezierPath()
        
        //1 move the (top) point
        trianglePath.move(to: CGPoint(x:move-1,y:down+35))
        
        //2 add point (left)
        trianglePath.addLine(to: CGPoint(x:move+15,y:down+65))
        
        //3 add point (right)
        trianglePath.addLine(to: CGPoint(x:move-15,y:down+65))
        
        let handle = CAShapeLayer()
        
        handle.path = trianglePath.cgPath
        handle.fillColor = color.cgColor
        handle.strokeColor = color.cgColor
        handle.lineWidth = 0.5
        circleLayer.addSublayer(handle)
    }
    
    // returns a random color - Asa
    func randomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
