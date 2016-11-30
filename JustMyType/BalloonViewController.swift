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

        
        input.addTarget(self, action: #selector(self.textField(_:)), for: UIControlEvents.editingChanged)
    }
    
    @IBAction func textField(_ sender: Any) {
        if input.text != "" {
            let entry = input.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            
            if entry == word1.text{
                gameScore += 5
                score.text = String(gameScore)
                test.makeCurWordNextWord()
                updateStyle()
                input.text = ""
            }else if entry == word2.text{
                gameScore += 5
                score.text = String(gameScore)
                test.makeCurWordNextWord()
                updateStyle()
                input.text = ""
            }else if entry == word3.text{
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
        word1.text = checkWord()
        word2.text = checkWord()
        word3.text = checkWord()

        word1.layer.zPosition = 1;
        word2.layer.zPosition = 1;
        word3.layer.zPosition = 1;
        
        word1.isHidden = true;
        word2.isHidden = true;
        word3.isHidden = true;
        
        addBalloon(move: 60, down: 160, color: color1,word: word1.text!)
        addBalloon(move: 210, down: 160, color: color2, word: word2.text!)
        addBalloon(move: 310, down: 160, color: color3, word: word3.text!)
        score.text = String(gameScore)
    }
    
    // checks if word fits in balloon. - Asa and Michael
    func checkWord() -> String {
        var thing = test.getCurrentWord()
        test.makeCurWordNextWord()
        
        while((thing.characters.count) > 5){
            thing = test.addRandomWordAndGetValue()
        }
        
        return thing
    }
    
    
    func updateStyle() {
        let temp = color1
        color1 = color2
        color2 = color3
        color3 = temp
        
        word1.text = checkWord()
        word2.text = checkWord()
        word3.text = checkWord()
        
        addBalloon(move: 60, down: 160, color: color1, word: word1.text!)
        addBalloon(move: 180, down: 160, color: color2, word: word2.text!)
        addBalloon(move: 310, down: 160, color: color3, word: word3.text!)
        
    }
    
    // adds a single balloon at x,y positions - Asa Jenkins and Jorge Gonzalez
    func addBalloon(move: Int, down: Int, color: UIColor, word: String) {
        drawBalloon(move: move, down: down, color: color, word: word)
    }
    
    
    // draws the balloon - Asa Jenkins and Jorge Gonzalez
    func drawBalloon(move: Int, down: Int, color: UIColor, word: String) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: move,y: down), radius: CGFloat(50), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let label = CAShapeLayer()
        label.path = circlePath.cgPath
        
        label.fillColor =  color.cgColor
        label.strokeColor = color.cgColor
        label.lineWidth = 0.5
        addText(circleLayer: label ,move: move, down: down, word: word)
        addHandle(circleLayer: label ,move: move, down: down, color: color) // add handle to label
        view.layer.addSublayer(label)
    }
    
    // add text to layer - Asa Jenkins and Jorge Gonzalez
    func addText(circleLayer: CAShapeLayer, move: Int, down: Int, word: String){
        let txtLyr = CATextLayer()
        txtLyr.bounds = CGRect(x:0,y: 0,width: 50,height: 25)
        txtLyr.position = CGPoint(x:move,y: down)
        txtLyr.font = UIFont(name: "Baskerville-Bold", size: 20.0)
        txtLyr.fontSize = 16.0
        txtLyr.alignmentMode = kCAAlignmentCenter
        txtLyr.string = word
        txtLyr.isWrapped = true
        txtLyr.shadowColor = UIColor.black.cgColor
        txtLyr.shadowRadius = 2.0
        txtLyr.shadowOffset = CGSize(width:2,height: 2)
        txtLyr.shadowOpacity = 1.0
        circleLayer.addSublayer(txtLyr)
    }
    
    // draws the handle - Asa Jenkins and Jorge Gonzalez
    func addHandle(circleLayer: CAShapeLayer, move: Int, down: Int, color: UIColor){
        let trianglePath = UIBezierPath()
        
        //1 move the (top) point
        trianglePath.move(to: CGPoint(x:move-1,y:down+40))
        
        //2 add point (left)
        trianglePath.addLine(to: CGPoint(x:move+15,y:down+70))
        
        //3 add point (right)
        trianglePath.addLine(to: CGPoint(x:move-15,y:down+70))
        
        let handle = CAShapeLayer()
        
        handle.path = trianglePath.cgPath
        handle.fillColor = color.cgColor
        handle.strokeColor = color.cgColor
        handle.lineWidth = 0.5
        circleLayer.addSublayer(handle)
    }
    
    // returns a random color - Asa Jenkins and Jorge Gonzalez
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
