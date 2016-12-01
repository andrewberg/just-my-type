//
//  MultiplayerMenuViewController.swift
//  JustMyType
//
//  Created by Lauren Koulias on 9/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

class LeaderboardMenuViewController: UIViewController {

    @IBOutlet weak var typingTestButton: RoundedButton!
    @IBOutlet weak var basketballButton: RoundedButton!
    @IBOutlet weak var carRacingButton: RoundedButton!
    @IBOutlet weak var balloonGame: RoundedButton!
    @IBOutlet weak var antGameButton: RoundedButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Lauren Koulias
        self.setButtonColors();
        self.view.backgroundColor = UIColor.themeChosen();
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Lauren Koulias
        self.setButtonColors();
        self.view.backgroundColor = UIColor.themeChosen();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setButtonColors() {
        //Lauren Koulias
        typingTestButton.backgroundColor = UIColor.seasonColorThree();
        basketballButton.backgroundColor = UIColor.seasonColorFour();
        carRacingButton.backgroundColor = UIColor.seasonColorTwo();
        balloonGame.backgroundColor = UIColor.seasonColorOne();
        antGameButton.backgroundColor = UIColor.seasonColorThree();
        
        carRacingButton.titleLabel?.textColor = UIColor.themeChosen();
        basketballButton.titleLabel?.textColor = UIColor.themeChosen();
        typingTestButton.titleLabel?.textColor = UIColor.themeChosen();
        balloonGame.titleLabel?.textColor = UIColor.themeChosen()
        antGameButton.titleLabel?.textColor = UIColor.themeChosen()
        
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
