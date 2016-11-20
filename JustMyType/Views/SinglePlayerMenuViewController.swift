//
//  SinglePlayerMenuViewController.swift
//  JustMyType
//
//  Created by Lauren Koulias on 9/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

class SinglePlayerMenuViewController: UIViewController {

    //Lauren Koulias
    
    @IBOutlet weak var balloonsButton: RoundedButton!
    @IBOutlet weak var somethingButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setButtonColors();
        self.view.backgroundColor = UIColor.themeChosen();

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
        somethingButton.backgroundColor = UIColor.seasonColorOne();
        balloonsButton.backgroundColor = UIColor.seasonColorTwo();
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
