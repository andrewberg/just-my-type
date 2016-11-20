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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard;
        let selectedSeason = defaults.integer(forKey: "COLOR_SETTING");
        let selectedTheme = defaults.integer(forKey: "THEME_SETTING");

        ColorSegmentControl.selectedSegmentIndex = selectedSeason;
        ThemeSegmentControl.selectedSegmentIndex = selectedTheme;
        
        self.view.backgroundColor = UIColor.themeChosen();
    }

    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.themeChosen();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var ColorSegmentControl: UISegmentedControl!
    @IBOutlet weak var ThemeSegmentControl: UISegmentedControl!

    @IBAction func DidChangeColorSegmentControl(_ sender: UISegmentedControl) {
        let defaults = UserDefaults.standard;
        defaults.set(sender.selectedSegmentIndex, forKey: "COLOR_SETTING");
    }
    
    @IBAction func DidChangeThemeSegmentControl(_ sender: UISegmentedControl) {
        let defaults = UserDefaults.standard;
        defaults.set(sender.selectedSegmentIndex, forKey: "THEME_SETTING");
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
