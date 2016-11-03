//
//  TypingTestViewController.swift
//  JustMyType
//  Also edited by Asa Jenkins and Jorge Gonzalez
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
              wordLabel.fadeOut()
              wordLabel.text = type.getRandomWord()   //generate new random word to label
              wordLabel.fadeIn()
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
