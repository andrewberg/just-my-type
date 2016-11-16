//
//  MultiplayerMenuViewController.swift
//  JustMyType
//
//  Created by Lauren Koulias on 9/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

class MultiplayerMenuViewController: UIViewController {
    @IBOutlet weak var carRacingButton: RoundedButton!
    @IBOutlet weak var mountianClimbingButton: RoundedButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setButtonColors();
        self.view.backgroundColor = UIColor.themeChosen();
        
        //carRacingButton.backgroundColor = UIColor.appColorSpring3();
        //mountianClimbingButton.backgroundColor = UIColor.appColorSpring2();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setButtonColors();
        self.view.backgroundColor = UIColor.themeChosen();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setButtonColors() {
        carRacingButton.backgroundColor = UIColor.seasonColorThree();
        mountianClimbingButton.backgroundColor = UIColor.seasonColorFour();
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
