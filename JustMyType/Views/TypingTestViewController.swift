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
        if (textFieldRef.text != "") {
            if (type.isCorrect(str: textFieldRef.text!)) {
                wordLabel.text = type.getRandomWord()
                textFieldRef.text = ""
                
            } else {
                // do nothing
                print("not correct")
            }
        }
    }
    
    func textFieldDidChange() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordLabel.text = type.getRandomWord()

        textFieldRef.addTarget(self, action: #selector(self.textFieldAction(_:)), for: UIControlEvents.editingChanged)

        self.view.backgroundColor = UIColor.appColorBlue();
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
