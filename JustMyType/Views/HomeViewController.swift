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
        //Lauren Koulias
        self.setButtonColors();
        self.view.backgroundColor = UIColor.themeChosen();

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Lauren Koulias
        self.setButtonColors();
        self.view.backgroundColor = UIColor.themeChosen();
    }
    
    func setButtonColors() {
        //Lauren Koulias
        typingTestButton.backgroundColor = UIColor.seasonColorOne();
        singlePlayerButton.backgroundColor = UIColor.seasonColorTwo();
        multiplayerButton.backgroundColor = UIColor.seasonColorThree();
        settingsButton.backgroundColor = UIColor.seasonColorFour();
    }
    
    func setBackground() {
        
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
