//
//  TypingTestLeaderboardViewController.swift
//  JustMyType
//
//  Created by Andrew on 11/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit
// Andrew Berg
class TypingTestLeaderboardViewController: UITableViewController {
    
    var scores:[(name: String, score: Double)] = [] // inits empty score for grabbing

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // grabs from leaderboard
        Leaderboard.sharedInstance.getLeaderboard(mode: "tt")
            {(scores: [(name: String, score: Double)]) -> (Void) in
                self.scores = scores
                self.tableView.reloadData()
        }
    }
    
    // returns proper size for tableivew
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Leaderboard.sharedInstance.ttScores.count
    }
    
    // creates cell for each prototype
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row+1). \(Leaderboard.sharedInstance.ttScores[indexPath.row].name) \(Leaderboard.sharedInstance.ttScores[indexPath.row].score)"
        
        return cell
    }
}
