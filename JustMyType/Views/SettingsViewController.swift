//
//  SettingsViewController.swift
//  JustMyType
//
//  Created by Lauren Koulias on 9/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    //Lauren Koulias
    
    @IBOutlet weak var BackgroundLabel: UILabel!
    @IBOutlet weak var BackgroundLabel2: UILabel!
    @IBOutlet weak var ColorSegmentControl: UISegmentedControl!
    @IBOutlet weak var ThemeSegmentControl: UISegmentedControl!
    @IBOutlet weak var MusicLabel: UILabel!
    @IBOutlet weak var SoundsLabel: UILabel!
    @IBOutlet weak var BackgroundMusicToggle: UISwitch!
    @IBOutlet weak var ButtonSoundToggle: UISwitch!
    
    // Andrew Berg
    @IBOutlet weak var UsernameLabel: UILabel!
    var AlertField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard;
        let selectedSeason = defaults.integer(forKey: "COLOR_SETTING");
        let selectedTheme = defaults.integer(forKey: "THEME_SETTING");
        
        ColorSegmentControl.selectedSegmentIndex = selectedSeason;
        ThemeSegmentControl.selectedSegmentIndex = selectedTheme;
        
        self.view.backgroundColor = UIColor.themeChosen();
        
        BackgroundLabel.layer.masksToBounds = true;
        BackgroundLabel.layer.cornerRadius = 8.0;
        
        BackgroundLabel2.layer.masksToBounds = true;
        BackgroundLabel2.layer.cornerRadius = 8.0;
        
        self.setTheme();
        
        // Andrew Berg
        UsernameLabel.text = "Username: \(Leaderboard.getUserName())"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setTheme();
    }
    
    func setTheme() {
        self.view.backgroundColor = UIColor.themeChosen();
        
        self.BackgroundLabel.backgroundColor = UIColor.seasonColorThree()
        self.BackgroundLabel2.backgroundColor = UIColor.seasonColorThree()
        
        self.ColorSegmentControl.tintColor = UIColor.themeChosen();
        self.ThemeSegmentControl.tintColor = UIColor.themeChosen();
        
        self.MusicLabel.textColor = UIColor.themeChosen();
        self.SoundsLabel.textColor = UIColor.themeChosen();
        self.UsernameLabel.textColor = UIColor.themeChosen();
        
        self.BackgroundMusicToggle.thumbTintColor = UIColor.themeChosen();
        self.ButtonSoundToggle.thumbTintColor = UIColor.themeChosen();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DidChangeColorSegmentControl(_ sender: UISegmentedControl) {
        let defaults = UserDefaults.standard;
        defaults.set(sender.selectedSegmentIndex, forKey: "COLOR_SETTING");
        self.setTheme();
    }
    
    @IBAction func DidChangeThemeSegmentControl(_ sender: UISegmentedControl) {
        let defaults = UserDefaults.standard;
        defaults.set(sender.selectedSegmentIndex, forKey: "THEME_SETTING");
        self.setTheme();
    }
    
    
    @IBAction func DidToggleMusic(_ sender: UISwitch) {
        if(sender.isOn) {
            MusicHelper.sharedHelper.resumeBackgroundMusic();
        } else {
            MusicHelper.sharedHelper.pauseBackgroundMusic();
        }
    }
    
    @IBAction func DidToggleSound(_ sender: UISwitch) {
        let defaults = UserDefaults.standard;
        defaults.set(sender.isOn, forKey: "SOUND_ON");
    }
    
    // Andrew Berg
    func ConfigureText(textField: UITextField!) {
        textField.placeholder = "Enter a username"
        AlertField = textField
    }
    
    // Andrew Berg
    func CancelAlert(AlertView: UIAlertAction!) {
        // do nothing
    }
    
    // Andrew Berg
    @IBAction func ChangeUsername(_ sender: Any) {
        let alert = UIAlertController(title: "Username", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: ConfigureText)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: CancelAlert))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler:{ (UIAlertAction) in
            if (self.AlertField.text != "") {
                Leaderboard.setUserName(username: self.AlertField.text!)
                self.UsernameLabel.text = "Username: \(Leaderboard.getUserName())"
            }
        }))
        
        self.present(alert, animated: true, completion: { // completion block
            // nothing
        })
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
