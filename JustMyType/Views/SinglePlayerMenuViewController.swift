//
//  SinglePlayerMenuViewController.swift
//  JustMyType
//
//  Created by Lauren Koulias on 9/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit
import AVFoundation

class SinglePlayerMenuViewController: UIViewController {

    //Lauren Koulias
    @IBOutlet weak var balloonsButton: RoundedButton!
    @IBOutlet weak var somethingButton: RoundedButton!
    @IBOutlet weak var carRacingButton: RoundedButton!
    @IBOutlet weak var antsButton: RoundedButton!
    
    var buttonSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Button", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setButtonColors();
        self.view.backgroundColor = UIColor.themeChosen();

        //button clicks
        audioPlayer = try! AVAudioPlayer(contentsOf: buttonSound as URL);
        audioPlayer.prepareToPlay();
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
        somethingButton.backgroundColor = UIColor.seasonColorOne();
        balloonsButton.backgroundColor = UIColor.seasonColorTwo();
        carRacingButton.backgroundColor = UIColor.seasonColorThree();
        antsButton.backgroundColor = UIColor.seasonColorFour();
        
        somethingButton.titleLabel?.textColor = UIColor.themeChosen();
        balloonsButton.titleLabel?.textColor = UIColor.themeChosen();
        carRacingButton.titleLabel?.textColor = UIColor.themeChosen();
        antsButton.titleLabel?.textColor = UIColor.themeChosen();

    }

    @IBAction func BalloonsButtonClick(_ sender: RoundedButton) {
        let defaults = UserDefaults.standard
        if (!defaults.bool(forKey: "SOUND_OFF")) {
            audioPlayer.play();
        }
    }
    
    @IBAction func BasketballButtonClick(_ sender: RoundedButton) {
        let defaults = UserDefaults.standard
        if (!defaults.bool(forKey: "SOUND_OFF")) {
            audioPlayer.play();
        }
    }
    
    @IBAction func CarRacingButtonClick(_ sender: RoundedButton) {
        let defaults = UserDefaults.standard
        if (!defaults.bool(forKey: "SOUND_OFF")) {
            audioPlayer.play();
        }
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
