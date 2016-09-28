//
//  HomeViewController.swift
//  JustMyType
//
//  Created by Lauren Koulias on 9/25/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var settingsButton: RoundedButton!
    @IBOutlet weak var multiplayerButton: RoundedButton!
    @IBOutlet weak var singlePlayerButton: RoundedButton!
    @IBOutlet weak var typingTestButton: RoundedButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        typingTestButton.backgroundColor = UIColor.appColorBlue();
        singlePlayerButton.backgroundColor = UIColor.appColorGreen();
        multiplayerButton.backgroundColor = UIColor.appColorLightBlue();
        settingsButton.backgroundColor = UIColor.appColorPurple();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
