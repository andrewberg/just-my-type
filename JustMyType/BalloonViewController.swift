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
  
  var test = TypingTest()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Load 3 words from TypingTest
    label1.text = test.getCurrentWord()
    label2.text = test.getNextWord()
    label3.text = test.getNextNextWord()
    
    

    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }

}
