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
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var test = TypingTest()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initText()
        initStyle()
    }
    
    @IBAction func click(_ sender: Any) {
        main()
    }
    
    func initText() {
        // Load 3 words from TypingTest
        label1.text = ""
        label2.text = ""
        label3.text = ""
        textField.text = "Pop the balloons!"
    }
    
    func initStyle() {
        // Still trying to figure out how to make these circles
        drawBalloon(label: label1, move: 80, down: 160)
        drawBalloon(label: label2, move: 180, down: 110)
        drawBalloon(label: label3, move: 290, down: 160)
        
    }
    
    // draw the balloon - Asa
    func drawBalloon(label: UILabel, move: Int, down: Int){
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: move,y: down), radius: CGFloat(35), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let trianglePath = UIBezierPath()
        
        //1 move the (top) point
        trianglePath.move(to: CGPoint(x:move,y:down+30))
        
        //2 add point (left)
        trianglePath.addLine(to: CGPoint(x:move+15,y:down+60))
        
        //3 add point (right)
        trianglePath.addLine(to: CGPoint(x:move-15,y:down+60))
        
        let handle = CAShapeLayer()
        handle.path = trianglePath.cgPath
        
        let label = CAShapeLayer()
        label.path = circlePath.cgPath
        
        let color = randomColor().cgColor
        
        //change the fill color
        label.fillColor =  color
        handle.fillColor = color
        //you can change the stroke color
        label.strokeColor = color
        handle.strokeColor = color
        //you can change the line width
        label.lineWidth = 0.5
        handle.lineWidth = 0.5
        
        view.layer.addSublayer(label)
        view.layer.addSublayer(handle)
    }
    
    // returns a random color - Asa
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func moveUILabel(label: UILabel) {
        label.frame.origin.y -= 1;
    }
    
    
    func updateUI() {
        moveUILabel(label: label1)
        moveUILabel(label: label2)
        moveUILabel(label: label3)
    }
    
    func getNewWords() {
        label1.text = test.addRandomWordAndGetValue()
        label2.text = test.addRandomWordAndGetValue()
        label3.text = test.addRandomWordAndGetValue()
    }
    
    func main() {
        textField.text = ""
        initStyle()
        getNewWords()
        //    for _ in 1 ... 14 {
        //      updateUI()
        //    }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
}
