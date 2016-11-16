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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Load 3 words from TypingTest
    label1.text = ""
    label2.text = ""
    label3.text = ""
    textField.text = "Pop the balloons!"
  }
  
  @IBAction func click(_ sender: Any) {
    main()
  }
 
  func moveUILabel(label: UILabel) {
    label.frame.origin.y -= 5;
  }
  
  func updateUI() {
    moveUILabel(label: label1)
    moveUILabel(label: label2)
    moveUILabel(label: label3)
  }
  
  func main() {
    textField.text = ""
    
    label1.text = test.getRandomWord()
    label2.text = test.getRandomWord()
    label3.text = test.getRandomWord()
    
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }

}
