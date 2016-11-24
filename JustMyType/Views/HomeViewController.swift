//
//  HomeViewController.swift
//  JustMyType
//
//  Created by Lauren Koulias on 9/25/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit
import AVFoundation


class HomeViewController: UIViewController {
    
    @IBOutlet weak var settingsButton: RoundedButton!
    @IBOutlet weak var multiplayerButton: RoundedButton!
    @IBOutlet weak var singlePlayerButton: RoundedButton!
    @IBOutlet weak var typingTestButton: RoundedButton!
    
    var buttonSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Button", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Lauren Koulias
        self.setButtonColors();
        self.view.backgroundColor = UIColor.themeChosen();
        
        //play backgound music
        MusicHelper.sharedHelper.playBackgroundMusic();
        
        //button clicks
        audioPlayer = try! AVAudioPlayer(contentsOf: buttonSound as URL);
        audioPlayer.prepareToPlay();
        
        Leaderboard.sharedInstance.getLeaderboard()
            {(scores: [(name: String, score: Double)]) -> (Void) in
        }
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
        
        typingTestButton.titleLabel?.textColor = UIColor.themeChosen();
        singlePlayerButton.titleLabel?.textColor = UIColor.themeChosen();
        multiplayerButton.titleLabel?.textColor = UIColor.themeChosen();
        settingsButton.titleLabel?.textColor = UIColor.themeChosen();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TypingTestButtonSound(_ sender: RoundedButton) {
        audioPlayer.play();
    }
    
    @IBAction func SinglePlayerButtonSound(_ sender: RoundedButton) {
        audioPlayer.play();

    }

    @IBAction func MulitplayerButtonSound(_ sender: RoundedButton) {
        audioPlayer.play();

    }

    @IBAction func SettingsButtonSound(_ sender: RoundedButton) {
        audioPlayer.play();

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
