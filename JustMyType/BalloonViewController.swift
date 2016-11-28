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
        // draws 3 balloons at x,y positions
        addBalloon(move: 80, down: 160)
        addBalloon(move: 180, down: 110)
        addBalloon(move: 290, down: 160)
        
    }
    
    // adds a single balloon at x,y positions - Asa
    func addBalloon(move: Int, down: Int){
        let color = randomColor().cgColor // set balloon colors
        drawBalloon(move: move, down: down, color: color)
    }
    
    // draws the balloon - Asa
    func drawBalloon(move: Int, down: Int, color: CGColor){
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: move,y: down), radius: CGFloat(35), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let label = CAShapeLayer()
        label.path = circlePath.cgPath
        
        label.fillColor =  color
        label.strokeColor = color
        label.lineWidth = 0.5
        addText(circleLayer: label, move: move, down: down) // add text layer to label
        addHandle(circleLayer: label ,move: move, down: down, color: color) // add handle to label
        view.layer.addSublayer(label)
        
    }
    
    // add text to layer - Asa
    func addText(circleLayer: CAShapeLayer, move: Int, down: Int){
        let txtLyr = CATextLayer()
        txtLyr.bounds = CGRect(x:0,y: 0,width: 50,height: 25)
        txtLyr.position = CGPoint(x:move,y: down)
        txtLyr.font = UIFont(name: "Baskerville-Bold", size: 20.0)
        txtLyr.fontSize = 14.0
        txtLyr.alignmentMode = kCAAlignmentCenter
        txtLyr.string = test.addRandomWordAndGetValue()
        txtLyr.isWrapped = true
        txtLyr.shadowColor = UIColor.black.cgColor
        txtLyr.shadowRadius = 2.0
        txtLyr.shadowOffset = CGSize(width:2,height: 2)
        txtLyr.shadowOpacity = 1.0
        circleLayer.addSublayer(txtLyr)
    }
    
    // draws the handle - Asa
    func addHandle(circleLayer: CAShapeLayer, move: Int, down: Int, color: CGColor){
        let trianglePath = UIBezierPath()
        
        //1 move the (top) point
        trianglePath.move(to: CGPoint(x:move-1,y:down+35))
        
        //2 add point (left)
        trianglePath.addLine(to: CGPoint(x:move+15,y:down+40))
        
        //3 add point (right)
        trianglePath.addLine(to: CGPoint(x:move-15,y:down+40))
        
        let handle = CAShapeLayer()
        
        handle.path = trianglePath.cgPath
        handle.fillColor = color
        handle.strokeColor = color
        handle.lineWidth = 0.5
        circleLayer.addSublayer(handle)
        
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
    }
    
    func main() {
        textField.text = ""
        initStyle()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
}
