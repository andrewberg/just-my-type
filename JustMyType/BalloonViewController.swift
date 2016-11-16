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
    label1.layer.cornerRadius = label1.frame.width / 2
    label2.layer.cornerRadius = label2.frame.width / 2
    label3.layer.cornerRadius = label3.frame.width / 2
    
    label1.backgroundColor = UIColor.seasonColorOne()
    label2.backgroundColor = UIColor.seasonColorTwo()
    label3.backgroundColor = UIColor.seasonColorThree()
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
    label1.text = test.getRandomWord()
    label2.text = test.getRandomWord()
    label3.text = test.getRandomWord()
  }
  
  func main() {
    textField.text = ""
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
