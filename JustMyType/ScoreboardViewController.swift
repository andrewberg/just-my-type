//
//  ScoreboardViewController.swift
//  JustMyType
//
//  Created by Richard Nelson and Michael Chung on 10/15/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

class ScoreboardViewController: UIViewController {
    
    
    @IBOutlet var wpmlbl: UILabel!
    @IBOutlet var bestwpmlbl: UILabel!
    
    
    @IBOutlet var tryagain: UIButton!
    @IBOutlet var wordtest: UIButton!
    
    
    var wpm = 0
    var bestwpm = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let bestdefault = UserDefaults.standard
        if(bestdefault.value(forKey: "Best") != nil)
        {
            bestwpm = bestdefault.value(forKey: "Best") as! NSInteger!
        }
        bestwpmlbl.text = NSString(format: "Best Words Per Minute: %i", bestwpm) as String
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tryagainaction(_ sender: AnyObject) {
        wpm = 0
        wpmlbl.text = NSString(format: "Words Per Minute: %i", wpm) as String
        
    }
    
    @IBAction func wordtestaction(_ sender: AnyObject) {
        
        wpm+=1
        wpmlbl.text = NSString(format: "Words Per Minute: %i", wpm) as String
        
        if(wpm > bestwpm)
        {
            bestwpm = wpm
            bestwpmlbl.text = NSString(format: "Best Words Per Minute: %i", bestwpm) as String
        }
        
        let bestdefault = UserDefaults.standard
        bestdefault.setValue(bestwpm, forKey: "Best")
        bestdefault.synchronize()
        
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
