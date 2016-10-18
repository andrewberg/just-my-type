//
//  TypingTestViewController.swift
//  JustMyType
//
//  Created by Lauren Koulias on 9/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

class TypingTestViewController: UIViewController {
    var type = TypingTest()
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var textFieldRef: UITextField!
    
    @IBAction func textFieldAction(_ sender: AnyObject) {
        //linked to users text field
        
        if (textFieldRef.text != "")    //error check for blank text field
        {
            if (type.isCorrect(str: textFieldRef.text!))    //if correct word moves to next word
            {
                wordLabel.shake()
                wordLabel.text = type.getRandomWord()   //generate new random word to label
                textFieldRef.text = ""                  //clear users text field
                
            } else {
                // do nothing
                print("not correct")
            }
        }
    }
    
    
    override func viewDidLoad() {       //verify view is loading
        super.viewDidLoad()
        wordLabel.text = type.getRandomWord()   //set starting view label with a random word
        
        textFieldRef.addTarget(self, action: #selector(self.textFieldAction(_:)), for: UIControlEvents.editingChanged)
        //^ checks if users textfield has changed, if so calls function for action
        
        self.view.backgroundColor = UIColor.appColorBlue();
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}

extension UIView {
  func shake() {
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    animation.duration = 0.6
    animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
    layer.add(animation, forKey: "shake")
  }
}
